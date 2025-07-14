Write-Host "Instalando Adobe"
Start-Process -FilePath "C:\Instaladores\AdobeSetup.exe" -ArgumentList "/sAll /rs /rps /msi EULA_ACCEPT=YES" -Wait
Write-Host "Adobe instalado"

Write-Host "Copiando arquivo de configuração para o Adobe"
$origem = "C:\Instaladores\config.xml"
$destino = "C:\Program Files (x86)\Adobe\Acrobat Reader DC\Reader\config.xml"

# Verifica se o diretório existe antes de copiar
if (Test-Path "C:\Program Files (x86)\Adobe\Acrobat Reader DC\Reader\") {
    Copy-Item -Path $origem -Destination $destino -Force
    Write-Host "Arquivo copiado com sucesso"
} else {
    Write-Host "❌ Caminho do Adobe não encontrado. Verifique a instalação."
}

Write-Host "Criando atalho do CPJ na área de trabalho pública"
$sourceCPJ = "C:\Arquivos de Programas\CPJ\cpj.exe"
$WScriptShell = New-Object -ComObject WScript.Shell
$publicDesktop = "$env:PUBLIC\Desktop"
$shortcutPath = Join-Path $publicDesktop "CPJ.lnk"

$shortcut = $WScriptShell.CreateShortcut($shortcutPath)
$shortcut.TargetPath = $sourceCPJ
$shortcut.WorkingDirectory = "C:\Arquivos de Programas\CPJ"
$shortcut.WindowStyle = 1
$shortcut.Description = "CPJ - Atalho"
$shortcut.Save()

Write-Host "Atalho do CPJ criado na área de trabalho pública"

Write-Host "Processo finalizado com sucesso!"
