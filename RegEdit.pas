unit RegEdit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,Registry;

type
  TRegEdit = class(TComponent)
  private
     TRoot:string;
     TKey:string;
     TPath:string;
     TEncode:boolean;
     function code(val:string):string;
     function decode(val:string):string;
    { Private declarations }
  protected
    { Protected declarations }
  public
    { Public declarations }
   constructor Create(AOwner : TComponent); override;
   destructor Destroy; override;
  published
    { Published declarations }
    property Root :string read TRoot write TRoot;
    property Path:string read TPath write TPath;
    property Key:string read TKey write TKey;
    property Encode:boolean read TEncode write TEncode stored False;
   function WriteValue(StringValue:string):string;
   function GetValue():string;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('www2.pl', [TRegEdit]);
end;

constructor TRegEdit.Create(AOwner : TComponent);
begin
  inherited Create(AOwner);
  { podczas wywo³ywania konstruktora dla w³aœciwoœci przypisz domyœlny tekst }
	TPath:='Software\www2.pl';
   TRoot:='HKEY_LOCAL_MACHINE';
end;

destructor TRegEdit.Destroy;
begin
  inherited;
end;

function TRegEdit.code(val:string):string;
var
int,i:integer;
s:string;
begin
s:='';
for i:=1 to strlen(pchar(val)) do
	begin
   int:=ord(val[i])*2+1;
   s:=s+chr(int);
   end;
result:=s;
end;

function TRegEdit.decode(val:string):string;
var
int,i:integer;
s:string;
begin
s:='';
for i:=1 to strlen(pchar(val)) do
	begin
   int:=(ord(val[i])-1)div 2;
   s:=s+chr(int);
   end;
result:=s;
end;

function TRegEdit.WriteValue(StringValue:string):string;
var
r:tregistry;
begin
if(TEncode=true) then StringValue:=code(StringValue);
r:=tregistry.Create;
if(TRoot='HKEY_LOCAL_MACHINE') then r.RootKey:=HKEY_LOCAL_MACHINE;
if(TRoot='HKEY_CLASSES_ROOT') then r.RootKey:=HKEY_CLASSES_ROOT;
if(TRoot='HKEY_CURRENT_USER') then r.RootKey:=HKEY_CURRENT_USER;
if(TRoot='HKEY_USERS') then r.RootKey:=HKEY_USERS;
if(TRoot='HKEY_LOCAL_MACHINE') then r.RootKey:=HKEY_LOCAL_MACHINE;

{if(TRoot='HKEY_LOCAL_MACHINE') then showmessage('HKEY_LOCAL_MACHINE');
if(TRoot='HKEY_CLASSES_ROOT') then showmessage('HKEY_CLASSES_ROOT');
if(TRoot='HKEY_CURRENT_USER') then showmessage('HKEY_CURRENT_USER');
if(TRoot='HKEY_USERS') then showmessage('HKEY_USERS');
if(TRoot='HKEY_LOCAL_MACHINE') then showmessage('HKEY_LOCAL_MACHINE');
showmessage('->'+TRoot);
}
r.OpenKey(TPath,true);
r.WriteString(TKey,StringValue);
r.Destroy;
result:=StringValue;
end;

function TRegEdit.GetValue():string;
var
wartosc:string;
r:tregistry;
begin
r:=tregistry.Create;
if(TRoot='HKEY_LOCAL_MACHINE') then r.RootKey:=HKEY_LOCAL_MACHINE;
if(TRoot='HKEY_CLASSES_ROOT') then r.RootKey:=HKEY_CLASSES_ROOT;
if(TRoot='HKEY_CURRENT_USER') then r.RootKey:=HKEY_CURRENT_USER;
if(TRoot='HKEY_USERS') then r.RootKey:=HKEY_USERS;
if(TRoot='HKEY_LOCAL_MACHINE') then r.RootKey:=HKEY_LOCAL_MACHINE;
{
if(TRoot='HKEY_LOCAL_MACHINE') then showmessage('HKEY_LOCAL_MACHINE');
if(TRoot='HKEY_CLASSES_ROOT') then showmessage('HKEY_CLASSES_ROOT');
if(TRoot='HKEY_CURRENT_USER') then showmessage('HKEY_CURRENT_USER');
if(TRoot='HKEY_USERS') then showmessage('HKEY_USERS');
if(TRoot='HKEY_LOCAL_MACHINE') then showmessage('HKEY_LOCAL_MACHINE');
showmessage('->'+TRoot);
}
r.OpenKey(TPath,true);
wartosc:=r.ReadString(TKey);
r.Destroy;
if(TEncode=true) then wartosc:=decode(wartosc);
result:=wartosc;
end;

end.
 