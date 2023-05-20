//Работа с БД: чтение и сохранение параметров соединения с БД,
//соединение с БД,
//добавление, редактирование и удаление записей путевых листов
//проверка наличия повторных занисей  в таблице путевых листов
//

unit DB;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, IniFiles, cxClasses, dxServerModeData,
  dxServerModeDBXDataSource, dxServerModeADODataSource, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinBasic, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkroom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinOffice2019Black, dxSkinOffice2019Colorful,
  dxSkinOffice2019DarkGray, dxSkinOffice2019White, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringtime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinTheBezier, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxDBEdit, cxLabel;

type
  TDBForm = class(TForm)
    eServer: TLabeledEdit;
    eLogin: TLabeledEdit;
    ePass: TLabeledEdit;
    BitBtn1: TBitBtn;
    ADOConnection: TADOConnection;
    BitBtn2: TBitBtn;
    cxLabel1: TcxLabel;
    ADOQuery1: TADOQuery;
    eDBName: TcxComboBox;
    DSGuides: TdxServerModeADODataSource;
    ADOQuery2: TADOQuery;
    ADOQuery3: TADOQuery;
    InsUpdQuery: TADOQuery;
    MainQuery: TADOQuery;
    DSAuto: TdxServerModeADODataSource;

    //Инициализация параметрорв соединения
    procedure Initialize;
    //Соединение с БД
    procedure Connect;
    // Проверка соединения с БД
    procedure BitBtn1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    //Сохранение параметров соединения в ini-файле
    procedure BitBtn2Click(Sender: TObject);
    //поставить пометку удаленного путевого листа
    procedure MarkDelRec(ListNumber:integer);
    //обновление путевого листа
    procedure UpdateRec(dep,arr: TDateTime; drv:Integer;
                 auto:string; cons, mil: Real; disp, ListNumber:integer);
    //Вставка записи в список путевых листов
    procedure InsertRec(dep,arr: TDateTime; drv:Integer;
                 auto:string; cons, mil: Real; disp:integer);
    //Проверка записи в списке путевых листов
    function ConfirmRec(dep,arr: TDateTime; drv:Integer;
                 auto:string; cons, mil: Real; disp:integer):Boolean;
  private
    { Private declarations }
  public
    { Public declarations }
    //Параметры подключения
    Host:string;
    dbname:string;
    login:string;
    password:string;
  end;

var
  DBForm: TDBForm;

implementation

{$R *.dfm}
// Эаполнение списка выбора для TcxCustomComboBox
procedure AddItems(DS:TADOQuery; FLD:TcxCustomComboBox ;FieldName:string);
begin
  DS.Active:=false;
  DS.Open;
  DS.First;
  FLD.Properties.Items.BeginUpdate;
  while not DS.Eof do
      begin
       FLD.Properties.Items.Add(DS.FieldByName(FieldName).AsString) ;
       DS.Next;
      end;
  FLD.Properties.Items.EndUpdate;
end;

//Инициализация параметрорв соединения
procedure TDBForm.Initialize;
  var ini: TIniFile;
begin
   Ini:=TiniFile.Create(extractfilepath(paramstr(0))+'Setting.ini');
   Host:= ini.ReadString('SQLProperties','Server','127.0.0.1');
   dbName:= ini.ReadString('SQLProperties','DBName','ATP');
   Login:= ini.ReadString('SQLProperties','login','sa');
   Password:=ini.ReadString('SQLProperties','password','Aa123456');
end;
// Проверка соединения с БД
procedure TDBForm.BitBtn1Click(Sender: TObject);
begin
DBName:='master';
Connect;
ADOConnection.Connected.ToString(true);
MessageDlg('Успешно', mtInformation, [mbOK], -1);
end;

//Сохранение параметров соединения в ini-файле
procedure TDBForm.BitBtn2Click(Sender: TObject);
var ini: TIniFile;
begin
   Ini:=TiniFile.Create(extractfilepath(paramstr(0))+'Setting.ini');
   ini.WriteString('SQLProperties','Server',eServer.Text);
   ini.WriteString('SQLProperties','DBName',eDBName.Text);
   ini.WriteString('SQLProperties','login',eLogin.Text);
   ini.WriteString('SQLProperties','password',ePass.Text);

end;

//Соединение с БД
procedure TDBForm.Connect;
var    AConnectionString:string;
begin
ADOConnection.Connected := False;
  ADOConnection.Provider := 'SQLOLEDB.1';
  ADOConnection.LoginPrompt := False;
  AConnectionString := Format('Provider=SQLOLEDB.1;Data Source=%s;Initial Catalog=%s', [host, DBName]);
  ADOConnection.ConnectionString := AConnectionString +
      Format(';User ID=%s;Password=%s;Persist Security Info=False', [login, password]);
  ADOConnection.Connected := True;
end;

procedure TDBForm.FormActivate(Sender: TObject);
begin
   ADOQuery1.SQL.Text:='select name from sys.databases';
   AddItems(ADOQuery1,eDBName,'name');
   eServer.Text:= Host;
   eDBName.Text := DBName;
   eLogin.Text:= Login;
   ePass.Text:=Password;
end;

//Вставка записи в список путевых листов
procedure  TDBForm.InsertRec(dep,arr: TDateTime; drv:Integer;
                 auto:string; cons, mil: Real; disp:integer);
