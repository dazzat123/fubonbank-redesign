#!/bin/bash

# Fix CSS paths for all pages
cd /root/.openclaw/workspace/fubonbank-redesign

echo "🔧 Fixing CSS paths..."

# Homepage - no path needed (css is in root)
# Already correct: css/main.css

# Pages at /pages/*/index.html need ../../css/main.css
find pages/personal -maxdepth 1 -name "index.html" -exec sed -i 's|href="../../../../css/main.css"|href="../../css/main.css"|g' {} \;
find pages/commercial -maxdepth 1 -name "index.html" -exec sed -i 's|href="../../../../css/main.css"|href="../../css/main.css"|g' {} \;
find pages/wealth -maxdepth 1 -name "index.html" -exec sed -i 's|href="../../../../css/main.css"|href="../../css/main.css"|g' {} \;
find pages/ebanking -maxdepth 1 -name "index.html" -exec sed -i 's|href="../../../../css/main.css"|href="../../css/main.css"|g' {} \;
find pages/about -maxdepth 1 -name "index.html" -exec sed -i 's|href="../../../../css/main.css"|href="../../css/main.css"|g' {} \;

# Pages at /pages/personal/*/index.html need ../../../css/main.css
find pages/personal/*/ -maxdepth 1 -name "index.html" -exec sed -i 's|href="../../../../css/main.css"|href="../../../css/main.css"|g' {} \;
find pages/personal/*/ -maxdepth 1 -name "index.html" -exec sed -i 's|href="../../../../../css/main.css"|href="../../../css/main.css"|g' {} \;

echo "✅ CSS paths fixed!"
