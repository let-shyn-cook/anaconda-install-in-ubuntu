#!/bin/bash

# Colors for output formatting
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m'

# Kiểm tra quyền thực thi
check_permissions() {
    if [ ! -w "$HOME" ]; then
        echo -e "\n${RED}❌ Lỗi: Không có quyền ghi vào thư mục home${NC}"
        exit 1
    fi
    
    if [ ! -w "$HOME/.bashrc" ]; then
        echo -e "\n${RED}❌ Lỗi: Không có quyền ghi vào file .bashrc${NC}"
        exit 1
    fi
}

check_dependencies() {
    local missing_deps=()
    
    # Kiểm tra wget
    if ! command -v wget &> /dev/null; then
        missing_deps+=("wget")
    fi
    
    # Kiểm tra xdg-open
    if ! command -v xdg-open &> /dev/null; then
        missing_deps+=("xdg-utils")
    fi
    
    # Kiểm tra sed
    if ! command -v sed &> /dev/null; then
        missing_deps+=("sed")
    fi
    
    # Nếu có dependency thiếu
    if [ ${#missing_deps[@]} -ne 0 ]; then
        echo -e "\n${RED}❌ Các gói phụ thuộc sau chưa được cài đặt:${NC}"
        printf '%s\n' "${missing_deps[@]}"
        echo -e "\n${YELLOW}Vui lòng cài đặt bằng lệnh:${NC}"
        echo -e "sudo apt-get install ${missing_deps[*]}"
        exit 1
    fi
}

check_disk_space() {
    # Kiểm tra dung lượng trống (tối thiểu 5GB)
    local required_space=5000000  # 5GB in KB
    local available_space=$(df "$HOME" | awk 'NR==2 {print $4}')
    
    if [ "$available_space" -lt "$required_space" ]; then
        echo -e "\n${RED}❌ Lỗi: Không đủ dung lượng trống${NC}"
        echo -e "Cần tối thiểu 5GB dung lượng trống"
        echo -e "Dung lượng hiện có: $(($available_space/1024/1024))GB"
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
    
    # Animation chạy màu
    for ((i=0; i<20; i++)); do
        echo -e "\n\n\n"
        echo "                  ╔═══════════════════════════════════════════════╗"
        echo "                  ║                                               ║"
        printf "                ║%${padding}s" ""
        
                                # In từng chữ với màu khác nhau
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
    
    # Hiển thị cuối cùng
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
    echo -e "${YELLOW}=== MENU CHÍNH ===${NC}"
    echo
    printf "${CYAN}⭐${NC} 1. Cài đặt Anaconda\n"
    sleep 0.1
    printf "${CYAN}⭐${NC} 2. Gỡ cài đặt Anaconda\n"
    sleep 0.1
    printf "${CYAN}⭐${NC} 3. Thoát\n"
    sleep 0.1
    echo
}

# Function to select Anaconda version with animation
select_anaconda_version() {
    echo -e "\n${YELLOW}=== CHỌN PHIÊN BẢN ANACONDA ===${NC}\n"
    
    show_loading "Đang chuẩn bị options"
    echo -e "\n"
    
    echo -e "${PURPLE}1.${NC} Mở trình duyệt để chọn phiên bản"
    echo -e "${PURPLE}2.${NC} Nhập URL trực tiếp"
    
    read -p $'\n'"Chọn tùy chọn (1-2): " version_choice

    case $version_choice in
        1)
            echo -e "\n${GREEN}Đang mở trình duyệt...${NC}"
            show_progress 0.03
            xdg-open "https://repo.anaconda.com/archive/"
            
            echo -e "\n${YELLOW}📝 HƯỚNG DẪN CHỌN FILE:${NC}"
            echo "  ▶️ Tìm file: Anaconda3-YYYY.MM-Linux-x86_64.sh"
            echo "  ▶️ Click chuột phải → Copy link address"
            echo "  ▶️ Dán link vào bên dưới"
            ;;
        2)
            echo -e "\n${YELLOW}Nhập URL trực tiếp:${NC}"
            ;;
        *)
            echo -e "\n${RED}❌ Lựa chọn không hợp lệ${NC}"
            return 1
            ;;
    esac

    read -p $'\n'"📎 URL Anaconda: " anaconda_url
    echo $anaconda_url
    return 0
}

