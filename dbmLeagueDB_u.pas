unit dbmLeagueDB_u;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB;

type
  TdmLeague = class(TDataModule)
    conLeague: TADOConnection;
    tblPlayers: TADOTable;
    dsrPlayers: TDataSource;
    tblRanking: TADOTable;
    dsrRanking: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmLeague: TdmLeague;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
