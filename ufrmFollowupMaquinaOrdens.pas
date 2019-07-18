unit ufrmFollowupMaquinaOrdens;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Mask, Vcl.StdCtrls, Vcl.ExtCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Datasnap.DBClient, ADODB, Datasnap.Provider;

type
  TfrmFollowupMaquinaOrdens = class(TForm)
    pnHistoricoFiltro: TPanel;
    Label9: TLabel;
    Label11: TLabel;
    Label10: TLabel;
    edMAQ_IN_CODIGO: TEdit;
    boFiltrar: TButton;
    edAPT_DT_APONTAMENTO: TMaskEdit;
    edAPT_DT_ENCERRAMENTO: TMaskEdit;
    Panel1: TPanel;
    Button1: TButton;
    gdOrdens: TDBGrid;
    cdsOrdens: TClientDataSet;
    dsOrdens: TDataSource;
    boApontar: TButton;
    procedure boFiltrarClick(Sender: TObject);
    procedure boApontarClick(Sender: TObject);
    procedure gdOrdensDblClick(Sender: TObject);
    procedure gdOrdensTitleClick(Column: TColumn);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    bORDER : Boolean;
  end;

var
  frmFollowupMaquinaOrdens: TfrmFollowupMaquinaOrdens;

implementation

{$R *.dfm}

uses uDM;

procedure TfrmFollowupMaquinaOrdens.boApontarClick(Sender: TObject);
begin

  if not(cdsOrdens.Active) or cdsOrdens.IsEmpty then
    Exit;

  Self.ModalResult := mrOk;

end;

procedure TfrmFollowupMaquinaOrdens.boFiltrarClick(Sender: TObject);
var
  vParams : TStringStream;

begin

  vParams := TStringStream.Create;
  vParams.WriteString('"<PARAMETROS>');
  vParams.WriteString('<EVENTO>P_ORDEM_OPERACAO_LST</EVENTO>');
  vParams.WriteString('<ORG_IN_CODIGO>' + IntToStr(wORG_IN_CODIGO) + '</ORG_IN_CODIGO>');
  vParams.WriteString('<MAQ_IN_CODIGO>' + edMAQ_IN_CODIGO.Text + '</MAQ_IN_CODIGO>');
  vParams.WriteString('<APT_DT_APONTAMENTO>' + DM.iif(edAPT_DT_APONTAMENTO.Text = '  /  /    ', '', edAPT_DT_APONTAMENTO.Text) + '</APT_DT_APONTAMENTO>');
  vParams.WriteString('<APT_DT_ENCERRAMENTO>' + DM.iif(edAPT_DT_ENCERRAMENTO.Text = '  /  /    ', '', edAPT_DT_ENCERRAMENTO.Text) + '</APT_DT_ENCERRAMENTO>');
  vParams.WriteString('</PARAMETROS>"');

  cdsOrdens := DM.f_evento_lst(vParams);
  dsOrdens.DataSet := cdsOrdens;
  gdOrdens.DataSource := dsOrdens;

  if cdsOrdens.Active then
  begin
    cdsOrdens.Last;
    cdsOrdens.First;
  end;


end;

procedure TfrmFollowupMaquinaOrdens.Button1Click(Sender: TObject);
begin
  Self.Close;
end;

procedure TfrmFollowupMaquinaOrdens.gdOrdensDblClick(Sender: TObject);
begin

  boApontarClick(boApontar);

end;

procedure TfrmFollowupMaquinaOrdens.gdOrdensTitleClick(Column: TColumn);
var
  indice: string;
  existe: boolean;
  clientdataset_idx: tclientdataset;
begin

  clientdataset_idx := TClientDataset(Column.Grid.DataSource.DataSet);

  if clientdataset_idx.IndexFieldNames = Column.FieldName then
  begin
    indice := AnsiUpperCase(Column.FieldName+'_INV');

    try
      clientdataset_idx.IndexDefs.Find(indice);
      existe := true;
    except
      existe := false;
    end;

    if not existe then
      with clientdataset_idx.IndexDefs.AddIndexDef do begin
        Name := indice;
        Fields := Column.FieldName;
        Options := [ixDescending];
      end;
    clientdataset_idx.IndexName := indice;
  end
  else
     clientdataset_idx.IndexFieldNames := Column.FieldName;
end;

end.
