unit Unit17;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, StdCtrls,unit3, mySQLClient;

type
  TPopupMenu2 = class(TForm)
    SpeedButton1: TSpeedButton;
    Edit1: TEdit;
    Edit2: TEdit;
    SpeedButton3: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PopupMenu2: TPopupMenu2;

implementation

uses Unit4, Unit6, Unit2, Unit5;

{$R *.DFM}

procedure TPopupMenu2.SpeedButton1Click(Sender: TObject);
var
q,kol:string;
i:integer;
begin
if (edit1.text='tabela') then
  if(popmenu.memo1.text='') then showmessage('Expand Columns first for this action ') else
        begin
        popupmenu2.Visible:=false;
        kol:='';
        for i:=0 to popmenu.memo1.lines.count-1 do
                begin
                kol:=kol+'      '+strbefore(popmenu.memo1.lines[i],', ')+' '+strafter(popmenu.memo1.lines[i],', ')+', '+chr(13);
                end;
        kol:=copy(kol,0,length(kol)-3);

        q:='CREATE TABLE '+popmenu.tbl.text+' ('+chr(13)+kol+')';
        memo_show.RichEdit1.Highlighter:=memo_show.synSQLsyn1;
//        if php.checked then q:='$sql="INSERT INTO '+chr(13)+popmenu.tbl.text+chr(13)+' ('+kol2+') '+chr(13)+'VALUES '+chr(13)+'('+wart2+')";';
        //q:='SHOW CREATE TRIGGER '+edit2.text;
        memo_show.RichEdit1.Text:=q;
        memo_show.Visible:=true;
        end;

end;

procedure TPopupMenu2.SpeedButton3Click(Sender: TObject);
var
q, wart2, kol2, wart,kol:string;
i:integer;
begin
if (edit1.text='tabela') then
  if(popmenu.memo1.text='') then showmessage('Expand Columns first for this action ') else
        begin
        popupmenu2.Visible:=false;
        kol:='';
        wart:='';
        for i:=0 to popmenu.memo1.lines.count-1 do
                begin
                kol:=kol+''+strbefore(popmenu.memo1.lines[i],', ')+', ';
                wart:=wart+''+strafter(popmenu.memo1.lines[i],', ')+', ';
                end;
        kol:=copy(kol,0,length(kol)-2);
        wart:=copy(wart,0,length(wart)-2);
        kol2:=copy(kol2,0,length(kol2)-2);
        wart2:=copy(wart2,0,length(wart2)-2);
        memo_show.RichEdit1.Highlighter:=memo_show.synSQLsyn1;
        q:='INSERT INTO '+popmenu.tbl.text+chr(13)+'     ('+kol+') '+chr(13)+'  VALUES '+chr(13)+'     ('+wart+');';
        memo_show.RichEdit1.Text:=q;
        memo_show.Visible:=true;
        end;

end;

