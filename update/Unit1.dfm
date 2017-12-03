object fupdate: Tfupdate
  Left = 192
  Top = 124
  BorderStyle = bsToolWindow
  Caption = 'Update'
  ClientHeight = 118
  ClientWidth = 291
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 80
    Top = 16
    Width = 145
    Height = 16
    Caption = 'New version available,'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 16
    Top = 40
    Width = 255
    Height = 16
    Caption = 'Do you want to download new version ?'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Button1: TButton
    Left = 344
    Top = 24
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 0
    Visible = False
    OnClick = Button1Click
  end
  object www: TWebBrowser
    Left = 344
    Top = 56
    Width = 161
    Height = 73
    TabOrder = 1
    OnDocumentComplete = wwwDocumentComplete
    ControlData = {
      4C000000A41000008B0700000000000000000000000000000000000000000000
      000000004C000000000000000000000001000000E0D057007335CF11AE690800
      2B2E126208000000000000004C0000000114020000000000C000000000000046
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000000100000000000000000000000000000000000000}
  end
  object Memo1: TMemo
    Left = 344
    Top = 136
    Width = 161
    Height = 73
    Lines.Strings = (
      'Memo1')
    TabOrder = 2
    Visible = False
  end
  object Button2: TButton
    Left = 64
    Top = 80
    Width = 75
    Height = 25
    Caption = 'YES'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 152
    Top = 80
    Width = 75
    Height = 25
    Caption = 'NO'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    OnClick = Button3Click
  end
  object Timer1: TTimer
    Interval = 10
    OnTimer = Timer1Timer
    Left = 440
    Top = 24
  end
end
