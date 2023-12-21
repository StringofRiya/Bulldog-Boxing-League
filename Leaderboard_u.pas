unit Leaderboard_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids, dbmLeagueDB_u,
  Vcl.StdCtrls;

type
  TfrmLeaderboard = class(TForm)
    RankingDB: TDBGrid;
    Label1: TLabel;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLeaderboard: TfrmLeaderboard;

implementation
uses Registration_u;

{$R *.dfm}


procedure TfrmLeaderboard.FormShow(Sender: TObject);
var iRank : integer;
begin
 with dmLeague do
 begin
   tblRanking.First;
   while NOT(tblRanking.EOF) do
   begin
     tblRanking.Delete;
   end;

   iRank := 0;
   tblRanking.First;
   tblPlayers.First;
   while NOT(tblPlayers.EOF) do
   begin
     tblRanking.Append;
     inc(iRank);
     tblRanking['Ranking'] := iRank;
     tblRanking['PlayerID'] := tblPlayers['PlayerID'];
     tblRanking['PlayerName'] := tblPlayers['PlayerName'];
     tblRanking['Surname'] := tblPlayers['Surname'];
     tblRanking['Level'] := tblPlayers['Level'];
     tblRanking['Wins'] := tblPlayers['Wins'];
     tblRanking.Post;
     tblPlayers.Next;
   end;

   tblRanking.Sort := 'Wins DESC';

   iRank := 0;
   tblRanking.First;
   while NOT(tblRanking.EOF) do
   begin
     tblRanking.Edit;
     Inc(iRank);
     tblRanking['Ranking'] := iRank;
     tblRanking.Post;
     tblRanking.Next;
   end;
 end;

end;
end.
