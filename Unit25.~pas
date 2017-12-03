unit Unit25;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids;

type
  Tmodify_table = class(TForm)
    kolumny: TStringGrid;
    prepare: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    Edit1: TEdit;
    ComboBox1: TComboBox;
    Edit2: TEdit;
    Edit3: TEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure prepareClick(Sender: TObject);
    procedure clearfields();
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  modify_table: Tmodify_table;

implementation

uses Unit6, Unit4;

{$R *.DFM}

procedure Tmodify_table.clearfields();
begin
edit1.text:='';
Combobox1.text:='';
edit2.text:='';
edit3.text:='';
checkbox1.checked:=false;
checkbox2.checked:=false;
checkbox3.checked:=false;
checkbox4.checked:=false;
checkbox5.checked:=false;

end;

procedure Tmodify_table.prepareClick(Sender: TObject);
var
nr:integer;
begin
nr:=results.GetConnectionIdFromTop();
results.ReconnectFromTop(nr);

clearfields;
label2.Caption:=popmenu.tbl.Text;
kolumny.Cells[0,0]:='id';
kolumny.Cells[1,0]:='Name';
kolumny.Cells[2,0]:='Type';
kolumny.Cells[3,0]:='Length';
kolumny.Cells[4,0]:='Value';
kolumny.Cells[5,0]:='primary';
kolumny.Cells[6,0]:='index';
kolumny.Cells[7,0]:='unique';
kolumny.Cells[8,0]:='not null';
kolumny.Cells[9,0]:='autoincrement';


kolumny.Cells[0,1]:='';
kolumny.Cells[1,1]:='';
kolumny.Cells[2,1]:='';
kolumny.Cells[3,1]:='';
kolumny.Cells[4,1]:='';
kolumny.Cells[5,1]:='';
kolumny.Cells[6,1]:='';
kolumny.Cells[7,1]:='';
kolumny.Cells[8,1]:='';
kolumny.Cells[9,1]:='';

try
kolumny.Cells[0,2]:='';
kolumny.Cells[1,2]:='';
kolumny.Cells[2,2]:='';
kolumny.Cells[3,2]:='';
kolumny.Cells[4,2]:='';
kolumny.Cells[5,2]:='';
kolumny.Cells[6,2]:='';
kolumny.Cells[7,2]:='';
kolumny.Cells[8,2]:='';
kolumny.Cells[9,2]:='';
except end;

kolumny.ColWidths[0]:=0;
kolumny.ColWidths[1]:=100;
kolumny.ColWidths[2]:=100;
kolumny.ColWidths[3]:=30;
kolumny.ColWidths[4]:=30;
kolumny.ColWidths[5]:=30;
kolumny.ColWidths[6]:=30;
kolumny.ColWidths[7]:=30;
kolumny.ColWidths[8]:=30;
kolumny.ColWidths[9]:=30;

kolumny.RowCount:=2;

end;

end.
