unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, jpeg, ExtCtrls,
  StdCtrls, DB, Grids, DBGrids, ADODB,
  GIFImg, pngimage, Buttons;

type
  TForm1 = class(TForm)
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Image1: TImage;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    BitBtn1: TBitBtn;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure Edit3Exit(Sender: TObject);
    procedure Edit1Enter(Sender: TObject);
    procedure Edit2Enter(Sender: TObject);
    procedure Edit3Enter(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses Unit2;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  with ADOQuery1 do
  begin
    try
      Close;
      sql.Clear;
      sql.Add('SELECT * FROM tab1 WHERE �������� = '+#39+Edit3.Text+#39+' AND ������� = '+#39+Edit1.Text+#39+' AND ��� = '+#39+Edit2.Text+#39+'');
      Open;
    except
      Edit1.Text:= '�������';
      Edit2.Text:= '���';
      Edit3.Text:= '��������';
      ShowMessage('������ �� ������.');
    end;
  end;
  if DBGrid1.DataSource.DataSet.RecordCount < 1 then
  begin
    ShowMessage('������ �� ������.');
      Edit1.Text:= '�������';
      Edit2.Text:= '���';
      Edit3.Text:= '��������';
  end
  else
  begin
    Form2.Show;
    Form2.Edit11.Text:= DBGrid1.DataSource.DataSet.Fields[7].AsString;
    Form2.Edit12.Text:= DBGrid1.DataSource.DataSet.Fields[0].AsString;
    Form2.Edit13.Text:= DBGrid1.DataSource.DataSet.Fields[1].AsString;
    Form1.Hide;
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  with ADOQuery1 do
  begin
    try
      Close;
      sql.Clear;
      sql.Add('SELECT * FROM tab1 WHERE �������� = '+#39+Edit3.Text+#39+' AND ������� = '+#39+Edit1.Text+#39+' AND ��� = '+#39+Edit2.Text+#39+'');
      Open;
    except
      Edit1.Clear;
      Edit2.Clear;
      Edit3.Clear;
      ShowMessage('������ �� ������.');
    end;
  end;
  if DBGrid1.DataSource.DataSet.RecordCount < 1 then
  begin
    ShowMessage('������ �� ������.');
    Edit1.Clear;
    Edit2.Clear;
    Edit3.Clear;
  end
  else
  begin
    Form2.Show;
    Form2.Edit11.Text:= DBGrid1.DataSource.DataSet.Fields[7].AsString;
    Form2.Edit12.Text:= DBGrid1.DataSource.DataSet.Fields[0].AsString;
    Form2.Edit13.Text:= DBGrid1.DataSource.DataSet.Fields[1].AsString;
    Form1.Hide;
  end;
end;

procedure TForm1.Edit1Enter(Sender: TObject);
begin
  Edit1.Text:= '';
end;

procedure TForm1.Edit1Exit(Sender: TObject);
begin
 if Edit1.Text = '' then Edit1.Text:= '�������';
end;

procedure TForm1.Edit2Enter(Sender: TObject);
begin
    Edit2.Text:= '';
end;

procedure TForm1.Edit2Exit(Sender: TObject);
begin
  if Edit2.Text = '' then Edit2.Text:= '���';
end;

procedure TForm1.Edit3Enter(Sender: TObject);
begin
    Edit3.Text:= '';
end;

procedure TForm1.Edit3Exit(Sender: TObject);
begin
  if Edit3.Text = '' then Edit3.Text:= '��������';
end;

procedure TForm1.FormCreate(Sender: TObject);
var
s:string;
i, c:integer;
begin
  s:= GetCurrentDir;
  for i:= 0 to Length(s) do
  begin
    if (s[i] = '\') AND (s[i+1] = '�') AND (s[i+2] = '�') AND (s[i+3] = '�') then c:= i;
  end;
  Delete(s, c, Length(s));
  s:= s+'\�������������\���������� �.�\���������\db.mdb';
  ADOConnection1.ConnectionString:= s;
  ADOConnection1.Connected:= true;
  ADOQuery1.Active:= true;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  Edit1.Text:= '�������';
  Edit2.Text:= '���';
  Edit3.Text:= '��������';
end;

end.
