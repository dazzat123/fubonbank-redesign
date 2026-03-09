#!/bin/bash

# Final link fix - replace all remaining broken links with #
cd /root/.openclaw/workspace/fubonbank-redesign

echo "🔧 Final link cleanup..."

# Fix remaining broken links in homepage
sed -i 's|href="pages/personal/"|href="pages/personal/index.html"|g' index.html
sed -i 's|href="pages/commercial/"|href="pages/commercial/index.html"|g' index.html
sed -i 's|href="pages/wealth/"|href="pages/wealth/index.html"|g' index.html
sed -i 's|href="pages/ebanking/"|href="pages/ebanking/index.html"|g' index.html
sed -i 's|href="pages/about/"|href="pages/about/index.html"|g' index.html

# Fix navigation links - make sure all parent nav links point to index.html
find pages/ -name "*.html" -exec sed -i 's|href="\.\./\.\./personal/"|href="../../personal/index.html"|g' {} \;
find pages/ -name "*.html" -exec sed -i 's|href="\.\./\.\./commercial/"|href="../../commercial/index.html"|g' {} \;
find pages/ -name "*.html" -exec sed -i 's|href="\.\./\.\./wealth/"|href="../../wealth/index.html"|g' {} \;
find pages/ -name "*.html" -exec sed -i 's|href="\.\./\.\./ebanking/"|href="../../ebanking/index.html"|g' {} \;
find pages/ -name "*.html" -exec sed -i 's|href="\.\./\.\./about/"|href="../../about/index.html"|g' {} \;

# Fix remaining broken sub-page links with #
sed -i 's|href="loans.html"|href="#"|g' pages/commercial/index.html
sed -i 's|href="deposits.html"|href="#"|g' pages/commercial/index.html
sed -i 's|href="trade.html"|href="#"|g' pages/commercial/index.html
sed -i 's|href="sme.html"|href="#"|g' pages/commercial/index.html
sed -i 's|href="epayment.html"|href="#"|g' pages/commercial/index.html
sed -i 's|href="forex.html"|href="#"|g' pages/commercial/index.html

sed -i 's|href="products.html"|href="#"|g' pages/wealth/index.html
sed -i 's|href="planning.html"|href="#"|g' pages/wealth/index.html
sed -i 's|href="insurance.html"|href="#"|g' pages/wealth/index.html
sed -i 's|href="private-banking.html"|href="#"|g' pages/wealth/index.html
sed -i 's|href="market-insights.html"|href="#"|g' pages/wealth/index.html
sed -i 's|href="consultation.html"|href="#"|g' pages/wealth/index.html

sed -i 's|href="internet.html"|href="#"|g' pages/ebanking/index.html
sed -i 's|href="mobile.html"|href="#"|g' pages/ebanking/index.html
sed -i 's|href="echeque.html"|href="#"|g' pages/ebanking/index.html
sed -i 's|href="billpayment.html"|href="#"|g' pages/ebanking/index.html

sed -i 's|href="profile.html"|href="#"|g' pages/about/index.html
sed -i 's|href="branches.html"|href="#"|g' pages/about/index.html
sed -i 's|href="contact.html"|href="#"|g' pages/about/index.html
sed -i 's|href="careers.html"|href="#"|g' pages/about/index.html
sed -i 's|href="press.html"|href="#"|g' pages/about/index.html

echo "✅ Final cleanup complete!"
