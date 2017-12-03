unit Unit7;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls,ClipBrd, Grids, shellapi, Unit3, DBGrids,
  CRGrid, Aligrid;

type
  TDBPopMenu = class(TForm)
    SpeedButton1: TSpeedButton;
    Edit1: TEdit;
    Edit2: TEdit;
    ComboBox2: TComboBox;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    Bevel1: TBevel;
    field: TEdit;
    SpeedButton6: TSpeedButton;
    memo_temp: TMemo;
    res_tmp: TStringGrid;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    Bevel2: TBevel;
    SpeedButton9: TSpeedButton;
    res_list: TComboBox;
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure CopyResultToGrid(dbgrid:TcrdbGrid;res:TStringAlignGrid);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DBPopMenu: TDBPopMenu;

implementation

uses Unit4, Unit8, Unit26;

{$R *.DFM}

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


procedure TDBPopMenu.SpeedButton6Click(Sender: TObject);
var
i:integer;
nr:integer;
begin
/// edit memo
nr:=results.CheckQueryNo();
results.d[nr].DataSource.DataSet.First;
for i:=1 to strtoint(edit2.text)-1 do results.d[nr].DataSource.DataSet.Next;
memo_text.Memo1.Text:=results.d[nr].DataSource.DataSet.Fields.Fields[strtoint(edit1.text)].AsString; //wartosc komorki
results.d[nr].DataSource.DataSet.First;
dbpopmenu.Visible:=false;
end;

procedure TDBPopMenu.SpeedButton5Click(Sender: TObject);
var
i,nr:integer;
wartosc:string;
begin
// copy field to clipboard
nr:=results.CheckQueryNo();
results.d[nr].DataSource.DataSet.First;
for i:=1 to strtoint(edit2.text)-1 do results.d[nr].DataSource.DataSet.Next;
wartosc:=results.d[nr].DataSource.DataSet.Fields.Fields[strtoint(edit1.text)-1].AsString; //wartosc komorki
//results.d[nr].DataSource.DataSet.First;
Clipboard.AsText:=wartosc;
DBpopmenu.Visible:=false;
end;

procedure TDBPopMenu.SpeedButton1Click(Sender: TObject);
var
i,nr:integer;
suma,wartosc:string;
begin
wartosc:='';
suma:='';
nr:=results.CheckQueryNo();
results.d[nr].DataSource.DataSet.First;
for i:=1 to results.d[nr].DataSource.DataSet.RecordCount do
        begin
        wartosc:=results.d[nr].DataSource.DataSet.Fields.Fields[strtoint(edit1.text)-1].AsString; //wartosc komorki
        suma:=suma+wartosc+chr(13)+chr(10);
        results.d[nr].DataSource.DataSet.Next;
        end;
results.d[nr].DataSource.DataSet.First;
Clipboard.AsText:=suma;
DBpopmenu.Visible:=false;
end;

procedure TDBPopMenu.SpeedButton3Click(Sender: TObject);
var
i,nr:integer;
suma,wartosc:string;
begin
wartosc:='';
suma:='';
nr:=results.CheckQueryNo();
results.d[nr].DataSource.DataSet.First;
res_tmp.ColCount:=1;
res_tmp.RowCount:=1;
for i:=1 to results.d[nr].DataSource.DataSet.RecordCount do
        begin
        wartosc:=results.d[nr].DataSource.DataSet.Fields.Fields[strtoint(edit1.text)-1].AsString; //wartosc komorki
        res_tmp.cells[0,i-1]:=wartosc;
        results.d[nr].DataSource.DataSet.Next;
        res_tmp.RowCount:=res_tmp.RowCount+1
        end;
results.d[nr].DataSource.DataSet.First;
ToExcel(res_tmp);
DBpopmenu.Visible:=false;
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


