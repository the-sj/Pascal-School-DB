unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Data.SqlExpr,
  Data.DBXSybaseASA, Bde.DBTables, Vcl.ComCtrls;

type
  TForm2 = class(TForm)
    Button1: TButton;
    SQLConnection1: TSQLConnection;
    ListView1: TListView;
    Button2: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;


implementation

{$R *.dfm}

uses SQLite3, SQLiteTable3, project;
var   slDBpath: string;
      sSQL: String;
      sldb: TSQLiteDatabase;
      sltb: TSQLIteTable;

      Col: TListColumn;
      Itm: TListItem;



procedure TForm2.Button1Click(Sender: TObject);
begin
Unit2.Form2.Close;
Form1.Show;
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
Form1.Show;
Form2.Close;
end;

//�o palai� tad, kad tiek fokus�ta forma.
//Piez�me - to palai� katru reizi, kad tiek fokus�ts dotais logs.
procedure TForm2.FormActivate(Sender: TObject);
begin
//
end;


//Aizveram programmu, jo m�s nem�kam properly tikt gal� ar logiem.
procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
if Form1.Showing = false then
Form1.Close;
end;

//Tiek izsaukts tad, kad tiek palaista forma.
procedure TForm2.FormCreate(Sender: TObject);
begin
//Datub�ze
slDBPath := ExtractFilepath(application.exename) + '\pascal.db';
sldb := TSQLiteDatabase.Create(slDBPath);

//Kolonas ir t�d� k�rt�b�, k�d� tu t�s pievieno.
{ K� str�d� (jo dokument�cija neeksist�):
Col := ListView1.Columns.add;
Col.Caption := <string>;
Col.Alignment := <integer>; //iesp�jamie varianti: taLeftJustify, taRightJustify, taCenter.
Col.Width := <integer>; }

Col := ListView1.Columns.Add;
Col.Caption := 'Pasniedz�js';
Col.Alignment := taCenter;
Col.Width := ListView1.Width div 3;

Col := ListView1.Columns.Add;
Col.Caption := 'Priek�mets';
Col.Alignment := taCenter;
Col.Width := ListView1.Width div 3;

Col := ListView1.Columns.Add;
Col.Caption := 'Kabinets';
Col.Alignment := taCenter;
Col.Width := ListView1.Width div 3;

//Pievienojam visu ko var pievienot. (TODO: Izvelkam SQL)
//BUG: Var iez�m�t tikai 1. kolonas datus. Vainoju Embarcadero. IDGAF.
{ K� str�d�:
Itm := ListView1.Items.Add;
Itm.Caption := <string>;
Item.SubItem.Add(<string); //pievieno datus n�kamaj� kolon�. Iet p�c k�rtas.
//Var pievienot tik substring, cik vajag, bet mums ir tikai 3 kolonas.
//Liekie subitems tiks ignor�ti, un neb�s par�d�ti. }
Itm := ListView1.Items.Add;
Itm.Caption := 'DEBUG';
Itm.SubItems.Add('Searchpam: ' + Form1.Edit1.Text);
Itm.SubItems.Add('Searchtype: ' + IntToStr(Form1.ComboBox1.ItemIndex));

{   ComboBox1.AddItem('Kabineta nr.', nil);
  ComboBox1.AddItem('Skolot�ja', nil);
  ComboBox1.AddItem('Priek�meta',nil);
  }
case Form1.ComboBox1.ItemIndex of
  0: sSQL := 'select * from skolotaji where kabinets like ' + Form1.Edit1.Text;
  1: sSQL := 'select * from skolotaji where vards like "%' + Form1.Edit1.Text + '%"';
  2: sSQL := 'select * from skolotaji where prieksmets like "%' + Form1.Edit1.Text + '%"';
end;
sltb := slDb.GetTable(sSQL);

Itm := ListView1.Items.Add;
Itm.Caption := sltb.FieldByName['vards'];
Itm.SubItems.Add(sltb.FieldByName['prieksmets']);
Itm.SubItems.Add(sltb.FieldByName['kabinets']);


end;

{
sldb := TSQLiteDatabase.Create(slDBPath);
sltb := slDb.GetTable('SELECT * FROM `skolotaji` WHERE `id` = 1');
StaticText1.Caption := sltb.FieldByName['vards'] + ' ' + sltb.FieldByName['uzvards'];
dieHardFix := sltb.FieldByName['prieksmets'];
StaticText3.Caption := sltb.FieldByName['kabinets'];
sltb2 := slDb.GetTable('SELECT * FROM `prieksmeti` WHERE `textid` = "'+ dieHardFix +'"');
end;
}

end.
