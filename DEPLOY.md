# 🚀 部署指南
## Deployment Guide - Fubon Bank Redesign

**更新日期**: 2026-03-09 21:35 HKT

---

## ✅ 項目狀態

### 已完成
- ✅ 首頁設計 (index.html)
- ✅ CSS 設計系統 (css/main.css)
- ✅ JavaScript 功能 (js/main.js)
- ✅ 富邦銀行 Logo (images/logo/)
- ✅ Hero 圖片 (4 張)
- ✅ 產品圖片 (7 張)
- ✅ 橫幅圖片 (2 張)
- ✅ 設備 Mockup (3 張)
- ✅ 圖片下載腳本

### 待完成
- ⏳ 個人銀行頁面
- ⏳ 商業銀行頁面
- ⏳ 財富管理頁面
- ⏳ 電子銀行頁面
- ⏳ 關於我們頁面
- ⏳ GitHub 倉庫創建
- ⏳ Cloudflare Pages 部署

---

## 📋 GitHub 部署步驟

### 步驟 1: 創建 GitHub 倉庫

1. 訪問：https://github.com/new
2. **Repository name**: `fubonbank-redesign`
3. **Description**: Fubon Bank Apple-Style Website Redesign
4. **Visibility**: Public 或 Private (選擇一個)
5. ✅ **不要** 初始化 README/.gitignore/license
6. 點擊 **Create repository**

### 步驟 2: 推送代碼到 GitHub

```bash
cd /root/.openclaw/workspace/fubonbank-redesign

# 配置 Git (如果還沒有)
git config user.email "your-email@example.com"
git config user.name "Your Name"

# 添加遠程倉庫 (替換 YOUR_USERNAME 為你的 GitHub 用戶名)
git remote add origin https://github.com/YOUR_USERNAME/fubonbank-redesign.git

# 推送代碼
git branch -M main
git push -u origin main
```

### 步驟 3: 驗證推送

訪問你的倉庫：
```
https://github.com/YOUR_USERNAME/fubonbank-redesign
```

確認所有文件已上傳：
- index.html
- css/main.css
- js/main.js
- images/ (所有圖片)
- README.md

---

## ☁️ Cloudflare Pages 部署

### 方法 1: 連接 GitHub (推薦)

#### 步驟 1: 訪問 Cloudflare Dashboard
https://dash.cloudflare.com/

#### 步驟 2: 創建 Pages 應用
1. **Workers & Pages** > **Create application**
2. 選擇 **Pages** 標籤
3. 選擇 **Connect to Git**

#### 步驟 3: 連接 GitHub
1. 授權 Cloudflare 訪問 GitHub
2. 選擇你的倉庫：`YOUR_USERNAME/fubonbank-redesign`
3. 選擇分支：**main**

#### 步驟 4: 配置構建
- **Project name**: fubonbank-redesign
- **Production branch**: main
- **Build command**: (留空)
- **Build output directory**: `.`
- **Root directory**: (留空)

#### 步驟 5: 部署
1. 點擊 **Save and Deploy**
2. 等待部署完成 (1-2 分鐘)
3. 獲取部署網址

### 方法 2: Direct Upload (快速測試)

#### 步驟 1: 打包專案
```bash
cd /root/.openclaw/workspace
zip -r fubonbank-redesign.zip fubonbank-redesign/ \
  -x "*.git*" \
  -x "node_modules/*"
```

#### 步驟 2: 上傳到 Cloudflare
1. 訪問：https://dash.cloudflare.com/
2. **Workers & Pages** > **Create application**
3. 選擇 **Pages** > **Direct Upload**
4. 上傳 `fubonbank-redesign.zip`
5. 點擊 **Deploy**

---

## 🌐 部署後網址

### Cloudflare Pages
```
https://fubonbank-redesign.pages.dev
```

### 自訂網域 (可選)
1. Cloudflare Pages > **Custom domains**
2. 輸入你的網域
3. 按照指示配置 DNS

---

## 📊 專案統計

| 項目 | 數量 |
|------|------|
| **HTML 文件** | 1 個 (首頁) |
| **CSS 文件** | 1 個 |
| **JavaScript** | 1 個 |
| **Hero 圖片** | 4 張 |
| **產品圖片** | 7 張 |
| **橫幅圖片** | 2 張 |
| **Mockup** | 3 張 |
| **Logo** | 1 個 |
| **總大小** | ~3.5MB |

---

## 🎯 下一步工作

### 頁面開發 (優先級 1)
- [ ] 個人銀行首頁 (pages/personal/index.html)
- [ ] 存款服務 (pages/personal/deposits/)
- [ ] 貸款服務 (pages/personal/loans/)
- [ ] 信用卡 (pages/personal/cards/)
- [ ] 投資服務 (pages/personal/investments/)
- [ ] 保險服務 (pages/personal/insurance/)

### 頁面開發 (優先級 2)
- [ ] 商業銀行首頁 (pages/commercial/index.html)
- [ ] 財富管理首頁 (pages/wealth/index.html)
- [ ] 電子銀行首頁 (pages/ebanking/index.html)
- [ ] 關於我們首頁 (pages/about/index.html)

### 優化 (優先級 3)
- [ ] 添加所有內部連結
- [ ] 測試所有頁面連結
- [ ] 響應式測試
- [ ] 效能優化
- [ ] SEO 優化

---

## 📞 疑難排解

### Q: Git push 失敗
**解決**: 
```bash
# 確認倉庫已創建
# 確認遠程 URL 正確
git remote -v
# 重新添加遠程
git remote set-url origin https://github.com/YOUR_USERNAME/fubonbank-redesign.git
```

### Q: Cloudflare 部署失敗
**解決**:
- 確認 Build command 留空
- 確認 Build output directory 為 `.`
- 檢查部署日誌

### Q: 圖片無法載入
**解決**:
- 確認圖片路徑正確
- 確認圖片文件存在
- 檢查瀏覽器控制台錯誤

---

## 🎨 設計參考

- **Apple.com**: https://www.apple.com/
- **富邦銀行**: https://www.fubonbank.com.hk/

---

**準備就緒！** 🚀

1. 在 GitHub 創建倉庫
2. 推送代碼
3. 連接 Cloudflare Pages
4. 完成部署！
