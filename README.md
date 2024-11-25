<div align="center">
  <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/anaconda/anaconda-original.svg" width="200px" height="200px" alt="logo" class="animated-logo">

<h1 class="gradient-text">Anaconda Installer for Ubuntu</h1>

<p align="center" class="typing-text">
  🚀 Script cài đặt Anaconda tự động với giao diện đẹp mắt cho Ubuntu
</p>

<div class="badge-container">
  <a href="https://github.com/let-shyn-cook/anaconda-install-in-ubuntu/stargazers">
    <img src="https://img.shields.io/github/stars/let-shyn-cook/anaconda-install-in-ubuntu?style=for-the-badge&color=yellow&labelColor=black" alt="stars">
  </a>
  <a href="https://github.com/let-shyn-cook/anaconda-install-in-ubuntu/network/members">
    <img src="https://img.shields.io/github/forks/let-shyn-cook/anaconda-install-in-ubuntu?style=for-the-badge&color=blue&labelColor=black" alt="forks">
  </a>
  <a href="https://github.com/let-shyn-cook/anaconda-install-in-ubuntu/issues">
    <img src="https://img.shields.io/github/issues/let-shyn-cook/anaconda-install-in-ubuntu?style=for-the-badge&color=red&labelColor=black" alt="issues">
  </a>
  <a href="https://github.com/let-shyn-cook/anaconda-install-in-ubuntu/blob/main/LICENSE">
    <img src="https://img.shields.io/github/license/let-shyn-cook/anaconda-install-in-ubuntu?style=for-the-badge&color=green&labelColor=black" alt="license">
  </a>
</div>

<div class="button-container">
  <a href="#installation" class="action-button">
    🚀 Bắt Đầu
  </a>
  <a href="#documentation" class="action-button">
    📚 Tài Liệu
  </a>
  <a href="https://github.com/let-shyn-cook/anaconda-install-in-ubuntu/issues" class="action-button">
    🐛 Báo Lỗi
  </a>
</div>

</div>

<style>
.animated-logo {
  animation: float 6s ease-in-out infinite;
}

@keyframes float {
  0% { transform: translateY(0px) rotate(0deg); }
  50% { transform: translateY(-20px) rotate(10deg); }
  100% { transform: translateY(0px) rotate(0deg); }
}

