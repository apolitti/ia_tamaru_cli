unit ufrmOrdemOperadorApontamentos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Datasnap.DBClient, Vcl.Grids,
  Vcl.DBGrids, System.JSON, IPPeerClient, REST.Client,
  REST.Authenticator.Simple, Data.Bind.Components, Data.Bind.ObjectScope,
  REST.Response.Adapter, Datasnap.DSClientRest, REST.Authenticator.Basic,
  Vcl.ExtCtrls, JvExExtCtrls, JvExtComponent, JvPanel, JvExForms, JvScrollBox,
  JvExControls, JvLabel, DBXJSON, DBXJSONReflect, Vcl.DBCGrids, Vcl.StdCtrls,
  Vcl.Mask, Vcl.DBCtrls, Vcl.ComCtrls;

type
  TfrmOrdemOperadorApontamentos = class(TForm)
    GroupBox1: TGroupBox;
    Label2: TLabel;
    edORD_IN_CODIGO: TEdit;
    Label3: TLabel;
    edPRO_IN_CODIGO: TEdit;
    edPRO_ST_DESCRICAO: TEdit;
    Label5: TLabel;
    edOPR_IN_CODIGO: TEdit;
    edOPR_ST_OPERACAO: TEdit;
    GroupBox2: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    edPRO_ST_ALTERNATIVO: TEdit;
    edORD_ST_ALTERNATIVO: TEdit;
    Label10: TLabel;
    Label11: TLabel;
    edORD_DT_RECEBIMENTO: TEdit;
    Label12: TLabel;
    edPLF_IN_SQOPERACAO: TEdit;
    cdsApontamentos: TClientDataSet;
    dsApontamentos: TDataSource;
    gdApontamentos: TDBGrid;
    Label13: TLabel;
    edMAQ_IN_CODIGO: TEdit;
    edMAQ_ST_NOME: TEdit;
    Panel1: TPanel;
    Button1: TButton;
    Button3: TButton;
    procedure edORD_IN_CODIGOExit(Sender: TObject);
    procedure edPLF_IN_SQOPERACAOExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    procedure CarregaApontamentos;
  end;

var
  frmOrdemOperadorApontamentos: TfrmOrdemOperadorApontamentos;

implementation

{$R *.dfm}

uses uDM, ufrmOrdemApontamento, ufrmFollowup;

procedure TfrmOrdemOperadorApontamentos.edORD_IN_CODIGOExit(Sender: TObject);
var
  cds : TClientDataSet;
  vParams : TStringStream;
begin

  edPRO_IN_CODIGO.Text := '';
  edPRO_ST_DESCRICAO.Text := '';
  edPRO_ST_ALTERNATIVO.Text := '';
  edORD_DT_RECEBIMENTO.Text := '';
  edORD_ST_ALTERNATIVO.Text := '';

  if edORD_IN_CODIGO.Text = '' then
    Exit;

  vParams := TStringStream.Create;
  vParams.WriteString('"<parametros>');
  vParams.WriteString('<evento>p_ordem_lst</evento>');
  vParams.WriteString('<org_in_codigo>' + IntToStr(wORG_IN_CODIGO) + '</org_in_codigo>');
  vParams.WriteString('<ord_in_codigo>' + edORD_IN_CODIGO.Text + ' </ord_in_codigo>');
  vParams.WriteString('</parametros>"');

  cds := TClientDataSet.Create(Self);
  cds := DM.f_evento_lst(vParams);

  if cds.IsEmpty then
    Exit;

  edPRO_IN_CODIGO.Text := cds.FieldByName('PRO_IN_CODIGO').AsString;
  edPRO_ST_DESCRICAO.Text := cds.FieldByName('PRO_ST_DESCRICAO').AsString;
  edPRO_ST_ALTERNATIVO.Text := cds.FieldByName('PRO_ST_ALTERNATIVO').AsString;
  edORD_DT_RECEBIMENTO.Text := cds.FieldByName('ORD_DT_RECEBIMENTO').AsString;
  edORD_ST_ALTERNATIVO.Text := cds.FieldByName('ORD_ST_ALTERNATIVO').AsString;


end;

procedure TfrmOrdemOperadorApontamentos.edPLF_IN_SQOPERACAOExit(Sender: TObject);
var
  cds : TClientDataSet;
  vParams : TStringStream;
begin

  edOPR_IN_CODIGO.Text := '';
  edOPR_ST_OPERACAO.Text := '';

  if edPLF_IN_SQOPERACAO.Text = '' then
    Exit;

  vParams := TStringStream.Create;
  vParams.WriteString('"<parametros>');
  vParams.WriteString('<evento>P_OPERACAO_LST</evento>');
  vParams.WriteString('<org_in_codigo>' + IntToStr(wORG_IN_CODIGO) + '</org_in_codigo>');
  vParams.WriteString('<PLF_IN_SQOPERACAO>' + edPLF_IN_SQOPERACAO.Text + ' </PLF_IN_SQOPERACAO>');
  vParams.WriteString('</parametros>"');

  cds := TClientDataSet.Create(Self);
  cds := DM.f_evento_lst(vParams);

  if cds.IsEmpty then
    Exit;

  edOPR_IN_CODIGO.Text := cds.FieldByName('OPR_IN_CODIGO').AsString;
  edOPR_ST_OPERACAO.Text := cds.FieldByName('OPR_ST_OPERACAO').AsString;
  edMAQ_IN_CODIGO.Text := cds.FieldByName('MAQ_IN_CODIGO').AsString;
  edMAQ_ST_NOME.Text := cds.FieldByName('MAQ_ST_NOME').AsString;

