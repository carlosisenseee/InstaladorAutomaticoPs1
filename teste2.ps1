Write-Host "Instalando MicroSIP"
Start-Process -FilePath "\\fs01\informatica$\PROGRAMA ADVOGADOS\3 - DISCADORES\MicroSIP-Lite-3.21.6.exe" -ArgumentList "/S /SUPPRESSMSGBOXES"
Start-Sleep -Seconds 20
Write-Host "MicroSIP instalado"

Write-Host "Instalando Driver 1"
Start-Process -FilePath "\\fs01\informatica$\PROGRAMA ADVOGADOS\5 - DRIVER CERTIFICADO\certisign10.6-x64-10.6.exe"
Write-Host "Driver 1 Instalado"

Write-Host "Instalando Driver 2"
Start-Process -FilePath "\\fs01\informatica$\PROGRAMA ADVOGADOS\5 - DRIVER CERTIFICADO\GDsetupStarsignCUTx64.exe"
Write-Host "Driver 2 Instalado"

Write-Host "Instalando Driver 3"
Start-Process -FilePath "\\fs01\informatica$\PROGRAMA ADVOGADOS\5 - DRIVER CERTIFICADO\SafeSignIC30124-x64-win-tu-admin.exe"
Write-Host "Driver 3 Instalado"

Write-Host "Instalando Java"
Start-Process -FilePath "\\fs01\informatica$\PROGRAMA ADVOGADOS\6 - JAVA\jre-8u451-windows-i586.exe"
Write-Host "Java Instalado"

Write-Host "Instalando TeamViwer"
Start-Process -FilePath "\\fs01\informatica$\PROGRAMA ADVOGADOS\"

Write-Host "Instalando Bitdefender"
Start-Process -FilePath "\\fs01\informatica$\PROGRAMA ADVOGADOS\16 - ANTIVIRUS\Bitdefender Business - Uso Geral\epskit_x64_7.9.22.537\epskit_x64.exe"
Write-Host "Bitdefender instalado"

# Codigo para procurar o programa e desinstalar ele, TESTE:
Get-WmiObject -Class Win32_Product | Where-Object { $_.Name -like "*nome do programa*" }

# Desinstalar
(Get-WmiObject -Class Win32_Product | Where-Object { $_.Name -like "*Chrome*" }).Uninstall()

Write-Host "Instalações Finalizadas"