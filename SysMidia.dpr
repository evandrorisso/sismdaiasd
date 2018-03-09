program SysMidia;
uses
  Vcl.Forms,
  SysUtils,
  _Principal in '_Principal.pas' {FrmPrincipal},
  sobre in 'sobre.pas' {FrmSobre},
  Splash in 'Splash.pas' {FrmSplash},
  Vcl.Themes,
  Vcl.Styles,
  Config in 'Config.pas' {FrmConfig},
  _Hinario in '_Hinario.pas' {FrmHinario},
  _Hino in '_Hino.pas' {FrmHino},
  _2010 in '_2010.pas' {Frm2010},
  funcoes in 'funcoes.pas',
  _Sonoplasta in '_Sonoplasta.pas' {FrmSonoplasta},
  _CadSonoplasta in '_CadSonoplasta.pas' {FrmCadSonoplasta},
  _Consulta in '_Consulta.pas' {Consulta},
  _CadIgreja in '_CadIgreja.pas' {FrmCadIgreja},
  _Igreja in '_Igreja.pas' {FrmIgreja},
  _Mensagem in '_Mensagem.pas' {FrmMensagem},
  _Item in '_Item.pas' {FrmItem},
  _Unid in '_Unid.pas' {FrmUnid},
  _CadUnid in '_CadUnid.pas' {FrmCadUnid},
  _SaidaEquip in '_SaidaEquip.pas' {FrmSaidaEquip},
  _CadSaidaEquip in '_CadSaidaEquip.pas' {FrmCadSaidaEquip},
  _PesquisaCD in '_PesquisaCD.pas' {FrmPesquisaCD},
  Unit1 in 'Unit1.pas' {Form1},
  _Musica in '_Musica.pas' {FrmMusica},
  _PVCD01 in '_PVCD01.pas' {FrmPVCD01},
  _Licencia in '_Licencia.pas' {FrmLicencia},
  UinNet in 'UinNet.pas',
  _RelEquipes in '_RelEquipes.pas' {FrmRelEquipes},
  _RelPadrao in '_RelPadrao.pas' {FrmRelPadrao: TQuickRep},
  _RelProduto in '_RelProduto.pas' {FrmRelProduto: TQuickRep},
  _DVDAdoradores in '_DVDAdoradores.pas' {FrmDVDAdoradores},
  _Email in '_Email.pas' {FrmEmail},
  _EmailPadrao in '_EmailPadrao.pas' {FrmEmailPadrao},
  _PV in '_PV.pas' {FrmPV},
  _DVDExtra in '_DVDExtra.pas' {FrmDVDExtra},
  _CadDVDExtra in '_CadDVDExtra.pas' {FrmCadDVDExtra},
  _PesquisaExtra in '_PesquisaExtra.pas' {FrmPesquisaExtra},
  _AjustaNome in '_AjustaNome.pas' {FrmAjustaNome},
  _DM in '_DM.pas' {DM: TDataModule},
  _Lista in '_Lista.pas' {FrmLista},
  _Visita in '_Visita.pas' {FrmVisita},
  _CadVsita in '_CadVsita.pas' {FrmCadVsita},
  _RelVisitas in '_RelVisitas.pas' {FrmRelVisitas: TQuickRep},
  _Evento in '_Evento.pas' {FrmEvento},
  _CadEvento in '_CadEvento.pas' {FrmCadEvento},
  _OpcRelVisita in '_OpcRelVisita.pas' {FrmOpcRelVisita},
  _RelVisitas2 in '_RelVisitas2.pas' {FrmRelVisitas2: TQuickRep},
  _BibliaSagrada in '_BibliaSagrada.pas' {FrmBibliaSagrada},
  _TipoDoxologia in '_TipoDoxologia.pas' {FrmTipoDoxologia},
  _CadItem in '_CadItem.pas' {FrmCadItem},
  _CadDVDExtraMusicas in '_CadDVDExtraMusicas.pas' {FrmCadDVDExtraMusicas},
  _CDJA in '_CDJA.pas' {FrmCDJA},
  _CadCDJA in '_CadCDJA.pas' {FrmCadCDJA},
  _CadCDJAMusicas in '_CadCDJAMusicas.pas' {FrmCadCDJAMusicas},
  _ApresentacaoBiblia in '_ApresentacaoBiblia.pas' {FrmApresentacaoBiblia},
  _Sorteio in '_Sorteio.pas' {FrmSorteio},
  _Dox in '_Dox.pas' {FrmDox},
  _CadDox in '_CadDox.pas' {FrmCadDox};

{$R *.res}
  var
  i: Integer;
begin

  Application.Initialize;
  //Cria a janela splash

  FrmSplash := TFrmSplash.Create(Application);

  //Licencia
  //Application.CreateForm(TFrmLicencia, FrmLicencia);
  //FrmLicencia.ShowModal;

  //FrmSplash := TFrmSplash.Create(Application);
  FrmSplash.Show; //Inicializa o Splash
  frmSplash.Refresh;

  begin
    frmSplash.ProgressBar1.Max:= 1000;
    //frmSplash.ProgressBar1.Max:= 1000000;
    frmSplash.ProgressBar1.Position:= 0;

    for i:= 0 to frmSplash.ProgressBar1.Max do
    begin
      frmSplash.ProgressBar1.StepBy(1);
      frmSplash.Label2.WordWrap:=true;
      frmSplash.Label2.Caption:= 'Carregando o informações do Sistema Aguarde...'+
      IntToStr(frmSplash.ProgressBar1.Position * 80 div frmSplash.ProgressBar1.Max);
      Application.ProcessMessages;
    end;
  end;

  frmSplash.Hide;
  frmSplash.Free;

  Application.Title := 'SysMídia';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.CreateForm(TConsulta, Consulta);
  Application.Run;
end.