end;

procedure TfrmOrdemOperadorApontamentos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

  TForm(Self.Owner).WindowState := wsMaximized;
  frmFollowup.boFiltrarClick(frmFollowup.boFiltrar);
  FreeAndNil(Self);

end;

procedure TfrmOrdemOperadorApontamentos.FormKeyPress(Sender: TObject;
  var Key: Char);
begin

  if Key = #13 then
  begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;

end;

procedure TfrmOrdemOperadorApontamentos.FormShow(Sender: TObject);
begin

  TForm(Self.Owner).WindowState := wsMinimized;
  Self.BringToFront;

end;

procedure TfrmOrdemOperadorApontamentos.Button1Click(Sender: TObject);
begin

  frmOrdemApontamento := TfrmOrdemApontamento.Create(Self);

  frmOrdemApontamento.edORD_IN_CODIGO.ReadOnly := True;
  frmOrdemApontamento.edORD_IN_CODIGO.Color := cl3DLight;
  frmOrdemApontamento.edORD_IN_CODIGO.TabStop := False;
  frmOrdemApontamento.edORD_IN_CODIGO.Text := edORD_IN_CODIGO.Text;
  frmOrdemApontamento.edORD_IN_CODIGOExit(frmOrdemOperadorApontamentos.edORD_IN_CODIGO);

  frmOrdemApontamento.edPLF_IN_SQOPERACAO.ReadOnly := True;
  frmOrdemApontamento.edPLF_IN_SQOPERACAO.Color := cl3DLight;
  frmOrdemApontamento.edPLF_IN_SQOPERACAO.TabStop := False;
  frmOrdemApontamento.edPLF_IN_SQOPERACAO.Text := edPLF_IN_SQOPERACAO.Text;
  frmOrdemApontamento.edPLF_IN_SQOPERACAOExit(frmOrdemOperadorApontamentos.edPLF_IN_SQOPERACAO);

  frmOrdemApontamento.Show;
  //frmOrdemApontamento.BringToFront;

end;

procedure TfrmOrdemOperadorApontamentos.Button3Click(Sender: TObject);
var
  cds : TClientDataSet;
  vParams : TStringStream;
begin

  edOPR_IN_CODIGO.Text := '';
  edOPR_ST_OPERACAO.Text := '';

  if edPLF_IN_SQOPERACAO.Text = '' then
    Exit;

  vParams := TStringStream.Create;
  vParams.WriteString('"<PARAMETROS>');
  vParams.WriteString('<EVENTO>P_APONTAMENTO_DEL</EVENTO>');
  vParams.WriteString('<APT_IN_SEQUENCIA>' + cdsApontamentos.FieldByName('APT_IN_SEQUENCIA').AsString + '</APT_IN_SEQUENCIA>');
  vParams.WriteString('</PARAMETROS>"');

  cds := TClientDataSet.Create(Self);
  cds := DM.f_evento_lst(vParams);

  try
    if cds.FieldByName('CODIGO').AsInteger <> 0 then
      raise Exception.Create(cds.FieldByName('MENSAGEM').AsString);
  except
    on E: Exception do
      ShowMessage(E.Message);
  end;

  CarregaApontamentos();

end;

procedure TfrmOrdemOperadorApontamentos.CarregaApontamentos;
var
  vParams : TStringStream;
begin

  if edORD_IN_CODIGO.Text = '' then
    Exit;

  if edPLF_IN_SQOPERACAO.Text = '' then
    Exit;

  vParams := TStringStream.Create;
  vParams.WriteString('"<PARAMETROS>');
  vParams.WriteString('<EVENTO>P_APONTAMENTO_LST</EVENTO>');
  vParams.WriteString('<ORG_IN_CODIGO>' + IntToStr(wORG_IN_CODIGO) + '</ORG_IN_CODIGO>');
  vParams.WriteString('<ORD_IN_CODIGO>' + edORD_IN_CODIGO.Text + '</ORD_IN_CODIGO>');
  vParams.WriteString('<PLF_IN_SQOPERACAO>' + edPLF_IN_SQOPERACAO.Text + '</PLF_IN_SQOPERACAO>');
  //vParams.WriteString('<OPD_ST_ALTERNATIVO>' + edOPD_ST_ALTERNATIVO.Text + '</OPD_ST_ALTERNATIVO>');
  vParams.WriteString('</PARAMETROS>"');

  cdsApontamentos := DM.f_evento_lst(vParams);

  if not cdsApontamentos.Active then
    Exit;


  cdsApontamentos.Last;
  cdsApontamentos.First;
  dsApontamentos.DataSet := cdsApontamentos;
  gdApontamentos.DataSource := dsApontamentos;

end;

end.
