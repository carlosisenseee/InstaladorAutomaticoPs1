# Script básico para instalar aplicativos da rede
param(
    [string]$CaminhoRede = "C:\Users\Carlos\Downloads\python-3.13.2-amd64.exe"
)

Write-Host "=== Iniciando instalação automática ===" -ForegroundColor Green

# Verificar se consegue acessar a rede
if (Test-Path $CaminhoRede) {
    Write-Host "Acesso à rede OK: $CaminhoRede" -ForegroundColor Green
} else {
    Write-Host "Erro: Não consegue acessar $CaminhoRede" -ForegroundColor Red
    exit
}

# Lista de aplicativos para instalar
$aplicativos = @{
    "Python" = "python-3.13.2-amd64.exe"
}

# Instalar cada aplicativo
foreach ($app in $aplicativos.GetEnumerator()) {
    $nomeApp = $app.Key
    $arquivo = $app.Value
    $caminhoCompleto = "$CaminhoRede\$arquivo"
    
    Write-Host "Verificando $nomeApp..." -ForegroundColor Yellow
    
    if (Test-Path $caminhoCompleto) {
        Write-Host "Instalando $nomeApp..." -ForegroundColor Cyan
        
        # Copiar para pasta temporária
        $tempFile = "$env:TEMP\$arquivo"
        Copy-Item $caminhoCompleto $tempFile
        
        # Instalar baseado na extensão
        if ($arquivo.EndsWith(".msi")) {
            Start-Process -FilePath "msiexec.exe" -ArgumentList "/i `"$tempFile`" /quiet" -Wait
        } else {
            Start-Process -FilePath $tempFile -ArgumentList "/S" -Wait
        }
        
        # Limpar arquivo temporário
        Remove-Item $tempFile -ErrorAction SilentlyContinue
        
        Write-Host "$nomeApp instalado com sucesso!" -ForegroundColor Green
        
    } else {
        Write-Host "Arquivo não encontrado: $arquivo" -ForegroundColor Red
    }
}

Write-Host "=== Instalação concluída ===" -ForegroundColor Green