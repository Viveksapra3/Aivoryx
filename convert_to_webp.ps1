# PowerShell script to convert JPG and PNG images to WebP format
# Excludes aivoryx_logo files

$imagesDir = "assets\images"

# List of images to convert (excluding aivoryx_logo)
$imagesToConvert = @(
    "apple-touch-icon.png",
    "avatar-dima.png",
    "favicon.png",
    "og-preview.jpg",
    "project-autoflow.jpg",
    "project-brandforge.jpg",
    "project-chatpilot.jpg",
    "project-neurocrm.jpg"
)

Write-Host "Starting image conversion to WebP format..." -ForegroundColor Green
Write-Host ""

# Check if magick (ImageMagick) is available
$magickAvailable = Get-Command magick -ErrorAction SilentlyContinue

if (-not $magickAvailable) {
    Write-Host "ImageMagick not found. Attempting to use online conversion method..." -ForegroundColor Yellow
    Write-Host ""
    Write-Host "Please install ImageMagick for local conversion:" -ForegroundColor Yellow
    Write-Host "  winget install ImageMagick.ImageMagick" -ForegroundColor Gray
    Write-Host ""
    Write-Host "Alternatively, you can use online tools like:" -ForegroundColor Yellow
    Write-Host "  - https://squoosh.app" -ForegroundColor Gray
    Write-Host "  - https://cloudconvert.com/jpg-to-webp" -ForegroundColor Gray
    Write-Host ""
    
    # Create a list file for manual conversion
    $listFile = "images_to_convert.txt"
    $imagesToConvert | ForEach-Object {
        "$imagesDir\$_" | Out-File -FilePath $listFile -Append -Encoding UTF8
    }
    
    Write-Host "Created list of images to convert: $listFile" -ForegroundColor Cyan
    exit 1
}

# Convert each image
foreach ($image in $imagesToConvert) {
    $inputPath = Join-Path $imagesDir $image
    $outputPath = $inputPath -replace '\.(jpg|png)$', '.webp'
    
    if (Test-Path $inputPath) {
        try {
            Write-Host "Converting: $image" -ForegroundColor Cyan
            
            # Convert to WebP with quality 85
            magick convert "$inputPath" -quality 85 "$outputPath"
            
            if (Test-Path $outputPath) {
                $originalSize = (Get-Item $inputPath).Length
                $newSize = (Get-Item $outputPath).Length
                $savings = [math]::Round((($originalSize - $newSize) / $originalSize) * 100, 2)
                
                Write-Host "  Created: $outputPath" -ForegroundColor Green
                Write-Host "  Size reduction: $savings%" -ForegroundColor Green
                Write-Host ""
            } else {
                Write-Host "  Failed to create WebP file" -ForegroundColor Red
                Write-Host ""
            }
        }
        catch {
            Write-Host "  Error: $($_.Exception.Message)" -ForegroundColor Red
            Write-Host ""
        }
    } else {
        Write-Host "File not found: $inputPath" -ForegroundColor Yellow
        Write-Host ""
    }
}

Write-Host "Conversion complete!" -ForegroundColor Green
Write-Host ""
Write-Host "Next steps:" -ForegroundColor Yellow
Write-Host "1. Verify the WebP files look correct" -ForegroundColor Gray
Write-Host "2. Update HTML references from .jpg/.png to .webp" -ForegroundColor Gray
Write-Host "3. Delete original JPG/PNG files if satisfied with WebP versions" -ForegroundColor Gray
