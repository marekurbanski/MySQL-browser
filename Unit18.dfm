object query: Tquery
  Left = 339
  Top = 278
  Width = 872
  Height = 492
  Caption = 'query'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 456
    Top = 280
    Width = 377
    Height = 161
    DataSource = main.data
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object sql_query: TMemo
    Left = 472
    Top = 24
    Width = 361
    Height = 113
    ScrollBars = ssBoth
    TabOrder = 1
    WordWrap = False
  end
  object get_server_on_top: TButton
    Left = 8
    Top = 8
    Width = 137
    Height = 25
    Caption = 'get_server_on_top'
    TabOrder = 2
  end
  object Open: TButton
    Left = 8
    Top = 80
    Width = 75
    Height = 25
    Caption = 'Open'
    TabOrder = 3
    OnClick = OpenClick
  end
  object Execute: TButton
    Left = 8
    Top = 48
    Width = 75
    Height = 25
    Caption = 'Execute'
    TabOrder = 4
    OnClick = ExecuteClick
  end
  object hostname: TEdit
    Left = 272
    Top = 24
    Width = 185
    Height = 21
    TabOrder = 5
    Text = 'hostname'
  end
  object username: TEdit
    Left = 272
    Top = 48
    Width = 185
    Height = 21
    TabOrder = 6
    Text = 'username'
  end
  object password: TEdit
    Left = 272
    Top = 72
    Width = 177
    Height = 21
    TabOrder = 7
    Text = 'password'
  end
  object port: TEdit
    Left = 272
    Top = 96
    Width = 185
    Height = 21
    TabOrder = 8
    Text = 'port'
  end
  object database: TEdit
    Left = 272
    Top = 120
    Width = 185
    Height = 21
    TabOrder = 9
    Text = 'database'
  end
  object res: TStringGrid
    Left = 16
    Top = 128
    Width = 809
    Height = 120
    TabOrder = 10
  end
  object copy_to_grid: TButton
    Left = 8
    Top = 112
    Width = 75
    Height = 25
    Caption = 'copy_to_grid'
    TabOrder = 11
    OnClick = copy_to_gridClick
  end
  object res_txt: TMemo
    Left = 464
    Top = 152
    Width = 369
    Height = 89
    Lines.Strings = (
      'res_txt')
    TabOrder = 12
    WordWrap = False
  end
end
