object Settings: TSettings
  Left = 410
  Top = 214
  BorderStyle = bsToolWindow
  Caption = 'Settings'
  ClientHeight = 312
  ClientWidth = 360
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
  object Bevel1: TBevel
    Left = 8
    Top = 8
    Width = 345
    Height = 297
    Shape = bsFrame
  end
  object Label2: TLabel
    Left = 16
    Top = 192
    Width = 70
    Height = 13
    Caption = 'Query font size'
  end
  object Label3: TLabel
    Left = 16
    Top = 216
    Width = 72
    Height = 13
    Caption = 'Result font size'
  end
  object updates: TCheckBox
    Left = 16
    Top = 96
    Width = 177
    Height = 17
    Caption = 'Check for updates on startup'
    TabOrder = 0
  end
  object Button1: TButton
    Left = 248
    Top = 256
    Width = 89
    Height = 25
    Caption = 'Save settings'
    TabOrder = 1
    OnClick = Button1Click
  end
  object load_settings: TButton
    Left = 216
    Top = 8
    Width = 89
    Height = 25
    Caption = 'load_settings'
    TabOrder = 2
    Visible = False
    OnClick = load_settingsClick
  end
  object query_names: TCheckBox
    Left = 16
    Top = 16
    Width = 193
    Height = 17
    Caption = 'Ask for query name before creating'
    Checked = True
    State = cbChecked
    TabOrder = 3
  end
  object execute: TCheckBox
    Left = 16
    Top = 48
    Width = 201
    Height = 17
    Caption = 'Auto execute query after New Query'
    TabOrder = 4
  end
  object logs: TCheckBox
    Left = 16
    Top = 64
    Width = 193
    Height = 17
    Caption = 'Save logs to file (logs.txt)'
    TabOrder = 5
  end
  object increment_logs: TCheckBox
    Left = 16
    Top = 80
    Width = 257
    Height = 17
    Caption = 'Increment logs file (should be manually deleted)'
    TabOrder = 6
  end
  object fontsize: TComboBox
    Left = 128
    Top = 184
    Width = 49
    Height = 21
    ItemHeight = 13
    TabOrder = 7
    Text = '12'
    Items.Strings = (
      '6'
      '7'
      '8'
      '9'
      '10'
      '11'
      '12'
      '13'
      '14'
      '15'
      '16'
      '17'
      '18'
      '19'
      '20')
  end
  object res_font_size: TComboBox
    Left = 128
    Top = 208
    Width = 49
    Height = 21
    ItemHeight = 13
    TabOrder = 8
    Text = '12'
    Items.Strings = (
      '6'
      '7'
      '8'
      '9'
      '10'
      '11'
      '12'
      '13'
      '14'
      '15'
      '16'
      '17'
      '18'
      '19'
      '20')
  end
  object windows_positions: TCheckBox
    Left = 16
    Top = 32
    Width = 169
    Height = 17
    Caption = 'Save windows positions'
    Checked = True
    State = cbChecked
    TabOrder = 9
  end
  object ctips: TCheckBox
    Left = 16
    Top = 112
    Width = 137
    Height = 17
    Caption = 'Show tips on startup'
    TabOrder = 10
  end
  object askforsave: TCheckBox
    Left = 16
    Top = 128
    Width = 185
    Height = 17
    Caption = 'Ask for saving queries on close'
    Checked = True
    State = cbChecked
    TabOrder = 11
  end
  object multiline: TCheckBox
    Left = 16
    Top = 144
    Width = 185
    Height = 17
    Caption = 'Multiline tabs in result windows'
    TabOrder = 12
  end
  object debug: TCheckBox
    Left = 16
    Top = 160
    Width = 193
    Height = 17
    Caption = 'Save logs to file for debugging'
    TabOrder = 13
  end
end
