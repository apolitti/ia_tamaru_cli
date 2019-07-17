unit ufrmApontamentoImprodutivo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.WinXPickers, Data.DB, Datasnap.DBClient, Vcl.ComCtrls, Vcl.Mask;

type
  TfrmApontamentoImprodutivo = class(TForm)
    gbDados: TGroupBox;
    pnDados: TPanel;
    pnAPT_ST_OBSERVACAO: TPanel;
    Label3: TLabel;
    edAPT_ST_OBSERVACAO: TMemo;
    Panel2: TPanel;
    boConfirmar: TButton;
    boCancelar: TButton;
    pnAPT_CH_STATUS: TPanel;
    edAPT_CH_STATUS: TCheckBox;
    edAPT_IN_SEQUENCIA: TEdit;
    pnAPT_ATI_IN_CODIGO: TPanel;
    Label5: TLabel;
    edAPT_ATI_IN_CODIGO: TEdit;
    boAPT_ATI_IN_CODIGO: TButton;
    edATI_ST_NOME: TEdit;
    pnAPT_MAQ_IN_CODIGO: TPanel;
    Label13: TLabel;
    edAPT_MAQ_IN_CODIGO: TEdit;
    boAPT_MAQ_IN_CODIGO: TButton;
    edMAQ_ST_NOME: TEdit;
    pnCMAQ_IN_CODIGO: TPanel;
    Label1: TLabel;
    edCMAQ_IN_CODIGO: TEdit;
    boCMAQ_IN_CODIGO: TButton;
    edCMAQ_ST_DESCRICAO: TEdit;
    pnOPD_ST_ALTERNATIVO: TPanel;
    Label7: TLabel;
    edOPD_ST_ALTERNATIVO: TEdit;
    edOPD_ST_DESCRICAO: TEdit;
    pnORD_IN_CODIGO: TPanel;
    Label2: TLabel;
    Label10: TLabel;
    edORD_IN_CODIGO: TEdit;
    edORD_ST_ALTERNATIVO: TEdit;
    pnHorarios: TPanel;
    pnAPT_DT_APONTAMENTO: TPanel;
    lbAPT_DT_APONTAMENTO: TLabel;
    lbAPT_RE_TEMPOINICIAL: TLabel;
    pnAPT_DT_ENCERRAMENTO: TPanel;
    lbAPT_DT_ENCERRAMENTO: TLabel;
    lbAPT_RE_TEMPOFINAL: TLabel;
    edAPT_DT_APONTAMENTO: TMaskEdit;
    edAPT_RE_TEMPOINICIAL: TMaskEdit;
    edAPT_RE_TEMPOFINAL: TMaskEdit;
    edAPT_DT_ENCERRAMENTO: TMaskEdit;
    Label4: TLabel;
    edOPR_IN_CODIGO: TEdit;
    procedure boAPT_ATI_IN_CODIGOClick(Sender: TObject);
    procedure edAPT_ATI_IN_CODIGOExit(Sender: TObject);
    procedure boAPT_MAQ_IN_CODIGOClick(Sender: TObject);
    procedure edAPT_MAQ_IN_CODIGOExit(Sender: TObject);
    procedure edCMAQ_IN_CODIGOExit(Sender: TObject);
    procedure boCMAQ_IN_CODIGOClick(Sender: TObject);
    procedure edORD_IN_CODIGOExit(Sender: TObject);
    procedure edOPD_ST_ALTERNATIVOExit(Sender: TObject);
    procedure boConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edAPT_DT_APONTAMENTOExit(Sender: TObject);
    procedure edAPT_RE_TEMPOINICIALExit(Sender: TObject);
    procedure edAPT_DT_ENCERRAMENTOExit(Sender: TObject);
    procedure edAPT_RE_TEMPOFINALExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure boCancelarClick(Sender: TObject);
    procedure edAPT_ATI_IN_CODIGOEnter(Sender: TObject);
  private
    vForfmHeight : Integer;
    procedure PreparaCampos(cds : TClientDataSet);
    procedure CarregarApontamento;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmApontamentoImprodutivo: TfrmApontamentoImprodutivo;

implementation

{$R *.dfm}

uses uDM, ufrmConsultaGrid, ufrmFollowup;

