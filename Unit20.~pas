unit Unit20;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, StdCtrls, ExtCtrls;

type
  TUsers = class(TForm)
    start: TButton;
    tmp: TStringGrid;
    u: TListBox;
    Label1: TLabel;
    h: TListBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label12: TLabel;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    ComboBox4: TComboBox;
    ComboBox5: TComboBox;
    ComboBox6: TComboBox;
    ComboBox7: TComboBox;
    ComboBox8: TComboBox;
    Label10: TLabel;
    Bevel1: TBevel;
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Label11: TLabel;
    CheckBox1: TCheckBox;
    Edit2: TEdit;
    Edit3: TEdit;
    Button3: TButton;
    CheckBox2: TCheckBox;
    Edit4: TEdit;
    Button4: TButton;
    d: TListBox;
    Label13: TLabel;
    procedure startClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure uMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure hMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Users: TUsers;

implementation

uses Unit18;

{$R *.DFM}

procedure TUsers.startClick(Sender: TObject);
var
q:string;
i:integer;
begin
q:='select distinct User as u from mysql.user';
query.get_server_on_top.Click;
query.sql_query.Text:=q;
query.Open.click;

u.items.Clear;
h.items.Clear;
for i:=0 to query.count do
        begin
        u.Items.add(query.res.cells[0,i]);
        end;

combobox1.Text:='';
combobox2.Text:='';
combobox3.Text:='';
combobox4.Text:='';
combobox5.Text:='';
combobox6.Text:='';
combobox7.Text:='';
combobox8.Text:='';

end;

procedure TUsers.FormClose(Sender: TObject; var Action: TCloseAction);
begin
action:=canone;
users.Visible:=false;
end;

procedure TUsers.uMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
nr,i:integer;
q:string;
begin
combobox1.Text:='';
combobox2.Text:='';
combobox3.Text:='';
combobox4.Text:='';
combobox5.Text:='';
combobox6.Text:='';
combobox7.Text:='';
combobox8.Text:='';

for i:=0 to u.Items.Count-1 do
        begin
        if(u.Selected[i]=true) then nr:=i;
        end;

q:='select distinct Host as h from mysql.user WHERE User="'+u.Items.Strings[nr]+'"';
query.get_server_on_top.Click;
query.sql_query.Text:=q;
query.Open.click;
h.items.Clear;
d.items.Clear;
for i:=0 to query.count do
        begin
        h.Items.add(query.res.cells[0,i]);
        end;

end;

procedure TUsers.hMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
nr,i:integer;
user,hostname,q:string;
begin
for i:=0 to u.Items.Count-1 do
        begin
        if(u.Selected[i]=true) then nr:=i;
        end;
user:=u.Items.Strings[nr];

for i:=0 to h.Items.Count-1 do
        begin
        if(h.Selected[i]=true) then nr:=i;
        end;
hostname:=h.Items.Strings[nr];

q:='select Select_priv,Insert_priv,Update_priv,Delete_priv,Create_priv,Drop_priv,Reload_priv,Alter_priv from mysql.user WHERE User="'+user+'" and Host="'+hostname+'"';
//query.get_server_on_top.Click;
//showmessage(q);
query.sql_query.Text:=q;
query.Open.click;
query.copy_to_grid.click;

if(query.res.cells[0,0]='Y') then combobox1.Text:='Y' else combobox1.Text:='N';
if(query.res.cells[1,0]='Y') then combobox2.Text:='Y' else combobox2.Text:='N';
if(query.res.cells[2,0]='Y') then combobox3.Text:='Y' else combobox3.Text:='N';
if(query.res.cells[3,0]='Y') then combobox4.Text:='Y' else combobox4.Text:='N';
if(query.res.cells[4,0]='Y') then combobox5.Text:='Y' else combobox5.Text:='N';
if(query.res.cells[5,0]='Y') then combobox6.Text:='Y' else combobox6.Text:='N';
if(query.res.cells[6,0]='Y') then combobox7.Text:='Y' else combobox7.Text:='N';
if(query.res.cells[7,0]='Y') then combobox8.Text:='Y' else combobox8.Text:='N';
end;

end.
