unit Unit26;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Grids, Aligrid, StdCtrls, ComCtrls;

type
  Tcomparing_results = class(TForm)
    res1: TStringAlignGrid;
    Splitter1: TSplitter;
    res2: TStringAlignGrid;
    Splitter2: TSplitter;
    Panel1: TPanel;
    Splitter3: TSplitter;
    RichEdit1: TRichEdit;
    RichEdit2: TRichEdit;
    procedure res1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure res2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure RichEdit1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RichEdit2KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure res2DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure res2MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  comparing_results: Tcomparing_results;

implementation

{$R *.DFM}

procedure compare(r1,r2:TRichEdit);
var
res,t1,t2:string;
dl1,dl2,i:integer;
begin
dl1 := strlen(pchar(r1.Text));
for i:=0 to dl1 do
    begin
    t1 := copy(r1.text,i,1);
    t2 := copy(r2.text,i,1);
    if(t1<>t2) then
       begin
       r2.SelStart:=i-1;
       r2.SelLength:=1;
       r2.SelAttributes.Color := clred;
       end
       else
       begin
       r2.SelStart:=i-1;
       r2.SelLength:=1;
       r2.SelAttributes.Color := clgreen;
       end
    end;
end;


procedure Tcomparing_results.res1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
Col,Row:integer;
begin
res1.MouseToCell(X,Y,Col,Row);
richedit1.Text:=res1.Cells[Col,Row];
richedit2.Text:=res2.Cells[Col,Row];
compare(richedit1,richedit2);
end;

procedure Tcomparing_results.res2MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
Col,Row:integer;
begin
res2.MouseToCell(X,Y,Col,Row);
richedit2.Text:=res2.Cells[Col,Row];
end;

procedure Tcomparing_results.RichEdit1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
compare(richedit1,richedit2);
end;

procedure Tcomparing_results.RichEdit2KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
compare(richedit1,richedit2);
end;

procedure Tcomparing_results.res2DrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
if(res1.Cells[ACol,ARow]<>res2.Cells[ACol,ARow]) then
        begin
        res2.Canvas.Font.Color := clRed;
        end else res2.Canvas.Font.Color := clGreen;
res2.Canvas.TextOut(rect.Left,rect.Top,res1.Cells[ACol,ARow]);

end;

procedure Tcomparing_results.res2MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
res1.Repaint;
end;

end.
