unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, DB, ADODB, Grids,
  DBGrids, ExtCtrls, StdCtrls, ActnList,
  Buttons, ButtonGroup, DBCtrls, ExtDlgs, Menus, jpeg,
  ImgList, ComCtrls, ToolWin, ComObj, pngimage;

type
  TForm2 = class(TForm)
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Edit4: TEdit;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    Edit10: TEdit;
    GroupBox3: TGroupBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    DBImage1: TDBImage;
    Button1: TButton;
    Button2: TButton;
    OpenPictureDialog1: TOpenPictureDialog;
    Image1: TImage;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1Click(Sender: TObject);
    procedure Edit3Click(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure Edit3Exit(Sender: TObject);
    procedure Edit2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;
  Jpeg:TJPEGImage;
  k:bool;

implementation

{$R *.dfm}

uses Unit1;

procedure TForm2.BitBtn1Click(Sender: TObject);
var
  bmp:TBitmap;
  jpg: TJpegImage;
begin
  if k = true then
  begin
    jpeg:=TJPEGImage.Create;
    bmp:=TBitmap.Create;
    jpeg.LoadFromFile(OpenPictureDialog1.FileName);
    bmp.Assign(jpeg);
    with Form1.ADOQuery1 do
    begin
      Close;
      sql.clear;
      sql.Add('INSERT INTO tab1 (�����, �����, �������, ���, ��������, ���, ���_���, Foto) ');
      sql.Add('VALUES('+#39+ComboBox1.Text+#39+','+#39+ComboBox2.Text+#39+','+#39+Edit1.Text+#39+','+#39+Edit2.Text+#39+','+#39+Edit3.Text+#39+','+#39+ComboBox3.Text+#39+','+#39+Edit10.Text+#39+', :img)');
      Form1.ADOQuery1.Parameters.ParamByName('img').Assign(bmp);
      ExecSQL;
      Close;
      sql.clear;
      sql.Add('INSERT INTO tab2 (���, �����_��, �����_���, �����_��, �����_���, ��_���_���) ');
      sql.Add('VALUES('+#39+Edit4.Text+#39+','+#39+Edit5.Text+#39+','+#39+Edit6.Text+#39+','+#39+Edit7.Text+#39+','+#39+Edit8.Text+#39+','+#39+Edit9.Text+#39+')');
      ExecSQL;
    end;
  end
  else
  begin
    with Form1.ADOQuery1 do
    begin
      Close;
      sql.clear;
      sql.Add('INSERT INTO tab1 (�����, �����, �������, ���, ��������, ���, ���_���, Foto) ');
      sql.Add('VALUES('+#39+ComboBox1.Text+#39+','+#39+ComboBox2.Text+#39+','+#39+Edit1.Text+#39+','+#39+Edit2.Text+#39+','+#39+Edit3.Text+#39+','+#39+ComboBox3.Text+#39+','+#39+Edit10.Text+#39+', "")');
      ExecSQL;
      Close;
      sql.clear;
      sql.Add('INSERT INTO tab2 (���, �����_��, �����_���, �����_��, �����_���, ��_���_���) ');
      sql.Add('VALUES('+#39+Edit4.Text+#39+','+#39+Edit5.Text+#39+','+#39+Edit6.Text+#39+','+#39+Edit7.Text+#39+','+#39+Edit8.Text+#39+','+#39+Edit9.Text+#39+')');
      ExecSQL;
  end;
  end;
  with Form1.ADOQuery1 do
  begin
    Close;
    sql.clear;
    sql.Add('SELECT * FROM tab1');
    Open;
  end;
  Form2.Close;
end;

procedure TForm2.BitBtn2Click(Sender: TObject);
begin
  Form2.Close;
end;

procedure TForm2.Button1Click(Sender: TObject);
begin
  if OpenPictureDialog1.Execute then
  begin
    Jpeg:=TJPEGImage.Create;
    Jpeg.LoadFromFile(OpenPictureDialog1.FileName);
    DBImage1.Picture.Bitmap.Assign(Jpeg);//��� ����� ��� ����������� bitmap
    Jpeg.Free;
    k:= true;
  end;
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
  DBImage1.Picture.Graphic:= nil;
  k:= false;
end;

procedure TForm2.Edit1Click(Sender: TObject);
begin
  if Edit1.Text = '�������' then Edit1.Text:= '';
end;

procedure TForm2.Edit1Exit(Sender: TObject);
begin
  if Edit1.Text = '' then Edit1.Text:= '�������';
end;

procedure TForm2.Edit2Click(Sender: TObject);
begin
  if Edit2.Text = '���' then Edit2.Text:= '';
end;

procedure TForm2.Edit2Exit(Sender: TObject);
begin
  if Edit2.Text = '' then Edit2.Text:= '���';
end;

procedure TForm2.Edit3Click(Sender: TObject);
begin
  if Edit3.Text = '��������' then Edit3.Text:= '';
end;

procedure TForm2.Edit3Exit(Sender: TObject);
begin
  if Edit3.Text = '' then Edit3.Text:= '��������';
end;

procedure TForm2.FormShow(Sender: TObject);
begin
  Edit1.Text:= '�������';
  Edit2.Text:= '���';
  Edit3.Text:= '��������';
  Edit4.Text:= '';
  Edit5.Text:= '';
  Edit6.Text:= '';
  Edit7.Text:= '';
  Edit8.Text:= '';
  Edit9.Text:= '';
  Edit10.Text:= '';
  ComboBox1.Text:= '';
  ComboBox2.Text:= '';
  ComboBox3.Text:= '';
  ComboBox1.ItemIndex:= -1;
  ComboBox2.ItemIndex:= -1;
  ComboBox3.ItemIndex:= -1;
  DBImage1.Picture.Graphic:= nil;
  k:= false;
end;

end.
