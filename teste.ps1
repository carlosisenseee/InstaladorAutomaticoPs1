# Script de Automacao para Instalacao de Programas - Versao Melhorada
# Autor: Carlos Alfredo
# Data: $(Get-Date -Format "dd/MM/yyyy HH:mm:ss")

# Configuração centralizada dos aplicativos
$aplicativos = @(
    @{
        nome = "MicroSIP"
        caminho = "\\fs01\informatica$\PROGRAMA ADVOGADOS\3 - DISCADORES\MicroSIP-Lite-3.21.6.exe"
        argumentos = @("/S")
        tempoEspera = 30
    },
    @{
        nome = "DriverCertificado1"
        caminho = "\\fs01\informatica$\PROGRAMA ADVOGADOS\5 - DRIVER CERTIFICADO\certisign10.6-x64-10.6.exe"
        argumentos = @("/quiet", "/norestart")
        tempoEspera = 5
    },
    @{
        nome = "DriverCertificado2"
        caminho = "\\fs01\informatica$\PROGRAMA ADVOGADOS\5 - DRIVER CERTIFICADO\GDsetupStarsignCUTx64.exe"
        argumentos = @("/quiet", "/norestart")
        tempoEspera = 5
    },
    @{
        nome = "DriverCertificado3"
        caminho = "\\fs01\informatica$\PROGRAMA ADVOGADOS\5 - DRIVER CERTIFICADO\SafeSignIC30124-x64-win-tu-admin.exe"
        argumentos = @("/quiet", "/norestart")
        tempoEspera = 5
    },
    @{
        nome = "Java"
        caminho = "\\fs01\informatica$\PROGRAMA ADVOGADOS\6 - JAVA\jre-8u451-windows-i586.exe"
        argumentos = @("/quiet", "/norestart")
        tempoEspera = 5
    },
    @{
        nome = "AntiVirus"
        caminho = "\\fs01\informatica$\PROGRAMA ADVOGADOS\16 - ANTIVIRUS\Bitdefender Business - Uso Geral\epskit_x64_7.9.22.537\epskit_x64.exe"
        argumentos = @("/quiet", "/norestart")
        tempoEspera = 5
    }
)

# Funcao para log com timestamp
function Write-Log {
    param (
        [string]$mensagem,
        [string]$tipo = "INFO"
    )
    $timestamp = Get-Date -Format "dd/MM/yyyy HH:mm:ss"
    $cor = switch ($tipo) {
        "INFO" { "White" }
        "SUCCESS" { "Green" }
        "WARNING" { "Yellow" }
        "ERROR" { "Red" }
        default { "White" }
    }
    Write-Host "[$timestamp] [$tipo] $mensagem" -ForegroundColor $cor
}

# Funcao para validar pre-requisitos
function Test-Prerequisites {
    Write-Log "Verificando pre-requisitos..."
    
    # Verificar se esta executando como administrador
    $isAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")
    if (-not $isAdmin) {
        Write-Log "ERRO: Script deve ser executado como Administrador" "ERROR"
        return $false
    }
    
    # Verificar conectividade com o servidor de arquivos
    $servidorArquivos = "\\fs01\informatica$"
    if (-not (Test-Path $servidorArquivos)) {
        Write-Log "ERRO: Não foi possível acessar o servidor de arquivos: $servidorArquivos" "ERROR"
        return $false
    }
    
    # Verificar espaço em disco (mínimo 2GB)
    $disco = Get-WmiObject -Class Win32_LogicalDisk -Filter "DeviceID='C:'"
    $espacoLivre = [math]::Round($disco.FreeSpace / 1GB, 2)
    if ($espacoLivre -lt 2) {
        Write-Log "AVISO: Pouco espaço em disco disponível: ${espacoLivre}GB" "WARNING"
    }
    
    Write-Log "Pré-requisitos validados com sucesso!" "SUCCESS"
    return $true
}

# Função aprimorada para instalação
function Instalar-App {
    param (
        [string]$nome,
        [string]$caminho,
        [string[]]$argumentos = @("/quiet", "/norestart"),
        [int]$tempoEspera = 5
    )
    
    Write-Log "Iniciando instalação de: $nome"
    
    try {
        # Verificar se o arquivo existe
        if (-not (Test-Path $caminho)) {
            Write-Log "ERRO: Caminho não encontrado para $nome : $caminho" "ERROR"
            return $false
        }
        
        # Iniciar o processo de instalação
        $processo = Start-Process -FilePath $caminho -ArgumentList $argumentos -Wait -NoNewWindow -PassThru
        
        # Verificar código de saída
        if ($processo.ExitCode -eq 0) {
            Write-Log "$nome instalado com sucesso! (Código de saída: $($processo.ExitCode))" "SUCCESS"
            $resultado = $true
        } else {
            Write-Log "AVISO: $nome finalizado com código de saída: $($processo.ExitCode)" "WARNING"
            $resultado = $false
        }
        
        # Aguardar tempo especificado
        if ($tempoEspera -gt 0) {
            Write-Log "Aguardando $tempoEspera segundos antes de prosseguir..."
            Start-Sleep -Seconds $tempoEspera
        }
        
        return $resultado
        
    } catch {
        Write-Log "ERRO durante instalação de $nome : $($_.Exception.Message)" "ERROR"
        return $false
    }
}

# Função principal
function Main {
    Write-Log "=== INICIANDO AUTOMAÇÃO DE INSTALAÇÃO DE PROGRAMAS ===" "INFO"
    Write-Log "Máquina: $env:COMPUTERNAME | Usuário: $env:USERNAME"
    
    # Validar pré-requisitos
    if (-not (Test-Prerequisites)) {
        Write-Log "Pré-requisitos não atendidos. Abortando execução." "ERROR"
        return
    }
    
    # Contadores para relatório final
    $totalAplicativos = $aplicativos.Count
    $sucessos = 0
    $falhas = 0
    
    # Processar cada aplicativo
    foreach ($app in $aplicativos) {
        $resultado = Instalar-App -nome $app.nome -caminho $app.caminho -argumentos $app.argumentos -tempoEspera $app.tempoEspera
        
        if ($resultado) {
            $sucessos++
        } else {
            $falhas++
        }
        
        Write-Log "Progresso: $($sucessos + $falhas)/$totalAplicativos aplicativos processados"
    }
    
    # Relatório final
    Write-Log "=== RELATÓRIO FINAL ===" "INFO"
    Write-Log "Total de aplicativos: $totalAplicativos"
    Write-Log "Instalações bem-sucedidas: $sucessos" "SUCCESS"
    Write-Log "Instalações com problemas: $falhas" $(if ($falhas -gt 0) { "WARNING" } else { "SUCCESS" })
    
    if ($falhas -eq 0) {
        Write-Log "Todas as instalações foram finalizadas com sucesso!" "SUCCESS"
    } else {
        Write-Log "Algumas instalações apresentaram problemas. Verifique os logs acima." "WARNING"
    }
}

# Executar função principal
Main