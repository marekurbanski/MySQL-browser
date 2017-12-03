unit Unit19;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, CheckLst, Unit18, ExtCtrls;

type
  Ttable_diagnostics = class(TForm)
    start: TButton;
    tabele: TCheckListBox;
    Label1: TLabel;
    Button1: TButton;
    res: TMemo;
    Label2: TLabel;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Bevel1: TBevel;
    Label3: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure startClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  table_diagnostics: Ttable_diagnostics;

implementation

{$R *.DFM}

procedure Ttable_diagnostics.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
action:=canone;
table_diagnostics.visible:=false;
end;

procedure Ttable_diagnostics.startClick(Sender: TObject);
var
q:string;
i:integer;
begin
q:='SHOW TABLES';
//query.get_server_on_top.Click;
query.sql_query.Text:=q;
query.Open.click;

tabele.items.Clear;
for i:=0 to query.count do
        begin
        tabele.Items.add(query.res.cells[0,i]);
        end;


end;

procedure Ttable_diagnostics.Button1Click(Sender: TObject);
var
i:integer;
q:string;
begin
for i:=0 to tabele.Items.Count-1 do
        begin
        if(tabele.Checked[i]=true) then
                begin
                q:='OPTIMIZE TABLE '+tabele.Items.Strings[i];
                query.sql_query.Text:=q;
                query.Open.click;
                res.Text:=res.text+query.res_txt.Text;
                end;
        end;
res.Lines.Add('DONE');
end;

procedure Ttable_diagnostics.Button2Click(Sender: TObject);
var
i:integer;
q:string;
begin
for i:=0 to tabele.Items.Count-1 do
        begin
        if(tabele.Checked[i]=true) then
                begin
                q:='REPAIR TABLE '+tabele.Items.Strings[i];
                query.sql_query.Text:=q;
                query.Open.click;
                res.Text:=res.text+query.res_txt.Text;
                end;
        end;
res.Lines.Add('DONE');
end;


procedure Ttable_diagnostics.Button3Click(Sender: TObject);
var
i:integer;
q:string;
begin
for i:=0 to tabele.Items.Count-1 do
        begin
        if(tabele.Checked[i]=true) then
                begin
                q:='CHECK TABLE '+tabele.Items.Strings[i];
                query.sql_query.Text:=q;
                query.Open.click;
                res.Text:=res.text+query.res_txt.Text;
                end;
        end;
res.Lines.Add('DONE');
end;


procedure Ttable_diagnostics.Button4Click(Sender: TObject);
var
i:integer;
q:string;
begin
for i:=0 to tabele.Items.Count-1 do
        begin
        if(tabele.Checked[i]=true) then
                begin
                q:='ANALYZE TABLE '+tabele.Items.Strings[i];
                query.sql_query.Text:=q;
                query.Open.click;
                res.Text:=res.text+query.res_txt.Text;
                end;
        end;
res.Lines.Add('DONE');
end;


end.
