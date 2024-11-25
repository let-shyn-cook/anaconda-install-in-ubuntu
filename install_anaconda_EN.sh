#!/bin/bash

# Colors for output formatting
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m'

# Check execution permissions
check_permissions() {
    if [ ! -w "$HOME" ]; then
        echo -e "\n${RED}❌ Error: No write permission to home directory${NC}"
        exit 1
    fi
    
    if [ ! -w "$HOME/.bashrc" ]; then
        echo -e "\n${RED}❌ Error: No write permission to .bashrc file${NC}"
        exit 1
    fi
}

check_dependencies() {
    local missing_deps=()
    
    # Check wget
    if ! command -v wget &> /dev/null; then
        missing_deps+=("wget")
    fi
    
    # Check xdg-open
    if ! command -v xdg-open &> /dev/null; then
        missing_deps+=("xdg-utils")
    fi
    
    # Check sed
    if ! command -v sed &> /dev/null; then
        missing_deps+=("sed")
    fi
    
    # If dependencies are missing
    if [ ${#missing_deps[@]} -ne 0 ]; then
        echo -e "\n${RED}❌ The following dependencies are not installed:${NC}"
        printf '%s\n' "${missing_deps[@]}"
        echo -e "\n${YELLOW}Please install using command:${NC}"
        echo -e "sudo apt-get install ${missing_deps[*]}"
        exit 1
    fi
}

check_disk_space() {
    # Check free space (minimum 5GB)
    local required_space=5000000  # 5GB in KB
    local available_space=$(df "$HOME" | awk 'NR==2 {print $4}')
    
    if [ "$available_space" -lt "$required_space" ]; then
        echo -e "\n${RED}❌ Error: Not enough free space${NC}"
        echo -e "Minimum 5GB free space required"
        echo -e "Available space: $(($available_space/1024/1024))GB"
        exit 1
    fi
}

show_author_info() {
    clear
    local text="SHYN"
    local colors=("${RED}" "${GREEN}" "${YELLOW}" "${BLUE}" "${PURPLE}" "${CYAN}")
    local color_index=0
    local width=51
    local padding=$(( (width - ${#text}) / 2 ))
    
    # Color animation
    for ((i=0; i<20; i++)); do
        echo -e "\n\n\n"
        echo "                  ╔═══════════════════════════════════════════════╗"
        echo "                  ║                                               ║"
        printf "                ║%${padding}s" ""
        
        # Print each character with different colors
        for ((j=0; j<${#text}; j++)); do
            echo -en "${colors[$color_index]}${text:$j:1}${NC}"
            color_index=$(( (color_index + 1) % ${#colors[@]} ))
        done    
        
        printf "%$((padding))s  ║\n" ""
        echo "                  ║                                               ║"
        echo "                  ╚═══════════════════════════════════════════════╝"
        
        sleep 0.2
        clear
    done
    
    # Final display
    echo -e "\n\n\n"
    echo "                     ╔═══════════════════════════════════════════════╗"
    echo "                     ║                                               ║"
    printf "                   ║%${padding}s${CYAN}${text}${NC}%$((padding))s  ║\n" "" ""
    echo "                     ║                                               ║"
    echo "                     ╚═══════════════════════════════════════════════╝"
}

# Animation functions
show_spinner() {
    local pid=$1
    local delay=0.1
    local spinstr='|/-\'
    while [ "$(ps a | awk '{print $1}' | grep $pid)" ]; do
        local temp=${spinstr#?}
        printf " [%c]  " "$spinstr"
        local spinstr=$temp${spinstr%"$temp"}
        sleep $delay
        printf "\b\b\b\b\b\b"
    done
    printf "    \b\b\b\b"
}

show_progress() {
    local duration=$1
    local width=50
    local progress=0
    while [ $progress -le 100 ]; do
        local count=$(($width * $progress / 100))
        local spaces=$((width - count))
        
        printf "\r[${GREEN}"
        printf "%${count}s" "" | tr ' ' '█'
        printf "${NC}"
        printf "%${spaces}s" "" | tr ' ' '.'
        printf "] ${progress}%%"
        
        progress=$((progress + 2))
        sleep $duration
    done
    printf "\n"
}

show_loading() {
    local text=$1
    local chars="⠋⠙⠹⠸⠼⠴⠦⠧⠇⠏"
    for (( i=0; i<${#chars}; i++ )); do
        printf "\r${text} ${chars:$i:1}"
        sleep 0.1
    done
}

# Fancy banner
show_banner() {
    echo -e "${CYAN}"
    echo "╔═══════════════════════════════════════════╗"
    echo "║           ANACONDA INSTALLER              ║"
    echo "║                                           ║"
    echo "║            Create by SHYN                 ║"
    echo "╚═══════════════════════════════════════════╝"
    echo -e "${NC}"
}


# Function to display menu with animation
show_menu() {
    clear
    show_banner
    echo -e "${YELLOW}=== MAIN MENU ===${NC}"
    echo
    printf "${CYAN}⭐${NC} 1. Install Anaconda\n"
    sleep 0.1
    printf "${CYAN}⭐${NC} 2. Uninstall Anaconda\n"
    sleep 0.1
    printf "${CYAN}⭐${NC} 3. Exit\n"
    sleep 0.1
    echo
}

# Function to select Anaconda version with animation
select_anaconda_version() {
    echo -e "\n${YELLOW}=== SELECT ANACONDA VERSION ===${NC}\n"
    
    show_loading "Preparing options"
    echo -e "\n"
    
    echo -e "${PURPLE}1.${NC} Open browser to select version"
    echo -e "${PURPLE}2.${NC} Enter URL directly"
    
    read -p $'\n'"Choose option (1-2): " version_choice

    case $version_choice in
        1)
            echo -e "\n${GREEN}Opening browser...${NC}"
            show_progress 0.03
            xdg-open "https://repo.anaconda.com/archive/"
            
            echo -e "\n${YELLOW}📝 INSTRUCTIONS:${NC}"
            echo "  ▶️ Find file: Anaconda3-YYYY.MM-Linux-x86_64.sh"
            echo "  ▶️ Right click → Copy link address"
            echo "  ▶️ Paste the link below"
            ;;
        2)
            echo -e "\n${YELLOW}Enter URL directly:${NC}"
            ;;
        *)
            echo -e "\n${RED}❌ Invalid choice${NC}"
            return 1
            ;;
    esac

    read -p $'\n'"📎 Anaconda URL: " anaconda_url
    echo $anaconda_url
    return 0
}

# Function to install Anaconda with animation
install_anaconda() {
    # Check conditions before installation
    check_permissions
    check_dependencies
    check_disk_space
    
    echo -e "\n${GREEN}🚀 Starting Anaconda installation...${NC}\n"
    
    # Display version selection menu
    echo -e "\n${YELLOW}╔═══════════════════════════════════════════════╗"
    echo -e "║   SELECT ANACONDA VERSION                      ║"
    echo -e "╚═══════════════════════════════════════════════╝${NC}\n"  
    
    show_loading "Preparing version list"
    
    echo -e "\n${CYAN}Please choose how to download Anaconda:${NC}"
    echo -e "\n${PURPLE}┌───────────────────────────────────────────────────┐${NC}"
    echo -e "${PURPLE}│${NC} 1. Open browser to select version ${PURPLE}              │${NC}"
    echo -e "${PURPLE}│${NC} 2. Enter URL directly              ${PURPLE}               │${NC}"
    echo -e "${PURPLE}└───────────────────────────────────────────────────┘${NC}"
    
    echo -e "\n"
    read -p "$(echo -e ${CYAN}Enter your choice [1-2]:${NC} )" version_choice
    
    case $version_choice in
        1)
            echo -e "\n${GREEN}⏳ Opening browser...${NC}"
            show_progress 0.03
            xdg-open "https://repo.anaconda.com/archive/"
            
            echo -e "\n${YELLOW}📝 FILE SELECTION GUIDE:${NC}"
            echo -e "${CYAN}┌────────────────────────────────────────┐${NC}"
            echo -e "${CYAN}│${NC} ▶️  Find file: Anaconda3-YYYY.MM-Linux-x86_64.sh"
            echo -e "${CYAN}│${NC} ▶️  Right click → Copy link address"
            echo -e "${CYAN}│${NC} ▶️  Paste the link below"
            echo -e "${CYAN}└────────────────────────────────────────┘${NC}"
            ;;
        2)
            echo -e "\n${YELLOW}📎 Please enter URL directly:${NC}"
            ;;
        *)
            echo -e "\n${RED}❌ Invalid choice${NC}"
            return 1
            ;;
    esac

    read -p $'\n'"📎 Anaconda URL: " url
    if [ -z "$url" ]; then
        echo -e "\n${RED}❌ URL cannot be empty${NC}"
        return 1
    fi
    
    # Continue with installation
    echo -e "\n${CYAN}📂 Creating temp directory...${NC}"
    mkdir -p ~/temp_anaconda
    cd ~/temp_anaconda
    
    echo -e "\n${CYAN}⬇️  Downloading Anaconda...${NC}"
    if ! wget -O anaconda.sh "$url" 2>&1; then
        echo -e "\n${RED}❌ Error: Cannot download file from given URL${NC}"
        echo -e "Please check URL and internet connection"
        return 1
    fi
    
    echo -e "\n${CYAN}🔧 Installing...${NC}"
    show_progress 0.05
    bash anaconda.sh -b -p $HOME/anaconda3
    
    echo -e "\n${CYAN}⚙️  Configuring PATH...${NC}"
    echo 'export PATH="$HOME/anaconda3/bin:$PATH"' >> ~/.bashrc
    
    echo -e "\n${CYAN}🧹 Activating Anaconda...${NC}"
    source ~/.bashrc
    source ~/anaconda3/bin/activate
    conda init bash
    
    echo -e "\n${CYAN}🧹 Cleaning up...${NC}"
    cd ~
    rm -rf ~/temp_anaconda
    
show_success() {
    echo -e "\n${GREEN}╔═════════════════════════════════════════════════════╗"
    echo -e "║         ✅ INSTALLATION COMPLETE!                    ║"
    echo -e "║                                                     ║"
    echo -e "║    🎉 Anaconda has been activated!                  ║"
    echo -e "║    📝 Verify using command:                         ║"
    echo -e "║       conda --version                               ║"
    echo -e "║                                                     ║"
    echo -e "║    ⚡ Restart terminal to                           ║"
    echo -e "║       complete configuration                        ║"
    echo -e "╚═════════════════════════════════════════════════════╝${NC}\n"
}
}

# Function to uninstall Anaconda with animation
uninstall_anaconda() {
    echo -e "\n${RED}🗑️  Starting Anaconda uninstallation...${NC}\n"
    
    echo -e "${CYAN}Removing Anaconda directory...${NC}"
    show_progress 0.03
    rm -rf ~/anaconda3
    
    echo -e "\n${CYAN}Removing Anaconda configuration...${NC}"
    show_progress 0.03
    
    # Remove Anaconda path from .bashrc
    sed -i '/export PATH.*anaconda3/d' ~/.bashrc
    
    # Remove conda initialize section
    sed -i '/# >>> conda initialize >>>/,/# <<< conda initialize <<</d' ~/.bashrc
    
    # Remove configuration directories
    rm -rf ~/.conda
    rm -rf ~/.condarc
    
    # Unset conda environment variables
    unset CONDA_EXE
    unset CONDA_PYTHON_EXE
    unset CONDA_SHLVL
    unset CONDA_PREFIX
    unset CONDA_DEFAULT_ENV
    unset CONDA_PROMPT_MODIFIER
    
    echo -e "\n${GREEN}✅ Uninstallation complete! Please restart terminal.${NC}\n"
}   

# Initial display
clear
show_author_info
sleep 4
show_banner
sleep 0.5

# Main program loop
while true; do
    show_menu
    read -p "Enter your choice (1-3): " choice
    
    case $choice in
        1)
            install_anaconda
            read -p "Press Enter to continue..."
            ;;
        2)
            read -p $'\n'"❓ Are you sure you want to uninstall Anaconda? (y/n): " confirm
            if [ "$confirm" = "y" ]; then
                uninstall_anaconda
            fi
            read -p "Press Enter to continue..."
            ;;
        3)
            echo -e "\n${YELLOW}👋 Goodbye...${NC}\n"
            exit 0
            ;;
        *)
            echo -e "\n${RED}❌ Invalid choice. Please try again.${NC}"
            read -p "Press Enter to continue..."
            ;;
    esac
done