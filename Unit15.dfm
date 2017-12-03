object dump: Tdump
  Left = 346
  Top = 184
  BorderStyle = bsToolWindow
  Caption = 'Dump'
  ClientHeight = 245
  ClientWidth = 321
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
    Left = 16
    Top = 8
    Width = 136
    Height = 13
    Caption = 'Database/Table (all if empty)'
  end
  object Edit1: TEdit
    Left = 16
    Top = 24
    Width = 289
    Height = 21
    ReadOnly = True
    TabOrder = 0
  end
  object Button1: TButton
    Left = 16
    Top = 208
    Width = 75
    Height = 25
    Caption = 'Dump'
    TabOrder = 1
    OnClick = Button1Click
  end
  object CheckBox1: TCheckBox
    Left = 16
    Top = 56
    Width = 257
    Height = 17
    Caption = ' Add a '#39'DROP DATABASE'#39' before each create.'
    TabOrder = 2
  end
  object CheckBox2: TCheckBox
    Left = 16
    Top = 72
    Width = 241
    Height = 17
    Caption = 'Add a '#39'drop table'#39' before each create.'
    TabOrder = 3
  end
  object CheckBox3: TCheckBox
    Left = 16
    Top = 88
    Width = 193
    Height = 17
    Caption = 'Add locks around insert statements.'
    TabOrder = 4
  end
  object CheckBox4: TCheckBox
    Left = 16
    Top = 104
    Width = 209
    Height = 17
    Caption = 'Write additional information. / comments'
    TabOrder = 5
  end
  object CheckBox5: TCheckBox
    Left = 16
    Top = 120
    Width = 321
    Height = 17
    Caption = ' Allows utilization of the new, much faster INSERT syntax.'
    TabOrder = 6
  end
  object CheckBox6: TCheckBox
    Left = 16
    Top = 136
    Width = 273
    Height = 17
    Caption = 'Quote table and column names with backticks (`).'
    TabOrder = 7
  end
  object CheckBox7: TCheckBox
    Left = 16
    Top = 152
    Width = 289
    Height = 17
    Caption = 'Dump stored routines (functions and procedures).'
    TabOrder = 8
  end
  object CheckBox8: TCheckBox
    Left = 16
    Top = 168
    Width = 217
    Height = 17
    Caption = 'Don'#39't write table creation info.'
    TabOrder = 9
  end
  object CheckBox9: TCheckBox
    Left = 16
    Top = 184
    Width = 201
    Height = 17
    Caption = 'No row information.'
    TabOrder = 10
  end
  object ComboBox1: TComboBox
    Left = 304
    Top = 360
    Width = 289
    Height = 21
    ItemHeight = 13
    TabOrder = 11
  end
end
