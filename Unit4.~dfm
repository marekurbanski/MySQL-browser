object results: Tresults
  Left = 295
  Top = 199
  Width = 681
  Height = 490
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSizeToolWin
  Caption = 'Query and Results Window'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 665
    Height = 433
    Align = alClient
    TabOrder = 0
    OnChange = PageControl1Change
  end
  object res: TStringGrid
    Left = 0
    Top = 0
    Width = 665
    Height = 433
    Align = alClient
    ColCount = 2
    FixedCols = 0
    FixedRows = 0
    GridLineWidth = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSelect]
    TabOrder = 3
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 433
    Width = 665
    Height = 19
    Panels = <
      item
        Width = 100
      end
      item
        Width = 100
      end
      item
        Width = 100
      end
      item
        Width = 50
      end>
    SimplePanel = False
  end
  object refresh: TButton
    Left = 160
    Top = 16
    Width = 75
    Height = 25
    Caption = 'refresh'
    TabOrder = 1
    Visible = False
    OnClick = refreshClick
  end
  object sqlstyle: TSynSQLSyn
    CommentAttri.Foreground = clSilver
    KeyAttri.Foreground = clBlue
    KeyAttri.Style = []
    NumberAttri.Foreground = clMaroon
    StringAttri.Foreground = clGray
    TableNameAttri.Foreground = clRed
    Left = 24
    Top = 16
  end
  object podpowiedzi: TSynCompletionProposal
    Options = [scoLimitToMatchedText, scoUseInsertList, scoUsePrettyText, scoEndCharCompletion, scoCompleteWithTab, scoCompleteWithEnter]
    EndOfTokenChr = '()[]. '
    TriggerChars = '.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clBtnText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = [fsBold]
    Columns = <>
    ShortCut = 16416
    Left = 56
    Top = 16
  end
  object korekta: TSynAutoCorrect
    Options = [ascoIgnoreCase]
    Left = 88
    Top = 16
  end
  object PopupMenu1: TPopupMenu
    Left = 240
    Top = 16
    object Execute1: TMenuItem
      Caption = 'Execute'
      OnClick = Execute1Click
    end
    object Copy1: TMenuItem
      Caption = 'Copy'
      OnClick = Copy1Click
    end
    object Paste1: TMenuItem
      Caption = 'Paste'
      OnClick = Paste1Click
    end
  end
  object ApplicationEvents1: TApplicationEvents
    OnActivate = ApplicationEvents1Activate
    Left = 280
    Top = 16
  end
  object DataSource1: TDataSource
    Left = 328
    Top = 16
  end
  object systeminfo: TscSystemInfo
    AppVersion.OfficeVersion = 12
    AppVersion.DelphiVersion = 5
    Left = 368
    Top = 16
  end
end
