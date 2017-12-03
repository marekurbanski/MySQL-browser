unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Grids, DBGrids, Db, DBAccess, MyAccess, MemDS,
  Aligrid, Spin, Buttons, ToolWin, ComCtrls;

type
  TForm1 = class(TForm)
    MyConnection1: TMyConnection;
    MyQuery1: TMyQuery;
    MyDataSource1: TMyDataSource;
    DBGrid1: TDBGrid;
    Button1: TButton;
    Timer1: TTimer;
    res: TStringAlignGrid;
    res2: TStringAlignGrid;
    Memo1: TMemo;
    Timer2: TTimer;
    CoolBar1: TCoolBar;
    Label4: TLabel;
    Label6: TLabel;
    CheckBox1: TCheckBox;
    SpinEdit1: TSpinEdit;
    CheckBox2: TCheckBox;
    Edit1: TEdit;
    Button2: TButton;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure res2SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure SpinEdit1Change(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button2Click(Sender: TObject);
    procedure resSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  kill:boolean;

implementation

{$R *.DFM}

procedure TForm1.Button1Click(Sender: TObject);
begin
myconnection1.Open;
timer1.Enabled:=true;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
var
q:string;
roznica,i,j:integer;
bylo:boolean;
begin
timer1.enabled:=false;
if(kill=true) then
        begin
        q:='kill '+edit1.text;
        myquery1.sql.clear;
        myquery1.sql.add(q);
        myquery1.Execute;
        kill:=false;
        edit1.Text:='0';
        end;

q:='SHOW FULL PROCESSLIST';
myquery1.sql.clear;
myquery1.sql.add(q);
myquery1.Execute;

res2.cells[0,0]:='No.';
res2.cells[1,0]:='Query';
res2.cells[2,0]:='t[s]';
res2.cells[0,1]:='1';

roznica:=dbgrid1.DataSource.DataSet.RecordCount-res.rowcount;
if(roznica>0) then res.RowCount:=res.RowCount+roznica+1;
label6.caption:=inttostr(res.RowCount-1);
dbgrid1.DataSource.DataSet.First;
for i:=1 to dbgrid1.DataSource.DataSet.RecordCount do
        begin
        res.cells[0,0]:='Process ID';
        res.cells[0,i]:=dbgrid1.DataSource.DataSet.Fields[0].AsString;
        res.cells[1,0]:='User';
        res.cells[1,i]:=dbgrid1.DataSource.DataSet.Fields[1].AsString;
        res.cells[2,0]:='Host';
        res.cells[2,i]:=dbgrid1.DataSource.DataSet.Fields[2].AsString;
        res.cells[3,0]:='Database';
        res.cells[3,i]:=dbgrid1.DataSource.DataSet.Fields[3].AsString;
        res.cells[4,0]:='Command';
        res.cells[4,i]:=dbgrid1.DataSource.DataSet.Fields[4].AsString;
        res.cells[5,0]:='Time[s]';
        res.cells[5,i]:=dbgrid1.DataSource.DataSet.Fields[5].AsString;
        res.cells[6,0]:='Status';
        res.cells[6,i]:=dbgrid1.DataSource.DataSet.Fields[6].AsString;
        res.cells[7,0]:='Query';
        res.cells[7,i]:=dbgrid1.DataSource.DataSet.Fields[7].AsString;
        bylo:=false;
        for j:=1 to res2.RowCount do
                begin
                if((res.cells[7,i]=res2.Cells[1,j]) and (bylo=false)) then
                        begin
                        if(res.cells[4,i]='Query') then
                                res2.cells[2,j]:=res.cells[5,i];
                        bylo:=true;
                        end;
                end;
                if((bylo=false) and (res.cells[7,i]<>'SHOW FULL PROCESSLIST')) then
                        begin
                        j:=res2.RowCount;
                        res2.RowCount:=res2.RowCount+1;
                        res2.cells[0,j]:=inttostr(j);
                        res2.cells[1,j]:=res.cells[7,i];
                        res2.cells[2,j]:=res.cells[5,i];
                        end;

        dbgrid1.DataSource.DataSet.Next;
        end;
timer1.enabled:=true;
end;

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
if(checkbox1.checked=true) then
        begin
        timer1.Interval:=spinedit1.Value;
        timer1.Enabled:=true;
        end else
        begin
        timer1.enabled:=false;
        end;
end;

procedure TForm1.res2SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
memo1.Text:=res2.cells[1,arow];
end;

procedure TForm1.SpinEdit1Change(Sender: TObject);
begin
timer1.Interval:=spinedit1.value;
end;

procedure TForm1.Timer2Timer(Sender: TObject);
begin
timer2.enabled:=false;
kill:=false;
if(paramstr(3)<>'') then
begin
//showmessage(paramstr(1));
myconnection1.Server:=paramstr(1);
myconnection1.Username:=paramstr(2);
myconnection1.Password:=paramstr(4);
myconnection1.Port:=strtoint(paramstr(3));
button1.click;
end else
        begin
        form1.Visible:=false;
        showmessage('This program is a part of MySQL QueryEditor, and it couldn't be run as himself');
        close();
        end;
end;

procedure TForm1.CheckBox2Click(Sender: TObject);
begin
if(checkbox2.checked=true) then form1.FormStyle:=fsStayOnTop
        else form1.FormStyle:=fsNormal;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
myconnection1.Close;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
kill:=true;
end;

procedure TForm1.resSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
edit1.text:=res.cells[0,arow];
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
res.RowCount:=2;
res2.RowCount:=2;
res2.Rows[1].Clear;
end;

end.
