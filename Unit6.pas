unit Unit6;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Menus, ComCtrls, Buttons, shellapi;

type
  TPopMenu = class(TForm)
    tbl: TEdit;
    db: TEdit;
    Bevel1: TBevel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    col: TEdit;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    SpeedButton10: TSpeedButton;
    Memo1: TMemo;
    SpeedButton11: TSpeedButton;
    SpeedButton12: TSpeedButton;
    SpeedButton13: TSpeedButton;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton11MouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure SpeedButton11Click(Sender: TObject);
    procedure SpeedButton12Click(Sender: TObject);
    procedure SpeedButton13Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PopMenu: TPopMenu;

implementation

uses Unit4, Unit3, Unit9, Unit1, Unit14, Unit15, Unit17, Unit25, Unit2;

{$R *.DFM}

procedure TPopMenu.SpeedButton1Click(Sender: TObject);
begin
if(header.edit1.Text='') then showmessage('Check database first') else
	begin
	results.NewQuery('SELECT * FROM '+tbl.text,false,false,'',header.dbtype.text);
   PopMenu.Visible:=false;
   end;

end;

procedure TPopMenu.SpeedButton2Click(Sender: TObject);
begin
if(header.edit1.Text='') then showmessage('Check database first') else
	begin
	results.NewQuery('SELECT * FROM '+tbl.text,true,true,db.text+'.'+tbl.text+':Show all records',header.dbtype.Text);
        //if header.dbtype.Text='MSSQL' then header.execute.Click;
   PopMenu.Visible:=false;
   end;

end;

procedure TPopMenu.SpeedButton3Click(Sender: TObject);
begin
if(header.edit1.Text='') then showmessage('Check database first') else
	begin
        if header.dbtype.Text='MSSQL' then
                begin
                results.NewQuery('SELECT TOP 100 * FROM '+tbl.text+'',true,true,db.text+'.'+tbl.text+':Show top 100 records',header.dbtype.Text);
                header.execute.Click;
                end;
        if header.dbtype.Text='MySQL' then results.NewQuery('SELECT * FROM '+tbl.text+' limit 100',true,true,db.text+'.'+tbl.text+':Show top 100 records',header.dbtype.Text);
   PopMenu.Visible:=false;
   end;
end;