procedure TfrmApontamentoImprodutivo.boAPT_ATI_IN_CODIGOClick(Sender: TObject);
begin

  frmConsultaGrid := TFrmConsultaGrid.Create(Self);
  frmConsultaGrid.vEvento := 'P_ATIVIDADE_LST';
  frmConsultaGrid.vATI_CH_PRODUTIVA := 'I';
  if (frmConsultaGrid.ShowModal = mrOk) then
  begin
    edAPT_ATI_IN_CODIGO.Text := frmConsultaGrid.vValorRetorno;
    edAPT_ATI_IN_CODIGOExit(edAPT_ATI_IN_CODIGO);
    FreeAndNil(frmConsultaGrid);
  end;

end;

procedure TfrmApontamentoImprodutivo.boAPT_MAQ_IN_CODIGOClick(Sender: TObject);
begin

  frmConsultaGrid := TFrmConsultaGrid.Create(Self);
  frmConsultaGrid.vEvento := 'P_MAQUINA_LST';
  if (frmConsultaGrid.ShowModal = mrOk) then
  begin
    edAPT_MAQ_IN_CODIGO.Text := frmConsultaGrid.vValorRetorno;
    edAPT_MAQ_IN_CODIGOExit(edAPT_MAQ_IN_CODIGO);
    FreeAndNil(frmConsultaGrid);
  end;

end;

procedure TfrmApontamentoImprodutivo.boCancelarClick(Sender: TObject);
begin
  Self.Close();
end;

procedure TfrmApontamentoImprodutivo.boCMAQ_IN_CODIGOClick(Sender: TObject);
begin

  frmConsultaGrid := TFrmConsultaGrid.Create(Self);
  frmConsultaGrid.vEvento := 'P_CMAQUINA_LST';
  frmConsultaGrid.vCTR_IN_CODIGO := edAPT_MAQ_IN_CODIGO.Text;
  if (frmConsultaGrid.ShowModal = mrOk) then
  begin
    edCMAQ_IN_CODIGO.Text := frmConsultaGrid.vValorRetorno;
    edCMAQ_ST_DESCRICAO.Text := frmConsultaGrid.cdsConsulta.FieldByName('CMAQ_ST_DESCRICAO').AsString;
    FreeAndNil(frmConsultaGrid);
  end;

end;

procedure TfrmApontamentoImprodutivo.boConfirmarClick(Sender: TObject);
var
  cds : TClientDataSet;
  vParams : TStringStream;
  vAPT_CH_STATUS : String;
