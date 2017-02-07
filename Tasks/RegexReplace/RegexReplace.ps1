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
	
	$content -match $Regex
	if ($?) {
		if ($Replacement) {
			# Remove Read-Only attribute? attrib -r $file

			$content -replace $Regex, $Replacement | Set-Content $file
			Write-Host "  replaced"
		}
	} else {
		Write-Host "  no match"
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
