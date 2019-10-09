unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, ComCtrls, Grids, DBGrids, DBCtrls, ExtCtrls, StdCtrls,
  pngimage, TeEngine, Series, TeeProcs, Chart, DBChart, TeeFunci;

type
  TForm1 = class(TForm)
    ADOConnection1: TADOConnection;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    ADOTable1: TADOTable;
    ADOTable2: TADOTable;
    ADOTable3: TADOTable;
    ADOConnection2: TADOConnection;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    DataSource3: TDataSource;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    DBLookupListBox2: TDBLookupListBox;
    DBNavigator1: TDBNavigator;
    ADOTable1id: TSmallintField;
    ADOTable1game: TWideStringField;
    ADOTable1multiplayer: TBooleanField;
    ADOTable1release: TDateTimeField;
    ADOTable1budget: TIntegerField;
    ADOTable1edition: TIntegerField;
    ADOTable1genre: TWideStringField;
    ADOTable2id: TSmallintField;
    ADOTable2heroName: TWideStringField;
    ADOTable2gameID: TSmallintField;
    ADOTable2playable: TBooleanField;
    ADOTable2age: TWordField;
    ADOTable2equipSloats: TWordField;
    ADOTable2birthDate: TDateTimeField;
    ADOTable1cost: TFloatField;
    Button1: TButton;
    StatusBar1: TStatusBar;
    Label1: TLabel;
    ADOTable4: TADOTable;
    DataSource4: TDataSource;
    DBChart1: TDBChart;
    Series1: TBarSeries;
    DBChart2: TDBChart;
    Series2: TBarSeries;
    DBNavigator2: TDBNavigator;
    Image1: TImage;
    Image2: TImage;
    DBChart3: TDBChart;
    Series3: TFastLineSeries;
    TeeFunction1: TDivideTeeFunction;
    procedure DBNavigator1BeforeAction(Sender: TObject; Button: TNavigateBtn);
    procedure ADOTable1CalcFields(DataSet: TDataSet);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.ADOTable1CalcFields(DataSet: TDataSet);
begin
ADOTable1cost.Value := ADOTable1budget.Value / ADOTable1edition.Value;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
ADOTable1.Active := False;
ADOTable2.Active := False;
ADOTable3.Active := False;
Halt;
end;

procedure TForm1.DBNavigator1BeforeAction(Sender: TObject;
  Button: TNavigateBtn);
  var p:integer;
begin
if Button = nbDelete
then if MessageDlg('����������� ��������',mtConfirmation,[mbYes,mbNo],0) = mrYes
then Begin p:=ADOTable1['id'];
with ADOTable2 Do
Begin First;
while not Eof do
 if ADOTable1.Locate('id',p,[])
  then Delete
End;
End
else
{Raise.EAbort.Create(''); }
Abort;
end;

end.
