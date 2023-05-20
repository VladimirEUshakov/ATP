object ATP: TATP
  Left = 0
  Top = 0
  Caption = 'ATP'
  ClientHeight = 439
  ClientWidth = 824
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnActivate = FormShow
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 824
    Height = 25
    ButtonHeight = 25
    Images = AddRec.ImageList1
    TabOrder = 0
    object ToolButton1: TToolButton
      Left = 0
      Top = 0
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1091#1090#1077#1074#1086#1081' '#1083#1080#1089#1090
      Caption = 'ToolButton1'
      ImageIndex = 3
      ParentShowHint = False
      ShowHint = True
      OnClick = ToolButton1Click
    end
    object ToolButton2: TToolButton
      Left = 23
      Top = 0
      Hint = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1087#1091#1090#1077#1074#1086#1081' '#1083#1080#1089#1090
      Caption = 'ToolButton2'
      ImageIndex = 4
      ParentShowHint = False
      ShowHint = True
      OnClick = ToolButton2Click
    end
    object ToolButton4: TToolButton
      Left = 46
      Top = 0
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1087#1091#1090#1077#1074#1086#1081' '#1083#1080#1089#1090
      Caption = 'ToolButton4'
      ImageIndex = 1
      ParentShowHint = False
      ShowHint = True
      OnClick = ToolButton4Click
    end
    object CheckBox1: TCheckBox
      Left = 69
      Top = 0
      Width = 128
      Height = 25
      BiDiMode = bdLeftToRight
      Caption = #1087#1086#1082#1072#1079#1072#1090#1100' '#1091#1076#1072#1083#1077#1085#1085#1099#1077
      Ctl3D = True
      ParentBiDiMode = False
      ParentCtl3D = False
      TabOrder = 0
      OnClick = CheckBox1Click
    end
    object ToolButton5: TToolButton
      Left = 197
      Top = 0
      Width = 8
      Caption = 'ToolButton5'
      ImageIndex = 6
      Style = tbsSeparator
    end
    object ToolButton3: TToolButton
      Left = 205
      Top = 0
      Hint = #1069#1082#1089#1087#1086#1088#1090' '#1074' Excel'
      Caption = 'ToolButton3'
      ImageIndex = 5
      ParentShowHint = False
      ShowHint = True
      OnClick = ToolButton3Click
    end
  end
  object MainGrid: TcxGrid
    Left = 0
    Top = 25
    Width = 824
    Height = 414
    Align = alClient
    TabOrder = 1
    object TableView: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      Navigator.Buttons.Insert.Visible = False
      Navigator.Buttons.Delete.Visible = False
      Navigator.Buttons.Edit.Visible = False
      Navigator.Buttons.Post.Visible = False
      Navigator.Buttons.Cancel.Visible = False
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = False
      Navigator.Buttons.GotoBookmark.Visible = False
      Navigator.Buttons.Filter.Visible = False
      Navigator.InfoPanel.Visible = True
      Navigator.Visible = True
      FilterBox.Position = fpTop
      FilterBox.Visible = fvAlways
      ScrollbarAnnotations.CustomAnnotations = <>
      OnCustomDrawCell = TableViewCustomDrawCell
      DataController.DataSource = DataSource1
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      object ListId: TcxGridDBColumn
        Caption = #1055#1091#1090#1077#1074#1086#1081' '#1083#1080#1089#1090
        DataBinding.FieldName = 'ID'
        DataBinding.IsNullValueType = True
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Width = 87
      end
      object TableViewColumn2: TcxGridDBColumn
        Caption = #1042#1099#1077#1079#1076
        DataBinding.FieldName = 'DEPARTURE'
        DataBinding.IsNullValueType = True
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
      end
      object TableViewColumn3: TcxGridDBColumn
        Caption = #1055#1088#1080#1073#1099#1090#1080#1077
        DataBinding.FieldName = 'ARRIVAL'
        DataBinding.IsNullValueType = True
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Width = 69
      end
      object TableViewColumn4: TcxGridDBColumn
        Caption = #1042#1086#1076#1080#1090#1077#1083#1100
        DataBinding.FieldName = 'FIO_1'
        DataBinding.IsNullValueType = True
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Width = 164
      end
      object TableViewColumn6: TcxGridDBColumn
        Caption = #1040#1074#1090#1086#1084#1086#1073#1080#1083#1100
        DataBinding.FieldName = 'AUTO'
        DataBinding.IsNullValueType = True
        HeaderAlignmentHorz = taCenter
        HeaderGlyphAlignmentHorz = taCenter
        Options.Editing = False
        Width = 82
      end
      object TableViewColumn5: TcxGridDBColumn
        Caption = #1056#1072#1089#1093#1086#1076
        DataBinding.FieldName = 'CONSUMPTION'
        DataBinding.IsNullValueType = True
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
      end
      object TableViewColumn7: TcxGridDBColumn
        Caption = #1055#1088#1086#1073#1077#1075
        DataBinding.FieldName = 'MILEAGE'
        DataBinding.IsNullValueType = True
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Width = 69
      end
      object TableViewColumn8: TcxGridDBColumn
        Caption = #1044#1080#1089#1087#1077#1090#1095#1077#1088
        DataBinding.FieldName = 'FIO'
        DataBinding.IsNullValueType = True
        HeaderAlignmentHorz = taCenter
        HeaderGlyphAlignmentHorz = taCenter
        Options.Editing = False
        Width = 215
      end
      object TableViewColumn9: TcxGridDBColumn
        Caption = #1059#1076#1072#1083#1077#1085
        DataBinding.FieldName = 'DELETED'
        DataBinding.IsNullValueType = True
        Visible = False
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
      end
      object TableViewColumn1: TcxGridDBColumn
        DataBinding.FieldName = 'DRIVER'
        DataBinding.IsNullValueType = True
        Visible = False
      end
      object TableViewColumn10: TcxGridDBColumn
        DataBinding.FieldName = 'DISPATCHER'
        DataBinding.IsNullValueType = True
        Visible = False
      end
    end
    object MainGridLevel1: TcxGridLevel
      GridView = TableView
    end
  end
  object MainMenu1: TMainMenu
    Left = 536
    Top = 112
    object N1: TMenuItem
      Caption = #1041#1044
      object N2: TMenuItem
        Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1089#1086#1077#1076#1080#1085#1077#1085#1080#1103
        OnClick = N2Click
      end
    end
    object N3: TMenuItem
      Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082#1080
      object N4: TMenuItem
        Caption = #1044#1080#1089#1087#1077#1090#1095#1077#1088#1099
        OnClick = N4Click
      end
      object N5: TMenuItem
        Caption = #1042#1086#1076#1080#1090#1077#1083#1080
        OnClick = N5Click
      end
      object N6: TMenuItem
        Caption = #1052#1086#1076#1077#1083#1080' '#1072#1074#1090#1086
        OnClick = N6Click
      end
      object N7: TMenuItem
        Caption = '-'
      end
      object N8: TMenuItem
        Caption = #1040#1074#1090#1086#1084#1086#1073#1080#1083#1080
        OnClick = N8Click
      end
    end
  end
  object DataSource1: TDataSource
    DataSet = DBForm.MainQuery
    Left = 544
    Top = 176
  end
end
