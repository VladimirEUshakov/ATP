//Добавление, удаление и изменение записей в таблице путевых листов
unit AddRecord;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.ToolWin,
  System.ImageList, Vcl.ImgList, Vcl.StdCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxCore,
  cxDateUtils, dxSkinsCore, dxSkinBasic, dxSkinBlack, dxSkinBlue,
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
  dxSkinWhiteprint, dxSkinXmas2008Blue, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxLabel, cxSpinEdit, cxTimeEdit, Data.DB, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, cxCurrencyEdit, cxCalc, Data.Win.ADODB, StrUtils,
  System.Generics.Collections;

type
  TAddRec = class(TForm)
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ImageList1: TImageList;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ListNumberText: TStaticText;
    eDateBegin: TcxDateEdit;
    eTimeBegin: TcxTimeEdit;
    eTimeEnd: TcxTimeEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    eDriver: TcxLookupComboBox;
    cxLabel6: TcxLabel;
    DSDrivers: TDataSource;
    DSDisp: TDataSource;
    eAuto: TcxLookupComboBox;
    cxLabel7: TcxLabel;
    DSAuto: TDataSource;
    eDisp: TcxLookupComboBox;
    cxLabel8: TcxLabel;
    eCons: TcxCurrencyEdit;
    cxLabel9: TcxLabel;
    cxLabel10: TcxLabel;
    eMil: TcxCurrencyEdit;
    od: TOpenDialog;
    procedure FormActivate(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
  private
    { Private declarations }
    //Заполнение параметров
    procedure ParametersFill;
  public
    { Public declarations }
    //Параметры для запросов на изменение и добавление путевого листа в БД
    ListNumber:integer;
    dep,arr: TDateTime;
    drv:Integer;
    auto:string;
    cons, mil: Real;
    disp:integer;
  end;

var
  AddRec: TAddRec;

implementation
 uses DB, uOffice;

{$R *.dfm}

procedure TAddRec.FormActivate(Sender: TObject);
begin
  //Списки LookupComboBox-ов
  DBForm.ADOQuery1.SQL.Text:='select id,fio from drivers';
  DBForm.ADOQuery1.Active:=false;
  DBForm.ADOQuery1.Open;
  DBForm.ADOQuery2.SQL.Text:='select regnum, name from auto	join AUTOMODELS on AUTOMODELS.id=auto.model';
  DBForm.ADOQuery2.Active:=false;
  DBForm.ADOQuery2.Open;
  DBForm.ADOQuery3.SQL.Text:='select id,fio from dispatcher';
  DBForm.ADOQuery3.Active:=false;
  DBForm.ADOQuery3.Open;
end;

procedure TAddRec.ToolButton1Click(Sender: TObject);
begin
  ParametersFill;
  if DBForm.ConfirmRec(dep,arr,drv,auto,cons,mil,disp) then
    if ListNumber=0 then //Новая запись, номера путевого листа нет, будет присвоен БД
      DBForm.InsertRec(dep,arr,drv,auto,cons,mil,disp)
    else  //изменяем запись в БД
      DBForm.UpdateRec(dep,arr,drv,auto,cons,mil,disp,ListNumber);
end;

procedure TAddRec.ToolButton2Click(Sender: TObject);
begin
  DBForm.MarkDelRec(ListNumber);
end;

//Экспорт в закладки шаблона Word
procedure TAddRec.ToolButton4Click(Sender: TObject);
var
  dic: TDictionary<string, string>;
begin
  //Заполняем словарь Закладка-Текст
  dic := TDictionary<string, string>.Create;
  dic.Add('ListN', IntToStr(ListNumber));
  dic.Add('DateBegin',eDateBegin.Text + ' ' +eTimeBegin.Text);
  dic.Add('TimeEnd',eTimeEnd.Text);
  dic.Add('Driver',eDriver.Text);
  dic.Add('Auto',eAuto.Text);
  dic.Add('Cons',eCons.Text);
  dic.Add('Mil',eMil.Text);
  dic.Add('Disp',eDisp.Text);
  //
  //Заполняем закладки шаблона Word
  AddInWordTempl(dic,Self);
end;

//Заполнение параметров для запросов на добавление и изменение записи в БД
procedure TAddRec.ParametersFill;
begin
  dep:= StrToDateTime(eDateBegin.Text + ' ' +eTimeBegin.Text);
  arr:= StrToTime(eTimeEnd.Text);
  drv:= StrToInt(VarToStr(eDriver.EditValue));
  auto:= VarToStr(eAuto.EditValue);
  cons:= StrToFloatDef(VarToStrDef(eCons.EditValue,''),0);
  mil:= StrToFloatDef(VarToStrDef(eMil.EditValue,''),0);
  disp :=StrToInt(VarToStr(eDisp.EditValue));
end;
end.
