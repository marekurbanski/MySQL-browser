unit Unit16;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, ExtCtrls, mySQLClient, shellapi;

type
  Tupdate_box = class(TForm)
    Version: TLabel;
    Label1: TLabel;
    start: TButton;
    Label2: TLabel;
    ProgressBar1: TProgressBar;
    Timer1: TTimer;
    SQL1: TmySQLClient;
    Label3: TLabel;
    silent: TCheckBox;
    goonstart: TTimer;
    procedure startClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure goonstartTimer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  update_box: Tupdate_box;

implementation

uses Unit3;

{$R *.DFM}

procedure Tupdate_box.startClick(Sender: TObject);
var
p:string;
begin
timer1.enabled:=true;
label2.Caption:='Connecting...';
application.ProcessMessages;
p:=Sto_GetFmtFileVersion();
if not silent.Checked then
        begin
        //showmessage('no chcekced');
        p:=p+' 1';
        end;
ShellExecute(Handle, 'open', pchar('update.exe'), pchar(p), '', SW_SHOWNORMAL);
update_box.Hide;
end;

procedure Tupdate_box.Timer1Timer(Sender: TObject);
begin
if(progressbar1.Position=progressbar1.max) then progressbar1.Position:=0;
progressbar1.Position:=progressbar1.Position+1;
end;


procedure Tupdate_box.goonstartTimer(Sender: TObject);
begin
goonstart.Enabled:=false;
start.Click;
end;

procedure Tupdate_box.FormClose(Sender: TObject; var Action: TCloseAction);
begin
try
sql1.Close;
except end;
end;

end.