.gradient-text {
  background: linear-gradient(45deg, #00ff87 30%, #60efff 90%);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  font-size: 3em;
  margin: 20px 0;
}

.typing-text {
  border-right: 2px solid;
  animation: typing 3.5s steps(40, end), blink .75s step-end infinite;
  white-space: nowrap;
  overflow: hidden;
}

.badge-container {
  margin: 20px 0;
  display: flex;
  gap: 10px;
  justify-content: center;
  flex-wrap: wrap;
}

.badge-container img:hover {
  transform: translateY(-3px);
  transition: transform 0.3s ease;
}

.button-container {
  margin: 30px 0;
  display: flex;
  gap: 20px;
  justify-content: center;
  flex-wrap: wrap;
}

.action-button {
  padding: 12px 24px;
  background: linear-gradient(45deg, #00ff87, #60efff);
  color: black;
  text-decoration: none;
  border-radius: 25px;
  font-weight: bold;
  transition: all 0.3s ease;
  box-shadow: 0 4px 15px rgba(0,0,0,0.2);
}

.action-button:hover {
  transform: translateY(-3px);
  box-shadow: 0 6px 20px rgba(0,0,0,0.3);
}
</style>

## 🌟 Tính Năng Nổi Bật

<div class="feature-grid">
  <div class="feature-card">
    <div class="feature-icon">🎨</div>
    <h3>Giao Diện Đẹp</h3>
    <p>Thiết kế hiện đại với animations</p>
    <ul>
      <li>Menu tương tác</li>
      <li>Hiệu ứng chuyển động</li>
      <li>Màu sắc hài hòa</li>
    </ul>
  </div>
  
  <div class="feature-card">
    <div class="feature-icon">⚡</div>
    <h3>Cài Đặt Thông Minh</h3>
    <p>Tự động hóa hoàn toàn</p>
    <ul>
      <li>Kiểm tra điều kiện</li>
      <li>Tải về tự động</li>
      <li>Cấu hình tự động</li>
    </ul>
  </div>
  
  <div class="feature-card">
    <div class="feature-icon">🛡️</div>
    <h3>An Toàn & Tin Cậy</h3>
    <p>Đảm bảo tính ổn định</p>
    <ul>
      <li>Kiểm tra phụ thuộc</li>
      <li>Xác thực nguồn</li>
      <li>Sao lưu cấu hình</li>
    </ul>
  </div>
</div>

<style>
.feature-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
  gap: 30px;
  padding: 30px 0;
}

.feature-card {
  background: white;
  padding: 30px;
  border-radius: 15px;
  box-shadow: 0 5px 15px rgba(0,0,0,0.1);
  transition: all 0.3s ease;
  border: 1px solid #eee;
}

.feature-card:hover {
  transform: translateY(-5px);
  box-shadow: 0 8px 25px rgba(0,0,0,0.2);
}

.feature-icon {
  font-size: 3em;
  margin-bottom: 20px;
}

.feature-card h3 {
  color: #333;
  margin-bottom: 15px;
}

.feature-card ul {
  list-style-type: none;
  padding-left: 0;
}

.feature-card ul li {
  margin: 10px 0;
  padding-left: 20px;
  position: relative;
}

.feature-card ul li:before {
  content: "→";
  position: absolute;
  left: 0;
  color: #00ff87;
}
</style>

## 📥 Video Demo

<div class="video-container">
  <div class="video-wrapper">
    <video 
      controls
      autoplay
      loop
      muted
      playsinline
      poster="video/thumbnail.jpg">
      <source src="video/demo-install.mp4" type="video/mp4">
      Trình duyệt của bạn không hỗ trợ video tag.
    </video>
  </div>
  
  <div class="video-description">
    <h3>🎯 Nội dung demo:</h3>
    <ul>
      <li>Cài đặt Anaconda từ A-Z</li>
      <li>Gỡ cài đặt sạch sẽ</li>
      <li>Preview các tính năng chính</li>
      <li>Tips và lưu ý khi sử dụng</li>
    </ul>
  </div>
</div>

<style>
.video-container {
  margin: 40px 0;
  display: grid;
  grid-template-columns: 2fr 1fr;
  gap: 30px;
  padding: 20px;
  background: white;
  border-radius: 15px;
  box-shadow: 0 5px 15px rgba(0,0,0,0.1);
}

@media (max-width: 768px) {
  .video-container {
    grid-template-columns: 1fr;
  }
}

.video-wrapper {
  position: relative;
  padding-bottom: 56.25%;
  height: 0;
  overflow: hidden;
  border-radius: 10px;
}

.video-wrapper video {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  border-radius: 10px;
  transition: transform 0.3s ease;
  object-fit: cover;
}

.video-wrapper:hover video {
  transform: scale(1.02);
}

.video-description {
  padding: 20px;
  background: linear-gradient(45deg, rgba(0,255,135,0.1), rgba(96,239,255,0.1));
  border-radius: 10px;
}

.video-description h3 {
  color: #333;
  margin-bottom: 15px;
  border-bottom: 2px solid #00ff87;
  padding-bottom: 10px;
}

.video-description ul {
  list-style-type: none;
  padding-left: 0;
}

.video-description ul li {
  margin: 10px 0;
  padding-left: 25px;
  position: relative;
}

.video-description ul li:before {
  content: "▶️";
  position: absolute;
  left: 0;
  color: #00ff87;
}
</style>

## 📥 Hướng Dẫn Cài Đặt

<div class="installation-steps">
  <div class="step">
    <div class="step-number">1</div>
    <div class="step-content">
      <h3>Clone Repository</h3>
      <pre><code>git clone https://github.com/let-shyn-cook/anaconda-install-in-ubuntu.git</code></pre>
    </div>
  </div>

  <div class="step">
    <div class="step-number">2</div>
    <div class="step-content">
      <h3>Di Chuyển Vào Thư Mục</h3>
      <pre><code>cd anaconda-install-in-ubuntu</code></pre>
    </div>
  </div>

  <div class="step">
    <div class="step-number">3</div>
    <div class="step-content">
      <h3>Cấp Quyền Thực Thi</h3>
      <pre><code>chmod +x install_anaconda.sh</code></pre>
    </div>
  </div>

  <div class="step">
    <div class="step-number">4</div>
    <div class="step-content">
      <h3>Chạy Script</h3>
      <pre><code>./install_anaconda.sh</code></pre>
    </div>
  </div>
</div>

<style>
.installation-steps {
  margin: 30px 0;
}

.step {
  display: flex;
  align-items: flex-start;
  margin: 30px 0;
  padding: 20px;
  background: white;
  border-radius: 15px;
  box-shadow: 0 5px 15px rgba(0,0,0,0.1);
  transition: transform 0.3s ease;
}

.step:hover {
  transform: translateX(10px);
}

.step-number {
  width: 40px;
  height: 40px;
  background: linear-gradient(45deg, #00ff87, #60efff);
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  font-weight: bold;
  margin-right: 20px;
  flex-shrink: 0;
}

.step-content {
  flex: 1;
}

.step-content pre {
  background: #f6f8fa;
  padding: 15px;
  border-radius: 8px;
  overflow-x: auto;
}

.step-content code {
  color: #333;
}
</style>

## 🎯 Yêu Cầu Hệ Thống

<div class="requirements-grid">
  <div class="req-card">
    <span class="req-icon">💻</span>
    <h4>Hệ Điều Hành</h4>
    <p>Ubuntu 18.04 trở lên</p>
  </div>
  
  <div class="req-card">
    <span class="req-icon">💾</span>
    <h4>Dung Lượng</h4>
    <p>Tối thiểu 5GB trống</p>
  </div>
  
  <div class="req-card">
    <span class="req-icon">🌐</span>
    <h4>Kết Nối</h4>
    <p>Internet ổn định</p>
  </div>
  
  <div class="req-card">
    <span class="req-icon">📦</span>
    <h4>Phụ Thuộc</h4>
    <p>wget, xdg-utils</p>
  </div>
</div>

<style>
.requirements-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
  gap: 20px;
  margin: 30px 0;
}

.req-card {
  background: white;
  padding: 20px;
  border-radius: 10px;
  text-align: center;
  box-shadow: 0 5px 15px rgba(0,0,0,0.1);
  transition: transform 0.3s ease;
}

.req-card:hover {
  transform: translateY(-5px);
}

.req-icon {
  font-size: 2em;
  margin-bottom: 10px;
  display: block;
}
</style>

## 🤝 Đóng Góp

<div class="contribute-section">
  <div class="contribute-card">
    <h3>🌟 Cách Đóng Góp</h3>
    <ol>
      <li>Fork dự án</li>
      <li>Tạo branch mới (<code>git checkout -b feature/AmazingFeature</code>)</li>
      <li>Commit thay đổi (<code>git commit -m 'Add some AmazingFeature'</code>)</li>
      <li>Push lên branch (<code>git push origin feature/AmazingFeature</code>)</li>
      <li>Tạo Pull Request</li>
    </ol>
  </div>

  <div class="contribute-guidelines">
    <h3>📋 Hướng Dẫn</h3>
    <ul>
      <li>Tuân thủ coding style</li>
      <li>Cập nhật documentation</li>
      <li>Thêm test cases</li>
      <li>Giữ commit message rõ ràng</li>
    </ul>
  </div>
</div>

<style>
.contribute-section {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
  gap: 30px;
  margin: 30px 0;
}

.contribute-card, .contribute-guidelines {
  background: white;
  padding: 30px;
  border-radius: 15px;
  box-shadow: 0 5px 15px rgba(0,0,0,0.1);
}

.contribute-card ol, .contribute-guidelines ul {
  padding-left: 20px;
}

.contribute-card li, .contribute-guidelines li {
  margin: 10px 0;
  line-height: 1.6;
}
</style>

## 📝 Giấy Phép

<div class="license-section">
  <div class="license-card">
    <h3>MIT License</h3>
    <p>Copyright © 2024 SHYN</p>
    <p>Được phép sử dụng, sao chép, sửa đổi, và phân phối miễn phí.</p>
    <a href="https://opensource.org/license/mit" class="license-link">Xem chi tiết →</a>
  </div>
</div>

<style>
.license-section {
  margin: 30px 0;
}

.license-card {
  background: white;
  padding: 30px;
  border-radius: 15px;
  box-shadow: 0 5px 15px rgba(0,0,0,0.1);
  text-align: center;
}

.license-link {
  display: inline-block;
  margin-top: 20px;
  padding: 10px 20px;
  background: linear-gradient(45deg, #00ff87, #60efff);
  color: black;
  text-decoration: none;
  border-radius: 25px;
  font-weight: bold;
  transition: all 0.3s ease;
}

.license-link:hover {
  transform: translateY(-3px);
  box-shadow: 0 5px 15px rgba(0,0,0,0.2);
}
</style>

<div align="center">
  <p class="footer-text">Made with ❤️ by <a href="https://github.com/let-shyn-cook">SHYN</a></p>
</div>

<style>
.footer-image {
  margin-top: 50px;
  border-radius: 10px;
  box-shadow: 0 5px 15px rgba(0,0,0,0.1);
}

.footer-text {
  margin: 20px 0;
  font-size: 1.2em;
}

.footer-text a {
  color: #00ff87;
  text-decoration: none;
  font-weight: bold;
}

.footer-text a:hover {
  text-decoration: underline;
}
</style>