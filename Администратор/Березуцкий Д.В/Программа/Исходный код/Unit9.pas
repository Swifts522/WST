unit Unit9;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, ADODB, StdCtrls, Buttons;

type
  TForm9 = class(TForm)
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit4: TEdit;
    Edit7: TEdit;
    Label5: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form9: TForm9;
  Insert:boolean;

implementation

uses Unit10;

{$R *.dfm}

procedure TForm9.BitBtn1Click(Sender: TObject);
var
  id:integer;
begin
  id:= DBGrid1.DataSource.DataSet.Fields[0].AsInteger;
  with ADOQuery1 do
  begin
      Close;
      sql.Clear;
      sql.Add('UPDATE Accounts SET ����� = '+#39+Edit4.Text+#39+', ������ = '+#39+Edit7.Text+#39+', ��� = '+#39+Edit1.Text+#39+' WHERE ��� = '+IntToStr(id));
      ExecSQL;
      Close;
      sql.Clear;
      sql.Add('SELECT * FROM Accounts');
      Open;
  end;
  Insert:= false;
end;

procedure TForm9.BitBtn2Click(Sender: TObject);
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
      sql.Add('DELETE FROM Accounts WHERE ��� = '+IntToStr(id));
      ExecSQL;
    end;
    with ADOQuery1 do
    begin
      Close;
      sql.Clear;
      sql.Add('SELECT * FROM Accounts');
      Open;
    end;
  end;
  Insert:= false;
end;

procedure TForm9.BitBtn3Click(Sender: TObject);
begin
  Form10.Edit2.Text:= DBGrid1.DataSource.DataSet.Fields[1].AsString;
  Form10.Edit1.Text:= DBGrid1.DataSource.DataSet.Fields[4].AsString;
  Form10.Show;
end;

procedure TForm9.BitBtn4Click(Sender: TObject);
begin
  if Insert = false then
  begin
    Edit1.Clear;
    Edit4.Clear;
    Edit7.Clear;
    Insert:= true;
    ShowMessage('��������� ���� � ������� �� ������ �������� ��� ���.');
  end
  else
  begin
    if (Edit1.Text = '') OR (Edit4.Text = '') OR (Edit7.Text = '') then
    begin
      ShowMessage('��������� ��� ����');
      Exit;
    end;
    with ADOQuery1 do
    begin
      Close;
      sql.Clear;
      sql.Add('INSERT INTO Accounts (�����, ������, ���, ������) VALUES('+#39+Edit4.Text+#39+', '+#39+Edit7.Text+#39+', '+#39+Edit1.Text+#39+', 0)');
      ExecSQL;
      Close;
      sql.Clear;
      sql.Add('SELECT * FROM Accounts');
      Open;
    end;
    Insert:= false;
  end;
end;

procedure TForm9.DataSource1DataChange(Sender: TObject; Field: TField);
begin
  Edit1.Text:= DBGrid1.DataSource.DataSet.Fields[4].AsString;
  Edit4.Text:= DBGrid1.DataSource.DataSet.Fields[1].AsString;
  Edit7.Text:= DBGrid1.DataSource.DataSet.Fields[2].AsString;
  Insert:= false;
end;

procedure TForm9.FormCreate(Sender: TObject);
begin
  ADOQuery1.Active:= false;
  ADOConnection1.ConnectionString:= GetCurrentDir+'\db.mdb';
  ADOConnection1.Connected:= true;
  ADOQuery1.Active:= true;
end;

procedure TForm9.FormShow(Sender: TObject);
begin
  Insert:= false;
  with ADOQuery1 do
  begin
    Close;
    sql.Clear;
    sql.Add('SELECT * FROM Accounts');
    Open;
  end;
end;

end.
