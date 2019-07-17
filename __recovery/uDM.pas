unit uDM;

interface

uses
  System.SysUtils, System.Classes,
  REST.Response.Adapter, System.JSON, Data.DB, Datasnap.DBClient,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, HTTPApp, IniFiles, Vcl.Forms, MidasLib,
  Windows, System.ImageList, Vcl.ImgList, Vcl.Controls;

type
  TDM = class(TDataModule)
    IdHTTP1: TIdHTTP;
    ilBotoes: TImageList;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
    function VersaoEXE2: string;
  public
    { Public declarations }
    sVersao : String;
    function  SoNumero(fField : String): String;
    procedure JsonToDataset(aDataset : TDataSet; aJSON : string);
    function  isInteger(valor: string): boolean;
    procedure p_maquina_lst(var pDataSet : TClientDataSet; p_fil_in_codigo, p_cmaq_in_codigo: Integer);
    procedure p_listamateriais_lst(var pDataSet :  TClientDataSet; p_fil_in_codigo, p_pro_in_codigo, p_cps_in_codigo, p_lis_in_revisao : Integer);
    procedure p_ordem_lst(var pDataSet : TClientDataSet; p_fil_in_codigo, p_ord_in_codigo: Integer);
    procedure p_apontamento_lst(var pDataSet : TClientDataSet; p_apo_in_sequencia : Integer);
    procedure p_demandamaquina_lst(var pDataSet : TClientDataSet; p_fil_in_codigo, p_cmaq_in_codigo: Integer);
    procedure p_demandalote_lst(var pDataSet: TClientDataSet; p_fil_in_codigo, p_cmaq_in_codigo : Integer; p_mvs_st_loteforne: string);
    procedure p_demandamaquina_ins(p_fil_in_codigo, p_cmaq_in_codigo : Integer; p_mvs_st_loteforne : string; p_mvs_re_quantidade : Real);
    procedure p_demandamaquina_del(p_mqd_in_sequencia : Integer; p_mvs_re_quantidade : Real);
    procedure p_apontarproducao_exe(p_fil_in_codigo : Integer; p_cmaq_in_codigo : Integer; p_ord_in_codigo : Integer; p_apo_re_quantidade : Real; var p_apo_in_sequencia : string);
    procedure p_etiqueta(pMaq, pOrd, pApo : TClientDataSet; pCopia : Integer; var pSL : TStringList);
    procedure p_etiqueta_recebimento_lst(p_lote, p_status, p_nota_fiscal, p_data, p_inspecao, p_barcode, p_copia: string; var p_str : TStringList);
    procedure p_etiqueta_processo_lst(p_barcode, p_lote, p_unidade, p_quantidade, p_data, p_hora, p_operador, p_item_codigo, p_item_descricao, p_copia: string; var p_str : TStringList);
    procedure p_etiqueta_produtoacabado_lst(p_etiq_in_id, p_item_descricao, p_inspecao, p_embalador, p_operador, p_data, p_lote, p_barcode, p_quantidade, p_tampa, p_cor, p_copia: string; var p_str : TStringList);
    procedure p_etiqueta_aluminio_lst(p_item_descricao, p_inspecao, p_data, p_lote, p_barcode, p_quantidade, p_tampa, p_cor, p_copia: string; var p_str : TStringList);
    procedure p_impressora_ma_lst(var pDataSet: TClientDataSet; p_fil_in_codigo, p_cmaq_in_codigo: integer);
    procedure p_produto_lst(var pDataSet: TClientDataSet; p_fil_in_codigo, p_pro_in_codigo: integer);
    procedure p_encerrarproducao_lst(var pDataSet: TClientDataSet; p_fil_in_codigo, p_cmaq_in_codigo: integer);
    procedure p_encerrarproducao_exe(p_fil_in_codigo, p_cmaq_in_codigo, p_ord_in_codigo, p_apo_re_qtdeproduzidakg : string; stringstream : TStringStream);
    procedure p_encerrarconsumo_lst(var pDataSet: TClientDataSet; p_fil_in_codigo, p_cmaq_in_codigo: integer);
    procedure p_encerrarconsumo_exe(p_fil_in_codigo, p_cmaq_in_codigo, p_ord_in_codigo, p_apo_re_qtdeproduzidakg, p_apo_re_qtdeconsumidakg, p_apo_re_qtdeempenhadakg, p_apo_re_qtdesaldokg : string; var p_apo_in_sequencia : string ; stringstream : TStringStream);

    function f_evento_lst(pParams : TStringStream) : TClientDataSet;

    function iif(Test: boolean; TrueR, FalseR: Variant): Variant;

  end;

