unit Unit9;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids;

type
  Tcreate_table = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    kolumny: TStringGrid;
    Label2: TLabel;
    Edit2: TEdit;
    ComboBox1: TComboBox;
    Label3: TLabel;
    Label4: TLabel;
    Edit3: TEdit;
    Label5: TLabel;
    Edit4: TEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    Button4: TButton;
    Edit5: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure kolumnySelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  create_table: Tcreate_table;

implementation

uses Unit1, Unit3, Unit4;

{$R *.DFM}

procedure Tcreate_table.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
action:=canone;
create_table.Visible:=false;
end;

procedure Tcreate_table.Button3Click(Sender: TObject);
begin
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

edit2.Text:='';
edit3.Text:='0';
edit4.Text:='';
checkbox1.Checked:=false;
checkbox2.Checked:=false;
checkbox3.Checked:=false;
checkbox4.Checked:=false;
checkbox5.Checked:=false;

end;

function check(c:Tcheckbox):string;
begin
if(c.checked=true) then result:='+' else result:='';
end;

procedure Tcreate_table.Button1Click(Sender: TObject);
var
i:integer;
begin
if(edit2.text<>'') then
      begin
      kolumny.RowCount:=kolumny.RowCount+1;
      i:=kolumny.RowCount;
      kolumny.Cells[0,i]:='';
      kolumny.Cells[1,i]:='';
      kolumny.Cells[2,i]:='';
      kolumny.Cells[3,i]:='';
      kolumny.Cells[4,i]:='';
      kolumny.Cells[5,i]:='';
      kolumny.Cells[6,i]:='';
      kolumny.Cells[7,i]:='';
      kolumny.Cells[8,i]:='';
      kolumny.Cells[9,i]:='';

        try
      kolumny.Cells[0,i+1]:='';
      kolumny.Cells[1,i+1]:='';
      kolumny.Cells[2,i+1]:='';
      kolumny.Cells[3,i+1]:='';
      kolumny.Cells[4,i+1]:='';
      kolumny.Cells[5,i+1]:='';
      kolumny.Cells[6,i+1]:='';
      kolumny.Cells[7,i+1]:='';
      kolumny.Cells[8,i+1]:='';
      kolumny.Cells[9,i+1]:='';
        except end;

      i:=i-2;
      kolumny.cells[0,i]:=inttostr(i);
      kolumny.Cells[1,i]:=edit2.text;
      kolumny.Cells[2,i]:=combobox1.text;
      kolumny.Cells[3,i]:=edit3.text;
      kolumny.Cells[4,i]:=edit4.text;
      kolumny.Cells[5,i]:=check(checkbox1);
      kolumny.Cells[6,i]:=check(checkbox2);
      kolumny.Cells[7,i]:=check(checkbox3);
      kolumny.Cells[8,i]:=check(checkbox4);
      kolumny.Cells[9,i]:=check(checkbox5);

      edit2.Text:='';
      edit3.Text:='0';
      edit4.Text:='';
      checkbox1.Checked:=false;
      checkbox2.Checked:=false;
      checkbox3.Checked:=false;
      checkbox4.Checked:=false;
      checkbox5.Checked:=false;
      end
      else showmessage('Field name cannot be empty');

end;

procedure Tcreate_table.Button2Click(Sender: TObject);
var
nr,i:integer;
s,s2,tmp:string;
begin
if(edit1.text<>'') then
      begin
      nr:=results.GetConnectionIdFromTop();
      results.ReconnectFromTop(nr);

      s:='CREATE TABLE '+edit1.text+' (';
      s2:='';
      {FieldName TINYINT (3) UNSIGNED DEFAULT '0',
      id TINYINT (3) ZEROFILL NOT NULL AUTO_INCREMENT,
      test CHAR (3) DEFAULT '0',
      PRIMARY KEY(id),
      UNIQUE(id),
      INDEX(id)
      }
      for i:=1 to kolumny.rowcount-2 do
              begin
              if(i>1) then s:=s+',';
              s:=s+kolumny.cells[1,i]+' '+kolumny.cells[2,i]+' ';
              if(kolumny.cells[3,i]<>'') then s:=s+'('+kolumny.cells[3,i]+') ';
              if(kolumny.cells[4,i]<>'') then s:=s+'DEFAULT '''+kolumny.cells[4,i]+'''';
              if(kolumny.cells[8,i]<>'') then s:=s+'NOT NULL ';
              if(kolumny.cells[9,i]<>'') then s:=s+'AUTO_INCREMENT ';

              if(kolumny.cells[5,i]<>'') then s2:=s2+', PRIMARY KEY('+kolumny.cells[1,i]+') ';
              if(kolumny.cells[6,i]<>'') then s2:=s2+', INDEX('+kolumny.cells[1,i]+') ';
              if(kolumny.cells[7,i]<>'') then s2:=s2+', UNIQUE('+kolumny.cells[1,i]+') ';
              end;
      s:=s+s2+')';
      main.Query.SQL.Clear;
      main.Connection.Database:=header.Edit1.text;
      main.Query.SQL.Add(s);
      main.Query.Execute;
      logh(s);
      create_table.Visible:=false;
      showmessage('Table created');
      end else showmessage('Database cannot be empty');
      end;

function DeleteRow(grid:tstringgrid;row:integer):boolean;
var
i,j:integer;
begin
for i:=row to grid.RowCount-1 do
   begin
   for j:=0 to grid.ColCount do
        begin
        grid.cells[j,i]:=grid.cells[j,i+1];
        end;
   end;
grid.RowCount:=grid.RowCount-1;

end;


procedure Tcreate_table.Button4Click(Sender: TObject);
var
s:string;
begin
if(edit5.text<>'0') then
        begin
        s:=kolumny.cells[0,strtoint(edit5.text)];
        if(s<>'') then
                begin
                deleterow(kolumny,strtoint(edit5.text));
                end;
        edit5.text:='0';
        end;
end;

procedure Tcreate_table.kolumnySelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
edit5.Text:=inttostr(arow);
end;

end.
