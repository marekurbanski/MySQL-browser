unit Unit18;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Grids, DBGrids, Db, MemDS, DBAccess, MyAccess,
  DASQLMonitor, MyDacMonitor, MySQLMonitor;

type
  Tquery = class(TForm)
    DBGrid1: TDBGrid;
    sql_query: TMemo;
    get_server_on_top: TButton;
    Open: TButton;
    Execute: TButton;
    hostname: TEdit;
    username: TEdit;
    password: TEdit;
    port: TEdit;
    database: TEdit;
    res: TStringGrid;
    copy_to_grid: TButton;
    res_txt: TMemo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure OpenClick(Sender: TObject);
    procedure ExecuteClick(Sender: TObject);
    procedure copy_to_gridClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    count: integer;
  end;

var
  query: Tquery;


implementation

uses Unit1, Unit3;

{$R *.DFM}

procedure Tquery.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
action:=canone;
query.Visible:=false;
end;


procedure Tquery.OpenClick(Sender: TObject);
begin
main.Query.SQL.Clear;
main.Query.SQL.add(sql_query.text);
main.Query.Execute;
query.copy_to_grid.Click;
end;

procedure Tquery.ExecuteClick(Sender: TObject);
begin
main.Query.SQL.Clear;
main.Query.SQL.add(sql_query.text);
main.Query.Execute;
end;

procedure Tquery.copy_to_gridClick(Sender: TObject);
var
nr,i,j:integer;
tmp:string;
begin
tmp:='';
res_txt.Clear;
res.RowCount:=dbgrid1.DataSource.DataSet.RecordCount;
res.ColCount:=dbgrid1.DataSource.DataSet.FieldCount;
if(nr>0) then
        begin
        for j:=0 to dbgrid1.DataSource.DataSet.RecordCount-1 do
                begin
                for i:=0 to dbgrid1.DataSource.DataSet.FieldCount-1 do
                        begin
                        res.cells[i,j]:=dbgrid1.DataSource.DataSet.Fields.Fields[i].AsString;
                        tmp:=tmp+dbgrid1.DataSource.DataSet.Fields.Fields[i].AsString+';';
                        end;
                 dbgrid1.datasource.dataset.Next;
                 res_txt.Lines.Add(tmp);
                end;
        end;
count:=res.RowCount-1;
end;
end.
