unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinBasic, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkroom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinOffice2019Black, dxSkinOffice2019Colorful, dxSkinOffice2019DarkGray,
  dxSkinOffice2019White, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringtime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinTheBezier,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, dxNavBar, dxBarBuiltInMenu,
  dxNavBarOfficeNavigationBar, Vcl.Menus, Vcl.ComCtrls, Vcl.ToolWin, IniFiles,
  cxClasses, cxCustomData, cxStyles, cxEdit, cxCustomPivotGrid, cxDBPivotGrid,
  cxNavigator, cxDBNavigator, cxFilter, cxData, cxDataStorage, dxDateRanges,
  dxScrollbarAnnotations, Data.DB, cxDBData, cxGridLevel, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, cxCalendar,
  cxSpinEdit, cxImageComboBox, cxCheckBox, cxGridBandedTableView,
  cxGridServerModeBandedTableView, cxGridServerModeTableView, cxTextEdit,
  Vcl.ExtCtrls, cxFilterControl, cxDBFilterControl, Vcl.StdCtrls;

type
  TATP = class(TForm)
    ToolBar1: TToolBar;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    TableView: TcxGridDBTableView;
    MainGridLevel1: TcxGridLevel;
    MainGrid: TcxGrid;
    ListId: TcxGridDBColumn;
    TableViewColumn2: TcxGridDBColumn;
    TableViewColumn3: TcxGridDBColumn;
    TableViewColumn4: TcxGridDBColumn;
    TableViewColumn5: TcxGridDBColumn;
    TableViewColumn6: TcxGridDBColumn;
    TableViewColumn7: TcxGridDBColumn;
    TableViewColumn8: TcxGridDBColumn;
    TableViewColumn9: TcxGridDBColumn;
    DataSource1: TDataSource;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    CheckBox1: TCheckBox;
    TableViewColumn1: TcxGridDBColumn;
    TableViewColumn10: TcxGridDBColumn;
    procedure N2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure TableViewCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure CheckBox1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ATP: TATP;

implementation
uses DB, Guides, Auto, AddRecord, uOffice;

{$R *.dfm}

procedure TATP.Button2Click(Sender: TObject);
begin
ShowMessage(IntToStr(ListId.EditValue));
end;

procedure TATP.CheckBox1Click(Sender: TObject);

begin
  DBForm.MainQuery.Filtered:=not CheckBox1.Checked;
end;

procedure TATP.FormShow(Sender: TObject);

begin
  //��������� ��������� ���������� � �� � ����������� � ���
  DBForm.Initialize;
  DBForm.Connect;
  DBForm.MainQuery.Open;
end;

//��������� ���������� � ��
procedure TATP.N2Click(Sender: TObject);
begin
   DBForm.ShowModal;
end;

//���������� ����������� ����������
procedure TATP.N4Click(Sender: TObject);
begin
  DBForm.DSGuides.Active:=false;
  DBForm.DSGuides.KeyFieldNames:='id';
  DBForm.DSGuides.TableName:='dispatcher';
  DBForm.DSGuides.Active:=true;
  GuidesForm.Caption:='����������';
  GuidesForm.fldOther.Visible:=false;
  GuidesForm.fldName.Caption:='������� ��� ��������';
  GuidesForm.fldName.DataBinding.FieldName:='fio';
  GuidesForm.ShowModal;
  DBForm.DSGuides.Active:=false;
end;

//���������� ����������� ��������
procedure TATP.N5Click(Sender: TObject);
begin
  DBForm.DSGuides.Active:=false;
  DBForm.DSGuides.KeyFieldNames:='id';
  DBForm.DSGuides.TableName:='drivers';
  DBForm.DSGuides.Active:=true;
  GuidesForm.Caption:='��������';
  GuidesForm.fldOther.Visible:=true;
  GuidesForm.fldOther.DataBinding.FieldName:='birth';
  GuidesForm.fldOther.Caption:='���� ��������';
  GuidesForm.fldName.Caption:='������� ��� ��������';
  GuidesForm.fldName.DataBinding.FieldName:='fio';
  GuidesForm.ShowModal;
  DBForm.DSGuides.Active:=false;
end;

