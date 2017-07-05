unit Unit8;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, pngimage, ExtCtrls, StdCtrls, Buttons, Grids, DBGrids, DB, ADODB;

type
  TForm8 = class(TForm)
    GroupBox1: TGroupBox;
    BitBtn1: TBitBtn;
    LabeledEdit1: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    BitBtn2: TBitBtn;
    Image1: TImage;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form8: TForm8;

implementation

uses Unit1;

{$R *.dfm}

procedure TForm8.BitBtn1Click(Sender: TObject);
begin
  with ADOQuery1 do
  begin
    try
      Close;
      sql.Clear;
      sql.Add('SELECT * FROM Accounts WHERE ����� = '+#39+LabeledEdit1.Text+#39+' AND ������ = '+#39+LabeledEdit2.Text+#39+'');
      Open;
    except
      LabeledEdit1.Text:= '';
      LabeledEdit2.Text:= '';
      ShowMessage('������������ �� ������.');
    end;
  end;
  if DBGrid1.DataSource.DataSet.RecordCount < 1 then
  begin
    ShowMessage('������������ �� ������.');
      LabeledEdit1.Text:= '';
      LabeledEdit2.Text:= '';
  end
  else
  begin
    Form1.Show;
    if ADOQuery1.FieldByName('������').AsInteger > 0 then
    begin
      Form1.GroupBox3.Width:= 919;
      Form1.Button7.Visible:= true;
    end;
    Form1.Edit11.Text:= LabeledEdit1.Text;
    //Form1.Edit11.Text:= DBGrid1.DataSource.DataSet.Fields[7].AsString;
    //Form1.Edit12.Text:= DBGrid1.DataSource.DataSet.Fields[0].AsString;
    //Form1.Edit13.Text:= DBGrid1.DataSource.DataSet.Fields[1].AsString;
    Form8.Hide;
  end;
end;

procedure TForm8.BitBtn2Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TForm8.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.Terminate;
end;

procedure TForm8.FormCreate(Sender: TObject);
begin
  ADOQuery1.Active:= false;
  ADOConnection1.Connected:= false;
  ADOConnection1.ConnectionString:= GetCurrentDir()+'\db.mdb';
  ADOConnection1.Connected:= true;
  ADOQuery1.Active:= true;
end;

end.
