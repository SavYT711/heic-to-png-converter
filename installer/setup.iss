[Setup]
AppName=HEIC to PNG Converter
AppVersion=1.0
DefaultDirName={pf}\HEICtoPNG
DefaultGroupName=HEIC to PNG Converter
OutputDir=output
OutputBaseFilename=HEICtoPNG_Setup
Compression=lzma
SolidCompression=yes
WizardStyle=modern

[Files]
Source: "..\dist\convert.exe"; DestDir: "{app}"; Flags: ignoreversion

[Tasks]
Name: "contextmenu"; Description: "Add right-click Explorer context menu"; Flags: unchecked

[Registry]
Root: HKCU; Subkey: "Software\Classes\SystemFileAssociations\.heic\shell\HEICtoPNG"; \
    ValueType: string; ValueName: ""; ValueData: "Convert HEIC to PNG"; \
    Tasks: contextmenu

Root: HKCU; Subkey: "Software\Classes\SystemFileAssociations\.heic\shell\HEICtoPNG\command"; \
    ValueType: string; ValueName: ""; \
    ValueData: """{app}\convert.exe"" ""%1"""; \
    Tasks: contextmenu

[Icons]
Name: "{group}\HEIC to PNG Converter"; Filename: "{app}\convert.exe"

[Run]
Filename: "{app}\convert.exe"; Description: "Launch application"; Flags: nowait postinstall skipifsilent