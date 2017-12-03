; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{BA1C3588-7397-4859-8AD1-02B3922E2EAC}
AppName=m-SQL Query Manager
AppVerName=m-SQL Query Manager
AppPublisher=www2.pl
AppPublisherURL=http://www2.pl/mSQL/
AppSupportURL=http://www2.pl/mSQL/
AppUpdatesURL=http://www2.pl/mSQL/
DefaultDirName={pf}\www2.pl\mSQL
DefaultGroupName=www2.pl\mSQL
AllowNoIcons=yes
LicenseFile=D:\Projekty Delphi\mSQL\license.txt
InfoAfterFile=D:\Projekty Delphi\mSQL\thankyou.txt
OutputDir=D:\Projekty Delphi\mSQL\install
OutputBaseFilename=setup
SetupIconFile=D:\Projekty Delphi\mSQL\install_ico.ico
Compression=lzma
SolidCompression=yes

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked
Name: "quicklaunchicon"; Description: "{cm:CreateQuickLaunchIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
Source: "D:\Projekty Delphi\mSQL\mSQL.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\Projekty Delphi\mSQL\libmySQL.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\Projekty Delphi\mSQL\sqlncli.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\Projekty Delphi\mSQL\license.txt"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\Projekty Delphi\mSQL\mysql.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\Projekty Delphi\mSQL\mysqldump.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\Projekty Delphi\mSQL\mSQL.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\Projekty Delphi\mSQL\thankyou.txt"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\Projekty Delphi\mSQL\versions.txt"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\Projekty Delphi\mSQL\autofix.dat"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\Projekty Delphi\mSQL\hints.dat"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\Projekty Delphi\mSQL\update\update.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\Projekty Delphi\mSQL\QueryAnalyzer\QueryAnalyzer.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\Projekty Delphi\mSQL\Help\help.chm"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\Projekty Delphi\mSQL\pics\*"; DestDir: "{app}\pics\"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "D:\Projekty Delphi\mSQL\Queries"; DestDir: "{app}\Queries"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "D:\Projekty Delphi\mSQL\tipscontent\*"; DestDir: "{app}\tipscontent\"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "D:\Projekty Delphi\mSQL\tipscontent\pics\*"; DestDir: "{app}\tipscontent\pics\"; Flags: ignoreversion recursesubdirs createallsubdirs
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Icons]
Name: "{group}\mSQL"; Filename: "{app}\mSQL.exe"
Name: "{group}\{cm:ProgramOnTheWeb,mSQL}"; Filename: "http://www2.pl/mSQL/"
Name: "{group}\{cm:UninstallProgram,mSQL}"; Filename: "{uninstallexe}"
Name: "{commondesktop}\mSQL"; Filename: "{app}\mSQL.exe"; Tasks: desktopicon
Name: "{userappdata}\Microsoft\Internet Explorer\Quick Launch\mSQL"; Filename: "{app}\mSQL.exe"; Tasks: quicklaunchicon

[Run]
Filename: "{app}\mSQL.exe"; Description: "{cm:LaunchProgram,mSQL}"; Flags: nowait postinstall skipifsilent
















