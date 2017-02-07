
set PERSONAL_ACCESS_TOKEN=<PUT_YOUR_TOKE_HERE>

cmd /c tfx extension publish --manifest-globs vss-extension.json --token %PERSONAL_ACCESS_TOKEN%

pause
