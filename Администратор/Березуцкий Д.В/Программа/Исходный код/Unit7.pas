unit Unit7;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, DB, ADODB, Grids,
  DBGrids, ExtCtrls, StdCtrls, ActnList,
  Buttons, ButtonGroup, DBCtrls, ExtDlgs, Menus, jpeg,
  ImgList, ComCtrls, ToolWin, ComObj;

type
  TForm7 = class(TForm)
    ComboBox1: TComboBox;
    Label11: TLabel;
    BitBtn3: TBitBtn;
    BitBtn1: TBitBtn;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    GroupBox1: TGroupBox;
    BitBtn4: TBitBtn;
    Memo1: TMemo;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    DateTimePicker1: TDateTimePicker;
    Label1: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    BitBtn7: TBitBtn;
    Memo2: TMemo;
    Button1: TButton;
    Button2: TButton;
    ADOConnection2: TADOConnection;
    ADOQuery2: TADOQuery;
    DataSource2: TDataSource;
    DBGrid2: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure Button1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form7: TForm7;

implementation

uses Unit1;

{$R *.dfm}

const UnixStartDate: TDateTime = 25569.0;

function DateTimeToUnix(ConvDate: TDateTime): Longint;
 begin
  Result := Round((ConvDate - UnixStartDate) * 86400);
 end;

function UnixToDateTime(USec: Longint): TDateTime;
begin
  Result := (Usec / 86400) + UnixStartDate;
end;

