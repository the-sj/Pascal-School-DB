// nahuj b�ad githubs nedod garumz�mes. Pizdjec b�ad.
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
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
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
      sldb: TSQLiteDatabase;
      sltb: TSQLIteTable;
      sltb2: TSQLIteTable;
      sSQL: String;

      Col: TListColumn;
      Itm: TListItem;

      testing: integer;

procedure TForm2.Button1Click(Sender: TObject);
begin
Unit2.Form2.Hide;
Form1.Show;
end;

procedure TForm2.FormActivate(Sender: TObject);
begin
//�o palai� tad, kad tiek par�d�ta forma. lolnavdokument�cija.
//Piez�me - to palai� katru reizi, kad tiek fokus�ts dotais logs.
//aka: TODO: Move to formcreate();
//Datub�ze
slDBPath := ExtractFilepath(application.exename)
+ '\pascal.db';

//Pievienojam kolonas (BUG: Pirm�s kolonas nosaukums negrib centr�ties)
//Visp�r t� izskat�s lab�k. Nelabot.
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
Itm.Caption := 'test';

Itm := ListView1.Items.Add;
Itm.Caption := IntToStr(testing);
Itm.SubItems.Add('tester');
Itm.SubItems.Add('tester2');

{
sldb := TSQLiteDatabase.Create(slDBPath);
sltb := slDb.GetTable('SELECT * FROM `skolotaji` WHERE `id` = 1');
StaticText1.Caption := sltb.FieldByName['vards'] + ' ' + sltb.FieldByName['uzvards'];
dieHardFix := sltb.FieldByName['prieksmets'];
StaticText3.Caption := sltb.FieldByName['kabinets'];
sltb2 := slDb.GetTable('SELECT * FROM `prieksmeti` WHERE `textid` = "'+ dieHardFix +'"');

StaticText2.Caption := sltb2.FieldByName['nosaukums'];
end;
}
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
//Tiek izsaukts tad, kad tiek palaista programma. Teor�tiski. Realit�t� �� fig�a nestr�d�.
end;

end.
