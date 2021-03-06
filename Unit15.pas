unit Unit15;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, shellapi;

type
  Tdump = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    Button1: TButton;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    CheckBox8: TCheckBox;
    CheckBox9: TCheckBox;
    ComboBox1: TComboBox;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dump: Tdump;

implementation

uses Unit3, Unit1;

{$R *.DFM}

procedure Exec(ExecuteFile,ParamString:string);
var
   SEInfo: TShellExecuteInfo;
   ExitCode: DWORD;
   StartInString: string;
begin
   FillChar(SEInfo, SizeOf(SEInfo), 0) ;
   SEInfo.cbSize := SizeOf(TShellExecuteInfo) ;
   with SEInfo do begin
     fMask := SEE_MASK_NOCLOSEPROCESS;
     Wnd := Application.Handle;
     lpFile := PChar(ExecuteFile) ;
{
ParamString can contain the
application parameters.
}
// lpParameters := PChar(ParamString) ;
{
StartInString specifies the
name of the working directory.
If ommited, the current directory is used.
}
// lpDirectory := PChar(StartInString) ;
     nShow := SW_SHOWNORMAL;
   end;
   if ShellExecuteEx(@SEInfo) then begin
     repeat
       Application.ProcessMessages;
       GetExitCodeProcess(SEInfo.hProcess, ExitCode) ;
     until (ExitCode <> STILL_ACTIVE) or
Application.Terminated;
     ShowMessage('Done') ;
   end
   else ShowMessage('Error executing program') ;
end; 


procedure Tdump.Button1Click(Sender: TObject);
var
p:string;
begin
if(header.SaveDialog1.execute) then
        begin
        p:='-h '+main.combobox1.text+' -u '+main.edit1.text;
        if(main.edit2.text<>'') then p:=p+' -p'+main.edit2.text;
        if(checkbox1.checked) then p:=p+' --add-drop-database';
        if(checkbox2.checked) then p:=p+' --add-drop-table';
        if(checkbox3.checked) then p:=p+' --add-locks';
        if(checkbox4.checked) then p:=p+' -i';
        if(checkbox5.checked) then p:=p+' -e';
        if(checkbox6.checked) then p:=p+' -Q';
        if(checkbox7.checked) then p:=p+' -R';
        if(checkbox8.checked) then p:=p+' -t';
        if(checkbox9.checked) then p:=p+' -d';

        if(checkbox2.checked) then p:=p+' --add-drop-table';
        if(checkbox2.checked) then p:=p+' --add-drop-table';
        if(checkbox2.checked) then p:=p+' --add-drop-table';
        if(checkbox2.checked) then p:=p+' --add-drop-table';

        p:=p+' -P '+main.edit3.text;
        p:=p+' -r "'+header.SaveDialog1.FileName+'.2sql"';
        p:=p+' -f '+edit1.text;
        //showmessage(p);
        ShellExecute(Handle,'open',pchar(ExtractFilePath( Application.ExeName )+'mysqldump'),pchar(p),nil,SW_NORMAL);
        //Exec(ExtractFilePath( Application.ExeName )+'mysqldump ',p);
        showmessage('Database dumped');
        end;
dump.Visible:=false;
end;

procedure Tdump.FormClose(Sender: TObject; var Action: TCloseAction);
begin
action:=canone;
dump.visible:=false;
end;

end.
