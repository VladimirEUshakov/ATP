object DBForm: TDBForm
  Left = 0
  Top = 0
  Caption = 'DB'
  ClientHeight = 153
  ClientWidth = 360
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object eServer: TLabeledEdit
    Left = 53
    Top = 8
    Width = 153
    Height = 21
    EditLabel.Width = 37
    EditLabel.Height = 13
    EditLabel.Caption = #1057#1077#1088#1074#1077#1088
    LabelPosition = lpLeft
    TabOrder = 0
  end
  object eLogin: TLabeledEdit
    Left = 53
    Top = 40
    Width = 153
    Height = 21
    EditLabel.Width = 30
    EditLabel.Height = 13
    EditLabel.Caption = #1051#1086#1075#1080#1085
    LabelPosition = lpLeft
    TabOrder = 1
  end
  object ePass: TLabeledEdit
    Left = 53
    Top = 72
    Width = 153
    Height = 21
    EditLabel.Width = 37
    EditLabel.Height = 13
    EditLabel.Caption = #1055#1072#1088#1086#1083#1100
    LabelPosition = lpLeft
    TabOrder = 2
  end
  object BitBtn1: TBitBtn
    Left = 220
    Top = 70
    Width = 137
    Height = 25
    Caption = #1055#1088#1086#1074#1077#1088#1080#1090#1100' '#1089#1086#1077#1076#1080#1085#1077#1085#1080#1077
    TabOrder = 3
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 220
    Top = 123
    Width = 137
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1085#1072#1089#1090#1088#1086#1081#1082#1080
    TabOrder = 4
    OnClick = BitBtn2Click
  end
  object cxLabel1: TcxLabel
    Left = 31
    Top = 126
    Caption = #1041#1044
  end
  object eDBName: TcxComboBox
    Left = 53
    Top = 123
    TabOrder = 6
    Text = 'eDBName'
    Width = 153
  end
  object ADOConnection: TADOConnection
    DefaultDatabase = 'ATP'
    LoginPrompt = False
    Mode = cmReadWrite
    Provider = 'MSOLEDBSQL.1'
    Left = 8
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection
    Parameters = <>
    Left = 56
  end
  object DSGuides: TdxServerModeADODataSource
    KeyFieldNames = 'id'
    SQLAdapterClassName = 'TdxServerModeMSSQLAdapter'
    TableName = 'automodels'
    Connection = ADOConnection
    Left = 232
    Top = 8
  end
  object ADOQuery2: TADOQuery
    Connection = ADOConnection
    Parameters = <>
    Left = 8
    Top = 88
  end
  object ADOQuery3: TADOQuery
    Connection = ADOConnection
    Parameters = <>
    Left = 48
    Top = 88
  end
  object InsUpdQuery: TADOQuery
    Connection = ADOConnection
    Parameters = <>
    Left = 296
    Top = 8
  end
  object MainQuery: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    Filter = 'DELETED<>'#39'Y'#39
    Filtered = True
    Parameters = <>
    SQL.Strings = (
      'select * from WAYBILLS '
      'left join dispatcher on dispatcher=dispatcher.id'
      'left join drivers on driver=drivers.id')
    Left = 296
    Top = 96
  end
  object DSAuto: TdxServerModeADODataSource
    KeyFieldNames = 'id'
    SQLAdapterClassName = 'TdxServerModeMSSQLAdapter'
    TableName = 'automodels'
    Connection = ADOConnection
    Left = 264
    Top = 16
  end
end
