object table_diagnostics: Ttable_diagnostics
  Left = 290
  Top = 215
  BorderStyle = bsToolWindow
  Caption = 'Table diagnostics'
  ClientHeight = 232
  ClientWidth = 561
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
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 129
    Height = 13
    Caption = 'Select tables to diagnostics'
  end
  object Label2: TLabel
    Left = 256
    Top = 88
    Width = 23
    Height = 13
    Caption = 'Logs'
  end
  object Bevel1: TBevel
    Left = 248
    Top = 16
    Width = 305
    Height = 209
    Shape = bsFrame
  end
  object Label3: TLabel
    Left = 264
    Top = 8
    Width = 121
    Height = 13
    Caption = 'Select kind of diagnostics'
  end
  object start: TButton
    Left = 160
    Top = -8
    Width = 75
    Height = 25
    Caption = 'start'
    TabOrder = 0
    Visible = False
    OnClick = startClick
  end
  object tabele: TCheckListBox
    Left = 8
    Top = 24
    Width = 233
    Height = 201
    ItemHeight = 13
    TabOrder = 1
  end
  object Button1: TButton
    Left = 256
    Top = 24
    Width = 137
    Height = 25
    Caption = 'Optimize tables'
    TabOrder = 2
    OnClick = Button1Click
  end
  object res: TMemo
    Left = 256
    Top = 104
    Width = 281
    Height = 113
    ScrollBars = ssBoth
    TabOrder = 3
    WordWrap = False
  end
  object Button2: TButton
    Left = 400
    Top = 24
    Width = 137
    Height = 25
    Caption = 'Repair tables'
    TabOrder = 4
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 256
    Top = 56
    Width = 137
    Height = 25
    Caption = 'Check tables'
    TabOrder = 5
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 400
    Top = 56
    Width = 137
    Height = 25
    Caption = 'Analyze tables'
    TabOrder = 6
    OnClick = Button4Click
  end
end