var
  DM             : TDM;

  wURL           : string;
  wORG_IN_CODIGO : Integer;
  wFIL_IN_CODIGO : Integer;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

function TDM.SoNumero(fField : String): String;
var
  I : Byte;
begin
   Result := '';
   for I := 1 To Length(fField) do
       if fField [I] In ['0'..'9'] Then
            Result := Result + fField [I];
end;

function TDM.VersaoEXE2: string;
var
  VerInfoSize: DWORD;
  VerInfo: Pointer;
  VerValueSize: DWORD;
  VerValue: PVSFixedFileInfo;
  Dummy: DWORD;
begin
  VerInfoSize := GetFileVersionInfoSize(PChar(
    ParamStr(0)), Dummy);
  GetMem(VerInfo, VerInfoSize);
  GetFileVersionInfo(PChar(ParamStr(0)), 0,
    VerInfoSize, VerInfo);
  VerQueryValue(VerInfo, '\', Pointer(VerValue),
    VerValueSize);
  with VerValue^ do
  begin
    Result := IntToStr(dwFileVersionMS shr 16);
    Result := Result + '.' + IntToStr(
      dwFileVersionMS and $FFFF);
    Result := Result + '.' + IntToStr(
      dwFileVersionLS shr 16);
    Result := Result + '.' + IntToStr(
      dwFileVersionLS and $FFFF);
  end;
  FreeMem(VerInfo, VerInfoSize);
end;

//Validar inteiro
function TDM.isInteger(valor: string): boolean;
var Val: integer;
    Resultado: boolean;
begin
  Resultado := True;
  try
    Val := StrToInt(Valor);
  except
    on E: EConvertError do
      Resultado := False;
  end;
  Result := Resultado;
end;

procedure TDM.DataModuleCreate(Sender: TObject);
var
  sArqIni   : string;
  ServerIni : TIniFile;
begin

  sVersao := 'v' + VersaoEXE2;

  sArqIni                      := ChangeFileExt(Application.exename,'.INI');
  ServerIni                    := TIniFile.Create(sArqIni);

  //wURL           := 'http://localhost:12395/datasnap/rest/tdsaptserver/';
  //wORG_IN_CODIGO := 2;
  //wFIL_IN_CODIGO := 3;

  wURL           := ServerIni.ReadString('APT', 'URL', '');
  wORG_IN_CODIGO := ServerIni.ReadInteger('APT','ORG_IN_CODIGO',0);
  wFIL_IN_CODIGO := ServerIni.ReadInteger('APT','FIL_IN_CODIGO',0);

  IdHTTP1.Request.UserAgent           := 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV2';
  IdHTTP1.Request.BasicAuthentication := True;
  IdHTTP1.Request.Username            := 'MEGA';
  IdHTTP1.Request.Password            := 'MEG';

end;

procedure TDM.p_apontamento_lst(var pDataSet: TClientDataSet; p_apo_in_sequencia: Integer);
var
  str : string;
  js  : TJSONArray;
begin

  js  := TJSONArray.Create;
  Str := IdHTTP1.get(wURL + 'f_apontamento_lst'
                          + '/' + IntToStr(p_apo_in_sequencia));

  DM.JsonToDataset(pDataSet, Str);

end;

procedure TDM.p_apontarproducao_exe(p_fil_in_codigo, p_cmaq_in_codigo, p_ord_in_codigo: Integer; p_apo_re_quantidade : Real; var p_apo_in_sequencia : string);
var
  r : TStringStream;
  j : TJSONObject;
