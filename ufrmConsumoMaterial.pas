unit ufrmConsumoMaterial;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Datasnap.DBClient, Vcl.Mask,
  Vcl.DBCtrls, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids;

type
  TfrmConsumoMaterial = class(TForm)
    Pn_Topo: TPanel;
    Lb_CMAQ_IN_CODIGO: TLabel;
    Ed_CMAQ_IN_CODIGO: TEdit;
    Bo_OK: TBitBtn;
    Pn_Principal: TPanel;
    Lb_ORD_IN_CODIGO: TLabel;
    Lb_PLF_RE_QUANTIDADEORI: TLabel;
    Lb_APO_RE_QTDEPRODUZIDAKG: TLabel;
    Lb_PRO_IN_CODIGO: TLabel;
    Lb_PRO_ST_ALTERNATIVO: TLabel;
    Lb_PRO_ST_DESCRICAO: TLabel;
    Label2: TLabel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Lb_APO_RE_QTDEPRODUZIDAKG1: TLabel;
    Bo_Confirmar: TBitBtn;
    Ed_ORD_IN_CODIGO: TDBEdit;
    Ed_PLF_RE_QUANTIDADEORI: TDBEdit;
    Ed_APO_RE_QTDEPRODUZIDAKG: TDBEdit;
    Ed_PRO_IN_CODIGO: TDBEdit;
    Ed_PRO_ST_ALTERNATIVO: TDBEdit;
    Ed_PRO_ST_DESCRICAO: TDBEdit;
    DBEdit2: TDBEdit;
    Cl_Pro: TClientDataSet;
    Cl_Cmq: TClientDataSet;
    Cl_Ord: TClientDataSet;
    Cl_Enc: TClientDataSet;
    Ds_Ord: TDataSource;
    Ds_Enc: TDataSource;
    Pn_Rodape: TPanel;
    Bo_Fechar: TBitBtn;
    Gd_Consumo: TDBGrid;
    Cl_Dde: TClientDataSet;
    DS_Dde: TDataSource;
    Lb_APO_RE_QTDEPRODUZIDAKGNRM: TLabel;
    Ed_APO_RE_QTDEPRODUZIDAKGNRM: TDBEdit;
    Lb_APO_RE_QTDEPRODUZIDAKGNRM1: TLabel;
    Lb_APO_RE_QTDEPRODUZIDAKGSPA: TLabel;
    Ed_APO_RE_QTDEPRODUZIDAKGSPA: TDBEdit;
    Lb_APO_RE_QTDEPRODUZIDAKGSPA1: TLabel;
    procedure Bo_OKClick(Sender: TObject);
    procedure Ed_CMAQ_IN_CODIGOChange(Sender: TObject);
    procedure Ed_CMAQ_IN_CODIGOKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Ed_CMAQ_IN_CODIGOExit(Sender: TObject);
    procedure Bo_FecharClick(Sender: TObject);
    procedure Cl_DdeBeforeDelete(DataSet: TDataSet);
    procedure Cl_DdeBeforeInsert(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure Bo_ConfirmarClick(Sender: TObject);
  private
    { Private declarations }
    stringStream : TStringStream;
    BloqueiaInsercao: boolean;
    procedure ValidaFIFO;
  public
    { Public declarations }
  end;

var
  frmConsumoMaterial: TfrmConsumoMaterial;

implementation

{$R *.dfm}

uses uDM;

procedure TfrmConsumoMaterial.Bo_ConfirmarClick(Sender: TObject);
var
  iCMAQ_IN_CODIGO    : Integer;
  rAPO_RE_QUANTIDADE : Extended;
  sAPO_IN_SEQUENCIA  : string;
begin

  ValidaFIFO;

  stringStream.Clear;
  stringStream.WriteString('[');
  Cl_Dde.First;
  while not Cl_Dde.Eof do
  begin

    if (Cl_Dde.FieldByName('mqd_re_qtdeinfo').AsFloat < 0)
       or
       (Cl_Dde.FieldByName('mqd_re_qtdeinfo').AsFloat > Cl_Dde.FieldByName('mqd_re_saldo').AsFloat)
    then
    begin
      raise Exception.Create('Quantidade inv�lida!');
    end;

    stringStream.WriteString('{');
    stringStream.WriteString('"mqd_in_sequencia":' + IntToStr(Cl_Dde.FieldByName('mqd_in_sequencia').AsInteger));
    stringStream.WriteString(',"mqd_re_qtdeinfo":' + StringReplace(FloatToStr(Cl_Dde.FieldByName('mqd_re_qtdeinfo').AsFloat),',','.',[rfReplaceAll]));
    stringStream.WriteString('}');

    Cl_Dde.Next;

    if not Cl_Dde.Eof then
      stringStream.WriteString(',');

  end;

  stringStream.WriteString(']');

  try

    Screen.Cursor := crSQLWait;

    try
      DM.p_encerrarconsumo_exe
        ( IntToStr(wFIL_IN_CODIGO)
        , Ed_CMAQ_IN_CODIGO.Text
        , Cl_Ord.FieldByName('ord_in_codigo').AsString
        , Cl_Enc.FieldByName('apo_re_qtdeproduzidakg').AsString
        , Cl_Enc.FieldByName('apo_re_qtdeconsumidakg').AsString
        , Cl_Enc.FieldByName('apo_re_qtdeempenhadakg').AsString
        , Cl_Enc.FieldByName('apo_re_qtdesaldokg').AsString
        , sAPO_IN_SEQUENCIA
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

  if StrToInt(sAPO_IN_SEQUENCIA) > 0 then
    ShowMessage('Apontamento gerado [' + sAPO_IN_SEQUENCIA + ']');

  Bo_FecharClick(Bo_Fechar);

end;

procedure TfrmConsumoMaterial.Bo_FecharClick(Sender: TObject);
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

procedure TfrmConsumoMaterial.Bo_OKClick(Sender: TObject);
var
  v_copia : string;
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

  if (Cl_Cmq.FieldByName('ord_in_codigo_setup').AsString = '') or (Cl_Cmq.FieldByName('ord_in_codigo_setup').AsString = '0') then
  begin
    Ed_CMAQ_IN_CODIGO.SetFocus;
    Ed_CMAQ_IN_CODIGO.SelectAll;
    raise Exception.Create('Ordem n�o definida no setup da m�quina!');
  end;

  DM.p_ordem_lst(Cl_Ord,wFIL_IN_CODIGO,Cl_Cmq.FieldByName('ord_in_codigo_setup').AsInteger);

  //if (Cl_Ord.FieldByName('ord_st_situacao').AsString <> 'AB') then
  //begin
  //  raise Exception.Create('Ordem [' + Cl_Cmq.FieldByName('ord_in_codigo_setup').AsString + '] encontra-se [' + Cl_Ord.FieldByName('ord_st_situacao_dsc').AsString + ']!');
  //end;

  DM.p_encerrarconsumo_lst(Cl_Enc, wFIL_IN_CODIGO, Cl_Cmq.FieldByName('cmaq_in_codigo').AsInteger);

  BloqueiaInsercao := False;
  DM.p_demandamaquina_lst(Cl_Dde, wFIL_IN_CODIGO, Cl_Cmq.FieldByName('cmaq_in_codigo').AsInteger);
  BloqueiaInsercao := True;

  Pn_Topo.Enabled       := False;
  Pn_Principal.Visible  := True;

end;

procedure TfrmConsumoMaterial.Cl_DdeBeforeDelete(DataSet: TDataSet);
begin
  Abort;
end;

procedure TfrmConsumoMaterial.Cl_DdeBeforeInsert(DataSet: TDataSet);
begin
  if BloqueiaInsercao then Abort;
end;

procedure TfrmConsumoMaterial.Ed_CMAQ_IN_CODIGOChange(Sender: TObject);
begin
  Cl_Cmq.Close;
  Cl_Ord.Close;
end;

procedure TfrmConsumoMaterial.Ed_CMAQ_IN_CODIGOExit(Sender: TObject);
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

procedure TfrmConsumoMaterial.Ed_CMAQ_IN_CODIGOKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN Then
  begin
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

procedure TfrmConsumoMaterial.FormCreate(Sender: TObject);
begin
  BloqueiaInsercao := True;
  stringStream := TStringStream.Create;
  Pn_Principal.Visible := False;
end;

procedure TfrmConsumoMaterial.ValidaFIFO;
var
  iMQD_IN_FIFO   : Integer;
  iPRO_IN_CODIGO : Integer;
begin

  try
    Cl_Dde.DisableControls;
    Cl_Dde.First;
    while not(Cl_Dde.Eof) do
    begin

      if (Cl_Dde.FieldByName('mqd_re_qtdeinfo').AsFloat > 0) then
      begin

        iMQD_IN_FIFO   := Cl_Dde.FieldByName('mqd_in_fifo').AsInteger;
        iPRO_IN_CODIGO := Cl_Dde.FieldByName('pro_in_codigo').AsInteger;

        Cl_Dde.First;
        while not(Cl_Dde.Eof) do
        begin

          if (Cl_Dde.FieldByName('pro_in_codigo').AsInteger = iPRO_IN_CODIGO)
             and
             (Cl_Dde.FieldByName('mqd_in_fifo').AsInteger < iMQD_IN_FIFO)
             and
             (Cl_Dde.FieldByName('mqd_re_qtdeinfo').AsFloat <> Cl_Dde.FieldByName('mqd_re_saldo').AsFloat)
          then
          begin
            Cl_Dde.Locate('MQD_IN_FIFO',IntToStr(iMQD_IN_FIFO),[]);
            raise Exception.Create('Lote n�o pode ser selecionado! Verifique o FIFO.');
          end;

          Cl_Dde.Next;

        end;

        Cl_Dde.Locate('MQD_IN_FIFO',IntToStr(iMQD_IN_FIFO),[]);

      end;

      Cl_Dde.Next;

    end;
  finally
    Cl_Dde.EnableControls;
  end;

end;

end.
