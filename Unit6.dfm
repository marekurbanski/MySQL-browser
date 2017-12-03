object PopMenu: TPopMenu
  Left = 200
  Top = 275
  BorderIcons = []
  BorderStyle = bsToolWindow
  Caption = 'Menu'
  ClientHeight = 231
  ClientWidth = 120
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnMouseMove = FormMouseMove
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object SpeedButton11: TSpeedButton
    Left = -8
    Top = 88
    Width = 130
    Height = 17
    Caption = 'Modify structure'
    Flat = True
    OnClick = SpeedButton11Click
    OnMouseMove = SpeedButton11MouseMove
  end
  object Bevel1: TBevel
    Left = -8
    Top = 80
    Width = 130
    Height = 10
    Shape = bsTopLine
    Visible = False
  end
  object SpeedButton1: TSpeedButton
    Left = -8
    Top = 8
    Width = 130
    Height = 17
    Caption = 'Query'
    Flat = True
    OnClick = SpeedButton1Click
    OnMouseMove = FormMouseMove
  end
  object SpeedButton2: TSpeedButton
    Left = -8
    Top = 24
    Width = 130
    Height = 17
    Caption = 'Show all records'
    Flat = True
    OnClick = SpeedButton2Click
    OnMouseMove = FormMouseMove
  end
  object SpeedButton3: TSpeedButton
    Left = -8
    Top = 40
    Width = 130
    Height = 17
    Caption = 'Show top 100 records'
    Flat = True
    OnClick = SpeedButton3Click
    OnMouseMove = FormMouseMove
  end
  object SpeedButton4: TSpeedButton
    Left = -8
    Top = 56
    Width = 130
    Height = 17
    Caption = 'Show columns'
    Flat = True
    OnClick = SpeedButton4Click
    OnMouseMove = FormMouseMove
  end
  object SpeedButton5: TSpeedButton
    Left = -8
    Top = 104
    Width = 130
    Height = 17
    Caption = 'Delete column'
    Flat = True
    OnClick = SpeedButton5Click
    OnMouseMove = FormMouseMove
  end
  object SpeedButton6: TSpeedButton
    Left = -8
    Top = 120
    Width = 130
    Height = 17
    Caption = 'Create table'
    Flat = True
    OnClick = SpeedButton6Click
    OnMouseMove = FormMouseMove
  end
  object SpeedButton7: TSpeedButton
    Left = -8
    Top = 136
    Width = 130
    Height = 17
    Caption = 'Delete table'
    Flat = True
    OnClick = SpeedButton7Click
    OnMouseMove = FormMouseMove
  end
  object SpeedButton8: TSpeedButton
    Left = -8
    Top = 152
    Width = 130
    Height = 17
    Caption = 'Create database'
    Flat = True
    OnClick = SpeedButton8Click
    OnMouseMove = FormMouseMove
  end
  object SpeedButton9: TSpeedButton
    Left = -8
    Top = 168
    Width = 130
    Height = 17
    Caption = 'Dump database'
    Flat = True
    OnClick = SpeedButton9Click
    OnMouseMove = FormMouseMove
  end
  object SpeedButton10: TSpeedButton
    Left = -6
    Top = 184
    Width = 130
    Height = 17
    Caption = 'Script table as  =>'
    Flat = True
    OnClick = SpeedButton10Click
    OnMouseMove = FormMouseMove
  end
  object SpeedButton12: TSpeedButton
    Left = -12
    Top = 200
    Width = 141
    Height = 17
    Caption = 'Edit function'
    Flat = True
    OnClick = SpeedButton12Click
    OnMouseMove = FormMouseMove
  end
  object SpeedButton13: TSpeedButton
    Left = -12
    Top = 216
    Width = 141
    Height = 17
    Caption = 'Edit trigger'
    Flat = True
    OnClick = SpeedButton13Click
    OnMouseMove = FormMouseMove
  end
  object tbl: TEdit
    Left = 0
    Top = 288
    Width = 121
    Height = 21
    TabOrder = 0
    Text = 'tbl'
  end
  object db: TEdit
    Left = 0
    Top = 312
    Width = 121
    Height = 21
    TabOrder = 1
    Text = 'db'
  end
  object col: TEdit
    Left = 0
    Top = 264
    Width = 121
    Height = 21
    TabOrder = 2
    Text = 'col'
  end
  object Memo1: TMemo
    Left = 208
    Top = 16
    Width = 185
    Height = 193
    Lines.Strings = (
      'Memo1')
    TabOrder = 3
  end
end
