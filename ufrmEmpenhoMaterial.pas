unit ufrmEmpenhoMaterial;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Data.DB, Datasnap.DBClient, Vcl.Grids, Vcl.DBGrids, Math;

type
  TfrmEmpenhoMaterial = class(TForm)
    Pn_Topo: TPanel;
    Lb_CMAQ_IN_CODIGO: TLabel;
    Ed_CMAQ_IN_CODIGO: TEdit;
    Bo_OK: TBitBtn;
    Cl_Cmq: TClientDataSet;
    Pn_Principal: TPanel;
    Lb_MVS_ST_LOTEFORNE: TLabel;
    Ed_MVS_ST_LOTEFORNE: TEdit;
    Bo_Lote_Ins: TBitBtn;
    Gd_Drq: TDBGrid;
    Bo_Lote_Del: TBitBtn;
    Pn_Rodape: TPanel;
    Bo_Fechar: TBitBtn;
    Lb_MVS_RE_QUANTIDADE: TLabel;
    Ed_MVS_RE_QUANTIDADE: TEdit;
    Cl_Drq: TClientDataSet;
    Ds_Drq: TDataSource;
    Cl_Dds: TClientDataSet;
    Cl_Ord: TClientDataSet;
    Cl_Ili: TClientDataSet;
    procedure Bo_OKClick(Sender: TObject);
    procedure Bo_FecharClick(Sender: TObject);
    procedure Ed_CMAQ_IN_CODIGOKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Ed_MVS_ST_LOTEFORNEKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Ed_MVS_RE_QUANTIDADEKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Ed_MVS_ST_LOTEFORNEChange(Sender: TObject);
    procedure Ed_MVS_ST_LOTEFORNEExit(Sender: TObject);
    procedure Bo_Lote_InsClick(Sender: TObject);
    procedure Ed_MVS_RE_QUANTIDADEExit(Sender: TObject);
    procedure Bo_Lote_DelClick(Sender: TObject);
    procedure Cl_DrqBeforeDelete(DataSet: TDataSet);
    procedure Ed_CMAQ_IN_CODIGOChange(Sender: TObject);
    procedure Ed_CMAQ_IN_CODIGOExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEmpenhoMaterial: TfrmEmpenhoMaterial;

implementation

{$R *.dfm}

uses uDM;

procedure TfrmEmpenhoMaterial.Bo_FecharClick(Sender: TObject);
begin
  if Pn_Topo.Enabled = False then
  begin

    Ed_CMAQ_IN_CODIGO.Clear;
    Pn_Topo.Enabled := True;
    Pn_Principal.Visible := False;
    Ed_CMAQ_IN_CODIGO.SetFocus;

  end
  else
  begin
    Close;
  end;
end;

procedure TfrmEmpenhoMaterial.Bo_Lote_DelClick(Sender: TObject);
var
  rMVS_RE_QUANTIDADE : Extended;
  sMVS_RE_QUANTIDADE : string;
begin

  if (Cl_Drq.Active = False) then
  begin
    Exit;
  end;

  if (Cl_Drq.IsEmpty = True) then
  begin
    Exit;
  end;

  if Application.MessageBox(pChar('Deseja realmente excluir esse registro?'), pChar(Application.Title), MB_ICONQUESTION + MB_YESNO) = IDNO Then
  begin
    Exit;
  end;

  rMVS_RE_QUANTIDADE := Cl_Drq.FieldByName('mqd_re_saldo').AsFloat;
  sMVS_RE_QUANTIDADE := Cl_Drq.FieldByName('mqd_re_saldo').AsString;
  if InputQuery(Self.Caption,'Informe a quantidade a ser devolvida:',sMVS_RE_QUANTIDADE) = False then
  begin
    Exit;
  end;

  if not(TryStrToFloat(sMVS_RE_QUANTIDADE,rMVS_RE_QUANTIDADE)) then
  begin
    rMVS_RE_QUANTIDADE := 0;
  end;

  rMVS_RE_QUANTIDADE := RoundTo(rMVS_RE_QUANTIDADE,Cl_Drq.FieldByName('pun_in_decimaisqtde').AsInteger*-1);

  DM.p_demandamaquina_del(Cl_Drq.FieldByName('mqd_in_sequencia').AsInteger,rMVS_RE_QUANTIDADE);
  DM.p_demandamaquina_lst(Cl_Drq,wFIL_IN_CODIGO,StrToInt(Ed_CMAQ_IN_CODIGO.Text));

  if Application.MessageBox(pChar('Deseja reimprimir a etiqueta?'), pChar(Application.Title), MB_ICONQUESTION + MB_YESNO) = IDNO Then
  begin
    Exit;
  end;

  //PENDENTE
  ShowMessage('Impress�o de etiqueta em desenvolvimento...');

end;

procedure TfrmEmpenhoMaterial.Bo_Lote_InsClick(Sender: TObject);
begin

  try

    Screen.Cursor := crSQLWait;

    try
      DM.p_demandamaquina_ins(wFIL_IN_CODIGO,StrToInt(Ed_CMAQ_IN_CODIGO.Text),Ed_MVS_ST_LOTEFORNE.Text,StrToFloat(Ed_MVS_RE_QUANTIDADE.Text));
    except
      on e: exception do
      begin
        raise Exception.Create(e.Message);
      end;
    end;

  finally

    Screen.Cursor := crDefault;

  end;

  DM.p_demandamaquina_lst(Cl_Drq,wFIL_IN_CODIGO,StrToInt(Ed_CMAQ_IN_CODIGO.Text));

  Ed_MVS_ST_LOTEFORNE.Clear;
  Ed_MVS_RE_QUANTIDADE.Text := '0';
  Ed_MVS_ST_LOTEFORNE.SetFocus;

