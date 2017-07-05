unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, DB, ADODB, Grids,
  DBGrids, ExtCtrls, StdCtrls, ActnList,
  Buttons, ButtonGroup, DBCtrls, ExtDlgs, Menus, jpeg,
  ImgList, ComCtrls, ToolWin, ComObj;

type
  TForm4 = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox4: TGroupBox;
    Label8: TLabel;
    Label10: TLabel;
    Label1: TLabel;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    BitBtn4: TBitBtn;
    BitBtn2: TBitBtn;
    GroupBox3: TGroupBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    BitBtn6: TBitBtn;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure Edit1Click(Sender: TObject);
    procedure Edit2Click(Sender: TObject);
    procedure Edit3Click(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure Edit3Exit(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.dfm}

uses Unit1;

procedure TForm4.BitBtn2Click(Sender: TObject);
begin
  Form4.Close;
end;

procedure TForm4.BitBtn4Click(Sender: TObject);
var
query:string;
param:array[1..7] of string;
begin
  query:= ' ';
  if (Edit1.Text <> '') AND (Edit1.Text <> '�������') then
  begin
    if query <> ' ' then query:= query+' AND ������� = '''+Edit1.Text+''''
    else query:= query+'������� = '''+Edit1.Text+'''';
  end;
    if (Edit2.Text <> '') AND (Edit2.Text <> '���') then
  begin
    if query <> ' ' then query:= query+' AND ��� = '''+Edit2.Text+''''
    else query:= query+'��� = '''+Edit2.Text+'''';
  end;
      if (Edit3.Text <> '') AND (Edit3.Text <> '��������') then
  begin
    if query <> ' ' then query:= query+' AND �������� = '''+Edit3.Text+''''
    else query:= query+'�������� = '''+Edit3.Text+'''';
  end;
  if ComboBox1.Text <> '' then
  begin
    if query <> ' ' then query:= query+' AND ����� = '''+ComboBox1.Text+''''
    else query:= query+'����� = '''+ComboBox1.Text+'''';
  end;
  if ComboBox2.Text <> '' then
  begin
    if query <> ' ' then query:= query+' AND ��� =  '''+ComboBox2.Text+''''
    else query:= query+'��� = '''+ComboBox2.Text+'''';
  end;
    if ComboBox3.Text <> '' then
  begin
    if query <> ' ' then query:= query+' AND ����� = '''+ComboBox3.Text+''''
    else query:= query+'����� = '''+ComboBox3.Text+'''';
  end;
  try
  begin
  with Form1.ADOQuery1 do
  begin
    Close;
    sql.Clear;
    sql.Add('SELECT * FROM tab1 WHERE '+query);
    Open;
  end;
  end;
  except
    with Form1.ADOQuery1 do
    begin
       Close;
       sql.Clear;
       sql.Add('SELECT * FROM tab1');
       Open;
     end;
     ShowMessage('������ �� �������');
  end;
  param[1]:= Form1.ADOQuery1.FieldByName('�������').AsString;
  param[2]:= Form1.ADOQuery1.FieldByName('���').AsString;
  param[3]:= Form1.ADOQuery1.FieldByName('��������').AsString;
  param[4]:= IntToStr(Form1.ADOQuery1.FieldByName('�����').AsInteger);
  param[5]:= Form1.ADOQuery1.FieldByName('���').AsString;
  param[6]:= Form1.ADOQuery1.FieldByName('�����').AsString;
  with Form1.ADOQuery1 do
  begin
    Close;
    sql.Clear;
    sql.Add('SELECT * FROM tab1');
    Open;
  end;
  if not Form1.ADOQuery1.Locate('�������;���;��������;�����;���;�����;', VarArrayOf([param[1], param[2], param[3], param[4], param[5], param[6]]),  [loCaseInsensitive, loPartialKey]) then
  ShowMessage('������ �� �������');
end;

procedure TForm4.BitBtn6Click(Sender: TObject);
var XL:variant; iRow:integer;
begin
  try
    Form1.ADOQuery1.First;
    XL:=CreateOleObject('Excel.Application');
    XL.ReferenceStyle:=2;
    XL.Workbooks.add(getcurrentdir()+'/�����.xls');
    XL.cells[1,1]:='�����';
    XL.cells[1,2]:='�����';
    XL.cells[1,3]:='�������';
    XL.cells[1,4]:='���';
    XL.cells[1,5]:='��������';
    XL.cells[1,6]:='���';
    XL.cells[1,7]:='���� ��������';
    iRow:=2;
    while not Form1.ADOQuery1.Eof do
      begin
        XL.cells[irow,1]:=Form1.ADOQuery1.FieldByName('�����').AsString;
        XL.cells[irow,2]:=Form1.ADOQuery1.FieldByName('�����').AsString;
        XL.cells[irow,3]:=Form1.ADOQuery1.FieldByName('�������').AsString;
        XL.cells[irow,4]:=Form1.ADOQuery1.FieldByName('���').AsString;
        XL.cells[irow,5]:=Form1.ADOQuery1.FieldByName('��������').AsString;
        XL.cells[irow,6]:=Form1.ADOQuery1.FieldByName('���').AsString;
        XL.cells[irow,7]:=Form1.ADOQuery1.FieldByName('���_���').AsString;
        inc(iRow);
        Form1.ADOQuery1.Next();
      end;
        XL.visible:=true;
  except
    MessageBox(Handle,'������� �����','������', MB_OK+MB_ICONERROR);
  end;
end;

procedure TForm4.Edit1Click(Sender: TObject);
begin
  Edit1.Text:= '';
end;

procedure TForm4.Edit1Exit(Sender: TObject);
begin
  if Edit1.Text = '' then Edit1.Text:= '�������';
end;

procedure TForm4.Edit2Click(Sender: TObject);
begin
  Edit2.Text:= '';
end;

procedure TForm4.Edit2Exit(Sender: TObject);
begin
  if Edit2.Text = '' then Edit2.Text:= '���';
end;

procedure TForm4.Edit3Click(Sender: TObject);
begin
  Edit3.Text:='';
end;

procedure TForm4.Edit3Exit(Sender: TObject);
begin
  if Edit3.Text = '' then Edit3.Text:= '��������';
end;

end.
