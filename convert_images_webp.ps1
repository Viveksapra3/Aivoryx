# PowerShell script to convert images to WebP using System.Drawing
# This script uses built-in .NET libraries

Add-Type -AssemblyName System.Drawing

function Convert-ImageToWebP {
    param(
        [string]$InputPath,
        [string]$OutputPath
    )
    
    try {
        # For WebP conversion without external tools, we'll use a workaround
        # Since .NET doesn't natively support WebP, we'll download a converter
        
        $webpConverterUrl = "https://developers.google.com/speed/webp/download"
        
        Write-Host "Note: Native WebP conversion requires external tools." -ForegroundColor Yellow
        Write-Host "Recommended: Install ImageMagick or use online converter" -ForegroundColor Yellow
        
        return $false
    }
    catch {
        Write-Host "Error: $($_.Exception.Message)" -ForegroundColor Red
        return $false
    }
}

Write-Host "============================================" -ForegroundColor Cyan
Write-Host "  WebP Conversion Guide" -ForegroundColor Cyan
Write-Host "============================================" -ForegroundColor Cyan
Write-Host ""

Write-Host "Images to convert:" -ForegroundColor Green
Write-Host "  - apple-touch-icon.png" -ForegroundColor Gray
Write-Host "  - avatar-dima.png" -ForegroundColor Gray
Write-Host "  - favicon.png" -ForegroundColor Gray
Write-Host "  - og-preview.jpg" -ForegroundColor Gray
Write-Host "  - project-autoflow.jpg" -ForegroundColor Gray
Write-Host "  - project-brandforge.jpg" -ForegroundColor Gray
Write-Host "  - project-chatpilot.jpg" -ForegroundColor Gray
Write-Host "  - project-neurocrm.jpg" -ForegroundColor Gray
Write-Host ""

Write-Host "Option 1: Install ImageMagick (Recommended)" -ForegroundColor Yellow
Write-Host "  Run: winget install ImageMagick.ImageMagick" -ForegroundColor Gray
Write-Host "  Then run: .\convert_to_webp.ps1" -ForegroundColor Gray
Write-Host ""

Write-Host "Option 2: Use Online Converter (Quick)" -ForegroundColor Yellow
Write-Host "  1. Visit: https://squoosh.app" -ForegroundColor Gray
Write-Host "  2. Drag and drop images from assets\images folder" -ForegroundColor Gray
Write-Host "  3. Select WebP format, quality 85" -ForegroundColor Gray
Write-Host "  4. Download and save back to assets\images" -ForegroundColor Gray
Write-Host ""

Write-Host "Option 3: Batch convert online" -ForegroundColor Yellow
Write-Host "  Visit: https://cloudconvert.com/jpg-to-webp" -ForegroundColor Gray
Write-Host ""

Write-Host "After conversion, I will update all HTML references automatically." -ForegroundColor Cyan
Write-Host ""

# Ask user which method they prefer
Write-Host "Would you like me to:" -ForegroundColor Green
Write-Host "  A) Install ImageMagick now (requires admin)" -ForegroundColor Gray
Write-Host "  B) Wait for you to convert manually" -ForegroundColor Gray
Write-Host ""
