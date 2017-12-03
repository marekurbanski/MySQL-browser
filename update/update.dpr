program update;

uses
  Forms,
  Unit1 in 'Unit1.pas' {fupdate};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(Tfupdate, fupdate);
  Application.Run;
end.
