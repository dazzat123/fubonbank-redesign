#!/usr/bin/env python3
"""
Fubon Bank Website - Link Checker
Checks all HTML files for broken links
"""

import os
import re
from pathlib import Path

def check_links():
    base_dir = Path('/root/.openclaw/workspace/fubonbank-redesign')
    broken_links = []
    
    # Get all HTML files
    html_files = list(base_dir.rglob('*.html'))
    
    print(f"🔍 Checking {len(html_files)} HTML files...\n")
    
    for html_file in html_files:
        rel_path = html_file.relative_to(base_dir)
        file_dir = html_file.parent
        
        with open(html_file, 'r', encoding='utf-8') as f:
            content = f.read()
        
        # Find all href links
        links = re.findall(r'href="([^"]+)"', content)
        
        for link in links:
            # Skip external links, anchors, and tel/mailto
            if link.startswith(('http', 'https', '#', 'tel:', 'mailto:')):
                continue
            
            # Remove query strings and anchors
            link_path = link.split('?')[0].split('#')[0]
            
            # Resolve relative path
            if link_path.startswith('/'):
                target = base_dir / link_path[1:]
            else:
                target = file_dir / link_path
            
            # Check if file exists
            if not target.exists():
                broken_links.append({
                    'file': str(rel_path),
                    'link': link,
                    'target': str(target)
                })
    
    return broken_links

if __name__ == '__main__':
    broken = check_links()
    
    if broken:
        print(f"❌ Found {len(broken)} broken links:\n")
        for item in broken:
            print(f"📄 {item['file']}")
            print(f"   🔗 {item['link']}")
            print(f"   ❌ {item['target']}\n")
    else:
        print("✅ All links are valid!")
    
    print(f"\n📊 Total broken links: {len(broken)}")