begin

  r := TStringStream.Create;

  IdHTTP1.Request.ContentType := 'application/json';

  IdHTTP1.Put(wURL + 'p_apontarproducao_exe/' +
                     IntToStr(p_fil_in_codigo) + '/' +
                     IntToStr(p_cmaq_in_codigo) + '/' +
                     IntToStr(p_ord_in_codigo) + '/' +
                     FloatToStr(p_apo_re_quantidade)
                     ,TStringStream.Create
                     ,r);

  try
    r.Position := 0;
    j := TJSONObject.ParseJSONValue(r.DataString) as TJSONObject;
    j.TryGetValue('apo_in_sequencia',p_apo_in_sequencia)
  except
  end;

end;

procedure TDM.p_demandalote_lst(var pDataSet: TClientDataSet; p_fil_in_codigo, p_cmaq_in_codigo : Integer; p_mvs_st_loteforne: string);
var
  str : string;
  js  : TJSONArray;
begin

  js  := TJSONArray.Create;
  Str := IdHTTP1.get(wURL + 'f_demandalote_lst/'
                          + IntToStr(p_fil_in_codigo) + '/'
                          + IntToStr(p_cmaq_in_codigo) + '/'
                          + HTTPEncode(p_mvs_st_loteforne));

  DM.JsonToDataset(pDataSet, Str);

end;

procedure TDM.p_demandamaquina_del(p_mqd_in_sequencia: Integer; p_mvs_re_quantidade: Real);
begin

  IdHTTP1.Put(wURL + 'p_demandamaquina_del/' +
                     IntToStr(p_mqd_in_sequencia) + '/' +
                     FloatToStr(p_mvs_re_quantidade)
                     ,TStringStream.Create);

end;

procedure TDM.p_demandamaquina_ins(p_fil_in_codigo, p_cmaq_in_codigo: Integer; p_mvs_st_loteforne: string; p_mvs_re_quantidade: Real);
var
  r : TStringStream;
begin

  r := TStringStream.Create('',TEncoding.UTF8);

  IdHTTP1.Put(wURL + 'p_demandamaquina_ins/' +
                      IntToStr(p_fil_in_codigo) + '/' +
                      IntToStr(p_cmaq_in_codigo) + '/' +
                      HTTPEncode(p_mvs_st_loteforne) + '/' +
                      FloatToStr(p_mvs_re_quantidade)
                      ,TStringStream.Create
                      ,r);
  r.Position := 0;
  if (Copy(r.DataString,1,5) = 'ERRO:') then
  begin
    raise Exception.Create(r.DataString);
  end;

end;

procedure TDM.p_demandamaquina_lst(var pDataSet: TClientDataSet;p_fil_in_codigo, p_cmaq_in_codigo: Integer);
var
  str : string;
  js  : TJSONArray;
begin

  js  := TJSONArray.Create;
  Str := IdHTTP1.get(wURL + 'f_demandamaquina_lst/' + IntToStr(p_fil_in_codigo) + '/' + IntToStr(p_cmaq_in_codigo));

  DM.JsonToDataset(pDataSet, Str);

end;

procedure TDM.p_listamateriais_lst(var pDataSet: TClientDataSet; p_fil_in_codigo, p_pro_in_codigo, p_cps_in_codigo, p_lis_in_revisao: Integer);
var
  str : string;
  js  : TJSONArray;
begin

  js  := TJSONArray.Create;
  Str := IdHTTP1.get(wURL + 'f_listamateriais_lst/' + IntToStr(p_fil_in_codigo) + '/' + IntToStr(p_pro_in_codigo) + '/' + IntToStr(p_cps_in_codigo) + '/' + IntToStr(p_lis_in_revisao));

  DM.JsonToDataset(pDataSet, Str);

end;

procedure TDM.p_maquina_lst(var pDataSet : TClientDataSet; p_fil_in_codigo, p_cmaq_in_codigo: Integer);
var
  str : string;
  js  : TJSONArray;
begin

  js  := TJSONArray.Create;
  Str := IdHTTP1.get(wURL + 'f_maquina_lst/' + IntToStr(p_fil_in_codigo) + '/' + IntToStr(p_cmaq_in_codigo));

  DM.JsonToDataset(pDataSet, Str);

end;

procedure TDM.p_ordem_lst(var pDataSet: TClientDataSet; p_fil_in_codigo, p_ord_in_codigo: Integer);
var
  str : string;
  js  : TJSONArray;
