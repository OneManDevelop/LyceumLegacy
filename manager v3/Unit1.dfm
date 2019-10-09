object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 806
  ClientWidth = 698
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 8
    Top = 80
    Width = 682
    Height = 553
    ActivePage = TabSheet1
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'TabSheet1'
      ExplicitHeight = 385
      object DBGrid1: TDBGrid
        Left = 3
        Top = 16
        Width = 510
        Height = 233
        DataSource = DataSource1
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
      object DBGrid2: TDBGrid
        Left = 3
        Top = 304
        Width = 502
        Height = 177
        DataSource = DataSource2
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'TabSheet2'
      ImageIndex = 1
      ExplicitHeight = 341
    end
  end
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=D:\AstDatabases\Gam' +
      'esV2.mdb;Persist Security Info=False'
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 408
    Top = 752
  end
  object ADOTable1: TADOTable
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'main'
    Left = 472
    Top = 744
  end
  object ADOTable2: TADOTable
    Connection = ADOConnection1
    CursorType = ctStatic
    IndexFieldNames = 'gameID'
    MasterFields = 'id'
    MasterSource = DataSource1
    TableName = 'heroes'
    Left = 472
    Top = 688
  end
  object ADOTable3: TADOTable
    Connection = ADOConnection2
    EnableBCD = False
    TableName = 'links'
    Left = 472
    Top = 648
  end
  object ADOConnection2: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=D:\AstDatabases\Gam' +
      'esV2.mdb;Persist Security Info=False'
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 400
    Top = 688
  end
  object DataSource1: TDataSource
    DataSet = ADOTable1
    Left = 592
    Top = 752
  end
  object DataSource2: TDataSource
    DataSet = ADOTable2
    Left = 592
    Top = 696
  end
  object DataSource3: TDataSource
    DataSet = ADOTable3
    Left = 592
    Top = 648
  end
end
