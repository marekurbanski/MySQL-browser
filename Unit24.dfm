object zapytanie: Tzapytanie
  Left = 512
  Top = 215
  BorderStyle = bsNone
  Caption = 'zapytanie'
  ClientHeight = 22
  ClientWidth = 431
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = -1
    Top = 0
    Width = 65
    Height = 22
    Caption = 'SELECT'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial Black'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnDragDrop = Panel1DragDrop
    OnDragOver = Panel1DragOver
  end
  object Panel2: TPanel
    Left = 64
    Top = 0
    Width = 65
    Height = 22
    Caption = 'FROM'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial Black'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnDragDrop = Panel2DragDrop
    OnDragOver = Panel2DragOver
  end
  object Panel3: TPanel
    Left = 129
    Top = 0
    Width = 65
    Height = 22
    Caption = 'WHERE'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial Black'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnDragDrop = Panel3DragDrop
    OnDragOver = Panel3DragOver
  end
  object Panel4: TPanel
    Left = 194
    Top = 0
    Width = 79
    Height = 22
    Caption = 'GROUP BY'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial Black'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnDragDrop = Panel4DragDrop
    OnDragOver = Panel4DragOver
  end
  object Panel5: TPanel
    Left = 273
    Top = 0
    Width = 79
    Height = 22
    Caption = 'HAVING'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial Black'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnDragDrop = Panel5DragDrop
    OnDragOver = Panel5DragOver
  end
  object Panel6: TPanel
    Left = 352
    Top = 0
    Width = 79
    Height = 22
    Caption = 'ORDER BY'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial Black'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnDragDrop = Panel6DragDrop
    OnDragOver = Panel6DragOver
  end
end
