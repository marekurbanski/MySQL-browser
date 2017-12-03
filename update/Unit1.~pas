unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Db, DBAccess, MyAccess, MemDS, ComCtrls, Grids, DBGrids,
  OleCtrls, SHDocVw,mshtml, ExtCtrls, shellapi;

type
  Tfupdate = class(TForm)
    Button1: TButton;
    www: TWebBrowser;
    Memo1: TMemo;
    Timer1: TTimer;
    Label1: TLabel;
    Label2: TLabel;
    Button2: TButton;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure wwwDocumentComplete(Sender: TObject; const pDisp: IDispatch;
      var URL: OleVariant);
    procedure Timer1Timer(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fupdate: Tfupdate;

implementation

{$R *.DFM}

procedure Tfupdate.Button1Click(Sender: TObject);
begin
fupdate.Visible:=false;
if(paramstr(1)='') then
        begin
        showmessage('This application cannot be run without mSQL QueryBrowser');
        close();
        end;
//showmessage(paramstr(1));
www.Navigate('http://www2.pl/update/msql.php?v='+paramstr(1));
end;


procedure Tfupdate.wwwDocumentComplete(Sender: TObject;
  const pDisp: IDispatch; var URL: OleVariant);
var
iall : IHTMLElement;
begin
if Assigned(www.Document) then
   begin
     iall := (www.Document AS IHTMLDocument2).body;

     while iall.parentElement <> nil do
     begin
       iall := iall.parentElement;
     end;
     memo1.Text := iall.outerHTML;
   end;
if(pos('DOWNLOAD',memo1.text)>0) then
        begin
        fupdate.Visible:=true;
        end else
        begin
        if(paramstr(2)='1') then showmessage('No updates available');
        close();
        end;
end;

procedure Tfupdate.Timer1Timer(Sender: TObject);
begin
timer1.Enabled:=false;
button1.Click;
end;

procedure Tfupdate.Button3Click(Sender: TObject);
begin
close();
end;

procedure Tfupdate.Button2Click(Sender: TObject);
begin
ShellExecute(Handle, 'open', 'http://sqlbrowser.www2.pl/?act=download', nil, nil, SW_SHOW);
close();
end;

end.
