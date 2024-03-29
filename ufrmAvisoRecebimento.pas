unit ufrmAvisoRecebimento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, Datasnap.DBClient, IdHTTP, System.JSON, IdURI,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, HTTPApp, Vcl.Mask,
  Vcl.DBCtrls, Vcl.ComCtrls;

type
  TfrmAvisoRecebimento = class(TForm)
    Cl_Avr: TClientDataSet;
    Ds_Avr: TDataSource;
    Pn_Principal: TPanel;
    Pn_Principal1: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Ed_AGN_ST_FANTASIA: TDBEdit;
    Ed_AVR_DT_EMISSAONF: TDBEdit;
    Ed_AVR_DT_ENTRADANF: TDBEdit;
    Gd_Avr: TDBGrid;
    Pn_Topo: TPanel;
    Panel4: TPanel;
    Bo_Confirmar: TBitBtn;
    Bo_Fechar: TBitBtn;
    Pc_Filtro: TPageControl;
    Ts_Filtro: TTabSheet;
    Ts_Consulta: TTabSheet;
    Lb_CMAQ_IN_CODIGO: TLabel;
    Ed_AVR_ST_NOTA: TEdit;
    Label1: TLabel;
    Ed_AGN_ST_CGC: TEdit;
    Bo_Procurar: TBitBtn;
    Gd_AvrCns: TDBGrid;
    Pn_AvrCns: TPanel;
    Bo_AvrCns_Refresh: TBitBtn;
    Cl_AvrCns: TClientDataSet;
    Ds_AvrCns: TDataSource;
    procedure Bo_ProcurarClick(Sender: TObject);
    procedure Bo_ConfirmarClick(Sender: TObject);
    procedure Bo_FecharClick(Sender: TObject);
    procedure Ed_AVR_ST_NOTAKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Ed_AGN_ST_CGCKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure Cl_AvrBeforeDelete(DataSet: TDataSet);
    procedure Cl_AvrBeforeInsert(DataSet: TDataSet);
    procedure Bo_AvrCns_RefreshClick(Sender: TObject);
    procedure Gd_AvrCnsDblClick(Sender: TObject);
    procedure Cl_AvrCnsBeforeDelete(DataSet: TDataSet);
    procedure Cl_AvrCnsBeforeInsert(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
  private
    BloqueiaInsercao: boolean;
    procedure ConsultaAvisoRecebimento;
    procedure BuscaAvisoRecebimento(
                p_fil_in_codigo,
                p_avr_st_nota,
                p_agn_st_cgc: String
              );
    procedure SalvarAvisoRecebimento(
      stringStream : TStringStream
    );
  public
    { Public declarations }
  end;

var
  frmAvisoRecebimento: TfrmAvisoRecebimento;

implementation

{$R *.dfm}

uses uDM;

procedure TfrmAvisoRecebimento.Bo_FecharClick(Sender: TObject);
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

procedure TfrmAvisoRecebimento.Bo_ProcurarClick(Sender: TObject);
begin

  BloqueiaInsercao := False;
  BuscaAvisoRecebimento(IntToStr(wFIL_IN_CODIGO), Ed_AVR_ST_NOTA.Text, DM.SoNumero(Ed_AGN_ST_CGC.Text));
  BloqueiaInsercao := True;

  if Cl_Avr.IsEmpty then
  begin
    Exit;
  end;

  Pn_Topo.Enabled      := False;
  Pn_Principal.Visible := not(Pn_Topo.Enabled);

end;

procedure TfrmAvisoRecebimento.Bo_AvrCns_RefreshClick(Sender: TObject);
begin
  BloqueiaInsercao := False;
  ConsultaAvisoRecebimento;
  BloqueiaInsercao := True;
end;

procedure TfrmAvisoRecebimento.Bo_ConfirmarClick(Sender: TObject);
var
  stringStream : TStringStream;
begin

  if Application.MessageBox(pChar('Deseja realmente confirmar os registros?'), pChar(Application.Title), MB_ICONQUESTION + MB_YESNO) = IDNO Then
  begin
    Exit;
  end;

  Cl_Avr.Last;
  Cl_Avr.First;
  Cl_Avr.DisableControls;

  try

    stringStream := TStringStream.Create;
    stringStream.WriteString('[');

    while not Cl_Avr.Eof do
    begin

      stringStream.WriteString('  {');
      stringStream.WriteString('    "p_fil_in_codigo" : "' + IntToStr(3) + '",');
      stringStream.WriteString('	  "p_avr_in_codigo" : "' + IntToStr(Cl_Avr.FieldByName('avr_in_codigo').AsInteger) + '",');
      stringStream.WriteString('	  "p_iar_in_sequencia" : "' + IntToStr(Cl_Avr.FieldByName('iar_in_sequencia').AsInteger) + '",');
      stringStream.WriteString('	  "p_iar_re_qtdcontada" : "' + FloatToStr(Cl_Avr.FieldByName('iar_re_qtdcontada').AsFloat) + '"');
      stringStream.WriteString('	  "p_iar_in_lotes" : "' + FloatToStr(Cl_Avr.FieldByName('iar_in_lotes').AsFloat) + '"');
      stringStream.WriteString('  }');

      Cl_Avr.Next;

      if not Cl_Avr.Eof then
      begin
        stringStream.WriteString(',');
      end;

    end;

    stringStream.WriteString(']');

    try

      SalvarAvisoRecebimento(stringStream);

      Application.MessageBox(pChar('Registros confirmados com sucesso!'), pChar(Application.Title), MB_ICONINFORMATION + MB_OK);
    except
      on e: exception do
      begin
        Screen.Cursor := crDefault;
        raise Exception.Create(e.Message);
      end;
    end;

  finally
    Cl_Avr.First;
    Cl_Avr.EnableControls;
    Bo_ProcurarClick(Bo_Procurar);
  end;

  Bo_FecharClick(Bo_Fechar);

  BloqueiaInsercao := False;
  ConsultaAvisoRecebimento;
  BloqueiaInsercao := True;

end;

procedure TfrmAvisoRecebimento.BuscaAvisoRecebimento(
  p_fil_in_codigo,
  p_avr_st_nota,
  p_agn_st_cgc: String
);
var
  str : string;
  js  : TJSONArray;
  url : String;
  fornecedor : String;
begin

  fornecedor := HTTPEncode(p_agn_st_cgc);

  url := wURL + 'f_aviso_itens_lst/' + p_fil_in_codigo + '/' + p_avr_st_nota + '/' + fornecedor;

  Str := DM.IdHTTP1.get(url);

  DM.JsonToDataset(Cl_Avr, Str);

  if Cl_Avr.IsEmpty then
  begin
    Ed_AVR_ST_NOTA.SetFocus;
    Ed_AVR_ST_NOTA.SelectAll;
    raise Exception.Create('Nota Fiscal / Fornecedor n�o localizados!');
  end;

end;

procedure TfrmAvisoRecebimento.Cl_AvrBeforeDelete(DataSet: TDataSet);
begin
  Abort;
end;

procedure TfrmAvisoRecebimento.Cl_AvrBeforeInsert(DataSet: TDataSet);
begin
  if BloqueiaInsercao then Abort;
end;

procedure TfrmAvisoRecebimento.Cl_AvrCnsBeforeDelete(DataSet: TDataSet);
begin
  Abort;
end;

procedure TfrmAvisoRecebimento.Cl_AvrCnsBeforeInsert(DataSet: TDataSet);
begin
  if BloqueiaInsercao then Abort;
end;

procedure TfrmAvisoRecebimento.ConsultaAvisoRecebimento;
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
              + 'N';

  Str := DM.IdHTTP1.get(url);

  DM.JsonToDataset(Cl_AvrCns, Str);

end;

procedure TfrmAvisoRecebimento.Ed_AGN_ST_CGCKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

  if Key = VK_RETURN Then
  begin
    Perform(Wm_NextDlgCtl, 0, 0);
  end;

end;

procedure TfrmAvisoRecebimento.Ed_AVR_ST_NOTAKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

  if Key = VK_RETURN Then
  begin
    Perform(Wm_NextDlgCtl, 0, 0);
  end;

end;

procedure TfrmAvisoRecebimento.FormCreate(Sender: TObject);
begin

  Pc_Filtro.ActivePageIndex := 0;

  BloqueiaInsercao     := True;

  Pn_Topo.Enabled      := True;
  Pn_Principal.Visible := not(Pn_Topo.Enabled);

  //Ed_AVR_ST_NOTA.Text  := '19030801';
  //Ed_AGN_ST_CGC.Text   := '13.987.573/0005-26';

  BloqueiaInsercao := False;
  ConsultaAvisoRecebimento;
  BloqueiaInsercao := True;

end;

procedure TfrmAvisoRecebimento.FormShow(Sender: TObject);
begin
  Ed_AVR_ST_NOTA.SetFocus;
end;

procedure TfrmAvisoRecebimento.Gd_AvrCnsDblClick(Sender: TObject);
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

procedure TfrmAvisoRecebimento.SalvarAvisoRecebimento(
  stringStream : TStringStream
);
var
  str : string;
  js  : TJSONArray;
  url : String;
  fornecedor : String;
begin

  try

    Screen.Cursor := crSQLWait;

    url := wURL + 'p_aviso_itens_upd';

    try
      DM.IdHTTP1.Put(url, stringStream);
      //Result := True;
    except
      on e: exception do
      begin
        //Result        := False;
        Screen.Cursor := crDefault;
        raise Exception.Create(e.Message);
      end;
    end;

  finally

    Screen.Cursor := crDefault;

  end;


end;


end.
