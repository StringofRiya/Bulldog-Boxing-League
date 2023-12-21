object frmInfo: TfrmInfo
  Left = 0
  Top = 0
  Caption = 'frmInfo'
  ClientHeight = 304
  ClientWidth = 437
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblName: TLabel
    Left = 112
    Top = 40
    Width = 104
    Height = 18
    Caption = 'Information for:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label1: TLabel
    Left = 72
    Top = 85
    Width = 27
    Height = 13
    Caption = 'Name'
  end
  object Label2: TLabel
    Left = 256
    Top = 85
    Width = 42
    Height = 13
    Caption = 'Surname'
  end
  object Label3: TLabel
    Left = 72
    Top = 165
    Width = 74
    Height = 13
    Caption = 'Club/Institution'
  end
  object Label4: TLabel
    Left = 272
    Top = 165
    Width = 35
    Height = 13
    Caption = 'Gender'
  end
  object edtName: TDBEdit
    Left = 72
    Top = 104
    Width = 121
    Height = 21
    DataField = 'PlayerName'
    DataSource = dmLeague.dsrPlayers
    TabOrder = 0
  end
  object edtSurname: TDBEdit
    Left = 256
    Top = 104
    Width = 121
    Height = 21
    DataField = 'Surname'
    DataSource = dmLeague.dsrPlayers
    TabOrder = 1
  end
  object edtClub: TDBEdit
    Left = 72
    Top = 184
    Width = 121
    Height = 21
    DataField = 'Club'
    DataSource = dmLeague.dsrPlayers
    TabOrder = 2
  end
  object cmbGender: TDBComboBox
    Left = 272
    Top = 184
    Width = 57
    Height = 21
    DataField = 'Gender'
    DataSource = dmLeague.dsrPlayers
    Items.Strings = (
      'M'
      'F')
    TabOrder = 3
  end
  object btnConfirm: TBitBtn
    Left = 192
    Top = 240
    Width = 75
    Height = 25
    Caption = 'Confirm'
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 4
    OnClick = BitBtn1Click
  end
end
