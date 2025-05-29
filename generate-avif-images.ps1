# PowerShell script to generate AVIF images with QUALITY COMPARISON
# Generates 60%, 75%, and 85% quality versions for testing
# Requires ImageMagick: https://imagemagick.org/script/download.php#windows

$teamMembers = @{
    "zeenet-scarborough" = @{
        "baseWidth" = 480
        "baseHeight" = 612
        "originalFile" = "assets/images/team/zeenet-scarborough.jpg"
    }
    "ali-todd" = @{
        "baseWidth" = 300
        "baseHeight" = 382
        "originalFile" = "assets/images/team/ali-todd.jpg"
    }
    "crystal-wilcox" = @{
        "baseWidth" = 300
        "baseHeight" = 382
        "originalFile" = "assets/images/team/crystal-wilcox.jpg"
    }
}

$resolutions = @(100, 120, 140, 160, 180, 200)
$qualityLevels = @(60, 75, 85)

Write-Host "AVIF QUALITY COMPARISON GENERATOR" -ForegroundColor Green
Write-Host "Generating 60%, 75%, and 85% quality versions" -ForegroundColor Yellow
Write-Host "Pipeline: Lanczos + Unsharp Mask + Multiple Quality Levels" -ForegroundColor Cyan

foreach ($member in $teamMembers.Keys) {
    $memberData = $teamMembers[$member]
    $originalFile = $memberData.originalFile
    
    Write-Host "`nProcessing: $member" -ForegroundColor Cyan
    
    if (-not (Test-Path $originalFile)) {
        Write-Host "  ERROR: $originalFile not found" -ForegroundColor Red
        continue
    }
    
    foreach ($quality in $qualityLevels) {
        Write-Host "`n  Quality: $quality%" -ForegroundColor Yellow
        
        foreach ($resolution in $resolutions) {
            $width = [math]::Round($memberData.baseWidth * $resolution / 100)
            $height = [math]::Round($memberData.baseHeight * $resolution / 100)
            
            if ($resolution -eq 100) {
                $outputFile = "assets/images/team/$member-q$quality.avif"
            } else {
                $outputFile = "assets/images/team/$member-$resolution-q$quality.avif"
            }
            
            Write-Host "    Creating $outputFile (${width}x${height}px)..." -ForegroundColor White
            
            $magickCmd = "magick `"$originalFile`" -colorspace sRGB -filter Lanczos -resize ${width}x${height}^ -gravity center -extent ${width}x${height} -unsharp 0x1+1.0+0.05 -quality $quality `"$outputFile`""
            
            try {
                Invoke-Expression $magickCmd
                
                if (Test-Path $outputFile) {
                    $fileSize = [math]::Round((Get-Item $outputFile).Length / 1KB, 1)
                    Write-Host "      SUCCESS! ${fileSize}KB (Q$quality)" -ForegroundColor Green
                } else {
                    Write-Host "      FAILED" -ForegroundColor Red
                }
            }
            catch {
                Write-Host "      ERROR: $($_.Exception.Message)" -ForegroundColor Red
            }
        }
    }
}

Write-Host "`n🎉 QUALITY COMPARISON COMPLETE!" -ForegroundColor Green
Write-Host "Generated files with -q60, -q75, -q85 suffixes" -ForegroundColor Yellow
Write-Host "Compare file sizes and visual quality to find optimal setting" -ForegroundColor Cyan 