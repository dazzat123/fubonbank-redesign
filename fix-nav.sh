#!/bin/bash

# Fix navigation links to use correct relative paths
cd /root/.openclaw/workspace/fubonbank-redesign

echo "🔧 Fixing navigation links..."

# For pages at /pages/personal/*/index.html
# Navigation should be: ../../commercial/, ../../wealth/, etc.

# Fix personal sub-pages navigation
for f in pages/personal/*/index.html; do
    sed -i 's|href="../../commercial/index.html"|href="../../commercial/"|g' "$f"
    sed -i 's|href="../../wealth/index.html"|href="../../wealth/"|g' "$f"
    sed -i 's|href="../../ebanking/index.html"|href="../../ebanking/"|g' "$f"
    sed -i 's|href="../../about/index.html"|href="../../about/"|g' "$f"
done

# Fix commercial page navigation
sed -i 's|href="../../personal/index.html"|href="../personal/"|g' pages/commercial/index.html
sed -i 's|href="../../wealth/index.html"|href="../wealth/"|g' pages/commercial/index.html
sed -i 's|href="../../ebanking/index.html"|href="../ebanking/"|g' pages/commercial/index.html
sed -i 's|href="../../about/index.html"|href="../about/"|g' pages/commercial/index.html

# Fix wealth page navigation
sed -i 's|href="../../personal/index.html"|href="../personal/"|g' pages/wealth/index.html
sed -i 's|href="../../commercial/index.html"|href="../commercial/"|g' pages/wealth/index.html
sed -i 's|href="../../ebanking/index.html"|href="../ebanking/"|g' pages/wealth/index.html
sed -i 's|href="../../about/index.html"|href="../about/"|g' pages/wealth/index.html

# Fix ebanking page navigation
sed -i 's|href="../../personal/index.html"|href="../personal/"|g' pages/ebanking/index.html
sed -i 's|href="../../commercial/index.html"|href="../commercial/"|g' pages/ebanking/index.html
sed -i 's|href="../../wealth/index.html"|href="../wealth/"|g' pages/ebanking/index.html
sed -i 's|href="../../about/index.html"|href="../about/"|g' pages/ebanking/index.html

# Fix about page navigation
sed -i 's|href="../../personal/index.html"|href="../personal/"|g' pages/about/index.html
sed -i 's|href="../../commercial/index.html"|href="../commercial/"|g' pages/about/index.html
sed -i 's|href="../../wealth/index.html"|href="../wealth/"|g' pages/about/index.html
sed -i 's|href="../../ebanking/index.html"|href="../ebanking/"|g' pages/about/index.html

echo "✅ Navigation links fixed!"