procedure TForm7.BitBtn1Click(Sender: TObject);
var
i:integer;
s:string;
id:integer;
begin
  id:= DBGrid1.DataSource.DataSet.Fields[0].AsInteger;
  if Memo2.Lines.Count < 1 then
  begin
    ShowMessage('������� �������');
    exit;
  end;
  for i:= 0 to Memo2.Lines.Count do
    s:= s+Memo2.Lines.Strings[i]+' ';
  with ADOQuery1 do
  begin
    Close;
    sql.clear;
    sql.Add('UPDATE domalg SET ������� = '+#39+s+#39+' WHERE ��� = '+IntToStr(id));
    ExecSQL;
  end;
  with ADOQuery1 do
  begin
    Close;
    sql.Clear;
    sql.Add('SELECT * FROM domalg WHERE ����� = '+Edit1.Text+' AND ����� = '+#39+Edit2.Text+#39+' AND ������� = '+IntToStr(ComboBox1.ItemIndex)+' AND ��������������� > '+IntToStr(DateTimeToUnix(Date)));
    Open;
  end;
end;

procedure TForm7.BitBtn3Click(Sender: TObject);
begin
  Memo1.Visible:= true;
  Memo1.Clear;
  BitBtn5.Visible:= true;
  BitBtn6.Visible:= true;
  BitBtn3.Visible:= false;
  DateTimePicker1.Visible:= true;
  Label1.Visible:= true;
  GroupBox1.Height:= 217;
end;

procedure TForm7.BitBtn4Click(Sender: TObject);
begin
  if DBGrid1.Visible = false then
  begin
    DBGrid1.Visible:= true;
    BitBtn1.Visible:= true;
    BitBtn4.Caption:= '������ �������';
    Button2.Visible:= true;
    Button1.Visible:= true;
    Memo2.Visible:= true;
    with ADOQuery1 do
    begin
      Close;
      sql.Clear;
      sql.Add('SELECT * FROM domalg WHERE ����� = '+Edit1.Text+' AND ����� = '+#39+Edit2.Text+#39+' AND ������� = '+IntToStr(ComboBox1.ItemIndex)+' AND ��������������� > '+IntToStr(DateTimeToUnix(Date)));
      Open;
    end;
  end
  else
  begin
    DBGrid1.Visible:= false;
    BitBtn1.Visible:= false;
    Button2.Visible:= false;
    Button1.Visible:= false;
    Memo2.Visible:= false;
    BitBtn4.Caption:= '�������� �������';
  end;
end;

procedure TForm7.BitBtn5Click(Sender: TObject);
var
i:integer;
s:string;
utime:integer;
begin
  with ADOQuery2 do
  begin
    Close;
    sql.Clear;
    sql.Add('SELECT * FROM Dostup WHERE ����� = '''+Form1.Edit11.Text+''' AND ����� = '+Edit1.Text+' AND ����� = '''+Edit2.Text+''' AND ������� = '+IntToStr(ComboBox1.ItemIndex));
    Open;
  end;
  if ADOQuery2.RecordCount < 1 then
  begin
    ShowMessage('��� �������');
    Exit;
  end;
  if Memo1.Lines.Count < 1 then
  begin
    ShowMessage('������� �������');
    exit;
  end;
  for i:= 0 to Memo1.Lines.Count do
    s:= s+Memo1.Lines.Strings[i]+' ';
  utime:= DateTimeToUnix(DateTimePicker1.Date);
  with ADOQuery1 do
  begin
    Close;
    sql.clear;
    sql.Add('INSERT INTO domalg(�������, �����, �����, ��������������, �������, ���������������) VALUES('+#39+s+#39+', '+#39+Edit1.Text+#39+', '+#39+Edit2.Text+#39+', '+#39+DateTimeToStr(DateTimePicker1.Date)+#39+', '+#39+IntToStr(ComboBox1.ItemIndex)+#39+', '+#39+IntToStr(utime)+#39+')');
    ExecSQL;
  end;
  if DBGrid1.Visible = true then
  begin
    with ADOQuery1 do
    begin
      Close;
      sql.Clear;
      sql.Add('SELECT * FROM domalg WHERE ����� = '+Edit1.Text+' AND ����� = '+#39+Edit2.Text+#39+' AND ������� = '+IntToStr(ComboBox1.ItemIndex)+' AND ��������������� > '+IntToStr(DateTimeToUnix(Date)));
      Open;
    end;
  end
end;

procedure TForm7.BitBtn6Click(Sender: TObject);
begin
  Memo1.Visible:= false;
  BitBtn5.Visible:= false;
  BitBtn6.Visible:= false;
  BitBtn3.Visible:= true;
  DateTimePicker1.Visible:= false;
  Label1.Visible:= false;
  GroupBox1.Height:= 120;
end;

procedure TForm7.BitBtn7Click(Sender: TObject);
begin
  Form7.Hide;
end;

procedure TForm7.Button1Click(Sender: TObject);
var
  ButtonSelect:Integer;
  id:integer;
begin
  id:= DBGrid1.DataSource.DataSet.Fields[0].AsInteger;
  ButtonSelect:= MessageBox(handle, PChar('�� ����� ������ �������?'),PChar('��������'), MB_ICONQUESTION+MB_YESNO+MB_DEFBUTTON2);
  if ButtonSelect = idyes then
  begin
    with ADOQuery1 do
    begin
      Close;
      sql.Clear;
      sql.Add('DELETE FROM domalg WHERE ��� = '+IntToStr(id));
      ExecSQL;
    end;
    with ADOQuery1 do
    begin
      Close;
      sql.Clear;
      sql.Add('SELECT * FROM domalg WHERE ����� = '+Edit1.Text+' AND ����� = '+#39+Edit2.Text+#39+' AND ������� = '+IntToStr(ComboBox1.ItemIndex)+'  AND ��������������� > '+IntToStr(DateTimeToUnix(Date)));
      Open;
    end;
  end;
end;

procedure TForm7.Button2Click(Sender: TObject);
begin
  if Button2.Caption = '�������� ������������ �������' then
  begin
    with ADOQuery1 do
    begin
      Close;
      sql.Clear;
      sql.Add('SELECT * FROM domalg WHERE ����� = '+Edit1.Text+' AND ����� = '+#39+Edit2.Text+#39+' AND ������� = '+IntToStr(ComboBox1.ItemIndex)+' AND ��������������� < '+IntToStr(DateTimeToUnix(Date)));
      Open;
    end;
    Button2.Caption:= '�������� �������� �������';
  end
  else
  begin
    with ADOQuery1 do
    begin
      Close;
      sql.Clear;
      sql.Add('SELECT * FROM domalg WHERE ����� = '+Edit1.Text+' AND ����� = '+#39+Edit2.Text+#39+' AND ������� = '+IntToStr(ComboBox1.ItemIndex)+' AND ��������������� > '+IntToStr(DateTimeToUnix(Date)));
      Open;
    end;
    Button2.Caption:= '�������� ������������ �������';
  end;
end;

procedure TForm7.ComboBox1Change(Sender: TObject);
begin
  if DBGrid1.Visible = true then
  begin
    with ADOQuery1 do
    begin
      Close;
      sql.Clear;
      sql.Add('SELECT * FROM domalg WHERE ����� = '+Edit1.Text+' AND ����� = '+#39+Edit2.Text+#39+' AND ������� = '+IntToStr(ComboBox1.ItemIndex)+'  AND ��������������� > '+IntToStr(DateTimeToUnix(Date)));
      Open;
    end;
  end
end;

procedure TForm7.DataSource1DataChange(Sender: TObject; Field: TField);
begin
  Memo2.Lines.Clear;
  Memo2.Lines.Add(DBGrid1.DataSource.DataSet.Fields[1].AsString);
end;

procedure TForm7.FormCreate(Sender: TObject);
begin
  ADOQuery1.Active:= false;
  ADOQuery2.Active:= false;
  ADOConnection1.Connected:= false;
  ADOConnection1.ConnectionString:= GetCurrentDir+'\db.mdb';
  ADOConnection1.Connected:= true;
  ADOQuery1.Active:= true;
  ADOConnection2.Connected:= false;
  ADOConnection2.ConnectionString:= GetCurrentDir+'\db.mdb';
  ADOConnection2.Connected:= true;
  ADOQuery2.Active:= true;
end;

procedure TForm7.FormShow(Sender: TObject);
begin
  Memo1.Visible:= false;
  BitBtn5.Visible:= false;
  BitBtn6.Visible:= false;
  BitBtn3.Visible:= true;
  Button1.Visible:= false;
  DateTimePicker1.Visible:= false;
  Label1.Visible:= false;
  GroupBox1.Height:= 120;
  DBGrid1.Visible:= false;
  BitBtn1.Visible:= false;
  Button2.Visible:= false;
  Memo2.Visible:= false;
  BitBtn4.Caption:= '�������� �������';
end;

end.
