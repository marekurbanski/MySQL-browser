object Users: TUsers
  Left = 318
  Top = 183
  BorderStyle = bsToolWindow
  Caption = 'Users'
  ClientHeight = 332
  ClientWidth = 710
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
    Left = 16
    Top = 368
    Width = 545
    Height = 305
    Shape = bsFrame
  end
  object Label1: TLabel
    Left = 16
    Top = 16
    Width = 33
    Height = 13
    Caption = 'Users'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 136
    Top = 16
    Width = 70
    Height = 13
    Caption = 'Access from'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 432
    Top = 40
    Width = 30
    Height = 13
    Caption = 'Select'
  end
  object Label4: TLabel
    Left = 432
    Top = 64
    Width = 26
    Height = 13
    Caption = 'Insert'
  end
  object Label5: TLabel
    Left = 432
    Top = 88
    Width = 35
    Height = 13
    Caption = 'Update'
  end
  object Label6: TLabel
    Left = 432
    Top = 112
    Width = 31
    Height = 13
    Caption = 'Delete'
  end
  object Label7: TLabel
    Left = 432
    Top = 136
    Width = 31
    Height = 13
    Caption = 'Create'
  end
  object Label8: TLabel
    Left = 432
    Top = 160
    Width = 23
    Height = 13
    Caption = 'Drop'
  end
  object Label9: TLabel
    Left = 432
    Top = 184
    Width = 34
    Height = 13
    Caption = 'Reload'
  end
  object Label12: TLabel
    Left = 432
    Top = 208
    Width = 21
    Height = 13
    Caption = 'Alter'
  end
  object Label10: TLabel
    Left = 432
    Top = 16
    Width = 56
    Height = 13
    Caption = 'Privileges'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label11: TLabel
    Left = 568
    Top = 40
    Width = 71
    Height = 13
    Caption = 'New Password'
  end
  object Label13: TLabel
    Left = 256
    Top = 16
    Width = 61
    Height = 13
    Caption = 'Databases'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object start: TButton
    Left = 624
    Top = 144
    Width = 75
    Height = 25
    Caption = 'start'
    TabOrder = 0
    OnClick = startClick
  end
  object tmp: TStringGrid
    Left = 456
    Top = 392
    Width = 320
    Height = 120
    TabOrder = 1
    Visible = False
  end
  object u: TListBox
    Left = 16
    Top = 40
    Width = 113
    Height = 265
    ItemHeight = 13
    TabOrder = 2
    OnMouseUp = uMouseUp
  end
  object h: TListBox
    Left = 136
    Top = 40
    Width = 113
    Height = 265
    ItemHeight = 13
    TabOrder = 3
    OnMouseUp = hMouseUp
  end
  object ComboBox1: TComboBox
    Left = 496
    Top = 40
    Width = 41
    Height = 21
    ItemHeight = 13
    TabOrder = 4
    Text = 'Y'
    Items.Strings = (
      'Y'
      'N')
  end
  object ComboBox2: TComboBox
    Left = 496
    Top = 64
    Width = 41
    Height = 21
    ItemHeight = 13
    TabOrder = 5
    Text = 'Y'
    Items.Strings = (
      'Y'
      'N')
  end
  object ComboBox3: TComboBox
    Left = 496
    Top = 88
    Width = 41
    Height = 21
    ItemHeight = 13
    TabOrder = 6
    Text = 'Y'
    Items.Strings = (
      'Y'
      'N')
  end
  object ComboBox4: TComboBox
    Left = 496
    Top = 112
    Width = 41
    Height = 21
    ItemHeight = 13
    TabOrder = 7
    Text = 'Y'
    Items.Strings = (
      'Y'
      'N')
  end
  object ComboBox5: TComboBox
    Left = 496
    Top = 136
    Width = 41
    Height = 21
    ItemHeight = 13
    TabOrder = 8
    Text = 'Y'
    Items.Strings = (
      'Y'
      'N')
  end
  object ComboBox6: TComboBox
    Left = 496
    Top = 160
    Width = 41
    Height = 21
    ItemHeight = 13
    TabOrder = 9
    Text = 'Y'
    Items.Strings = (
      'Y'
      'N')
  end
  object ComboBox7: TComboBox
    Left = 496
    Top = 184
    Width = 41
    Height = 21
    ItemHeight = 13
    TabOrder = 10
    Text = 'Y'
    Items.Strings = (
      'Y'
      'N')
  end
  object ComboBox8: TComboBox
    Left = 496
    Top = 208
    Width = 41
    Height = 21
    ItemHeight = 13
    TabOrder = 11
    Text = 'Y'
    Items.Strings = (
      'Y'
      'N')
  end
  object Button1: TButton
    Left = 424
    Top = 248
    Width = 113
    Height = 25
    Caption = 'Set new privileges'
    TabOrder = 12
  end
  object Button2: TButton
    Left = 424
    Top = 280
    Width = 113
    Height = 25
    Caption = 'Delete User'
    TabOrder = 13
  end
  object Edit1: TEdit
    Left = 568
    Top = 56
    Width = 121
    Height = 21
    PasswordChar = '*'
    TabOrder = 14
    Text = 'Edit1'
  end
  object CheckBox1: TCheckBox
    Left = 568
    Top = 80
    Width = 129
    Height = 17
    Caption = 'MySQL 4 compatybile'
    TabOrder = 15
  end
  object Edit2: TEdit
    Left = 576
    Top = 184
    Width = 121
    Height = 21
    TabOrder = 16
    Text = 'Edit2'
  end
  object Edit3: TEdit
    Left = 576
    Top = 208
    Width = 121
    Height = 21
    TabOrder = 17
    Text = 'Edit3'
  end
  object Button3: TButton
    Left = 576
    Top = 280
    Width = 123
    Height = 25
    Caption = 'Add new user'
    TabOrder = 18
  end
  object CheckBox2: TCheckBox
    Left = 576
    Top = 256
    Width = 129
    Height = 17
    Caption = 'MySQL 4 compatybile'
    TabOrder = 19
  end
  object Edit4: TEdit
    Left = 576
    Top = 232
    Width = 121
    Height = 21
    TabOrder = 20
    Text = 'Edit3'
  end
  object Button4: TButton
    Left = 568
    Top = 104
    Width = 123
    Height = 25
    Caption = 'Change passworod'
    TabOrder = 21
  end
  object d: TListBox
    Left = 256
    Top = 40
    Width = 113
    Height = 265
    ItemHeight = 13
    TabOrder = 22
  end
end
