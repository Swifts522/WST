object Form10: TForm10
  Left = 0
  Top = 0
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1076#1086#1089#1090#1091#1087#1072
  ClientHeight = 481
  ClientWidth = 694
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 732
    Top = 24
    Width = 33
    Height = 120
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Visible = False
    Columns = <
      item
        Expanded = False
        FieldName = #1050#1086#1076
        Visible = True
      end
      item
        Expanded = False
        FieldName = #1050#1083#1072#1089#1089
        Visible = True
      end
      item
        Expanded = False
        FieldName = #1041#1091#1082#1074#1072
        Visible = True
      end
      item
        Expanded = False
        FieldName = #1051#1086#1075#1080#1085
        Visible = True
      end
      item
        Expanded = False
        FieldName = #1055#1088#1077#1076#1084#1077#1090
        Visible = True
      end>
  end
  object GroupBox1: TGroupBox
    Left = 16
    Top = 24
    Width = 345
    Height = 329
    Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1076#1086#1089#1090#1091#1087#1072
    TabOrder = 1
    object GroupBox3: TGroupBox
      Left = 104
      Top = 25
      Width = 145
      Height = 65
      Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1082#1083#1072#1089#1089
      TabOrder = 0
      object ComboBox1: TComboBox
        Left = 24
        Top = 30
        Width = 41
        Height = 21
        TabOrder = 0
        OnChange = ComboBox1Change
        Items.Strings = (
          '1'
          '2'
          '3'
          '4'
          '5'
          '6'
          '7'
          '8'
          '9'
          '10'
          '11')
      end
      object ComboBox2: TComboBox
        Left = 88
        Top = 30
        Width = 41
        Height = 21
        TabOrder = 1
        OnChange = ComboBox2Change
        Items.Strings = (
          #1072
          #1073)
      end
    end
    object GroupBox4: TGroupBox
      Left = 24
      Top = 96
      Width = 305
      Height = 209
      Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1087#1088#1077#1076#1084#1077#1090#1099
      TabOrder = 1
      object CheckBox1: TCheckBox
        Left = 24
        Top = 32
        Width = 97
        Height = 17
        Caption = #1040#1083#1075#1077#1073#1088#1072
        TabOrder = 0
      end
      object CheckBox2: TCheckBox
        Left = 24
        Top = 55
        Width = 97
        Height = 17
        Caption = #1043#1077#1086#1084#1077#1090#1088#1080#1103
        TabOrder = 1
      end
      object CheckBox3: TCheckBox
        Left = 24
        Top = 78
        Width = 129
        Height = 17
        Caption = #1048#1089#1090#1086#1088#1080#1103' '#1050#1072#1079#1072#1093#1089#1090#1072#1085#1072
        TabOrder = 2
      end
      object CheckBox4: TCheckBox
        Left = 24
        Top = 101
        Width = 129
        Height = 17
        Caption = #1042#1089#1077#1084#1080#1088#1085#1072#1103' '#1080#1089#1090#1086#1088#1080#1103
        TabOrder = 3
      end
      object CheckBox5: TCheckBox
        Left = 24
        Top = 124
        Width = 129
        Height = 17
        Caption = #1058#1088#1091#1076
        TabOrder = 4
      end
      object CheckBox6: TCheckBox
        Left = 176
        Top = 32
        Width = 129
        Height = 17
        Caption = #1056#1091#1089#1089#1082#1080#1081' '#1103#1079#1099#1082
        TabOrder = 5
      end
      object CheckBox7: TCheckBox
        Left = 176
        Top = 55
        Width = 129
        Height = 17
        Caption = #1050#1072#1079#1072#1093#1089#1082#1080#1081' '#1103#1079#1099#1082
        TabOrder = 6
      end
      object CheckBox8: TCheckBox
        Left = 176
        Top = 78
        Width = 137
        Height = 17
        Caption = #1056#1091#1089#1089#1082#1072#1103' '#1083#1080#1090#1077#1088#1072#1090#1091#1088#1072
        TabOrder = 7
      end
      object CheckBox9: TCheckBox
        Left = 176
        Top = 101
        Width = 137
        Height = 17
        Caption = #1069#1082#1086#1085#1086#1084#1080#1082#1072
        TabOrder = 8
      end
      object CheckBox10: TCheckBox
        Left = 176
        Top = 124
        Width = 137
        Height = 17
        Caption = #1060#1080#1079#1082#1091#1083#1100#1090#1091#1088#1072
        TabOrder = 9
      end
      object CheckBox11: TCheckBox
        Left = 112
        Top = 164
        Width = 137
        Height = 17
        Caption = #1042#1099#1073#1088#1072#1090#1100' '#1074#1089#1077
        TabOrder = 10
        OnClick = CheckBox11Click
      end
    end
  end
  object GroupBox2: TGroupBox
    Left = 367
    Top = 24
    Width = 274
    Height = 329
    Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103
    TabOrder = 2
    object Label1: TLabel
      Left = 96
      Top = 25
      Width = 75
      Height = 15
      Caption = #1060#1048#1054' '#1091#1095#1080#1090#1077#1083#1103
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Times New Roman'
      Font.Pitch = fpFixed
      Font.Style = []
      ParentFont = False
    end
    object Edit1: TEdit
      Left = 16
      Top = 46
      Width = 249
      Height = 19
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      TabOrder = 0
    end
    object BitBtn2: TBitBtn
      Left = 56
      Top = 280
      Width = 153
      Height = 25
      Caption = #1042#1099#1093#1086#1076
      DoubleBuffered = True
      Kind = bkAbort
      NumGlyphs = 2
      ParentDoubleBuffered = False
      TabOrder = 1
      OnClick = BitBtn2Click
    end
    object BitBtn1: TBitBtn
      Left = 57
      Top = 234
      Width = 152
      Height = 27
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
      DoubleBuffered = True
      Kind = bkOK
      NumGlyphs = 2
      ParentDoubleBuffered = False
      TabOrder = 2
      OnClick = BitBtn1Click
    end
  end
  object Edit2: TEdit
    Left = 16
    Top = 376
    Width = 121
    Height = 21
    Enabled = False
    TabOrder = 3
    Visible = False
  end
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;User ID=Admin;Mode=Share Deny N' +
      'one;Persist Security Info=False;Jet OLEDB:System database="";Jet' +
      ' OLEDB:Registry Path="";Jet OLEDB:Database Password="";Jet OLEDB' +
      ':Engine Type=5;Jet OLEDB:Database Locking Mode=1;Jet OLEDB:Globa' +
      'l Partial Bulk Ops=2;Jet OLEDB:Global Bulk Transactions=1;Jet OL' +
      'EDB:New Database Password="";Jet OLEDB:Create System Database=Fa' +
      'lse;Jet OLEDB:Encrypt Database=False;Jet OLEDB:Don'#39't Copy Locale' +
      ' on Compact=False;Jet OLEDB:Compact Without Replica Repair=False' +
      ';Jet OLEDB:SFP=False'
    LoginPrompt = False
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 728
    Top = 208
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM Dostup')
    Left = 736
    Top = 152
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 728
    Top = 256
  end
end
