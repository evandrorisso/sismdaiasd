{******************************************************************************}
{ Projeto: SysM�dia                                                    }
{         O programa SysMidia foi desenvolvido com o objetivo de controlar os  }
{ momentos de louvores da Igreja Adventista do S�timo Dia.                     }
{       Nele existe a possibilidade de colocar os hinos da doxologia, momento   }
{ infantil, entradas de bandeiras, Provai e Vede, Informativo Mundial das      }
{ Miss�es, fundos musicais, lembretes, cron�metro, hin�rio completo e CDs      }
{ Jovens com busca por nome! Tudo isso de uma forma simples e organizada!      }
{      O programa � totalmente gratuito e pode ser ajustado de acordo com a necessidade.
{Entre em contato conosco para mais informa��es.                               }
{                                                                              }
{ Direitos Autorais Reservados (c) 2012   Aldemir Almeida                      }
{                                                                              }
{ Colaboradores nesse arquivo:                                                 }
{                                                                              }
{  Voc� pode obter a �ltima vers�o desse arquivo na pagina do  SysM�da    }
{ localizado em      https://github.com/aldemiralmeida/sismdaiasd.git      }
{                                                                              }
{  Esta biblioteca � software livre; voc� pode redistribu�-la e/ou modific�-la }
{ sob os termos da Licen�a P�blica Geral Menor do GNU conforme publicada pela  }
{ Free Software Foundation; tanto a vers�o 2.1 da Licen�a, ou (a seu crit�rio) }
{ qualquer vers�o posterior.                                                   }
{                                                                              }
{  Esta biblioteca � distribu�da na expectativa de que seja �til, por�m, SEM   }
{ NENHUMA GARANTIA; nem mesmo a garantia impl�cita de COMERCIABILIDADE OU      }
{ ADEQUA��O A UMA FINALIDADE ESPEC�FICA. Consulte a Licen�a P�blica Geral Menor}
{ do GNU para mais detalhes. (Arquivo LICEN�A.TXT ou LICENSE.TXT)              }
{                                                                              }
{  Voc� deve ter recebido uma c�pia da Licen�a P�blica Geral Menor do GNU junto}
{ com esta biblioteca; se n�o, escreva para a Free Software Foundation, Inc.,  }
{ no endere�o 59 Temple Street, Suite 330, Boston, MA 02111-1307 USA.          }
{ Voc� tamb�m pode obter uma copia da licen�a em:                              }
{ http://www.opensource.org/licenses/lgpl-license.php                          }
{                                                                              }
{ Aldemir Almeida  -  aldemir_racing@hotmail.com                                  }
{              Rua Murilo Mendes, 125 A- Manaus - AM - 69076-580               }
{                                                                              }
{******************************************************************************}

{******************************************************************************
|* Historico
|*
|* 30/07/2012: Aldemir Gomes de Almeida Filho
|*  - Cria��o e distribui��o da Primeira Versao
*******************************************************************************}
unit Splash;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Samples.Gauges,
  Vcl.StdCtrls, Vcl.Imaging.pngimage, Vcl.ComCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, cxProgressBar, dxSkinsForm, Data.DB,
  Data.Win.ADODB, Vcl.Imaging.jpeg, dxGDIPlusClasses, cxLabel;

type
  TFrmSplash = class(TForm)
    Label2: TLabel;
    Timer1: TTimer;
    Image32: TImage;
    ProgressBar1: TProgressBar;
    Label1: TLabel;
    lblTitulo: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

    vpub_conf_doxologia: String;
  end;

var
  FrmSplash: TFrmSplash;

implementation

{$R *.dfm}

uses _DM, _Principal;

procedure TFrmSplash.FormCreate(Sender: TObject);
var
  Q: TADOQuery;
begin

  Application.CreateForm(TDM, DM);
  try
    if FileExists(ExtractFilePath(Application.ExeName)+'\Dados\Dados.mdb') then // VERIFICA SE EXISTE O ARQUIVO DENTRO DA PASTA
      Dm.Conexao.Connected := False;
      Dm.Conexao.ConnectionString := 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=' +
      ExtractFilePath(Application.ExeName)+'Dados\Dados.mdb;Persist Security Info=False;';
      Dm.Conexao.Connected := True;    except
      ShowMessage('Erro ao conctar ao banco de dados!');
      Application.Terminate;
    end;
   {
   //========================
    q:= TADOQuery.Create(Application);
    q.Connection := dm.Conexao;

    try
    with q.SQL do begin

    Text:= 'select * from  t_conf_culto '+
    ' where 1=1';
    q.Open;

    //vpub_conf_doxologia := q.FieldByName('doxologia').text;
    {
    if (q.FieldByName('cod_igreja').isNull) then
    //begin
      Text:= 'Alter Table t_igreja ADD COLUMN '
      + 'cod_igreja Text(100)';
    //end;
    }
    //q.ExecSQL;
    //ShowMessage('campos criados com sucesso');
    //end;
  //finally
   //q.Free;
  //end;


  dm.qrIgreja.Active := True;
  dm.qrPlay.Active := True;

  if dm.qrIgrejanome.Value<>'' then
  begin
    lblTitulo.Caption  := dm.qrIgrejanome.Value;
    //lblTitulo.propri alignment:=taCenter;
  end else

  dm.qrIgreja.Active := False;

  //dm.t_conf_culto.Active := True;

end;

procedure TFrmSplash.FormShow(Sender: TObject);
begin
  //Logo da Igreja
  //if FileExists(dm.t_conf_cultolocal_logo.Text) then
    //Image32.Picture.LoadFromFile(dm.t_conf_cultolocal_logo.Text);

  //Deixa o fome transparente
  brush.Style := bsclear;

end;

end.
