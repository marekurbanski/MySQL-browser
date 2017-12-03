unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, Buttons, StdCtrls, ExtCtrls, ToolWin, ComCtrls, ClipBrd, shellapi,
  ImgList, Grids, SynEdit, SynMemo, AppEvnts,Comobj, Spin;

type
  Theader = class(TForm)
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Edit2: TMenuItem;
    View1: TMenuItem;
    Query1: TMenuItem;
    Tools1: TMenuItem;
    Community1: TMenuItem;
    Help1: TMenuItem;
    Errors1: TMenuItem;
    New1: TMenuItem;
    Execute1: TMenuItem;
    Logs1: TMenuItem;
    HintsHelps1: TMenuItem;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    Copyresulttocsv1: TMenuItem;
    CopyasHTMLtable1: TMenuItem;
    CopyasXML1: TMenuItem;
    Exit1: TMenuItem;
    Openquery1: TMenuItem;
    Savequery1: TMenuItem;
    Help2: TMenuItem;
    About1: TMenuItem;
    SQLCommandLine1: TMenuItem;
    Newconnection1: TMenuItem;
    Update1: TMenuItem;
    Undo1: TMenuItem;
    Redo1: TMenuItem;
    Cut1: TMenuItem;
    Paste1: TMenuItem;
    N1: TMenuItem;
    Delete1: TMenuItem;
    FD: TFindDialog;
    CopyresulttoExcel1: TMenuItem;
    Analyze1: TMenuItem;
    Showprocesslist1: TMenuItem;
    Sendsugestion1: TMenuItem;
    Whatsnew1: TMenuItem;
    Queryanalyzer1: TMenuItem;
    TableDiagnostics1: TMenuItem;
    Users1: TMenuItem;
    Settings1: TMenuItem;
    Redo2: TMenuItem;
    LeftTabGroup1: TMenuItem;
    RightTabGroup1: TMenuItem;
    Tips1: TMenuItem;
    SplittoSQLResult1: TMenuItem;
    SplittoGraphSQLResult1: TMenuItem;
    Designview1: TMenuItem;
    GenerateQueryfromgraph1: TMenuItem;
    ApplicationEvents1: TApplicationEvents;
    ControlBar1: TControlBar;
    Panel1: TPanel;
    Label2: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    SpeedButton9: TSpeedButton;
    SpeedButton8: TSpeedButton;
    Edit1: TEdit;
    dbtype: TEdit;
    address: TEdit;
    server: TEdit;
    Panel2: TPanel;
    SpeedButton1: TSpeedButton;
    execute: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    Bevel1: TBevel;
    Bevel2: TBevel;
    SpeedButton7: TSpeedButton;
    Bevel3: TBevel;
    SpeedButton10: TSpeedButton;
    SpeedButton11: TSpeedButton;
    SpeedButton12: TSpeedButton;
    SpeedButton13: TSpeedButton;
    SpeedButton14: TSpeedButton;
    res: TStringGrid;
    EMailresultasattachement1: TMenuItem;
    Label5: TLabel;
    rows_number: TSpinEdit;
    Label6: TLabel;
    ComboBox1: TComboBox;
    CheckBox1: TCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Exit1Click(Sender: TObject);
    procedure executeClick(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure Errors1Click(Sender: TObject);
    procedure New1Click(Sender: TObject);
    procedure Execute1Click(Sender: TObject);
    procedure Logs1Click(Sender: TObject);
    procedure HintsHelps1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure Copyresulttocsv1Click(Sender: TObject);
    procedure CopyasHTMLtable1Click(Sender: TObject);
    procedure CopyasXML1Click(Sender: TObject);
    procedure Openquery1Click(Sender: TObject);
    procedure Savequery1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure SQLCommandLine1Click(Sender: TObject);
    procedure Newconnection1Click(Sender: TObject);
    procedure Update1Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure Undo1Click(Sender: TObject);
    procedure Redo1Click(Sender: TObject);
    procedure Cut1Click(Sender: TObject);
    procedure Paste1Click(Sender: TObject);
    procedure Delete1Click(Sender: TObject);
    procedure FDFind(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure CopyresulttoExcel1Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure Analyze1Click(Sender: TObject);
    procedure Sendsugestion1Click(Sender: TObject);
    procedure Whatsnew1Click(Sender: TObject);
    procedure Showprocesslist1Click(Sender: TObject);
    procedure Queryanalyzer1Click(Sender: TObject);
    procedure Help2Click(Sender: TObject);
    procedure TableDiagnostics1Click(Sender: TObject);
    procedure Users1Click(Sender: TObject);
    procedure Settings1Click(Sender: TObject);
    procedure Redo2Click(Sender: TObject);
    procedure LeftTabGroup1Click(Sender: TObject);
    procedure RightTabGroup1Click(Sender: TObject);
    procedure WMSysCommand(var Message:TWMSysCommand); message WM_SysCommand;
    procedure Tips1Click(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure SpeedButton12Click(Sender: TObject);
    procedure SpeedButton13Click(Sender: TObject);
    procedure SplittoSQLResult1Click(Sender: TObject);
    procedure SplittoGraphSQLResult1Click(Sender: TObject);
    procedure Designview1Click(Sender: TObject);
    procedure SpeedButton14Click(Sender: TObject);
    procedure ApplicationEvents1Deactivate(Sender: TObject);
    procedure ApplicationEvents1Exception(Sender: TObject; E: Exception);
    procedure ApplicationEvents1Minimize(Sender: TObject);
    procedure ApplicationEvents1Restore(Sender: TObject);
    procedure ApplicationEvents1ShowHint(var HintStr: String;
      var CanShow: Boolean; var HintInfo: THintInfo);
    procedure EMailresultasattachement1Click(Sender: TObject);
    procedure GenerateQueryfromgraph1Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    procedure Moving(var Message: TMessage); message WM_MOVING;
    procedure EnterSizeMove(var Message: TMessage); message WM_ENTERSIZEMOVE;
  end;

var
  x1,y1,x2,y2:Integer;
  header: Theader;
  PreviousFoundPos: integer;
  procedure waitoff;
  procedure waiton;
function Sto_GetFmtFileVersion(const FileName: String = '';  const Fmt: String = '%d.%d.%d.%d'): String;
procedure logh(s:string);

implementation

uses Unit4,Unit1, Unit2, Unit10, Unit11, Unit12, Unit13, Unit16, Unit6,
  Unit18, Unit19, Unit20, Unit21, Unit22, Unit23;

{$R *.DFM}

procedure Theader.EnterSizeMove(var Message: TMessage);
begin
x1:=header.Left-tables.Left;
y1:=header.Top-tables.Top;
x2:=header.Left-results.Left;
y2:=header.Top-results.Top;
end;

procedure Theader.Moving(var Message: TMessage);
var R:PRect;
begin
R:=Pointer(Message.LParam);

tables.Left:=R.Left-x1;
tables.Top:=R.Top-y1;
results.Left:=R.Left-x2;
results.Top:=R.Top-y2;
end;

procedure waiton;
var
  Cur: TCursor;
begin
header.SpeedButton8.Visible:=false;
header.SpeedButton9.Visible:=true;
application.ProcessMessages;

  Cur := Screen.Cursor;
  Screen.Cursor := crSQLWait;
end;

procedure waitoff;
var
  Cur: TCursor;
begin
header.SpeedButton8.Visible:=true;
header.SpeedButton9.Visible:=false;
application.ProcessMessages;
header.Cursor:=crDefault;
results.Cursor:=crDefault;
tables.Cursor:=crDefault;
Cur := Screen.Cursor;
Screen.Cursor := crDefault;
end;

function Sto_GetFmtFileVersion(const FileName: String = '';
  const Fmt: String = '%d.%d.%d.%d'): String;
var
  sFileName: String;
  iBufferSize: DWORD;
  iDummy: DWORD;
  pBuffer: Pointer;
  pFileInfo: Pointer;
  iVer: array[1..4] of Word;
begin
  // set default value
  Result := '';
  // get filename of exe/dll if no filename is specified
  sFileName := FileName;
  if (sFileName = '') then
  begin
    // prepare buffer for path and terminating #0
    SetLength(sFileName, MAX_PATH + 1);
    SetLength(sFileName,
      GetModuleFileName(hInstance, PChar(sFileName), MAX_PATH + 1));
  end;
  // get size of version info (0 if no version info exists)
  iBufferSize := GetFileVersionInfoSize(PChar(sFileName), iDummy);
  if (iBufferSize > 0) then
  begin
    GetMem(pBuffer, iBufferSize);
    try
    // get fixed file info (language independent)
    GetFileVersionInfo(PChar(sFileName), 0, iBufferSize, pBuffer);
    VerQueryValue(pBuffer, '\', pFileInfo, iDummy);
    // read version blocks
    iVer[1] := HiWord(PVSFixedFileInfo(pFileInfo)^.dwFileVersionMS);
    iVer[2] := LoWord(PVSFixedFileInfo(pFileInfo)^.dwFileVersionMS);
    iVer[3] := HiWord(PVSFixedFileInfo(pFileInfo)^.dwFileVersionLS);
    iVer[4] := LoWord(PVSFixedFileInfo(pFileInfo)^.dwFileVersionLS);
    finally
      FreeMem(pBuffer);
    end;
    // format result string
    Result := Format(Fmt, [iVer[1], iVer[2], iVer[3], iVer[4]]);
  end;
end;


procedure Theader.FormClose(Sender: TObject; var Action: TCloseAction);
begin
try
action:=canone;
main.Connection.Connected:=false;
main.close();
except end;
end;

procedure Theader.Exit1Click(Sender: TObject);
begin
try
main.Connection.Connected:=false;
main.close();
except end;
end;

procedure logh(s:string);
begin
history.memo1.lines.add(datetimetostr(now())+': '+s);
end;


procedure log(s:string; show:integer);
var
e2,e1:string;
begin
e1:='Error: EDatabaseError : Query must return exactly result set - use Execute';
e2:='EAccessViolation : Access violation at address';

if( (copy(s,0,length(e1))<>e1) and (pos(e2,s)=0) )then
begin
errors.memo1.lines.add(s);
main.SaveLog(nil,nil,'ERROR: '+s);
if(show=1) then
        begin
        errors.FormStyle:=fsStayOnTop;
        errors.FormStyle:=fsNormal;
        errors.visible:=true;
        end;
logh(s);
end;
end;

function StrBefore(s,s2: string): string;
var p: integer;
begin
  p:=pos(s2,s);
  if p>0 then result:=copy(s,1,p-1)
  else result:='';
end;

function StrAfter(s,s2: string): string;
var p: integer;
begin
  p:=pos(s2,s);
  if p>0 then result:=copy(s,p+length(s2),length(s)-p)
  else result:='';
end;

procedure Theader.executeClick(Sender: TObject);
var
nr:integer;
cap,q:string;
Freq, TimeStart, TimeEnd : Int64;
begin
waiton;
header.Cursor:=crHourGlass;
results.Cursor:=crHourGlass;
tables.Cursor:=crHourGlass;
application.ProcessMessages;
nr:=results.CheckQueryNo();
if nr>-1 then
begin

//results.ReconnectFromTop();

application.ProcessMessages;
results.StatusBar1.Panels[2].Text:='Connected';
application.ProcessMessages;

application.ProcessMessages;
if (header.dbtype.text='MySQL') then
        begin
        main.SaveLog(TForm(self),Sender,'HEADER:Execute: nr='+inttostr(nr)+',Connections[nr].server_name:'+Connections[nr].server_name+',results.mysqlconn[nr].Server='+results.mysqlconn[nr].Server+',results.mysqlconn[nr].Username='+results.mysqlconn[nr].Username+',results.mysqlconn[nr].Database='+results.mysqlconn[nr].Database+',Server header = '+header.server.Text);
        try results.mysqlquery[nr].Close; except end;
        try results.mysqldata[nr].DataSet.Close; except end;
        try results.mysqlconn[nr].Close; except end;
        try results.ReconnectFromTop(); except end;
        results.mysqlconn[nr].Options.Charset:=combobox1.Text;
        results.mysqlconn[nr].Options.UseUnicode:=checkbox1.Checked;

        if not results.mysqlconn[nr].Connected then
                begin
                main.SaveLog(TForm(self),Sender,'NOT results.mysqlconn[nr].Connected');
                results.mysqlconn[nr].Connect;
                end else main.SaveLog(TForm(self),Sender,'results.mysqlconn[nr].Connected');

       if results.mysqldata[nr].DataSet.Active then
                begin
                main.SaveLog(TForm(self),Sender,'results.mysqldata[nr].DataSet.Active');
                results.mysqldata[nr].DataSet.Close;
                end else main.SaveLog(TForm(self),Sender,'NOT results.mysqldata[nr].DataSet.Active');

        results.mysqlquery[nr].sql.clear;
        q:=results.m[nr].SelText;
        if q<>'' then if pos(' ',q)=0 then q:='SELECT * FROM '+q;
        if q='' then q:=results.m[nr].Text;
        cap:=results.GetTitle();
        //try results.ReconnectFromTop(); except end;
        results.mysqlquery[nr].sql.clear;
        results.mysqlquery[nr].sql.add(q);
        results.mysqlconn[nr].Database:=results.db[nr];
        main.SaveLog(TForm(self),Sender,'results.mysqlconn[nr].Database:=results.db[nr]:='+results.db[nr]);
        //results.m[nr].Text:=q;
        try
        if not QueryPerformanceFrequency(Freq) then results.StatusBar1.Panels[3].Text:='Problem with system clock';
        QueryPerformanceCounter(TimeStart);
        main.SaveLog(TForm(self),Sender,'MySQL:Execute: Before: results.myquery[].open');
        results.mysqlquery[nr].open;
        main.SaveLog(TForm(self),Sender,'MySQL:Execute: After: results.myquery[].open');
        QueryPerformanceCounter(TimeEnd);
        results.statusbar1.Panels[3].Text:= 'Query time: '+FloatToStr((TimeEnd-TimeStart)/Freq*1000)+' ms';
        admin.memo1.lines.add('results.myquery['+inttostr(nr)+'].open');
        main.SaveLog(TForm(self),Sender,'MysqlQuery: results.myquery['+inttostr(nr)+'].open');
        logh(results.m[nr].Text);
        except
           on E : Exception do
                begin
                log('Error: '+E.ClassName+' : '+E.Message,1);
                main.SaveLog(TForm(self),Sender,'MysqlQuery: '+E.ClassName+' : '+E.Message);
                end;
        end;
        try results.d[nr].AdjustColumns; except end;
        end;

if (header.dbtype.text='MSSQL') then
        begin
        main.SaveLog(TForm(self),Sender,'HEADER:Execute: nr='+inttostr(nr)+',Connections[nr].server_name:'+Connections[nr].server_name+',results.mssqlconn[nr].Server='+results.mssqlconn[nr].ConnectionString+',results.mssqlconn[nr].Database='+results.mssqlconn[nr].DefaultDatabase+',Server header = '+header.server.Text);
        //main.Connection.Open;
       if not results.mssqlconn[nr].Connected then
                begin
                main.SaveLog(TForm(self),Sender,'NOT results.mssqlconn[nr].Connected');
                results.mssqlconn[nr].Open;
                end else main.SaveLog(TForm(self),Sender,'results.mssqlconn[nr].Connected');

       if results.mssqldata[nr].DataSet.Active then
                begin
                main.SaveLog(TForm(self),Sender,'results.mssqldata[nr].DataSet.Active');
                results.mssqldata[nr].DataSet.Close;
                results.mssqldata[nr].DataSet:=results.mssqlquery[nr];
                results.d[nr].DataSource:=results.mssqldata[nr];
                end else main.SaveLog(TForm(self),Sender,'NOT results.mssqldata[nr].DataSet.Active');

        //try results.mssqlquery[nr].Close; except end;
        //try results.mssqldata[nr].DataSet.Close; except end;
        //try results.mssqlconn[nr].Close; except end;
        //if results.mssqldata[nr].DataSet.DataSource.Enabled then results.mssqldata[nr].DataSet.Close;
        //if results.mssqlconn[nr].Connected then results.mssqlconn[nr].Close;
        //results.mssqlquery[nr].
        //try results.ReconnectFromTop(); except end;


        //main.SaveLog(TForm(self),Sender,'HEADER: Execute: Petla MSSQL: type = '+header.dbtype.text);
        q:=results.m[nr].SelText;
        if q<>'' then if pos(' ',q)=0 then q:='SELECT * FROM '+q;
        if q='' then q:=results.m[nr].Text;
        cap:=results.GetTitle();
        results.mssqlquery[nr].sql.clear;
        results.mssqlquery[nr].sql.add(q);
        results.mssqlconn[nr].DefaultDatabase:=results.db[nr];

        if not QueryPerformanceFrequency(Freq) then results.StatusBar1.Panels[3].Text:='Problem with system clock';
        QueryPerformanceCounter(TimeStart);
        main.SaveLog(TForm(self),Sender,'MSSQL:Execute: Before: results.msquery[].open');
        admin.memo1.lines.add('nr= '+inttostr(nr));
        if results.mssqlconn[nr].Connected then main.SaveLog(TForm(self),Sender,'MSSQL:Execute: Connected')
                else main.SaveLog(TForm(self),Sender,'MSSQL:Execute: Not connected');
        try
        results.mssqlquery[nr].Open;
        except
           on E : Exception do
                begin
                log('Error: '+E.ClassName+' : '+E.Message,1);
                main.SaveLog(TForm(self),Sender,'MSSQL:Execute: Open ERROR: '+E.Message);
                end;
        end;
        try results.d[nr].AdjustColumns; except end;
        QueryPerformanceCounter(TimeEnd);
        main.SaveLog(TForm(self),Sender,'MSSQL:Execute: After: results.msquery[].open');
        results.statusbar1.Panels[3].Text:= 'Query time: '+FloatToStr((TimeEnd-TimeStart)/Freq*1000)+' ms';
//        admin.memo1.lines.add('nr= '+inttostr(nr));
//        admin.memo1.lines.add('results.msquery['+inttostr(nr)+'].open');
        logh(results.m[nr].Text);
end;
try results.d[nr].AdjustColumns; except end;
end else showmessage('No query to execute');


header.Cursor:=crDefault;
results.Cursor:=crDefault;
tables.Cursor:=crDefault;
results.StatusBar1.Panels[2].Text:='Done';
waitoff;
end;


procedure Theader.SpeedButton3Click(Sender: TObject);
begin
if(edit1.Text='') then showmessage('Check database first') else
	begin
	results.NewQuery('SELECT * FROM ',false,false,'',header.dbtype.Text);
   end;

end;

procedure Theader.Errors1Click(Sender: TObject);
begin
errors.Visible:=true;
errors.FormStyle:=fsStayOnTop;
errors.FormStyle:=fsNormal;
end;

procedure Theader.New1Click(Sender: TObject);
begin
SpeedButton3.click;
end;

procedure Theader.Execute1Click(Sender: TObject);
begin
execute.Click;
end;

procedure Theader.Logs1Click(Sender: TObject);
begin
history.FormStyle:=fsStayOnTop;
history.FormStyle:=fsNormal;
history.visible:=true;
end;

procedure Theader.HintsHelps1Click(Sender: TObject);
var
nr:integer;
begin
nr:=results.CheckQueryNo();
if nr>-1 then
begin
podpowiedzi.Visible:=true;
podpowiedzi.load_data.click;

podpowiedzi.Edit1.text:=results.m[nr].WordAtCursor;
end else showmessage('Select word in query window for help');
end;

procedure Theader.SpeedButton1Click(Sender: TObject);
var
s:string;
nr:integer;
begin
s:=ExtractFilePath(Application.ExeName);
opendialog1.InitialDir:=s+'Queries';
if(edit1.Text='') then showmessage('Check database first') else
	begin
        if(opendialog1.Execute) then
              begin
              try
              results.NewQuery('',false,false,opendialog1.FileName,header.dbtype.Text);
              nr:=results.CheckQueryNo();
              results.m[nr].Lines.LoadFromFile(opendialog1.FileName);
              except showmessage('Error opening file'); end;
              end;
        end;
end;

procedure Theader.SpeedButton2Click(Sender: TObject);
var
nr:integer;
s:string;
begin
s:=ExtractFilePath(Application.ExeName);
savedialog1.InitialDir:=s+'Queries';
nr:=results.CheckQueryNo();
if(nr>-1) then
        begin
        if(savedialog1.Execute) then
                begin
                results.m[nr].Lines.SaveToFile(savedialog1.FileName);
                end;
        end;
end;

procedure Theader.Copyresulttocsv1Click(Sender: TObject);
var
nr,i,j,number:integer;
tmp:string;
begin
for i:=0 to res.RowCount do res.Rows[i].Clear;
tmp:='';
nr:=results.CheckQueryNo();
number := rows_number.Value-1;
if(rows_number.Value=0) then number := results.d[nr].DataSource.DataSet.RecordCount-1;
if(nr>-1) then
        begin
        if(rows_number.Value=0) then results.d[nr].datasource.dataset.First;
        for j:=0 to number do
                begin
                for i:=0 to results.d[nr].DataSource.DataSet.FieldCount-1 do
                        begin
                        tmp:=tmp+results.d[nr].DataSource.DataSet.Fields.Fields[i].AsString+';';
                        //showmessage(tmp);
                        //results.m[nr].Lines.SaveToFile(savedialog1.FileName+'.2sql');
                        end;
                 results.d[nr].datasource.dataset.Next;
                 tmp:=tmp+chr(13)+chr(10);
                end;
        Clipboard.AsText:=tmp;
        showmessage('Copied to clipboard');
        end else showmessage('No results to export');
end;


function FormatHTMLClipboardHeader(HTMLText: string): string;
const
  CrLf = #13#10;
begin
  Result := 'Version:0.9' + CrLf;
  Result := Result + 'StartHTML:-1' + CrLf;
  Result := Result + 'EndHTML:-1' + CrLf;
  Result := Result + 'StartFragment:000081' + CrLf;
  Result := Result + 'EndFragment:같같같' + CrLf;
  Result := Result + HTMLText + CrLf;
  Result := StringReplace(Result, '같같같', Format('%.6d', [Length(Result)]), []);
end;

//The second parameter is optional and is put into the clipboard as CF_HTML.
//Function can be used standalone or in conjunction with the VCL clipboard so long as
//you use the USEVCLCLIPBOARD conditional define
//($define USEVCLCLIPBOARD}
//(and clipboard.open, clipboard.close).
//Code from http://www.lorriman.com
procedure CopyHTMLToClipBoard(const str: string; const htmlStr: string = '');
var
  gMem: HGLOBAL;
  lp: PChar;
  Strings: array[0..1] of string;
  Formats: array[0..1] of UINT;
  i: Integer;
begin
  gMem := 0;
  {$IFNDEF USEVCLCLIPBOARD}
  Win32Check(OpenClipBoard(0));
  {$ENDIF}
  try
    //most descriptive first as per api docs
    Strings[0] := FormatHTMLClipboardHeader(htmlStr);
    Strings[1] := str;
    Formats[0] := RegisterClipboardFormat('HTML Format');
    Formats[1] := CF_TEXT;
    {$IFNDEF USEVCLCLIPBOARD}
    Win32Check(EmptyClipBoard);
    {$ENDIF}
    for i := 0 to High(Strings) do
    begin
      if Strings[i] = '' then Continue;
      //an extra "1" for the null terminator
      gMem := GlobalAlloc(GMEM_DDESHARE + GMEM_MOVEABLE, Length(Strings[i]) + 1);
      {Succeeded, now read the stream contents into the memory the pointer points at}
      try
        Win32Check(gmem <> 0);
        lp := GlobalLock(gMem);
        Win32Check(lp <> nil);
        CopyMemory(lp, PChar(Strings[i]), Length(Strings[i]) + 1);
      finally
        GlobalUnlock(gMem);
      end;
      Win32Check(gmem <> 0);
      SetClipboardData(Formats[i], gMEm);
      Win32Check(gmem <> 0);
      gmem := 0;
    end;
  finally
    {$IFNDEF USEVCLCLIPBOARD}
    Win32Check(CloseClipBoard);
    {$ENDIF}
  end;
end;


procedure Theader.CopyasHTMLtable1Click(Sender: TObject);
var
number,nr,i,j:integer;
tmp:string;
begin
for i:=0 to res.RowCount do res.Rows[i].Clear;
nr:=results.CheckQueryNo();
number := rows_number.Value-1;
if(rows_number.Value=0) then number := results.d[nr].DataSource.DataSet.RecordCount-1;

if(nr>-1) then
        begin
        if(rows_number.Value=0) then results.d[nr].datasource.dataset.First;
        tmp:='<span style="font-family:arial; font-size:11px; color:gray">'+results.m[nr].text+'</span><br>';
        tmp:=tmp+'<table cellpadding="0" cellspacing="4" style="font-family:arial; font-size:11px; border:1px solid gray">';
        tmp:=tmp+'<tr>';
        for i:=0 to results.d[nr].DataSource.DataSet.FieldCount-1 do
                tmp:=tmp+'<td><b>'+results.d[nr].DataSource.DataSet.Fields[i].FieldName+'</b></td>';
        for j:=0 to number do
                begin
                tmp:=tmp+'</tr><tr>';
                for i:=0 to results.d[nr].DataSource.DataSet.FieldCount-1 do
                        begin
                        tmp:=tmp+'<td>'+results.d[nr].DataSource.DataSet.Fields.Fields[i].AsString+'</td>';
                        //showmessage(tmp);
                        //results.m[nr].Lines.SaveToFile(savedialog1.FileName+'.2sql');
                        end;
                 results.d[nr].datasource.dataset.Next;
                 tmp:=tmp+'</tr>';
                end;
        tmp:=tmp+'<tr><td style="font-size:9px" colspan="'+inttostr(i)+'">Generated '+datetimetostr(now())+' by <a href="http://www2.pl/mysql_query_management/">MySQL-Query Management 1.5</a>, (c) <a href="http://www2.pl">www2.pl</a></td></tr>';
        tmp:=tmp+'</table>';
        CopyHTMLToClipBoard(tmp,tmp);
        //Clipboard.AsText:=tmp;
        showmessage('Copied to clipboard');
        end else showmessage('No results to export');
end;

procedure Theader.CopyasXML1Click(Sender: TObject);
var
number,nr,i,j:integer;
tmp,fn:string;
begin
for i:=0 to res.RowCount do res.Rows[i].Clear;
nr:=results.CheckQueryNo();
number := rows_number.Value-1;
if(rows_number.Value=0) then number := results.d[nr].DataSource.DataSet.RecordCount-1;
if(nr>-1) then
        begin
        if(rows_number.Value=0) then results.d[nr].datasource.dataset.First;
        tmp:='<?xml version="1.0"?>'+chr(13)+chr(10)+chr(13)+chr(10)+'<SQL-query>';
        tmp:=tmp+'<tr>';
        for j:=0 to number do
                begin
                tmp:=tmp+'<row>'+chr(13)+chr(10);
                for i:=0 to results.d[nr].DataSource.DataSet.FieldCount-1 do
                        begin
                        fn:=results.d[nr].DataSource.DataSet.Fields[i].FieldName;
                        tmp:=tmp+'      <'+fn+'>'+results.d[nr].DataSource.DataSet.Fields.Fields[i].AsString+'</'+fn+'>'+chr(13)+chr(10);
                        //showmessage(tmp);
                        //results.m[nr].Lines.SaveToFile(savedialog1.FileName+'.2sql');
                        end;
                 results.d[nr].datasource.dataset.Next;
                 tmp:=tmp+'</row>'+chr(13)+chr(10);
                end;
        tmp:=tmp+'</SQL-query>';
        Clipboard.AsText:=tmp;
        showmessage('Copied to clipboard');
        end else showmessage('No result to export');
end;

procedure Theader.Openquery1Click(Sender: TObject);
begin
speedbutton1.click;
end;

procedure Theader.Savequery1Click(Sender: TObject);
begin
speedbutton2.click;
end;

procedure Theader.About1Click(Sender: TObject);
begin
aboutbox.Visible:=true;
aboutbox.Version.Caption:='Version: '+Sto_GetFmtFileVersion();
end;

procedure Theader.SQLCommandLine1Click(Sender: TObject);
var
p:string;
begin
p:=p+' -h '+main.combobox1.text+' -u '+main.edit1.text;
p:=p+' -P '+main.edit3.text;
if(main.edit2.text<>'') then p:=p+' -p'+main.edit2.text;
//if(edit1.text<>'') then p:=p+' '+edit1.text;
//showmessage(p);
ShellExecute(Handle,'open',pchar(ExtractFilePath( Application.ExeName )+'mysql.exe '),pchar(p),nil,SW_SHOWNORMAL);
end;

procedure Theader.Newconnection1Click(Sender: TObject);
begin
main.visible:=true;
end;

procedure Theader.Update1Click(Sender: TObject);
begin
update_box.Visible:=true;
update_box.silent.Checked:=false;
update_box.Version.Caption:=Sto_GetFmtFileVersion();
update_box.start.click;
//Sto_GetFmtFileVersion
end;

procedure Theader.SpeedButton4Click(Sender: TObject);
begin
Copyresulttocsv1.Click;
end;

procedure Theader.SpeedButton5Click(Sender: TObject);
begin
CopyasHTMLtable1.Click;
end;

procedure Theader.SpeedButton6Click(Sender: TObject);
begin
CopyasXML1.Click;
end;

procedure Theader.Undo1Click(Sender: TObject);
var
nr:integer;
begin
nr:=results.CheckQueryNo();
if results.m[nr].CanUndo then
        results.m[nr].Undo
        else showmessage('No undo available');
end;

procedure Theader.Redo1Click(Sender: TObject);
var
nr:integer;
begin
nr:=results.CheckQueryNo();
results.m[nr].CopyToClipboard;
end;

procedure Theader.Cut1Click(Sender: TObject);
var
nr:integer;
begin
nr:=results.CheckQueryNo();
results.m[nr].CutToClipboard;
end;

procedure Theader.Paste1Click(Sender: TObject);
begin
//
end;

procedure Theader.Delete1Click(Sender: TObject);

begin
  PreviousFoundPos := 0;
  FD.Execute;
end;


procedure Theader.FDFind(Sender: TObject);
var
PreviousFoundPos,nr:integer;
RE:tsynmemo;
sText: string;
StartFrom, FoundPos: integer;
begin
nr:=results.CheckQueryNo();
RE:=results.m[nr];
if PreviousFoundPos = 0 then
    FD.Options := FD.Options - [frFindNext];

if not (frFindNext in FD.Options) then begin // is it a Find "First" ?
    sText := RE.Text;
    StartFrom := 1;
  end
  else begin // it's a Find "Next"
    { Calculate from where to start searching:
      start AFTER the end of the last found position. }
    StartFrom := PreviousFoundPos + Length(FD.Findtext);
    { Get text from the RichEdit, starting from StartFrom }
    sText := Copy(RE.Text, StartFrom, Length(RE.Text) - StartFrom + 1);
  end;

  if frMatchCase in FD.Options then   // case-sensitive search?
    { Search position of FindText in sText.
      Note that function Pos() is case-sensitive. }
    FoundPos := Pos(FD.FindText, sText)
  else
    { Search position of FindText, converted to uppercase,
      in sText, also converted to uppercase        }
    FoundPos := Pos(UpperCase(FD.FindText), UpperCase(sText));

  if FoundPos > 0 then begin
    { If found, calculate position of FindText in the RichEdit }
    PreviousFoundPos := FoundPos + StartFrom - 1;
    { Highlight the text that was found }
    RE.SelStart := PreviousFoundPos - 1;
    RE.SelLength := Length(FD.FindText);
    RE.SetFocus;
  end
  else
    ShowMessage('Could not find "' + FD.FindText + '"');
end;

procedure Theader.SpeedButton7Click(Sender: TObject);
begin
HintsHelps1.Click;
end;

function ToExcel2(AGrid: TStringGrid; open:boolean = true): Boolean;
const
 xlWBATWorksheet = -4167;
var
 Row, Col: Integer;
 dt,ASheetName,GridPrevFile: string;
 XLApp, Sheet, Data: OLEVariant;
 i, j: Integer;
 AFileName: string;

function r(s:string): string;
begin
//s:= copy(s,1,255);
result := s;
end;

function RefToCell(ARow, ACol: Integer): string;
begin
 Result := Chr(Ord('A') + ACol - 1) + IntToStr(ARow);
end;

function GetTempDirectory: String;
var
  tempFolder: array[0..MAX_PATH] of Char;
begin
  GetTempPath(MAX_PATH, @tempFolder);
  result := StrPas(tempFolder);
end;

begin
dt:=datetimetostr(now());
dt:=stringreplace(dt,'/','',[rfReplaceAll]);
dt:=stringreplace(dt,'-','',[rfReplaceAll]);
dt:=stringreplace(dt,' ','',[rfReplaceAll]);
dt:=stringreplace(dt,'\','',[rfReplaceAll]);
dt:=stringreplace(dt,':','',[rfReplaceAll]);

//  showmessage(GetTempDirectory);
AFileName:=GetTempDirectory+'export'+dt+'.xls';
if open then AFileName:=GetTempDirectory+'mSQLexport.xls';

ASheetName:='m-SQL Export';
 // Prepare Data
 Data := VarArrayCreate([1, AGrid.RowCount, 1, AGrid.ColCount], varVariant);
 for i := 0 to AGrid.ColCount - 1 do
   for j := 0 to AGrid.RowCount - 1 do
     Data[j+1,  i+1 ] := r(AGrid.Cells[i, j]);
 // Create Excel-OLE Object
 Result := False;
 XLApp := CreateOleObject('Excel.Application');
 try
   // Hide Excel
   XLApp.Visible := False;
   // Add new Workbook
   XLApp.Workbooks.Add(xlWBatWorkSheet);
   Sheet := XLApp.Workbooks[1].WorkSheets[1];
   Sheet.Name := ASheetName;
   // Fill up the sheet
   Sheet.Range[RefToCell(1, 1), RefToCell(AGrid.RowCount, AGrid.ColCount)].Value := Data;
   Sheet.Range[RefToCell(1, 1), RefToCell(1,AGrid.ColCount)].Interior.ColorIndex := 15;
   Sheet.Range[RefToCell(1, 1), RefToCell(1,AGrid.ColCount)].Font.Bold := true;

   //Sheet.Shapes.AddShape(1, 0, 0, 450, 200);
   //Sheet.Shapes('shape1').textframe.characters.text := 'This gives error';
   // Save Excel Worksheet
   try
     XLApp.Workbooks[1].SaveAs(AFileName);
     Result := True;
   except
     // Error ?
   end;
 finally
   // Quit Excel
   if not VarIsEmpty(XLApp) then
   begin
     XLApp.DisplayAlerts := False;
     XLApp.Quit;
     XLAPP := Unassigned;
     Sheet := Unassigned;
   end;
 end;

if open then ShellExecute(Application.MainForm.Handle, nil,PChar(AFileName), nil, '', SW_MAXIMIZE);
end;


function ToExcel(AGrid: TStringGrid): Boolean;
const
  {$J+} CXlsBof: array[0..5] of Word = ($809, 8, 00, $10, 0, 0); {$J-}
  CXlsEof: array[0..1] of Word = ($0A, 00);
var
  FStream: TFileStream;
  I, J: Integer;
  AFileName,dt:string;

function GetTempDirectory: String;
var
  tempFolder: array[0..MAX_PATH] of Char;
begin
  GetTempPath(MAX_PATH, @tempFolder);
  result := StrPas(tempFolder);
end;

procedure XlsWriteCellLabel(XlsStream: TStream; const ACol, ARow: Word;
  const AValue: string);
var
  L: Word;
const
  {$J+}
  CXlsLabel: array[0..5] of Word = ($204, 0, 0, 0, 0, 0);
  {$J-}
begin
  L := Length(AValue);
  CXlsLabel[1] := 8 + L;
  CXlsLabel[2] := ARow;
  CXlsLabel[3] := ACol;
  CXlsLabel[5] := L;
  XlsStream.WriteBuffer(CXlsLabel, SizeOf(CXlsLabel));
  XlsStream.WriteBuffer(Pointer(AValue)^, L);
end;

begin
  dt:=datetimetostr(now());
  dt:=stringreplace(dt,'/','',[rfReplaceAll]);
  dt:=stringreplace(dt,'-','',[rfReplaceAll]);
  dt:=stringreplace(dt,' ','',[rfReplaceAll]);
  dt:=stringreplace(dt,'\','',[rfReplaceAll]);
  dt:=stringreplace(dt,':','',[rfReplaceAll]);
  Result := False;
//  showmessage(GetTempDirectory);
  AFileName:=GetTempDirectory+'export'+dt+'.xls';
  FStream := TFileStream.Create(PChar(AFileName), fmCreate or fmOpenWrite);
  try
    CXlsBof[4] := 0;
    FStream.WriteBuffer(CXlsBof, SizeOf(CXlsBof));
    for i := 0 to AGrid.ColCount - 1 do
      for j := 0 to AGrid.RowCount - 1 do
        XlsWriteCellLabel(FStream, I, J, stringreplace(AGrid.cells[i, j],'.',',',[rfReplaceAll]));
    FStream.WriteBuffer(CXlsEof, SizeOf(CXlsEof));
    Result := True;
  finally
    FStream.Free;
  end;

ShellExecute(Application.MainForm.Handle, nil,
    PChar(AFileName), nil, '', SW_MAXIMIZE);

end;


procedure Theader.CopyresulttoExcel1Click(Sender: TObject);
var
number,nr,i,j:integer;
tmp:string;
begin
for i:=0 to res.RowCount do res.Rows[i].Clear;
tmp:='';
nr:=results.CheckQueryNo();
number := rows_number.Value-1;
if(rows_number.Value=0) then number := results.d[nr].DataSource.DataSet.RecordCount-1;

if(nr>-1) then
        begin
        if(rows_number.Value=0) then results.d[nr].DataSource.DataSet.First;
        res.RowCount:=number+5;
        res.ColCount:=results.d[nr].DataSource.DataSet.FieldCount;

        for i:=0 to results.d[nr].DataSource.DataSet.FieldCount-1 do
                res.cells[i,0]:=results.d[nr].DataSource.DataSet.Fields.Fields[i].DisplayName;

        for j:=0 to number do
                begin
                for i:=0 to results.d[nr].DataSource.DataSet.FieldCount-1 do
                        begin
                        res.cells[i,j+1]:=results.d[nr].DataSource.DataSet.Fields.Fields[i].AsString;
                        //showmessage(tmp);
                        //results.m[nr].Lines.SaveToFile(savedialog1.FileName+'.2sql');
                        end;
                 results.d[nr].datasource.dataset.Next;
                 tmp:=tmp+chr(13)+chr(10);
                end;
        ToExcel2(res);
        end else showmessage('No result to export');
end;

procedure Theader.SpeedButton10Click(Sender: TObject);
begin
CopyresulttoExcel1.Click;
end;

procedure Theader.Analyze1Click(Sender: TObject);
var
nr:integer;
q:string;
begin
waiton;
header.Cursor:=crHourGlass;
results.Cursor:=crHourGlass;
tables.Cursor:=crHourGlass;
application.ProcessMessages;
nr:=results.CheckQueryNo();

try
q:=results.m[nr].SelText;
except q:=''; end;
try
if(q='') then q:=results.m[nr].Text;
except q:=''; end;

if q<>'' then
begin
//main.Connection.Disconnect;
//main.Connection.Server:=results.server_name[nr];
//main.Connection.Username:=results.server_login[nr];
//main.Connection.Password:=results.server_password[nr];
//main.Connection.Port:=results.server_port[nr];
//main.Connection.Open;

results.mysqlquery[nr].sql.clear;
results.mysqlquery[nr].sql.add('EXPLAIN '+q);
if(results.db[nr]<>'') then results.db[nr]:=edit1.text
	else
   begin
   results.mysqlconn[nr].Database:=results.db[nr];
   edit1.Text:=results.db[nr];
   end;
try

results.mysqlquery[nr].open;
logh(results.m[nr].Text);
except
   on E : Exception do
   log('Error: '+E.ClassName+' : '+E.Message,1);
end;

end else showmessage('No queries to analyze');
header.Cursor:=crDefault;
results.Cursor:=crDefault;
tables.Cursor:=crDefault;
waitoff;
end;

procedure Theader.Sendsugestion1Click(Sender: TObject);
begin
ShellExecute(Handle, 'open', 'mailto:info@www2.pl', '', '', SW_SHOWNORMAL);
end;

procedure Theader.Whatsnew1Click(Sender: TObject);
var
f:string;
begin
f:=ExtractFilePath( Application.ExeName );
ShellExecute(Handle, 'open', pchar(f+'versions.txt'), '', '', SW_SHOWNORMAL);
end;

procedure Theader.Showprocesslist1Click(Sender: TObject);
begin
if(header.server.Text='') then showmessage('Check server first') else
	begin
	results.NewQuery('SHOW FULL PROCESSLIST',true,true,'SHOW FULL PROCESSLIST',header.dbtype.Text);
//	results.NewQuery(get_server,get_login, get_haslo, get_port,header.edit1.text,'SELECT * FROM '+tbl.text,true,true,db.text+'.'+tbl.text+':Show all records');
   PopMenu.Visible:=false;
   end;

end;

procedure Theader.Queryanalyzer1Click(Sender: TObject);
var
f,p,p2:string;
nr:integer;
begin
f:=ExtractFilePath( Application.ExeName );
//query_analyzer.Visible:=true;
nr:=results.CheckQueryNo();
if(results.mysqlconn[nr].Server='') then showmessage('Open some query first') else
        begin
        p:=f+'QueryAnalyzer.exe';
        p2:=results.mysqlconn[nr].Server+' '+results.mysqlconn[nr].Username+' '+inttostr(results.mysqlconn[nr].port)+' '+results.mysqlconn[nr].password;
        ShellExecute(Handle, 'open', pchar(p), pchar(p2), '', SW_SHOWNORMAL);
        end;
end;

procedure Theader.Help2Click(Sender: TObject);
var
f:string;
begin
f:=ExtractFilePath( Application.ExeName );
ShellExecute(Handle, 'open', pchar(f+'help.chm'), '', '', SW_SHOWNORMAL);
end;

procedure Theader.TableDiagnostics1Click(Sender: TObject);
begin
if(edit1.Text='') then showmessage('Check database first') else
	begin
        table_diagnostics.visible:=true;
        table_diagnostics.start.click;
        end;
end;

procedure Theader.Users1Click(Sender: TObject);
begin
if(server.Text='') then showmessage('Check server first') else
	begin
        users.visible:=true;
        users.start.click;
        end;
end;

procedure Theader.Settings1Click(Sender: TObject);
begin
settings.visible:=true;
end;

procedure Theader.Redo2Click(Sender: TObject);
var
nr:integer;
begin
nr:=results.CheckQueryNo();
if results.m[nr].CanRedo then
        results.m[nr].Redo
        else showmessage('No redo available');

end;

procedure Theader.LeftTabGroup1Click(Sender: TObject);
begin
tables.Left:=0;
tables.Top:=header.Height;
tables.Height:=screen.Height-header.Height-30;
tables.width:=318;
header.Top:=0;
header.Left:=0;
header.Width:=screen.Width;
results.Top:=header.Height;
results.Left:=tables.Width;
results.Height:=screen.Height-header.Height-30;
results.Width:=screen.Width-tables.Width;
end;

procedure Theader.RightTabGroup1Click(Sender: TObject);
begin
header.Top:=0;
header.Left:=0;
header.Width:=screen.Width;

tables.Top:=header.Height;
tables.Height:=screen.Height-header.Height-30;
tables.width:=318;

results.Top:=header.Height;
results.Left:=0;
results.Height:=screen.Height-header.Height-30;
results.Width:=screen.Width-tables.Width;
tables.Left:=results.Width;
end;

procedure Theader.WMSysCommand(var Message:TWMSysCommand);
begin
 if message.CmdType=SC_MINIMIZE then
  begin
  application.Minimize;
  end;
 inherited
end;

procedure Theader.Tips1Click(Sender: TObject);
begin
tips.Visible:=true;
end;

procedure Theader.SpeedButton11Click(Sender: TObject);
var
h,nr:integer;
begin
nr:=results.CheckQueryNo();
if nr>-1 then
begin
h:=results.Height;
results.p[nr].Height:=3;
results.m[nr].Height:=h div 2-100;
results.d[nr].Height:=h div 2+100;
end else showmessage('No tab to change');
end;

procedure Theader.SpeedButton12Click(Sender: TObject);
var
h,nr:integer;
begin
nr:=results.CheckQueryNo();
if nr>-1 then
begin
h:=results.Height;
results.p[nr].Height:=h div 3;
results.m[nr].Height:=h div 3-100;
results.d[nr].Height:=h div 3+100;
results.DrawQuery();
end else showmessage('No tab to change');
end;

procedure Theader.SpeedButton13Click(Sender: TObject);
var
h,nr:integer;
begin
nr:=results.CheckQueryNo();
if nr>-1 then
begin
h:=results.Height;
results.p[nr].Height:=h;
results.m[nr].Height:=3;
results.d[nr].Height:=3;
results.DrawQuery();
end else showmessage('No tab to change');
end;

procedure Theader.SplittoSQLResult1Click(Sender: TObject);
begin
speedbutton11.click;
end;

procedure Theader.SplittoGraphSQLResult1Click(Sender: TObject);
begin
Speedbutton12.Click;
end;

procedure Theader.Designview1Click(Sender: TObject);
begin
speedbutton13.click;
end;

procedure Theader.SpeedButton14Click(Sender: TObject);
begin
results.GenerateQuery();
SpeedButton11.click;
end;

procedure Theader.ApplicationEvents1Deactivate(Sender: TObject);
begin
main.SaveLog(TForm(self),nil,'ApplicationEvents');

end;

procedure Theader.ApplicationEvents1Exception(Sender: TObject;
  E: Exception);
begin
main.SaveLog(TForm(self),nil,'ApplicationEvents: Error: '+E.Message);
end;

procedure Theader.ApplicationEvents1Minimize(Sender: TObject);
begin
main.SaveLog(TForm(self),Sender,'Minimize');
end;

procedure Theader.ApplicationEvents1Restore(Sender: TObject);
begin
main.SaveLog(TForm(self),Sender,'Restore');
end;

procedure Theader.ApplicationEvents1ShowHint(var HintStr: String;
  var CanShow: Boolean; var HintInfo: THintInfo);
begin
main.SaveLog(TForm(self),nil,'HintShow: '+HintStr);
end;

procedure Theader.EMailresultasattachement1Click(Sender: TObject);
const olMailItem = 0;
var Outlook: OLEVariant;
     MailItem: Variant;
nr,i,j:integer;
tmp:string;

        function GetTempDirectory: String;
        var
          tempFolder: array[0..MAX_PATH] of Char;
        begin
          GetTempPath(MAX_PATH, @tempFolder);
          result := StrPas(tempFolder);
        end;

begin
for i:=0 to res.RowCount do res.Rows[i].Clear;
tmp:='';
nr:=results.CheckQueryNo();
if(nr>-1) then
        begin
        results.d[nr].DataSource.DataSet.First;
        res.RowCount:=results.d[nr].DataSource.DataSet.RecordCount+4;
        res.ColCount:=results.d[nr].DataSource.DataSet.FieldCount;

        for i:=0 to results.d[nr].DataSource.DataSet.FieldCount-1 do
                res.cells[i,0]:=results.d[nr].DataSource.DataSet.Fields.Fields[i].DisplayName;

        for j:=0 to results.d[nr].DataSource.DataSet.RecordCount-1 do
                begin
                for i:=0 to results.d[nr].DataSource.DataSet.FieldCount-1 do
                        begin
                        res.cells[i,j+1]:=results.d[nr].DataSource.DataSet.Fields.Fields[i].AsString;
                        //showmessage(tmp);
                        //results.m[nr].Lines.SaveToFile(savedialog1.FileName+'.2sql');
                        end;
                 results.d[nr].datasource.dataset.Next;
                 tmp:=tmp+chr(13)+chr(10);
                end;
        ToExcel2(res, false);
        try
        Outlook:=GetActiveOleObject('Outlook.Application') ;
        except
         Outlook:=CreateOleObject('Outlook.Application') ;
        end;
        MailItem := Outlook.CreateItem(olMailItem) ;
        //with MailItem do begin
         MailItem.Recipients.Add('delphi.guide@about.com') ;
         MailItem.Subject := 'Subject:m-SQL: SQL Query Result';
         MailItem.Body := 'Welcome to my homepage: http:';
         MailItem.Attachments.Add(GetTempDirectory+'mSQLexport.xls') ;
         MailItem.Send;
        //end; {with}
         Outlook := Unassigned;
        //end;
        end else showmessage('No result to export');
end;

procedure Theader.GenerateQueryfromgraph1Click(Sender: TObject);
begin
speedbutton14.Click;
end;

procedure Theader.CheckBox1Click(Sender: TObject);
var
nr:integer;
begin
nr:=results.CheckQueryNo();
if(checkbox1.Checked) then
   results.UFT8[nr] := true
   else
   results.UFT8[nr] := false;

end;

procedure Theader.ComboBox1Change(Sender: TObject);
begin
results.Encoding[results.CheckQueryNo()] := combobox1.Text;
end;

end.