begin

  if ((edAPT_MAQ_IN_CODIGO.CanFocus) and (edAPT_MAQ_IN_CODIGO.Text = '')) then
  begin
    MessageDlg('Código da centro de trabalho deve ser preenchido.', mtError, [mbOK], 0);
    edAPT_MAQ_IN_CODIGO.SetFocus;
    Exit;
  end
  else if ((edCMAQ_IN_CODIGO.CanFocus) and (edCMAQ_IN_CODIGO.Text = '')) then
  begin
    MessageDlg('Código da maquina deve ser preenchido.', mtError, [mbOK], 0);
    edCMAQ_IN_CODIGO.SetFocus;
    Exit;
  end
  else if ((edOPD_ST_ALTERNATIVO.CanFocus) and (edOPD_ST_ALTERNATIVO.Text = '')) then
  begin
    MessageDlg('Código do operador deve ser preenchido.', mtError, [mbOK], 0);
    edOPD_ST_ALTERNATIVO.SetFocus;
    Exit;
  end
  else if ((edORD_IN_CODIGO.CanFocus) and (edORD_IN_CODIGO.Text = '')) then
  begin
    MessageDlg('Código da ordem deve ser preenchido.', mtError, [mbOK], 0);
    edORD_IN_CODIGO.SetFocus;
    Exit;
  end;

  vAPT_CH_STATUS := Dm.iif(edAPT_CH_STATUS.Checked, 'E', 'A');

  vParams := TStringStream.Create;
  vParams.WriteString('"<PARAMETROS>');
  vParams.WriteString('<EVENTO>P_APONTAMENTO_EXE</EVENTO>');
  vParams.WriteString('<ORG_IN_CODIGO>' + IntToStr(wORG_IN_CODIGO) + '</ORG_IN_CODIGO>');
  vParams.WriteString('<FIL_IN_CODIGO>' + IntToStr(wFIL_IN_CODIGO) + '</FIL_IN_CODIGO>');
  vParams.WriteString('<ORD_IN_CODIGO>' + edORD_IN_CODIGO.Text + '</ORD_IN_CODIGO>');
  vParams.WriteString('<MAQ_IN_CODIGO>' + edAPT_MAQ_IN_CODIGO.Text + '</MAQ_IN_CODIGO>');
  vParams.WriteString('<CMAQ_IN_CODIGO>' + edCMAQ_IN_CODIGO.Text + '</CMAQ_IN_CODIGO>');
  vParams.WriteString('<OPD_ST_ALTERNATIVO>' + edOPD_ST_ALTERNATIVO.Text + '</OPD_ST_ALTERNATIVO>');
  vParams.WriteString('<APT_DT_APONTAMENTO>' + edAPT_DT_APONTAMENTO.Text + '</APT_DT_APONTAMENTO>');
  vParams.WriteString('<APT_RE_TEMPOINICIAL>' + edAPT_RE_TEMPOINICIAL.Text + '</APT_RE_TEMPOINICIAL>');
  vParams.WriteString('<APT_DT_ENCERRAMENTO>' + edAPT_DT_ENCERRAMENTO.Text + '</APT_DT_ENCERRAMENTO>');
  vParams.WriteString('<APT_RE_TEMPOFINAL>' + edAPT_RE_TEMPOFINAL.Text + '</APT_RE_TEMPOFINAL>');
  vParams.WriteString('<APT_IN_SEQUENCIA>' + edAPT_IN_SEQUENCIA.Text + '</APT_IN_SEQUENCIA>');
  vParams.WriteString('<APT_CH_STATUS>' + vAPT_CH_STATUS + '</APT_CH_STATUS>');
  vParams.WriteString('<ATI_IN_CODIGO>' + edAPT_ATI_IN_CODIGO.Text + '</ATI_IN_CODIGO>');
  vParams.WriteString('<APT_ST_OBSERVACAO>' + edAPT_ST_OBSERVACAO.Text + '</APT_ST_OBSERVACAO>');
  vParams.WriteString('</PARAMETROS>"');

  try

    cds := TClientDataSet.Create(Self);
    cds := DM.f_evento_lst(vParams);

    if cds.FieldByName('CODIGO').AsInteger <> 0 then
      raise Exception.Create(cds.FieldByName('MENSAGEM').AsString);

    Self.Close;

  except
    on E: Exception do
      MessageDlg(E.Message, mtError, [mbOK], 0);
  end;


end;

procedure TfrmApontamentoImprodutivo.edAPT_ATI_IN_CODIGOEnter(Sender: TObject);
begin

  TEdit(Sender).TextHint := TEdit(Sender).Text;

end;

procedure TfrmApontamentoImprodutivo.edAPT_ATI_IN_CODIGOExit(Sender: TObject);
var
  cds : TClientDataSet;
  vParams : TStringStream;
begin

  cds := TClientDataSet.Create(Self);

  if TEdit(Sender).TextHint = TEdit(Sender).Text then
  begin
    Exit;
  end;

  edATI_ST_NOME.Text := '';

  if edAPT_ATI_IN_CODIGO.Text = '' then
  begin
    PreparaCampos(cds);
    Exit;
  end;

  vParams := TStringStream.Create;
  vParams.WriteString('"<PARAMETROS>');
  vParams.WriteString('<EVENTO>P_ATIVIDADE_LST</EVENTO>');
  vParams.WriteString('<ORG_IN_CODIGO>' + IntToStr(wORG_IN_CODIGO) + '</ORG_IN_CODIGO>');
  vParams.WriteString('<ATI_IN_CODIGO>' + edAPT_ATI_IN_CODIGO.Text + '</ATI_IN_CODIGO>');
  vParams.WriteString('<ATI_CH_PRODUTIVA>' + 'I' + '</ATI_CH_PRODUTIVA>');
  vParams.WriteString('</PARAMETROS>"');

  cds := DM.f_evento_lst(vParams);

  if cds.IsEmpty then
  begin
    edAPT_ATI_IN_CODIGO.Text := '';
    edATI_ST_NOME.Text := '';
    MessageDlg('Código da ocorrência não cadastrado.', mtError, [mbOK], 0);
    edAPT_ATI_IN_CODIGO.SetFocus;
    Exit;
  end;

  edATI_ST_NOME.Text := cds.FieldByName('ATI_ST_NOME').AsString;

  PreparaCampos(cds);

  CarregarApontamento();

