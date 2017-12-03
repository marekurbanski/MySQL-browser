unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, StdCtrls;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Open1: TMenuItem;
    Exit1: TMenuItem;
    OpenDialog1: TOpenDialog;
    Memo2: TMemo;
    procedure Exit1Click(Sender: TObject);
    procedure Open1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.Exit1Click(Sender: TObject);
begin
close();
end;

function zamienLitery(s:string):string;
begin
s:=stringreplace(s,'a','00',[rfreplaceall]);
s:=stringreplace(s,'b','11',[rfreplaceall]);
s:=stringreplace(s,'c','22',[rfreplaceall]);
s:=stringreplace(s,'d','33',[rfreplaceall]);
s:=stringreplace(s,'e','44',[rfreplaceall]);
s:=stringreplace(s,'f','55',[rfreplaceall]);
s:=stringreplace(s,'g','66',[rfreplaceall]);
s:=stringreplace(s,'h','77',[rfreplaceall]);
s:=stringreplace(s,'i','88',[rfreplaceall]);
s:=stringreplace(s,'j','99',[rfreplaceall]);

s:=stringreplace(s,'k','51',[rfreplaceall]);
s:=stringreplace(s,'l','52',[rfreplaceall]);
s:=stringreplace(s,'m','53',[rfreplaceall]);
s:=stringreplace(s,'n','54',[rfreplaceall]);
s:=stringreplace(s,'o','55',[rfreplaceall]);
s:=stringreplace(s,'p','56',[rfreplaceall]);
s:=stringreplace(s,'q','57',[rfreplaceall]);
s:=stringreplace(s,'r','58',[rfreplaceall]);
s:=stringreplace(s,'s','59',[rfreplaceall]);
s:=stringreplace(s,'t','60',[rfreplaceall]);
s:=stringreplace(s,'u','61',[rfreplaceall]);
s:=stringreplace(s,'w','62',[rfreplaceall]);
s:=stringreplace(s,'x','63',[rfreplaceall]);
s:=stringreplace(s,'y','64',[rfreplaceall]);
s:=stringreplace(s,'z','65',[rfreplaceall]);

s:=stringreplace(s,'A','01',[rfreplaceall]);
s:=stringreplace(s,'B','02',[rfreplaceall]);
s:=stringreplace(s,'C','03',[rfreplaceall]);
s:=stringreplace(s,'D','04',[rfreplaceall]);
s:=stringreplace(s,'E','05',[rfreplaceall]);
s:=stringreplace(s,'F','06',[rfreplaceall]);
s:=stringreplace(s,'G','07',[rfreplaceall]);
s:=stringreplace(s,'H','08',[rfreplaceall]);
s:=stringreplace(s,'I','09',[rfreplaceall]);
s:=stringreplace(s,'J','10',[rfreplaceall]);
s:=stringreplace(s,'K','11',[rfreplaceall]);
s:=stringreplace(s,'L','12',[rfreplaceall]);
s:=stringreplace(s,'M','13',[rfreplaceall]);
s:=stringreplace(s,'N','14',[rfreplaceall]);
s:=stringreplace(s,'O','15',[rfreplaceall]);
s:=stringreplace(s,'P','16',[rfreplaceall]);
s:=stringreplace(s,'Q','17',[rfreplaceall]);
s:=stringreplace(s,'R','18',[rfreplaceall]);
s:=stringreplace(s,'S','19',[rfreplaceall]);
s:=stringreplace(s,'T','20',[rfreplaceall]);
s:=stringreplace(s,'U','21',[rfreplaceall]);
s:=stringreplace(s,'W','22',[rfreplaceall]);
s:=stringreplace(s,'X','23',[rfreplaceall]);
s:=stringreplace(s,'Y','24',[rfreplaceall]);
s:=stringreplace(s,'Z','25',[rfreplaceall]);
result:=s;
end;


function zamien(s:string):string;
var
i,j,k:integer;
ww,w,s1,s2,s3:string;
begin
j:=length(s)+1;
i:=1;
while i<j do
        begin
        s1:=s[i];
        s2:=s[i+1];
        s3:=s[i+2];
        i:=i+3;
        w:=s1+s2+s3;
        k:=(strtoint(w)-3) div 2;
        ww:=ww+chr(k);
        end;
result:=ww;
end;

procedure TForm1.Open1Click(Sender: TObject);
var
f:string;
i:integer;
begin
f:=ExtractFilePath( Application.ExeName );
opendialog1.InitialDir:=f;
if opendialog1.Execute then
        begin
        memo2.lines.loadfromfile(opendialog1.filename);
        for i:=0 to memo2.lines.count-1 do
                begin
                memo1.lines.add(zamien(zamienLitery(memo2.Lines.Strings[i])));
                end;
        end;
end;

end.
