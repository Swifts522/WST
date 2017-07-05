unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, ComCtrls, StdCtrls, Buttons,
  Grids, DBGrids, DB, ADODB, pngimage, ExtCtrls;

type
  TForm2 = class(TForm)
    TreeView1: TTreeView;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Memo1: TMemo;
    GroupBox1: TGroupBox;
    BitBtn4: TBitBtn;
    BitBtn6: TBitBtn;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    DBGrid2: TDBGrid;
    ComboBox1: TComboBox;
    BitBtn3: TBitBtn;
    ADOQuery2: TADOQuery;
    ADOConnection2: TADOConnection;
    DataSource2: TDataSource;
    Edit11: TEdit;
    DBGrid3: TDBGrid;
    ADOConnection3: TADOConnection;
    ADOQuery3: TADOQuery;
    DataSource3: TDataSource;
    Edit12: TEdit;
    Edit13: TEdit;
    BitBtn1: TBitBtn;
    Image1: TImage;
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Update();
    procedure Button1Click(Sender: TObject);
    procedure TreeView1Change(Sender: TObject; Node: TTreeNode);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

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

procedure TForm2.Update();
var
sum : integer;
count : integer;
resultat : Real;
id:integer;
god, chet: integer;
begin
  id:= StrToInt(Edit11.Text);
  with ADOQuery3 do
  begin
    Close;
    sql.Clear;
    sql.Add('SELECT * FROM ctv WHERE Код = '+IntToStr(ComboBox1.ItemIndex+1));
    Open;
  end;
  chet:= DBGrid3.DataSource.DataSet.Fields[1].AsInteger;
  god:= DBGrid3.DataSource.DataSet.Fields[2].AsInteger;
  with ADOQuery3 do
  begin
      Close;
      sql.Clear;
      sql.Add('SELECT sum(Оценка) as sq FROM Algebra WHERE Год = '+IntToStr(god)+' AND Четверть = '+IntToStr(chet)+' AND id_1 = '+IntToStr(id));
      Open;
  end;
  sum:= ADOQuery3.FieldByName('sq').AsInteger;
  with ADOQuery3 do
  begin
      Close;
      sql.Clear;
      sql.Add('SELECT count(*) as sq FROM Algebra WHERE Год = '+IntToStr(god)+' AND Четверть = '+IntToStr(chet)+' AND id_1 = '+IntToStr(id));
      Open;
  end;
  count:= ADOQuery3.FieldByName('sq').AsInteger;
  if count > 0 then
  begin
    resultat:= sum/count;
    Edit1.Text:= formatfloat('0.#', resultat);
  end;
  //
  with ADOQuery3 do
  begin
      Close;
      sql.Clear;
      sql.Add('SELECT sum(Оценка) as sq FROM Geometry WHERE Год = '+IntToStr(god)+' AND Четверть = '+IntToStr(chet)+' AND id_1 = '+IntToStr(id));
      Open;
  end;
  sum:= ADOQuery3.FieldByName('sq').AsInteger;
  with ADOQuery3 do
  begin
      Close;
      sql.Clear;
      sql.Add('SELECT count(*) as sq FROM Geometry WHERE Год = '+IntToStr(god)+' AND Четверть = '+IntToStr(chet)+' AND id_1 = '+IntToStr(id));
      Open;
  end;
  count:= ADOQuery3.FieldByName('sq').AsInteger;
  if count > 0 then
  begin
    resultat:= sum/count;
    Edit2.Text:= formatfloat('0.#', resultat);
  end;
  //
  with ADOQuery3 do
  begin
      Close;
      sql.Clear;
      sql.Add('SELECT sum(Оценка) as sq FROM IstoriaK WHERE Год = '+IntToStr(god)+' AND Четверть = '+IntToStr(chet)+' AND id_1 = '+IntToStr(id));
      Open;
  end;
  sum:= ADOQuery3.FieldByName('sq').AsInteger;
  with ADOQuery3 do
  begin
      Close;
      sql.Clear;
      sql.Add('SELECT count(*) as sq FROM IstoriaK WHERE Год = '+IntToStr(god)+' AND Четверть = '+IntToStr(chet)+' AND id_1 = '+IntToStr(id));
      Open;
  end;
  count:= ADOQuery3.FieldByName('sq').AsInteger;
  if count > 0 then
  begin
    resultat:= sum/count;
    Edit3.Text:= formatfloat('0.#', resultat);
  end;
  //
  with ADOQuery3 do
  begin
      Close;
      sql.Clear;
      sql.Add('SELECT sum(Оценка) as sq FROM IstoriaV WHERE Год = '+IntToStr(god)+' AND Четверть = '+IntToStr(chet)+' AND id_1 = '+IntToStr(id));
      Open;
  end;
  sum:= ADOQuery3.FieldByName('sq').AsInteger;
  with ADOQuery3 do
  begin
      Close;
      sql.Clear;
      sql.Add('SELECT count(*) as sq FROM IstoriaV WHERE Год = '+IntToStr(god)+' AND Четверть = '+IntToStr(chet)+' AND id_1 = '+IntToStr(id));
      Open;
  end;
  count:= ADOQuery3.FieldByName('sq').AsInteger;
  if count > 0 then
  begin
    resultat:= sum/count;
    Edit4.Text:= formatfloat('0.#', resultat);
  end;
  //
  with ADOQuery3 do
  begin
      Close;
      sql.Clear;
      sql.Add('SELECT sum(Оценка) as sq FROM Trud WHERE Год = '+IntToStr(god)+' AND Четверть = '+IntToStr(chet)+' AND id_1 = '+IntToStr(id));
      Open;
  end;
  sum:= ADOQuery3.FieldByName('sq').AsInteger;
  with ADOQuery3 do
  begin
      Close;
      sql.Clear;
      sql.Add('SELECT count(*) as sq FROM Trud WHERE Год = '+IntToStr(god)+' AND Четверть = '+IntToStr(chet)+' AND id_1 = '+IntToStr(id));
      Open;
  end;
  count:= ADOQuery3.FieldByName('sq').AsInteger;
  if count > 0 then
  begin
    resultat:= sum/count;
    Edit5.Text:= formatfloat('0.#', resultat);
  end;
  //
  with ADOQuery3 do
  begin
      Close;
      sql.Clear;
      sql.Add('SELECT sum(Оценка) as sq FROM RussianLanguage WHERE Год = '+IntToStr(god)+' AND Четверть = '+IntToStr(chet)+' AND id_1 = '+IntToStr(id));
      Open;
  end;
  sum:= ADOQuery3.FieldByName('sq').AsInteger;
  with ADOQuery3 do
  begin
      Close;
      sql.Clear;
      sql.Add('SELECT count(*) as sq FROM RussianLanguage WHERE Год = '+IntToStr(god)+' AND Четверть = '+IntToStr(chet)+' AND id_1 = '+IntToStr(id));
      Open;
  end;
  count:= ADOQuery3.FieldByName('sq').AsInteger;
  if count > 0 then
  begin
    resultat:= sum/count;
    Edit6.Text:= formatfloat('0.#', resultat);
  end;
  //
  with ADOQuery3 do
  begin
      Close;
      sql.Clear;
      sql.Add('SELECT sum(Оценка) as sq FROM KazackLanguage WHERE Год = '+IntToStr(god)+' AND Четверть = '+IntToStr(chet)+' AND id_1 = '+IntToStr(id));
      Open;
  end;
  sum:= ADOQuery3.FieldByName('sq').AsInteger;
  with ADOQuery3 do
  begin
      Close;
      sql.Clear;
      sql.Add('SELECT count(*) as sq FROM KazackLanguage WHERE Год = '+IntToStr(god)+' AND Четверть = '+IntToStr(chet)+' AND id_1 = '+IntToStr(id));
      Open;
  end;
  count:= ADOQuery3.FieldByName('sq').AsInteger;
  if count > 0 then
  begin
    resultat:= sum/count;
    Edit7.Text:= formatfloat('0.#', resultat);
  end;
  //
  with ADOQuery3 do
  begin
      Close;
      sql.Clear;
      sql.Add('SELECT sum(Оценка) as sq FROM RussianLitra WHERE Год = '+IntToStr(god)+' AND Четверть = '+IntToStr(chet)+' AND id_1 = '+IntToStr(id));
      Open;
  end;
  sum:= ADOQuery3.FieldByName('sq').AsInteger;
  with ADOQuery3 do
  begin
      Close;
      sql.Clear;
      sql.Add('SELECT count(*) as sq FROM RussianLitra WHERE Год = '+IntToStr(god)+' AND Четверть = '+IntToStr(chet)+' AND id_1 = '+IntToStr(id));
      Open;
  end;
  count:= ADOQuery3.FieldByName('sq').AsInteger;
  if count > 0 then
  begin
    resultat:= sum/count;
    Edit8.Text:= formatfloat('0.#', resultat);
  end;
  //
  with ADOQuery3 do
  begin
      Close;
      sql.Clear;
      sql.Add('SELECT sum(Оценка) as sq FROM Economy WHERE Год = '+IntToStr(god)+' AND Четверть = '+IntToStr(chet)+' AND id_1 = '+IntToStr(id));
      Open;
  end;
  sum:= ADOQuery3.FieldByName('sq').AsInteger;
  with ADOQuery3 do
  begin
      Close;
      sql.Clear;
      sql.Add('SELECT count(*) as sq FROM Economy WHERE Год = '+IntToStr(god)+' AND Четверть = '+IntToStr(chet)+' AND id_1 = '+IntToStr(id));
      Open;
  end;
  count:= ADOQuery3.FieldByName('sq').AsInteger;
  if count > 0 then
  begin
    resultat:= sum/count;
    Edit9.Text:= formatfloat('0.#', resultat);
  end;
  //
  with ADOQuery3 do
  begin
      Close;
      sql.Clear;
      sql.Add('SELECT sum(Оценка) as sq FROM Fizra WHERE Год = '+IntToStr(god)+' AND Четверть = '+IntToStr(chet)+' AND id_1 = '+IntToStr(id));
      Open;
  end;
  sum:= ADOQuery3.FieldByName('sq').AsInteger;
  with ADOQuery3 do
  begin
      Close;
      sql.Clear;
      sql.Add('SELECT count(*) as sq FROM Fizra WHERE Год = '+IntToStr(god)+' AND Четверть = '+IntToStr(chet)+' AND id_1 = '+IntToStr(id));
      Open;
  end;
  count:= ADOQuery3.FieldByName('sq').AsInteger;
  if count > 0 then
  begin
    resultat:= sum/count;
    Edit10.Text:= formatfloat('0.#', resultat);
  end;
