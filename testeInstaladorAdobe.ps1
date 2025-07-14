Write-Host "Instalando Adobe"
Start-Process -FilePath "C:\Instaladores\AcroRdrDC2300620399_en_US.exe" -ArgumentList "/sAll /rs /rps /msi EULA_ACCEPT=YES DISABLE_LAUNCH=YES" -Wait
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

# Caminho do executável do CPJ (alvo do atalho)
$sourceCPJ = "C:\Arquivos de Programas\CPJ\cpj.exe"

# Cria um objeto COM do Windows Script Host, que permite criar atalhos
$WScriptShell = New-Object -ComObject WScript.Shell

# Define o caminho para a Área de Trabalho Pública (visível a todos os usuários)
$publicDesktop = "$env:PUBLIC\Desktop"

# Define o caminho completo onde o atalho será salvo
$shortcutPath = Join-Path $publicDesktop "CPJ.lnk"

# Cria o atalho (ainda não salvo fisicamente)
$shortcut = $WScriptShell.CreateShortcut($shortcutPath)

# Define o caminho do executável que o atalho irá apontar
$shortcut.TargetPath = $sourceCPJ

# Define o diretório de trabalho ao executar o atalho (geralmente o mesmo do executável)
$shortcut.WorkingDirectory = "C:\Arquivos de Programas\CPJ"

# Define o estilo da janela ao abrir: 1 = normal, 3 = maximizada, 7 = minimizada
$shortcut.WindowStyle = 1

# Define a descrição do atalho (visível nas propriedades do atalho)
$shortcut.Description = "CPJ - Atalho"

# Salva o atalho no local definido
$shortcut.Save()

Write-Host "Atalho do CPJ criado na área de trabalho pública"

Write-Host "Processo finalizado com sucesso!"
