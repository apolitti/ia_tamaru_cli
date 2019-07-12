program IA_CLIENTAPT;

uses
  Vcl.Forms,
  ufrmSetupMaquina in 'ufrmSetupMaquina.pas' {frmSetupMaquina},
  uDM in 'uDM.pas' {DM: TDataModule},
  ufrmAvisoRecebimento in 'ufrmAvisoRecebimento.pas' {frmAvisoRecebimento},
  ufrmMenu in 'ufrmMenu.pas' {frmMenu},
  ufrmEmpenhoMaterial in 'ufrmEmpenhoMaterial.pas' {frmEmpenhoMaterial},
  ufrmApontamentoProducao in 'ufrmApontamentoProducao.pas' {frmApontamentoProducao},
  ufrmEncerramentoProducao in 'ufrmEncerramentoProducao.pas' {frmEncerramentoProducao},
  ufrmConsumoMaterial in 'ufrmConsumoMaterial.pas' {frmConsumoMaterial},
  ufrmRecebimentoEtq in 'ufrmRecebimentoEtq.pas' {frmRecebimentoEtq},
  ufrmFollowup in 'ufrmFollowup.pas' {frmFollowup},
  ufrmOrdemOperadorApontamentos in 'ufrmOrdemOperadorApontamentos.pas' {frmOrdemOperadorApontamentos},
  ufrmOrdemApontamento in 'ufrmOrdemApontamento.pas' {frmOrdemApontamento},
  ufrmPrincipal in 'ufrmPrincipal.pas' {frmPrincipal};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
