unit MainMenu_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Setup_u,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, Quarters_u, Semi_u, Registration_u, Leaderboard_u,
  HelpNotes_u, Vcl.Buttons;

type
  TfrmMainMenu = class(TForm)
    btnRegistration: TButton;
    btnStart: TButton;
    btnData: TButton;
    Label1: TLabel;
    Image1: TImage;
    btnRanking: TButton;
    BitBtn1: TBitBtn;
    Image2: TImage;
    procedure btnRegistrationClick(Sender: TObject);
    procedure btnStartClick(Sender: TObject);
    procedure btnDataClick(Sender: TObject);
    procedure btnRankingClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMainMenu: TfrmMainMenu;

implementation

{$R *.dfm}

procedure TfrmMainMenu.BitBtn1Click(Sender: TObject);
begin
  frmHelp.Show;
end;

procedure TfrmMainMenu.btnDataClick(Sender: TObject);
begin
 frmMainMenu.Hide;
 frmRegistration.Show;
end;

procedure TfrmMainMenu.btnRankingClick(Sender: TObject);
begin
 frmLeaderboard.Show;
end;

procedure TfrmMainMenu.btnRegistrationClick(Sender: TObject);
begin
 frmSetup.Show;
end;

procedure TfrmMainMenu.btnStartClick(Sender: TObject);
begin
 if TournamentLength = 0 then   //if Tournament Length is short
 begin
   frmSemi.Show;
   frmMainMenu.Hide;
 end
 else
 if TournamentLength = 1 then   //if Tournament Length is long
 begin
   frmQuarters.Show;
   frmMainMenu.Hide;
 end
 else
 begin
   ShowMessage('Please register players first');  //if tournament has not been set up
 end;
end;

end.
