# vsts-regex-replace

Extension to replace content in files based on regex as a build step in VSTS Build or Release.

![Logo](https://raw.githubusercontent.com/IvanBoyko/vsts-regex-replace/master/images/icon_64.png)


# Examples

- Update version in AssemblyInfo.cs files:

	Files to update: `**\AssemblyInfo.cs`
	Regex: `(?<=\[assembly:\s*Assembly?Version\(["'])(\d+\.){2,3}\d+(?=["']\)\])`

	Files to update: `**\AssemblyInfo.cs`
	Regex: `(?<=\[assembly:\s*AssemblyFileVersion\(["'])(\d+\.){2,3}\d+(?=["']\)\])`

- Update version in Wix files:

	Files to update: `**\Product.wxs`
	Regex: `(?<=<\?define\s+ProductVersion\s*=\s*['"])(\d+\.){2,3}\d+(?=["']\s*\?>)`


# Compatibility

* Visual Studio Team Services - tested
* Team Foundation Server - not tested


# Support

Extension is open source and free to use, but it's provided AS IS, without any responsibility.

However if you find any issue, feel free to raise it here:
https://github.com/IvanBoyko/vsts-regex-replace/issues
