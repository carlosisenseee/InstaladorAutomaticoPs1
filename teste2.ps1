Write-Host "Instalando MicroSIP"
Start-Process -FilePath "\\fs01\informatica$\PROGRAMA ADVOGADOS\3 - DISCADORES\MicroSIP-Lite-3.21.6.exe" -ArgumentList "/S /SUPPRESSMSGBOXES"
Write-Host "MicroSIP instalado"

Write-Host "Instalando Driver 1"
Start-Process -FilePath "\\fs01\informatica$\PROGRAMA ADVOGADOS\5 - DRIVER CERTIFICADO\certisign10.6-x64-10.6.exe"  -ArgumentList "/SILENT" -Wait
Write-Host "Driver 1 Instalado"

Write-Host "Instalando Driver 2"
Start-Process -FilePath "\\fs01\informatica$\PROGRAMA ADVOGADOS\5 - DRIVER CERTIFICADO\GDsetupStarsignCUTx64.exe"  -ArgumentList "/SILENT" -Wait
Write-Host "Driver 2 Instalado"

Write-Host "Instalando Driver 3"
Start-Process -FilePath "\\fs01\informatica$\PROGRAMA ADVOGADOS\5 - DRIVER CERTIFICADO\SafeSignIC30124-x64-win-tu-admin.exe"  -ArgumentList "/SILENT" -Wait
Write-Host "Driver 3 Instalado"

Write-Host "Instalando Java"
Start-Process -FilePath "\\fs01\informatica$\PROGRAMA ADVOGADOS\6 - JAVA\jre-8u451-windows-i586.exe"  -ArgumentList "/SILENT" -Wait
Write-Host "Java Instalado"

Write-Host "Instalando TeamViewer"
Start-Process -FilePath "\\fs01\informatica$\PROGRAMA ADVOGADOS\7 - NAVEGADORES E PJE TJRS SHODO\04 - TeamViewer_Setup_x64.exe"  -ArgumentList "/SILENT" -Wait
Write-Host "TeamViewer Instalado"

Write-Host "Instalando Bitdefender"
Start-Process -FilePath "\\fs01\informatica$\PROGRAMA ADVOGADOS\16 - ANTIVIRUS\Bitdefender Business - Uso Geral\epskit_x64_7.9.22.537\epskit_x64.exe" -Wait
Write-Host "Bitdefender instalado"

# Desinstala Revo

Start-Process "C:\Program Files\Revo Uninstaller\unins000.exe" -ArgumentList "/SILENT" -Wait

# Código para procurar programas instalados
# Write-Host "Verificando programas instalados..."
# Get-WmiObject -Class Win32_Product | Where-Object { $_.Name -like "*nome do programa*" }

# Exemplo de desinstalação (descomente se necessário)
# Write-Host "Desinstalando Chrome..."
# (Get-WmiObject -Class Win32_Product | Where-Object { $_.Name -like "*Chrome*" }).Uninstall()

Write-Host "Todas as instalações finalizadas com sucesso!"