end;

procedure TForm2.BitBtn1Click(Sender: TObject);
begin
  Update();
end;

procedure TForm2.BitBtn3Click(Sender: TObject);
var
id:integer;
god, chet: integer;
begin
  id:= StrToInt(Edit11.Text);
  GroupBox2.Visible:= true;
  ComboBox1.Visible:= true;
  DBGrid2.Visible:= true;
  GroupBox1.Width:= 497;
  GroupBox1.Height:= 401;
  BitBtn4.Visible:= false;
  BitBtn3.Visible:= false;
  BitBtn6.Visible:= true;
  with ADOQuery2 do
  begin
    Close;
    sql.Clear;
    sql.Add('SELECT * FROM ctv WHERE Код = '+IntToStr(ComboBox1.ItemIndex+1));
    Open;
  end;
  chet:= DBGrid2.DataSource.DataSet.Fields[1].AsInteger;
  god:= DBGrid2.DataSource.DataSet.Fields[2].AsInteger;
  with ADOQuery2 do
  begin
      Close;
      sql.Clear;
      case ComboBox1.ItemIndex of
        0 : sql.Add('SELECT * FROM Algebra WHERE Год = '+IntToStr(god)+' AND Четверть = '+IntToStr(chet)+' AND id_1 = '+IntToStr(id));
        1 : sql.Add('SELECT * FROM Geometry WHERE Год = '+IntToStr(god)+' AND Четверть = '+IntToStr(chet)+' AND id_1 = '+IntToStr(id));
        2 : sql.Add('SELECT * FROM IstoriaK WHERE Год = '+IntToStr(god)+' AND Четверть = '+IntToStr(chet)+' AND id_1 = '+IntToStr(id));
        3 : sql.Add('SELECT * FROM IstoriaV WHERE Год = '+IntToStr(god)+' AND Четверть = '+IntToStr(chet)+' AND id_1 = '+IntToStr(id));
        4 : sql.Add('SELECT * FROM Trud WHERE Год = '+IntToStr(god)+' AND Четверть = '+IntToStr(chet)+' AND id_1 = '+IntToStr(id));
        5 : sql.Add('SELECT * FROM RussianLanguage WHERE Год = '+IntToStr(god)+' AND Четверть = '+IntToStr(chet)+' AND id_1 = '+IntToStr(id));
        6 : sql.Add('SELECT * FROM KazackLanguage WHERE Год = '+IntToStr(god)+' AND Четверть = '+IntToStr(chet)+' AND id_1 = '+IntToStr(id));
        7 : sql.Add('SELECT * FROM RussianLitra WHERE Год = '+IntToStr(god)+' AND Четверть = '+IntToStr(chet)+' AND id_1 = '+IntToStr(id));
        8 : sql.Add('SELECT * FROM Economy WHERE Год = '+IntToStr(god)+' AND Четверть = '+IntToStr(chet)+' AND id_1 = '+IntToStr(id));
        9 : sql.Add('SELECT * FROM Fizra WHERE Год = '+IntToStr(god)+' AND Четверть = '+IntToStr(chet)+' AND id_1 = '+IntToStr(id));
      end;
      Open;
  end;
  Update();
