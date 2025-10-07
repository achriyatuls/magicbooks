#!/bin/bash

# Create icon directory
mkdir -p assets/icon

# Check if ImageMagick is installed
if command -v convert &> /dev/null; then
    echo "Creating app icon with ImageMagick..."
    
    # Create main icon (1024x1024)
    convert -size 1024x1024 xc:"#E1AFD1" \
        -fill white -draw "roundrectangle 200,250 824,774 20,20" \
        -fill "#AD5389" -draw "line 512,250 512,774" \
        -strokewidth 8 -stroke "#AD5389" -fill none -draw "roundrectangle 200,250 824,774 20,20" \
        -fill "#FFD700" -draw "circle 300,300 308,308" \
        -fill "#FFD700" -draw "circle 724,350 732,358" \
        -fill "#FFD700" -draw "circle 350,674 358,682" \
        -fill "#FFD700" -draw "circle 674,724 682,732" \
        assets/icon/app_icon.png
    
    # Create foreground icon
    cp assets/icon/app_icon.png assets/icon/app_icon_foreground.png
    
    echo "✅ Icon created successfully!"
else
    echo "ImageMagick not installed. Creating simple icon..."
    
    # Fallback: Use existing Flutter icon and modify it
    echo "Please install ImageMagick or create icon manually"
    echo "Run: brew install imagemagick"
fi

