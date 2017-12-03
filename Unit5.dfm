object memo_show: Tmemo_show
  Left = 260
  Top = 187
  Width = 562
  Height = 284
  BorderStyle = bsSizeToolWin
  Caption = 'Clipboard'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object RichEdit1: TSynMemo
    Left = 0
    Top = 0
    Width = 546
    Height = 248
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    TabOrder = 0
    Gutter.Font.Charset = DEFAULT_CHARSET
    Gutter.Font.Color = clWindowText
    Gutter.Font.Height = -11
    Gutter.Font.Name = 'Courier New'
    Gutter.Font.Style = []
    Highlighter = SynSQLSyn1
    Lines.Strings = (
      'RichEdit1')
  end
  object SynPHPSyn1: TSynPHPSyn
    CommentAttri.Foreground = clGray
    IdentifierAttri.Foreground = clRed
    KeyAttri.Foreground = clRed
    NumberAttri.Foreground = clOlive
    SpaceAttri.Foreground = clGreen
    StringAttri.Foreground = clOlive
    SymbolAttri.Foreground = clGreen
    VariableAttri.Foreground = clNavy
    Left = 136
    Top = 16
  end
  object SynSQLSyn1: TSynSQLSyn
    CommentAttri.Foreground = clGray
    ConditionalCommentAttri.Foreground = clRed
    DataTypeAttri.Foreground = clRed
    DefaultPackageAttri.Foreground = clRed
    DelimitedIdentifierAttri.Foreground = clRed
    ExceptionAttri.Foreground = clRed
    FunctionAttri.Foreground = clRed
    IdentifierAttri.Foreground = clRed
    NumberAttri.Foreground = clOlive
    PLSQLAttri.Foreground = clRed
    SQLPlusAttri.Foreground = clRed
    StringAttri.Foreground = clTeal
    SymbolAttri.Foreground = clTeal
    TableNameAttri.Foreground = clNavy
    VariableAttri.Foreground = clRed
    Left = 176
    Top = 16
  end
end
