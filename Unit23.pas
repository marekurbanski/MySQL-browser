unit Unit23;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  OleCtrls, SHDocVw, StdCtrls, ExtCtrls;

type
  Ttips = class(TForm)
    browser: TWebBrowser;
    Bevel1: TBevel;
    CheckBox1: TCheckBox;
    Image1: TImage;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CheckBox1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  tips: Ttips;

implementation

uses Unit21;

{$R *.DFM}

procedure Ttips.FormClose(Sender: TObject; var Action: TCloseAction);
begin
action:=canone;
tips.Visible:=false;
end;

procedure Ttips.CheckBox1Click(Sender: TObject);
begin
if settings.ctips.checked<>checkbox1.Checked then
        begin
        settings.ctips.checked:=checkbox1.Checked;
        settings.Visible:=true;
        end;
end;

procedure Ttips.FormShow(Sender: TObject);
var
p:string;
begin
p:=ExtractFilePath(Application.ExeName);
browser.Navigate(p+'tipscontent/index.html');
end;

end.
