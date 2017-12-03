unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, ComCtrls,  StdCtrls, Menus, ImgList,
  jpeg, Buttons;

type
  Ttables = class(TForm)
    alpha: TScrollBar;
    ImageList1: TImageList;
    Image1: TImage;
    tabele: TTreeView;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    Edit1: TEdit;
    tabela: TEdit;
    kolumny: TListBox;
    sel_tabela: TCheckBox;
    procedure alphaChange(Sender: TObject);
    procedure tabele2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure tabeleClick(Sender: TObject);
    procedure tabeleDblClick(Sender: TObject);
    procedure tabeleMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure tabeleMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure tabeleMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure tabeleEndDrag(Sender, Target: TObject; X, Y: Integer);
  private
    { Private declarations }
  public
    procedure UpdateColums(owner:ttreenode);

  end;

var
  tables: Ttables;
function SetLayeredWindowAttributes(Handle : HWND; crKey : TColor; bAlpha : Byte; dwFlags : DWORD) : Boolean; stdcall; external 'user32.dll';
function StrBefore(s,s2: string): string;
function StrAfter(s,s2: string): string;

implementation

uses Unit1, Unit4, Unit3, Unit6, Unit7, Unit17, Unit24;

{$R *.DFM}

function StrAfter(s,s2: string): string;
var p: integer;
begin
  p:=pos(s2,s);
  if p>0 then result:=copy(s,p+length(s2),length(s)-p)
  else result:=s;
end;

function StrBefore(s,s2: string): string;
var p: integer;
begin
  p:=pos(s2,s);
  if p>0 then result:=copy(s,1,p-1)
  else result:=s;
end;

procedure Ttables.alphaChange(Sender: TObject);
var vi : _OSVERSIONINFO;
    oldStyle : DWORD;
begin
  GetVersionEx(vi);
  if vi.dwMajorVersion >= 5 then { Win2000 or superior?! }
  begin
    oldStyle := GetWindowLong(Self.Handle, GWL_EXSTYLE);
    SetWindowLong(Self.Handle, GWL_EXSTYLE, oldStyle or $00080000);
    SetLayeredWindowAttributes(Self.Handle, clBlack,tables.alpha.Position+35, 2);
    RedrawWindow(Self.Handle, nil, 0, RDW_ERASE or RDW_INVALIDATE or RDW_FRAME or RDW_ALLCHILDREN);
  end;
end;

procedure Ttables.tabele2MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
node:ttreenode;
begin
{
try
node:=tabele.GetNodeAt(x,y);
node:=node.Parent.Parent;
popupmenu1.Items.Items[0].Enabled:=false;
popupmenu1.Items.Items[1].Enabled:=false;
popupmenu1.Items.Items[2].Enabled:=false;

if(copy(node.Text,1,3)='db.') then
	begin
   popupmenu1.Items.Items[0].Enabled:=true;
   popupmenu1.Items.Items[1].Enabled:=true;
   popupmenu1.Items.Items[2].Enabled:=true;
   end;
except end;
}
end;

function getDB(var obj:ttreenode;res:string):string;
var
parentTXT:string;
parent:ttreenode;
begin
if(copy(obj.Text,1,4)<>'srv.') then
	begin
	parentTXT:=tables.tabele.Items.GetNode(obj.ItemId).parent.Text;
	parent:=tables.tabele.Items.GetNode(obj.ItemId).parent;
//	if((parent<>nil) and (copy(parentTXT,1,4)<>'srv.')) then
		begin
//      showmessage('->'+obj.Text);
		if(copy(obj.Text,1,3)<>'db.') then getDB(parent,res) else
      	begin
            res:=strafter(obj.Text,'db.');
//           showmessage(res);
            if(res<>'') then header.Edit1.Text:=res;
//				if(res<>'') then result:=res;
         end;
	   end;
	end;
end;

function getSRV(var obj:ttreenode;res:string):string;
var
parentTXT:string;
parent:ttreenode;
i:integer;
begin
if(copy(obj.Text,1,4)<>'srv.') then
	begin
	parentTXT:=tables.tabele.Items.GetNode(obj.ItemId).parent.Text;
	parent:=tables.tabele.Items.GetNode(obj.ItemId).parent;
	if(copy(obj.Text,1,3)<>'db.') then getSRV(parent,res) else
      	        begin
                res:=strafter(obj.parent.parent.Text,'db.');
                if(res<>'') then
                        begin
                        header.server.Text:=copy(res,pos(':',res)+1,length(res)-pos(':',res)-1);
                        header.dbtype.Text:=copy(res,1,pos(':',res)-1);
                        end;
                end;
        end else
                begin
                header.server.Text:=copy(res,pos(':',res)+1,length(res)-pos(':',res)-1);
                header.dbtype.Text:=copy(res,1,pos(':',res)-1);
                end;
