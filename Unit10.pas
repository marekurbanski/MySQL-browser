unit Unit10;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  Terrors = class(TForm)
    Memo1: TMemo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Memo1KeyPress(Sender: TObject; var Key: Char);
    procedure Memo1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  errors: Terrors;

implementation

{$R *.DFM}

procedure Terrors.FormClose(Sender: TObject; var Action: TCloseAction);
begin
action:=canone;
errors.visible:=false;
end;

procedure Terrors.Memo1KeyPress(Sender: TObject; var Key: Char);
begin
if ord(key) = 27 then errors.Visible:=false;

end;

procedure Terrors.Memo1Change(Sender: TObject);
begin
SendMessage(Memo1.Handle, EM_SCROLLCARET, 0, 0); 
end;

end.
