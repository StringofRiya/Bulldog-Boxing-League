object dmLeague: TdmLeague
  OldCreateOrder = False
  Height = 255
  Width = 370
  object conLeague: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;User ID=Admin;Data Source=C:\Us' +
      'ers\abrah\OneDrive\Documents\Grade 11 PAT\LeagueDB.mdb;Mode=Read' +
      'Write;Persist Security Info=False;Jet OLEDB:System database="";J' +
      'et OLEDB:Registry Path="";Jet OLEDB:Database Password="";Jet OLE' +
      'DB:Engine Type=5;Jet OLEDB:Database Locking Mode=1;Jet OLEDB:Glo' +
      'bal Partial Bulk Ops=2;Jet OLEDB:Global Bulk Transactions=1;Jet ' +
      'OLEDB:New Database Password="";Jet OLEDB:Create System Database=' +
      'False;Jet OLEDB:Encrypt Database=False;Jet OLEDB:Don'#39't Copy Loca' +
      'le on Compact=False;Jet OLEDB:Compact Without Replica Repair=Fal' +
      'se;Jet OLEDB:SFP=False'
    LoginPrompt = False
    Mode = cmReadWrite
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 56
    Top = 96
  end
  object tblPlayers: TADOTable
    Active = True
    Connection = conLeague
    CursorType = ctStatic
    TableName = 'tblPlayers'
    Left = 136
    Top = 72
  end
  object dsrPlayers: TDataSource
    DataSet = tblPlayers
    Left = 224
    Top = 72
  end
  object tblRanking: TADOTable
    Active = True
    Connection = conLeague
    CursorType = ctStatic
    TableName = 'tblRanking'
    Left = 136
    Top = 136
  end
  object dsrRanking: TDataSource
    DataSet = tblRanking
    Left = 224
    Top = 136
  end
end
