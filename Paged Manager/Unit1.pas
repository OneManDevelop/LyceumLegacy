unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Data.DB, Data.Win.ADODB,
  Vcl.Grids, Vcl.DBGrids, Vcl.DBCtrls, Vcl.ExtCtrls;

type
  TPagedManger = class(TForm)
    ADOConnection1: TADOConnection;
    ADOTable1: TADOTable;
    ADOTable2: TADOTable;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    DBNavigator2: TDBNavigator;
    DBNavigator1: TDBNavigator;
    DBLookupListBox1: TDBLookupListBox;
    ADOTable3: TADOTable;
    DataSource3: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PagedManger: TPagedManger;

implementation

{$R *.dfm}

end.
