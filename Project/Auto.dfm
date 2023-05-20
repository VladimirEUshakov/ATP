object AutoForm: TAutoForm
  Left = 0
  Top = 0
  Caption = #1040#1074#1090#1086#1084#1086#1073#1080#1083#1080
  ClientHeight = 257
  ClientWidth = 505
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object cxGrid1: TcxGrid
    Left = 0
    Top = 0
    Width = 505
    Height = 257
    Align = alClient
    TabOrder = 0
    object cxGrid1ServerModeTableView1: TcxGridServerModeTableView
      Navigator.Buttons.CustomButtons = <>
      Navigator.Buttons.SaveBookmark.Visible = False
      Navigator.Buttons.GotoBookmark.Visible = False
      Navigator.InfoPanel.Visible = True
      Navigator.Visible = True
      ScrollbarAnnotations.CustomAnnotations = <>
      DataController.DataSource = DBForm.DSAuto
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      object Regnum: TcxGridServerModeColumn
        Caption = #1056#1077#1075#1080#1089#1090#1088#1072#1094#1080#1086#1085#1085#1099#1081' '#1085#1086#1084#1077#1088
        DataBinding.FieldName = 'regnum'
        DataBinding.IsNullValueType = True
        HeaderAlignmentHorz = taCenter
        Width = 135
      end
      object model: TcxGridServerModeColumn
        Caption = #1052#1086#1076#1077#1083#1100
        DataBinding.FieldName = 'model'
        DataBinding.IsNullValueType = True
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'id'
        Properties.ListColumns = <
          item
            FieldName = 'name'
          end>
        Properties.ListSource = DataSource1
        HeaderAlignmentHorz = taCenter
        Width = 145
      end
      object odometr: TcxGridServerModeColumn
        Caption = #1055#1088#1086#1073#1077#1075
        DataBinding.FieldName = 'odometr'
        DataBinding.IsNullValueType = True
        HeaderAlignmentHorz = taCenter
        Width = 85
      end
      object MANUFACTURED: TcxGridServerModeColumn
        Caption = #1043#1086#1076' '#1074#1099#1087#1091#1089#1082#1072
        DataBinding.FieldName = 'MANUFACTURED'
        DataBinding.IsNullValueType = True
        PropertiesClassName = 'TcxSpinEditProperties'
        HeaderAlignmentHorz = taCenter
        Width = 80
      end
      object INSPECTION: TcxGridServerModeColumn
        Caption = #1044#1072#1090#1072' '#1058#1054
        DataBinding.FieldName = 'INSPECTION'
        DataBinding.IsNullValueType = True
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.SaveTime = False
        Properties.ShowTime = False
        HeaderAlignmentHorz = taCenter
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1ServerModeTableView1
    end
  end
  object DataSource1: TDataSource
    DataSet = DBForm.ADOQuery1
    Left = 384
    Top = 72
  end
end
