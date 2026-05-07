[Setup]
AppName=HEIC to PNG Converter
AppVersion=1.0.0
DefaultDirName={pf}\HEICtoPNG
DefaultGroupName=HEIC to PNG Converter
OutputDir=output
OutputBaseFilename=HEICtoPNG_Setup
Compression=lzma
SolidCompression=yes
WizardStyle=modern

[Files]
Source: "..\dist\convert.exe"; DestDir: "{app}"; Flags: ignoreversion

[Icons]
Name: "{group}\HEIC to PNG Converter"; Filename: "{app}\convert.exe"

[Tasks]
Name: "contextmenu"; Description: "Add right-click 'Convert to PNG' option"; GroupDescription: "Explorer Integration:"

[Registry]
Root: HKCR; Subkey: "SystemFileAssociations\.heic\shell\ConvertToPNG"; \
ValueType: string; ValueName: ""; ValueData: "Convert to PNG"; \
Flags: uninsdeletekey; Tasks: contextmenu

Root: HKCR; Subkey: "SystemFileAssociations\.heic\shell\ConvertToPNG\command"; \
ValueType: string; ValueName: ""; ValueData: """{app}\convert.exe"" ""%1"""; \
Flags: uninsdeletekey; Tasks: contextmenu

[Run]
Filename: "{app}\convert.exe"; Description: "Launch app"; Flags: nowait postinstall skipifsilent