unit Unit5;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, SynEdit, SynMemo, SynHighlighterSQL,
  SynEditHighlighter, SynHighlighterPHP;

type
  Tmemo_show = class(TForm)
    RichEdit1: TSynMemo;
    SynPHPSyn1: TSynPHPSyn;
    SynSQLSyn1: TSynSQLSyn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  memo_show: Tmemo_show;

implementation

{$R *.DFM}

procedure Tmemo_show.FormClose(Sender: TObject; var Action: TCloseAction);
begin
action:=canone;
memo_show.Hide;
end;

end.
