#
# Script replaces content in files based on regular expression
#

[CmdletBinding()]
Param(
	[Parameter(Mandatory=$True)]
	[string] $FileMask,
	
	[Parameter(Mandatory=$True)]
	[string] $Regex,
	
	[Parameter(Mandatory=$False)]
	[string] $Replacement
)

#
# Constants
#
$errorActionPreference = "Stop"


#
# Function
#

function RegexReplaceInFile([string] $file, $Regex, $Replacement) {
	Write-Host "`n--- Processing file: $file"
	$content = Get-Content -Path $file
	
	[string[]]$new_content = @()
	
	$changed = $false
	
	$content | %{
		if ($_ -match $Regex) {
			Write-Host "< $_"
			if ($Replacement) {
				$changed_line = $_ -replace $Regex, $Replacement
				Write-Host "> $changed_line"
				$new_content += $changed_line
				$changed = $true
			}
		} else {
			if ($Replacement) {
				$new_content += $_
			}
		}
	}
	
	if ($Replacement -and $changed) {
		$new_content | Set-Content $file
	}
}


#
# Main programme
#

gci -Recurse $FileMask | %{
	if (! $_.PSIsContainer) {
		RegexReplaceInFile $_.FullName $Regex $Replacement
	}
}
