unit Unit14;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  Tcreate_database = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  create_database: Tcreate_database;

implementation

uses Unit1;

{$R *.DFM}

procedure Tcreate_database.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
action:=canone;
create_database.Visible:=false;
end;

procedure Tcreate_database.Button1Click(Sender: TObject);
begin
main.Query.SQL.Clear;
//main.Connection.Database:=db.text;
main.Query.SQL.Add('CREATE DATABASE '+edit1.text);
main.Query.Execute;
create_database.Visible:=false;
showmessage('Database created');
end;

end.
