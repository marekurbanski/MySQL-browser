object PopupMenu2: TPopupMenu2
  Left = 315
  Top = 179
  BorderIcons = []
  BorderStyle = bsToolWindow
  Caption = 'Script'
  ClientHeight = 97
  ClientWidth = 139
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object SpeedButton1: TSpeedButton
    Left = 0
    Top = 8
    Width = 145
    Height = 17
    Caption = 'CREATE in MySQL'
    Flat = True
    OnClick = SpeedButton1Click
  end
  object SpeedButton3: TSpeedButton
    Left = -4
    Top = 40
    Width = 145
    Height = 17
    Caption = 'INSERT in SQL'
    Flat = True
    OnClick = SpeedButton3Click
  end
  object SpeedButton2: TSpeedButton
    Left = -3
    Top = 25
    Width = 145
    Height = 17
    Caption = 'CREATE in MSSQL'
    Flat = True
    OnClick = SpeedButton2Click
  end
  object SpeedButton4: TSpeedButton
    Left = -4
    Top = 57
    Width = 145
    Height = 17
    Caption = 'INSERT in PHP'
    Flat = True
    OnClick = SpeedButton4Click
  end
  object SpeedButton5: TSpeedButton
    Left = -4
    Top = 74
    Width = 145
    Height = 17
    Caption = 'UPDATE in PHP'
    Flat = True
    OnClick = SpeedButton5Click
  end
  object Edit1: TEdit
    Left = 8
    Top = 136
    Width = 121
    Height = 21
    TabOrder = 0
    Text = 'Edit1'
  end
  object Edit2: TEdit
    Left = 8
    Top = 160
    Width = 121
    Height = 21
    TabOrder = 1
    Text = 'Edit2'
  end
end
