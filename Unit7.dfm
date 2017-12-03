object DBPopMenu: TDBPopMenu
  Left = 457
  Top = 201
  BorderIcons = []
  BorderStyle = bsToolWindow
  Caption = 'DBPopMenu'
  ClientHeight = 274
  ClientWidth = 136
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object SpeedButton6: TSpeedButton
    Left = 184
    Top = 96
    Width = 145
    Height = 17
    Caption = 'Edit MEMO'
    Flat = True
    OnClick = SpeedButton6Click
  end
  object SpeedButton4: TSpeedButton
    Left = -8
    Top = 80
    Width = 145
    Height = 17
    Caption = 'Set NULL'
    Flat = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object SpeedButton2: TSpeedButton
    Left = 0
    Top = 144
    Width = 137
    Height = 17
    Caption = 'Filter'
    Flat = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    OnClick = SpeedButton2Click
  end
  object Bevel1: TBevel
    Left = -8
    Top = 104
    Width = 145
    Height = 9
    Shape = bsBottomLine
  end
  object SpeedButton5: TSpeedButton
    Left = -8
    Top = 64
    Width = 145
    Height = 17
    Caption = 'Copy fied to clipboard'
    Flat = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    OnClick = SpeedButton5Click
  end
  object SpeedButton3: TSpeedButton
    Left = -8
    Top = 48
    Width = 145
    Height = 17
    Caption = 'Export columt to MS Excel'
    Flat = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    OnClick = SpeedButton3Click
  end
  object SpeedButton1: TSpeedButton
    Left = -8
    Top = 32
    Width = 145
    Height = 17
    Caption = 'Export column to clipboard'
    Flat = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    OnClick = SpeedButton1Click
  end
  object SpeedButton8: TSpeedButton
    Left = -8
    Top = 16
    Width = 145
    Height = 17
    Caption = 'Adjust columns'
    Flat = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    OnClick = SpeedButton8Click
  end
  object SpeedButton7: TSpeedButton
    Left = -8
    Top = 0
    Width = 145
    Height = 17
    Caption = 'Hide column'
    Flat = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    OnClick = SpeedButton7Click
  end
  object Bevel2: TBevel
    Left = -8
    Top = 163
    Width = 145
    Height = 9
    Shape = bsBottomLine
  end
  object SpeedButton9: TSpeedButton
    Left = -1
    Top = 200
    Width = 137
    Height = 73
    Caption = 'Compare with this result:'
    Flat = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    OnClick = SpeedButton9Click
  end
  object Edit1: TEdit
    Left = 16
    Top = 280
    Width = 121
    Height = 21
    TabOrder = 0
    Text = 'Edit1'
  end
  object Edit2: TEdit
    Left = 16
    Top = 304
    Width = 121
    Height = 21
    TabOrder = 1
    Text = 'Edit2'
  end
  object ComboBox2: TComboBox
    Left = 0
    Top = 120
    Width = 57
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ItemHeight = 13
    ParentFont = False
    TabOrder = 2
    Text = '='
    Items.Strings = (
      '='
      '>'
      '<'
      '<>'
      'LIKE')
  end
  object field: TEdit
    Left = 56
    Top = 120
    Width = 81
    Height = 21
    TabOrder = 3
    Text = 'field'
  end
  object memo_temp: TMemo
    Left = 224
    Top = 40
    Width = 113
    Height = 41
    Lines.Strings = (
      'memo_temp')
    TabOrder = 4
    Visible = False
    WordWrap = False
  end
  object res_tmp: TStringGrid
    Left = 232
    Top = 120
    Width = 320
    Height = 120
    TabOrder = 5
    Visible = False
    RowHeights = (
      24
      24
      24
      24
      24)
  end
  object res_list: TComboBox
    Left = 0
    Top = 177
    Width = 137
    Height = 21
    DropDownCount = 2
    ItemHeight = 13
    ParentShowHint = False
    ShowHint = True
    Sorted = True
    TabOrder = 6
    Text = 'Select result'
  end
end
