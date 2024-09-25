Import-Module Terminal-Icons
Import-Module PSReadLine

# Prompt
oh-my-posh init pwsh --config 'C:\Users\Usuario\AppData\Local\Programs\oh-my-posh\themes\lambdageneration.omp.json' | Invoke-Expression

# Custom commands
Set-PSReadLineOption -PredictionViewStyle ListView

Set-PSReadLineKeyHandler -Chord Alt+j -Function NextHistory
Set-PSReadLineKeyHandler -Chord Alt+k -Function PreviousHistory
Set-PSReadLineKeyHandler -Chord "Alt+h" -Function BackwardChar
Set-PSReadLineKeyHandler -Chord "Alt+l" -Function ForwardChar


# alias for vim to nvim
function vim {
	nvim $args
}

# Alias and functions of git
function gs {
	git status $args
}
function ga {
	git add $args
}
function gcmt {
	git commit -m $args
}
function gpsh {
	git push $args
}
function gpl {
	git pull $args
}

# utilities
function which ($command) {
  Get-Command -name $command -ErrorAction SilentlyContinue |
    Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}

# Change the logon between explorer and shell
function Set-DefaultLogonShell {
    param (
        [string]$ShellType  # Accepts 'Explorer' or 'PowerShell'
    )

    # Define registry paths
    $userShellKey = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon"

    # Determine the shell to set
    switch ($ShellType.ToLower()) {
        'explorer' {
            $newShell = "explorer.exe"
            Write-Host "Setting default logon shell to Explorer."
        }
        'powershell' {
            # Ensure PowerShell 7 path is correct; adjust if necessary
            $newShell = "C:\Program Files\PowerShell\7\pwsh.exe"
            Write-Host "Setting default logon shell to PowerShell 7."
        }
        default {
            Write-Host "Invalid option. Please use 'Explorer' or 'PowerShell'."
            return
        }
    }

    # Update the registry
    try {
        Set-ItemProperty -Path $userShellKey -Name "Shell" -Value $newShell -Force
        Write-Host "Successfully changed default logon shell to: $newShell"
    } catch {
        Write-Error "Failed to update the logon shell. Error: $_"
    }
}

# Example Usage:
# Set-DefaultLogonShell -ShellType 'Explorer'
# Set-DefaultLogonShell -ShellType 'PowerShell'


# addition to the path
$env:PATH += "C:\Users\Usuario\AppData\Local\Programs;"

