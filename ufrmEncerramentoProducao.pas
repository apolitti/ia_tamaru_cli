unit ufrmEncerramentoProducao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Datasnap.DBClient,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls, Math,
  Vcl.Grids, Vcl.DBGrids;

type
  TfrmEncerramentoProducao = class(TForm)
    Pn_Topo: TPanel;
    Lb_CMAQ_IN_CODIGO: TLabel;
    Ed_CMAQ_IN_CODIGO: TEdit;
    Bo_OK: TBitBtn;
    Pn_Principal: TPanel;
    Pn_Rodape: TPanel;
    Lb_ORD_IN_CODIGO: TLabel;
    Cl_Cmq: TClientDataSet;
    Cl_Ord: TClientDataSet;
    Bo_Fechar: TBitBtn;
    Bo_Confirmar: TBitBtn;
    Lb_PLF_RE_QUANTIDADEORI: TLabel;
    Lb_APO_RE_QTDEPRODUZIDAKG: TLabel;
    Ds_Ord: TDataSource;
    Ed_ORD_IN_CODIGO: TDBEdit;
    Ed_PLF_RE_QUANTIDADEORI: TDBEdit;
    Ed_APO_RE_QTDEPRODUZIDAKG: TDBEdit;
    Lb_PRO_IN_CODIGO: TLabel;
    Ed_PRO_IN_CODIGO: TDBEdit;
    Lb_PRO_ST_ALTERNATIVO: TLabel;
    Ed_PRO_ST_ALTERNATIVO: TDBEdit;
    Lb_PRO_ST_DESCRICAO: TLabel;
    Ed_PRO_ST_DESCRICAO: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Cl_Pro: TClientDataSet;
    Lb_APO_RE_QTDEPRODUZIDAKG1: TLabel;
    Cl_Enc: TClientDataSet;
    Ds_Enc: TDataSource;
    Gd_Consumo: TDBGrid;
    procedure Ed_CMAQ_IN_CODIGOKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Bo_OKClick(Sender: TObject);
    procedure Bo_FecharClick(Sender: TObject);
    procedure Ed_CMAQ_IN_CODIGOChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Bo_ConfirmarClick(Sender: TObject);
    procedure Ed_CMAQ_IN_CODIGOExit(Sender: TObject);
    procedure Cl_EncBeforeDelete(DataSet: TDataSet);
    procedure Cl_EncBeforeInsert(DataSet: TDataSet);
    procedure Cl_EncBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
    BloqueiaInsercao : boolean;
    stringStream     : TStringStream;
  public
    { Public declarations }
  end;

var
  frmEncerramentoProducao: TfrmEncerramentoProducao;

implementation

{$R *.dfm}

uses uDM;

procedure TfrmEncerramentoProducao.Bo_ConfirmarClick(Sender: TObject);
var
  iCMAQ_IN_CODIGO    : Integer;
  rAPO_RE_QUANTIDADE : Extended;
  sAPO_IN_SEQUENCIA  : string;
begin

  if (Cl_Enc.State in [dsInsert,dsEdit]) then
  begin
    Cl_Enc.Post;
  end;

  if (Cl_Enc.State in [dsInsert,dsEdit]) then
  begin
    Exit;
  end;

  stringStream.Clear;
  stringStream.WriteString('[');
  Cl_Enc.First;
  while not Cl_Enc.Eof do
  begin

    stringStream.WriteString('{');
    stringStream.WriteString(' "mqd_in_sequencia":'       + IntToStr(Cl_Enc.FieldByName('mqd_in_sequencia').AsInteger));
    stringStream.WriteString(',"mqd_re_qtdesaldokg":'     + StringReplace(FloatToStr(Cl_Enc.FieldByName('mqd_re_qtdesaldokg').AsFloat),',','.',[rfReplaceAll]));
    stringStream.WriteString(',"mqd_re_qtdeconsumidakg":' + StringReplace(FloatToStr(Cl_Enc.FieldByName('mqd_re_qtdeconsumidakg').AsFloat),',','.',[rfReplaceAll]));
    stringStream.WriteString(',"mqd_re_devolver":'        + StringReplace(FloatToStr(Cl_Enc.FieldByName('mqd_re_devolver').AsFloat),',','.',[rfReplaceAll]));
    stringStream.WriteString('}');

    Cl_Enc.Next;

    if not Cl_Enc.Eof then
      stringStream.WriteString(',');

  end;

  stringStream.WriteString(']');

  try

    Screen.Cursor := crSQLWait;

    try
      DM.p_encerrarproducao_exe
        ( Cl_Ord.FieldByName('fil_in_codigo').AsString
        , Cl_Cmq.FieldByName('cmaq_in_codigo').AsString
        , Cl_Ord.FieldByName('ord_in_codigo').AsString
        , Cl_Enc.FieldByName('apo_re_qtdeproduzidakg').AsString
        , stringstream
        );
    except
      on e: exception do
      begin
        raise Exception.Create(e.Message);
      end;
    end;

  finally

    Screen.Cursor := crDefault;

  end;

  Bo_FecharClick(Bo_Fechar);