begin
  InsUpdQuery.Active:=false;
  try
      InsUpdQuery.Parameters.Clear;
      InsUpdQuery.SQL.Text:= 'insert into WAYBILLS '+
                '(DEPARTURE, ARRIVAL, DRIVER, AUTO,CONSUMPTION,MILEAGE, DISPATCHER,DELETED) '+
                'values (' +
                'cast(:dep as DateTime),' +
                'cast(:arr as Time),' +
                ':drv,:auto,:cons, :mil,'+
                ':disp, ''N'')';
      InsUpdQuery.Parameters.ParamByName('dep').Value:= dep;
      InsUpdQuery.Parameters.ParamByName('arr').Value:= arr;
      InsUpdQuery.Parameters.ParamByName('drv').Value:= drv;
      InsUpdQuery.Parameters.ParamByName('auto').Value:= auto;
      InsUpdQuery.Parameters.ParamByName('cons').Value:= cons;
      InsUpdQuery.Parameters.ParamByName('mil').Value:=  mil;
      InsUpdQuery.Parameters.ParamByName('disp').Value:=  disp;
      InsUpdQuery.ExecSQL;
      MessageDlg('Успешно', mtInformation, [mbOK], -1);
  except
      MessageDlg('Запись не сохранена', mtWarning, [mbOK], -1);
  end;
end;

//поставить пометку удаленного путевого листа
procedure TDBForm.MarkDelRec(ListNumber:integer);
begin
  InsUpdQuery.Active:=false;
  try
      InsUpdQuery.Parameters.Clear;
      InsUpdQuery.SQL.Text:= 'UPDATE WAYBILLS '+
                'SET DELETED = ''Y'' '+
                'WHERE id= :ListNumber';
      InsUpdQuery.Parameters.ParamByName('ListNumber').Value:=  ListNumber;
      InsUpdQuery.ExecSQL;
      MessageDlg('Успешно', mtInformation, [mbOK], -1);
  except
      MessageDlg('Запись не сохранена', mtWarning, [mbOK], -1);
  end;
end;
//обновление путевого листа
procedure TDBForm.UpdateRec(dep,arr: TDateTime; drv:Integer;
                 auto:string; cons, mil: Real; disp, ListNumber:integer);
begin
  InsUpdQuery.Active:=false;
  try
      InsUpdQuery.SQL.Text:= 'UPDATE WAYBILLS '+
                'SET DEPARTURE = cast(:dep as DateTime),'+
                'ARRIVAL = cast(:arr as Time),'+
                'DRIVER = :drv,'+
                'AUTO = :auto,'+
                'CONSUMPTION = :cons,'+
                'MILEAGE = :mil,'+
                'DISPATCHER = :disp '+
                'WHERE id= :ListNumber';
      InsUpdQuery.Parameters.ParamByName('dep').Value:= dep;
      InsUpdQuery.Parameters.ParamByName('arr').Value:= arr;
      InsUpdQuery.Parameters.ParamByName('drv').Value:= drv;
      InsUpdQuery.Parameters.ParamByName('auto').Value:= auto;
      InsUpdQuery.Parameters.ParamByName('cons').Value:= cons;
      InsUpdQuery.Parameters.ParamByName('mil').Value:=  mil;
      InsUpdQuery.Parameters.ParamByName('disp').Value:=  disp;
      InsUpdQuery.Parameters.ParamByName('ListNumber').Value:=  ListNumber;
      InsUpdQuery.ExecSQL;
      MessageDlg('Успешно', mtInformation, [mbOK], -1);
  except
      MessageDlg('Запись не сохранена', mtWarning, [mbOK], -1);
  end;
end;

//Проверка записи в списке путевых листов
function  TDBForm.ConfirmRec(dep,arr: TDateTime; drv:Integer;
                 auto:string; cons, mil: Real; disp:integer):Boolean;
var n:integer;
begin
      InsUpdQuery.Active:=false;
      n:=0;
      InsUpdQuery.SQL.Text:= 'select count(id) from WAYBILLS '+
                'where DEPARTURE = cast(:dep as DateTime) and '+
                'ARRIVAL = cast(:arr as Time) and '+
                'DRIVER = :drv and '+
                'AUTO = :auto and '+
                '(CONSUMPTION = :cons or CONSUMPTION is null) and '+
                '(MILEAGE = :mil or MILEAGE is null) and '+
                'DISPATCHER = :disp and deleted is null';
      InsUpdQuery.Parameters.ParamByName('dep').Value:= dep;
      InsUpdQuery.Parameters.ParamByName('arr').Value:= arr;
      InsUpdQuery.Parameters.ParamByName('drv').Value:= drv;
      InsUpdQuery.Parameters.ParamByName('auto').Value:= auto;
      InsUpdQuery.Parameters.ParamByName('cons').Value:= cons;
      InsUpdQuery.Parameters.ParamByName('mil').Value:=  mil;
      InsUpdQuery.Parameters.ParamByName('disp').Value:=  disp;
      InsUpdQuery.Open;
      if not InsUpdQuery.Eof then
        n := InsUpdQuery.Fields[0].AsInteger;
      if n  =0 then
        Result:=true
      else
      begin
        MessageDlg('Запись не сохранена', mtWarning, [mbOK], -1);
        Result:=false;
      end;
end;

end.
