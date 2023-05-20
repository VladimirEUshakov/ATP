//Модуль работы с Офисом
unit uOffice;

interface
uses  System.Generics.Collections, Vcl.Dialogs, Classes, Vcl.Forms, System.SysUtils,
System.Win.ComObj, cxGridDBTableView, Winapi.Messages,System.Variants;

//Функция записывает новый текст для закладки с именем aBmName.
//Функция возвращает значение True, если закладка найдена и её текст изменён
//и False - если закладка не найдена.
//Переустановка текста закладки выплоняется так:
//- Получаем ссылку на объект-диапазон, который содержит текст закладки.
//- Удаляем закладку.
//- Устанавливаем новый текст для объекта-диапазона.
//- Создаём новую закладку с диапазоном, который содержит новый текст.
function SetBmText(var aBms : Variant; const aBmName, aText : String) : Boolean;

//Процедура открывает диалог выбора шаблона Word и записывает в
//закладки переданный текст.
//Закладки и соответствующий им текст передаются в словаре
procedure AddInWordTempl(Dict:TDictionary<string, string>; Sender: TObject);

//Экспорт таблицы в Exel.
//
procedure ExportExel(TableView:TcxGridDBTableView);


implementation

function SetBmText(var aBms : Variant; const aBmName, aText : String) : Boolean;
var Bm, Rng : Variant;
begin
  //Проверяем - существует ли закладка с заданным именем.
  Result := aBms.Exists(aBmName);
  //Если закладка не найдена - выходим.
  if not Result then Exit;

  //Ссылка на закладку.
  Bm := aBms.Item(aBmName);
  //Ссылка на диапазон, связанный с закладкой.
  Rng := Bm.Range;
  //Удаление закладки.
  Bm.Delete;
  //Заменяем текст в диапазоне.
  Rng.Text := aText;
  //Добавляем новую закладку с таким же именем.
  aBms.Add(aBmName, Rng);
end;


procedure AddInWordTempl(Dict:TDictionary<string, string>; Sender: TObject);
var od:TOpenDialog;
  wdApp, wdDocs, wdDoc, wdBms : Variant;
    key: string;
begin
  od:= TOpenDialog.Create(Sender As Tcomponent);
  Od.InitialDir := ExtractFilePath( Application.ExeName );
  Od.Title := 'Выберите шаблон, на основе которого будет создан новый документ';
  if not Od.Execute then Exit;
  if not FileExists(Od.FileName) then begin
    MessageDlg(
      'Файл с заданным именем не найден. Действие отменено.'
      ,mtWarning, [mbOK], 0
    );
    Exit;
  end;
  try
    wdApp := CreateOleObject('Word.Application');
  except
    ShowMessage('Не удалось запустить MS Word. Действие отменено.');
    Exit;
  end;

  //Делаем видимым окно MS Word.
  wdApp.Visible := True;
  //Ссылка на коллекцию документов.
  wdDocs := wdApp.Documents;
  //Попытка открыть выбранный файл.
  wdDoc := wdDocs.Open(FileName:=Od.FileName);
  //Подключаемся к коллекции закладок.
  wdBms := wdDoc.Bookmarks;
  //Ищем закладки с нужными именами и изменяем их текст, в соответствие
  //с данными, введёнными на форме.
  for key in Dict.Keys do
    SetBmText(wdBms, key, dict[key]);
end;


procedure ExportExel(TableView:TcxGridDBTableView);
var i,j:integer;
FData: Variant;
ExApp, ExBook, ExSheet, Range: Variant;
begin
  //создаем вариантный массив
  FData:=
    VarArrayCreate([1,TableView.DataController.FilteredRecordCount+1,1,TableView.ColumnCount-3],varVariant);

   //Заполняем заголовки
   for I := 1 to VarArrayHighBound(FData,2) do
    FData[1,i]:=TableView.Columns[i-1].Caption;

  //заполняем массив данными из TableView
  for i:=2 to VarArrayHighBound(FData,1) do
    for j:=1 to VarArrayHighBound(FData,2) do
      FData[i,j]:=TableView.DataController.Values[TableView.DataController.FilteredRecordIndex[i-2],j-1];

  ExApp := CreateOleObject('Excel.Application');
  ExApp.Application.EnableEvents:=True;
 // ExApp.Visible:=True;
  //Создание рабочей книги.
  ExBook := ExApp.WorkBooks.Add;
  //Первый лист в рабочей книге.
  ExSheet := ExBook.WorkSheets[1];
  ExSheet.Name := 'Внешние данные';
  ExSheet.Activate;

  Range:=ExSheet.Range[ExSheet.Cells[1,1],ExSheet.Cells[VarArrayHighBound(FData,1),VarArrayHighBound(FData,2)]];
  //вставляем данные
  Range.Value:=FData;
  //показываем окно Excel
  ExApp.Visible:=True;

  {
  for I:=0 to TableView.DataController.FilteredRecordCount - 1 do
  for j := 0 to TableView.ColumnCount-1 do
  begin
    Range:=ExSheet.Range[ExSheet.Cells[1,1]] ;
    //Cell:= ExSheet.Cells[i,j];
    Range.Value := '1';
    //
  end;  }
end;
end.