//showmessage(header.server.Text);
for i:=0 to ConnectionMax do
        begin
        if Connections[i].server_opis=header.server.Text then
                begin
                header.address.text:=Connections[i].server_name;
                //header.server.Text:=s_name[i];
                //showmessage(s_name[i]);
                end;
        end;
end;


procedure Ttables.tabeleClick(Sender: TObject);
var
db:string;
node:ttreenode;
begin
tabele.Refresh;
node:=tabele.Items.GetNode(tabele.Selected.ItemId);
getDB(node,'');
getSRV(node,'');
//header.Edit1.Text:=db;
//showmessage(header.address.text);
//showmessage(results.TabbedNotebook1.ActivePage)
end;

procedure waiton;
var
  Cur: TCursor;
begin
  Cur := Screen.Cursor;
  Screen.Cursor := crSQLWait;
end;

procedure waitoff;
var
  Cur: TCursor;
begin
  Cur := Screen.Cursor;
  Screen.Cursor := crDefault;
end;

procedure Ttables.UpdateColums(owner:ttreenode);
var
str,parentTXT,query:string;
nr,i:integer;
tmp:ttreenode;
begin
owner.DeleteChildren;
parentTXT:=owner.Parent.Text;

nr:=results.GetConnectionIdFromTop();
main.SaveLog(TForm(self),nil,'UpdateColums: After GetConnectionIdFromTop nr='+inttostr(nr));
results.ReconnectFromTop(nr);
if(header.dbtype.text='MSSQL') then
        begin
        query:= 'SELECT sysobjects.name AS table_name, syscolumns.name AS Field, '+
                'systypes.name+''(''+cast(syscolumns.LENGTH as varchar)+'')'' AS Type FROM sysobjects '+
                'INNER JOIN syscolumns ON sysobjects.id = syscolumns.id INNER JOIN '+
                'systypes ON syscolumns.xtype = systypes.xtype '+
                'WHERE (sysobjects.xtype = ''U'') '+
                'and sysobjects.name='''+parentTXT+''' '+
                'and systypes.name<>''sysname'' '+
                'ORDER BY sysobjects.name, syscolumns.colid ';
        main.msquery.SQL.Clear;
        main.msquery.SQL.Add(query);
        try
        main.msquery.open;
        except showmessage('q'); end;
        end;
if(header.dbtype.text='MySQL') then
        begin
        query:='SHOW COLUMNS FROM '+parentTXT+' FROM '+strafter(owner.Parent.Parent.Parent.Text,'db.');
        main.query.SQL.Clear;
        main.query.SQL.Add(query);
        main.query.Execute;
        end;


str:='';
main.tmp.DataSource.DataSet.First;
for i:=1 to main.tmp.DataSource.DataSet.RecordCount do
        begin
        tmp:=tabele.Items.AddChild(owner,main.tmp.DataSource.DataSet.FieldValues['Field']+', '+main.tmp.DataSource.DataSet.FieldValues['Type']);
        results.sqlstyle.TableNames.Add(main.tmp.DataSource.DataSet.FieldValues['Field']);
        results.DodajHinta('FIELD: '+main.tmp.DataSource.DataSet.FieldValues['Field'], main.tmp.DataSource.DataSet.FieldValues['Field']);
        str:=str+owner.parent.text+'.'+main.tmp.DataSource.DataSet.FieldValues['Field']+', '+chr(13);
        tmp.ImageIndex:=4;
        tmp.SelectedIndex:=4;
        main.tmp.DataSource.DataSet.Next;
        end;
results.podpowiedzi.ItemList.Add('ALL FIELDS: '+owner.parent.text+'.*');
results.podpowiedzi.InsertList.Add(copy(str,0,strlen(pchar(str))-3)+' ');

end;

procedure Ttables.tabeleDblClick(Sender: TObject);
var
tmp,columns,triggers,keys,indexes,owner:ttreenode;
s1,s2,s3,str,ownerOldTXT,query,parentTXT,ownerTXT:string;
nr, i:integer;
begin
try
waiton;
main.SaveLog(TForm(self),Sender,'Before GetConnectionIdFromTop');
nr:=results.GetConnectionIdFromTop();
main.SaveLog(TForm(self),Sender,'After GetConnectionIdFromTop nr='+inttostr(nr));
results.ReconnectFromTop(nr);
main.SaveLog(TForm(self),Sender,'After ReconnectFromTop');
if main.Connection.Connected then main.SaveLog(TForm(self),Sender,'MySQL Connected') else main.SaveLog(TForm(self),Sender,'MySQL not connected');
if main.MSConnection.Connected then main.SaveLog(TForm(self),Sender,'MSSQL Connected') else main.SaveLog(TForm(self),Sender,'MSSQL not connected');



owner:=tabele.Items.GetNode(tabele.Selected.ItemId);
ownerTXT:=tabele.Items.GetNode(tabele.Selected.ItemId).Text;
main.SaveLog(TForm(self),Sender,'Type:'+header.dbtype.text+': Owner:'+ownerTXT);

if((copy(ownerTXT,1,4)<>'srv.') and (ownerTXT<>'Databases')) then
	begin
        //results.ReconnectFromTop();
	parentTXT:=tabele.Items.GetNode(tabele.Selected.ItemId).Parent.Text;
	ownerOldTXT:=ownerTXT;
	application.ProcessMessages;
	owner.Text:=owner.Text+' (expanding)';
	application.ProcessMessages;

	if((copy(owner.Text,1,3)='db.')) then
		begin
                owner.DeleteChildren;
	        //dodawanie kolumn
		tmp:=tabele.Items.AddChild(owner,'Tables');
                tmp.ImageIndex:=1;
		tmp.SelectedIndex:=1;
		tmp:=tabele.Items.AddChild(owner,'Functions');
                tmp.ImageIndex:=1;
		tmp.SelectedIndex:=1;
		tmp:=tabele.Items.AddChild(owner,'Procedures');
                tmp.ImageIndex:=1;
		tmp.SelectedIndex:=1;
		tmp:=tabele.Items.AddChild(owner,'Views');
                tmp.ImageIndex:=1;
		tmp.SelectedIndex:=1;
	        end;

	if((copy(owner.Parent.Text,1,3)='db.') and (ownerTXT='Tables')) then
		begin
                owner.DeleteChildren;
	        //uaktualnianie tabel

                if(header.dbtype.text='MSSQL') then
                        begin
                        query:='select name as Tables_in_'+strafter(owner.Parent.Text,'db.')+' from SYSOBJECTS where TYPE = ''U'' order by NAME';
                        main.msquery.SQL.Clear;
                        main.msquery.SQL.Add(query);
                        main.msquery.open;
                        end;
                if(header.dbtype.text='MySQL') then
                        begin
                        query:='show tables from '+strafter(owner.Parent.Text,'db.');
                        main.query.SQL.Clear;
                        main.query.SQL.Add(query);
                        main.query.Execute;
                        end;
		main.tmp.DataSource.DataSet.First;
		for i:=1 to main.tmp.DataSource.DataSet.RecordCount do
			begin
		        tmp:=tabele.Items.AddChild(owner,main.tmp.DataSource.DataSet.FieldValues['Tables_in_'+strafter(owner.Parent.Text,'db.')]);
                        results.sqlstyle.TableNames.Add(main.tmp.DataSource.DataSet.FieldValues['Tables_in_'+strafter(owner.Parent.Text,'db.')]);
                        results.DodajHinta('TABLE: '+main.tmp.DataSource.DataSet.FieldValues['Tables_in_'+strafter(owner.Parent.Text,'db.')], main.tmp.DataSource.DataSet.FieldValues['Tables_in_'+strafter(owner.Parent.Text,'db.')]);
	   	        tmp.ImageIndex:=3;
			tmp.SelectedIndex:=3;
			main.tmp.DataSource.DataSet.Next;
		        end;
  		 end;

	if((ownerOldTXT='Columns') and (owner.Parent.Text<>'Tables')) then
		begin
	        //uaktualnianie Columns
                UpdateColums(owner);
	        end;


	if((ownerOldTXT='Keys') and (owner.Parent.Text<>'Tables')) then
		begin
                owner.DeleteChildren;
	        //uaktualnianie Kluczy
	        query:='select * from information_schema.KEY_COLUMN_USAGE where TABLE_SCHEMA="'+strafter(owner.Parent.Parent.Parent.Text,'db.')+'" AND TABLE_NAME="'+parentTXT+'"';
	        main.query.SQL.Clear;
		main.query.SQL.Add(query);
		main.query.Execute;
		main.tmp.DataSource.DataSet.First;
		for i:=1 to main.tmp.DataSource.DataSet.RecordCount do
			begin
		        tmp:=tabele.Items.AddChild(owner,main.tmp.DataSource.DataSet.FieldValues['COLUMN_NAME']+', '+main.tmp.DataSource.DataSet.FieldValues['CONSTRAINT_NAME']);
	   	        tmp.ImageIndex:=6;
			tmp.SelectedIndex:=6;
                        main.tmp.DataSource.DataSet.Next;
		        end;
	        end;


	if((ownerOldTXT='Triggers') and (owner.Parent.Text<>'Tables')) then
		begin
                owner.DeleteChildren;
	        //uaktualnianie Trigerow
                if(header.dbtype.text='MSSQL') then
                        begin
                        query:='SELECT name FROM sysobjects WHERE xtype=''TR''';
                        main.msquery.SQL.Clear;
                        main.msquery.SQL.Add(query);
                        main.msquery.Open;
                        end;

                if(header.dbtype.text='MySQL') then
                        begin
        	        query:='select * from information_schema.TRIGGERS where EVENT_OBJECT_SCHEMA="'+strafter(owner.Parent.Parent.Parent.Text,'db.')+'" AND EVENT_OBJECT_TABLE="'+parentTXT+'"';
                        main.query.SQL.Clear;
                        main.query.SQL.Add(query);
                        main.query.Execute;
                        end;

		main.tmp.DataSource.DataSet.First;
		for i:=1 to main.tmp.DataSource.DataSet.RecordCount do
			begin
		        tmp:=tabele.Items.AddChild(owner,main.tmp.DataSource.DataSet.FieldValues['TRIGGER_NAME']);
	   	        tmp.ImageIndex:=5;
			tmp.SelectedIndex:=5;
      	                main.tmp.DataSource.DataSet.Next;
		        end;
	        end;


	if((ownerOldTXT='Indexes') and (owner.Parent.Text<>'Tables')) then
		begin
                owner.DeleteChildren;
	        //uaktualnianie indexow
	        query:='select * from information_schema.TABLE_CONSTRAINTS where TABLE_SCHEMA="'+strafter(owner.Parent.Parent.Parent.Text,'db.')+'" AND TABLE_NAME="'+parentTXT+'"';
                query:='SHOW INDEX FROM '+strafter(owner.Parent.Parent.Parent.Text,'db.')+'.'+parentTXT;
	        main.query.SQL.Clear;
		main.query.SQL.Add(query);
		main.query.Execute;
		main.tmp.DataSource.DataSet.First;
                s1:='';s2:='';s3:='';
		for i:=1 to main.tmp.DataSource.DataSet.RecordCount do
			begin
                        s1:=main.tmp.DataSource.DataSet.fields[2].AsString;
                        if((s1<>s2)) then
                                begin
                                tmp:=tabele.Items.AddChild(owner,s1);
                                end;
	   	        tmp.ImageIndex:=7;
			tmp.SelectedIndex:=7;
                        s2:=s1;
      	                main.tmp.DataSource.DataSet.Next;
		        end;
	        end;


	if((owner.Parent.Text='Tables')) then
		begin
                owner.DeleteChildren;
	        //uaktualnianie pod tables
	        tmp:=tabele.Items.AddChild(owner,'Columns');
                tmp.ImageIndex:=1;
		tmp.SelectedIndex:=1;
	        tmp:=tabele.Items.AddChild(owner,'Keys');
                tmp.ImageIndex:=1;
		tmp.SelectedIndex:=1;
	        tmp:=tabele.Items.AddChild(owner,'Triggers');
                tmp.ImageIndex:=1;
	        tmp.SelectedIndex:=1;
	        tmp:=tabele.Items.AddChild(owner,'Indexes');
                tmp.ImageIndex:=1;
		tmp.SelectedIndex:=1;
	        end;


	if((ownerTXT='Functions') and (copy(owner.Parent.Text,1,3)='db.')) then
		begin
                owner.DeleteChildren;
	        //uaktualnianie Kolumn funkcji
                if(header.dbtype.text='MSSQL') then
                        begin
                        query:='SELECT SPECIFIC_NAME FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_TYPE = ''FUNCTION'' AND OBJECTPROPERTY ( OBJECT_ID(ROUTINE_NAME), ''IsMsShipped'') = 0 ORDER BY ROUTINE_NAME';
                        main.msquery.SQL.Clear;
                        main.msquery.SQL.Add(query);
                        main.msquery.Open;
                        end;

                if(header.dbtype.text='MySQL') then
                        begin
                        query:='SELECT SPECIFIC_NAME, ROUTINE_SCHEMA, ROUTINE_NAME, ROUTINE_TYPE FROM information_schema.ROUTINES WHERE ROUTINE_TYPE="FUNCTION" AND ROUTINE_SCHEMA="'+strafter(owner.Parent.Text,'db.')+'"';
                        main.query.SQL.Clear;
                        main.query.SQL.Add(query);
                        main.query.Execute;
                        end;

		main.tmp.DataSource.DataSet.First;
		for i:=1 to main.tmp.DataSource.DataSet.RecordCount do
			begin
		        tmp:=tabele.Items.AddChild(owner,main.tmp.DataSource.DataSet.FieldValues['SPECIFIC_NAME']);
	                tmp.ImageIndex:=8;
			tmp.SelectedIndex:=8;
	   	        main.tmp.DataSource.DataSet.Next;
		        end;
	        end;

	if((ownerTXT='Procedures') and (copy(owner.Parent.Text,1,3)='db.')) then
		begin
                owner.DeleteChildren;
	        //uaktualnianie Kolumn procedur
                if(header.dbtype.text='MSSQL') then
                        begin
                        query:='SELECT SPECIFIC_NAME FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_TYPE = ''PROCEDURE'' AND OBJECTPROPERTY ( OBJECT_ID(ROUTINE_NAME), ''IsMsShipped'') = 0 ORDER BY ROUTINE_NAME';
                        main.msquery.SQL.Clear;
                        main.msquery.SQL.Add(query);
                        main.msquery.Open;
                        end;

                if(header.dbtype.text='MySQL') then
                        begin
                        query:='SELECT SPECIFIC_NAME, ROUTINE_SCHEMA, ROUTINE_NAME, ROUTINE_TYPE FROM information_schema.ROUTINES WHERE ROUTINE_TYPE="PROCEDURE" AND ROUTINE_SCHEMA="'+strafter(owner.Parent.Text,'db.')+'"';
                        main.query.SQL.Clear;
                        main.query.SQL.Add(query);
                        main.query.Execute;
                        end;
		main.tmp.DataSource.DataSet.First;
		for i:=1 to main.tmp.DataSource.DataSet.RecordCount do
			begin
		        tmp:=tabele.Items.AddChild(owner,main.tmp.DataSource.DataSet.FieldValues['SPECIFIC_NAME']);
	                tmp.ImageIndex:=9;
			tmp.SelectedIndex:=9;
	   	        main.tmp.DataSource.DataSet.Next;
		        end;
	        end;

	if((ownerTXT='Views') and (copy(owner.Parent.Text,1,3)='db.')) then
		begin
                owner.DeleteChildren;
	        //uaktualnianie Kolumn widokow
                if(header.dbtype.text='MSSQL') then
                        begin
                        query:='SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE = ''VIEW'' AND OBJECTPROPERTY(OBJECT_ID(TABLE_NAME), ''IsMsShipped'') = 0 ORDER BY TABLE_NAME ';
                        main.msquery.SQL.Clear;
                        main.msquery.SQL.Add(query);
                        main.msquery.Open;
                        end;

                if(header.dbtype.text='MySQL') then
                        begin
        	        query:='select * from information_schema.VIEWS where TABLE_SCHEMA="'+strafter(owner.Parent.Text,'db.')+'"';
                        main.query.SQL.Clear;
                        main.query.SQL.Add(query);
                        main.query.Execute;
                        end;

		main.tmp.DataSource.DataSet.First;
		for i:=1 to main.tmp.DataSource.DataSet.RecordCount do
			begin
		        tabele.Items.AddChild(owner,main.tmp.DataSource.DataSet.FieldValues['TABLE_NAME']);
	   	        main.tmp.DataSource.DataSet.Next;
		        end;
	        end;

	application.ProcessMessages;
	owner.Text:=ownerOldTXT;
	owner.Expand(false);

