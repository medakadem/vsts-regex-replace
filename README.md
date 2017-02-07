# vsts-regex-replace

Extension to replace content in files based on regex as a build step in VSTS Build or Release.

![Logo](https://raw.githubusercontent.com/IvanBoyko/vsts-regex-replace/master/images/icon_64.png)


# Examples

- Inject version into AssemblyInfo.cs files:

	- using lookahead\lookbehind option (simpler, but can't use quantifiers in lookahead\lookbehind):
	
		Files Mask: `**\AssemblyInfo.cs`
		
		Regex: `(?<=Version\(["'])(\d+\.){2,3}(\d+|\*)(?=["']\)\])`
		
		Replacement: `$(SemanticVersion)`

	- using groups (more powerful, but more complex):
	
		Files Mask: `**\AssemblyInfo.cs`
		
		Regex: `(\[assembly: Assembly(File|Informational)?Version\(["'])(\d+\.){2,3}(\d+|\*)?(["']\)])`
		
		Replacement: `${1}$(SemanticVersion)${5}`


- Inject version into Wix files:

	Files Mask: `**\Product.wxs`
	Regex: `(?<=\sVersion=["'])(\d+\.){2,3}\d+(?=["'])`
	Replacement: $(SemanticVersion)


# Compatibility

* Visual Studio Team Services - tested
* Team Foundation Server - not tested


# Support

Extension is open source and free to use, but it's provided AS IS, without any responsibility.

However if you find any issue, feel free to raise it here:
https://github.com/IvanBoyko/vsts-regex-replace/issues
