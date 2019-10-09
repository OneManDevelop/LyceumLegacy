program Project1;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {PagedManger};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TPagedManger, PagedManger);
  Application.Run;
end.
