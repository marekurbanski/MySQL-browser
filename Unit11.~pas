unit Unit11;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  Thistory = class(TForm)
    Memo1: TMemo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Memo1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  history: Thistory;

implementation

uses Unit21;

{$R *.DFM}

procedure Thistory.FormClose(Sender: TObject; var Action: TCloseAction);
begin
action:=canone;
history.Visible:=false;
end;

procedure Thistory.Memo1Change(Sender: TObject);
var
p:string;
begin
if(settings.logs.Checked=true) then
        begin
        try
        p:=ExtractFilePath(Application.ExeName);
        memo1.Lines.SaveToFile(p+'logs.txt');
        except end;
        end;
end;

end.
