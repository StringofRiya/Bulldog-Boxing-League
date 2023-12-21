unit Semi_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Setup_u, Finals_u, Vcl.Imaging.pngimage;

type
  TfrmSemi = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    rgp1: TRadioGroup;
    rgp2: TRadioGroup;
    lblWinner1: TLabel;
    lblWinner2: TLabel;
    btnNext: TButton;
    Image2: TImage;
    Image1: TImage;
    Image3: TImage;
    Image4: TImage;
    procedure FormShow(Sender: TObject);
    procedure rgp1Click(Sender: TObject);
    procedure rgp2Click(Sender: TObject);
    procedure btnNextClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSemi: TfrmSemi;

implementation
uses Quarters_u;
{$R *.dfm}

procedure TfrmSemi.btnNextClick(Sender: TObject);
begin
 if (rgp1.ItemIndex = -1) OR (rgp2.ItemIndex = -1) then
 begin
   ShowMessage('Please select a winner for each game before proceeding');
 end
 else
 begin
   frmSemi.Hide;
   frmFinals.Show;
 end;
end;

procedure TfrmSemi.FormShow(Sender: TObject);
var k, i : integer;
begin
  SetLength(arrParticipants,4);
  arrParticipants := [lbl1, lbl2, lbl3, lbl4];
  if TournamentLength = 0  then
  begin
    Randomize;
    for k := 0 to 3 do
    begin
      arrParticipants[k].Caption := arrPlayers[k+1].Items[arrPlayers[k+1].ItemIndex];
    end;
  end
  else
  if TournamentLength = 1 then
  begin
    arrParticipants[0].Caption := sWinner1;
    arrParticipants[1].Caption := sWinner2;
    arrParticipants[2].Caption := sWinner3;
    arrParticipants[3].Caption := sWinner4;
  end;

  SetLength(arrGroup,2);
  arrGroup := [rgp1, rgp2];
  for i := 0 to Length(arrGroup) - 1 do
    begin
      arrGroup[i].Items[0] := arrParticipants[i+i].Caption;
      arrGroup[i].Items[1] := arrParticipants[i+i+1].Caption;
    end;
end;

procedure TfrmSemi.rgp1Click(Sender: TObject);
begin
 if rgp1.ItemIndex = 0 then
 begin
   lblWinner1.Caption := 'Winner 1: ' + rgp1.Items[0];
   sWinner1 := rgp1.Items[0];
 end
 else
 begin
   lblWinner1.Caption := 'Winner 1: ' + rgp1.Items[1];
   sWinner1 := rgp1.Items[1];
 end;

end;

procedure TfrmSemi.rgp2Click(Sender: TObject);
begin
 if rgp2.ItemIndex = 0 then
 begin
   lblWinner2.Caption := 'Winner 2: ' + rgp2.Items[0];
   sWinner2 := rgp2.Items[0];
 end
 else
 begin
   lblWinner2.Caption := 'Winner 2: ' + rgp2.Items[1];
   sWinner2 := rgp2.Items[1];
 end;
end;

end.