end;

procedure TfrmApontamentoImprodutivo.edAPT_DT_APONTAMENTOExit(Sender: TObject);
begin
  try
    StrToDate(TMaskEdit(Sender).Text);
  except
    on EConvertError do
      TMaskEdit(Sender).Text := '';
  end;
end;


procedure TfrmApontamentoImprodutivo.edAPT_DT_ENCERRAMENTOExit(Sender: TObject);
begin
  try
    StrToDate(TMaskEdit(Sender).Text);
  except
    on EConvertError do
      TMaskEdit(Sender).Text := '';
  end;
end;

procedure TfrmApontamentoImprodutivo.edAPT_MAQ_IN_CODIGOExit(Sender: TObject);
var
  cds : TClientDataSet;
  vParams : TStringStream;
begin

  edMAQ_ST_NOME.Text := '';

  if edAPT_MAQ_IN_CODIGO.Text = '' then
    Exit;

  vParams := TStringStream.Create;
  vParams.WriteString('"<PARAMETROS>');
  vParams.WriteString('<EVENTO>P_MAQUINA_LST</EVENTO>');
  vParams.WriteString('<ORG_IN_CODIGO>' + IntToStr(wORG_IN_CODIGO) + '</ORG_IN_CODIGO>');
  vParams.WriteString('<MAQ_IN_CODIGO>' + edAPT_MAQ_IN_CODIGO.Text + '</MAQ_IN_CODIGO>');
  vParams.WriteString('</PARAMETROS>"');

  cds := TClientDataSet.Create(Self);
  cds := DM.f_evento_lst(vParams);

  if cds.IsEmpty then
  begin
    edAPT_MAQ_IN_CODIGO.Text := '';
    edMAQ_ST_NOME.Text := '';
    MessageDlg('Código da maquina não cadastrado.', mtError, [mbOK], 0);
    edAPT_MAQ_IN_CODIGO.SetFocus;
    Exit;
  end;

  edMAQ_ST_NOME.Text := cds.FieldByName('MAQ_ST_NOME').AsString;

  CarregarApontamento();

end;
procedure TfrmApontamentoImprodutivo.edAPT_RE_TEMPOFINALExit(Sender: TObject);
begin
  try
    StrToTime(TMaskEdit(Sender).Text);
  except
    on EConvertError do
      TMaskEdit(Sender).Text := '';
  end;
end;

procedure TfrmApontamentoImprodutivo.edAPT_RE_TEMPOINICIALExit(Sender: TObject);
begin

  try
    StrToTime(TMaskEdit(Sender).Text);
  except
    on EConvertError do
      TMaskEdit(Sender).Text := '';
  end;

end;

procedure TfrmApontamentoImprodutivo.edCMAQ_IN_CODIGOExit(Sender: TObject);
var
  cds : TClientDataSet;
  vParams : TStringStream;
begin

  edCMAQ_ST_DESCRICAO.Text := '';

  if edCMAQ_IN_CODIGO.Text = '' then
    Exit;

  vParams := TStringStream.Create;
  vParams.WriteString('"<parametros>');
  vParams.WriteString('<evento>p_cmaquina_lst</evento>');
  vParams.WriteString('<org_in_codigo>' + IntToStr(wORG_IN_CODIGO) + '</org_in_codigo>');
  vParams.WriteString('<ctr_in_codigo>' + edAPT_MAQ_IN_CODIGO.Text + ' </ctr_in_codigo>');
  vParams.WriteString('<cmaq_in_codigo>' + edCMAQ_IN_CODIGO.Text + ' </cmaq_in_codigo>');
  vParams.WriteString('</parametros>"');

  cds := TClientDataSet.Create(Self);
  cds := DM.f_evento_lst(vParams);

  if cds.IsEmpty then
  begin
    edCMAQ_IN_CODIGO.Text := '';
    edCMAQ_ST_DESCRICAO.Text := '';
    MessageDlg('Código da maquina não cadastrado.', mtError, [mbOK], 0);
    edCMAQ_IN_CODIGO.SetFocus;
    Exit;
  end;

  edCMAQ_ST_DESCRICAO.Text := cds.FieldByName('CMAQ_ST_DESCRICAO').AsString;

  CarregarApontamento();

