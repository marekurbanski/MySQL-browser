object comparing_results: Tcomparing_results
  Left = 197
  Top = 118
  Width = 870
  Height = 520
  BorderStyle = bsSizeToolWin
  Caption = 'Comparing of two results'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 417
    Top = 0
    Width = 4
    Height = 420
    Cursor = crHSplit
  end
  object Splitter2: TSplitter
    Left = 0
    Top = 420
    Width = 854
    Height = 4
    Cursor = crVSplit
    Align = alBottom
  end
  object res1: TStringAlignGrid
    Left = 0
    Top = 0
    Width = 417
    Height = 420
    Align = alLeft
    DefaultRowHeight = 18
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = []
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goColMoving, goEditing]
    ParentFont = False
    TabOrder = 0
    OnMouseDown = res1MouseDown
    PropCell = ()
    PropCol = ()
    PropRow = ()
    PropFixedCol = ()
    PropFixedRow = ()
  end
  object res2: TStringAlignGrid
    Left = 421
    Top = 0
    Width = 433
    Height = 420
    Align = alClient
    DefaultRowHeight = 18
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = []
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goColMoving, goEditing]
    ParentFont = False
    TabOrder = 1
    OnDrawCell = res2DrawCell
    OnMouseDown = res2MouseDown
    OnMouseUp = res2MouseUp
    PropCell = ()
    PropCol = ()
    PropRow = ()
    PropFixedCol = ()
    PropFixedRow = ()
  end
  object Panel1: TPanel
    Left = 0
    Top = 424
    Width = 854
    Height = 58
    Align = alBottom
    Caption = 'Panel1'
    TabOrder = 2
    object Splitter3: TSplitter
      Left = 417
      Top = 1
      Width = 4
      Height = 56
      Cursor = crHSplit
    end
    object RichEdit1: TRichEdit
      Left = 1
      Top = 1
      Width = 416
      Height = 56
      Align = alLeft
      ScrollBars = ssBoth
      TabOrder = 0
      OnKeyUp = RichEdit1KeyUp
    end
    object RichEdit2: TRichEdit
      Left = 421
      Top = 1
      Width = 432
      Height = 56
      Align = alClient
      ScrollBars = ssBoth
      TabOrder = 1
      OnKeyUp = RichEdit2KeyUp
    end
  end
end