end;
except end;
waitoff;
end;

procedure Ttables.tabeleMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
tmp,columns,triggers,keys,indexes,owner:ttreenode;
s1,s2,ownerOldTXT,query,parentTXT,ownerTXT:string;
i:integer;
begin
//tables.OnClick(nil);
try
{
if(Button=mbLeft) then
	begin
        //motyw przeciagania dancyh
        owner:=tabele.Items.GetNode(tabele.Selected.ItemId);
        if((owner.parent.text='Columns') and (owner.Parent.parent.parent.Text='Tables')) then
            begin
            // klik na kolumnie w tabeli
            //screen.Cursor:=crdrag;
            ownerTXT:=tabele.Items.GetNode(tabele.Selected.ItemId).Text;
            edit1.text:=copy(ownerTXT,0,pos(',',ownerTXT)-1);
            application.ProcessMessages;
            tabele.BeginDrag(true);
            end;
        if((owner.parent.text='Tables') and (copy(owner.parent.Parent.Text,1,3)='db.')) then
            begin
            // klik na tabeli
            //screen.Cursor:=crdrag;
            edit1.text:=owner.text;
            tabela.text:=owner.text;
            kolumny.Clear;

            tmp:=owner.getFirstChild;
            if tmp=nil then
                begin
                results.ReconnectFromTop();
	        tmp:=tabele.Items.AddChild(owner,'Columns');
                tmp.ImageIndex:=1;
		tmp.SelectedIndex:=1;
	        UpdateColums(tmp);
                tmp:=tabele.Items.AddChild(owner,'Keys');
                tmp.ImageIndex:=1;
		tmp.SelectedIndex:=1;
	        tmp:=tabele.Items.AddChild(owner,'Triggers');
                tmp.ImageIndex:=1;
	        tmp.SelectedIndex:=1;
	        tmp:=tabele.Items.AddChild(owner,'Indexes');
                tmp.ImageIndex:=1;
		tmp.SelectedIndex:=1;
                Application.ProcessMessages;
                end;
            tmp:=owner.getFirstChild.getFirstChild;
            try
            i:=0;
            while ((tmp.AbsoluteIndex<=owner.getFirstChild.GetLastChild.AbsoluteIndex) and (i<1000)) do
                begin
                inc(i);
                kolumny.Items.add(strbefore(tmp.Text,','));
                tmp:=owner.getFirstChild.GetNextChild(tmp);
                end;
            except end;
            application.ProcessMessages;
            sel_tabela.Checked:=true;
            tabele.BeginDrag(true);
            end else sel_tabela.Checked:=false;
        end;
}
if(Button=mbRight) then
	begin
   tmp:=tabele.GetNodeAt(x,y);
   tmp.Selected:=true;
   owner:=tabele.Items.GetNode(tabele.Selected.ItemId);
   ownerTXT:=tabele.Items.GetNode(tabele.Selected.ItemId).Text;
   PopMenu.speedButton1.Enabled:=false;
   PopMenu.speedButton2.Enabled:=false;
   PopMenu.speedButton3.Enabled:=false;
   PopMenu.speedButton4.Enabled:=false;
   PopMenu.speedButton5.Enabled:=false;
   PopMenu.speedButton6.Enabled:=false;
   PopMenu.speedButton7.Enabled:=false;
   PopMenu.speedButton8.Enabled:=false;
   PopMenu.speedButton9.Enabled:=false;
   PopMenu.speedButton10.Enabled:=false;
   PopMenu.speedButton11.Enabled:=false;
   PopMenu.speedButton12.Enabled:=false;

   PopMenu.Visible:=false;

   if((owner.text='Databases') and (copy(owner.Parent.Text,1,3)='srv')) then
   	begin
        //klik na Databases
        PopMenu.tbl.Text:=ownerTXT;
        PopMenu.db.Text:=header.Edit1.text;
        PopMenu.Left:=x+tables.left-10;
        PopMenu.Top:=y+10+tables.top;
        PopMenu.Visible:=true;
        PopMenu.FormStyle:=fsStayOnTop;
        PopMenu.FormStyle:=fsNormal;
	PopMenu.speedButton8.Enabled:=true;
        end;

   if((owner.parent.text='Tables') and (copy(owner.parent.Parent.Text,1,3)='db.')) then
   	begin
        // klik na tabeli
        PopMenu.tbl.Text:=ownerTXT;
        PopMenu.db.Text:=header.Edit1.text;
        PopMenu.Left:=x+tables.left-10;
        PopMenu.Top:=y+10+tables.top;
        PopMenu.Visible:=true;
        PopMenu.FormStyle:=fsStayOnTop;
        PopMenu.FormStyle:=fsNormal;
	PopMenu.speedButton1.Enabled:=true;
	PopMenu.speedButton2.Enabled:=true;
	PopMenu.speedButton3.Enabled:=true;
	PopMenu.speedButton4.Enabled:=true;
	PopMenu.speedButton7.Enabled:=true;
        PopMenu.speedButton10.Enabled:=true;
        PopMenu.speedButton11.Enabled:=true;
        PopUpMenu2.Edit1.text:='tabela';
        PopUpMenu2.Edit2.text:=owner.Text;

        tmp:=owner.getFirstChild.getFirstChild;
        popmenu.memo1.clear;
        while tmp.AbsoluteIndex<=owner.getFirstChild.GetLastChild.AbsoluteIndex do
                begin
                popmenu.memo1.lines.add(tmp.Text);
                tmp:=owner.getFirstChild.GetNextChild(tmp);
                end;
        end;

   if((owner.text='Tables') and (copy(owner.Parent.Text,1,3)='db.')) then
   	begin
        //klik na item Talele
        PopMenu.tbl.Text:=ownerTXT;
        PopMenu.db.Text:=header.Edit1.text;
        PopMenu.Left:=x+tables.left-10;
        PopMenu.Top:=y+10+tables.top;
        PopMenu.Visible:=true;
        PopMenu.FormStyle:=fsStayOnTop;
        PopMenu.FormStyle:=fsNormal;

	PopMenu.speedButton5.Enabled:=false;
	PopMenu.speedButton6.Enabled:=true;
        end;


   if((copy(owner.Text,1,3)='db.')) then
   	begin
        // klik na wyborze bazy
        PopMenu.tbl.Text:=ownerTXT;
        PopMenu.db.Text:=header.Edit1.text;
        PopMenu.Left:=x+tables.left-10;
        PopMenu.Top:=y+10+tables.top;
        PopMenu.Visible:=true;
        PopMenu.FormStyle:=fsStayOnTop;
        PopMenu.FormStyle:=fsNormal;

	PopMenu.speedButton9.Enabled:=true;
        end;

   if((owner.parent.text='Columns') and (owner.Parent.parent.parent.Text='Tables')) then
   	begin
        // klik na kolumnie w tabeli
        PopMenu.col.text:=copy(ownerTXT,0,pos(',',ownerTXT)-1);
        PopMenu.tbl.Text:=owner.parent.parent.text;
        PopMenu.db.Text:=header.Edit1.text;
        PopMenu.Left:=x+tables.left-10;
        PopMenu.Top:=y+10+tables.top;
        PopMenu.Visible:=true;
        PopMenu.FormStyle:=fsStayOnTop;
        PopMenu.FormStyle:=fsNormal;

	PopMenu.speedButton5.Enabled:=true;
        end;


   if((owner.parent.text='Triggers') and (owner.Parent.parent.parent.Text='Tables')) then
   	begin
        // klik na kolumnie w tabeli
        PopMenu.col.text:=copy(ownerTXT,0,pos(',',ownerTXT)-1);
        PopMenu.tbl.Text:=owner.parent.parent.text;
        PopMenu.db.Text:=header.Edit1.text;
        PopMenu.Left:=x+tables.left-10;
        PopMenu.Top:=y+10+tables.top;
        PopMenu.Visible:=true;
        PopMenu.FormStyle:=fsStayOnTop;
        PopMenu.FormStyle:=fsNormal;

        PopMenu.speedButton10.Enabled:=true;
        PopUpMenu2.Edit1.text:='trigger';
        PopUpMenu2.Edit2.text:=owner.Text;
        end;


   if((owner.parent.text='Functions') and (copy(owner.parent.parent.Text,1,3)='db.')) then
   	begin
        // klik na funkcji
        PopMenu.col.text:=ownerTXT;
        //PopMenu.tbl.Text:=owner.parent.parent.text;
        PopMenu.db.Text:=header.Edit1.text;
        PopMenu.Left:=x+tables.left-10;
        PopMenu.Top:=y+10+tables.top;
        PopMenu.Visible:=true;
        PopMenu.FormStyle:=fsStayOnTop;
        PopMenu.FormStyle:=fsNormal;

        PopMenu.speedButton12.Enabled:=true;
        PopUpMenu2.Edit1.text:='trigger';
        PopUpMenu2.Edit2.text:=owner.Text;
        end;


   if((owner.parent.text='Triggers') and (copy(owner.parent.parent.parent.parent.Text,1,3)='db.')) then
   	begin
        // klik na triggerze
        PopMenu.col.text:=ownerTXT;
        //PopMenu.tbl.Text:=owner.parent.parent.text;
        PopMenu.db.Text:=header.Edit1.text;
        PopMenu.Left:=x+tables.left-10;
        PopMenu.Top:=y+10+tables.top;
        PopMenu.Visible:=true;
        PopMenu.FormStyle:=fsStayOnTop;
        PopMenu.FormStyle:=fsNormal;

        PopMenu.speedButton13.Enabled:=true;
        PopUpMenu2.Edit1.text:='trigger';
        PopUpMenu2.Edit2.text:=owner.Text;
        end;


   end;
