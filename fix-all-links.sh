#!/bin/bash

# Fix ALL broken links in Fubon Bank website
# Replace directory links with index.html and fix CSS paths

set -e

cd /root/.openclaw/workspace/fubonbank-redesign

echo "🔧 Fixing all broken links..."
echo ""

# Fix CSS paths (../../../css/main.css -> ../../../../css/main.css for nested pages)
find pages/ -name "*.html" -exec sed -i 's|href="\.\./\.\./\.\./css/main\.css"|href="../../../../css/main.css"|g' {} \;
find pages/ -name "*.html" -exec sed -i 's|href="\.\./\.\./\.\./\.\./css/main\.css"|href="../../../../../css/main.css"|g' {} \;

# Fix directory links to point to index.html
# Personal Banking
sed -i 's|href="rmb/"|href="rmb.html"|g' pages/personal/index.html

# Commercial Banking
sed -i 's|href="loans/"|href="loans.html"|g' pages/commercial/index.html
sed -i 's|href="deposits/"|href="deposits.html"|g' pages/commercial/index.html
sed -i 's|href="trade/"|href="trade.html"|g' pages/commercial/index.html
sed -i 's|href="sme/"|href="sme.html"|g' pages/commercial/index.html
sed -i 's|href="epayment/"|href="epayment.html"|g' pages/commercial/index.html
sed -i 's|href="forex/"|href="forex.html"|g' pages/commercial/index.html

# Wealth Management
sed -i 's|href="products/"|href="products.html"|g' pages/wealth/index.html
sed -i 's|href="planning/"|href="planning.html"|g' pages/wealth/index.html
sed -i 's|href="insurance/"|href="insurance.html"|g' pages/wealth/index.html
sed -i 's|href="private-banking/"|href="private-banking.html"|g' pages/wealth/index.html
sed -i 's|href="market-insights/"|href="market-insights.html"|g' pages/wealth/index.html
sed -i 's|href="consultation/"|href="consultation.html"|g' pages/wealth/index.html

# E-Banking
sed -i 's|href="internet/"|href="internet.html"|g' pages/ebanking/index.html
sed -i 's|href="mobile/"|href="mobile.html"|g' pages/ebanking/index.html
sed -i 's|href="echeque/"|href="echeque.html"|g' pages/ebanking/index.html
sed -i 's|href="billpayment/"|href="billpayment.html"|g' pages/ebanking/index.html
sed -i 's|href="notifications.html"|href="#"|g' pages/ebanking/index.html
sed -i 's|href="security.html"|href="#"|g' pages/ebanking/index.html

# About Us
sed -i 's|href="profile/"|href="profile.html"|g' pages/about/index.html
sed -i 's|href="branches/"|href="branches.html"|g' pages/about/index.html
sed -i 's|href="contact/"|href="contact.html"|g' pages/about/index.html
sed -i 's|href="careers/"|href="careers.html"|g' pages/about/index.html
sed -i 's|href="press/"|href="press.html"|g' pages/about/index.html
sed -i 's|href="sustainability.html"|href="#"|g' pages/about/index.html

# Homepage links
sed -i 's|href="pages/personal/loans/tax-loan.html"|href="pages/personal/loans/"|g' index.html
sed -i 's|href="pages/ebanking/mobile/"|href="pages/ebanking/"|g' index.html
sed -i 's|href="pages/commercial/loans/"|href="pages/commercial/"|g' index.html
sed -i 's|href="pages/commercial/deposits/"|href="pages/commercial/"|g' index.html
sed -i 's|href="pages/commercial/trade/"|href="pages/commercial/"|g' index.html
sed -i 's|href="pages/commercial/sme/"|href="pages/commercial/"|g' index.html
sed -i 's|href="pages/wealth/products/"|href="pages/wealth/"|g' index.html
sed -i 's|href="pages/wealth/planning/"|href="pages/wealth/"|g' index.html
sed -i 's|href="pages/wealth/insurance/"|href="pages/wealth/"|g' index.html
sed -i 's|href="pages/about/profile/"|href="pages/about/"|g' index.html
sed -i 's|href="pages/about/branches/"|href="pages/about/"|g' index.html
sed -i 's|href="pages/about/contact/"|href="pages/about/"|g' index.html
sed -i 's|href="pages/about/careers/"|href="pages/about/"|g' index.html

# Fix deposits page links
sed -i 's|href="cny.html"|href="#"|g' pages/personal/deposits/index.html
sed -i 's|href="time.html"|href="#"|g' pages/personal/deposits/index.html
sed -i 's|href="fc.html"|href="#"|g' pages/personal/deposits/index.html

# Fix cards page links
sed -i 's|href="apply.html"|href="#"|g' pages/personal/cards/index.html

# Fix investments page links
sed -i 's|href="stocks.html"|href="#"|g' pages/personal/investments/index.html
sed -i 's|href="products.html"|href="#"|g' pages/personal/investments/index.html
sed -i 's|href="../wealth/consultation.html"|href="../../wealth/consultation.html"|g' pages/personal/investments/index.html

# Fix loans page links
sed -i 's|href="tax-loan.html"|href="#"|g' pages/personal/loans/index.html
sed -i 's|href="mortgage-new.html"|href="#"|g' pages/personal/loans/index.html
sed -i 's|href="personal-loan.html"|href="#"|g' pages/personal/loans/index.html
sed -i 's|href="mortgage-refinance.html"|href="#"|g' pages/personal/loans/index.html

echo "✅ All broken links fixed!"
echo ""
echo "📊 Changes made:"
echo "   - Fixed CSS paths for nested pages"
echo "   - Converted directory links to .html"
echo "   - Fixed homepage navigation links"
echo "   - Replaced non-existent sub-pages with # or parent pages"
echo ""
