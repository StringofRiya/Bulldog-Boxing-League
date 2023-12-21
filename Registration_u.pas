unit Registration_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  dbmLeagueDB_u, Info_u,
  Vcl.StdCtrls, Leaderboard_u, Vcl.Buttons;

type
  TfrmRegistration = class(TForm)
    PlayersDB: TDBGrid;
    btnRegister: TButton;
    btnEdit: TButton;
    btnDelete: TButton;
    Label1: TLabel;
    btnBack: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure btnRegisterClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnBackClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRegistration: TfrmRegistration;

implementation
uses MainMenu_u;
{$R *.dfm}

procedure TfrmRegistration.btnBackClick(Sender: TObject);
begin
 frmRegistration.Hide;
 frmMainMenu.Show;
end;

procedure TfrmRegistration.btnDeleteClick(Sender: TObject);
begin
  with dmLeague do
  begin
    if MessageDLG('Record for ' + tblPlayers['PlayerName'] + ' will be permanently deleted.' + #13 +
      'Are you sure you want to delete this record?', mtConfirmation, mbYesNo,
      0) = mrYes then
    begin
      tblPlayers.Delete;
      ShowMessage('Record Deleted');
    end
    else
    begin
      ShowMessage('Cancelled');
    end;
  end;

end;

procedure TfrmRegistration.btnEditClick(Sender: TObject);
begin
 frmInfo.Show;
end;

procedure TfrmRegistration.btnRegisterClick(Sender: TObject);
var cGender : char;
    sGender : string;
    bUnique : boolean;
begin
  with dmLeague do
  begin
    tblPlayers.Last;
    tblPlayers.Append;
    bUnique := False;

    while bUnique = False do
    begin
      try
        tblPlayers['PlayerName'] := InputBox('Player Name', 'Enter Name', '');
        tblPlayers.Post;
        bUnique := True;
      except
        ShowMessage('Player name must be unique!');
        bUnique := False;
      end;
    end;

    tblPlayers.Edit;
    tblPlayers['Surname'] := InputBox('Surname', 'Enter Surname', '');

    while NOT((tblPlayers['Gender'] = 'M') OR (tblPlayers['Gender'] = 'F')) do
    begin
     sGender := InputBox('Gender', 'Enter Gender(M/F)', '');
      if (UpperCase(sGender) = UpperCase('Male')) OR
        (UpperCase(sGender) = UpperCase('Female')) OR
        (UpperCase(sGender) = UpperCase('M')) OR
        (UpperCase(sGender) = UpperCase('F')) then
      begin
        cGender := sGender[1];
        tblPlayers['Gender'] := UpperCase(cGender);
      end
      else
      begin
        ShowMessage('Invalid Gender');
      end;
    end;

    tblPlayers['Club'] := InputBox('Club', 'Enter Club/Institution', '');
    tblPlayers.Post;

    tblRanking.Append;
    tblRanking['Ranking'] := tblRanking['Ranking'] + 1;
    tblRanking['PlayerID'] := tblPlayers['PlayerID'];
    tblRanking['PlayerName'] := tblPlayers['PlayerName'];
    tblRanking['Surname'] := tblPlayers['Surname'];
    tblRanking['Level'] := tblPlayers['Level'];
    tblRanking['Wins'] := tblPlayers['Wins'];
    tblRanking.Post;
  end;
end;

procedure TfrmRegistration.FormCreate(Sender: TObject);
begin
  with dmLeague do
  begin
    tblPlayers.Sort := 'PlayerID ASC';
  end;
end;

procedure TfrmRegistration.FormShow(Sender: TObject);
begin
 with dmLeague do
 begin
   tblPlayers.First;
   while NOT(tblPlayers.EOF) do
   begin
     tblPlayers.Edit;
     tblPlayers['Level'] := (tblPlayers['Wins'] DIV 2);
     tblPlayers.Post;
     tblPlayers.Next;
   end;
 end;

end;

end.
