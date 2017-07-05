unit Unit10;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, ADODB, Grids, DBGrids;

type
  TForm10 = class(TForm)
    ADOConnection1: TADOConnection;
    DBGrid1: TDBGrid;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Edit1: TEdit;
    GroupBox3: TGroupBox;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    GroupBox4: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    CheckBox8: TCheckBox;
    CheckBox9: TCheckBox;
    CheckBox10: TCheckBox;
    CheckBox11: TCheckBox;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    Edit2: TEdit;
    procedure FormShow(Sender: TObject);
    procedure UpdateCheck();
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure CheckBox11Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form10: TForm10;

implementation

{$R *.dfm}

procedure TForm10.UpdateCheck();
var
i:integer;
begin
  CheckBox1.Checked:= false;
  CheckBox2.Checked:= false;
  CheckBox3.Checked:= false;
  CheckBox4.Checked:= false;
  CheckBox5.Checked:= false;
  CheckBox6.Checked:= false;
  CheckBox7.Checked:= false;
  CheckBox8.Checked:= false;
  CheckBox9.Checked:= false;
  CheckBox10.Checked:= false;
  CheckBox11.Checked:= false;
  for i:= 0 to 10 do
  begin
    with ADOQuery1 do
    begin
      Close;
      sql.Clear;
      sql.Add('SELECT * FROM Dostup WHERE Логин = '''+Edit2.Text+''' AND Класс = '+ComboBox1.Text+' AND Буква = '''+ComboBox2.Text+''' AND Предмет = '+IntToStr(i));
      Open;
    end;
    if ADOQuery1.RecordCount > 0 then
    begin
      case i of
        0: CheckBox1.Checked:= true;
        1: CheckBox2.Checked:= true;
        2: CheckBox3.Checked:= true;
        3: CheckBox4.Checked:= true;
        4: CheckBox5.Checked:= true;
        5: CheckBox6.Checked:= true;
        6: CheckBox7.Checked:= true;
        7: CheckBox8.Checked:= true;
        8: CheckBox9.Checked:= true;
        9: CheckBox10.Checked:= true;
      end;
    end;
  end;
end;

procedure TForm10.BitBtn1Click(Sender: TObject);
var
i: integer;
begin
  for i:= 0 to 10 do
  begin
    with ADOQuery1 do
    begin
      Close;
      sql.Clear;
      sql.Add('SELECT * FROM Dostup WHERE Логин = '''+Edit2.Text+''' AND Класс = '+ComboBox1.Text+' AND Буква = '''+ComboBox2.Text+''' AND Предмет = '+IntToStr(i));
      Open;
    end;
    case i of
        0:
        begin
          if CheckBox1.Checked = true then
          begin
            if ADOQuery1.RecordCount = 0 then
            begin
              with ADOQuery1 do
              begin
                Close;
                sql.Clear;
                sql.Add('INSERT INTO Dostup (Класс, Буква, Логин, Предмет) VALUES('+ComboBox1.Text+', '+#39+ComboBox2.Text+#39+', '+#39+Edit2.Text+#39+', '+IntToStr(i)+')');
                ExecSQL;
              end;
            end;
          end
          else
          begin
            if ADOQuery1.RecordCount > 0 then
            begin
              with ADOQuery1 do
              begin
                Close;
                sql.Clear;
                sql.Add('DELETE FROM Dostup WHERE Логин = '''+Edit2.Text+''' AND Класс = '+ComboBox1.Text+' AND Буква = '''+ComboBox2.Text+''' AND Предмет = '+IntToStr(i));
                ExecSQL;
              end;
            end;
          end;
        end;
        1:
        begin
          if CheckBox2.Checked = true then
          begin
            if ADOQuery1.RecordCount = 0 then
            begin
              with ADOQuery1 do
              begin
                Close;
                sql.Clear;
                sql.Add('INSERT INTO Dostup (Класс, Буква, Логин, Предмет) VALUES('+ComboBox1.Text+', '+#39+ComboBox2.Text+#39+', '+#39+Edit2.Text+#39+', '+IntToStr(i)+')');
                ExecSQL;
              end;
            end;
          end
          else
          begin
            if ADOQuery1.RecordCount > 0 then
            begin
              with ADOQuery1 do
              begin
                Close;
                sql.Clear;
                sql.Add('DELETE FROM Dostup WHERE Логин = '''+Edit2.Text+''' AND Класс = '+ComboBox1.Text+' AND Буква = '''+ComboBox2.Text+''' AND Предмет = '+IntToStr(i));
                ExecSQL;
              end;
            end;
          end;
        end;
        2:
        begin
          if CheckBox3.Checked = true then
          begin
            if ADOQuery1.RecordCount = 0 then
            begin
              with ADOQuery1 do
              begin
                Close;
                sql.Clear;
                sql.Add('INSERT INTO Dostup (Класс, Буква, Логин, Предмет) VALUES('+ComboBox1.Text+', '+#39+ComboBox2.Text+#39+', '+#39+Edit2.Text+#39+', '+IntToStr(i)+')');
                ExecSQL;
              end;
            end;
          end
          else
          begin
            if ADOQuery1.RecordCount > 0 then
            begin
              with ADOQuery1 do
              begin
                Close;
                sql.Clear;
                sql.Add('DELETE FROM Dostup WHERE Логин = '''+Edit2.Text+''' AND Класс = '+ComboBox1.Text+' AND Буква = '''+ComboBox2.Text+''' AND Предмет = '+IntToStr(i));
                ExecSQL;
              end;
            end;
          end;
        end;
        3:
        begin
          if CheckBox4.Checked = true then
          begin
            if ADOQuery1.RecordCount = 0 then
            begin
              with ADOQuery1 do
              begin
                Close;
                sql.Clear;
                sql.Add('INSERT INTO Dostup (Класс, Буква, Логин, Предмет) VALUES('+ComboBox1.Text+', '+#39+ComboBox2.Text+#39+', '+#39+Edit2.Text+#39+', '+IntToStr(i)+')');
                ExecSQL;
              end;
            end;
          end
          else
          begin
            if ADOQuery1.RecordCount > 0 then
            begin
              with ADOQuery1 do
              begin
                Close;
                sql.Clear;
                sql.Add('DELETE FROM Dostup WHERE Логин = '''+Edit2.Text+''' AND Класс = '+ComboBox1.Text+' AND Буква = '''+ComboBox2.Text+''' AND Предмет = '+IntToStr(i));
                ExecSQL;
              end;
            end;
          end;
        end;
        4:
        begin
          if CheckBox5.Checked = true then
          begin
            if ADOQuery1.RecordCount = 0 then
            begin
              with ADOQuery1 do
              begin
                Close;
                sql.Clear;
                sql.Add('INSERT INTO Dostup (Класс, Буква, Логин, Предмет) VALUES('+ComboBox1.Text+', '+#39+ComboBox2.Text+#39+', '+#39+Edit2.Text+#39+', '+IntToStr(i)+')');
                ExecSQL;
              end;
            end;
          end
          else
          begin
            if ADOQuery1.RecordCount > 0 then
            begin
              with ADOQuery1 do
              begin
                Close;
                sql.Clear;
                sql.Add('DELETE FROM Dostup WHERE Логин = '''+Edit2.Text+''' AND Класс = '+ComboBox1.Text+' AND Буква = '''+ComboBox2.Text+''' AND Предмет = '+IntToStr(i));
                ExecSQL;
              end;
            end;
          end;
        end;
        5:
        begin
          if CheckBox6.Checked = true then
          begin
            if ADOQuery1.RecordCount = 0 then
            begin
              with ADOQuery1 do
              begin
                Close;
                sql.Clear;
                sql.Add('INSERT INTO Dostup (Класс, Буква, Логин, Предмет) VALUES('+ComboBox1.Text+', '+#39+ComboBox2.Text+#39+', '+#39+Edit2.Text+#39+', '+IntToStr(i)+')');
                ExecSQL;
              end;
            end;
          end
          else
          begin
            if ADOQuery1.RecordCount > 0 then
            begin
              with ADOQuery1 do
              begin
                Close;
                sql.Clear;
                sql.Add('DELETE FROM Dostup WHERE Логин = '''+Edit2.Text+''' AND Класс = '+ComboBox1.Text+' AND Буква = '''+ComboBox2.Text+''' AND Предмет = '+IntToStr(i));
                ExecSQL;
              end;
            end;
          end;
        end;
        6:
        begin
          if CheckBox7.Checked = true then
          begin
            if ADOQuery1.RecordCount = 0 then
            begin
              with ADOQuery1 do
              begin
                Close;
                sql.Clear;
                sql.Add('INSERT INTO Dostup (Класс, Буква, Логин, Предмет) VALUES('+ComboBox1.Text+', '+#39+ComboBox2.Text+#39+', '+#39+Edit2.Text+#39+', '+IntToStr(i)+')');
                ExecSQL;
              end;
            end;
          end
          else
          begin
            if ADOQuery1.RecordCount > 0 then
            begin
              with ADOQuery1 do
              begin
                Close;
                sql.Clear;
                sql.Add('DELETE FROM Dostup WHERE Логин = '''+Edit2.Text+''' AND Класс = '+ComboBox1.Text+' AND Буква = '''+ComboBox2.Text+''' AND Предмет = '+IntToStr(i));
                ExecSQL;
              end;
            end;
          end;
        end;
        7:
        begin
          if CheckBox8.Checked = true then
          begin
            if ADOQuery1.RecordCount = 0 then
            begin
              with ADOQuery1 do
              begin
                Close;
                sql.Clear;
                sql.Add('INSERT INTO Dostup (Класс, Буква, Логин, Предмет) VALUES('+ComboBox1.Text+', '+#39+ComboBox2.Text+#39+', '+#39+Edit2.Text+#39+', '+IntToStr(i)+')');
                ExecSQL;
              end;
            end;
          end
          else
          begin
            if ADOQuery1.RecordCount > 0 then
            begin
              with ADOQuery1 do
              begin
                Close;
                sql.Clear;
                sql.Add('DELETE FROM Dostup WHERE Логин = '''+Edit2.Text+''' AND Класс = '+ComboBox1.Text+' AND Буква = '''+ComboBox2.Text+''' AND Предмет = '+IntToStr(i));
                ExecSQL;
              end;
            end;
          end;
        end;
        8:
        begin
          if CheckBox9.Checked = true then
          begin
            if ADOQuery1.RecordCount = 0 then
            begin
              with ADOQuery1 do
              begin
                Close;
                sql.Clear;
                sql.Add('INSERT INTO Dostup (Класс, Буква, Логин, Предмет) VALUES('+ComboBox1.Text+', '+#39+ComboBox2.Text+#39+', '+#39+Edit2.Text+#39+', '+IntToStr(i)+')');
                ExecSQL;
              end;
            end;
          end
          else
          begin
            if ADOQuery1.RecordCount > 0 then
            begin
              with ADOQuery1 do
              begin
                Close;
                sql.Clear;
                sql.Add('DELETE FROM Dostup WHERE Логин = '''+Edit2.Text+''' AND Класс = '+ComboBox1.Text+' AND Буква = '''+ComboBox2.Text+''' AND Предмет = '+IntToStr(i));
                ExecSQL;
              end;
            end;
          end;
        end;
        9:
        begin
          if CheckBox10.Checked = true then
          begin
            if ADOQuery1.RecordCount = 0 then
            begin
              with ADOQuery1 do
              begin
                Close;
                sql.Clear;
                sql.Add('INSERT INTO Dostup (Класс, Буква, Логин, Предмет) VALUES('+ComboBox1.Text+', '+#39+ComboBox2.Text+#39+', '+#39+Edit2.Text+#39+', '+IntToStr(i)+')');
                ExecSQL;
              end;
            end;
          end
          else
          begin
            if ADOQuery1.RecordCount > 0 then
            begin
              with ADOQuery1 do
              begin
                Close;
                sql.Clear;
                sql.Add('DELETE FROM Dostup WHERE Логин = '''+Edit2.Text+''' AND Класс = '+ComboBox1.Text+' AND Буква = '''+ComboBox2.Text+''' AND Предмет = '+IntToStr(i));
                ExecSQL;
              end;
            end;
          end;
        end;
    end;
  end;
end;

procedure TForm10.BitBtn2Click(Sender: TObject);
begin
  Form10.Close;
end;

procedure TForm10.CheckBox11Click(Sender: TObject);
begin
  if CheckBox11.Checked = true then
  begin
    CheckBox1.Checked:= true;
    CheckBox2.Checked:= true;
    CheckBox3.Checked:= true;
    CheckBox4.Checked:= true;
    CheckBox5.Checked:= true;
    CheckBox6.Checked:= true;
    CheckBox7.Checked:= true;
    CheckBox8.Checked:= true;
    CheckBox9.Checked:= true;
    CheckBox10.Checked:= true;
    CheckBox11.Checked:= true;
  end
  else
  begin
    CheckBox1.Checked:= false;
    CheckBox2.Checked:= false;
    CheckBox3.Checked:= false;
    CheckBox4.Checked:= false;
    CheckBox5.Checked:= false;
    CheckBox6.Checked:= false;
    CheckBox7.Checked:= false;
    CheckBox8.Checked:= false;
    CheckBox9.Checked:= false;
    CheckBox10.Checked:= false;
    CheckBox11.Checked:= false;
  end;
end;

procedure TForm10.ComboBox1Change(Sender: TObject);
begin
  UpdateCheck();
end;

procedure TForm10.ComboBox2Change(Sender: TObject);
begin
  UpdateCheck();
end;

procedure TForm10.FormCreate(Sender: TObject);
begin
  ADOConnection1.Connected:= false;
  ADOQuery1.Active:= false;
  ADOConnection1.ConnectionString:= GetCurrentDir+'\db.mdb';
  ADOConnection1.Connected:= true;
  ADOQuery1.Active:= true;
end;

procedure TForm10.FormShow(Sender: TObject);
begin
  ComboBox1.ItemIndex:= 0;
  ComboBox2.ItemIndex:= 0;
  UpdateCheck();
end;

end.
