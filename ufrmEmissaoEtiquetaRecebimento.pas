unit ufrmEmissaoEtiquetaRecebimento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Mask, Vcl.DBCtrls, Vcl.StdCtrls,
  System.JSON, IdHTTP, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, HTTPApp,
  Data.DB, Datasnap.DBClient, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids;

type
  TfrmEmissaoEtiquetaRecebimento = class(TForm)
    Cl_Fornecedor: TClientDataSet;
    Ds_Fornecedor: TDataSource;
    Ds_Produto: TDataSource;
    Cl_Produto: TClientDataSet;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Ed_AGN_IN_CODIGO: TEdit;
    Ed_AGN_ST_FANTASIA: TDBEdit;
    Ed_AGN_ST_CGC: TDBEdit;
    Label4: TLabel;
    Ed_PRO_IN_CODIGO: TEdit;
    Label5: TLabel;
    Ed_PRO_ST_DESCRICAO: TDBEdit;
    Label6: TLabel;
    Ed_PRO_ST_ALTERNATIVO: TDBEdit;
    Lb_CMAQ_IN_CODIGO: TLabel;
    Ed_RCB_ST_NOTA: TEdit;
    Bo_Procurar: TBitBtn;
    Bevel1: TBevel;
    Gd_Itens: TDBGrid;
    Panel4: TPanel;
    Bo_Confirmar: TBitBtn;
    Bo_Cancelar: TBitBtn;
    Bo_Fechar: TBitBtn;
    Cl_Itens: TClientDataSet;
    Ds_Itens: TDataSource;
    Label7: TLabel;
    Ed_MVS_ST_LOTEFORNE: TEdit;
    procedure Ed_AGN_IN_CODIGOKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Ed_AGN_IN_CODIGOExit(Sender: TObject);
    procedure Ed_PRO_IN_CODIGOExit(Sender: TObject);
    procedure Bo_ProcurarClick(Sender: TObject);
    procedure Bo_FecharClick(Sender: TObject);
    procedure Bo_CancelarClick(Sender: TObject);
  private

    procedure BuscaFornecedor(
      p_fil_in_codigo,
      p_fornecedor: String
    );

    procedure BuscaProduto(
      p_fil_in_codigo,
      p_produto: String
    );

    procedure BuscaLotes(
      p_fil_in_codigo,
      p_rcb_st_nota,
      p_agn_in_codigo,
      p_pro_in_codigo,
      p_mvs_st_loteforne : String
    );

    procedure LimparCampos;

  public
    { Public declarations }
  end;

var
  frmEmissaoEtiquetaRecebimento: TfrmEmissaoEtiquetaRecebimento;

implementation

{$R *.dfm}

uses uDM;

procedure TfrmEmissaoEtiquetaRecebimento.Ed_AGN_IN_CODIGOExit(Sender: TObject);
begin

  if Ed_AGN_IN_CODIGO.Text = '' then
  begin
    Exit;
  end;

  BuscaFornecedor('3', Ed_AGN_IN_CODIGO.Text);

end;

procedure TfrmEmissaoEtiquetaRecebimento.Ed_AGN_IN_CODIGOKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin

  {if Key = VK_RETURN Then
  begin
    Perform(Wm_NextDlgCtl, 0, 0);
  end;}

end;

procedure TfrmEmissaoEtiquetaRecebimento.Ed_PRO_IN_CODIGOExit(Sender: TObject);
begin

  if Ed_PRO_IN_CODIGO.Text = '' then
  begin
    Exit;
  end;

  BuscaProduto('3', Ed_PRO_IN_CODIGO.Text);

end;

procedure TfrmEmissaoEtiquetaRecebimento.Bo_CancelarClick(Sender: TObject);
begin
  LimparCampos;
end;

procedure TfrmEmissaoEtiquetaRecebimento.Bo_FecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmEmissaoEtiquetaRecebimento.Bo_ProcurarClick(Sender: TObject);
begin

  BuscaLotes('3', Ed_RCB_ST_NOTA.Text, Ed_AGN_IN_CODIGO.Text, Ed_PRO_IN_CODIGO.Text, Ed_MVS_ST_LOTEFORNE.Text);

end;

procedure TfrmEmissaoEtiquetaRecebimento.BuscaFornecedor(
  p_fil_in_codigo,
  p_fornecedor: String
);
var
  str : string;
  js  : TJSONArray;
  url : String;
  fornecedor : String;
begin

  fornecedor := HTTPEncode(p_fornecedor);

  url := wURL + 'f_fornecedor_lst/' + p_fil_in_codigo + '/' + fornecedor;

  Str := DM.IdHTTP1.get(url);

  DM.JsonToDataset(Cl_Fornecedor, Str);

  if Cl_Fornecedor.IsEmpty then
  begin
    Ed_AGN_IN_CODIGO.SetFocus;
    Ed_AGN_IN_CODIGO.SelectAll;
    raise Exception.Create('Fornecedor n�o localizados!');
  end;

  Ed_AGN_IN_CODIGO.Text := Cl_Fornecedor.FieldByName('AGN_IN_CODIGO').AsString;

end;

procedure TfrmEmissaoEtiquetaRecebimento.BuscaProduto(
  p_fil_in_codigo,
  p_produto: String
);
var
  str : string;
  js  : TJSONArray;
  url : String;
  produto : String;
begin

  produto := HTTPEncode(p_produto);

  url := wURL + 'f_produto_lst/' + p_fil_in_codigo + '/' + produto;

  Str := DM.IdHTTP1.get(url);

  DM.JsonToDataset(Cl_Produto, Str);

  if Cl_Fornecedor.IsEmpty then
  begin
    Ed_AGN_IN_CODIGO.SetFocus;
    Ed_AGN_IN_CODIGO.SelectAll;
    raise Exception.Create('Produto n�o localizado!');
  end;

  Ed_PRO_IN_CODIGO.Text := Cl_Produto.FieldByName('PRO_IN_CODIGO').AsString;

end;

procedure TfrmEmissaoEtiquetaRecebimento.BuscaLotes(
      p_fil_in_codigo,
      p_rcb_st_nota,
      p_agn_in_codigo,
      p_pro_in_codigo,
      p_mvs_st_loteforne : String
    );
var
  str : string;
  js  : TJSONArray;
  url : String;

  nota : String;
  fornecedor : String;
  produto : String;
  lote : String;
begin

  nota := HTTPEncode(p_rcb_st_nota);

  fornecedor := HTTPEncode(p_agn_in_codigo);

  produto := HTTPEncode(p_pro_in_codigo);

  lote := HTTPEncode(p_mvs_st_loteforne);

  url := wURL + 'f_etiqueta_lst/' + p_fil_in_codigo + '/' + nota + '/' + fornecedor + '/' + produto + '/' + lote;

  Str := DM.IdHTTP1.get(url);

  DM.JsonToDataset(Cl_Itens, Str);

  if Cl_Itens.IsEmpty then
  begin
    raise Exception.Create('Itens n�o localizado!');
  end;

end;

procedure TfrmEmissaoEtiquetaRecebimento.LimparCampos;
begin

  Ed_AGN_IN_CODIGO.Text := '';
  Ed_AGN_ST_FANTASIA.Text := '';
  Ed_AGN_ST_CGC.Text := '';
  Ed_PRO_IN_CODIGO.Text := '';
  Ed_PRO_ST_DESCRICAO.Text := '';
  Ed_PRO_ST_ALTERNATIVO.Text := '';
  Ed_RCB_ST_NOTA.Text := '';
  Ed_MVS_ST_LOTEFORNE.Text := '';
  Cl_Itens.Close;

end;

end.
