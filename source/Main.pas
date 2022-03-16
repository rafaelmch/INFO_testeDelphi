unit Main;

{
Rafael Hassegawa - Teste prático
rafaelmch@gmail.com
(31)99886-6863
}

interface

uses
  ShellApi,
  IniFiles,
  WinSock,
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  System.Actions,
  Vcl.ActnList,
  System.ImageList,
  Vcl.ImgList,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Phys,
  FireDAC.Phys.FB,
  FireDAC.Phys.FBDef,
  FireDAC.VCLUI.Wait,
  Data.DB,
  FireDAC.Comp.Client, FireDAC.Phys.IB, FireDAC.Phys.IBDef, Vcl.Imaging.pngimage;

type
  TfrmMain = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    PanelWorkArea: TPanel;
    Label1: TLabel;
    btnCadCliente: TButton;
    ActionList1: TActionList;
    ImageList1: TImageList;
    ActionCadCliente: TAction;
    ActionCadVenda: TAction;
    ActionListarArquivos: TAction;
    panelInfo: TPanel;
    panelDev: TPanel;
    lblDataHora: TLabel;
    timerData: TTimer;
    Panel4: TPanel;
    imgTestePratico: TImage;
    lblUsuario: TLabel;
    Button1: TButton;
    procedure ActionCadClienteExecute(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure timerDataTimer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    FFormActive: TForm;
    procedure LoadForm(AClass: TFormClass);
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

uses
  CadCliente, uDados;

procedure TfrmMain.ActionCadClienteExecute(Sender: TObject);
begin
  Self.LoadForm(TfCadCliente);
end;

procedure TfrmMain.Button1Click(Sender: TObject);
begin
  //informações DEV - Rafael Hassegawa
  ShellExecute(Handle,'open',PCHAR('https://www.linkedin.com/in/rafael-hassegawa-5462a943/'), PChar(''), PChar(''), SW_SHOWNORMAL);
end;

procedure TfrmMain.FormActivate(Sender: TObject);
begin
  //exibir data e hora
  lblDataHora.Caption := TimeToStr(time);
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frmMain := nil;
  Action := caFree;
end;

procedure TfrmMain.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
     perform(WM_NEXTDLGCTL,0,0);
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
  //tela splash
  //frmSplash.ShowModal;
end;

procedure TfrmMain.LoadForm(AClass: TFormClass);
begin
  if Assigned(Self.FFormActive) then
  begin
    Self.FFormActive.Close;
    Self.FFormActive.Free;
    Self.FFormActive := nil;
  end;

  Self.FFormActive             := AClass.Create(nil);
  Self.FFormActive.Parent      := Self.PanelWorkArea;
  Self.FFormActive.BorderStyle := TFormBorderStyle.bsNone;

  Self.FFormActive.Top   := 0;
  Self.FFormActive.Left  := 0;
  Self.FFormActive.Align := TAlign.alClient;

  Self.FFormActive.Show;
end;

procedure TfrmMain.timerDataTimer(Sender: TObject);
begin
  //exibir dia + data e hora
  lblDataHora.Caption := UpperCase(FormatDateTime('dddd', Date)) + ', ' + FormatDateTime('dd', Date) +
    ' de ' + FormatDateTime('mmmm', Date) + ' de ' + FormatDateTime('yyyy', Date) + ' ' +
    TimeToStr(time);
end;

end.
