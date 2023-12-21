object frmRegistration: TfrmRegistration
  Left = 0
  Top = 0
  Caption = 'frmRegistration'
  ClientHeight = 429
  ClientWidth = 732
  Color = clMoneyGreen
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 312
    Top = 42
    Width = 127
    Height = 18
    Caption = 'Registered Players'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Bahnschrift'
    Font.Style = []
    ParentFont = False
  end
  object PlayersDB: TDBGrid
    Left = 112
    Top = 74
    Width = 521
    Height = 247
    DataSource = dmLeague.dsrPlayers
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'PlayerID'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PlayerName'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Surname'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Gender'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Club'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Wins'
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Level'
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Qualified'
        Width = 50
        Visible = True
      end>
  end
  object btnRegister: TButton
    Left = 128
    Top = 352
    Width = 129
    Height = 25
    Caption = 'Register new player'
    TabOrder = 1
    OnClick = btnRegisterClick
  end
  object btnEdit: TButton
    Left = 303
    Top = 352
    Width = 116
    Height = 25
    Caption = 'Edit information'
    TabOrder = 2
    OnClick = btnEditClick
  end
  object btnDelete: TButton
    Left = 464
    Top = 352
    Width = 113
    Height = 25
    Caption = 'Delete a record'
    TabOrder = 3
    OnClick = btnDeleteClick
  end
  object btnBack: TBitBtn
    Left = 32
    Top = 24
    Width = 75
    Height = 25
    Caption = 'Back'
    TabOrder = 4
    OnClick = btnBackClick
  end
end
