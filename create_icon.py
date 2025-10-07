#!/usr/bin/env python3

from PIL import Image, ImageDraw, ImageFont
import math

def create_app_icon():
    # Create 1024x1024 image
    size = 1024
    img = Image.new('RGB', (size, size), color='#E1AFD1')
    draw = ImageDraw.Draw(img)
    
    # Draw book shape
    book_margin = int(size * 0.2)
    book_width = int(size * 0.6)
    book_height = int(size * 0.5)
    book_x = book_margin
    book_y = int(size * 0.25)
    
    # White book background
    draw.rounded_rectangle(
        [(book_x, book_y), (book_x + book_width, book_y + book_height)],
        radius=20,
        fill='white',
        outline='#AD5389',
        width=8
    )
    
    # Book spine (vertical line in middle)
    spine_x = size // 2
    draw.line(
        [(spine_x, book_y), (spine_x, book_y + book_height)],
        fill='#AD5389',
        width=4
    )
    
    # Add sparkles/stars
    sparkle_positions = [
        (int(size * 0.3), int(size * 0.3)),
        (int(size * 0.7), int(size * 0.35)),
        (int(size * 0.35), int(size * 0.65)),
        (int(size * 0.65), int(size * 0.7)),
    ]
    
    for x, y in sparkle_positions:
        # Draw star shape
        star_size = 20
        points = []
        for i in range(8):
            angle = (i * 45) * math.pi / 180
            radius = star_size if i % 2 == 0 else star_size // 2
            px = x + int(radius * math.cos(angle))
            py = y + int(radius * math.sin(angle))
            points.append((px, py))
        draw.polygon(points, fill='#FFD700')
    
    # Save main icon
    img.save('assets/icon/app_icon.png')
    
    # Create foreground (transparent background version)
    img_fg = Image.new('RGBA', (size, size), color=(0, 0, 0, 0))
    draw_fg = ImageDraw.Draw(img_fg)
    
    # Draw book on transparent background
    draw_fg.rounded_rectangle(
        [(book_x, book_y), (book_x + book_width, book_y + book_height)],
        radius=20,
        fill='white',
        outline='#AD5389',
        width=8
    )
    
    draw_fg.line(
        [(spine_x, book_y), (spine_x, book_y + book_height)],
        fill='#AD5389',
        width=4
    )
    
    for x, y in sparkle_positions:
        star_size = 20
        points = []
        for i in range(8):
            angle = (i * 45) * math.pi / 180
            radius = star_size if i % 2 == 0 else star_size // 2
            px = x + int(radius * math.cos(angle))
            py = y + int(radius * math.sin(angle))
            points.append((px, py))
        draw_fg.polygon(points, fill='#FFD700')
    
    img_fg.save('assets/icon/app_icon_foreground.png')
    
    print("✅ App icons created successfully!")
    print("📁 Main icon: assets/icon/app_icon.png")
    print("📁 Foreground icon: assets/icon/app_icon_foreground.png")

if __name__ == '__main__':
    try:
        create_app_icon()
    except ImportError:
        print("❌ PIL (Pillow) not installed")
        print("Install with: pip3 install Pillow")
    except Exception as e:
        print(f"❌ Error: {e}")

