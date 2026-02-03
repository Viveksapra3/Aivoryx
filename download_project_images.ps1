# PowerShell script to download project images from Unsplash
$outputDir = "assets/images"

if (-not (Test-Path $outputDir)) {
    New-Item -ItemType Directory -Path $outputDir -Force | Out-Null
}

Write-Host "Downloading project images..." -ForegroundColor Green

# Project 1: NeuroCRM
$url1 = "https://images.unsplash.com/photo-1551288049-bebda4e38f71?w=1200`&h=800`&fit=crop`&q=80"
Invoke-WebRequest -Uri $url1 -OutFile "$outputDir\project-neurocrm.jpg" -UseBasicParsing
Write-Host "Downloaded: project-neurocrm.jpg" -ForegroundColor Cyan

# Project 2: ChatPilot AI
$url2 = "https://images.unsplash.com/photo-1587560699334-cc4ff634909a?w=1200`&h=800`&fit=crop`&q=80"
Invoke-WebRequest -Uri $url2 -OutFile "$outputDir\project-chatpilot.jpg" -UseBasicParsing
Write-Host "Downloaded: project-chatpilot.jpg" -ForegroundColor Cyan

# Project 3: AutoFlow
$url3 = "https://images.unsplash.com/photo-1460925895917-afdab827c52f?w=1200`&h=800`&fit=crop`&q=80"
Invoke-WebRequest -Uri $url3 -OutFile "$outputDir\project-autoflow.jpg" -UseBasicParsing
Write-Host "Downloaded: project-autoflow.jpg" -ForegroundColor Cyan

# Project 4: BrandForge
$url4 = "https://images.unsplash.com/photo-1561070791-2526d30994b5?w=1200`&h=800`&fit=crop`&q=80"
Invoke-WebRequest -Uri $url4 -OutFile "$outputDir\project-brandforge.jpg" -UseBasicParsing
Write-Host "Downloaded: project-brandforge.jpg" -ForegroundColor Cyan

Write-Host ""
Write-Host "All images downloaded successfully!" -ForegroundColor Green
