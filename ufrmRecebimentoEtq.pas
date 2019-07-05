unit ufrmRecebimentoEtq;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, Datasnap.DBClient, IdHTTP, System.JSON, IdURI,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, HTTPApp, Vcl.Mask,
  Vcl.DBCtrls, Vcl.ComCtrls;

type
  TfrmRecebimentoEtq = class(TForm)
    Cl_Rci: TClientDataSet;
    Ds_Rci: TDataSource;
    Pn_Principal: TPanel;
    Pn_Principal1: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Ed_AGN_ST_FANTASIA: TDBEdit;
    Ed_rcb_dt_documento: TDBEdit;
    Ed_rcb_dt_movimento: TDBEdit;
    Gd_Avr: TDBGrid;
    Pn_Topo: TPanel;
    Panel4: TPanel;
    Bo_Confirmar: TBitBtn;
    Bo_Fechar: TBitBtn;
    Pn_Principal2: TPanel;
    Label5: TLabel;
    Ed_Inspecionado: TEdit;
    Label6: TLabel;
    Cb_Impressora: TComboBox;
    Cl_Imp: TClientDataSet;
    Pc_Filtro: TPageControl;
    Ts_Filtro: TTabSheet;
    Ts_Consulta: TTabSheet;
    Gd_AvrCns: TDBGrid;
    Pn_AvrCns: TPanel;
    Bo_AvrCns_Refresh: TBitBtn;
    Lb_CMAQ_IN_CODIGO: TLabel;
    Ed_AVR_ST_NOTA: TEdit;
    Label1: TLabel;
    Ed_AGN_ST_CGC: TEdit;
    Bo_Procurar: TBitBtn;
    Cl_AvrCns: TClientDataSet;
    Ds_AvrCns: TDataSource;
    procedure Bo_ProcurarClick(Sender: TObject);
    procedure Bo_FecharClick(Sender: TObject);
    procedure Ed_AVR_ST_NOTAKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Ed_AGN_ST_CGCKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure Bo_ConfirmarClick(Sender: TObject);
    procedure Bo_AvrCns_RefreshClick(Sender: TObject);
    procedure Gd_AvrCnsDblClick(Sender: TObject);
  private
    BloqueiaInsercao: boolean;
    procedure CarregaImpressora;
    procedure ConsultaAvisoRecebimento;
  public
    { Public declarations }
  end;

var
  frmRecebimentoEtq: TfrmRecebimentoEtq;

implementation

{$R *.dfm}

uses uDM;

procedure TfrmRecebimentoEtq.Bo_AvrCns_RefreshClick(Sender: TObject);
begin
  BloqueiaInsercao := False;
  ConsultaAvisoRecebimento;
  BloqueiaInsercao := True;
end;

procedure TfrmRecebimentoEtq.Bo_ConfirmarClick(Sender: TObject);
var
  ls_imp : TStringList;
  ls_etq : TStringList;
begin

  if Cl_Rci.Active = False then
  begin
    Exit;
  end;

  if Cl_Rci.IsEmpty = True then
  begin
    Exit;
  end;

  if Cb_Impressora.Items.Count = 0 then
  begin
    Cb_Impressora.SetFocus;
    raise Exception.Create('Favor selecionar uma impressora!');
  end;

  ls_imp := TStringList.Create;
  ls_imp.Clear;

  ls_etq := TStringList.Create;

  try

    Cl_Rci.DisableControls;

    Cl_Rci.First;
    while not(Cl_Rci.Eof) do
    begin

      if (Cl_Rci.FieldByName('etq_in_qtde').AsInteger > 0) then
      begin

        ls_etq.Clear;

        DM.p_etiqueta_recebimento_lst( Cl_Rci.FieldByName('mvl_st_loteforne').AsString
                                     , 'APROVADO'
                                     , Cl_Rci.FieldByName('avr_st_nota').AsString
                                     , Cl_Rci.FieldByName('avr_dt_emissaonf').AsString
                                     , Ed_Inspecionado.Text
                                     , Cl_Rci.FieldByName('mvl_st_loteforne').AsString
                                     , Cl_Rci.FieldByName('etq_in_qtde').AsString
                                     , ls_etq
                                     );

        //ls_etq.SaveToFile(Cb_Impressora.Text,TEncoding.UTF8);

        ls_imp.Add(ls_etq.Text);

      end;

      Cl_Rci.Next;

    end;

  finally

    Cl_Rci.First;
    Cl_Rci.EnableControls;

  end;

  if ls_imp.Count = 0 then
  begin
    raise Exception.Create('Nenhuma etiqueta selecionada!');
  end;

  ls_etq.SaveToFile(Cb_Impressora.Text,TEncoding.UTF8);

  ShowMessage('Impress�o enviado com sucesso!');

end;