end;

procedure TForm2.BitBtn4Click(Sender: TObject);
begin
  TreeView1.Visible:= true;
  DBGrid1.Visible:= true;
  Memo1.Visible:= true;
  BitBtn6.Visible:= true;
  //BitBtn1.Visible:= false;
  BitBtn4.Visible:= false;
  BitBtn3.Visible:= false;
  GroupBox1.Width:= 497;
  GroupBox1.Height:= 401;
  with ADOQuery1 do
  begin
    Close;
    sql.Clear;
    sql.Add('SELECT * FROM domalg WHERE Класс = '+Edit12.Text+' AND Буква = '+#39+Edit13.Text+#39+' AND Предмет = 0 AND Времявыполнения > '+IntToStr(DateTimeToUnix(Date)));
    Open;
  end;
end;

procedure TForm2.BitBtn6Click(Sender: TObject);
begin
  if DBGrid1.Visible = true then
  begin
    BitBtn4.Visible:= true;
    //BitBtn1.Visible:= true;
    TreeView1.Visible:= false;
    DBGrid1.Visible:= false;
    Memo1.Visible:= false;
    BitBtn6.Visible:= false;
    BitBtn3.Visible:= true;
    GroupBox1.Width:= 489;
    GroupBox1.Height:= 73;
  end
  else
  begin
    GroupBox2.Visible:= false;
    ComboBox1.Visible:= false;
    DBGrid2.Visible:= false;
    GroupBox1.Width:= 489;
    GroupBox1.Height:= 73;
    BitBtn4.Visible:= true;
    BitBtn3.Visible:= true;
    BitBtn6.Visible:= false;
  end;
end;

procedure TForm2.Button1Click(Sender: TObject);
begin
  Update();
end;

procedure TForm2.ComboBox1Change(Sender: TObject);
var
id:integer;
chet,god: integer;
begin
  id:= StrToInt(Edit11.Text);
  with ADOQuery2 do
  begin
    Close;
    sql.Clear;
    sql.Add('SELECT * FROM ctv WHERE Код = '+IntToStr(ComboBox1.ItemIndex+1));
    Open;
  end;
  chet:= DBGrid2.DataSource.DataSet.Fields[1].AsInteger;
  god:= DBGrid2.DataSource.DataSet.Fields[2].AsInteger;
  with ADOQuery2 do
  begin
      Close;
      sql.Clear;
      case ComboBox1.ItemIndex of
        0 : sql.Add('SELECT * FROM Algebra WHERE Год = '+IntToStr(god)+' AND Четверть = '+IntToStr(chet)+' AND id_1 = '+IntToStr(id));
        1 : sql.Add('SELECT * FROM Geometry WHERE Год = '+IntToStr(god)+' AND Четверть = '+IntToStr(chet)+' AND id_1 = '+IntToStr(id));
        2 : sql.Add('SELECT * FROM IstoriaK WHERE Год = '+IntToStr(god)+' AND Четверть = '+IntToStr(chet)+' AND id_1 = '+IntToStr(id));
        3 : sql.Add('SELECT * FROM IstoriaV WHERE Год = '+IntToStr(god)+' AND Четверть = '+IntToStr(chet)+' AND id_1 = '+IntToStr(id));
        4 : sql.Add('SELECT * FROM Trud WHERE Год = '+IntToStr(god)+' AND Четверть = '+IntToStr(chet)+' AND id_1 = '+IntToStr(id));
        5 : sql.Add('SELECT * FROM RussianLanguage WHERE Год = '+IntToStr(god)+' AND Четверть = '+IntToStr(chet)+' AND id_1 = '+IntToStr(id));
        6 : sql.Add('SELECT * FROM KazackLanguage WHERE Год = '+IntToStr(god)+' AND Четверть = '+IntToStr(chet)+' AND id_1 = '+IntToStr(id));
        7 : sql.Add('SELECT * FROM RussianLitra WHERE Год = '+IntToStr(god)+' AND Четверть = '+IntToStr(chet)+' AND id_1 = '+IntToStr(id));
        8 : sql.Add('SELECT * FROM Economy WHERE Год = '+IntToStr(god)+' AND Четверть = '+IntToStr(chet)+' AND id_1 = '+IntToStr(id));
        9 : sql.Add('SELECT * FROM Fizra WHERE Год = '+IntToStr(god)+' AND Четверть = '+IntToStr(chet)+' AND id_1 = '+IntToStr(id));
      end;
      Open;
  end;
  Update();
end;

procedure TForm2.DataSource1DataChange(Sender: TObject; Field: TField);
begin
  Memo1.Lines.Clear;
  Memo1.Lines.Add(DBGrid1.DataSource.DataSet.Fields[1].AsString);
end;

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.Terminate;
end;

procedure TForm2.FormCreate(Sender: TObject);
var
s:string;
i, c:integer;
begin
  s:= GetCurrentDir;
  for i:= 0 to Length(s) do
  begin
    if (s[i] = '\') AND (s[i+1] = 'К') AND (s[i+2] = 'л') AND (s[i+3] = 'и') then c:= i;
  end;
  Delete(s, c, Length(s));
  s:= s+'\Администратор\Березуцкий Д.В\Программа\db.mdb';
  ADOConnection1.ConnectionString:= s;
  ADOConnection1.Connected:= true;
  ADOQuery1.Active:= true;
  ADOConnection2.ConnectionString:= s;
  ADOConnection2.Connected:= true;
  ADOQuery2.Active:= true;
  ADOConnection3.ConnectionString:= s;
  ADOConnection3.Connected:= true;
  ADOQuery3.Active:= true;
end;

procedure TForm2.TreeView1Change(Sender: TObject; Node: TTreeNode);
var
pred:integer;
i:integer;
begin
  for i:= 0 to TreeView1.Items.Count-1 do
  begin
    if TreeView1.Items.Item[i].Selected then pred:= i;
  end;
  with ADOQuery1 do
  begin
    Close;
    sql.Clear;
    sql.Add('SELECT * FROM domalg WHERE Класс = '+Edit12.Text+' AND Буква = '+#39+Edit13.Text+#39+' AND Предмет = '+IntToStr(pred)+' AND Времявыполнения > '+IntToStr(DateTimeToUnix(Date)));
    Open;
  end;
end;

end.
