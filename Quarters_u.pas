unit Quarters_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Setup_u,
  Vcl.Samples.Spin, Semi_u, Vcl.Imaging.pngimage;

type
  TfrmQuarters = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Label1: TLabel;
    lblWinner1: TLabel;
    lblWinner2: TLabel;
    lblWinner3: TLabel;
    lblWinner4: TLabel;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    rgp1: TRadioGroup;
    rgp2: TRadioGroup;
    rgp3: TRadioGroup;
    rgp4: TRadioGroup;
    btnNext: TButton;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    Image8: TImage;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure rgp1Click(Sender: TObject);
    procedure rgp2Click(Sender: TObject);
    procedure rgp3Click(Sender: TObject);
    procedure rgp4Click(Sender: TObject);
    procedure btnNextClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmQuarters: TfrmQuarters;
  arrParticipants : Array of TLabel; //Participants in tournament
  arrGroup : Array of TRadioGroup;
  sWinner1, sWinner2, sWinner3, sWinner4 : string;
implementation

{$R *.dfm}

procedure TfrmQuarters.btnNextClick(Sender: TObject);
begin
 if (rgp1.ItemIndex = -1) OR (rgp2.ItemIndex = -1) OR (rgp3.ItemIndex = -1) OR (rgp4.ItemIndex = -1) then
 begin
   ShowMessage('Please select a winner for each game before proceeding');
 end
 else
 begin
   frmQuarters.Hide;
   frmSemi.Show;
 end;
end;

procedure TfrmQuarters.FormCreate(Sender: TObject);
begin
 Panel1.Left := 80;
 Panel1.Top := 104;
 Panel2.Left := 80;
 Panel2.Top := 376;
end;

procedure TfrmQuarters.FormShow(Sender: TObject);
var k, i : integer;
begin
 if TournamentLength = 1 then
 begin
   SetLength(arrParticipants,8);
   arrParticipants := [lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, lbl7, lbl8];
   for k := 0 to Length(arrParticipants) - 1 do
    begin
      arrParticipants[k].Caption := arrPlayers[k+1].Items[arrPlayers[k+1].ItemIndex];
    end;

   SetLength(arrGroup,4);
   arrGroup := [rgp1, rgp2, rgp3, rgp4];
   for i := 0 to Length(arrGroup) - 1 do
     begin
       arrGroup[i].Items[0] := arrParticipants[i+i].Caption;
       arrGroup[i].Items[1] := arrParticipants[i+i+1].Caption;
     end;
 end;
end;

procedure TfrmQuarters.rgp1Click(Sender: TObject);
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

procedure TfrmQuarters.rgp2Click(Sender: TObject);
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

procedure TfrmQuarters.rgp3Click(Sender: TObject);
begin
 if rgp3.ItemIndex = 0 then
 begin
   lblWinner3.Caption := 'Winner 3: ' + rgp3.Items[0];
   sWinner3 := rgp3.Items[0];
 end
 else
 begin
   lblWinner3.Caption := 'Winner 3: ' + rgp3.Items[1];
   sWinner3 := rgp3.Items[1];
 end;
end;

procedure TfrmQuarters.rgp4Click(Sender: TObject);
begin
 if rgp4.ItemIndex = 0 then
 begin
   lblWinner4.Caption := 'Winner 4: ' + rgp4.Items[0];
   sWinner4 := rgp4.Items[0];
 end
 else
 begin
   lblWinner4.Caption := 'Winner 4: ' + rgp4.Items[1];
   sWinner4 := rgp4.Items[1];
 end;
end;

end.