end;

procedure TfrmEmpenhoMaterial.Bo_OKClick(Sender: TObject);
var
  icmaq_in_codigo : Integer;
begin

  if not(TryStrToInt(Ed_CMAQ_IN_CODIGO.Text,icmaq_in_codigo)) then
  begin
    Ed_CMAQ_IN_CODIGO.SetFocus;
    Ed_CMAQ_IN_CODIGO.SelectAll;
    raise Exception.Create('M�quina inv�lida!');
  end;

  DM.p_maquina_lst(Cl_Cmq,wFIL_IN_CODIGO,icmaq_in_codigo);

  if (Cl_Cmq.IsEmpty = True) then
  begin
    Ed_CMAQ_IN_CODIGO.SetFocus;
    Ed_CMAQ_IN_CODIGO.SelectAll;
    raise Exception.Create('M�quina n�o localizada!');
  end;

  Ed_MVS_ST_LOTEFORNE.Clear;
  Ed_MVS_RE_QUANTIDADE.Text := '0';
  Cl_Drq.Close;

  DM.p_demandamaquina_lst(Cl_Drq,wFIL_IN_CODIGO,icmaq_in_codigo);

  if Cl_Cmq.FieldByName('ord_in_codigo_setup').AsString <> '' then
  begin

    DM.p_ordem_lst(Cl_Ord,wFIL_IN_CODIGO,Cl_Cmq.FieldByName('ord_in_codigo_setup').AsInteger);

    if Cl_Ord.IsEmpty = False then
    begin
      DM.p_listamateriais_lst(Cl_Ili,wFIL_IN_CODIGO,Cl_Ord.FieldByName('pro_in_codigo').AsInteger,Cl_Ord.FieldByName('cps_in_codigo').AsInteger,Cl_Ord.FieldByName('lis_in_revisao').AsInteger);
    end;

  end;

  Ed_MVS_RE_QUANTIDADE.Enabled := (Cl_Cmq.FieldByName('cmaq_bo_alterar_qtde_empenho').AsString = 'S');

  Pn_Topo.Enabled      := False;
  Pn_Principal.Visible := True;

  Ed_MVS_ST_LOTEFORNE.SetFocus;

end;

procedure TfrmEmpenhoMaterial.Cl_DrqBeforeDelete(DataSet: TDataSet);
begin
  Abort;
end;

procedure TfrmEmpenhoMaterial.Ed_CMAQ_IN_CODIGOChange(Sender: TObject);
begin
  Cl_Cmq.Close;
  Cl_Drq.Close;
  Cl_Dds.Close;
  Cl_Ord.Close;
  Cl_Ili.Close;
end;

procedure TfrmEmpenhoMaterial.Ed_CMAQ_IN_CODIGOExit(Sender: TObject);
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

procedure TfrmEmpenhoMaterial.Ed_CMAQ_IN_CODIGOKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN Then
  begin
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

procedure TfrmEmpenhoMaterial.Ed_MVS_RE_QUANTIDADEExit(Sender: TObject);
var
  rMVS_RE_QUANTIDADE : Extended;
begin

  if not(TryStrToFloat(Ed_MVS_RE_QUANTIDADE.Text,rMVS_RE_QUANTIDADE)) then
  begin
    rMVS_RE_QUANTIDADE := 0;
  end;

  if (Cl_Dds.Active = True)
     and
     (Cl_Dds.IsEmpty = False)
  then
  begin
    rMVS_RE_QUANTIDADE := RoundTo(rMVS_RE_QUANTIDADE,Cl_Dds.FieldByName('pun_in_decimaisqtde').AsInteger*-1);
  end;

  Ed_MVS_RE_QUANTIDADE.Text := FloatToStr(rMVS_RE_QUANTIDADE);

end;

procedure TfrmEmpenhoMaterial.Ed_MVS_RE_QUANTIDADEKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN Then
  begin
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

procedure TfrmEmpenhoMaterial.Ed_MVS_ST_LOTEFORNEChange(Sender: TObject);
begin
  Ed_MVS_RE_QUANTIDADE.Text := '0';
end;

procedure TfrmEmpenhoMaterial.Ed_MVS_ST_LOTEFORNEExit(Sender: TObject);
begin

  Ed_MVS_ST_LOTEFORNE.Text := Trim(Ed_MVS_ST_LOTEFORNE.Text);

  if (Ed_MVS_ST_LOTEFORNE.Text <> '') then
  begin

    DM.p_demandalote_lst(Cl_Dds,wFIL_IN_CODIGO,StrToInt(Ed_CMAQ_IN_CODIGO.Text),Ed_MVS_ST_LOTEFORNE.Text);

    if (Cl_Dds.IsEmpty = False) then
    begin
      Ed_MVS_RE_QUANTIDADE.Text := Cl_Dds.FieldByName('mvs_re_quantidade').AsString;
      if Ed_MVS_RE_QUANTIDADE.Enabled then
      begin
        Ed_MVS_RE_QUANTIDADE.SetFocus;
      end
      else
      begin
        Bo_Lote_Ins.SetFocus
      end;
    end;

  end;

end;

procedure TfrmEmpenhoMaterial.Ed_MVS_ST_LOTEFORNEKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN Then
  begin
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

end.