end;

procedure TfrmEncerramentoProducao.Bo_FecharClick(Sender: TObject);
begin

  if Pn_Topo.Enabled = False then
  begin
    Ed_CMAQ_IN_CODIGO.Clear;
    Pn_Topo.Enabled      := True;
    Pn_Principal.Visible := False;
    Ed_CMAQ_IN_CODIGO.SetFocus;
  end
  else
  begin
    Close;
  end;

end;

procedure TfrmEncerramentoProducao.Bo_OKClick(Sender: TObject);
var
  v_copia : string;
  str     : TStringList;
begin

  if (Ed_CMAQ_IN_CODIGO.Text = '') then
  begin
    Exit;
  end;

  DM.p_maquina_lst(Cl_Cmq,wFIL_IN_CODIGO,StrToInt(Ed_CMAQ_IN_CODIGO.Text));

  if (Cl_Cmq.IsEmpty = True) then
  begin
    Ed_CMAQ_IN_CODIGO.SetFocus;
    Ed_CMAQ_IN_CODIGO.SelectAll;
    raise Exception.Create('M�quina n�o localizada!');
  end;

  if Cl_Cmq.FieldByName('ord_in_codigo_setup').AsString = '' then
  begin
    Ed_CMAQ_IN_CODIGO.SetFocus;
    Ed_CMAQ_IN_CODIGO.SelectAll;
    raise Exception.Create('Ordem n�o definida no setup da m�quina!');
  end;

  DM.p_ordem_lst(Cl_Ord,wFIL_IN_CODIGO,Cl_Cmq.FieldByName('ord_in_codigo_setup').AsInteger);

  BloqueiaInsercao := False;
  DM.p_encerrarproducao_lst(Cl_Enc,wFIL_IN_CODIGO,Cl_Cmq.FieldByName('cmaq_in_codigo').AsInteger);
  BloqueiaInsercao := True;

  Pn_Topo.Enabled       := False;
  Pn_Principal.Visible  := True;

end;

procedure TfrmEncerramentoProducao.Cl_EncBeforeDelete(DataSet: TDataSet);
begin
  Abort;
end;

procedure TfrmEncerramentoProducao.Cl_EncBeforeInsert(DataSet: TDataSet);
begin
  if BloqueiaInsercao then Abort;
end;

procedure TfrmEncerramentoProducao.Cl_EncBeforePost(DataSet: TDataSet);
begin

  if (Cl_Enc.FieldByName('mqd_re_devolver').AsFloat > Cl_Enc.FieldByName('mqd_re_qtdesaldokg').AsFloat)
     or
     (Cl_Enc.FieldByName('mqd_re_devolver').AsFloat < 0)
  then
  begin
    raise Exception.Create('Quantidade a devolver para o estoque inv�lida!');
  end;

end;

procedure TfrmEncerramentoProducao.Ed_CMAQ_IN_CODIGOChange(Sender: TObject);
begin
  Cl_Cmq.Close;
  Cl_Ord.Close;
end;

procedure TfrmEncerramentoProducao.Ed_CMAQ_IN_CODIGOExit(Sender: TObject);
var
  icmaq_in_codigo : Integer;
begin

  Ed_CMAQ_IN_CODIGO.Text := Trim(Ed_CMAQ_IN_CODIGO.Text);

  if Ed_CMAQ_IN_CODIGO.Text <> '' then
  begin

    if not(TryStrToInt(Ed_CMAQ_IN_CODIGO.Text,icmaq_in_codigo)) then
    begin
      Ed_CMAQ_IN_CODIGO.SelectAll;
      raise Exception.Create('M�quina inv�lida!');
    end;

    Bo_OKClick(Sender);

  end;

end;

procedure TfrmEncerramentoProducao.Ed_CMAQ_IN_CODIGOKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN Then
  begin
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

procedure TfrmEncerramentoProducao.FormCreate(Sender: TObject);
begin
  BloqueiaInsercao     := True;
  stringStream         := TStringStream.Create;
  Pn_Principal.Visible := False;
end;

end.
