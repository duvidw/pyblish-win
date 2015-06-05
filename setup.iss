; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "Pyblish"
#define MyAppPublisher "Abstract Factory Ltd"
#define MyAppURL "http://www.pyblish.com"
#define PythonPath "{app}"
#define NukeIntegration "{app}\lib\pyblish-x\integrations\nuke"
#define MayaIntegration "{app}\lib\pyblish-x\integrations\maya"
#define HoudiniIntegration "{app}\lib\pyblish-x\integrations\houdini"

; These must be defined via command-line, e.g. /dMyVersion=1.0.3
; #define MyVersion "1.0.0"
; #define MyOutputDir "dist"

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{D3762116-7DE2-4B83-BE88-43B5D3683348}
AppName={#MyAppName}
AppVersion={#MyVersion}
AppVerName={#MyAppName} {#MyVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={pf}\{#MyAppName}
DefaultGroupName={#MyAppName}
AllowNoIcons=yes
LicenseFile=LICENSE
OutputDir={#MyOutputDir}
OutputBaseFilename=pyblish-{#MyVersion}-x64-setup
SetupIconFile=icon.ico
Compression=lzma
SolidCompression=yes
ArchitecturesInstallIn64BitMode=x64

; Tell Windows Explorer to reload the environment
ChangesEnvironment=yes

[Components]
; Offer users a choice of which integrations to install (if any)
Name: "main"; Description: "Pyblish"; Types: full compact custom; Flags: fixed
Name: "maya"; Description: "Integrate with Autodesk Maya"; Types: full
Name: "nuke"; Description: "Integrate with The Foundry Nuke"; Types: full
Name: "houdini"; Description: "Integrate with SideFx Houdini"; Types: full

[Registry]
Root: HKCU; Subkey: "Environment"; ValueType: expandsz; ValueName: "PYTHONPATH"; ValueData: "{#PythonPath};{olddata}"; Components: main
Root: HKCU; Subkey: "Environment"; ValueType: expandsz; ValueName: "PYTHONPATH"; ValueData: "{#MayaIntegration};{olddata}"; Components: maya
Root: HKCU; Subkey: "Environment"; ValueType: expandsz; ValueName: "NUKE_PATH"; ValueData: "{#NukeIntegration};{olddata}"; Components: nuke
Root: HKCU; Subkey: "Environment"; ValueType: expandsz; ValueName: "HOUDINI_PATH"; ValueData: "&;{#HoudiniIntegration};{olddata}"; Components: houdini

[Icons]
Name: "{group}\Pyblish QML"; Filename: "{app}\bin\pyblish-qml.bat"; WorkingDir: "{app}"; IconFilename: "{app}\icon.ico"
Name: "{group}\Pyblish RPC"; Filename: "{app}\bin\pyblish-rpc.bat"; WorkingDir: "{app}"; IconFilename: "{app}\icon.ico"
Name: "{group}\Python Interpreter"; Filename: "{app}\bin\python.bat"; WorkingDir: "{userdocs}"; IconFilename: "{app}\icon.ico"
Name: "{group}\{cm:ProgramOnTheWeb,{#MyAppName}}"; Filename: "{#MyAppURL}"
Name: "{group}\{cm:UninstallProgram,{#MyAppName}}"; Filename: "{uninstallexe}"

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[CustomMessages]
english.InstallingLabel=Installing...

; Hide filenames from installation progress
[Code]
procedure InitializeWizard;
begin
  WizardForm.FilenameLabel.Visible := False;
end;

[Files]
Source: "build\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
; NOTE: Don't use "Flags: ignoreversion" on any shared system files