Write-Host "Instalando MicroSIP"
Start-Process -FilePath "C:\MicroSIP-Lite-3.21.6.exe" -ArgumentList "/S /SUPPRESSMSGBOXES"
Write-Host "MicroSIP instalado"

Write-Host "Instalando Driver 1"
Start-Process -FilePath "\\fs01\informatica$\PROGRAMA ADVOGADOS\5 - DRIVER CERTIFICADO\certisign10.6-x64-10.6.exe"  -ArgumentList "/s" -Wait
# tentar tambem \silent em caso de não funcionar nos drivers
Write-Host "Driver 1 Instalado"

Write-Host "Instalando Driver 2"
Start-Process -FilePath "\\fs01\informatica$\PROGRAMA ADVOGADOS\5 - DRIVER CERTIFICADO\GDsetupStarsignCUTx64.exe"  -ArgumentList "/s" -Wait
Write-Host "Driver 2 Instalado"

Write-Host "Instalando Driver 3"
Start-Process -FilePath "\\fs01\informatica$\PROGRAMA ADVOGADOS\5 - DRIVER CERTIFICADO\SafeSignIC30124-x64-win-tu-admin.exe"  -ArgumentList "/s" -Wait
Write-Host "Driver 3 Instalado"

Write-Host "Instalando Java"
Start-Process -FilePath "\\fs01\informatica$\PROGRAMA ADVOGADOS\6 - JAVA\jre-8u451-windows-i586.exe"  -ArgumentList "/s" -Wait
Write-Host "Java Instalado"

Write-Host "Instalando TeamViewer"
Start-Process -FilePath "\\fs01\informatica$\PROGRAMA ADVOGADOS\7 - NAVEGADORES E PJE TJRS SHODO\04 - TeamViewer_Setup_x64.exe"  -ArgumentList "/S" -Wait
Write-Host "TeamViewer Instalado"

Write-Host "Instalando Bitdefender"
Start-Process -FilePath "\\fs01\informatica$\PROGRAMA ADVOGADOS\16 - ANTIVIRUS\Bitdefender Business - Uso Geral\epskit_x64_7.9.22.537\epskit_x64.exe" -Wait
# Se o instalador foi gerado pelo GravityZone, use: 
# powershell -ArgumentList "--silent"
Write-Host "Bitdefender instalado"

Write-Host "Desinstalando Revo"
Start-Process "C:\Program Files\VS Revo Group\Revo Uninstaller\unins000.exe" -ArgumentList "/VERYSILENT /NORESTART" -Wait

Write-Host "Todas as instalações finalizadas com sucesso!"

# Versao com administrador

Write-Host "Instalando MicroSIP"
Start-Process -FilePath "C:\MicroSIP-Lite-3.21.6.exe" -ArgumentList "/S /SUPPRESSMSGBOXES" -Verb RunAs
Write-Host "MicroSIP instalado"

Write-Host "Instalando Driver 1"
Start-Process -FilePath "\\fs01\informatica$\PROGRAMA ADVOGADOS\5 - DRIVER CERTIFICADO\certisign10.6-x64-10.6.exe" -ArgumentList "/s" -Verb RunAs -Wait
Write-Host "Driver 1 Instalado"

Write-Host "Instalando Driver 2"
Start-Process -FilePath "\\fs01\informatica$\PROGRAMA ADVOGADOS\5 - DRIVER CERTIFICADO\GDsetupStarsignCUTx64.exe" -ArgumentList "/s" -Verb RunAs -Wait
Write-Host "Driver 2 Instalado"

Write-Host "Instalando Driver 3"
Start-Process -FilePath "\\fs01\informatica$\PROGRAMA ADVOGADOS\5 - DRIVER CERTIFICADO\SafeSignIC30124-x64-win-tu-admin.exe" -ArgumentList "/s" -Verb RunAs -Wait
Write-Host "Driver 3 Instalado"

Write-Host "Instalando Java"
Start-Process -FilePath "\\fs01\informatica$\PROGRAMA ADVOGADOS\6 - JAVA\jre-8u451-windows-i586.exe" -ArgumentList "/s" -Verb RunAs -Wait
Write-Host "Java Instalado"

Write-Host "Instalando TeamViewer"
Start-Process -FilePath "\\fs01\informatica$\PROGRAMA ADVOGADOS\7 - NAVEGADORES E PJE TJRS SHODO\04 - TeamViewer_Setup_x64.exe" -ArgumentList "/S" -Verb RunAs -Wait
Write-Host "TeamViewer Instalado"

Write-Host "Instalando Bitdefender"
Start-Process -FilePath "\\fs01\informatica$\PROGRAMA ADVOGADOS\16 - ANTIVIRUS\Bitdefender Business - Uso Geral\epskit_x64_7.9.22.537\epskit_x64.exe" -Verb RunAs -Wait
Write-Host "Bitdefender instalado"

Write-Host "Desinstalando Revo"
Start-Process -FilePath "C:\Program Files\VS Revo Group\Revo Uninstaller\unins000.exe" -ArgumentList "/VERYSILENT /NORESTART" -Verb RunAs -Wait

Write-Host "Todas as instalações finalizadas com sucesso!"

