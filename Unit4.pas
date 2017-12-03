unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, ComCtrls, ExtCtrls, ToolWin, Tabnotbk, Db,
  DBAccess, MyAccess, MemDS, ADODB, richedit, CRGrid, SynEdit, SynMemo,
  SynEditHighlighter, SynHighlighterSQL, SynCompletionProposal,
  SynAutoCorrect, scSystemInfo, Menus, registry,Winsock, AppEvnts;

type
 TGraphSet = record
        Count : integer;
        ActiveNo:integer;
        Active: array[0..100] of char;
        Enabled: array[0..100] of char;
        Nazwa: array[0..100] of string;
        Tabela: array[0..100] of TStringGrid;
        PolaczenieOd: array[0..100] of string;
        PolaczenieDo: array[0..100] of string;
        PolaczenieTyp: array[0..100] of string;
        PolaczenieMax:integer;
        PolaczenieTemp:string;
        end;


  Tresults = class(TForm)
    StatusBar1: TStatusBar;
    PageControl1: TPageControl;
    sqlstyle: TSynSQLSyn;
    podpowiedzi: TSynCompletionProposal;
    korekta: TSynAutoCorrect;
    refresh: TButton;
    res: TStringGrid;
    PopupMenu1: TPopupMenu;
    Execute1: TMenuItem;
    ApplicationEvents1: TApplicationEvents;
    DataSource1: TDataSource;
    Copy1: TMenuItem;
    Paste1: TMenuItem;
    systeminfo: TscSystemInfo;
    procedure PageControl1Change(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure KlikDB(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
//    procedure WyrzucBledy(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
    procedure PoOpenQuery(DataSet: TDataSet);
    procedure QueryOnKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure QueryOnKeyPress(Sender: TObject; var Key: Char);
    procedure DBMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure MemoDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
    procedure MemoDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure PanelDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
    procedure PanelDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure refreshClick(Sender: TObject);
    procedure Execute1Click(Sender: TObject);
    procedure ConditionsMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure ConditionsDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure ConditionsDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
    procedure TablesMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure TablesSelectCell(Sender: TObject; ACol, ARow: Integer; var CanSelect: Boolean);
    procedure TablesDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure TablesDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
    function GenerateQuery():string;
    procedure ComboChange(Sender: TObject);
    procedure TablesTopLeftChanged(Sender: TObject);
    procedure ApplicationEvents1Activate(Sender: TObject);
    procedure DrawQuery();
    procedure PolaczPunkty(x1,y1,x2,y2,nr,w:integer;typ:string);
    function ApplicationEvents1Help(Command: Word; Data: Integer; var CallHelp: Boolean): Boolean;
    procedure Copy1Click(Sender: TObject);
    procedure Paste1Click(Sender: TObject);
    function TableActive(nr:integer;name:string):boolean;
    procedure QueryBeforeOpen(DataSet: TDataSet);
    procedure ConnectionBeforeConnect(Sender: TObject);
    procedure ConnectionAfterConnect(Sender: TObject);
    procedure ColorCell(Sender: TObject; const Rect: TRect; DataCol: Integer;  Column: TColumn;  State: TGridDrawState) ;
  private
    { Private declarations }
  public
 	  db: array[0..100] of string;
 	  m: array[0..100] of TSynMemo;
	  t: array[0..100] of TTabsheet;
	  s_top: array[0..100] of TSplitter;
	  s: array[0..100] of TSplitter;
	  d: array[0..100] of Tcrdbgrid;
	  p: array[0..100] of Tpanel;
          gr: array[0..100] of TGraphSet;
          mysqlconn: array[0..100] of TMyConnection;
          mysqlquery: array[0..100] of TMyQuery;
          mysqldata: array[0..100] of Tmydatasource;
          mssqldata: array[0..100] of Tdatasource;
          mssqlconn: array[0..100] of TADOConnection;
          mssqlquery: array[0..100] of TADOQuery;
          msservername: array[0..100] of string;
          msservertype: array[0..100] of string;
          Encoding: array[0..100] of string;
          UFT8: array[0..100] of boolean;

          innerjoin: array[0..100] of TRadioButton;
          rightjoin: array[0..100] of TRadioButton;
          leftjoin: array[0..100] of TRadioButton;
	  conditions: array[0..100] of TStringGrid;
     function NewQuery(query:string;execute,OnlyResult:boolean;title,typ:string):string;
     function CheckNewQueryNo():string;
     function CheckQueryNo(nr:integer = -1):integer;
     function GetTitle(nr:integer = -1):string;
     procedure DodajHinta(podpowiedz, wyswietlanie:string);
     function ReconnectFromTop(nr:integer=-1):integer;
     function GetConnectionIdFromTop():integer;
    { Public declarations }
  end;


var
  results: Tresults;
  akcja:boolean;


type TTextAttributes = record
        Font      : TFont;
        BackColor : TColor;
        end;

type TTextRange = record
        chrg: TCharRange;
        lpstrText: PAnsiChar;
        end;

type tmypanel = class(TPanel);


implementation

uses Unit1, Unit3, Unit7, Unit8, Unit12, Unit21, Unit22, Unit2, Unit24;

{$R *.DFM}

{procedure Tresults.WyrzucBledy(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
begin
showmessage('blad=>'+e.Message);
end;}

procedure TResults.DodajHinta(podpowiedz, wyswietlanie:string);
var
i:integer;
bylo:boolean;
begin
bylo:=false;
for i:=0 to podpowiedzi.InsertList.Count-1 do
        if podpowiedzi.InsertList.Strings[i]=wyswietlanie then bylo:=true;

if not bylo then
        begin
        podpowiedzi.ItemList.Add(podpowiedz);
        podpowiedzi.InsertList.Add(wyswietlanie);
        end;
end;

procedure Tresults.KlikDB(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
coord:tgridcoord;
memo_height,nr,i:integer;
resname,pos:string;
names:tstrings;
begin
try
nr:=results.CheckQueryNo();
coord:=results.d[nr].MouseCoord(X,Y);
pos:='X='+inttostr(coord.x)+' Y='+inttostr(coord.y);
if(Button=mbRight) then
	begin
        dbpopmenu.FormStyle:=fsStayOnTop;
        dbpopmenu.FormStyle:=fsNormal;
	dbpopmenu.Left:=x+results.Left;
        try
        memo_height:=results.m[nr].Height;
        except
        memo_height:=0;
        end;
	dbpopmenu.Top:=y+results.Top+memo_height;
	dbpopmenu.Edit1.text:=inttostr(coord.x);
	dbpopmenu.Edit2.text:=inttostr(coord.y);
        dbpopmenu.Caption:=results.d[nr].DataSource.DataSet.Fields.Fields[coord.x-1].FullName;
        dbpopmenu.field.text:=results.d[nr].DataSource.DataSet.Fields.Fields[coord.x-1].AsString;
 //  showmessage(results.d[nr].DataSource.DataSet.Fields.Fields[coord.x-1].AsString); //wartosc komorki
   //	showmessage(results.d[nr].DataSource.DataSet.Fields.FieldByNumber(coord.x).AsString);   //wartosc komorki
        dbpopmenu.res_list.Clear;
        dbpopmenu.res_list.Text:='Select result';
        for i:=0 to results.PageControl1.PageCount-1 do
                begin
                resname:=GetTitle(i);
                if resname<>'' then dbpopmenu.res_list.Items.Add(resname);
                end;
	dbpopmenu.Visible:=true;
        end;

if(
   (results.d[nr].DataSource.DataSet.Fields.Fields[coord.x-1].DataType=ftBlob) or
   (results.d[nr].DataSource.DataSet.Fields.Fields[coord.x-1].DataType=ftMemo)
   ) then
   begin
   dbpopmenu.SpeedButton6.Enabled:=true;
   memo_text.Memo1.Text:=results.d[nr].DataSource.DataSet.Fields.Fields[coord.x-1].AsString;
   end
   else
   begin
   memo_text.memo1.Clear;
   dbpopmenu.SpeedButton6.Enabled:=false;
   end;
except end;
end;

function Tresults.GetTitle(nr:integer = -1):string;
var
i:integer;
capt,res:string;
czytaj:boolean;
begin
if nr = -1 then nr:=results.PageControl1.ActivePageIndex;

czytaj:=false;
//nr:=results.PageControl1.ActivePageIndex;
capt:=results.PageControl1.Pages[nr].Caption;
for i:=0 to length(capt) do
        begin
        if czytaj then res:=res+capt[i];
        if(capt[i]=')') then czytaj:=true;
        end;
result:=res;
end;

function Tresults.CheckQueryNo(nr:integer = -1):integer;
var
res,capt:string;
nr_oryg:integer;
begin
nr_oryg:=nr;
try
if nr_oryg = -1 then nr:=results.PageControl1.ActivePageIndex;

capt:=results.PageControl1.Pages[nr].Caption;
nr:=2;
res:='';
while capt[nr]<>')' do
        begin
        res:=res+capt[nr];
        inc(nr);
        end;

if nr_oryg = -1 then
        result:=strtoint(res)
        else
        result:=strtoint(res)+1;
except
end;
if results.PageControl1.PageCount=0 then
        begin
        result := -1;
        end

end;

function Tresults.CheckNewQueryNo():string;
var
i,max:integer;
begin
max:=0;
//showmessage(inttostr(results.PageControl1.PageCount-1));
for i:=0 to results.PageControl1.PageCount-1 do
        begin
        admin.memo1.lines.add('W petli CheckNewQueryNo, i='+inttostr(i));
        //showmessage(inttostr(CheckQueryNo(i)));
        if CheckQueryNo(i)>max then max:=CheckQueryNo(i);
        end;
result:=inttostr(max);
end;

function Tresults.NewQuery(query:string;execute,OnlyResult:boolean;title,typ:string):string;
var
ss:Tshiftstate;
numer_polaczenia,nr:integer;
database,str,name:string;
rect:trect;
begin
nr:=strtoint(CheckNewQueryNo());

numer_polaczenia:=GetConnectionIdFromTop();
//server:='';
db[nr]:=header.edit1.text;
database:=db[nr];
msservername[nr]:=Connections[numer_polaczenia].server_opis;
msservertype[nr]:=Connections[numer_polaczenia].server_typ;

main.SaveLog(TForm(self),nil,'NewQuery: nr='+inttostr(nr)+', numer_polaczenia='+inttostr(numer_polaczenia)+',servername[nr]='+msservername[nr]+',servertype[nr]='+msservertype[nr]);
main.SaveLog(TForm(self),nil,'NewQuery: results...sqlconn[nr].Port='+inttostr(Connections[numer_polaczenia].server_port)+',results....sqlconn[nr].Server='+Connections[numer_polaczenia].server_name+',results....sqlconn[nr].Username='+Connections[numer_polaczenia].server_login+',results....sqlconn[nr].Database='+database);
//showmessage('res.db='+db[nr]);
//showmessage('Tutaj sprawdzic numer polaczenia z main aby wpisac to istniejacego NR');

main.SaveLog(TForm(self),nil,'NewQuery(): '+header.dbtype.Text);

admin.memo1.lines.add('nr = '+inttostr(nr));
//admin.memo1.lines.add('results.server_name['+inttostr(nr)+']:='+server);
//admin.memo1.lines.add('results.server_login['+inttostr(nr)+']:='+login);

if(title='') then
        begin
        if(settings.query_names.Checked=true) then name:=InputBox('Name input','Enter query name', '')
        end
        else name:=title;

if(settings.execute.Checked=true) then execute:=true;

results.t[nr]:= TTabSheet.Create(results.PageControl1);
results.t[nr].PageControl := results.PageControl1;
PageControl1.ActivePageIndex:=PageControl1.PageCount-1;
admin.memo1.lines.add('PageControl1.ActivePageIndex = '+inttostr(PageControl1.ActivePageIndex));
if(name='') then name:=database+'@'+Connections[numer_polaczenia].server_opis+':Query '+inttostr(nr);
results.t[nr].Caption:='('+inttostr(nr)+')'+name;

results.m[nr]:=TSynMemo.Create(results);
results.m[nr].Highlighter:=sqlstyle;
results.m[nr].Parent:=results.t[nr];
results.m[nr].Align:=alTop;
results.m[nr].Text:=query;
results.m[nr].Visible:=True;
results.m[nr].OnKeyDown:=QueryOnKeyDown;
results.m[nr].OnKeyPress:=QueryOnKeyPress;
results.m[nr].ScrollBars:=ssBoth;
results.m[nr].Gutter.LeftOffset:=1;
results.m[nr].Gutter.LineNumberStart:=1;
results.m[nr].Gutter.ShowLineNumbers:=true;
results.m[nr].Gutter.Gradient:=true;
results.m[nr].Font.Size:=strtoint(settings.fontsize.text);
results.m[nr].OnDragOver:=MemoDragOver;
results.m[nr].OnDragDrop:=MemoDragDrop;
results.m[nr].PopupMenu:=popupmenu1;
results.podpowiedzi.editor:=results.m[nr];
results.korekta.Editor:=results.m[nr];
results.korekta.Enabled:=true;

results.p[nr]:=TPanel.Create(results);
results.p[nr].parent:=results.t[nr];
results.p[nr].Align:=alTop;
results.p[nr].Visible:=true;
results.p[nr].Height:=3;
results.p[nr].OnDragOver:=PanelDragOver;
results.p[nr].OnDragDrop:=PanelDragDrop;
rect.Top:=1;
rect.Left:=1;
rect.Right:=results.p[nr].Width;
rect.Bottom:=results.p[nr].Height;
//TMyPanel(results.p[nr]).Canvas.brush.Color:=clWhite;
//TMyPanel(results.p[nr]).Canvas.FillRect(rect);

//// comboboxy dla JOINA
results.innerjoin[nr]:=TRadioButton.Create(results);
results.innerjoin[nr].parent:=p[nr];
results.innerjoin[nr].Visible:=true;
results.innerjoin[nr].Top:=10;
results.innerjoin[nr].Left:=10;
results.innerjoin[nr].Caption:='INNER JOIN';

results.leftjoin[nr]:=TRadioButton.Create(results);
results.leftjoin[nr].parent:=p[nr];
results.leftjoin[nr].Visible:=true;
results.leftjoin[nr].Top:=10;
results.leftjoin[nr].Left:=115;
results.leftjoin[nr].Caption:='LEFT JOIN';
results.leftjoin[nr].Checked:=true;

results.rightjoin[nr]:=TRadioButton.Create(results);
results.rightjoin[nr].parent:=p[nr];
results.rightjoin[nr].Visible:=true;
results.rightjoin[nr].Top:=10;
results.rightjoin[nr].Left:=210;
results.rightjoin[nr].Caption:='RIGHT JOIN';

results.conditions[nr]:=TStringGrid.Create(results);
results.conditions[nr].parent:=p[nr];
results.conditions[nr].Visible:=true;
results.conditions[nr].ColCount:=40;
results.conditions[nr].RowCount:=30;
results.conditions[nr].FixedRows:=2;
results.conditions[nr].top:=100;
results.conditions[nr].left:=10;
results.conditions[nr].Height:=180;
results.conditions[nr].width:=700;
results.conditions[nr].Font.Size:=9;
results.conditions[nr].DefaultRowHeight:=15;
results.conditions[nr].Cells[0,0]:='Table';
results.conditions[nr].Cells[0,1]:='Field';
results.conditions[nr].Cells[0,2]:='       \ AND';
results.conditions[nr].Cells[0,3]:='OR';
results.Conditions[nr].OnDragOver:=ConditionsDragOver;
results.Conditions[nr].OnDragDrop:=ConditionsDragDrop;



results.Conditions[nr].OnMouseMove:=ConditionsMouseMove;



results.s_top[nr]:=TSplitter.Create(results);
results.s_top[nr].Align:=alTop;
results.s_top[nr].Beveled:=true;
results.s_top[nr].parent:=results.t[nr];
results.s_top[nr].Visible:=true;
results.s_top[nr].Top:=results.p[nr].Height+1;
results.s_top[nr].Height:=10;

results.s[nr]:=TSplitter.Create(results);
results.s[nr].Align:=alTop;
results.s[nr].Beveled:=true;
results.s[nr].parent:=results.t[nr];
results.s[nr].Visible:=true;
results.s[nr].Top:=results.m[nr].Height+results.p[nr].Height+1;
results.s[nr].Height:=10;

if(OnlyResult=true) then
	begin
        results.m[nr].Height:=1;
        end;


results.d[nr]:=TcrdbGrid.Create(results);
results.d[nr].Align:=alClient;
results.d[nr].Parent:=results.t[nr];
results.d[nr].Visible:=true;
results.d[nr].OnMouseMove:=DBMouseMove;
results.d[nr].Font.Size:=strtoint(settings.res_font_size.text);
results.d[nr].OptionsEx:=[dgeEnableSort,dgeLocalFilter,dgeLocalSorting,dgeSummary];
results.d[nr].TitleFont.Style:=[fsBold];
results.d[nr].OnDrawColumnCell:=ColorCell;



if typ='MySQL' then
        begin
        results.mysqlconn[nr]:=TMyConnection.Create(results);
        results.mysqlconn[nr].Port:=Connections[numer_polaczenia].server_port;
        results.mysqlconn[nr].Server:=Connections[numer_polaczenia].server_name;
        results.mysqlconn[nr].LoginPrompt:=false;
        results.mysqlconn[nr].Username:=Connections[numer_polaczenia].server_login;
        results.mysqlconn[nr].Database:=database;
        results.mysqlconn[nr].Password:=Connections[numer_polaczenia].server_password;
        results.mysqlconn[nr].BeforeConnect:=ConnectionBeforeConnect;
        results.mysqlconn[nr].AfterConnect:=ConnectionAfterConnect;
        results.mysqlconn[nr].Options.UseUnicode:=header.CheckBox1.Checked;
        results.mysqlconn[nr].Options.Charset:=header.ComboBox1.Text;

        results.mysqlconn[nr].Open;
        results.mysqlquery[nr]:=TMyQuery.Create(results);
        results.mysqlquery[nr].Connection:=results.mysqlconn[nr];
        results.mysqlquery[nr].SQL.Clear;
        results.mysqlquery[nr].SQL.Add(query);
        results.mysqlquery[nr].AfterOpen:=PoOpenQuery;
        results.mysqlquery[nr].BeforeOpen:=QueryBeforeOpen;
        //results.myquery[nr].OnPostError:=WyrzucBledy;

        results.mysqldata[nr]:=TMyDataSource.Create(results);
        results.mysqldata[nr].DataSet:=results.mysqlquery[nr];
        results.d[nr].DataSource:=results.mysqldata[nr];
        results.d[nr].OnMouseUp:=KlikDB;
        if (execute) then
                begin
                try
                results.mysqlconn[nr].Connect;
                results.mysqlquery[nr].open;
                except
                 on E : Exception do
                      begin
                      main.SaveLog(TForm(self),nil,'MSSQL:Execute: Open ERROR: '+E.Message);
                      end;
                end;
           end;
        end;

if typ='MSSQL' then
        begin
        results.mssqlconn[nr]:=TADOConnection.Create(results);
        str:='Provider=SQLOLEDB.1;Password='+Connections[numer_polaczenia].server_password;
        str:=str+';Persist Security Info=True;User ID='+Connections[numer_polaczenia].server_login;
        str:=str+';Initial Catalog='+database;
        str:=str+';Data Source='+Connections[numer_polaczenia].server_name+','+inttostr(Connections[numer_polaczenia].server_port);

        results.mssqlconn[nr].ConnectionString:=str;
        results.mssqlconn[nr].LoginPrompt:=false;
        results.mssqlconn[nr].Open;
        results.mssqlconn[nr].BeforeConnect:=ConnectionBeforeConnect;
        results.mssqlconn[nr].AfterConnect:=ConnectionAfterConnect;

        results.mssqlquery[nr]:=TADOQuery.Create(results);
        results.mssqlquery[nr].Connection:=results.mssqlconn[nr];
        results.mssqlquery[nr].SQL.Clear;
        results.mssqlquery[nr].SQL.Add(query);
        results.mssqlquery[nr].AfterOpen:=PoOpenQuery;
        results.mssqlquery[nr].BeforeOpen:=QueryBeforeOpen;
        //results.myquery[nr].OnPostError:=WyrzucBledy;

        results.mssqldata[nr]:=TDataSource.Create(results);
        results.mssqldata[nr].DataSet:=results.mssqlquery[nr];
        results.d[nr].DataSource:=results.mssqldata[nr];
        results.d[nr].OnMouseUp:=KlikDB;
        if (execute) then
                begin
                try
                results.mssqlquery[nr].open;
                //results.mssqlconn[nr].Connec
                except end;
           end;
        end;


admin.memo1.lines.add('Po new query, nr='+inttostr(nr));
PageControl1.OnChange(nil);
res.Visible:=false;
try results.d[nr].AdjustColumns; except end;
//showmessage(db[nr]);
end;

procedure Tresults.PageControl1Change(Sender: TObject);
var
i,nr,n:integer;
begin
nr:=results.CheckQueryNo();
results.podpowiedzi.editor:=results.m[nr];
for i:=0 to results.PageControl1.PageCount-1 do results.PageControl1.Pages[i].Highlighted:=false;
results.PageControl1.Pages[results.PageControl1.ActivePageIndex].Highlighted:=true;
results.korekta.Editor:=results.m[nr];
results.korekta.Enabled:=true;
header.Edit1.text:=db[nr];
header.server.text:=msservername[nr];
header.dbtype.text:=msservertype[nr];
admin.memo1.lines.add('Zmiana zakladki na nr = '+inttostr(nr));
header.combobox1.text := results.Encoding[nr];
if results.UFT8[nr] then header.checkbox1.Checked:=true else header.checkbox1.Checked:=false;
DrawQuery();
end;

procedure Tresults.FormClose(Sender: TObject; var Action: TCloseAction);
var
num,nr,nr2,nr3,i,j:integer;
begin
try
action:=caNone;
if settings.askforsave.checked then
    if(application.messagebox('Do You want to save this query ?','Save Query?',MB_YESNO)=6) then
            begin
            header.SpeedButton2.click;
            end;
i:=results.PageControl1.ActivePageIndex+1;
j:=i;
if pagecontrol1.PageCount=1 then res.Visible:=true;
results.PageControl1.Pages[j-1].Destroy;
except showmessage('No queries to close'); end;
end;

procedure TResults.PoOpenQuery(DataSet: TDataSet);
var
q,q2,c,f:string;
nr:integer;
begin
nr:=results.CheckQueryNo();
f:=inttostr(results.d[nr].DataSource.DataSet.FieldCount);
c:=inttostr(results.d[nr].DataSource.DataSet.RecordCount);
results.statusbar1.panels[0].Text:='record no:'+c;
results.statusbar1.panels[1].Text:='fields no: '+f;

q:=results.m[nr].SelText;
if q<>'' then if pos(' ',q)=0 then q:='SELECT * FROM '+q;
if q='' then q:=results.m[nr].Text;
q2:=results.mysqlquery[nr].SQL.Text;
main.SaveLog(TForm(self),nil,'AfterOpenQuery(): Type:'+header.dbtype.text+' :Query: Should be: '+q+': Is:'+q2);
end;

function GetWord(RichEdit: TRichEdit):string;
var
  BegPos, EndPos,X,Y: Integer;

        function RECharIndexByPos(RichEdit: TRichEdit; X, Y: Integer): Integer;
        var
        P:TPoint;
        begin
        P := Point(X, Y);
        Result := SendMessage(RichEdit.Handle, EM_CHARFROMPOS, 0, longint(@P));
        end;


        function REGetTextRange(RichEdit: TRichEdit; BeginPos, MaxLength: Integer): string;
        var
          TextRange: TTextRange;
        begin
        if MaxLength>0 then
                begin
                SetLength(Result, MaxLength);
                with TextRange do
                        begin
                        chrg.cpMin := BeginPos;
                        chrg.cpMax := BeginPos+MaxLength;
                        lpstrText := PChar(Result);
                        end;
                SetLength(Result, SendMessage(RichEdit.Handle, EM_GETTEXTRANGE, 0, longint(@TextRange)));
                end
           else Result:='';
        end;


begin
X:=loword(RichEdit.Perform(messages.EM_POSFROMCHAR, richedit.selstart, 0))-3;
Y:=hiword(RichEdit.Perform(messages.EM_POSFROMCHAR, richedit.selstart, 0));
BegPos := RECharIndexByPos(RichEdit, X,  Y);
if(BegPos < 0) or (SendMessage(RichEdit.Handle,WM_USER + 76,3,BegPos) and ($20 or $10) <> 0 ) then
        begin
        result:='';
        exit;
        end;
if SendMessage(RichEdit.Handle, WM_USER + 76,3,BegPos-1) and ($20 or $10)  =  0  then BegPos:=SendMessage(RichEdit.Handle, WM_USER + 76, 4, BegPos);
EndPos:=SendMessage(RichEdit.Handle,WM_USER + 76,5,BegPos);
Result:=TrimRight(REGetTextRange(RichEdit, BegPos, EndPos - BegPos));
end;


procedure TResults.QueryOnKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
akcja:=true;
if (ssCtrl in Shift) and (key=69) then
        begin
        header.execute.Click;
        akcja:=false;
        Key:=0;
        end;
if ((ssCtrl in Shift) and (key=73)) then akcja:=false;
if ((ssCtrl in Shift) and (key=74)) then akcja:=false;
if ((ssCtrl in Shift) and (key=66)) then akcja:=false;
if ((ssCtrl in Shift) and (key=82)) then akcja:=false;
if ((ssCtrl in Shift) and (key=76)) then akcja:=false;
if ((ssCtrl in Shift) and (key=77)) then akcja:=false;
if ((ssCtrl in Shift) and (key=85)) then akcja:=false;
if ((ssCtrl in Shift) and (key=79)) then header.SpeedButton1.click;
if ((ssCtrl in Shift) and (key=85)) then header.SpeedButton2.click;
end;

procedure TResults.QueryOnKeyPress(Sender: TObject; var Key: Char);
var
nr:integer;
begin
if not akcja then key:=#0;
end;

procedure TResults.DBMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
var
nr:integer;
begin
//nr:=results.CheckQueryNo();
if(DBpopmenu.Visible=true) then DBpopmenu.Visible:=false;
//d[nr].sel
end;

procedure TResults.MemoDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
var
nr:integer;
begin
nr:=results.CheckQueryNo();
if source is ttreeview Then
    begin
    zapytanie.Left:=results.Left+45;
    zapytanie.Top:=results.Top+m[nr].Height-zapytanie.Height+m[nr].top+30;
    zapytanie.visible:=true;
    accept := True;
    end
  else
    accept := False;
end;

procedure TResults.MemoDragDrop(Sender, Source: TObject; X, Y: Integer);
var
i,j:integer;
p:TDisplayCoord;
nr:integer;
begin
nr:=results.CheckQueryNo();
p:=m[nr].PixelsToRowColumn(x,y);
m[nr].CaretX:=p.Column;
m[nr].CaretY:=p.Row;
m[nr].SelText:=tables.Edit1.text;
zapytanie.Visible:=false;
end;

procedure TResults.PanelDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
var
nr:integer;
begin
nr:=results.CheckQueryNo();
if ((source is ttreeview) and (tables.sel_tabela.checked)) Then
    begin
    accept := True;
    end
  else
    accept := False;
end;

procedure TResults.PanelDragDrop(Sender, Source: TObject; X, Y: Integer);
var
nr,i:integer;
rect:trect;
begin
nr:=results.CheckQueryNo();

// tutaj dorobic cos
inc(gr[nr].Count);
//if(gr[nr].Active[gr[nr].Count]<>'T') then
        begin
        for i:=0 to gr[nr].Count do gr[nr].Active[i]:='N';
        gr[nr].Active[gr[nr].Count]:='T';
        gr[nr].Enabled[gr[nr].Count]:='T';
        gr[nr].Tabela[gr[nr].Count]:=TStringGrid.create(results);
        gr[nr].Tabela[gr[nr].Count].parent:=p[nr];
        gr[nr].Tabela[gr[nr].Count].Width:=120;
        gr[nr].Tabela[gr[nr].Count].height:=150;
        gr[nr].Tabela[gr[nr].Count].FixedCols:=0;
        gr[nr].Tabela[gr[nr].Count].ColCount:=2;
        gr[nr].Tabela[gr[nr].Count].ColWidths[0]:=15;
        gr[nr].Tabela[gr[nr].Count].ColWidths[1]:=105;
        gr[nr].Tabela[gr[nr].Count].DefaultRowHeight:=15;
        gr[nr].Tabela[gr[nr].Count].OnMouseMove:=TablesMouseMove;
        gr[nr].Tabela[gr[nr].Count].Options:=[goFixedHorzLine];
        gr[nr].Tabela[gr[nr].Count].OnTopLeftChanged:=TablesTopLeftChanged;
//        gr[nr].Tabela[gr[nr].Count].OnDrawCell:=TablesDrawCell;
        gr[nr].Tabela[gr[nr].Count].OnSelectCell:=TablesSelectCell;
        gr[nr].Tabela[gr[nr].Count].OnDragDrop:=TablesDragDrop;
        gr[nr].Tabela[gr[nr].Count].OnDragOver:=TablesDragOver;

        gr[nr].Tabela[gr[nr].Count].RowCount:=tables.kolumny.Items.Count+1;
        gr[nr].Tabela[gr[nr].Count].Cells[1,0]:=tables.tabela.text;
        gr[nr].Nazwa[gr[nr].Count]:=tables.tabela.text;

        for i:=0 to tables.kolumny.Items.Count-1 do
                begin
                gr[nr].Tabela[gr[nr].Count].Cells[1,i+1]:=tables.kolumny.items.Strings[i];
                gr[nr].Tabela[gr[nr].Count].Cells[0,i+1]:='v';
                end;
        end;
//gr[nr].Tabela[gr[nr].Count].DefaultRowHeight := Combo[nr].Height;
gr[nr].Tabela[gr[nr].Count].left:=x-30;
gr[nr].Tabela[gr[nr].Count].top:=y-30;

gr[nr].Tabela[gr[nr].ActiveNo].Repaint;
gr[nr].Tabela[gr[nr].ActiveNo].Refresh;
//showmessage('tworzenie obiektu tabeli '+tables.tabela.text);
end;


function getIPs: Tstrings;
type
  TaPInAddr = array[0..10] of PInAddr;
  PaPInAddr = ^TaPInAddr;
var
  phe: PHostEnt;
  pptr: PaPInAddr;
  Buffer: array[0..63] of Char;
  I: Integer;
  GInitData: TWSAData;
begin
  WSAStartup($101, GInitData);
  Result := TstringList.Create;
  Result.Clear;
  GetHostName(Buffer, SizeOf(Buffer));
  phe := GetHostByName(buffer);
  if phe = nil then Exit;
  pPtr := PaPInAddr(phe^.h_addr_list);
  I    := 0; 
  while pPtr^[I] <> nil do 
  begin 
    Result.Add(inet_ntoa(pptr^[I]^)); 
    Inc(I); 
  end; 
  WSACleanup; 
end; 

function GetTempDirectory: String;
var
  tempFolder: array[0..MAX_PATH] of Char;
begin
  GetTempPath(MAX_PATH, @tempFolder);
  result := StrPas(tempFolder);
end;



procedure Tresults.refreshClick(Sender: TObject);
var
Item: TListItem;
begin
systeminfo.RefreshInfo;
res.RowCount:=15;
res.DefaultRowHeight:=16;
res.Font.Size:=9;
res.ColWidths[0]:=200;
res.ColWidths[1]:=results.Width-res.colwidths[0];
res.cells[0,0]:='Computer name';res.cells[1,0]:=systeminfo.computername;
res.cells[0,1]:='CPU Speed';res.cells[1,1]:=floattostr(systeminfo.cpuspeed);
res.cells[0,2]:='Operating system';res.cells[1,2]:=systeminfo.OperatingSystem.Description;
res.cells[0,3]:='CSD Version';res.cells[1,3]:=systeminfo.OperatingSystem.csdversion;
res.cells[0,4]:='Major Version';res.cells[1,4]:=inttostr(systeminfo.OperatingSystem.MajorVersion);
res.cells[0,5]:='Minor Version';res.cells[1,5]:=inttostr(systeminfo.OperatingSystem.MinorVersion);
res.cells[0,6]:='Build Number';res.cells[1,6]:=inttostr(systeminfo.OperatingSystem.BuildNumber);
res.cells[0,7]:='Available Psyhical Memory';res.cells[1,7]:=inttostr(systeminfo.SysMemory.AvailPhys);
res.cells[0,8]:='Available Virtual Memory';res.cells[1,8]:=inttostr(systeminfo.SysMemory.AvailVirtual);
res.cells[0,9]:='Memory Free';res.cells[1,9]:=inttostr(systeminfo.SysMemory.MemoryFree);
res.cells[0,10]:='Memory Used';res.cells[1,10]:=inttostr(systeminfo.SysMemory.MemoryUsed);
res.cells[0,11]:='Total Virtual Memory';res.cells[1,11]:=inttostr(systeminfo.SysMemory.TotalVirtual);
res.cells[0,12]:='Username';res.cells[1,12]:=systeminfo.UserName;
res.cells[0,13]:='IP Address';res.cells[1,13]:=getIPs.text;
res.cells[0,14]:='User TEMP directory';res.cells[1,14]:=GetTempDirectory;

main.SaveLog(TForm(self),Sender,res.cells[0,0]+':'+res.cells[1,0]);
main.SaveLog(TForm(self),Sender,res.cells[0,1]+':'+res.cells[1,1]);
main.SaveLog(TForm(self),Sender,res.cells[0,2]+':'+res.cells[1,2]);
main.SaveLog(TForm(self),Sender,res.cells[0,3]+':'+res.cells[1,3]);
main.SaveLog(TForm(self),Sender,res.cells[0,4]+':'+res.cells[1,4]);
main.SaveLog(TForm(self),Sender,res.cells[0,5]+':'+res.cells[1,5]);
main.SaveLog(TForm(self),Sender,res.cells[0,6]+':'+res.cells[1,6]);
main.SaveLog(TForm(self),Sender,res.cells[0,7]+':'+res.cells[1,7]);
main.SaveLog(TForm(self),Sender,res.cells[0,8]+':'+res.cells[1,8]);
main.SaveLog(TForm(self),Sender,res.cells[0,9]+':'+res.cells[1,9]);
main.SaveLog(TForm(self),Sender,res.cells[0,10]+':'+res.cells[1,10]);
main.SaveLog(TForm(self),Sender,res.cells[0,11]+':'+res.cells[1,11]);
main.SaveLog(TForm(self),Sender,res.cells[0,12]+':'+res.cells[1,12]);
//main.SaveLog(TForm(self),Sender,res.cells[0,13]+':'+res.cells[1,13]);
main.SaveLog(TForm(self),Sender,res.cells[0,14]+':'+res.cells[1,14]);

end;

procedure Tresults.Execute1Click(Sender: TObject);
begin
header.execute.Click;
end;

procedure Tresults.ApplicationEvents1Activate(Sender: TObject);
begin
try
results.m[results.CheckQueryNo()].SetFocus;
except end;
end;

function Tresults.ApplicationEvents1Help(Command: Word; Data: Integer;
  var CallHelp: Boolean): Boolean;
begin
//showmessage('1');
end;

function Tresults.GetConnectionIdFromTop():integer;
var
i,res:integer;
begin
for i:=0 to ConnectionMax do
        begin
        if ((Connections[i].server_name = header.address.Text) and (Connections[i].server_typ = header.dbtype.text)) then
                begin
                res:=i;
                end;
        end;
main.SaveLog(TForm(self),nil,'GetConnectionIdFromTop: nr='+inttostr(res));

result:=res;
end;

function Tresults.ReconnectFromTop(nr:integer=-1):integer;
var
i:integer;
str:string;
begin
if nr = -1 then nr:=results.CheckQueryNo();

str:='Nr='+inttostr(nr)+':Top='+header.dbtype.Text+':Srv='+Connections[nr].server_name+':Login='+Connections[nr].server_login+':DB='+header.edit1.text;
main.SaveLog(TForm(self),nil,'ReconnectFromTop: '+str);

if(header.dbtype.text='MySQL') then
        begin
        main.Connection.Server:=Connections[nr].server_name;
        main.Connection.Username:=Connections[nr].server_login;
        main.Connection.Password:=Connections[nr].server_password;
        main.Connection.Port:=Connections[nr].server_port;
        main.connection.Database:=header.edit1.text;
        main.data.DataSet:=main.query;
        main.Connection.connect;
        end;
if(header.dbtype.text='MSSQL') then
        begin
        str:='Provider=SQLOLEDB.1;Password='+Connections[nr].server_password;
        str:=str+';Persist Security Info=True;User ID='+Connections[nr].server_login;
        str:=str+';Initial Catalog='+header.edit1.text;
        str:=str+';Data Source='+Connections[nr].server_name+','+inttostr(Connections[nr].server_port);
        try
        main.MSConnection.connected:=false;
        except
        on E : Exception do
        showmessage('Error: '+E.ClassName+' : '+E.Message);
        end;

        try
        main.data.DataSet:=main.msquery;
        main.MSConnection.ConnectionString:=str;
        main.MSConnection.Connected:=true;
        except
           on E : Exception do
        showmessage('Error: '+E.ClassName+' : '+E.Message);
        end;
        end;
end;

procedure Tresults.Copy1Click(Sender: TObject);
begin
try
results.m[results.CheckQueryNo()].CopyToClipboard;
except end;
end;

procedure Tresults.Paste1Click(Sender: TObject);
begin
try
results.m[results.CheckQueryNo()].PasteFromClipboard;
except end;
end;

procedure TResults.TablesMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
var
i,j,ACol,ARow,nr:integer;
p:TPoint;
nazwa:string;
begin
nr:=results.CheckQueryNo();

nazwa:=Tstringgrid(Sender).cells[1,0];
for i:=0 to gr[nr].Count do
       begin
       gr[nr].Active[i]:='N';
       if gr[nr].Nazwa[i]=nazwa then
                begin
                j:=i;
                gr[nr].ActiveNo:=j;
                gr[nr].Active[i]:='T';
                end;
       end;

if ssRight in Shift then
        begin
        GetCursorPos(p);
        for i:=0 to gr[nr].Count do
                begin
                if gr[nr].Active[i]='T' then j:=i;
                end;
        gr[nr].Tabela[j].Left:=p.x-results.Left-(gr[nr].Tabela[j].width div 2);
        gr[nr].Tabela[j].Top:=p.y-results.Top-(gr[nr].Tabela[j].height div 1)+40;
        gr[nr].Tabela[j].Cursor:=crsizeall;
        DrawQuery();
        end else gr[nr].Tabela[j].Cursor:=crdefault;


gr[nr].Tabela[gr[nr].ActiveNo].MouseToCell(X,Y,ACol,ARow);
if(ACol=1) then
        begin
        gr[nr].PolaczenieTemp:=gr[nr].Tabela[gr[nr].ActiveNo].cells[1,0]+'.'+gr[nr].Tabela[gr[nr].ActiveNo].cells[ACol,ARow];
        gr[nr].Tabela[gr[nr].ActiveNo].DragMode:=dmAutomatic;
        end
        else
        begin
        gr[nr].PolaczenieTemp:='';
        gr[nr].Tabela[gr[nr].ActiveNo].DragMode:=dmManual;
        end;

end;


procedure Tresults.TablesTopLeftChanged(Sender: TObject);
var
R: TRect;
nr:integer;
begin
//nr:=results.CheckQueryNo();
DrawQuery();
end;


procedure Tresults.ComboChange(Sender: TObject);
var
nr:integer;
begin
nr:=results.CheckQueryNo();
gr[nr].Tabela[gr[nr].ActiveNo].Repaint;
gr[nr].Tabela[gr[nr].ActiveNo].Refresh;
end;

procedure Tresults.TablesSelectCell(Sender: TObject; ACol, ARow: Integer; var CanSelect: Boolean);
var
R: TRect;
i,nr:integer;
zaznaczenie:boolean;
begin
nr:=results.CheckQueryNo();
//gr[nr].Tabela[gr[nr].ActiveNo]
gr[nr].Tabela[gr[nr].ActiveNo].Repaint;
gr[nr].Tabela[gr[nr].ActiveNo].Refresh;

if Acol=3 then gr[nr].Tabela[gr[nr].ActiveNo].Options:=[goFixedHorzLine,goEditing]
        else gr[nr].Tabela[gr[nr].ActiveNo].Options:=[goFixedHorzLine];

if(Acol=0) and (Arow>0) then
        begin
        if gr[nr].Tabela[gr[nr].ActiveNo].cells[0,ARow]='v' then gr[nr].Tabela[gr[nr].ActiveNo].cells[0,ARow]:=''
                else gr[nr].Tabela[gr[nr].ActiveNo].cells[0,ARow]:='v';

        zaznaczenie:=false;
        for i:=1 to gr[nr].Tabela[gr[nr].ActiveNo].RowCount-1 do
                if gr[nr].Tabela[gr[nr].ActiveNo].cells[0,i]='v' then zaznaczenie:=true;

        if zaznaczenie=false then
                if(application.MessageBox('Do you want to remove this table from diagram?','Remove table',MB_YESNO)=6) then
                        begin
                        gr[nr].Enabled[gr[nr].ActiveNo]:='N';
                        gr[nr].Tabela[gr[nr].ActiveNo].Visible:=false;
                        end;
        end;
end;


procedure Tresults.PolaczPunkty(x1,y1,x2,y2,nr,w:integer;typ:string);
begin
TMyPanel(results.p[nr]).Canvas.Pen.Width:=2;

if(x1<x2) then
        begin
        x1:=x1+w;
        TMyPanel(results.p[nr]).Canvas.moveto(x1,y1);
        TMyPanel(results.p[nr]).Canvas.LineTo(x1+20,y1);
        TMyPanel(results.p[nr]).Canvas.LineTo(x2-20,y2);
        TMyPanel(results.p[nr]).Canvas.LineTo(x2,y2);

        if (typ='LEFT JOIN') or (typ='INNER JOIN') then
                begin
                TMyPanel(results.p[nr]).Canvas.MoveTo(x2-5,y2-5);
                TMyPanel(results.p[nr]).Canvas.LineTo(x2,y2);
                TMyPanel(results.p[nr]).Canvas.LineTo(x2-5,y2+5);
                end;
        if (typ='RIGHT JOIN') or (typ='INNER JOIN') then
                begin
                TMyPanel(results.p[nr]).Canvas.MoveTo(x1+5,y1-5);
                TMyPanel(results.p[nr]).Canvas.LineTo(x1,y1);
                TMyPanel(results.p[nr]).Canvas.LineTo(x1+5,y1+5);
                end;

        end else
        begin
        x2:=x2+w;
        TMyPanel(results.p[nr]).Canvas.moveto(x1,y1);
        TMyPanel(results.p[nr]).Canvas.LineTo(x1-20,y1);
        TMyPanel(results.p[nr]).Canvas.LineTo(x2+20,y2);
        TMyPanel(results.p[nr]).Canvas.LineTo(x2,y2);

        if (typ='LEFT JOIN') or (typ='INNER JOIN') then
                begin
                TMyPanel(results.p[nr]).Canvas.MoveTo(x2+5,y2-5);
                TMyPanel(results.p[nr]).Canvas.LineTo(x2,y2);
                TMyPanel(results.p[nr]).Canvas.LineTo(x2+5,y2+5);
                end;
        if (typ='RIGHT JOIN') or (typ='INNER JOIN') then
                begin
                TMyPanel(results.p[nr]).Canvas.MoveTo(x1-5,y1-5);
                TMyPanel(results.p[nr]).Canvas.LineTo(x1,y1);
                TMyPanel(results.p[nr]).Canvas.LineTo(x1-5,y1+5);
                end;
        end;
end;


procedure Tresults.DrawQuery();
var
i,j,k,nr:integer;
top1,top2,h,x1,y1,x2,y2,w:integer;
typ,t1,t2:string;
begin
nr:=results.CheckQueryNo();
results.p[nr].Repaint;
for i:=1 to gr[nr].PolaczenieMax do
        begin
        t1:=strbefore(gr[nr].PolaczenieOd[i],'.');
        t2:=strbefore(gr[nr].PolaczenieDo[i],'.');
        if ((TableActive(nr,t1)=true) and (TableActive(nr,t2)=true)) then
                begin
                typ:=gr[nr].PolaczenieTyp[i];

                for j:=0 to gr[nr].Count do
                       if gr[nr].Nazwa[j]=t1 then k:=j;
                h:=gr[nr].Tabela[k].DefaultRowHeight;
                w:=gr[nr].Tabela[k].Width;
                for j:=0 to gr[nr].Tabela[k].RowCount-1 do
                        if gr[nr].Tabela[k].Cells[1,j]=strafter(gr[nr].PolaczenieOd[i],'.') then top1:=j;
                top1:=top1-gr[nr].Tabela[k].TopRow;
                x1:=gr[nr].Tabela[k].left;
                y1:=gr[nr].Tabela[k].top+top1*h+2*h;
                if y1<gr[nr].Tabela[k].top then y1:=gr[nr].Tabela[k].top;
                if y1>gr[nr].Tabela[k].top+gr[nr].Tabela[k].height then y1:=gr[nr].Tabela[k].top+gr[nr].Tabela[k].height;

                for j:=0 to gr[nr].Count do
                       if gr[nr].Nazwa[j]=t2 then k:=j;
                for j:=0 to gr[nr].Tabela[k].RowCount-1 do
                        if gr[nr].Tabela[k].Cells[1,j]=strafter(gr[nr].PolaczenieDo[i],'.') then top2:=j;
                top2:=top2-gr[nr].Tabela[k].TopRow;
                x2:=gr[nr].Tabela[k].left;
                y2:=gr[nr].Tabela[k].top+top2*h+2*h;
                if y2<gr[nr].Tabela[k].top then y2:=gr[nr].Tabela[k].top;
                if y2>gr[nr].Tabela[k].top+gr[nr].Tabela[k].height then y2:=gr[nr].Tabela[k].top+gr[nr].Tabela[k].height;

                //showmessage(inttostr(gr[nr].Tabela[k].TopRow));

                PolaczPunkty(x1,y1,x2,y2,nr,w,gr[nr].PolaczenieTyp[i]);
                end;
        end;
//s2:=strbefore(gr[nr].PolaczenieDo[i],'.');
//s:=s+' '+s1+' '+gr[nr].PolaczenieTyp[i]+' '+s2+' on '+gr[nr].PolaczenieOd[i]+'='+gr[nr].PolaczenieDo[i];
end;


function Tresults.TableActive(nr:integer;name:string):boolean;
var
i:integer;
act:boolean;
begin
act:=true;
for i:=1 to gr[nr].Count do
        if gr[nr].Tabela[i].cells[1,0]=name then
                if gr[nr].Enabled[i]='N' then act:=false;
result:=act;
end;

function Tresults.GenerateQuery():string;
var
maxi,maxj,i,j,k,nr:integer;
df,db,field,qor,qand,s,s1,s2:string;
tab: array[1..200] of string;
bylo1,bylo2:boolean;

begin
nr:=results.CheckQueryNo();
k:=1;
for i:=1 to gr[nr].Count do
        if gr[nr].Enabled[i]='T' then
                begin
                for j:=1 to gr[nr].Tabela[i].RowCount-1 do
                        begin
                        if gr[nr].Tabela[i].cells[0,j]='v' then
                                begin
                                inc(k);
                                if k=4 then
                                        begin
                                        s1:=s1+chr(13);
                                        k:=1;
                                        end;
                                s1:=s1+gr[nr].Tabela[i].Cells[1,0]+'.'+gr[nr].Tabela[i].Cells[1,j]+', ';
                                end;
                        end;
                end;

s:='SELECT '+copy(s1,1,length(s1)-2)+' FROM '+chr(13);

j:=1;
for i:=1 to gr[nr].PolaczenieMax do
        begin
        s1:=strbefore(gr[nr].PolaczenieOd[i],'.');
        s2:=strbefore(gr[nr].PolaczenieDo[i],'.');

        if ((TableActive(nr,s1)=true) and (TableActive(nr,s2)=true)) then
                begin
                if(i=1) then
                        begin
                        s:=s+' '+s1+' '+gr[nr].PolaczenieTyp[i]+' '+s2+' on '+gr[nr].PolaczenieOd[i]+'='+gr[nr].PolaczenieDo[i];
                        tab[j]:=s1;
                        inc(j);
                        tab[j]:=s2;
                        inc(j);
                        end
                        else
                        bylo1:=false;
                        bylo2:=false;
                        for k:=1 to j do if tab[k]=s1 then bylo1:=true;
                        for k:=1 to j do if tab[k]=s2 then bylo2:=true;
                        if ((bylo1=false) and (bylo2=false)) then showmessage('Error: Two tables are not connected');
                        if ((bylo2) and (not bylo1)) then
                                begin
                                tab[j]:=s1;
                                inc(j);
                                s:=s+chr(13)+' '+gr[nr].PolaczenieTyp[i]+' '+s1+' on '+gr[nr].PolaczenieOd[i]+'='+gr[nr].PolaczenieDo[i];
                                bylo1:=false;
                                bylo2:=false;
                                end;
                        if ((bylo1) and (not bylo2)) then
                                begin
                                tab[j]:=s2;
                                inc(j);
                                s:=s+chr(13)+' '+gr[nr].PolaczenieTyp[i]+' '+s2+' on '+gr[nr].PolaczenieOd[i]+'='+gr[nr].PolaczenieDo[i];
                                bylo1:=false;
                                bylo2:=false;
                                end;
                        if ((bylo1) and (bylo2)) then
                                begin
                                //tab[j]:=s1;
                                //inc(j);
                               // s:=s+chr(13)+' AND '+gr[nr].PolaczenieOd[i]+'='+gr[nr].PolaczenieDo[i];
                                bylo1:=false;
                                bylo2:=false;
                                end;
                end;

        end;
// generowanie where
maxi:=results.Conditions[nr].RowCount-2;
maxj:=results.Conditions[nr].ColCount-1;

qor:='';
qand:='';
for i:=2 to maxi do
        begin
        for j:=1 to maxj do
                begin
                db:=results.Conditions[nr].cells[j,0];
                field:=results.Conditions[nr].cells[j,1];
                if (results.Conditions[nr].cells[j,i]<>'') and (TableActive(nr,db))  then
                        begin
                        df:=db+'.'+field;
                        qor:=qor+df+' '+results.Conditions[nr].cells[j,i]+' AND ';
                        end;
                end;
        if qor<>'' then
                begin
                qor:='('+copy(qor,1,length(qor)-4)+')';
                qand:=qand+' '+qor+' OR ';
                qor:='';
                end;
        end;

if qand<>'' then
        begin
        qand:=stringreplace(qand,' OR',chr(13)+'OR',[rfreplaceall]);
        qand:=copy(qand,1,length(qand)-4);
        results.m[nr].Text:=s+' WHERE '+chr(13)+qand;
        end else results.m[nr].Text:=s;
        
DrawQuery();
end;

procedure Tresults.TablesDragDrop(Sender, Source: TObject; X, Y: Integer);
var
i,j,ACol,ARow,nr:integer;
nazwa,aktualnepole, poleod:string;
begin
nr:=results.CheckQueryNo();
nazwa:=Tstringgrid(Sender).cells[1,0];
for i:=0 to gr[nr].Count do
       if gr[nr].Nazwa[i]=nazwa then j:=i;

gr[nr].Tabela[j].MouseToCell(X,Y,ACol,ARow);

aktualnepole:=nazwa+'.'+gr[nr].Tabela[j].cells[1,ARow];
poleod:=gr[nr].PolaczenieTemp;
if(strbefore(poleod,'.')<>strbefore(aktualnepole,'.')) then
        begin
        inc(gr[nr].PolaczenieMax);
        gr[nr].PolaczenieOd[gr[nr].PolaczenieMax]:=poleod;
        gr[nr].PolaczenieDo[gr[nr].PolaczenieMax]:=aktualnepole;
        if innerjoin[nr].checked then gr[nr].PolaczenieTyp[gr[nr].PolaczenieMax]:='INNER JOIN';
        if leftjoin[nr].checked then gr[nr].PolaczenieTyp[gr[nr].PolaczenieMax]:='LEFT JOIN';
        if rightjoin[nr].checked then gr[nr].PolaczenieTyp[gr[nr].PolaczenieMax]:='RIGHT JOIN';
        //inc(gr[nr].PolaczenieMax);
        DrawQuery();
        //showmessage(poleod+' => '+aktualnepole+', Max='+inttostr(gr[nr].PolaczenieMax));
        //GenerateQuery();
        end;
end;


procedure Tresults.TablesDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
var
ACol,ARow,nr:integer;
begin
nr:=results.CheckQueryNo();
gr[nr].Tabela[gr[nr].ActiveNo].MouseToCell(X,Y,ACol,ARow);
if (source is TStringGrid) and (ACol=1) Then
    begin
    accept := True;
    end
  else
    accept := False;
end;


procedure Tresults.ConditionsMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
var
nr:integer;
p:tpoint;
i:integer;
begin
nr:=results.CheckQueryNo();

if ssRight in Shift then
        begin
        GetCursorPos(p);

        results.Conditions[nr].Left:=p.x-results.Left-(results.Conditions[nr].width div 2);
        results.Conditions[nr].Top:=p.y-results.Top-(results.Conditions[nr].height div 1)+50;
        results.Conditions[nr].Cursor:=crsizeall;
        results.Conditions[nr].Options:=[goVertLine,goHorzLine,goFixedVertLine,goFixedHorzLine];
        DrawQuery();
        end else
        begin
        results.Conditions[nr].Options:=[goEditing,goColSizing,goVertLine,goHorzLine,goFixedVertLine,goFixedHorzLine];
        results.Conditions[nr].Cursor:=crdefault;
        end;
end;


procedure Tresults.ConditionsDragDrop(Sender, Source: TObject; X, Y: Integer);
var
ACol,ARow,nr:integer;
tabela, kolumna:string;
i:integer;
begin
nr:=results.CheckQueryNo();
results.Conditions[nr].MouseToCell(X,Y,ACol,ARow);
tabela:=strbefore(gr[nr].PolaczenieTemp,'.');
kolumna:=strafter(gr[nr].PolaczenieTemp,'.');
results.Conditions[nr].Cells[ACol,0]:=tabela;
results.Conditions[nr].Cells[ACol,1]:=kolumna;

end;

procedure tresults.ConditionsDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
var
ACol,ARow,nr:integer;
begin
nr:=results.CheckQueryNo();
results.Conditions[nr].MouseToCell(X,Y,ACol,ARow);
if (source is TStringGrid) and (ACol>0) and (ARow<2) Then
    begin
    accept := True;
    end
    else
    accept := False;
end;

procedure Tresults.QueryBeforeOpen(DataSet: TDataSet);
var
nr:integer;
q,q2:string;
begin
nr:=results.CheckQueryNo();
q:=results.m[nr].SelText;
if q<>'' then if pos(' ',q)=0 then q:='SELECT * FROM '+q;
if q='' then q:=results.m[nr].Text;
try
q2:='';
q2:=results.mysqlquery[nr].SQL.Text;
except q2:=''; end;
main.SaveLog(TForm(self),nil,'BeforeOpenQuery(): Type:'+header.dbtype.text+' :Query: Should be: '+q);

end;

procedure Tresults.ConnectionBeforeConnect(Sender: TObject);
begin
main.SaveLog(TForm(self),nil,'BeforeConnection(): Type:'+header.dbtype.text+' :Address: '+header.address.text);
end;

procedure Tresults.ConnectionAfterConnect(Sender: TObject);
begin
main.SaveLog(TForm(self),nil,'AfterConnection(): Type:'+header.dbtype.text+' :Address: '+header.address.text);
end;


procedure TResults.ColorCell(Sender: TObject; const Rect: TRect; DataCol: Integer;  Column: TColumn;  State: TGridDrawState) ;
var
  grid : TcrdbGrid;
  row : integer;
begin
  grid := sender as TcrdbGrid;

  row := grid.DataSource.DataSet.RecNo;

  if Odd(row) then
        begin
        grid.Canvas.Brush.Color := rgb(252,252,252);
        grid.Canvas.Font.Color := rgb(50,50,50);
        end
  else
        begin
        grid.Canvas.Brush.Color := rgb(230,230,230);
        grid.Canvas.Font.Color := rgb(50,50,50);
        end;

  if ((gdFocused in State) or (gdSelected in State)) then
        begin
        grid.Canvas.Font.Color := rgb(0,0,0);
        grid.Canvas.Font.Style:=[fsBold];
        grid.Canvas.Brush.Color := rgb(152,152,152);
        end
        else
        begin
        grid.Canvas.Font.Color := rgb(50,50,50);
        grid.Canvas.Font.Style:=[];
        end;


  grid.DefaultDrawColumnCell(Rect, DataCol, Column, State) ;

end;

end.
