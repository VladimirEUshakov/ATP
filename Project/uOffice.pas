//������ ������ � ������
unit uOffice;

interface
uses  System.Generics.Collections, Vcl.Dialogs, Classes, Vcl.Forms, System.SysUtils,
System.Win.ComObj, cxGridDBTableView, Winapi.Messages,System.Variants;

//������� ���������� ����� ����� ��� �������� � ������ aBmName.
//������� ���������� �������� True, ���� �������� ������� � � ����� ������
//� False - ���� �������� �� �������.
//������������� ������ �������� ����������� ���:
//- �������� ������ �� ������-��������, ������� �������� ����� ��������.
//- ������� ��������.
//- ������������� ����� ����� ��� �������-���������.
//- ������ ����� �������� � ����������, ������� �������� ����� �����.
function SetBmText(var aBms : Variant; const aBmName, aText : String) : Boolean;

//��������� ��������� ������ ������ ������� Word � ���������� �
//�������� ���������� �����.
//�������� � ��������������� �� ����� ���������� � �������
procedure AddInWordTempl(Dict:TDictionary<string, string>; Sender: TObject);

//������� ������� � Exel.
//
procedure ExportExel(TableView:TcxGridDBTableView);


implementation

function SetBmText(var aBms : Variant; const aBmName, aText : String) : Boolean;
var Bm, Rng : Variant;
begin
  //��������� - ���������� �� �������� � �������� ������.
  Result := aBms.Exists(aBmName);
  //���� �������� �� ������� - �������.
  if not Result then Exit;

  //������ �� ��������.
  Bm := aBms.Item(aBmName);
  //������ �� ��������, ��������� � ���������.
  Rng := Bm.Range;
  //�������� ��������.
  Bm.Delete;
  //�������� ����� � ���������.
  Rng.Text := aText;
  //��������� ����� �������� � ����� �� ������.
  aBms.Add(aBmName, Rng);
end;


procedure AddInWordTempl(Dict:TDictionary<string, string>; Sender: TObject);
var od:TOpenDialog;
  wdApp, wdDocs, wdDoc, wdBms : Variant;
    key: string;
begin
  od:= TOpenDialog.Create(Sender As Tcomponent);
  Od.InitialDir := ExtractFilePath( Application.ExeName );
  Od.Title := '�������� ������, �� ������ �������� ����� ������ ����� ��������';
  if not Od.Execute then Exit;
  if not FileExists(Od.FileName) then begin
    MessageDlg(
      '���� � �������� ������ �� ������. �������� ��������.'
      ,mtWarning, [mbOK], 0
    );
    Exit;
  end;
  try
    wdApp := CreateOleObject('Word.Application');
  except
    ShowMessage('�� ������� ��������� MS Word. �������� ��������.');
    Exit;
  end;

  //������ ������� ���� MS Word.
  wdApp.Visible := True;
  //������ �� ��������� ����������.
  wdDocs := wdApp.Documents;
  //������� ������� ��������� ����.
  wdDoc := wdDocs.Open(FileName:=Od.FileName);
  //������������ � ��������� ��������.
  wdBms := wdDoc.Bookmarks;
  //���� �������� � ������� ������� � �������� �� �����, � ������������
  //� �������, ��������� �� �����.
  for key in Dict.Keys do
    SetBmText(wdBms, key, dict[key]);
end;


procedure ExportExel(TableView:TcxGridDBTableView);
var i,j:integer;
FData: Variant;
ExApp, ExBook, ExSheet, Range: Variant;
begin
  //������� ���������� ������
  FData:=
    VarArrayCreate([1,TableView.DataController.FilteredRecordCount+1,1,TableView.ColumnCount-3],varVariant);

   //��������� ���������
   for I := 1 to VarArrayHighBound(FData,2) do
    FData[1,i]:=TableView.Columns[i-1].Caption;

  //��������� ������ ������� �� TableView
  for i:=2 to VarArrayHighBound(FData,1) do
    for j:=1 to VarArrayHighBound(FData,2) do
      FData[i,j]:=TableView.DataController.Values[TableView.DataController.FilteredRecordIndex[i-2],j-1];

  ExApp := CreateOleObject('Excel.Application');
  ExApp.Application.EnableEvents:=True;
 // ExApp.Visible:=True;
  //�������� ������� �����.
  ExBook := ExApp.WorkBooks.Add;
  //������ ���� � ������� �����.
  ExSheet := ExBook.WorkSheets[1];
  ExSheet.Name := '������� ������';
  ExSheet.Activate;

  Range:=ExSheet.Range[ExSheet.Cells[1,1],ExSheet.Cells[VarArrayHighBound(FData,1),VarArrayHighBound(FData,2)]];
  //��������� ������
  Range.Value:=FData;
  //���������� ���� Excel
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
