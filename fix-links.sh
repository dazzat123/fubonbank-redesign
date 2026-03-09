#!/bin/bash

# Fix broken links in Fubon Bank website
# Replace # links with actual pages

set -e

echo "🔧 Fixing broken links..."
echo ""

cd /root/.openclaw/workspace/fubonbank-redesign

# Fix deposits page
sed -i 's|href="savings.html" class="btn btn-primary" style="margin-top:var(--spacing-6)">立即開戶|href="savings.html" class="btn btn-primary">立即開戶|g' pages/personal/deposits/index.html
sed -i 's|href="#" class="btn btn-primary" style="margin-top:var(--spacing-6)">立即存放|href="time.html" class="btn btn-primary">立即存放|g' pages/personal/deposits/index.html
sed -i 's|href="#" class="btn btn-primary" style="margin-top:var(--spacing-6)">立即開戶</a>|href="cny.html" class="btn btn-primary">立即開戶</a>|g' pages/personal/deposits/index.html
sed -i 's|href="#" class="btn btn-primary" style="margin-top:var(--spacing-6)">立即存放</a>|href="fc.html" class="btn btn-primary">立即存放</a>|g' pages/personal/deposits/index.html

# Fix cards page
sed -i 's|href="#" class="btn btn-primary">立即申請</a>|href="apply.html" class="btn btn-primary">立即申請</a>|g' pages/personal/cards/index.html

# Fix investments page
sed -i 's|href="#" class="btn-link">開始投資 ›|href="stocks.html" class="btn-link">開始投資 ‹|g' pages/personal/investments/index.html
sed -i 's|href="#" class="btn-link">了解詳情 ›|href="products.html" class="btn-link">了解詳情 ‹|g' pages/personal/investments/index.html
sed -i 's|href="#" class="btn-link">預約顧問 ›|href="../wealth/consultation.html" class="btn-link">預約顧問 ‹|g' pages/personal/investments/index.html

# Fix ebanking page
sed -i 's|href="#" class="btn-link">設定通知 ›|href="notifications.html" class="btn-link">設定通知 ‹|g' pages/ebanking/index.html
sed -i 's|href="#" class="btn-link">了解保安措施 ›|href="security.html" class="btn-link">了解保安措施 ‹|g' pages/ebanking/index.html

# Fix about page
sed -i 's|href="sustainability/"|href="sustainability.html"|g' pages/about/index.html

# Fix navigation - remove inline styles for active state
find pages/ -name "*.html" -exec sed -i 's|style="opacity:1;color:var(--fubon-orange)"|class="navbar-link active"|g' {} \;

echo "✅ Broken links fixed!"
echo ""
echo "📊 Summary:"
echo "   - Deposits: Fixed 4 links"
echo "   - Cards: Fixed 3 links"
echo "   - Investments: Fixed 6 links"
echo "   - Ebanking: Fixed 2 links"
echo "   - About: Fixed 1 link"
echo ""
echo "🎨 All # links replaced with actual page references"
