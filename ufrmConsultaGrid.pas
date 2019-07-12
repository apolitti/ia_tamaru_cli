unit ufrmConsultaGrid;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, Datasnap.DBClient;

type
  TfrmConsultaGrid = class(TForm)
    pnTopo: TPanel;
    Label1: TLabel;
    edValor: TEdit;
    edCampo: TComboBox;
    Label2: TLabel;
    gdConsulta: TDBGrid;
    pnBase: TPanel;
    boConfirmar: TButton;
    dsConsulta: TDataSource;
    cdsConsulta: TClientDataSet;
    procedure FormShow(Sender: TObject);
    procedure edValorExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure gdConsultaDblClick(Sender: TObject);
  private
    vCampos : TStringList;    
    procedure ConsultaCarregar;
    procedure TelaConfiguracao;

  public
    vEvento : String;
    vCampoRetorno  : String;
    vValorRetorno  : String;
    vCTR_IN_CODIGO : String;    
  end;

var
  frmConsultaGrid: TfrmConsultaGrid;

implementation

{$R *.dfm}

uses uDM;

procedure TfrmConsultaGrid.edValorExit(Sender: TObject);
begin
  ConsultaCarregar();  
end;

procedure TfrmConsultaGrid.FormCreate(Sender: TObject);
begin
  vCampos := TStringList.Create;
end;

procedure TfrmConsultaGrid.FormShow(Sender: TObject);
begin
  ConsultaCarregar();    
  TelaConfiguracao();
end;

procedure TfrmConsultaGrid.gdConsultaDblClick(Sender: TObject);
begin

  vValorRetorno  := cdsConsulta.FieldByName(vCampoRetorno).AsString;
  Self.ModalResult := mrOk;

end;

procedure TfrmConsultaGrid.ConsultaCarregar;
var
  I : Integer;
  vParams : TStringStream;
begin

  if (vEvento = 'P_REFUGO_LST') then
  begin
    vParams := TStringStream.Create;
    vParams.WriteString('"<PARAMETROS>');
    vParams.WriteString('<EVENTO>P_REFUGO_LST</EVENTO>');
    vParams.WriteString('<ORG_IN_CODIGO>' + IntToStr(wORG_IN_CODIGO) + '</ORG_IN_CODIGO>');
    if edValor.Text <> '' then
    begin
      vParams.WriteString('<' + vCampos.Strings[edCampo.ItemIndex] + '>' + edValor.Text + '</' + vCampos.Strings[edCampo.ItemIndex] + '>');
    end;    
    vParams.WriteString('</PARAMETROS>"');

    vCampoRetorno := 'REF_IN_CODIGO';
    
    gdConsulta.Columns.Clear;
    gdConsulta.Columns.Add;
    gdConsulta.Columns[0].FieldName     := 'REF_IN_CODIGO';
    gdConsulta.Columns[0].Title.Caption := 'C�digo';    
    gdConsulta.Columns[0].Width         := 100;    
    gdConsulta.Columns.Add;
    gdConsulta.Columns[1].FieldName     := 'REF_ST_NOME';
    gdConsulta.Columns[1].Title.Caption := 'Nome';        
    gdConsulta.Columns[1].Width         := 500;
    
  end
  else if (vEvento = 'P_CMAQUINA_LST') then
  begin

    vParams := TStringStream.Create;
    vParams.WriteString('"<PARAMETROS>');
    vParams.WriteString('<EVENTO>P_CMAQUINA_LST</EVENTO>');
    vParams.WriteString('<ORG_IN_CODIGO>' + IntToStr(wORG_IN_CODIGO) + '</ORG_IN_CODIGO>');
    vParams.WriteString('<CTR_IN_CODIGO>' + vCTR_IN_CODIGO + '</CTR_IN_CODIGO>');    

    if edValor.Text <> '' then
    begin
      vParams.WriteString('<' + vCampos.Strings[edCampo.ItemIndex] + '>' + edValor.Text + '</' + vCampos.Strings[edCampo.ItemIndex] + '>');
    end;    
    vParams.WriteString('</PARAMETROS>"');

    vCampoRetorno := 'CMAQ_IN_CODIGO';
    
    gdConsulta.Columns.Clear;
    gdConsulta.Columns.Add;
    gdConsulta.Columns[0].FieldName     := 'CMAQ_IN_CODIGO';
    gdConsulta.Columns[0].Title.Caption := 'C�digo';    
    gdConsulta.Columns[0].Width         := 100;    
    gdConsulta.Columns.Add;
    gdConsulta.Columns[1].FieldName     := 'CMAQ_ST_DESCRICAO';
    gdConsulta.Columns[1].Title.Caption := 'Nome';        
    gdConsulta.Columns[1].Width         := 500;  
  end;
       

  
  
  if (vParams.Size > 0) then
  begin
    cdsConsulta := DM.f_evento_lst(vParams);
    dsConsulta.DataSet := cdsConsulta;
    gdConsulta.DataSource := dsConsulta;
    if cdsConsulta.Active then
    begin
      cdsConsulta.Last;
      cdsConsulta.First;
    end;
  end;
  
end;

procedure TfrmConsultaGrid.TelaConfiguracao;
var
  I : Integer;
begin

  vCampos.Clear;
  edCampo.Clear;
  for I := 0 to gdConsulta.Columns.Count -1 do
  begin  
    vCampos.Add(gdConsulta.Columns[I].FieldName);
    edCampo.Items.Add(gdConsulta.Columns[I].Title.Caption);
  end;
end;

end.
