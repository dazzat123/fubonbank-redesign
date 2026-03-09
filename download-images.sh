#!/bin/bash

# Fubon Bank Redesign - Image Download Script
# Downloads all required images from Unsplash

set -e

echo "🖼️  Fubon Bank - Downloading Images..."
echo "======================================"
echo ""

# Create directories
mkdir -p images/{hero,products,banners,icons,logo,pages}

cd images

# Hero Images
echo "📥 Downloading Hero images..."
curl -sL -o hero/bank-building.jpg "https://images.unsplash.com/photo-1486406146926-c627a92ad1ab?w=1920&q=80" && echo "✅ bank-building.jpg" || echo "❌ Failed"
curl -sL -o hero/business-meeting.jpg "https://images.unsplash.com/photo-1556761175-5973b0e07704?w=1920&q=80" && echo "✅ business-meeting.jpg" || echo "❌ Failed"
curl -sL -o hero/happy-family.jpg "https://images.unsplash.com/photo-1542037104857-ffbb0b9155fb?w=1920&q=80" && echo "✅ happy-family.jpg" || echo "❌ Failed"
curl -sL -o hero/travel-backpacker.jpg "https://images.unsplash.com/photo-1501785888041-af3ef285b470?w=1920&q=80" && echo "✅ travel-backpacker.jpg" || echo "❌ Failed"

# Product Images
echo ""
echo "📥 Downloading Product images..."
curl -sL -o products/tax-loan.jpg "https://images.unsplash.com/photo-1554224155-8d04cb21cd6c?w=800&q=80" && echo "✅ tax-loan.jpg" || echo "❌ Failed"
curl -sL -o products/credit-card.jpg "https://images.unsplash.com/photo-1556742049-0cfed4f6a45d?w=800&q=80" && echo "✅ credit-card.jpg" || echo "❌ Failed"
curl -sL -o products/investment.jpg "https://images.unsplash.com/photo-1611974789855-9c2a0a7236a3?w=800&q=80" && echo "✅ investment.jpg" || echo "❌ Failed"
curl -sL -o products/mobile-banking.jpg "https://images.unsplash.com/photo-1512941937669-90a1b58e7e9c?w=800&q=80" && echo "✅ mobile-banking.jpg" || echo "❌ Failed"
curl -sL -o products/savings.jpg "https://images.unsplash.com/photo-1579621970563-ebec7560ff3e?w=800&q=80" && echo "✅ savings.jpg" || echo "❌ Failed"
curl -sL -o products/mortgage.jpg "https://images.unsplash.com/photo-1560518883-ce09059eeffa?w=800&q=80" && echo "✅ mortgage.jpg" || echo "❌ Failed"
curl -sL -o products/insurance.jpg "https://images.unsplash.com/photo-1454165804606-c3d57bc86b40?w=800&q=80" && echo "✅ insurance.jpg" || echo "❌ Failed"

# Banner Images
echo ""
echo "📥 Downloading Banner images..."
curl -sL -o banners/new-customer.jpg "https://images.unsplash.com/photo-1513151233558-d860c5398176?w=1200&q=80" && echo "✅ new-customer.jpg" || echo "❌ Failed"
curl -sL -o banners/retirement.jpg "https://images.unsplash.com/photo-1571260899304-425eee4c7efc?w=1200&q=80" && echo "✅ retirement.jpg" || echo "❌ Failed"

# Device Mockups
echo ""
echo "📥 Downloading Device mockups..."
curl -sL -o pages/smartphone-mockup.png "https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?w=800&q=80" && echo "✅ smartphone-mockup.png" || echo "❌ Failed"
curl -sL -o pages/tablet-mockup.png "https://images.unsplash.com/photo-1544244015-0df4b3ffc6b0?w=1000&q=80" && echo "✅ tablet-mockup.png" || echo "❌ Failed"
curl -sL -o pages/desktop-mockup.png "https://images.unsplash.com/photo-1498050108023-c5249f4df085?w=1200&q=80" && echo "✅ desktop-mockup.png" || echo "❌ Failed"

cd ..

echo ""
echo "✅ Image download complete!"
echo ""
echo "📊 Summary:"
ls -lh hero/ products/ banners/ pages/ 2>/dev/null | grep -E "\.jpg|\.png" | wc -l | xargs -I {} echo "   {} images downloaded"
echo ""
echo "🎨 Images are ready to use!"
