rem set Stara_wersja="5.09"
rem set Nowa_wersja="5.10"

rem replace -find %Stara_wersja% -replace %Nowa_wersja% -fname AS.nsi
rem replace -find %Stara_wersja% -replace %Nowa_wersja% -fname AS.nsi
copy C:\Delphi\MySQLEditor\MySQLeditor.exe C:\Delphi\MySQLEditor\install\MySQLeditor.exe
copy C:\Delphi\MySQLEditor\mysql.exe C:\Delphi\MySQLEditor\install\mysql.exe
copy C:\Delphi\MySQLEditor\mysqldump.exe C:\Delphi\MySQLEditor\install\mysqldump.exe
copy C:\Delphi\MySQLEditor\versions.txt C:\Delphi\MySQLEditor\install\versions.txt
copy C:\Delphi\MySQLEditor\conn.dat C:\Delphi\MySQLEditor\install\conn.dat
copy C:\Delphi\MySQLEditor\Help\help.chm C:\Delphi\MySQLEditor\install\help.chm
copy C:\Delphi\MySQLEditor\libmySQL.dll C:\Delphi\MySQLEditor\install\libmySQL.dll
copy C:\Delphi\MySQLEditor\QueryAnalyzer\QueryAnalyzer.exe C:\Delphi\MySQLEditor\install\QueryAnalyzer.exe
xcopy /E /H /Y C:\Delphi\MySQLEditor\pics\*.* C:\Delphi\MySQLEditor\install\pics\


rem C:
rem cd \Program Files (x86)\NSIS\
rem makensis.exe C:\Delphi\MySQLEditor\install\AS.nsi"
rem c:
cd C:\Delphi\MySQLEditor\install\
rem rar a -r -x@lista.out -u install_rar *.*
rem rar a -r -x@lista.out -u -sfx install_exe *.*