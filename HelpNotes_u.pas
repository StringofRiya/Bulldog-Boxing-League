unit HelpNotes_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls;

type
  TfrmHelp = class(TForm)
    redDisplay: TRichEdit;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmHelp: TfrmHelp;

implementation

{$R *.dfm}

procedure TfrmHelp.FormShow(Sender: TObject);
begin
 redDisplay.Lines.LoadFromFile('C:\Users\abrah\OneDrive\Documents\Grade 11 PAT\Help.txt');
end;

end.
