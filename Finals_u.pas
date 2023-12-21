unit Finals_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Winner_u;

type
  TfrmFinals = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    lbl1: TLabel;
    lbl2: TLabel;
    rgpFinal: TRadioGroup;
    Image1: TImage;
    btnConfirm: TButton;
    Image3: TImage;
    Image2: TImage;
    Image4: TImage;
    Image5: TImage;
    procedure FormShow(Sender: TObject);
    procedure rgpFinalClick(Sender: TObject);
    procedure btnConfirmClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFinals: TfrmFinals;
  sFinalWinner : string;

implementation
uses Semi_u, Quarters_u;

{$R *.dfm}

procedure TfrmFinals.btnConfirmClick(Sender: TObject);
begin
 frmFinals.Hide;
 frmWinner.Show;
end;

procedure TfrmFinals.FormShow(Sender: TObject);
begin
  SetLength(arrParticipants,2);
  arrParticipants := [lbl1, lbl2];
  arrParticipants[0].Caption := sWinner1;
  arrParticipants[1].Caption := sWinner2;

  rgpFinal.Items[0] := arrParticipants[0].Caption;
  rgpFinal.Items[1] := arrParticipants[1].Caption;
end;

procedure TfrmFinals.rgpFinalClick(Sender: TObject);
begin
 btnConfirm.Enabled := True;

 if rgpFinal.ItemIndex = 0 then
 begin
   sFinalWinner := rgpFinal.Items[0];
 end
 else
 begin
   sFinalWinner := rgpFinal.Items[1];
 end;
end;

end.
