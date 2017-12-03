object update_box: Tupdate_box
  Left = 457
  Top = 230
  Width = 318
  Height = 165
  Caption = 'Update check'
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
  object Version: TLabel
    Left = 160
    Top = 8
    Width = 35
    Height = 13
    Caption = 'Version'
  end
  object Label1: TLabel
    Left = 88
    Top = 8
    Width = 67
    Height = 13
    Caption = 'Actual version'
  end
  object Label2: TLabel
    Left = 80
    Top = 40
    Width = 120
    Height = 13
    Caption = 'Checking for new version'
  end
  object Label3: TLabel
    Left = 8
    Top = 64
    Width = 289
    Height = 13
    Cursor = crHandPoint
    Alignment = taCenter
    AutoSize = False
  end
  object start: TButton
    Left = 216
    Top = 8
    Width = 75
    Height = 25
    Caption = 'start'
    TabOrder = 0
    Visible = False
    OnClick = startClick
  end
  object ProgressBar1: TProgressBar
    Left = 8
    Top = 96
    Width = 289
    Height = 17
    Min = 0
    Max = 100
    Smooth = True
    Step = 1
    TabOrder = 1
  end
  object silent: TCheckBox
    Left = 104
    Top = 64
    Width = 97
    Height = 17
    Caption = 'silent'
    TabOrder = 2
    Visible = False
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 100
    OnTimer = Timer1Timer
    Left = 8
    Top = 8
  end
  object SQL1: TmySQLClient
    Hostname = 'localhost'
    Port = 3306
    Capabilities = [_CLIENT_LONG_PASSWORD, _CLIENT_CONNECT_WITH_DB]
    Threaded = False
    ConnectedTimeOutInterval = 3000
    BlockOnClose = True
    Left = 8
    Top = 32
  end
  object goonstart: TTimer
    Enabled = False
    OnTimer = goonstartTimer
    Left = 56
    Top = 64
  end
end