end;
procedure TfrmApontamentoImprodutivo.edOPD_ST_ALTERNATIVOExit(Sender: TObject);
var
  cds : TClientDataSet;
  vParams : TStringStream;
begin

  edOPD_ST_DESCRICAO.Text := '';

  if edOPD_ST_ALTERNATIVO.Text = '' then
    Exit;

  vParams := TStringStream.Create;
  vParams.WriteString('"<parametros>');
  vParams.WriteString('<evento>p_operador_lst</evento>');
  vParams.WriteString('<org_in_codigo>' + IntToStr(wORG_IN_CODIGO) + '</org_in_codigo>');
  vParams.WriteString('<opd_st_alternativo>' + edOPD_ST_ALTERNATIVO.Text + ' </opd_st_alternativo>');
  vParams.WriteString('</parametros>"');

  cds := TClientDataSet.Create(Self);
  cds := DM.f_evento_lst(vParams);

  if cds.IsEmpty then
  begin
    edOPD_ST_ALTERNATIVO.Text := '';
    edOPD_ST_DESCRICAO.Text := '';
    MessageDlg('Código do operador não cadastrado.', mtError, [mbOK], 0);
    edOPD_ST_ALTERNATIVO.SetFocus;
    Exit;
  end;

  edOPD_ST_DESCRICAO.Text := cds.FieldByName('OPD_ST_DESCRICAO').AsString;

  CarregarApontamento();

end;

procedure TfrmApontamentoImprodutivo.edORD_IN_CODIGOExit(Sender: TObject);
var
  cds : TClientDataSet;
  vParams : TStringStream;

  vOrdPlf : String;
  vOrd : String;
  vPlf : String;

begin

  edORD_ST_ALTERNATIVO.Text := '';
  edOPR_IN_CODIGO.Text := '';

  if edORD_IN_CODIGO.Text = '' then
    Exit;

  vOrdPlf := edORD_IN_CODIGO.Text;
  vOrd := (Copy(vOrdPlf, 0, Length(vOrdPlf) -3));
  vPlf := (Copy(vOrdPlf, Length(vOrdPlf) -2));

  vParams := TStringStream.Create;
  vParams.WriteString('"<PARAMETROS>');
  vParams.WriteString('<EVENTO>P_ORDEM_OPERACAO_LST</EVENTO>');
  vParams.WriteString('<ORG_IN_CODIGO>' + IntToStr(wORG_IN_CODIGO) + '</ORG_IN_CODIGO>');
  vParams.WriteString('<ORD_IN_CODIGO>' + vOrd + ' </ORD_IN_CODIGO>');
  vParams.WriteString('<PLF_IN_SQOPERACAO>' + vPlf + ' </PLF_IN_SQOPERACAO>');
  vParams.WriteString('</PARAMETROS>"');

  cds := TClientDataSet.Create(Self);
  cds := DM.f_evento_lst(vParams);

  if cds.IsEmpty then
  begin
    MessageBox(handle, 'Ordem/Operação não encontrada ou já finalizada.' ,'Atenção:', MB_OK or MB_ICONERROR);
    edORD_IN_CODIGO.SetFocus();
    Exit;
  end;

  edORD_ST_ALTERNATIVO.Text := cds.FieldByName('ORD_ST_ALTERNATIVO').AsString;
  edOPR_IN_CODIGO.Text := cds.FieldByName('OPR_IN_CODIGO').AsString;

  CarregarApontamento();

end;

procedure TfrmApontamentoImprodutivo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

  TForm(Self.Owner).WindowState := wsMaximized;
  frmFollowup.boFiltrarClick(frmFollowup.boFiltrar);
  FreeAndNil(Self);

end;

procedure TfrmApontamentoImprodutivo.FormCreate(Sender: TObject);
var
  cds : TClientDataSet;
begin

  cds := TClientDataSet.Create(Self);
  PreparaCampos(cds);
  Self.Height := 200;

end;

procedure TfrmApontamentoImprodutivo.FormShow(Sender: TObject);
begin

  TForm(Self.Owner).WindowState := wsMinimized;
  //edAPT_ATI_IN_CODIGO.SetFocus;

end;