# Function to install Anaconda with animation
install_anaconda() {
    # Kiểm tra các điều kiện trước khi cài đặt
    check_permissions
    check_dependencies
    check_disk_space
    
    echo -e "\n${GREEN}🚀 Bắt đầu cài đặt Anaconda...${NC}\n"
    
    # Hiển thị menu lựa chọn phiên bản
    echo -e "\n${YELLOW}╔═══════════════════════════════════════════════╗"
    echo -e "║   CHỌN PHIÊN BẢN ANACONDA                     ║"
    echo -e "╚═══════════════════════════════════════════════╝${NC}\n"  
    
    show_loading "Đang chuẩn bị danh sách phiên bản"
    
    echo -e "\n${CYAN}Vui lòng chọn cách tải Anaconda:${NC}"
    echo -e "\n${PURPLE}┌───────────────────────────────────────────────────┐${NC}"     #
    echo -e "${PURPLE}│${NC} 1. Mở trình duyệt để chọn phiên bản ${PURPLE}              │${NC}"
    echo -e "${PURPLE}│${NC} 2. Nhập URL trực tiếp              ${PURPLE}               │${NC}"
    echo -e "${PURPLE}└───────────────────────────────────────────────────┘${NC}"
    
    echo -e "\n"
    read -p "$(echo -e ${CYAN}Nhập lựa chọn của bạn [1-2]:${NC} )" version_choice
    
    case $version_choice in
        1)
            echo -e "\n${GREEN}⏳ Đang mở trình duyệt...${NC}"
            show_progress 0.03
            xdg-open "https://repo.anaconda.com/archive/"
            
            echo -e "\n${YELLOW}📝 HƯỚNG DẪN CHỌN FILE:${NC}"
            echo -e "${CYAN}┌────────────────────────────────────────┐${NC}"
            echo -e "${CYAN}│${NC} ▶️  Tìm file: Anaconda3-YYYY.MM-Linux-x86_64.sh"
            echo -e "${CYAN}│${NC} ▶️  Click chuột phải → Copy link address"
            echo -e "${CYAN}│${NC} ▶️  Dán link vào bên dưới"
            echo -e "${CYAN}└────────────────────────────────────────┘${NC}"
            ;;
        2)
            echo -e "\n${YELLOW}📎 Vui lòng nhập URL trực tiếp:${NC}"
            ;;
        *)
            echo -e "\n${RED}❌ Lựa chọn không hợp lệ${NC}"
            return 1
            ;;
    esac

    read -p $'\n'"📎 URL Anaconda: " url
    if [ -z "$url" ]; then
        echo -e "\n${RED}❌ URL không được để trống${NC}"
        return 1
    fi
    
    # Tiếp tục với quá trình cài đặt
    echo -e "\n${CYAN}📂 Tạo thư mục tạm...${NC}"
    mkdir -p ~/temp_anaconda
    cd ~/temp_anaconda
    
    echo -e "\n${CYAN}⬇️  Đang tải Anaconda...${NC}"
    if ! wget -O anaconda.sh "$url" 2>&1; then
        echo -e "\n${RED}❌ Lỗi: Không thể tải file từ URL đã cho${NC}"
        echo -e "Vui lòng kiểm tra lại URL và kết nối mạng"
        return 1
    fi
    
    echo -e "\n${CYAN}🔧 Đang cài đặt...${NC}"
    show_progress 0.05
    bash anaconda.sh -b -p $HOME/anaconda3
    
    echo -e "\n${CYAN}⚙️  Cấu hình PATH...${NC}"
    echo 'export PATH="$HOME/anaconda3/bin:$PATH"' >> ~/.bashrc
    
    echo -e "\n${CYAN}🧹 Kích hoạt Anaconda...${NC}"
    source ~/.bashrc
    source ~/anaconda3/bin/activate
    conda init bash
    
    echo -e "\n${CYAN}🧹 Dọn dẹp...${NC}"
    cd ~
    rm -rf ~/temp_anaconda
    
show_success() {
    echo -e "\n${GREEN}╔═════════════════════════════════════════════════════╗"
    echo -e "║         ✅ CÀI ĐẶT HOÀN TẤT!                        ║"
    echo -e "║                                                     ║"
    echo -e "║    🎉 Anaconda đã được kích hoạt!                   ║"
    echo -e "║    📝 Kiểm tra bằng lệnh:                           ║"
    echo -e "║       conda --version                               ║"
    echo -e "║                                                     ║"
    echo -e "║    ⚡ Khởi động lại terminal để                     ║"
    echo -e "║       hoàn tất cấu hình                             ║"
    echo -e "╚═════════════════════════════════════════════════════╝${NC}\n"
}
}

# Function to uninstall Anaconda with animation
uninstall_anaconda() {
    echo -e "\n${RED}🗑️  Bắt đầu gỡ cài đặt Anaconda...${NC}\n"
    
    echo -e "${CYAN}Đang xóa thư mục Anaconda...${NC}"
    show_progress 0.03
    rm -rf ~/anaconda3
    
    echo -e "\n${CYAN}Đang xóa cấu hình Anaconda...${NC}"
    show_progress 0.03
    
    # Xóa đường dẫn Anaconda trong .bashrc
    sed -i '/export PATH.*anaconda3/d' ~/.bashrc
    
    # Xóa phần conda initialize
    sed -i '/# >>> conda initialize >>>/,/# <<< conda initialize <<</d' ~/.bashrc
    
    # Xóa các thư mục cấu hình
    rm -rf ~/.conda
    rm -rf ~/.condarc
    
    # Xóa các biến môi trường conda
    unset CONDA_EXE
    unset CONDA_PYTHON_EXE
    unset CONDA_SHLVL
    unset CONDA_PREFIX
    unset CONDA_DEFAULT_ENV
    unset CONDA_PROMPT_MODIFIER
    
    echo -e "\n${GREEN}✅ Gỡ cài đặt hoàn tất! Vui lòng khởi động lại terminal.${NC}\n"
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
    read -p "Nhập lựa chọn của bạn (1-3): " choice
    
    case $choice in
        1)
            install_anaconda
            read -p "Nhấn Enter để tiếp tục..."
            ;;
        2)
            read -p $'\n'"❓ Bạn có chắc muốn gỡ cài đặt Anaconda? (y/n): " confirm
            if [ "$confirm" = "y" ]; then
                uninstall_anaconda
            fi
            read -p "Nhấn Enter để tiếp tục..."
            ;;
        3)
            echo -e "\n${YELLOW}👋 Tạm biệt...${NC}\n"
            exit 0
            ;;
        *)
            echo -e "\n${RED}❌ Lựa chọn không hợp lệ. Vui lòng thử lại.${NC}"
            read -p "Nhấn Enter để tiếp tục..."
            ;;
    esac
done 