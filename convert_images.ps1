# Convert images to WebP format
$imagesDir = "assets\images"

$images = @(
    "apple-touch-icon.png",
    "avatar-dima.png",
    "favicon.png",
    "og-preview.jpg",
    "project-autoflow.jpg",
    "project-brandforge.jpg",
    "project-chatpilot.jpg",
    "project-neurocrm.jpg"
)

Write-Host "Converting images to WebP..." -ForegroundColor Green

foreach ($image in $images) {
    $input = Join-Path $imagesDir $image
    $output = $input -replace '\.(jpg|png)$', '.webp'
    
    if (Test-Path $input) {
        Write-Host "Converting: $image" -ForegroundColor Cyan
        
        # Use magick from Program Files
        & "C:\Program Files\ImageMagick-7.1.2-Q16-HDRI\magick.exe" convert "$input" -quality 85 "$output"
        
        if (Test-Path $output) {
            Write-Host "  Created: $output" -ForegroundColor Green
        }
    }
}

Write-Host ""
Write-Host "Conversion complete!" -ForegroundColor Green
