# Team Image Optimization Guide

## Current Situation
- Original images: 2384 × 3040px (839-573 kB each)
- Correct aspect ratio: 1.275 (3040 ÷ 2384)
- Target display sizes: Zeenet 240×306px, Staff 150×191px

## Required Image Sizes

### Zeenet (Director) - zeenet-scarborough.jpg
Base retina size: **480 × 612px**
- `zeenet-scarborough.avif` (480×612px) - 100% Retina
- `zeenet-scarborough-120.avif` (576×735px) - 120%
- `zeenet-scarborough-140.avif` (672×857px) - 140%
- `zeenet-scarborough-160.avif` (768×979px) - 160%
- `zeenet-scarborough-180.avif` (864×1102px) - 180%
- `zeenet-scarborough-200.avif` (960×1224px) - 200%

### Ali Todd - ali-todd.jpg
Base retina size: **300 × 382px**
- `ali-todd.avif` (300×382px) - 100% Retina
- `ali-todd-120.avif` (360×459px) - 120%
- `ali-todd-140.avif` (420×536px) - 140%
- `ali-todd-160.avif` (480×612px) - 160%
- `ali-todd-180.avif` (540×689px) - 180%
- `ali-todd-200.avif` (600×765px) - 200%

### Crystal Wilcox - crystal-wilcox.jpg
Base retina size: **300 × 382px**
- `crystal-wilcox.avif` (300×382px) - 100% Retina
- `crystal-wilcox-120.avif` (360×459px) - 120%
- `crystal-wilcox-140.avif` (420×536px) - 140%
- `crystal-wilcox-160.avif` (480×612px) - 160%
- `crystal-wilcox-180.avif` (540×689px) - 180%
- `crystal-wilcox-200.avif` (600×765px) - 200%

## Step-by-Step Process

### 1. Calculate Crop Area from Original (2384×3040px)
- **Zeenet needs**: Any 480×612px crop from original
- **Staff need**: Any 300×382px crop from original
- Maintain 1.275 aspect ratio throughout

### 2. Export Settings for Maximum Quality & Sharpness
- **Format**: AVIF
- **Quality**: 70-80% (higher for maximum quality)
- **Color Profile**: sRGB
- **Resampling**: Lanczos filter (best quality downscaling)
- **Sharpening**: Unsharp Mask (0x1+1.0+0.05) for enhanced edge definition
- **Processing**: Enhanced sharpness pipeline for crisp results

### 3. Testing Process
1. Start with 100% retina versions first
2. Test the toggle button on the team page
3. Create higher resolution versions (120%, 140%, etc.)
4. Use the button to compare sharpness vs file size
5. Find the sweet spot where images look crisp

### 4. Expected File Sizes (High-Quality AVIF)
- **300×382px**: ~8-15 kB
- **480×612px**: ~15-25 kB
- **600×765px**: ~20-35 kB

This is still a **92%+ reduction** from your current 573-839 kB files while maintaining maximum sharpness!

## Current Status
✅ Fixed JavaScript - no more invalid filenames
✅ High-quality AVIF support with enhanced sharpness
✅ Added data-base-path for reliable source switching
✅ Console logging for debugging
✅ Lanczos resampling + Unsharp Mask for maximum quality

**Next**: Use the PowerShell script (generate-avif-images.ps1) which implements the enhanced sharpness pipeline to create all AVIF sizes and test with the resolution toggle!