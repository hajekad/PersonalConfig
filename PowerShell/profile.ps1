clear
neofetch

Import-Module posh-git

# Import the Chocolatey Profile that contains the necessary code to enable
# tab-completions to function for `choco`.
# Be aware that if you are missing these lines from your profile, tab completion
# for `choco` will not function.
# See https://ch0.co/tab-completion for details.
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

function Global:prompt {
    $hostMachineName = [System.Environment]::MachineName
    $newPWD = Split-Path -Leaf $PWD
    $gitInfo = git rev-parse --abbrev-ref HEAD
    $gitBranch = if ($gitInfo) { "$gitInfo" } else { "" }
    $purpleBrackets = [ConsoleColor]::Magenta
    $cyanBrackets = [ConsoleColor]::Cyan
    $whiteText = [ConsoleColor]::White
    $yellowText = [ConsoleColor]::Yellow

    Write-Host "[" -foregroundcolor $purpleBrackets -nonewline
    Write-Host "$Env:username" -foregroundcolor $whiteText -nonewline
    Write-Host "@" -foregroundcolor $yellowText -nonewline
    Write-Host "$hostMachineName $newPWD" -foregroundcolor $whiteText -nonewline
    Write-Host "]" -foregroundcolor $purpleBrackets -nonewline
    Write-Host " " -nonewline
    if($gitBranch -ne "")
    {
        Write-Host "(" -foregroundcolor $cyanBrackets -nonewline
        Write-Host $gitBranch -nonewline
        Write-Host ")" -foregroundcolor $cyanBrackets -nonewline
    }
    Write-Host "`n$" -foregroundcolor $whiteText -nonewline

    return " "
}

function portForward {
    param (
        [string]$localPort = "2311",
        [string]$targetPort = "",
        [string]$targetAddress = ""
    )

    if($targetAddress -eq "" -or $targetPort -eq "")
    {
        echo "Use with -targetPort xxxx and -targetAdress xxx:xxx:xxx:xxx"
        return
    }

    $localAddress = (Get-NetIPAddress -AddressFamily IPv4 | Where-Object {$_.InterfaceAlias -like '*Ethernet*' -and $_.AddressFamily -eq 'IPv4'} | Select-Object -First 1).IPAddress
    echo "Listening on adress: $localAddress"
    echo "Listening on port: $localPort"

    sudo netsh interface portproxy add v4tov4 listenport=$localPort listenaddress=$localAddress connectport=$targetPort connectaddress=$targetAddress

    # Wait for user input
    $input = ""
    while ($input -ne "exit") {
        $input = Read-Host "Type 'exit' to stop port forwarding"
    }

    sudo netsh interface portproxy delete v4tov4 listenport=$localPort listenaddress=$localAddress connectport=$targetPort connectaddress=$targetAddress
}

function afk {
    while($true) {
        Start-Sleep -Seconds 5
        $fooShell = New-Object -com "Wscript.shell"
        $fooShell.sendkeys('+{F15}')
    }
}

function touch {
    param(
        [string]$filePath
    )
    $null > $filePath
}

function grep {
    param(
        [string]$pattern
    )
    findstr $pattern
}

function zip {
    param (
        [string]$sourcePath,
        [string]$destinationPath
    )
    Compress-Archive -Path $sourcePath -DestinationPath $destinationPath
}

function unzip {
    param (
        [string]$zipPath,
        [string]$destinationPath
    )
    Expand-Archive -Path $zipPath -DestinationPath $destinationPath
}

function cc {
    param (
        [string]$text
    )
    Set-Clipboard -Value $text
}

function ddg {
    param (
        [string]$query
    )
    Start-Process "https://duckduckgo.com/$query"
}

function dir-size {
    param (
        [string]$path
    )
    (Get-ChildItem -File -Recurse $path | Measure-Object -Property Length -Sum).Sum / 1GB
}
