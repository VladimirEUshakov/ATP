object AutoModelsForm: TAutoModelsForm
  Left = 0
  Top = 0
  Caption = 'AutoModelsForm'
  ClientHeight = 251
  ClientWidth = 346
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object cxGrid1: TcxGrid
    Left = 0
    Top = 0
    Width = 346
    Height = 251
    Align = alClient
    TabOrder = 0
    LevelTabs.Style = 8
    ExplicitLeft = 8
    ExplicitTop = 8
    ExplicitWidth = 337
    ExplicitHeight = 200
    object cxGrid1ServerModeTableView1: TcxGridServerModeTableView
      Navigator.Buttons.ConfirmDelete = True
      Navigator.Buttons.CustomButtons = <>
      Navigator.Buttons.Insert.Hint = #1044#1086#1073#1072#1074#1080#1090#1100
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Hint = #1048#1079#1084#1077#1085#1080#1090#1100
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Cancel.Visible = False
      Navigator.Buttons.GotoBookmark.Visible = False
      Navigator.InfoPanel.Visible = True
      Navigator.Visible = True
      FilterBox.Position = fpTop
      FindPanel.DisplayMode = fpdmAlways
      FindPanel.Position = fppBottom
      ScrollbarAnnotations.CustomAnnotations = <>
      DataController.DataSource = DataSource1
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      object cxGrid1ServerModeTableView1Column1: TcxGridServerModeColumn
        Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1084#1086#1076#1077#1083#1080
        DataBinding.FieldName = 'name'
        Width = 310
      end
      object cxGrid1ServerModeTableView1Column2: TcxGridServerModeColumn
        DataBinding.FieldName = 'id'
        Visible = False
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1ServerModeTableView1
    end
  end
  object DataSource1: TdxServerModeADODataSource
    KeyFieldNames = 'id'
    SQLAdapterClassName = 'TdxServerModeMSSQLAdapter'
    TableName = 'automodels'
    Connection = DBForm.ADOConnection
    Left = 296
    Top = 112
  end
end