procedure TPopMenu.SpeedButton4Click(Sender: TObject);
var
query:string;
begin
if(header.edit1.Text='') then showmessage('Check database first') else
	begin
        if header.dbtype.Text='MSSQL' then query:= 'SELECT * FROM sysobjects '+
                                                    'INNER JOIN syscolumns ON sysobjects.id = syscolumns.id INNER JOIN '+
                                                    'systypes ON syscolumns.xtype = systypes.xtype '+
                                                    'WHERE (sysobjects.xtype = ''U'') '+
                                                    'and sysobjects.name='''+tbl.text+''' '+
                                                    'and systypes.name<>''sysname'' '+
                                                    'ORDER BY sysobjects.name, syscolumns.colid ';

	if header.dbtype.Text='MySQL' then query:='SHOW COLUMNS FROM '+tbl.text+' FROM '+db.text;

        results.NewQuery(query,true,true,db.text+'.'+tbl.text+':Show columns',header.dbtype.Text);
        header.execute.click;
        PopMenu.Visible:=false;
        end;

end;

procedure TPopMenu.SpeedButton6Click(Sender: TObject);
begin
create_table.button3.click;
create_table.Visible:=true;
popmenu.Visible:=false;
end;

procedure TPopMenu.SpeedButton5Click(Sender: TObject);
begin
//delete table
//ALTER TABLE dupa DROP nazwa
if application.MessageBox(pchar('Are you sure you want delete field '+tbl.text),'Query',MB_YESNO)=ID_YES then
        begin
        main.Query.SQL.Clear;
        main.Connection.Database:=db.text;
        main.Query.SQL.Add('ALTER TABLE '+tbl.text+' DROP '+col.text);
        main.Query.Execute;
        showmessage('Field deleted');
        end else showmessage('User canceled');
end;

procedure TPopMenu.SpeedButton7Click(Sender: TObject);
begin
if application.MessageBox(pchar('Are you sure you want delete table '+tbl.text),'Query',MB_YESNO)=ID_YES then
        begin
        main.Query.SQL.Clear;
        main.Connection.Database:=db.text;
        main.Query.SQL.Add('DROP TABLE '+tbl.text);
        main.Query.Execute;
        showmessage('Table deleted');
        end else showmessage('User canceled');
end;

procedure TPopMenu.SpeedButton8Click(Sender: TObject);
begin
create_database.visible:=true;
end;

procedure TPopMenu.SpeedButton9Click(Sender: TObject);
var
p,d:string;
begin
d:=copy(tbl.text,4,200);
dump.edit1.text:=d;
dump.visible:=true;
end;

procedure TPopMenu.SpeedButton10Click(Sender: TObject);
begin
PopupMenu2.Left:=PopMenu.Left;
PopupMenu2.Top:=PopMenu.Top+120;
PopupMenu2.Visible:=true;
PopMenu.Visible:=false;
end;

procedure TPopMenu.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
if(PopupMenu2.Visible=true) then PopupMenu2.Visible:=false;
end;

procedure TPopMenu.FormShow(Sender: TObject);
begin
popmenu.memo1.clear;
end;

procedure TPopMenu.SpeedButton11MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
if(PopupMenu2.Visible=true) then PopupMenu2.Visible:=false;

end;

procedure TPopMenu.SpeedButton11Click(Sender: TObject);
var
i:integer;
nazwa,cechy,dl:string;
begin
popmenu.Visible:=false;
if(memo1.text='') then showmessage('Expand Columns first for this action ') else
        begin
        modify_table.prepare.Click;
        for i:=0 to memo1.Lines.Count-1 do
                begin
                nazwa:=strbefore(memo1.lines[i],', ');
                cechy:=strafter(memo1.lines[i],', ');
                modify_table.kolumny.RowCount:=modify_table.kolumny.RowCount+1;
                modify_table.kolumny.Cells[1,modify_table.kolumny.RowCount-2]:=nazwa;
                if pos('(',cechy)>0 then
                        begin
                        dl:=strbefore(cechy,')');
                        dl:=strafter(dl,'(');
                        modify_table.kolumny.Cells[3,modify_table.kolumny.RowCount-2]:=dl;
                        modify_table.kolumny.Cells[2,modify_table.kolumny.RowCount-2]:=strbefore(cechy,'(');
                        end else
                        begin
                        modify_table.kolumny.Cells[2,modify_table.kolumny.RowCount-2]:=cechy;
                        end;
                //showmessage(nazwa);
                end;
        //modify_table.prepare.click;
        modify_table.Visible:=true;
        end;
end;

procedure TPopMenu.SpeedButton12Click(Sender: TObject);
var
q:string;
nr,i,j,number:integer;
param,definer,ress,tmp, tmp2:string;
begin
popmenu.Visible:=false;
q:='SELECT '+
'Cast(replace(substring(param_list,1,5000),"\n","|") as CHAR(5000)) AS param_list,definer, '+
'Cast(replace(substring(returns,1,5000),"\n","|") as CHAR(5000)) AS ret, '+
'Cast(replace(substring(body,1,5000),"\n","|") as CHAR(5000)) AS p1, '+
'Cast(replace(substring(body,5000,5000),"\n","|") as CHAR(5000)) AS p2, '+
'Cast(replace(substring(body,10000,5000),"\n","|") as CHAR(5000)) AS p3, '+
'Cast(replace(substring(body,15000,5000),"\n","|") as CHAR(5000)) AS p4, '+
'Cast(replace(substring(body,20000,5000),"\n","|") as CHAR(5000)) AS p5, '+
'Cast(replace(substring(body,25000,5000),"\n","|") as CHAR(5000)) AS p6, '+
'Cast(replace(substring(body,30000,5000),"\n","|") as CHAR(5000)) AS p7, '+
'Cast(replace(substring(body,35000,5000),"\n","|") as CHAR(5000)) AS p8, '+
'Cast(replace(substring(body,40000,5000),"\n","|") as CHAR(5000)) AS p9, '+
'Cast(replace(substring(body,45000,5000),"\n","|") as CHAR(5000)) AS p10 '+
'FROM mysql.proc WHERE db="'+db.Text+'" AND type="FUNCTION" AND name="'+col.Text+'"';

results.NewQuery(q,TRUE,false,'FUNCTION "'+col.text+'"',header.dbtype.Text);

tmp:='';
nr:=results.CheckQueryNo();
number := results.d[nr].DataSource.DataSet.RecordCount-1;
if(nr>-1) then
        begin
        results.d[nr].datasource.dataset.First;
        for j:=0 to number do
                begin
                for i:=0 to results.d[nr].DataSource.DataSet.FieldCount-1 do
                        begin
                        if(i=0) then param:=results.d[nr].DataSource.DataSet.Fields.Fields[i].AsString;
                        if(i=1) then definer:=results.d[nr].DataSource.DataSet.Fields.Fields[i].AsString;
                        if(i=2) then ress:=results.d[nr].DataSource.DataSet.Fields.Fields[i].AsString;
                        if(i>2) then tmp:=tmp+results.d[nr].DataSource.DataSet.Fields.Fields[i].AsString;
                        end;
                 results.d[nr].datasource.dataset.Next;
                end;
        tmp := stringreplace(tmp,'|',chr(10),[rfreplaceall]);
        tmp2 :='DROP FUNCTION IF EXISTS `'+col.text+'`;'+chr(13)+chr(13)+
               'CREATE DEFINER='+definer+' FUNCTION `'+col.text+'`('+param+') RETURNS '+ress+chr(13);


        results.m[nr].Text:=tmp2+tmp;
        results.m[nr].Height:=500;
        header.execute.Click;
        end else showmessage('No results to export');

end;


procedure TPopMenu.SpeedButton13Click(Sender: TObject);
var
q:string;
nr,i,j,number:integer;
param,definer,ress,tmp, tmp2:string;
begin
popmenu.Visible:=false;
q:='SELECT concat(ACTION_TIMING," ",EVENT_MANIPULATION), ACTION_STATEMENT FROM information_schema.TRIGGERS WHERE TRIGGER_SCHEMA = "'+db.Text+'" AND TRIGGER_NAME="'+col.Text+'"';

results.NewQuery(q,TRUE,false,'TRIGGER "'+col.text+'"',header.dbtype.Text);

tmp:='';
nr:=results.CheckQueryNo();
number := results.d[nr].DataSource.DataSet.RecordCount-1;
if(nr>-1) then
        begin
        results.d[nr].datasource.dataset.First;
        for j:=0 to number do
                begin
                for i:=0 to results.d[nr].DataSource.DataSet.FieldCount-1 do
                        begin
                        if(i=0) then definer:=results.d[nr].DataSource.DataSet.Fields.Fields[i].AsString;
                        if(i=1) then tmp:=tmp+results.d[nr].DataSource.DataSet.Fields.Fields[i].AsString;
                        end;
                 results.d[nr].datasource.dataset.Next;
                end;
        //tmp := stringreplace(tmp,'|',chr(10),[rfreplaceall]);
        tmp2 :=''+chr(13)+chr(13)+'DROP TRIGGER IF EXISTS `'+col.text+'`;'+chr(13)+chr(13)+
               'CREATE TRIGGER `'+col.text+'` '+definer+' ON '+tbl.Text+' FOR EACH ROW '+chr(13);


        results.m[nr].Text:=tmp2+tmp+chr(13)+chr(13)+'';
        results.m[nr].Height:=500;
        header.execute.Click;
        end else showmessage('No results to export');

end;

end.
