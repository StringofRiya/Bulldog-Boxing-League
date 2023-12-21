unit Info_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask,
  dbmLeagueDB_u, Vcl.Buttons;

type
  TfrmInfo = class(TForm)
    edtName: TDBEdit;
    edtSurname: TDBEdit;
    edtClub: TDBEdit;
    lblName: TLabel;
    cmbGender: TDBComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    btnConfirm: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmInfo: TfrmInfo;

implementation

{$R *.dfm}

procedure TfrmInfo.BitBtn1Click(Sender: TObject);
begin
  with dmLeague do
  begin
    tblPlayers.Edit;
    tblPlayers['PlayerName'] := edtName.Text;
    tblPlayers['Surname'] := edtSurname.text;
    tblPlayers['Gender'] := cmbGender.Items[cmbGender.ItemIndex];
    tblPlayers['Club'] := edtClub.Text;
   lblName.Caption := 'Information for: ' + tblPlayers['PlayerName'] + ' ' +
     tblPlayers['Surname'];
    tblPlayers.Post;
  end;
end;

procedure TfrmInfo.FormShow(Sender: TObject);
begin
  with dmLeague do
  begin
   lblName.Caption := 'Information for: ' + tblPlayers['PlayerName'] + ' ' +
     tblPlayers['Surname'];
  end;
end;

end.
