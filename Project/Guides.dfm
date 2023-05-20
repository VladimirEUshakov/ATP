object GuideSForm: TGuideSForm
  Left = 0
  Top = 0
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082
  ClientHeight = 251
  ClientWidth = 346
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
    Width = 346
    Height = 251
    Align = alClient
    TabOrder = 0
    LevelTabs.Style = 8
    object TableView: TcxGridServerModeTableView
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
      DataController.DataSource = DBForm.DSGuides
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsView.GroupByBox = False
      object fldID: TcxGridServerModeColumn
        DataBinding.FieldName = 'id'
        DataBinding.IsNullValueType = True
        Visible = False
      end
      object fldName: TcxGridServerModeColumn
        Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1084#1086#1076#1077#1083#1080
        DataBinding.FieldName = 'name'
        DataBinding.IsNullValueType = True
        HeaderAlignmentHorz = taCenter
        Width = 244
      end
      object fldOther: TcxGridServerModeColumn
        DataBinding.IsNullValueType = True
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.SaveTime = False
        Properties.ShowTime = False
        Width = 74
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = TableView
    end
  end
end
