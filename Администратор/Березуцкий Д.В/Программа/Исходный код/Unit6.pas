unit Unit6;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, DB, ADODB, Grids,
  DBGrids, ExtCtrls, StdCtrls, ActnList,
  Buttons, ButtonGroup, DBCtrls, ExtDlgs, Menus, jpeg,
  ImgList, ComCtrls, ToolWin, ComObj;

type
  TForm6 = class(TForm)
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    Label1: TLabel;
    BitBtn3: TBitBtn;
    BitBtn2: TBitBtn;
    Edit2: TEdit;
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;
  pred : integer;

implementation

{$R *.dfm}

uses Unit5, Unit1;

procedure TForm6.BitBtn2Click(Sender: TObject);
begin
  Form6.Hide;
end;

procedure TForm6.BitBtn3Click(Sender: TObject);
var
ball: integer;
id : integer;
sum : integer;
count : integer;
chet, god : integer;
resultat : Real;
begin
  id:= StrToInt(Edit2.Text);
  if Length(Edit1.Text) <> 1 then
  begin
    MessageBox(Handle,'������� ������','������', MB_OK+MB_ICONERROR);
    Exit;
  end;
  try
    ball:= StrToInt(Edit1.Text);
    if (ball < 1) OR (ball > 5) then
    begin
      MessageBox(Handle,'������� ������','������', MB_OK+MB_ICONERROR);
      Exit;
    end;
  except
    on Exception : EConvertError do
    begin
      MessageBox(Handle,'������� ������','������', MB_OK+MB_ICONERROR);
      Exit;
    end;
  end;
  with Form5.ADOQuery2 do
  begin
    Close;
    sql.Clear;
    sql.Add('SELECT * FROM ctv WHERE ��� = '+IntToStr(Form5.ComboBox1.ItemIndex+1));
    Open;
  end;
  chet:= Form5.DBGrid2.DataSource.DataSet.Fields[1].AsInteger;
  god:= Form5.DBGrid2.DataSource.DataSet.Fields[2].AsInteger;
  with Form5.ADOQuery1 do
  begin
    Close;
    sql.Clear;
    case pred of
      0 : sql.Add('INSERT INTO Algebra (������, ����, id_1, ��������, ���) VALUES('+#39+Edit1.Text+#39+','+#39+DateTostr(Date)+#39+','+IntToStr(id)+','+IntToStr(chet)+','+IntToStr(god)+')');
      1 : sql.Add('INSERT INTO Geometry (������, ����, id_1, ��������, ���) VALUES('+#39+Edit1.Text+#39+','+#39+DateTostr(Date)+#39+','+IntToStr(id)+','+IntToStr(chet)+','+IntToStr(god)+')');
      2 : sql.Add('INSERT INTO IstoriaK (������, ����, id_1, ��������, ���) VALUES('+#39+Edit1.Text+#39+','+#39+DateTostr(Date)+#39+','+IntToStr(id)+','+IntToStr(chet)+','+IntToStr(god)+')');
      3 : sql.Add('INSERT INTO IstoriaV (������, ����, id_1, ��������, ���) VALUES('+#39+Edit1.Text+#39+','+#39+DateTostr(Date)+#39+','+IntToStr(id)+','+IntToStr(chet)+','+IntToStr(god)+')');
      4 : sql.Add('INSERT INTO Trud (������, ����, id_1, ��������, ���) VALUES('+#39+Edit1.Text+#39+','+#39+DateTostr(Date)+#39+','+IntToStr(id)+','+IntToStr(chet)+','+IntToStr(god)+')');
      5 : sql.Add('INSERT INTO RussianLanguage (������, ����, id_1, ��������, ���) VALUES('+#39+Edit1.Text+#39+','+#39+DateTostr(Date)+#39+','+IntToStr(id)+','+IntToStr(chet)+','+IntToStr(god)+')');
      6 : sql.Add('INSERT INTO KazackLanguage (������, ����, id_1, ��������, ���) VALUES('+#39+Edit1.Text+#39+','+#39+DateTostr(Date)+#39+','+IntToStr(id)+','+IntToStr(chet)+','+IntToStr(god)+')');
      7 : sql.Add('INSERT INTO RussianLitra (������, ����, id_1, ��������, ���) VALUES('+#39+Edit1.Text+#39+','+#39+DateTostr(Date)+#39+','+IntToStr(id)+','+IntToStr(chet)+','+IntToStr(god)+')');
      8 : sql.Add('INSERT INTO Economy (������, ����, id_1, ��������, ���) VALUES('+#39+Edit1.Text+#39+','+#39+DateTostr(Date)+#39+','+IntToStr(id)+','+IntToStr(chet)+','+IntToStr(god)+')');
      9 : sql.Add('INSERT INTO Fizra (������, ����, id_1, ��������, ���) VALUES('+#39+Edit1.Text+#39+','+#39+DateTostr(Date)+#39+','+IntToStr(id)+','+IntToStr(chet)+','+IntToStr(god)+')');
    end;
    ExecSQL;
  end;
  if Form5.ComboBox1.ItemIndex = pred then
  begin
    with Form5.ADOQuery1 do
    begin
      Close;
      sql.Clear;
      case Form5.ComboBox1.ItemIndex of
        0 : sql.Add('SELECT * FROM Algebra WHERE �������� = '+IntToStr(chet)+' AND ��� = '+IntToStr(god)+' AND id_1 = '+IntToStr(id));
        1 : sql.Add('SELECT * FROM Geometry WHERE �������� = '+IntToStr(chet)+' AND ��� = '+IntToStr(god)+' AND id_1 = '+IntToStr(id));
        2 : sql.Add('SELECT * FROM IstoriaK WHERE �������� = '+IntToStr(chet)+' AND ��� = '+IntToStr(god)+' AND id_1 = '+IntToStr(id));
        3 : sql.Add('SELECT * FROM IstoriaV WHERE �������� = '+IntToStr(chet)+' AND ��� = '+IntToStr(god)+' AND id_1 = '+IntToStr(id));
        4 : sql.Add('SELECT * FROM Trud WHERE �������� = '+IntToStr(chet)+' AND ��� = '+IntToStr(god)+' AND id_1 = '+IntToStr(id));
        5 : sql.Add('SELECT * FROM RussianLanguage WHERE �������� = '+IntToStr(chet)+' AND ��� = '+IntToStr(god)+' AND id_1 = '+IntToStr(id));
        6 : sql.Add('SELECT * FROM KazackLanguage WHERE �������� = '+IntToStr(chet)+' AND ��� = '+IntToStr(god)+' AND id_1 = '+IntToStr(id));
        7 : sql.Add('SELECT * FROM RussianLitra WHERE �������� = '+IntToStr(chet)+' AND ��� = '+IntToStr(god)+' AND id_1 = '+IntToStr(id));
        8 : sql.Add('SELECT * FROM Economy WHERE �������� = '+IntToStr(chet)+' AND ��� = '+IntToStr(god)+' AND id_1 = '+IntToStr(id));
        9 : sql.Add('SELECT * FROM Fizra WHERE �������� = '+IntToStr(chet)+' AND ��� = '+IntToStr(god)+' AND id_1 = '+IntToStr(id));
      end;
      Open;
    end;
  end;
  Form5.ComboBox2.ItemIndex:= chet-1;
  case pred of
    0:
    begin
      with Form5.ADOQuery2 do
      begin
        Close;
        sql.Clear;
        sql.Add('SELECT sum(������) as sq FROM Algebra WHERE �������� = '+IntToStr(chet)+' AND ��� = '+IntToStr(god)+' AND id_1 = '+IntToStr(id));
        Open;
      end;
      sum:= Form5.ADOQuery2.FieldByName('sq').AsInteger;
      with Form5.ADOQuery2 do
      begin
        Close;
        sql.Clear;
        sql.Add('SELECT count(*) as sq FROM Algebra WHERE �������� = '+IntToStr(chet)+' AND ��� = '+IntToStr(god)+' AND id_1 = '+IntToStr(id));
        Open;
      end;
      count:= Form5.ADOQuery2.FieldByName('sq').AsInteger;
      if count > 0 then
      begin
        resultat:= sum/count;
        Form5.Edit1.Text:= formatfloat('0.#', resultat);
      end;
    end;
    1:
    begin
      with Form5.ADOQuery2 do
      begin
          Close;
          sql.Clear;
          sql.Add('SELECT sum(������) as sq FROM Geometry WHERE �������� = '+IntToStr(chet)+' AND ��� = '+IntToStr(god)+' AND id_1 = '+IntToStr(id));
          Open;
      end;
      sum:= Form5.ADOQuery2.FieldByName('sq').AsInteger;
      with Form5.ADOQuery2 do
      begin
        Close;
        sql.Clear;
        sql.Add('SELECT count(*) as sq FROM Geometry WHERE �������� = '+IntToStr(chet)+' AND ��� = '+IntToStr(god)+' AND id_1 = '+IntToStr(id));
        Open;
      end;
      count:= Form5.ADOQuery2.FieldByName('sq').AsInteger;
      if count > 0 then
      begin
        resultat:= sum/count;
        Form5.Edit2.Text:= formatfloat('0.#', resultat);
      end;
    end;
    2:
    begin
      with Form5.ADOQuery2 do
      begin
        Close;
        sql.Clear;
        sql.Add('SELECT sum(������) as sq FROM IstoriaK WHERE �������� = '+IntToStr(chet)+' AND ��� = '+IntToStr(god)+' AND id_1 = '+IntToStr(id));
        Open;
      end;
      sum:= Form5.ADOQuery2.FieldByName('sq').AsInteger;
      with Form5.ADOQuery2 do
      begin
        Close;
        sql.Clear;
        sql.Add('SELECT count(*) as sq FROM IstoriaK WHERE �������� = '+IntToStr(chet)+' AND ��� = '+IntToStr(god)+' AND id_1 = '+IntToStr(id));
        Open;
      end;
      count:= Form5.ADOQuery2.FieldByName('sq').AsInteger;
      if count > 0 then
      begin
        resultat:= sum/count;
        Form5.Edit3.Text:= formatfloat('0.#', resultat);
      end;
    end;
    3:
    begin
      with Form5.ADOQuery2 do
      begin
        Close;
        sql.Clear;
        sql.Add('SELECT sum(������) as sq FROM IstoriaV WHERE �������� = '+IntToStr(chet)+' AND ��� = '+IntToStr(god)+' AND id_1 = '+IntToStr(id));
        Open;
      end;
      sum:= Form5.ADOQuery2.FieldByName('sq').AsInteger;
      with Form5.ADOQuery2 do
      begin
        Close;
        sql.Clear;
        sql.Add('SELECT count(*) as sq FROM IstoriaV WHERE �������� = '+IntToStr(chet)+' AND ��� = '+IntToStr(god)+' AND id_1 = '+IntToStr(id));
        Open;
      end;
      count:= Form5.ADOQuery2.FieldByName('sq').AsInteger;
      if count > 0 then
      begin
        resultat:= sum/count;
        Form5.Edit4.Text:= formatfloat('0.#', resultat);
      end;
    end;
    4:
    begin
      with Form5.ADOQuery2 do
      begin
        Close;
        sql.Clear;
        sql.Add('SELECT sum(������) as sq FROM Trud WHERE �������� = '+IntToStr(chet)+' AND ��� = '+IntToStr(god)+' AND id_1 = '+IntToStr(id));
        Open;
      end;
      sum:= Form5.ADOQuery2.FieldByName('sq').AsInteger;
      with Form5.ADOQuery2 do
      begin
          Close;
          sql.Clear;
          sql.Add('SELECT count(*) as sq FROM Trud WHERE �������� = '+IntToStr(chet)+' AND ��� = '+IntToStr(god)+' AND id_1 = '+IntToStr(id));
          Open;
      end;
      count:= Form5.ADOQuery2.FieldByName('sq').AsInteger;
      if count > 0 then
      begin
        resultat:= sum/count;
        Form5.Edit5.Text:= formatfloat('0.#', resultat);
      end;
    end;
    5:
    begin
      with Form5.ADOQuery2 do
      begin
          Close;
          sql.Clear;
          sql.Add('SELECT sum(������) as sq FROM RussianLanguage WHERE �������� = '+IntToStr(chet)+' AND ��� = '+IntToStr(god)+' AND id_1 = '+IntToStr(id));
          Open;
      end;
      sum:= Form5.ADOQuery2.FieldByName('sq').AsInteger;
      with Form5.ADOQuery2 do
      begin
        Close;
        sql.Clear;
        sql.Add('SELECT count(*) as sq FROM RussianLanguage WHERE �������� = '+IntToStr(chet)+' AND ��� = '+IntToStr(god)+' AND id_1 = '+IntToStr(id));
        Open;
      end;
      count:= Form5.ADOQuery2.FieldByName('sq').AsInteger;
      if count > 0 then
      begin
        resultat:= sum/count;
        Form5.Edit6.Text:= formatfloat('0.#', resultat);
      end;
    end;
    6:
    begin
      with Form5.ADOQuery2 do
      begin
        Close;
        sql.Clear;
        sql.Add('SELECT sum(������) as sq FROM KazackLanguage WHERE �������� = '+IntToStr(chet)+' AND ��� = '+IntToStr(god)+' AND id_1 = '+IntToStr(id));
        Open;
      end;
      sum:= Form5.ADOQuery2.FieldByName('sq').AsInteger;
      with Form5.ADOQuery2 do
      begin
        Close;
        sql.Clear;
        sql.Add('SELECT count(*) as sq FROM KazackLanguage WHERE �������� = '+IntToStr(chet)+' AND ��� = '+IntToStr(god)+' AND id_1 = '+IntToStr(id));
        Open;
      end;
      count:= Form5.ADOQuery2.FieldByName('sq').AsInteger;
      if count > 0 then
      begin
        resultat:= sum/count;
        Form5.Edit7.Text:= formatfloat('0.#', resultat);
      end;
    end;
    7:
    begin
      with Form5.ADOQuery2 do
      begin
        Close;
        sql.Clear;
        sql.Add('SELECT sum(������) as sq FROM RussianLitra WHERE �������� = '+IntToStr(chet)+' AND ��� = '+IntToStr(god)+' AND id_1 = '+IntToStr(id));
        Open;
      end;
      sum:= Form5.ADOQuery2.FieldByName('sq').AsInteger;
      with Form5.ADOQuery2 do
      begin
        Close;
        sql.Clear;
        sql.Add('SELECT count(*) as sq FROM RussianLitra WHERE �������� = '+IntToStr(chet)+' AND ��� = '+IntToStr(god)+' AND id_1 = '+IntToStr(id));
        Open;
      end;
      count:= Form5.ADOQuery2.FieldByName('sq').AsInteger;
      if count > 0 then
      begin
        resultat:= sum/count;
        Form5.Edit8.Text:= formatfloat('0.#', resultat);
      end;
    end;
    8:
    begin
      with Form5.ADOQuery2 do
      begin
        Close;
        sql.Clear;
        sql.Add('SELECT sum(������) as sq FROM Economy WHERE �������� = '+IntToStr(chet)+' AND ��� = '+IntToStr(god)+' AND id_1 = '+IntToStr(id));
        Open;
      end;
      sum:= Form5.ADOQuery2.FieldByName('sq').AsInteger;
      with Form5.ADOQuery2 do
      begin
        Close;
        sql.Clear;
        sql.Add('SELECT count(*) as sq FROM Economy WHERE �������� = '+IntToStr(chet)+' AND ��� = '+IntToStr(god)+' AND id_1 = '+IntToStr(id));
        Open;
      end;
      count:= Form5.ADOQuery2.FieldByName('sq').AsInteger;
      if count > 0 then
      begin
        resultat:= sum/count;
        Form5.Edit9.Text:= formatfloat('0.#', resultat);
      end;
    end;
    9:
    begin
      with Form5.ADOQuery2 do
      begin
        Close;
        sql.Clear;
        sql.Add('SELECT sum(������) as sq FROM Fizra WHERE �������� = '+IntToStr(chet)+' AND ��� = '+IntToStr(god)+' AND id_1 = '+IntToStr(id));
        Open;
      end;
      sum:= Form5.ADOQuery2.FieldByName('sq').AsInteger;
      with Form5.ADOQuery2 do
      begin
        Close;
        sql.Clear;
        sql.Add('SELECT count(*) as sq FROM Fizra WHERE �������� = '+IntToStr(chet)+' AND ��� = '+IntToStr(god)+' AND id_1 = '+IntToStr(id));
        Open;
      end;
      count:= Form5.ADOQuery2.FieldByName('sq').AsInteger;
      if count > 0 then
      begin
        resultat:= sum/count;
        Form5.Edit10.Text:= formatfloat('0.#', resultat);
      end;
    end;
  end;
  Form6.Hide;
end;

procedure TForm6.FormShow(Sender: TObject);
begin
  Edit1.Clear;
  pred:= Form5.ComboBox1.ItemIndex;
end;

end.