procedure TfrmRecebimentoEtq.Bo_FecharClick(Sender: TObject);
begin

  if Pn_Topo.Enabled = False then
  begin
    Ed_AVR_ST_NOTA.Clear;
    Ed_AGN_ST_CGC.Clear;
    Pn_Topo.Enabled      := True;
    Pn_Principal.Visible := not(Pn_Topo.Enabled);
    Ed_AVR_ST_NOTA.SetFocus;
  end
  else
  begin
    Close;
  end;

end;

procedure TfrmRecebimentoEtq.Bo_ProcurarClick(Sender: TObject);
var
  str : WideString;
begin

  Ed_AVR_ST_NOTA.Text := Trim(Ed_AVR_ST_NOTA.Text);
  Ed_AGN_ST_CGC.Text  := Trim(Ed_AGN_ST_CGC.Text);

  if (Ed_AVR_ST_NOTA.Text = '') then
  begin
    Ed_AVR_ST_NOTA.SetFocus;
    raise Exception.Create('Informe a nota fiscal!');
  end;

  if (Ed_AGN_ST_CGC.Text = '') then
  begin
    Ed_AGN_ST_CGC.SetFocus;
    raise Exception.Create('Informe o documento do fornecedor!');
  end;

  BloqueiaInsercao := False;
  Str := DM.IdHTTP1.get(wURL + 'f_avisoetq_lst/'
                             + IntToStr(wFIL_IN_CODIGO) + '/'
                             + Ed_AVR_ST_NOTA.Text + '/'
                             + DM.SoNumero(Ed_AGN_ST_CGC.Text));
  DM.JsonToDataset(Cl_Rci, Str);
  BloqueiaInsercao := True;

  if Cl_Rci.IsEmpty then
  begin
    Ed_AVR_ST_NOTA.SetFocus;
    Ed_AVR_ST_NOTA.SelectAll;
    raise Exception.Create('Nota n�o localizada!');
  end;

  Ed_Inspecionado.Clear;

  Pn_Topo.Enabled      := False;
  Pn_Principal.Visible := not(Pn_Topo.Enabled);

  if Cb_Impressora.Items.Count > 0 then
  begin
    Cb_Impressora.ItemIndex := 0;
  end;

end;

procedure TfrmRecebimentoEtq.CarregaImpressora;
var
  str : WideString;
begin

  Cb_Impressora.Items.Clear;

  Str := DM.IdHTTP1.get(wURL + 'f_impressoragr_lst');
  DM.JsonToDataset(Cl_Imp, Str);

  if Cl_Imp.Active = False then
  begin
    Exit;
  end;

  if Cl_Imp.IsEmpty = True then
  begin
    Exit;
  end;

  Cl_Imp.First;
  while not(Cl_Imp.Eof) do
  begin
    Cb_Impressora.Items.Add(Cl_Imp.FieldByName('impr_st_nome').AsString);
    Cl_Imp.Next;
  end;

end;

procedure TfrmRecebimentoEtq.ConsultaAvisoRecebimento;
var
  str : string;
  js  : TJSONArray;
  url : String;
  fornecedor : String;
begin

  url := wURL + 'f_aviso_lst/'
              + IntToStr(wFIL_IN_CODIGO) + '/'
              + '0' + '/'
              + '0' + '/'
              + 'T' + '/'
              + 'T' + '/'
              + 'S';

  Str := DM.IdHTTP1.get(url);

  DM.JsonToDataset(Cl_AvrCns, Str);

end;

procedure TfrmRecebimentoEtq.Ed_AGN_ST_CGCKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

  if Key = VK_RETURN Then
  begin
    Perform(Wm_NextDlgCtl, 0, 0);
  end;

end;

procedure TfrmRecebimentoEtq.Ed_AVR_ST_NOTAKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

  if Key = VK_RETURN Then
  begin
    Perform(Wm_NextDlgCtl, 0, 0);
  end;

end;

procedure TfrmRecebimentoEtq.FormCreate(Sender: TObject);
begin

  Pc_Filtro.ActivePageIndex := 0;

  BloqueiaInsercao     := True;

  Pn_Topo.Enabled      := True;
  Pn_Principal.Visible := not(Pn_Topo.Enabled);

  CarregaImpressora;

  BloqueiaInsercao := False;
  ConsultaAvisoRecebimento;
  BloqueiaInsercao := True;

end;

procedure TfrmRecebimentoEtq.Gd_AvrCnsDblClick(Sender: TObject);
begin

  if Cl_AvrCns.Active = False then
  begin
    Exit;
  end;

  if Cl_AvrCns.IsEmpty = True then
  begin
    Exit;
  end;

  Ed_AVR_ST_NOTA.Text := Cl_AvrCns.FieldByName('AVR_ST_NOTA').AsString;
  Ed_AGN_ST_CGC.Text  := Cl_AvrCns.FieldByName('AGN_ST_CGC').AsString;

  Pc_Filtro.ActivePageIndex := 0;

  Bo_ProcurarClick(Bo_Procurar);

end;

end.