begin

  js  := TJSONArray.Create;
  Str := IdHTTP1.get(wURL + 'f_ordem_lst/' + IntToStr(p_fil_in_codigo) + '/' + IntToStr(p_ord_in_codigo));

  DM.JsonToDataset(pDataSet, Str);

end;

procedure TDM.JsonToDataset(aDataset : TDataSet; aJSON : string);
var
  JObj: TJSONArray;
  vConv : TCustomJSONDataSetAdapter;
begin
  if (aJSON = EmptyStr) then
  begin
    Exit;
  end;

  JObj := TJSONObject.ParseJSONValue(aJSON) as TJSONArray;
  vConv := TCustomJSONDataSetAdapter.Create(Nil);

  try
    vConv.Dataset := aDataset;
    vConv.UpdateDataSet(JObj);
  finally
    vConv.Free;
    JObj.Free;
  end;
end;

procedure TDM.p_etiqueta_recebimento_lst(p_lote, p_status, p_nota_fiscal, p_data, p_inspecao, p_barcode, p_copia: string; var p_str : TStringList);
var
  r : TStringStream;
  s : AnsiString;
begin

  r  := TStringStream.Create;

  IdHTTP1.get(wURL + 'f_etiqueta_recebimento_lst/' + HTTPEncode(p_lote) +
                                               '/' + p_status +
                                               '/' + p_nota_fiscal +
                                               '/' + HTTPEncode(p_data) +
                                               '/' + p_inspecao +
                                               '/' + HTTPEncode(p_barcode) +
                                               '/' + p_copia
                                               , r
                                               );

  r.Position := 0;
  p_str.LoadFromStream(r, TEncoding.UTF8);

end;


function TDM.f_evento_lst(pParams : TStringStream) : TClientDataSet;
var
  r2 : TStringStream;
  cds : TClientDataSet;

begin

  r2 := TStringStream.Create('',TEncoding.UTF8);

  IdHTTP1.Put(wURL + 'p_evento_lst', pParams, r2);
  cds := TClientDataSet.Create(Self);
  try
    r2.Position := 0;
    DM.JsonToDataset(cds, r2.DataString);
  except

  end;

  Result := cds;

end;

procedure TDM.p_etiqueta_processo_lst(p_barcode, p_lote, p_unidade, p_quantidade, p_data, p_hora, p_operador, p_item_codigo, p_item_descricao, p_copia: string; var p_str : TStringList);
var
  r : TStringStream;
  s : AnsiString;
begin

  r  := TStringStream.Create;

  IdHTTP1.get(wURL + 'f_etiqueta_processo_lst/' + HTTPEncode(p_barcode) +
                                            '/' + HTTPEncode(p_lote) +
                                            '/' + p_unidade +
                                            '/' + p_quantidade +
                                            '/' + HTTPEncode(p_data) +
                                            '/' + HTTPEncode(p_hora) +
                                            '/' + p_operador +
                                            '/' + p_item_codigo +
                                            '/' + p_item_descricao +
                                            '/' + p_copia
                                            , r
                                            );

  r.Position := 0;
  p_str.LoadFromStream(r, TEncoding.UTF8);

end;

procedure TDM.p_etiqueta_produtoacabado_lst(p_etiq_in_id, p_item_descricao, p_inspecao, p_embalador, p_operador, p_data, p_lote, p_barcode, p_quantidade, p_tampa, p_cor, p_copia: string; var p_str : TStringList);
var
  r  : TStringStream;
  s  : AnsiString;
begin

  r  := TStringStream.Create;

  IdHTTP1.get(wURL + 'f_etiqueta_produtoacabado_lst/' + p_etiq_in_id +
                                                         '/' + p_item_descricao +
                                                         '/' + p_inspecao +
                                                         '/' + p_embalador +
                                                         '/' + p_operador +
                                                         '/' + HTTPEncode(p_data) +
                                                         '/' + HTTPEncode(p_lote) +
                                                         '/' + p_barcode +
                                                         '/' + p_quantidade +
                                                         '/' + p_tampa +
                                                         '/' + p_cor +
                                                         '/' + p_copia
                                                         , r
                                                         );

  r.Position := 0;
  p_str.LoadFromStream(r, TEncoding.UTF8);

end;

