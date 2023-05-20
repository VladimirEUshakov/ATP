object AddRec: TAddRec
  Left = 0
  Top = 0
  Caption = #1055#1091#1090#1077#1074#1086#1081' '#1083#1080#1089#1090
  ClientHeight = 231
  ClientWidth = 505
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 505
    Height = 24
    ButtonHeight = 24
    ButtonWidth = 24
    Caption = 'ToolBar1'
    Images = ImageList1
    TabOrder = 0
    object ToolButton1: TToolButton
      Left = 0
      Top = 0
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
      Margins.Left = 1
      Margins.Top = 1
      Margins.Right = 1
      Margins.Bottom = 1
      Caption = 'ToolButton1'
      ImageIndex = 0
      ParentShowHint = False
      ShowHint = True
      OnClick = ToolButton1Click
    end
    object ToolButton2: TToolButton
      Left = 24
      Top = 0
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1087#1091#1090#1077#1074#1086#1081' '#1083#1080#1089#1090
      Caption = 'ToolButton2'
      ImageIndex = 1
      ParentShowHint = False
      ShowHint = True
      OnClick = ToolButton2Click
    end
    object ToolButton3: TToolButton
      Left = 48
      Top = 0
      Width = 8
      Caption = 'ToolButton3'
      ImageIndex = 2
      Style = tbsSeparator
    end
    object ToolButton4: TToolButton
      Left = 56
      Top = 0
      Hint = #1042#1099#1075#1088#1091#1079#1080#1090#1100' '#1074' '#1096#1072#1073#1083#1086#1085' Word'
      Caption = 'ToolButton4'
      ImageIndex = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = ToolButton4Click
    end
  end
  object ListNumberText: TStaticText
    Left = 0
    Top = 24
    Width = 505
    Height = 17
    Align = alTop
    Alignment = taCenter
    Caption = #1055#1091#1090#1077#1074#1086#1081' '#1083#1080#1089#1090' '#8470
    TabOrder = 1
  end
  object eDateBegin: TcxDateEdit
    Left = 8
    Top = 72
    Properties.AssignedValues.DisplayFormat = True
    Properties.AssignedValues.EditFormat = True
    Properties.DateButtons = [btnClear, btnNow]
    Properties.InputKind = ikRegExpr
    Properties.SaveTime = False
    Properties.ShowTime = False
    TabOrder = 2
    Width = 81
  end
  object eTimeBegin: TcxTimeEdit
    Left = 95
    Top = 72
    TabOrder = 3
    Width = 82
  end
  object eTimeEnd: TcxTimeEdit
    Left = 199
    Top = 72
    TabOrder = 4
    Width = 82
  end
  object cxLabel1: TcxLabel
    Left = 112
    Top = 42
    Caption = #1042#1099#1077#1079#1076
  end
  object cxLabel2: TcxLabel
    Left = 37
    Top = 42
    Caption = #1044#1072#1090#1072
  end
  object cxLabel3: TcxLabel
    Left = 114
    Top = 56
    Caption = #1074#1088#1077#1084#1103
  end
  object cxLabel4: TcxLabel
    Left = 223
    Top = 56
    Caption = #1074#1088#1077#1084#1103
  end
  object cxLabel5: TcxLabel
    Left = 219
    Top = 42
    Caption = #1055#1088#1080#1077#1079#1076
  end
  object eDriver: TcxLookupComboBox
    Left = 308
    Top = 72
    Properties.KeyFieldNames = 'id'
    Properties.ListColumns = <
      item
        Caption = #1060#1048#1054
        FieldName = 'FIO'
      end>
    Properties.ListSource = DSDrivers
    EditValue = 0
    TabOrder = 10
    Width = 185
  end
  object cxLabel6: TcxLabel
    Left = 387
    Top = 42
    Caption = #1042#1086#1076#1080#1090#1077#1083#1100
  end
  object eAuto: TcxLookupComboBox
    Left = 8
    Top = 128
    Properties.KeyFieldNames = 'regnum'
    Properties.ListColumns = <
      item
        Caption = #1056#1077#1075'.'#1085#1086#1084#1077#1088
        FieldName = 'regnum'
      end
      item
        Caption = #1052#1072#1088#1082#1072
        FieldName = 'name'
      end>
    Properties.ListSource = DSAuto
    TabOrder = 12
    Width = 209
  end
  object cxLabel7: TcxLabel
    Left = 83
    Top = 105
    Caption = #1040#1074#1090#1086#1084#1086#1073#1080#1083#1100
  end
  object eDisp: TcxLookupComboBox
    Left = 255
    Top = 180
    Properties.KeyFieldNames = 'id'
    Properties.ListColumns = <
      item
        Caption = #1060#1048#1054
        FieldName = 'FIO'
      end>
    Properties.ListSource = DSDisp
    EditValue = 0
    TabOrder = 14
    Width = 185
  end
  object cxLabel8: TcxLabel
    Left = 190
    Top = 181
    Caption = #1044#1080#1089#1087#1077#1090#1095#1077#1088
  end
  object eCons: TcxCurrencyEdit
    Left = 223
    Top = 128
    Properties.Alignment.Horz = taRightJustify
    Properties.DecimalPlaces = 3
    Properties.DisplayFormat = ',0.000 '#1083';-,0.000 '#1083
    TabOrder = 16
    Width = 121
  end
  object cxLabel9: TcxLabel
    Left = 242
    Top = 105
    Caption = #1056#1072#1089#1093#1086#1076' '#1073#1077#1085#1079#1080#1085#1072
  end
  object cxLabel10: TcxLabel
    Left = 376
    Top = 105
    Caption = #1050#1080#1083#1086#1084#1077#1090#1088#1072#1078
  end
  object eMil: TcxCurrencyEdit
    Left = 351
    Top = 128
    Properties.Alignment.Horz = taRightJustify
    Properties.DecimalPlaces = 3
    Properties.DisplayFormat = ',0.000 '#1082#1084';-,0.000 '#1082#1084
    TabOrder = 19
    Width = 121
  end
  object ImageList1: TImageList
    Left = 424
    Bitmap = {
      494C010106000800040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001002000000000000020
      000000000000000000000000000000000000FBFBFB0400000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F8F8FA07C0C3C546FEFEFE010000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000EBEBEB140000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009AD7EEFF336D8EFFE2E2
      E21D000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C1C1C13E225007FF2A83
      22FF259439FF1FA550FF19B668FF14C77FFF14C57DFF1AB465FF20A34EFF2592
      37FF2B8220FF020500FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000090D3EDFF519D
      60FFCDCDCD320000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000FF3CA602FF37AC
      15FF31B528FF2BBE3BFF26C64DFF20CE61FF1AD774FF14E087FF0FE89AFF09F1
      ADFF03F9BFFF0BDFA1FF000000FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008CD28CC642B6
      42FF55A655FFCDCDCD3200000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000FF3C9E00FF3CA4
      03FF38AA0FFF2DB62BFF28BF3DFF22C74FFF1CCF62FF17D875FF11E088FF0FE8
      9AFF09F1ADFF03F9C0FF000000FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008CD1
      8CC741B541FF56A656FFCDCDCD32000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000FF3B9900FF1ECC
      5EFFDDFBEEFFDDFBEEFFDDFBEEFFDDFBEEFFDDFBEEFFDDFBEEFFDDFBEEFFDDFB
      EEFF0EE99AFF09F1ADFF000000FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008AD28AC841B541FF56A656FFCCCDCC330000000000000000000000000000
      00000000000000000000000000000000000000000000000000FF3A9300FF1AD1
      65FFECFDF5FFEEFDF6FFEEFDF6FFECFDF5FFEDFDF6FF14E189FF14E189FFECFD
      F5FF17DB7DFF0FE89AFF000000FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008AD28AC842B642FF55A655FFCDCDCD3200000000000000000000
      00000000000000000000000000000000000000000000000000FF398E00FF23BA
      34FFF5FEFAFF9AF2CCFF14E188FF11DF84FF16DE83FF15E087FFF5FEFAFFF5FE
      FAFF1CD46DFF14E087FF000000FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008DD18DC443B643FF56A656FFCDCDCD32000000000000
      00000000000000000000000000000000000000000000000000FF388800FF30A2
      06FFFAFEFDFFFAFEFDFF0DDC7DFF18DB7BFF19D977FFFFFFFFFFFAFEFDFFFAFE
      FDFF11A225FF0A9917FF010101FE000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000008DD38DC441B541FF56A756FFC6CAC6390000
      00000000000000000000000000000000000000000000000000FF378300FF3792
      00FFFDFFFEFFFDFFFEFF6CD988FF1DD36AFF20CE5FFFFFFFFFFFFDFFFEFFFDFF
      FEFF16A327FF0F9C1FFF222222DD000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008AD28AC842B642FF56A756FFC6CA
      C6390000000000000000000000000000000000000000000000FF367D00FF3786
      00FFFEFFFFFFFFFFFFFF2DBA33FF29C142FF28C245FF2DBB35FFFEFFFFFFFEFF
      FFFF1DA223FF149D21FF545454AB000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008AD28AC842B542FF56A6
      56FFC6C8C63900000000000000000000000000000000000000FF357800FF367E
      00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF239F1AFF1B9C1FFF9D9D9D62000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008AD28AC841B6
      41FF989A9DFFC6C7C74E0000000000000000000000000B0B0BF4347200FF3578
      00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF2B9A0FFF229B18FFD4D4D42B000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CECE
      CEC7DEDFE2FFA4A6AAFFC2C2C845000000000000000000000000357100FF3472
      00FF357800FF367D00FF368200FF378700FF378C00FF379000FF369200FF3495
      00FF319602FF144B07FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CBCBCBC68F94DBFF4549C0FFEDEDED120000000000000000000000000000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000BFC4F19B6268D7FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000002A2A
      70FF3C3C59D00000000000000000000000000000000000000000000000000F0F
      98FC09099EFF0000000000000000000000000000000000000000000000FF251D
      01FF241C02FF241B03FF241B03FF231A04FF231A05FF231906FF221807FF2218
      07FF211708FF000000FF00000000000000000000000000000000000000000000
      0000000000000000000000960BFF009B10FF009A0FFF099509F6000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000CECECE31000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000002E2E69FF0000
      E5FF0D0DD8FF3B3B5AD000000000000000000000000000000000121293FC3737
      CFFF4848E1FF0505A1FF000000000000000000000000000000FFC7A205FFC59E
      03FFC49B07FFC2970BFFC1940FFFBF9113FFBE8E17FFBD8A1CFFBB8720FFBA84
      24FFB98128FFB77E2CFF000000FF000000000000000000000000000000000000
      0000000000000000000000B851FF00D66DFF00D36AFF00A526FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000008B554F752D38DFFA3A3A35C0000000000000000000000000000
      00000000000000000000000000000000000000000000323266FF0000F3FF0000
      E5FF0000D8FF1111D4FF39395CD0000000000000000016168FFC2828C0FF3838
      D1FF4848E1FF5858F1FF0202A7FF00000000000000001C1805FFCAA716FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFB98128FF000000FF000000000000000000000000000000000000
      0000000000000000000000EC80FF00F086FF00EF85FF00C03FFF000000000000
      000000000000000000000000000000000000000000000000000000000000FEFE
      FE0100AF48FFB2F5D6FF85F4B9FFF6FEFAFF6499799B00000000000000000000
      0000000000000000000000000000000000000000000030306AFF0000F3FF0000
      E5FF0000D8FF0000C8FF1515CEFF38385ED019198AFC1717AFFF2929C2FF3838
      D1FF4848E1FF5757F0FF0404A6FC00000000000000001D1807FFCDAC26FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFBA8424FF000000FF000000000000000000000000000000000000
      0000000000000000000000E474FF00E778FF00E677FF00BC39FF000000000000
      0000000000000000000000000000000000000000000000000000FBFBFB0400A3
      3EFF3AE07CFF40E37FFF6CEEA5FF8AF5BDFFCEF9E5FF08A040F7000000000000
      00000000000000000000000000000000000000000000000000002D2D6FFF0000
      E6FF0000D8FF0000C8FF0000B5FF1A1AC7FF07079FFF1919B2FF2929C2FF3838
      D1FF4747E0FF0808A1FC0000000000000000000000001D1909FFD0B137FFFFFF
      FFFFFFFFFFFFDCC564FFDCC564FFFFFFFFFFDCC564FFFCFBF4FFFFFFFFFFFFFF
      FFFFFFFFFFFFBB8720FF000000FF000000000000000000000000000000000000
      0000000000000000000000DB67FF00DD6AFF00DD69FF00B534FF000000000000
      00000000000000000000000000000000000000000000F2F2F20D009732FF00C9
      40FF00D247FF21DC65FF43E481FF55E891FF53E88FFF88EFBAFF009732FFFEFE
      FE01000000000000000000000000000000000000000000000000000000002929
      73FF0000D8FF0000C8FF0000B5FF0000A1FF0909A2FF1919B2FF2929C2FF3737
      CFFF0B0B9DFC000000000000000000000000000000001D190CFFD3B648FFFFFF
      FFFFFFFFFFFFD9BF5FFFD9BF5FFFFCF9F1FFD9BF5FFFD9BF5FFFFFFFFFFFFFFF
      FFFFFFFFFFFFBD8A1CFF000000FF00000000FCFCFC03218822DE218723DE2187
      23DE218723DE218623DE23D870FF2CDB77FF29DA75FF00AE2EFF218822DE2189
      22DE218A22DE218B22DE218C21DE00000000E3E3E31C008B27FF00BB34FF00C4
      3BFF00CC42FF00D248FF13D859FF20DC64FF1EDB63FF0DD754FF06D34DFF008B
      27FFFBFBFB040000000000000000000000000000000000000000000000000000
      0000262678FF0000C8FF0000B5FF00009EFF09099FFF1919B2FF2727C0FF0F0F
      98FC00000000000000000000000000000000000000001E1A0EFFD6BB59FFFFFF
      FFFFFFFFFFFFD2B257FFD2B257FFD2B257FFD2B257FFD2B257FFFCFAF3FFFFFF
      FFFFFFFFFFFFBE8E17FF000000FF00000000F8F8F80700AA44FF00B54EFF00BC
      55FF00C059FF00BF58FF31D36EFF3AD675FF37D573FF0AC754FF00C059FF00C0
      58FF00BB54FF00B24CFF00A741FF00000000007F1BFF00AC27FF00B52EFF55D3
      78FF55D77CFF55DB7FFF00CE44FF55DF83FF55DF83FF55DD81FF20CF57FF00C2
      3AFF007F1BFFF3F3F30C00000000000000000000000000000000000000000000
      0000282878FC0000C8FF2E2ED8FF2E2ED8FF2E2ED8FF2E2ED8FF3939DBFF3333
      64D000000000000000000000000000000000000000001E1B11FFD9C06AFFFFFF
      FFFFFFFFFFFFC9A04AFFFFFFFFFFC9A04AFFC9A04AFFFFFFFFFFC9A04AFFFFFF
      FFFFFFFFFFFFBF9113FF000000FF00000000F8F8F80758C669FF55C96DFF53CC
      71FF50CF73FF4DD175FF4BD276FF48D275FF45D173FF42D06EFF40CD69FF3DC9
      62FF3AC45AFF38BF51FF35B847FF00000000009E1BFF60C775FF76D38BFF76D7
      8FFF76DA91FF00C038FF0000000000C53DFF76E096FF76DF95FF76DD93FF76DA
      91FF00B32DFF00720FFFE5E5E51A000000000000000000000000000000002B2B
      73FC0000D8FF5353DFFF5353DFFF5353DFFF5353DFFF5353DFFF5353DFFF4444
      E4FF323266D0000000000000000000000000000000001E1B13FFDCC57BFFFFFF
      FFFFFFFFFFFFBD8939FFBA8431FFBD8939FFBD8939FFFFFFFFFFBD8939FFBD89
      39FFFFFFFFFFC1940FFF000000FF00000000F8F8F80768C771FF66CA74FF63CC
      77FF61CE78FF5ECF79FF58CF77FF56CF76FF53CE73FF54CE72FF51CB6EFF4EC8
      67FF4CC361FF49BE58FF44B94DFF0000000000000000009F1CFF96DAA4FF96DD
      A6FF2CBB4ED300000000000000000000000000BB34FF96E2AAFF96E1A9FF96DF
      A7FF96DCA5FF00A421FF006604FFD2D2D22D00000000000000002E2E6EFC0000
      E6FF7878E6FF7878E6FF7878E6FF00009FFF0707A0FF7878E6FF7878E6FF7878
      E6FF4F4FEDFF313168D00000000000000000000000001F1C15FFDFCA8BFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFC2970BFF000000FF000000000000000000000000000000000000
      000000000000000000004DC663FF64CD78FF61CC76FF009117FF000000000000
      00000000000000000000000000000000000000000000000000002CA73FD3C9E6
      CD36000000000000000000000000000000000000000000AF29FFB6E7C1FFB6E6
      C0FFB6E4BFFFB6E3BDFF009514FF006200FF0000000031316AFC0000F3FF9D9D
      EDFF9D9DEDFF9D9DEDFF0000B3FF1D1D85FC17178BFF1717B0FF9D9DEDFF9D9D
      EDFF9D9DEDFF5C5CF6FF2F2F69D000000000000000001F1D17FFE2CF9BFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFC49B07FF000000FF000000000000000000000000000000000000
      0000000000000000000057C363FF71CC7CFF6FCB7AFF008A10FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000097D2A168D7F0
      DBFFD7EFDAFFD7EEDAFFD7EDD9FFC9E1C9360000000027277BFFC2C2F3FFC2C2
      F4FFC2C2F4FF0000C8FF202080FC0000000000000000141490FF2727C0FFC2C2
      F4FFC2C2F4FF7C7CF1FF0000A4FF0000000000000000191207FFE5D4ACFFE1CD
      98FFE7D6A9FFE4D39EFFE3CF93FFE1CC89FFDFC97EFFDDC673FFDBC369FFD9BF
      5EFFC6A001FFC59E03FF000000FF000000000000000000000000000000000000
      0000000000000000000061C064FF7FCC82FF7CCC7FFF00830AFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FAFA
      FA05F8FCF8FF5DB563FFFDFDFD020000000000000000000000001C1C9BFFE7E7
      FAFF0000D7FF24247CFC00000000000000000000000000000000101094FF3535
      CFFF7F7FEAFF02029EFF000000000000000000000000000000FFE8D9BDFFE5D4
      ACFFE2CF9CFFDFCA8BFFDCC57BFFD9C06AFFD6BB59FFD3B648FFD0B137FFCDAC
      26FFCAA716FFCFAF37FF000000FF000000000000000000000000000000000000
      000000000000000000006BC36BFF8CD08CFF8ACF8AFF007F0AFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FEFEFE010000000000000000000000000000000000000000000000002424
      84FF282878FC0000000000000000000000000000000000000000000000000D0D
      99FF06069AFF0000000000000000000000000000000000000000000000FFBE90
      50FFC39A5DFFC8A46AFFCDAD76FFD2B783FFD2B783FFCCAC74FFC6A166FFC096
      57FFBB8B49FF000000FF00000000000000000000000000000000000000000000
      0000000000000000000063C063FFC1E6C1FFC0E5C0FF2B8E35FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF007FFFFFFF000000001FFFC00700000000
      8FFF800300000000C7FF800100000000C3FF800100000000E1FF800100000000
      F0FF800100000000F87F800100000000FC3F800100000000FE1F800100000000
      FF0F800100000000FF87800100000000FFC3800100000000FFE1C00300000000
      FFF0E00700000000FFF9FFFF00000000FFFFFFFFFFFFFFFFFFFFE7E7C003FC3F
      FDFFC3C38001FC3FF8FF81818001FC3FE07F80018001FC3FC03FC0038001FC3F
      800FE007800100010007F00F800100010003F00F800100010201E00780010001
      8700C0038001FC3FCF8080018001FC3FFFC081818001FC3FFFE1C3C38001FC3F
      FFF7E7E7C003FC3FFFFFFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object DSDrivers: TDataSource
    DataSet = DBForm.ADOQuery1
    Left = 328
    Top = 48
  end
  object DSDisp: TDataSource
    DataSet = DBForm.ADOQuery3
    Left = 424
    Top = 184
  end
  object DSAuto: TDataSource
    DataSet = DBForm.ADOQuery2
    Left = 24
    Top = 104
  end
  object od: TOpenDialog
    Left = 480
    Top = 160
  end
end