except end;
end;



procedure Ttables.tabeleMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var
owner,tmp:ttreenode;
ownerTXT:string;
i:integer;
begin
if(popmenu.Visible=true) then popmenu.Visible:=false;
if(PopupMenu2.Visible=true) then PopupMenu2.Visible:=false;

if(ssLeft in Shift) then
	begin
        kolumny.Clear;
        //motyw przeciagania dancyh
        owner:=tabele.Items.GetNode(tabele.Selected.ItemId);
        if((owner.parent.text='Columns') and (owner.Parent.parent.parent.Text='Tables')) then
            begin
            // klik na kolumnie w tabeli
            //screen.Cursor:=crdrag;
            ownerTXT:=tabele.Items.GetNode(tabele.Selected.ItemId).Text;
            edit1.text:=copy(ownerTXT,0,pos(',',ownerTXT)-1);
            application.ProcessMessages;
            tabele.BeginDrag(true);
            end;
        if((owner.parent.text='Tables') and (copy(owner.parent.Parent.Text,1,3)='db.')) then
            begin
            // klik na tabeli
            //screen.Cursor:=crdrag;
            edit1.text:=owner.text;
            tabela.text:=owner.text;
            kolumny.Clear;

            tmp:=owner.getFirstChild;
            if tmp=nil then
                begin
                results.ReconnectFromTop();
	        tmp:=tabele.Items.AddChild(owner,'Columns');
                tmp.ImageIndex:=1;
		tmp.SelectedIndex:=1;
	        UpdateColums(tmp);
                tmp:=tabele.Items.AddChild(owner,'Keys');
                tmp.ImageIndex:=1;
		tmp.SelectedIndex:=1;
	        tmp:=tabele.Items.AddChild(owner,'Triggers');
                tmp.ImageIndex:=1;
	        tmp.SelectedIndex:=1;
	        tmp:=tabele.Items.AddChild(owner,'Indexes');
                tmp.ImageIndex:=1;
		tmp.SelectedIndex:=1;
                Application.ProcessMessages;
                end;
            tmp:=owner.getFirstChild.getFirstChild;
            try
            i:=0;
            kolumny.Clear;
            while ((tmp.AbsoluteIndex<=owner.getFirstChild.GetLastChild.AbsoluteIndex) and (i<1000)) do
                begin
                inc(i);
                kolumny.Items.add(strbefore(tmp.Text,','));
                tmp:=owner.getFirstChild.GetNextChild(tmp);
                end;
            except end;
            application.ProcessMessages;
            sel_tabela.Checked:=true;
            tabele.BeginDrag(true);
            end else sel_tabela.Checked:=false;
        end;

end;

procedure Ttables.SpeedButton2Click(Sender: TObject);
begin
main.visible:=true;
end;

procedure Ttables.SpeedButton3Click(Sender: TObject);
var
i,j:integer;
n:ttreenode;
begin
for i:=0 to tabele.Items.Count-1 do
        begin
        if(tabele.Items.Item[i].Selected=true) then n:=tabele.Items.Item[i];
        end;

while n.Parent<>nil do
        begin
        n:=n.parent;
        end;
n.Delete;
end;

procedure Ttables.tabeleMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
//screen.Cursor:=crdefault;
//edit1.text:='';
zapytanie.visible:=false;
end;

procedure Ttables.tabeleEndDrag(Sender, Target: TObject; X, Y: Integer);
begin
zapytanie.visible:=false;
end;

end.