procedure TDM.p_encerrarproducao_exe(p_fil_in_codigo, p_cmaq_in_codigo, p_ord_in_codigo, p_apo_re_qtdeproduzidakg : string; stringstream : TStringStream);
var
  r : TStringStream;
  j : TJSONObject;
begin

  r := TStringStream.Create;

  IdHTTP1.Request.ContentType := 'application/json';

  IdHTTP1.Put(wURL + 'p_encerrarproducao_exe/' +
                      p_fil_in_codigo + '/' +
                      p_cmaq_in_codigo + '/' +
                      p_ord_in_codigo + '/' +
                      p_apo_re_qtdeproduzidakg
                     , stringstream
                     , r);

  r.Position := 0;
  if (Copy(r.DataString,1,5) = 'ERRO:') then
  begin
    raise Exception.Create(r.DataString);
  end;

end;

procedure TDM.p_encerrarproducao_lst(var pDataSet: TClientDataSet;
  p_fil_in_codigo, p_cmaq_in_codigo: integer);
var
  str : string;
  js  : TJSONArray;
begin

  js  := TJSONArray.Create;
  Str := IdHTTP1.get(wURL + 'f_encerrarproducao_lst/' + IntToStr(p_fil_in_codigo) + '/' + IntToStr(p_cmaq_in_codigo));

  DM.JsonToDataset(pDataSet, Str);

end;

procedure TDM.p_etiqueta(pMaq, pOrd, pApo: TClientDataSet; pCopia: Integer; var pSL: TStringList);
begin

  //produto acabado
  if  pOrd.FieldByName('etiq_in_id').AsInteger in [3,4] then
  begin
    p_etiqueta_produtoacabado_lst( pOrd.FieldByName('etiq_in_id').AsString
                                 , pOrd.FieldByName('pro_st_descricaopdv').AsString
                                 , pMaq.FieldByName('opd_st_etiq_inspetor').AsString
                                 , pMaq.FieldByName('opd_st_etiq_embalador').AsString
                                 , pMaq.FieldByName('opd_st_etiq_operador').AsString
                                 , FormatDateTime('dd/MM/yyyy',date) + ' ' + FormatDateTime('hh:nn',time)
                                 , FormatFloat('00000000', pOrd.FieldByName('PRO_IN_CODIGO').AsInteger) + FormatFloat('0000000', pOrd.FieldByName('ORD_IN_CODIGO').AsInteger)
                                 , pOrd.FieldByName('pcb_st_codigobarra').AsString
                                 , pOrd.FieldByName('plf_re_quantidadeori').AsString
                                 , pOrd.FieldByName('pro_st_tampa').AsString
                                 , pOrd.FieldByName('pro_st_cor').AsString
                                 , IntToStr(pCopia)
                                 , pSL
                                 );
  end;

  //processo
  if  pOrd.FieldByName('etiq_in_id').AsInteger in [1] then
  begin
    p_etiqueta_processo_lst( pApo.FieldByName('mvl_st_loteforne').AsString
                           , pApo.FieldByName('mvl_st_loteforne').AsString
                           , pOrd.FieldByName('uni_st_unidade').AsString
                           , pApo.FieldByName('apo_re_quantidade').AsString
                           , FormatDateTime('dd/MM/yyyy',pApo.FieldByName('apo_dt_apontamento').AsDateTime)
                           , FormatDateTime('hh:nn',pApo.FieldByName('apo_dt_apontamento').AsDateTime)
                           , pMaq.FieldByName('opd_st_etiq_operador').AsString
                           , pOrd.FieldByName('pro_in_codigo').AsString
                           , pOrd.FieldByName('pro_st_descricaopdv').AsString
                           , IntToStr(pCopia)
                           , pSL
                           );
  end;

  //aluminio
  if  pOrd.FieldByName('etiq_in_id').AsInteger in [5] then
  begin
    p_etiqueta_aluminio_lst( pOrd.FieldByName('pro_st_descricaopdv').AsString
                           , pMaq.FieldByName('opd_st_etiq_inspetor').AsString
                           , FormatDateTime('dd/MM/yyyy',date) + ' ' + FormatDateTime('hh:nn',time)
                           , FormatFloat('00000000', pOrd.FieldByName('PRO_IN_CODIGO').AsInteger) + FormatFloat('0000000', pOrd.FieldByName('ORD_IN_CODIGO').AsInteger)
                           , pOrd.FieldByName('pcb_st_codigobarra').AsString
                           , pOrd.FieldByName('pro_re_qtde_padrao').AsString
                           , pOrd.FieldByName('pro_st_tampa').AsString
                           , pOrd.FieldByName('pro_st_cor').AsString
                           , IntToStr(pCopia)
                           , pSL
                           );
  end;

