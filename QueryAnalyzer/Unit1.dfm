object Form1: TForm1
  Left = 248
  Top = 144
  Width = 841
  Height = 443
  BorderStyle = bsSizeToolWin
  Caption = 'Slow Query Analyzer'
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
  object Splitter1: TSplitter
    Left = 377
    Top = 197
    Width = 16
    Height = 210
    Cursor = crHSplit
    Beveled = True
  end
  object Splitter2: TSplitter
    Left = 0
    Top = 182
    Width = 825
    Height = 15
    Cursor = crVSplit
    Align = alTop
    Beveled = True
  end
  object DBGrid1: TDBGrid
    Left = 888
    Top = 304
    Width = 97
    Height = 89
    DataSource = MyDataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Visible = False
  end
  object Button1: TButton
    Left = 704
    Top = 120
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 1
    Visible = False
    OnClick = Button1Click
  end
  object res: TStringAlignGrid
    Left = 0
    Top = 49
    Width = 825
    Height = 133
    Align = alTop
    ColCount = 7
    DefaultRowHeight = 17
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
    TabOrder = 2
    OnSelectCell = resSelectCell
    ColWidths = (
      30
      64
      106
      64
      64
      64
      364)
    PropCell = ()
    PropCol = ()
    PropRow = ()
    PropFixedCol = ()
    PropFixedRow = ()
  end
  object res2: TStringAlignGrid
    Left = 0
    Top = 197
    Width = 377
    Height = 210
    Cursor = crHandPoint
    Align = alLeft
    ColCount = 3
    DefaultRowHeight = 17
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goRowSelect]
    TabOrder = 3
    OnSelectCell = res2SelectCell
    ColWidths = (
      26
      300
      30)
    PropCell = ()
    PropCol = ()
    PropRow = ()
    PropFixedCol = ()
    PropFixedRow = ()
  end
  object Memo1: TMemo
    Left = 393
    Top = 197
    Width = 432
    Height = 210
    Align = alClient
    ScrollBars = ssBoth
    TabOrder = 4
    WordWrap = False
  end
  object CoolBar1: TCoolBar
    Left = 0
    Top = 0
    Width = 825
    Height = 49
    Bands = <
      item
        Control = CheckBox1
        ImageIndex = -1
        MinHeight = 17
        Width = 143
      end
      item
        Break = False
        Control = CheckBox2
        ImageIndex = -1
        MinHeight = 17
        Width = 122
      end
      item
        Break = False
        Control = SpinEdit1
        ImageIndex = -1
        MinHeight = 22
        Width = 113
      end
      item
        Break = False
        Control = Button2
        ImageIndex = -1
        MinHeight = 21
        Width = 137
      end
      item
        Break = False
        Control = Edit1
        ImageIndex = -1
        MinHeight = 21
        Width = 71
      end
      item
        Break = False
        Control = Button3
        ImageIndex = -1
        MinHeight = 19
        Width = 225
      end>
    object Label4: TLabel
      Left = 0
      Top = 26
      Width = 68
      Height = 13
      Caption = 'Process count'
    end
    object Label6: TLabel
      Left = 80
      Top = 26
      Width = 6
      Height = 13
      Caption = '0'
    end
    object CheckBox1: TCheckBox
      Left = 9
      Top = 2
      Width = 130
      Height = 17
      Caption = 'Enable analyze'
      Checked = True
      State = cbChecked
      TabOrder = 0
      OnClick = CheckBox1Click
    end
    object SpinEdit1: TSpinEdit
      Left = 278
      Top = 0
      Width = 100
      Height = 22
      Increment = 10
      MaxValue = 10000
      MinValue = 10
      TabOrder = 1
      Value = 10
      OnChange = SpinEdit1Change
    end
    object CheckBox2: TCheckBox
      Left = 154
      Top = 2
      Width = 109
      Height = 17
      Caption = 'Always on top'
      Checked = True
      State = cbChecked
      TabOrder = 2
      OnClick = CheckBox2Click
    end
    object Edit1: TEdit
      Left = 532
      Top = 0
      Width = 58
      Height = 21
      ReadOnly = True
      TabOrder = 3
      Text = '0'
    end
    object Button2: TButton
      Left = 393
      Top = 0
      Width = 124
      Height = 21
      Caption = 'Kill process'
      TabOrder = 4
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 605
      Top = 1
      Width = 212
      Height = 19
      Caption = 'Clear'
      TabOrder = 5
      OnClick = Button3Click
    end
  end
  object MyConnection1: TMyConnection
    Options.UseUnicode = True
    Options.DisconnectedMode = True
    PoolingOptions.Validate = True
    Pooling = True
    Username = 'root'
    LoginPrompt = False
    Left = 488
    Top = 96
  end
  object MyQuery1: TMyQuery
    Connection = MyConnection1
    Options.FieldsAsString = True
    Left = 520
    Top = 96
  end
  object MyDataSource1: TMyDataSource
    DataSet = MyQuery1
    Left = 552
    Top = 96
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 10
    OnTimer = Timer1Timer
    Left = 584
    Top = 96
  end
  object Timer2: TTimer
    Interval = 100
    OnTimer = Timer2Timer
    Left = 640
    Top = 96
  end
end
