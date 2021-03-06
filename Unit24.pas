unit Unit24;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, ComCtrls,math;

type
  Tzapytanie = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    procedure Panel1DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure Panel1DragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure AddSelect(kol:string);
    procedure AddFrom(kol:string);
    procedure AddWhere(kol:string);
    procedure AddGroup(kol:string);
    procedure AddOrder(kol:string);
    procedure AddHaving(kol:string);
    procedure Panel2DragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure Panel2DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure Panel3DragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure Panel3DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure Panel4DragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure Panel4DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure Panel5DragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure Panel6DragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure Panel5DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure Panel6DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  zapytanie: Tzapytanie;

implementation

uses Unit4, Unit2;

{$R *.DFM}
procedure Tzapytanie.AddOrder(kol:string);
var
i,j,l,k,nr:integer;
q:string;
fixed:boolean;
begin
fixed:=false;
nr:=results.CheckQueryNo();
q:=results.m[nr].Text;
i:=pos('FROM',uppercase(q));
j:=pos('SELECT',uppercase(q));
l:=pos('ORDER',uppercase(q));

if((i=0) and (j=0)) then
        begin
        q:='SELECT * FROM X ORDER BY '+kol;
        results.m[nr].Text:=q;
        fixed:=true;
        end;
if((i>0) and (j>0) and (l=0) and (not fixed)) then
        begin
        q:=q+' ORDER BY '+kol;
        results.m[nr].Text:=q;
        fixed:=true;
        end;
if((l>0) and (not fixed)) then
        begin
        //j:=min(pos('ORDER',uppercase(q)));
        j:=length(q)+1;
        k:=j;
        while((q[j-1]=' ') or (q[j-1]=',')) do
                begin
                dec(j);
                end;

        q:=copy(q,1,j)+', '+kol+' '+copy(q,k+1,1000);
        q:=stringreplace(q,'ORDER BY,','ORDER BY',[rfIgnoreCase]);
        q:=stringreplace(q,'ORDER BY ,','ORDER BY',[rfIgnoreCase]);
        results.m[nr].text:=q;
        end;
end;


procedure Tzapytanie.AddHaving(kol:string);
var
i,j,l,k,nr:integer;
q:string;
fixed:boolean;
begin
fixed:=false;
nr:=results.CheckQueryNo();
q:=results.m[nr].Text;
i:=pos('FROM',uppercase(q));
j:=pos('SELECT',uppercase(q));
l:=pos('HAVING',uppercase(q));

if((i=0) and (j=0)) then
        begin
        q:='SELECT * FROM X GROUP BY X HAVING '+kol;
        results.m[nr].Text:=q;
        fixed:=true;
        end;
if((i>0) and (j>0) and (l=0) and (not fixed)) then
        begin
        q:=q+' HAVING '+kol;
        results.m[nr].Text:=q;
        fixed:=true;
        end;
if((l>0) and (not fixed)) then
        begin
        j:=pos('ORDER',uppercase(q));
        if j=0 then j:=length(q)+1;
        k:=j;
        while((q[j-1]=' ') or (q[j-1]=',')) do
                begin
                dec(j);
                end;

        q:=copy(q,1,j)+', '+kol+' '+copy(q,k+1,1000);
        q:=stringreplace(q,'HAVING,','HAVING',[rfIgnoreCase]);
        q:=stringreplace(q,'HAVING ,','HAVING',[rfIgnoreCase]);
        results.m[nr].text:=q;
        end;
end;



procedure Tzapytanie.AddGroup(kol:string);
var
i,j,l,k,nr:integer;
q:string;
fixed:boolean;
begin
fixed:=false;
nr:=results.CheckQueryNo();
q:=results.m[nr].Text;
i:=pos('FROM',uppercase(q));
j:=pos('SELECT',uppercase(q));
l:=pos('GROUP BY',uppercase(q));

if((i=0) and (j=0)) then
        begin
        q:='SELECT * FROM X GROUP BY '+kol;
        results.m[nr].Text:=q;
        fixed:=true;
        end;
if((i>0) and (j>0) and (l=0) and (not fixed)) then
        begin
        q:=q+' GROUP BY '+kol;
        results.m[nr].Text:=q;
        fixed:=true;
        end;
if((l>0) and (not fixed)) then
        begin
        j:=min(pos('HAVING',uppercase(q)),pos('ORDER',uppercase(q)));
        if j=0 then j:=length(q)+1;
        k:=j;
        while((q[j-1]=' ') or (q[j-1]=',')) do
                begin
                dec(j);
                end;

        q:=copy(q,1,j)+', '+kol+' '+copy(q,k+1,1000);
        q:=stringreplace(q,'GROUP BY,','GROUP BY',[rfIgnoreCase]);
        q:=stringreplace(q,'GROUP BY ,','GROUP BY',[rfIgnoreCase]);
        results.m[nr].text:=q;
        end;
end;


procedure Tzapytanie.AddWhere(kol:string);
var
i,j,l,k,nr:integer;
q:string;
fixed:boolean;
begin
fixed:=false;
nr:=results.CheckQueryNo();
q:=results.m[nr].Text;
i:=pos('FROM',uppercase(q));
j:=pos('SELECT',uppercase(q));
l:=pos('WHERE',uppercase(q));
if((i=0) and (j=0)) then
        begin
        q:='SELECT * FROM X WHERE '+kol;
        results.m[nr].Text:=q;
        fixed:=true;
        end;
if((i>0) and (j>0) and (l=0) and (not fixed)) then
        begin
        q:=q+' WHERE '+kol;
        results.m[nr].Text:=q;
        fixed:=true;
        end;