end;

procedure TDM.p_etiqueta_aluminio_lst(p_item_descricao, p_inspecao, p_data, p_lote, p_barcode, p_quantidade, p_tampa, p_cor, p_copia: string; var p_str : TStringList);
var
  r : TStringStream;
  s : AnsiString;
begin

  r  := TStringStream.Create;

  IdHTTP1.get(wURL + 'f_etiqueta_aluminio_lst/' + p_item_descricao +
                                            '/' + p_inspecao +
                                            '/' + HTTPEncode(p_data) +
                                            '/' + HTTPEncode(p_lote) +
                                            '/' + HTTPEncode(p_barcode) +
                                            '/' + p_quantidade +
                                            '/' + p_tampa +
                                            '/' + p_cor +
                                            '/' + p_copia
                                            , r
                                            );

  r.Position := 0;
  p_str.LoadFromStream(r, TEncoding.UTF8);

end;

procedure TDM.p_impressora_ma_lst(var pDataSet: TClientDataSet; p_fil_in_codigo, p_cmaq_in_codigo: integer);
var
  str : string;
begin

  Str := IdHTTP1.get(wURL + 'f_impressorama_lst/' + IntToStr(p_fil_in_codigo) +
                                              '/' + IntToStr(p_cmaq_in_codigo)
                                              );

  DM.JsonToDataset(pDataSet, Str);

end;

procedure TDM.p_produto_lst(var pDataSet: TClientDataSet; p_fil_in_codigo, p_pro_in_codigo: integer);
var
  str : string;
begin

  Str := IdHTTP1.get(wURL + 'f_produto_lst/' + IntToStr(p_fil_in_codigo) + '/' + IntToStr(p_pro_in_codigo));

  DM.JsonToDataset(pDataSet, Str);

end;


procedure TDM.p_encerrarconsumo_lst(var pDataSet: TClientDataSet;
  p_fil_in_codigo, p_cmaq_in_codigo: integer);
var
  str : string;
  js  : TJSONArray;
begin

  js  := TJSONArray.Create;
  Str := IdHTTP1.get(wURL + 'f_encerrarconsumo_lst/' + IntToStr(p_fil_in_codigo) + '/' + IntToStr(p_cmaq_in_codigo));

  DM.JsonToDataset(pDataSet, Str);

end;


procedure TDM.p_encerrarconsumo_exe( p_fil_in_codigo
                                   , p_cmaq_in_codigo
                                   , p_ord_in_codigo
                                   , p_apo_re_qtdeproduzidakg
                                   , p_apo_re_qtdeconsumidakg
                                   , p_apo_re_qtdeempenhadakg
                                   , p_apo_re_qtdesaldokg : string
                                   ; var p_apo_in_sequencia : string
                                   ; stringstream : TStringStream
                                   );
var
  r : TStringStream;
  j : TJSONObject;
begin

  r := TStringStream.Create;

  IdHTTP1.Request.ContentType := 'application/json';

  IdHTTP1.Put(wURL + 'p_encerrarconsumo_exe/' +
                      p_fil_in_codigo + '/' +
                      p_cmaq_in_codigo + '/' +
                      p_ord_in_codigo + '/' +
                      p_apo_re_qtdeproduzidakg + '/' +
                      p_apo_re_qtdeconsumidakg + '/' +
                      p_apo_re_qtdeempenhadakg + '/' +
                      p_apo_re_qtdesaldokg + '/' +
                      p_apo_in_sequencia + '/'
                     , stringstream
                     , r);

  r.Position := 0;
  j := TJSONObject.ParseJSONValue(r.DataString) as TJSONObject;
  j.TryGetValue('apo_in_sequencia',p_apo_in_sequencia);

end;

function TDM.iif(Test: boolean; TrueR, FalseR: Variant): Variant;
begin
    if Test then
        Result := TrueR
    else
        Result := FalseR;
end;


end.