procedure TDBPopMenu.SpeedButton2Click(Sender: TObject);
var
nr:integer;
cap,query,pole:string;
begin
nr:=results.CheckQueryNo();
pole:=dbpopmenu.Caption;
query:=results.m[nr].text;
if(query<>'') then
begin
if(strpos(pchar(uppercase(query)),'WHERE')<>nil) then
        begin
        query:=strbefore(query,'WHERE')+'WHERE '+pole+combobox2.Text+'"'+field.text+'" and '+strafter(query,'WHERE');
        end else
        begin
        cap:=results.GetTitle(nr);
        cap:=StrBefore(strafter(cap,'.'),':');
        query:=query+' WHERE '+pole+combobox2.Text+''''+field.text+'''';
        end;
end;
if(query='') then
        begin
        cap:=results.GetTitle(nr);
        cap:=StrBefore(strafter(cap,'.'),':');
        query:='SELECT * FROM '+cap+' WHERE '+pole+combobox2.Text+''''+field.text+'''';
        end;
//showmessage(query);
results.NewQuery(query,false,false,pole+combobox2.Text+'"'+field.text+'"',header.dbtype.Text);
//results.m[nr+1].text:='tutaj zapytanie nowe:'+query;
DBpopmenu.Visible:=false;
header.execute.click;
end;

procedure TDBPopMenu.SpeedButton7Click(Sender: TObject);
var
nr:integer;
begin
nr:=results.CheckQueryNo();
results.d[nr].Columns.Items[strtoint(edit1.text)-1].Width:=0;
DBpopmenu.Visible:=false;
end;

procedure TDBPopMenu.SpeedButton8Click(Sender: TObject);
var
nr:integer;
begin
nr:=results.CheckQueryNo();
try results.d[nr].AdjustColumns; except end;
DBpopmenu.Visible:=false;
end;

procedure TDBPopMenu.CopyResultToGrid(dbgrid:TcrdbGrid;res:TStringAlignGrid);
var
i,j:integer;
tmp:string;
begin
for i:=0 to res.RowCount do res.Rows[i].Clear;
tmp:='';
dbgrid.DataSource.DataSet.First;
res.FixedCols:=0;
res.RowCount:=dbgrid.DataSource.DataSet.RecordCount+1;
res.ColCount:=dbgrid.DataSource.DataSet.FieldCount;

for i:=0 to dbgrid.DataSource.DataSet.FieldCount-1 do
        res.cells[i,0]:=dbgrid.DataSource.DataSet.Fields.Fields[i].DisplayName;

for j:=0 to dbgrid.DataSource.DataSet.RecordCount-1 do
        begin
        for i:=0 to dbgrid.DataSource.DataSet.FieldCount-1 do
                begin
                res.cells[i,j+1]:=dbgrid.DataSource.DataSet.Fields.Fields[i].AsString;
                //showmessage(tmp);
                //results.m[nr].Lines.SaveToFile(savedialog1.FileName+'.2sql');
                end;
         dbgrid.datasource.dataset.Next;
         tmp:=tmp+chr(13)+chr(10);
        end;
end;

procedure TDBPopMenu.SpeedButton9Click(Sender: TObject);
var
nr,i,j:integer;
tmp:string;
begin
if(dbpopmenu.res_list.Text='Select result') then showmessage('Select result first')
        else
        begin
        dbpopmenu.Visible:=false;
        for i:=0 to results.PageControl1.PageCount-1 do
                begin
                tmp:=strafter(results.PageControl1.Pages[i].Caption,')');
                if tmp = dbpopmenu.res_list.Text then
                        begin
                        tmp:=strafter(results.PageControl1.Pages[i].Caption,'(');
                        tmp:=strbefore(tmp,')');
                        j:=strtoint(tmp);
                        end;
                end;
        nr:=results.CheckQueryNo();
        comparing_results.Visible:=true;
        comparing_results.res1.ColCount:=1;
        CopyResultToGrid(results.d[nr],comparing_results.res1);
        CopyResultToGrid(results.d[j],comparing_results.res2);
        comparing_results.FormStyle:=fsStayOnTop;
        comparing_results.FormStyle:=fsNormal;
        end;
end;

end.
