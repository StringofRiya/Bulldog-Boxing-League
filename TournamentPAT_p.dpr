program TournamentPAT_p;



uses
  Vcl.Forms,
  MainMenu_u in 'MainMenu_u.pas' {frmMainMenu},
  Setup_u in 'Setup_u.pas' {frmSetup},
  Quarters_u in 'Quarters_u.pas' {frmQuarters},
  Semi_u in 'Semi_u.pas' {frmSemi},
  Finals_u in 'Finals_u.pas' {frmFinals},
  dbmLeagueDB_u in 'dbmLeagueDB_u.pas' {dmLeague: TDataModule},
  Registration_u in 'Registration_u.pas' {frmRegistration},
  Info_u in 'Info_u.pas' {frmInfo},
  Leaderboard_u in 'Leaderboard_u.pas' {frmLeaderboard},
  Winner_u in 'Winner_u.pas' {frmWinner},
  HelpNotes_u in 'HelpNotes_u.pas' {frmHelp};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMainMenu, frmMainMenu);
  Application.CreateForm(TfrmSetup, frmSetup);
  Application.CreateForm(TfrmQuarters, frmQuarters);
  Application.CreateForm(TfrmSemi, frmSemi);
  Application.CreateForm(TfrmFinals, frmFinals);
  Application.CreateForm(TdmLeague, dmLeague);
  Application.CreateForm(TfrmRegistration, frmRegistration);
  Application.CreateForm(TfrmInfo, frmInfo);
  Application.CreateForm(TfrmLeaderboard, frmLeaderboard);
  Application.CreateForm(TfrmWinner, frmWinner);
  Application.CreateForm(TfrmHelp, frmHelp);
  Application.Run;
end.