procedure TfrmApontamentoImprodutivo.PreparaCampos(cds : TClientDataSet);
var
  i : Integer;
begin

  i := 52;
  Self.Height := 142;

  pnAPT_MAQ_IN_CODIGO.Visible   := False;
  pnCMAQ_IN_CODIGO.Visible      := False;
  pnOPD_ST_ALTERNATIVO.Visible  := False;
  pnORD_IN_CODIGO.Visible       := False;
  pnHorarios.Visible            := False;
  pnAPT_ST_OBSERVACAO.Visible   := False;
  pnAPT_CH_STATUS.Visible       := False;

  if not cds.Active then
    Exit;

  pnAPT_MAQ_IN_CODIGO.Visible   := DM.iif(cds.FieldByName('ATI_BO_FIELDCTRABALHO').AsString = 'S', True, False);
  if pnAPT_MAQ_IN_CODIGO.Visible then
    Self.Height := Self.Height + i;

  pnCMAQ_IN_CODIGO.Visible      := DM.iif(cds.FieldByName('ATI_BO_FIELDMAQUINA').AsString = 'S', True, False);
  if pnCMAQ_IN_CODIGO.Visible then
    Self.Height := Self.Height + i;

  pnOPD_ST_ALTERNATIVO.Visible  := DM.iif(cds.FieldByName('ATI_BO_FIELDOPERADOR').AsString = 'S', True, False);
  if pnOPD_ST_ALTERNATIVO.Visible then
    Self.Height := Self.Height + i;

  pnORD_IN_CODIGO.Visible       := DM.iif(cds.FieldByName('ATI_BO_FIELDORDEM').AsString = 'S', True, False);
  if pnORD_IN_CODIGO.Visible then
    Self.Height := Self.Height + i;

  pnAPT_DT_APONTAMENTO.Enabled  := DM.iif(cds.FieldByName('ATI_BO_FIELDTPINICIAL').AsString = 'S', True, False);
  pnAPT_DT_ENCERRAMENTO.Enabled := DM.iif(cds.FieldByName('ATI_BO_FIELDTPFINAL').AsString = 'S', True, False);

  Self.Position := poScreenCenter;

  if edAPT_MAQ_IN_CODIGO.CanFocus then
    edAPT_MAQ_IN_CODIGO.SetFocus
  else if edCMAQ_IN_CODIGO.CanFocus then
    edCMAQ_IN_CODIGO.SetFocus
  else if edOPD_ST_ALTERNATIVO.CanFocus then
    edOPD_ST_ALTERNATIVO.SetFocus
  else if edORD_IN_CODIGO.CanFocus then
    edORD_IN_CODIGO.SetFocus
  else if edAPT_DT_APONTAMENTO.CanFocus then
    edAPT_DT_APONTAMENTO.SetFocus
  else if edAPT_DT_ENCERRAMENTO.CanFocus then
    edAPT_DT_ENCERRAMENTO.SetFocus;

  vForfmHeight := Self.Height;

  Self.Position := poScreenCenter;

end;

procedure TfrmApontamentoImprodutivo.CarregarApontamento;
var
  vParams : TStringStream;
  cds : TClientDataSet;
  vAcao : String;
