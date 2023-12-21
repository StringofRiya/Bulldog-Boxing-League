unit Winner_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.jpeg, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage, Vcl.StdCtrls, dbmLeagueDB_u, Vcl.Buttons;

type
  TfrmWinner = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    Image2: TImage;
    lblWinner: TLabel;
    btnMainMenu: TButton;
    Image3: TImage;
    procedure FormShow(Sender: TObject);
    procedure btnMainMenuClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmWinner: TfrmWinner;

implementation
uses Finals_u, MainMenu_u;
{$R *.dfm}

procedure TfrmWinner.BitBtn1Click(Sender: TObject);
begin
 frmWinner.Hide;
 frmMainMenu.Show;
end;

procedure TfrmWinner.btnMainMenuClick(Sender: TObject);
begin
 frmWinner.Hide;
 frmMainMenu.Show;
end;

procedure TfrmWinner.FormShow(Sender: TObject);
begin
 Image1.Top := 0;
 Image1.Left := 0;

 lblWinner.Caption := sFinalWinner;

 with dmLeague do
 begin
   tblPlayers.First;
   while NOT(tblPlayers.EOF) do
   begin
     if tblPlayers['PlayerName'] = sFinalWinner then
     begin
       tblPlayers.Edit;
       tblPlayers['Wins'] := tblPlayers['Wins'] + 1; //Update Wins of Final Winner
       tblPlayers.Post;
       Break;
     end
     else
     begin
       tblPlayers.Next;
     end;
   end;
 end;

end;

end.
