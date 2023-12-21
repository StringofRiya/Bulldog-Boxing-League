unit cover_u;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  Menus, type_u;

type

  { TfrmMenu }

  TfrmMenu = class(TForm)
    btnCreate: TButton;
    btnSaved: TButton;
    btnRegister: TButton;
    Image1: TImage;
    lblTitle: TLabel;
    procedure btnCreateClick(Sender: TObject);
  private

  public

  end;

var
  frmMenu: TfrmMenu;

implementation

{$R *.lfm}

{ TfrmMenu }

procedure TfrmMenu.btnCreateClick(Sender: TObject);
begin
 frmType.Show;
end;

end.

