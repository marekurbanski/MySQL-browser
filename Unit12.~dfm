object podpowiedzi: Tpodpowiedzi
  Left = 334
  Top = 186
  BorderStyle = bsToolWindow
  Caption = 'Manual'
  ClientHeight = 296
  ClientWidth = 278
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
  object res: TStringAlignGrid
    Left = 344
    Top = 296
    Width = 361
    Height = 185
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSizing, goColSizing]
    TabOrder = 0
    RowHeights = (
      24
      24
      24
      24
      24)
    PropCell = ()
    PropCol = ()
    PropRow = ()
    PropFixedCol = ()
    PropFixedRow = ()
  end
  object load_data: TButton
    Left = 144
    Top = 320
    Width = 75
    Height = 25
    Caption = 'load_data'
    TabOrder = 1
    Visible = False
    OnClick = load_dataClick
  end
  object Edit1: TEdit
    Left = 8
    Top = 8
    Width = 265
    Height = 21
    TabOrder = 2
    Text = 'Enter word here'
    OnChange = Edit1Change
  end
  object ListBox1: TListBox
    Left = 8
    Top = 40
    Width = 265
    Height = 229
    ItemHeight = 13
    TabOrder = 3
    OnClick = ListBox1Click
  end
  object PageControl1: TPageControl
    Left = 280
    Top = 32
    Width = 385
    Height = 257
    ActivePage = TabSheet1
    TabOrder = 4
    object TabSheet1: TTabSheet
      Caption = 'Syntax'
      object memo1: TRichEdit
        Left = 0
        Top = 0
        Width = 374
        Height = 193
        ScrollBars = ssBoth
        TabOrder = 0
        WordWrap = False
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Example'
      ImageIndex = 1
      object memo2: TRichEdit
        Left = 0
        Top = 0
        Width = 376
        Height = 225
        ScrollBars = ssBoth
        TabOrder = 0
        WordWrap = False
      end
    end
  end
  object Edit2: TEdit
    Left = 288
    Top = 8
    Width = 370
    Height = 21
    TabOrder = 5
    Text = 'Help link'
  end
  object Button1: TButton
    Left = 8
    Top = 272
    Width = 75
    Height = 17
    Caption = '< less'
    TabOrder = 6
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 200
    Top = 272
    Width = 75
    Height = 17
    Caption = 'more >'
    TabOrder = 7
    OnClick = Button2Click
  end
  object ressql: TCRDBGrid
    Left = 16
    Top = 344
    Width = 320
    Height = 120
    DataSource = main.data
    TabOrder = 8
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
end