procedure TPopupMenu2.SpeedButton4Click(Sender: TObject);
var
q, wart2, kol2, wart, zm,kol:string;
i:integer;
begin
if (edit1.text='tabela') then
  if(popmenu.memo1.text='') then showmessage('Expand Columns first for this action ') else
        begin
        popupmenu2.Visible:=false;
        kol:='';
        wart:='';
        for i:=0 to popmenu.memo1.lines.count-1 do
                begin
                kol2:=kol2+'`'+strbefore(popmenu.memo1.lines[i],', ')+'`, ';
                wart2:=wart2+'''".$'+strbefore(popmenu.memo1.lines[i],', ')+'."'', ';
                zm := zm+'$'+strbefore(popmenu.memo1.lines[i],', ')+' = addslashes($_POST["'+strbefore(popmenu.memo1.lines[i],', ')+'"]);'+chr(13);
                end;
        kol:=copy(kol,0,length(kol)-2);
        wart:=copy(wart,0,length(wart)-2);
        kol2:=copy(kol2,0,length(kol2)-2);
        wart2:=copy(wart2,0,length(wart2)-2);
        memo_show.RichEdit1.Highlighter:=memo_show.synSQLsyn1;
        memo_show.RichEdit1.Highlighter:=memo_show.synPHPsyn1;
        q:=zm+chr(13)+'$sql="INSERT INTO '+popmenu.tbl.text+chr(13)+'     ('+kol2+') '+chr(13)+'  VALUES '+chr(13)+'     ('+wart2+')";';
        memo_show.RichEdit1.Text:=q;
        memo_show.Visible:=true;
        end;

end;

procedure TPopupMenu2.SpeedButton2Click(Sender: TObject);
var
q,kol,typ,dl:string;
i:integer;
begin
if (edit1.text='tabela') then
  if(popmenu.memo1.text='') then showmessage('Expand Columns first for this action ') else
        begin
        popupmenu2.Visible:=false;
        kol:='';
        for i:=0 to popmenu.memo1.lines.count-1 do
                begin
                typ:=strafter(popmenu.memo1.lines[i],', ');
                if(pos('int',typ)>0) then typ:='int';
                if(pos('(',typ)>0) then typ:='['+strbefore(typ,'(')+'] ('+strafter(typ,'(')
                        else typ:='['+strbefore(typ,'(')+']';
                typ:=stringreplace(typ,'unsigned','',[rfreplaceall]);
                kol:=kol+'      ['+strbefore(popmenu.memo1.lines[i],', ')+'] '+typ+', '+chr(13);
                end;
        kol:=copy(kol,0,length(kol)-3);

        q:='CREATE TABLE ['+popmenu.tbl.text+'] ('+chr(13)+kol+')';
        memo_show.RichEdit1.Highlighter:=memo_show.synSQLsyn1;
//        if php.checked then q:='$sql="INSERT INTO '+chr(13)+popmenu.tbl.text+chr(13)+' ('+kol2+') '+chr(13)+'VALUES '+chr(13)+'('+wart2+')";';
        //q:='SHOW CREATE TRIGGER '+edit2.text;
        memo_show.RichEdit1.Text:=q;
        memo_show.Visible:=true;
        end;

end;

procedure TPopupMenu2.SpeedButton5Click(Sender: TObject);
var
q,kol,typ,dl:string;
i,j:integer;
begin
j:=0;
if (edit1.text='tabela') then
  if(popmenu.memo1.text='') then showmessage('Expand Columns first for this action ') else
        begin
        popupmenu2.Visible:=false;
        kol:='';
        q:='$sql="UPDATE '+popmenu.tbl.text+' SET '+chr(13);
        for i:=0 to popmenu.memo1.lines.count-1 do
                begin
                typ:=strafter(popmenu.memo1.lines[i],', ');
                if(pos('int',typ)>0) then typ:='int';
                if(pos('(',typ)>0) then typ:='['+strbefore(typ,'(')+'] ('+strafter(typ,'(')
                        else typ:='['+strbefore(typ,'(')+']';
                typ:=stringreplace(typ,'unsigned','',[rfreplaceall]);
                kol:=''+strbefore(popmenu.memo1.lines[i],', ');
                q:=q+' '+kol+'=''".$'+kol+'."'',';
                inc(j);
                if j>2 then
                        begin
                        j:=0;
                        q:=q+chr(13)+'  ';
                        end;
                end;
        q:=copy(q,0,length(q)-1)+chr(13)+'  WHERE ";';

        memo_show.RichEdit1.Highlighter:=memo_show.synSQLsyn1;
//        if php.checked then q:='$sql="INSERT INTO '+chr(13)+popmenu.tbl.text+chr(13)+' ('+kol2+') '+chr(13)+'VALUES '+chr(13)+'('+wart2+')";';
        //q:='SHOW CREATE TRIGGER '+edit2.text;
        memo_show.RichEdit1.Text:=q;
        memo_show.Visible:=true;
        end;

end;

end.
