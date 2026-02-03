# PowerShell script to download all external images
$images = @(
    # Hero section images
    @{url="https://cdn.prod.website-files.com/6916200346ddd8428d3d953b/694acbd1fd3b69e36abdbadf_3aaca6b01ad60144a5d1ac71abffd7e8_Row-1.webp"; name="hero-row-1.webp"},
    @{url="https://cdn.prod.website-files.com/6916200346ddd8428d3d953b/694acbd1693018395959ff91_d762a490e1845a1308228ba6214ce880_row-2.webp"; name="hero-row-2.webp"},
    @{url="https://cdn.prod.website-files.com/6916200346ddd8428d3d953b/694acbd173b4d0c3cbb29ba7_d7c3d369d08532eecc0459f7239e8b3c_Row-3.webp"; name="hero-row-3.webp"},
    
    # Project images
    @{url="https://cdn.prod.website-files.com/6916200346ddd8428d3d953b/6943fa79cd8edda6c64e7dfe_c0c70d0f9c5313152a5c3b1128d0f681_skyhall.webp"; name="project-skyhall.webp"},
    @{url="https://cdn.prod.website-files.com/6916200346ddd8428d3d953b/694fd1f7deb1df63bb503e07_svitlo-pewview.webp"; name="project-svitlo.webp"},
    @{url="https://cdn.prod.website-files.com/6916200346ddd8428d3d953b/695bebc9b81bbfeb8ced3bc3_5cfd112cf8c64dc9e4cca637ab5e0557_2084.webp"; name="project-2084.webp"},
    @{url="https://cdn.prod.website-files.com/6916200346ddd8428d3d953b/695bed529f434d6b6abda597_55cdc72f57552b16e05544214700146b_Tinder%20Dates.webp"; name="project-tinder-dates.webp"},
    
    # Folder and case previews
    @{url="https://cdn.prod.website-files.com/6916200346ddd8428d3d953b/693ab7ff48bdc2a0579654ca_1785bf94c22deaf6c17c771a623ee628_folder.svg"; name="folder-icon.svg"},
    @{url="https://cdn.prod.website-files.com/6916200346ddd8428d3d953b/695d4962af1f8d8334a444a3_70717f0e925250d7b53965b411dc37b7_SkyTalks.webp"; name="case-skytalks.webp"},
    @{url="https://cdn.prod.website-files.com/6916200346ddd8428d3d953b/695d4a9c46de4ed8b54970ce_Classic.webp"; name="case-classic.webp"},
    @{url="https://cdn.prod.website-files.com/6916200346ddd8428d3d953b/695fb14ef115334018b2345c_0e500fc19a5f5f3ba8ad09a53b891b3d_Event%20Agency.webp"; name="case-event-agency.webp"},
    
    # Avatar and profile images
    @{url="https://cdn.prod.website-files.com/6916200346ddd8428d3d953b/6966773f9a6d1c05ac62e978_Rectangle%2023309.webp"; name="avatar-dima.png"},
    
    # Icons and illustrations
    @{url="https://cdn.prod.website-files.com/6916200346ddd8428d3d953b/69166462d3939e43684fd604_user-icon-red.svg"; name="icon-user-red.svg"},
    @{url="https://cdn.prod.website-files.com/6916200346ddd8428d3d953b/691b8bb319df592267e41e63_ads-cpc.svg"; name="icon-ads-cpc.svg"},
    @{url="https://cdn.prod.website-files.com/6916200346ddd8428d3d953b/69166ccb6134912a792bf256_rating-frame.svg"; name="icon-rating-frame.svg"},
    @{url="https://cdn.prod.website-files.com/6916200346ddd8428d3d953b/69166e1f2e8b0e8b2e1e0a0c_shield.svg"; name="icon-shield.svg"},
    @{url="https://cdn.prod.website-files.com/6916200346ddd8428d3d953b/69166f0b7b8e0e8b2e1e1234_mobile.svg"; name="icon-mobile.svg"},
    
    # Lottie animations
    @{url="https://cdn.prod.website-files.com/6916200346ddd8428d3d953b/691663a40368c37b49ef91c5_Artboard%201.lottie"; name="animation-conversion.lottie"},
    @{url="https://cdn.prod.website-files.com/6916200346ddd8428d3d953b/691b89fc75241096c2a987dd_83ed9911083a6dbdb0d18dad8c1126e0_Radial-loading.lottie"; name="animation-radial-loading.lottie"},
    @{url="https://cdn.prod.website-files.com/6916200346ddd8428d3d953b/6916710a7b8e0e8b2e1e2345_globe.lottie"; name="animation-globe.lottie"}
)

$outputDir = "assets\images"

foreach ($img in $images) {
    $outputPath = Join-Path $outputDir $img.name
    Write-Host "Downloading: $($img.name)..." -ForegroundColor Cyan
    try {
        Invoke-WebRequest -Uri $img.url -OutFile $outputPath -ErrorAction Stop
        Write-Host "  ✓ Downloaded successfully" -ForegroundColor Green
    } catch {
        Write-Host "  ✗ Failed: $_" -ForegroundColor Red
    }
}

Write-Host ""
Write-Host "Download complete!" -ForegroundColor Green
