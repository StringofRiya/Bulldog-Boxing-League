unit Setup_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Vcl.DBCtrls, dbmLeagueDB_u;

type
  TfrmSetup = class(TForm)
    rgpLength: TRadioGroup;
    Label1: TLabel;
    pnlLength: TPanel;
    btnRegister: TButton;
    pnlPlayers: TPanel;
    Image1: TImage;
    procedure rgpLengthClick(Sender: TObject);
    procedure btnRegisterClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSetup: TfrmSetup;
  arrPlayers: Array of TCombobox;
  lblNames: TLabel;
  TournamentLength: integer;

implementation

uses MainMenu_u;
{$R *.dfm}

procedure TfrmSetup.btnRegisterClick(Sender: TObject);
var
  i, j : integer;
  bComplete, bValid : boolean;
begin
  bComplete := False;
  bValid := False;

  for i := 1 to Length(arrPlayers) do
  begin
    if arrPlayers[i].ItemIndex = -1 then // Check if all players are filled in
    begin
      bComplete := False;
      Break;
    end
    else
    begin
      bComplete := True;
    end;
  end;

  for i := 1 to Length(arrPlayers) do
    begin
      for j := 1 to Length(arrPlayers) do
        begin
          if NOT(i = j) then
          begin
            if arrPlayers[i].Items[arrPlayers[i].ItemIndex] = arrPlayers[j].Items
            [arrPlayers[j].ItemIndex] then
            begin
              bValid := False;
              Break;
            end
            else
            begin
              bValid := True;
            end;
          end;
        end;

      if bValid = False then
      begin
        Break;
      end;
    end;

  if bComplete = False then
  begin
    ShowMessage('Please register all players');
  end;

  if bValid = False then
  begin
    ShowMessage('Player may not be registered more than once');
  end;

  if (bComplete = True) AND (bValid = True) then
  begin
    ShowMessage('Registration Complete');
    frmSetup.Hide;
  end;
end;

procedure TfrmSetup.FormCreate(Sender: TObject);
begin
  TournamentLength := -1;
  btnRegister.Enabled := False;
end;

procedure TfrmSetup.rgpLengthClick(Sender: TObject);
var k : integer;
begin
  if Length(arrPlayers) <> 0 then
  begin
    lblNames.Free;
    lblNames := nil;
    for k := 1 to Length(arrPlayers) do
    begin
      arrPlayers[k].Free;
      arrPlayers[k] := nil;
    end;
  end;

  if rgpLength.ItemIndex = 0 then
  begin
    lblNames := TLabel.Create(pnlPlayers);
    with lblNames do
    begin
      Parent := pnlPlayers;
      Top := 15;
      Left := 100;
      Caption := 'Names of Players';
      Font.Style := [fsUnderline, fsBold];
    end;

    SetLength(arrPlayers, 4);
    for k := 1 to Length(arrPlayers) do
    begin
      arrPlayers[k] := TCombobox.Create(pnlPlayers);
      with arrPlayers[k] do
      begin
        Parent := pnlPlayers;
        Text := 'Player ' + IntToStr(k);
        Left := 24;
        Top := 60 + ((k - 1) * 50);
        Width := 120;

        dmLeague.tblPlayers.First;
        while NOT(dmLeague.tblPlayers.EOF) do
        begin
          Items.Add(dmLeague.tblPlayers['PlayerName']);
          dmLeague.tblPlayers.Next;
        end;
      end;

    end;
  end
  else if rgpLength.ItemIndex = 1 then
  begin
    lblNames := TLabel.Create(pnlPlayers);
    with lblNames do
    begin
      Parent := pnlPlayers;
      Top := 15;
      Left := 100;
      Caption := 'Names of Players';
      Font.Style := [fsUnderline, fsBold];
    end;

    SetLength(arrPlayers, 8);
    for k := 1 to Length(arrPlayers) do
    begin
      arrPlayers[k] := TCombobox.Create(pnlPlayers);
      with arrPlayers[k] do
      begin
        Parent := pnlPlayers;
        Text := 'Player ' + IntToStr(k);
        Width := 120;
        if k <= 4 then
        begin
          Left := 24;
          Top := 60 + ((k - 1) * 50);
        end
        else
        begin
          Left := 160;
          Top := 60 + ((k - 5) * 50);
        end;

        dmLeague.tblPlayers.First;
        while NOT(dmLeague.tblPlayers.EOF) do
        begin
          Items.Add(dmLeague.tblPlayers['PlayerName']);
          dmLeague.tblPlayers.Next;
        end;
      end;
    end;
  end;

  TournamentLength := rgpLength.ItemIndex;
  btnRegister.Enabled := True;
end;

end.
