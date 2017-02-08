# vsts-regex-replace

Extension to replace content in files based on regex as a build step in VSTS Build or Release.

![Logo](https://raw.githubusercontent.com/IvanBoyko/vsts-regex-replace/master/images/icon_64.png)


# Examples

- Inject version into **AssemblyInfo.cs** files:

	- using lookahead\lookbehind option (simpler, but can't use quantifiers in lookahead\lookbehind):
	
		Files Mask: `**\AssemblyInfo.cs`
		
		Regex: `(?<=Version\(["'])(\d+\.){2,3}(\d+|\*)(?=["']\)\])`
		
		Replacement: `$(SemanticVersion)`

	- using groups (more powerful and precise, but more complex):
	
		Files Mask: `**\AssemblyInfo.cs`
		
		Regex: `(\[assembly: Assembly(File|Informational)?Version\(["'])(\d+\.){2,3}(\d+|\*)?(["']\)])`
		
		Replacement: `${1}$(SemanticVersion)${5}`


- Inject version into **Wix** files:

	Files Mask: `**\Product.wxs`
	
	Regex: `(?<=\sVersion=["'])(\d+\.){2,3}\d+(?=["'])`
	
	Replacement: `$(SemanticVersion)`



![Logo](https://raw.githubusercontent.com/IvanBoyko/vsts-regex-replace/master/images/screenshot_example_1.png)


# Compatibility

* Visual Studio Team Services - tested
* Team Foundation Server - not tested


# Support

Extension is open source and free to use.
But it's provided as is, without any responsibility, and is not guaranteed to work.
Use at your own risk.

However if you find any issue, feel free to raise it here:
https://github.com/IvanBoyko/vsts-regex-replace/issues
