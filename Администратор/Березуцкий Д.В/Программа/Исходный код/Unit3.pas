unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, DB, ADODB, Grids,
  DBGrids, ExtCtrls, StdCtrls, ActnList,
  Buttons, ButtonGroup, DBCtrls, ExtDlgs, Menus, jpeg,
  ImgList, ComCtrls, ToolWin, ComObj;

type
  TForm3 = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox4: TGroupBox;
    Label8: TLabel;
    ComboBox1: TComboBox;
    Label10: TLabel;
    ComboBox2: TComboBox;
    Label1: TLabel;
    ComboBox3: TComboBox;
    BitBtn4: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn6: TBitBtn;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;
  Filtr: boolean;

implementation

{$R *.dfm}

uses Unit1;

procedure TForm3.BitBtn2Click(Sender: TObject);
begin
  Form3.Close;
end;

procedure TForm3.BitBtn4Click(Sender: TObject);
var
query:string;
begin
  if Filtr = true then
  begin
    with Form1.ADOQuery1 do
    begin
      Close;
      sql.Clear;
      sql.Add('SELECT * FROM tab1');
      Open;
      Filtr:= false;
    end;
  end;
  query:= '';
  if ComboBox1.Text <> '' then
  begin
    if query <> '' then query:= query+' AND ����� = '''+ComboBox1.Text+''''
    else query:= query+'����� = '''+ComboBox1.Text+'''';
  end;
  if ComboBox2.Text <> '' then
  begin
    if query <> '' then query:= query+' AND ��� =  '''+ComboBox2.Text+''''
    else query:= query+'��� = '''+ComboBox2.Text+'''';
  end;
    if ComboBox3.Text <> '' then
  begin
    if query <> '' then query:= query+' AND ����� = '''+ComboBox3.Text+''''
    else query:= query+'����� = '''+ComboBox3.Text+'''';
  end;
  with Form1.ADOQuery1 do
  begin
    try
      Close;
      sql.Clear;
      sql.Add('SELECT * FROM tab1 WHERE '+query);
      Open;
    except
      ShowMessage('�������������� ������� ���.');
      Close;
      sql.Clear;
      sql.Add('SELECT * FROM tab1');
      Open;
    end;
  end;
  Filtr:= true;
end;

procedure TForm3.BitBtn6Click(Sender: TObject);
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

procedure TForm3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with Form1.ADOQuery1 do
  begin
    Close;
    sql.Clear;
    sql.Add('SELECT * FROM tab1');
    Open;
  end;
end;

end.