//���������� ����������� ������ ����
procedure TATP.N6Click(Sender: TObject);
begin
  DBForm.DSGuides.Active:=false;
  DBForm.DSGuides.KeyFieldNames:='id';
  DBForm.DSGuides.TableName:='automodels';
  DBForm.DSGuides.Active:=true;
  GuidesForm.Caption:='������ ����';
  GuidesForm.fldOther.Visible:=false;
  GuidesForm.fldName.Caption:='�������� ������';
  GuidesForm.fldName.DataBinding.FieldName:='name';
  GuidesForm.ShowModal;
  DBForm.DSGuides.Active:=false;
end;

//���������� ����������� ����������
procedure TATP.N8Click(Sender: TObject);
begin
  DBForm.DSAuto.Active:=false;
  DBForm.DSAuto.KeyFieldNames:='regnum';
  DBForm.DSAuto.TableName:='auto';
  DBForm.DSAuto.Active:=true;
  AutoForm.Initialize;
  AutoForm.ShowModal;
  DBForm.DSAuto.Active:=false;
end;

//�������� ������� ��������� ������
procedure TATP.TableViewCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
begin
  if (AViewInfo.GridRecord.Values[8])='Y' then
  begin
    ACanvas.Brush.Color := clRed;
    ACanvas.Font.Style := [fsBold];
  end;
end;

//���������� �������� �����
procedure TATP.ToolButton1Click(Sender: TObject);
var r,f: integer;
begin
  //���������� �����
  r := TableView.Controller.TopRowIndex;
  f := TableView.Controller.FocusedRecordIndex;
  //�������� ���� ���������� ������
  AddRec.ShowModal;
  // ��� ���������-��������� ����(���������� �������)
  DBForm.MainQuery.Close;
  DBForm.MainQuery.Open;
  //������������ �� ����������� ������
  TableView.BeginUpdate();
  TableView.Controller.TopRowIndex := r;
  TableView.Controller.FocusedRecordIndex:= f;
  TableView.EndUpdate;

end;
//�������������� �������� �����
procedure TATP.ToolButton2Click(Sender: TObject);
var r,f: integer;
begin
  //���������� �����
  r := TableView.Controller.TopRowIndex;
  f := TableView.Controller.FocusedRecordIndex;
  //��������� ��������� �������� �����
  AddRec.ListNumber:= TableView.Columns[0].EditValue;
  AddRec.ListNumberText.Caption:='������� ���� �'+VarToStr(TableView.Columns[0].EditValue);
  AddRec.eDateBegin.EditValue:=TableView.Columns[1].EditValue;
  AddRec.eTimeBegin.EditValue:=TableView.Columns[1].EditValue;
  AddRec.eTimeEnd.EditValue:=TableView.Columns[2].EditValue;
  AddRec.eDriver.EditValue:=TableView.Columns[9].EditValue;
  AddRec.eAuto.EditValue:=TableView.Columns[4].EditValue;
  AddRec.eCons.EditValue:=TableView.Columns[5].EditValue;
  AddRec.eMil.EditValue:=TableView.Columns[6].EditValue;
  AddRec.eDisp.EditValue:=TableView.Columns[10].EditValue;
  //�������� ���� ���������� ������
  AddRec.ShowModal;
  // ��� ���������-��������� ����(���������� �������)
  DBForm.MainQuery.Close;
  DBForm.MainQuery.Open;
  //������������ �� ����������� ������
  TableView.BeginUpdate();
  TableView.Controller.TopRowIndex := r;
  TableView.Controller.FocusedRecordIndex:= f;
  TableView.EndUpdate;
end;
//�������� � Exel
procedure TATP.ToolButton3Click(Sender: TObject);
begin
  //
  ExportExel (TableView);
end;
//�������� �������� �����
procedure TATP.ToolButton4Click(Sender: TObject);
var r,f: integer;
begin
  //���������� �����
  r := TableView.Controller.TopRowIndex;
  f := TableView.Controller.FocusedRecordIndex;
  //�������� ������ �� ��������
  DBForm.MarkDelRec(TableView.Columns[0].EditValue);
  // ��� ���������-��������� ����(���������� �������)
  DBForm.MainQuery.Close;
  DBForm.MainQuery.Open;
  //������������ �� ����������� ������
  TableView.BeginUpdate();
  TableView.Controller.TopRowIndex := r-1;
  TableView.Controller.FocusedRecordIndex:= f-1;
  TableView.EndUpdate;
end;

end.
