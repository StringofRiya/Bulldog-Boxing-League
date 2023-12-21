object frmLeaderboard: TfrmLeaderboard
  Left = 0
  Top = 0
  Caption = 'frmLeaderboard'
  ClientHeight = 338
  ClientWidth = 545
  Color = clPurple
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 216
    Top = 32
    Width = 112
    Height = 24
    Caption = 'Leaderboard'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -20
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object RankingDB: TDBGrid
    Left = 80
    Top = 72
    Width = 393
    Height = 225
    DataSource = dmLeague.dsrRanking
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Ranking'
        Width = 50
        Visible = True
      end
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
        FieldName = 'Level'
        Width = 45
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Wins'
        Width = 45
        Visible = True
      end>
  end
end