if((l>0) and (not fixed)) then
        begin
        j:=min(pos('GROUP',uppercase(q)),pos('HAVING',uppercase(q)));
        j:=min(j,pos('ORDER',uppercase(q)));
        if j=0 then j:=length(q)+1;
        k:=j;
        while((q[j-1]=' ') or (q[j-1]=',')) do
                begin
                dec(j);
                end;

        q:=copy(q,1,j)+' AND '+kol+' '+copy(q,k+1,1000);
//        q:=stringreplace(q,'FROM,','FROM',[rfIgnoreCase]);
//        q:=stringreplace(q,'FROM ,','FROM',[rfIgnoreCase]);
        results.m[nr].text:=q;
        end;
end;

procedure Tzapytanie.AddFrom(kol:string);
var
i,j,k,nr:integer;
q:string;
fixed:boolean;
begin
fixed:=false;
nr:=results.CheckQueryNo();
q:=results.m[nr].Text;
i:=pos('FROM',uppercase(q));
j:=pos('SELECT',uppercase(q));
if((i=0) and (j=0)) then
        begin
        q:='SELECT * FROM '+kol;
        results.m[nr].Text:=q;
        fixed:=true;
        end;
if((i=0) and (j>0) and (not fixed)) then
        begin
        q:=q+' FROM '+kol;
        results.m[nr].Text:=q;
        fixed:=true;
        end;
if((i>0) and (not fixed)) then
        begin
        j:=pos('WHERE',uppercase(q));
        if j=0 then j:=length(q)+1;
        k:=pos('(',uppercase(q));
        if k=0 then k:=length(q)+1;
        j:=min(j,k);

        k:=j;
        while((q[j-1]=' ') or (q[j-1]=',')) do
                begin
                dec(j);
                end;

        q:=copy(q,1,j)+', '+kol+' '+copy(q,k+1,1000);
        q:=stringreplace(q,'FROM,','FROM',[rfIgnoreCase]);
        q:=stringreplace(q,'FROM ,','FROM',[rfIgnoreCase]);
        results.m[nr].text:=q;
        end;
end;

procedure Tzapytanie.AddSelect(kol:string);
var
i,j,k,nr:integer;
q:string;
fixed:boolean;
begin
fixed:=false;
nr:=results.CheckQueryNo();
q:=results.m[nr].Text;

i:=pos('SELECT * ',uppercase(q));
if(i<>0) then
        begin
        results.m[nr].text:=stringreplace(results.m[nr].text,'SELECT * ','SELECT '+kol+' ',[rfIgnoreCase]);
        fixed:=true;
        end;

i:=pos('SELECT',uppercase(q));
if((i=0) and (not fixed)) then
        begin
        results.m[nr].text:='SELECT '+kol+' '+q;
        fixed:=true;
        end;
if((i>0) and (not fixed)) then
        begin
        j:=pos('FROM',uppercase(q));
        if j=0 then j:=length(q)+1;
        k:=pos('(',uppercase(q));
        if k=0 then k:=length(q)+1;
        j:=min(j,k);

        k:=j;
        while((q[j-1]=' ') or (q[j-1]=',')) do
                begin
                dec(j);
                end;

        q:=copy(q,1,j-1)+', '+kol+' '+copy(q,k,1000);
        q:=stringreplace(q,'SELECT,','SELECT',[rfIgnoreCase]);
        results.m[nr].text:=q;
        end;

end;

procedure Tzapytanie.Panel1DragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
if source is ttreeview Then
    begin
    accept := True;
    end
  else
    accept := False;
end;

procedure Tzapytanie.Panel1DragDrop(Sender, Source: TObject; X,
  Y: Integer);
var
nr:integer;
begin
nr:=results.CheckQueryNo();
AddSelect(tables.Edit1.text);
zapytanie.Visible:=false;
end;

procedure Tzapytanie.Panel2DragDrop(Sender, Source: TObject; X,
  Y: Integer);
var
nr:integer;
begin
nr:=results.CheckQueryNo();
AddFrom(tables.Edit1.text);
zapytanie.Visible:=false;
end;

procedure Tzapytanie.Panel2DragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
if source is ttreeview Then
    begin
    accept := True;
    end
  else
    accept := False;
end;


procedure Tzapytanie.Panel3DragDrop(Sender, Source: TObject; X,
  Y: Integer);
var
nr:integer;
begin
nr:=results.CheckQueryNo();
AddWhere(tables.Edit1.text);
zapytanie.Visible:=false;
end;

procedure Tzapytanie.Panel3DragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
if source is ttreeview Then
    begin
    accept := True;
    end
  else
    accept := False;
end;

procedure Tzapytanie.Panel4DragDrop(Sender, Source: TObject; X,
  Y: Integer);
var
nr:integer;
begin
nr:=results.CheckQueryNo();
AddGroup(tables.Edit1.text);
zapytanie.Visible:=false;
end;

procedure Tzapytanie.Panel4DragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
if source is ttreeview Then
    begin
    accept := True;
    end
  else
    accept := False;
end;

procedure Tzapytanie.Panel5DragDrop(Sender, Source: TObject; X,
  Y: Integer);
var
nr:integer;
begin
nr:=results.CheckQueryNo();
AddHaving(tables.Edit1.text);
zapytanie.Visible:=false;
end;

procedure Tzapytanie.Panel6DragDrop(Sender, Source: TObject; X,
  Y: Integer);
var
nr:integer;
begin
nr:=results.CheckQueryNo();
AddOrder(tables.Edit1.text);
zapytanie.Visible:=false;
end;

procedure Tzapytanie.Panel5DragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
if source is ttreeview Then
    begin
    accept := True;
    end
  else
    accept := False;
end;

procedure Tzapytanie.Panel6DragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
if source is ttreeview Then
    begin
    accept := True;
    end
  else
    accept := False;
end;

end.