begin

  if ((edAPT_ATI_IN_CODIGO.CanFocus) And (edAPT_ATI_IN_CODIGO.Text = '')) then
    Exit;

  if ((edAPT_MAQ_IN_CODIGO.CanFocus) And (edAPT_MAQ_IN_CODIGO.Text = '')) then
    Exit;

  if ((edCMAQ_IN_CODIGO.CanFocus) And (edCMAQ_IN_CODIGO.Text = '')) then
    Exit;

  if ((edORD_IN_CODIGO.CanFocus) And (edORD_IN_CODIGO.Text = '')) then
    Exit;

  if ((edOPD_ST_ALTERNATIVO.CanFocus) And (edOPD_ST_ALTERNATIVO.Text = '')) then
    Exit;

  vParams := TStringStream.Create;
  vParams.WriteString('"<PARAMETROS>');
  vParams.WriteString('<EVENTO>P_APONTAMENTO_LST</EVENTO>');
  vParams.WriteString('<ORG_IN_CODIGO>' + IntToStr(wORG_IN_CODIGO) + '</ORG_IN_CODIGO>');
  vParams.WriteString('<MAQ_IN_CODIGO>' + edAPT_MAQ_IN_CODIGO.Text + '</MAQ_IN_CODIGO>');
  vParams.WriteString('<CMAQ_IN_CODIGO>' + edCMAQ_IN_CODIGO.Text + '</CMAQ_IN_CODIGO>');
  vParams.WriteString('<ORD_IN_CODIGO>' + edORD_IN_CODIGO.Text + '</ORD_IN_CODIGO>');
  vParams.WriteString('<OPD_ST_ALTERNATIVO>' + edOPD_ST_ALTERNATIVO.Text + '</OPD_ST_ALTERNATIVO>');
  vParams.WriteString('<ATI_CH_PRODUTIVA>I</ATI_CH_PRODUTIVA>');
  vParams.WriteString('<APT_CH_STATUS>A</APT_CH_STATUS>');
  vParams.WriteString('</PARAMETROS>"');

  cds := DM.f_evento_lst(vParams);

  Self.Height := vForfmHeight + 155;
  pnHorarios.Visible          := True;
  pnAPT_ST_OBSERVACAO.Visible := True;
  pnAPT_CH_STATUS.Visible     := True;

  if ( not(cds.Active) or (cds.IsEmpty)) then
  begin

    // Sem apontamento abertos
    vAcao := 'A';

    // Preenche as datas do apontamento
    edAPT_DT_APONTAMENTO.Text  := FormatDateTime('dd/mm/yyyy' , Now);
    edAPT_DT_APONTAMENTO.Enabled := pnAPT_DT_APONTAMENTO.Enabled;
    edAPT_RE_TEMPOINICIAL.Text := FormatDateTime('hh:nn' , Now);
    edAPT_RE_TEMPOINICIAL.Enabled := pnAPT_DT_APONTAMENTO.Enabled;

    edAPT_DT_ENCERRAMENTO.Text := FormatDateTime('dd/mm/yyyy' , Now);;
    edAPT_RE_TEMPOFINAL.Text := FormatDateTime('hh:nn' , Now);
    if pnAPT_DT_APONTAMENTO.Enabled then
    begin
      edAPT_DT_ENCERRAMENTO.Enabled := pnAPT_DT_ENCERRAMENTO.Enabled;
      edAPT_RE_TEMPOFINAL.Enabled := pnAPT_DT_ENCERRAMENTO.Enabled;
    end
    else
    begin
      edAPT_DT_ENCERRAMENTO.Enabled := False;
      edAPT_RE_TEMPOFINAL.Enabled := False;
    end;

    edAPT_CH_STATUS.Checked := False;

    if (pnAPT_DT_APONTAMENTO.Enabled and pnAPT_DT_ENCERRAMENTO.Enabled) then
    begin
      edAPT_CH_STATUS.Enabled := True;
      edAPT_CH_STATUS.Checked := True;
    end
    else
    begin
      edAPT_CH_STATUS.Enabled := False;
      edAPT_CH_STATUS.Checked := False;
    end;

  end
  else
  begin
    // Apontamento aberto, preprarar encerramento (E)
    vAcao := 'E';

    edAPT_IN_SEQUENCIA.Text    := cds.FieldByName('APT_IN_SEQUENCIA').AsString;
    edAPT_DT_APONTAMENTO.Text  := cds.FieldByName('APT_DT_APONTAMENTO').AsString;
    edAPT_DT_APONTAMENTO.Enabled := pnAPT_DT_APONTAMENTO.Enabled;
    edAPT_RE_TEMPOINICIAL.Text := cds.FieldByName('APT_HR_TEMPOINICIAL').AsString;
    edAPT_RE_TEMPOINICIAL.Enabled := pnAPT_DT_APONTAMENTO.Enabled;

    // Preenche as datas do apontamento
    edAPT_DT_ENCERRAMENTO.Text :=     FormatDateTime('dd/mm/yyyy' , Now);
    edAPT_DT_ENCERRAMENTO.Enabled := pnAPT_DT_ENCERRAMENTO.Enabled;
    edAPT_RE_TEMPOFINAL.Text   := FormatDateTime('hh:nn' , Now);
    edAPT_RE_TEMPOFINAL.Enabled := pnAPT_DT_ENCERRAMENTO.Enabled;

    edAPT_CH_STATUS.Checked := True;

  end;

  //PreparaCampos(vAcao);

end;

end.

