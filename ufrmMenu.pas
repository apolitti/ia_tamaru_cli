unit ufrmMenu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, MidasLib;

type
  TfrmMenu = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button0: TButton;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button0Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMenu: TfrmMenu;

implementation

{$R *.dfm}

uses ufrmAvisoRecebimento, ufrmSetupMaquina, ufrmEmpenhoMaterial,
  ufrmApontamentoProducao, ufrmEncerramentoProducao, ufrmConsumoMaterial,
  ufrmRecebimentoEtq, uDM;

procedure TfrmMenu.Button1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmSetupMaquina, frmSetupMaquina);
  frmSetupMaquina.ShowModal;
end;

procedure TfrmMenu.Button2Click(Sender: TObject);
begin
  Application.CreateForm(TfrmAvisoRecebimento, frmAvisoRecebimento);
  frmAvisoRecebimento.ShowModal;
end;

procedure TfrmMenu.Button3Click(Sender: TObject);
begin
  Application.CreateForm(TfrmRecebimentoEtq, frmRecebimentoEtq);
  frmRecebimentoEtq.ShowModal;
end;

procedure TfrmMenu.Button4Click(Sender: TObject);
begin
  Application.CreateForm(TfrmEmpenhoMaterial, frmEmpenhoMaterial);
  frmEmpenhoMaterial.ShowModal;
end;

procedure TfrmMenu.Button5Click(Sender: TObject);
begin
  Application.CreateForm(TfrmApontamentoProducao, frmApontamentoProducao);
  frmApontamentoProducao.ShowModal;
end;

procedure TfrmMenu.Button6Click(Sender: TObject);
begin
  Application.CreateForm(TfrmConsumoMaterial, frmConsumoMaterial);
  frmConsumoMaterial.ShowModal;
end;

procedure TfrmMenu.Button7Click(Sender: TObject);
begin
  Application.CreateForm(TfrmEncerramentoProducao, frmEncerramentoProducao);
  frmEncerramentoProducao.ShowModal;
end;

procedure TfrmMenu.Button0Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmMenu.FormCreate(Sender: TObject);
begin

  Self.Caption := Self.Caption + ' - ' + DM.sVersao;

end;

procedure TfrmMenu.FormKeyPress(Sender: TObject; var Key: Char);
begin

  if (key in ['1']) and (Button1.Enabled) then
  begin
    Button1Click(Self);
    Key := #0;
    Exit;
  end;

  if (key in ['2']) and (Button1.Enabled) then
  begin
    Button2Click(Self);
    Key := #0;
    Exit;
  end;

  if (key in ['3']) and (Button1.Enabled) then
  begin
    Button3Click(Self);
    Key := #0;
    Exit;
  end;

  if (key = '4') and (Button4.Enabled) then
  begin
    Button4Click(Self);
    Key := #0;
    Exit;
  end;

  if (key = '5') and (Button4.Enabled) then
  begin
    Button5Click(Self);
    Key := #0;
    Exit;
  end;

  if (key = '6') and (Button4.Enabled) then
  begin
    Button6Click(Self);
    Key := #0;
    Exit;
  end;

  if (key = '7') and (Button4.Enabled) then
  begin
    Button7Click(Self);
    Key := #0;
    Exit;
  end;

  if (key = '0') and (Button0.Enabled) then
  begin
    Button0Click(Self);
    Key := #0;
    Exit;
  end;

end;

end.
