unit CadCliente;

{
Rafael Hassegawa - Teste prático
rafaelmch@gmail.com
(31)99886-6863
}

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  Vcl.ExtCtrls,
  Data.DB,
  Vcl.StdCtrls,
  Vcl.Mask,
  Vcl.DBCtrls,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, REST.Types, REST.Response.Adapter, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope ;

type
  TfCadCliente = class(TForm)
    Panel1: TPanel;
    DBNavigator1: TDBNavigator;
    btnNovo: TButton;
    btnCancelar: TButton;
    btnSalvar: TButton;
    lblRegistros: TLabel;
    Panel3: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label12: TLabel;
    Label14: TLabel;
    GroupBox1: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label13: TLabel;
    btnLocCEP: TButton;
    btnEnviarEmail: TButton;
    edId: TEdit;
    edNome: TEdit;
    edIdentidade: TEdit;
    edCpf: TEdit;
    edTelefone: TEdit;
    edEmail: TEdit;
    edTipoLogradouro: TEdit;
    edLogradouro: TEdit;
    edNumero: TEdit;
    edComplemento: TEdit;
    edBairro: TEdit;
    edCidade: TEdit;
    edUF: TEdit;
    edCEP: TEdit;
    procedure btnNovoClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure qClientesEMAILValidate(Sender: TField);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnLocCEPClick(Sender: TObject);
    procedure btnEnviarEmailClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    //validar campos obrigatórios da tela
    function validarCamposObrigatorios() : boolean;
  public
    { Public declarations }
  end;

var
  fCadCliente: TfCadCliente;

implementation

{$R *.dfm}

uses
  Main,
  System.RegularExpressions,
  uDados,
  uEnviaEmail,
  login;

//Envio de e-mail utilizando o Gmail
procedure TfCadCliente.btnEnviarEmailClick(Sender: TObject);
begin
  if trim(edEmail.Text) = '' then
  begin
    ShowMessage('Atenção! Informe um e-mail válido!');
    edEmail.SetFocus;
    exit;
  end;

  Application.CreateForm(TfrmEnviaEmail,frmEnviaEmail);
  frmEnviaEmail.edPara.Text := edEmail.Text;

  frmEnviaEmail.memoCorpoEmail.Lines.Add('Prezados, seguem dados do cliente!');
  frmEnviaEmail.memoCorpoEmail.Lines.Add('Nome: ' + edNome.Text);
  frmEnviaEmail.memoCorpoEmail.Lines.Add('RG: ' + edIdentidade.Text);
  frmEnviaEmail.memoCorpoEmail.Lines.Add('CPF: ' + edCpf.Text);
  frmEnviaEmail.memoCorpoEmail.Lines.Add('Tel: ' + edTelefone.Text);
  frmEnviaEmail.memoCorpoEmail.Lines.Add('Email: ' + edEmail.Text);
  frmEnviaEmail.memoCorpoEmail.Lines.Add('CEP: ' + edCep.Text);
  frmEnviaEmail.memoCorpoEmail.Lines.Add('TP Logradouro: ' + edTipoLogradouro.Text);
  frmEnviaEmail.memoCorpoEmail.Lines.Add('Logradouro: ' + edLogradouro.Text);
  frmEnviaEmail.memoCorpoEmail.Lines.Add('Numero: ' + edNumero.Text);
  frmEnviaEmail.memoCorpoEmail.Lines.Add('Complemento ' + edComplemento.Text);
  frmEnviaEmail.memoCorpoEmail.Lines.Add('Bairro: ' + edBairro.Text);
  frmEnviaEmail.memoCorpoEmail.Lines.Add('Cidade: ' + edCidade.Text);
  frmEnviaEmail.memoCorpoEmail.Lines.Add('UF: ' + edUf.Text);

  frmEnviaEmail.memoCorpoEmail.Lines.SaveToFile('c:\temp\Cadastro.xml');

  frmEnviaEmail.ShowModal;
end;

//Localizar o CEP
procedure TfCadCliente.btnLocCEPClick(Sender: TObject);
var
  li_count : Integer;
  ls_CEP : String;
begin
  //buscar o CEP - utilizar https://viacep.com.br/ws/
  ls_CEP := StringReplace(edCEP.Text, '-', '', [rfReplaceAll]);

  frmDados.RESTRequest1.Resource := edCEP.Text + '/json';
  frmDados.RESTRequest1.Execute;

  if frmDados.RESTRequest1.Response.StatusCode = 200 then
  begin
    if frmDados.RESTRequest1.Response.Content.IndexOf('erro') > 0 then
    begin
      ShowMessage('Atenção! CEP não localizado!');
    end
    else
    begin
      with frmDados.CEPTable do
      begin
        edLogradouro.Text := FieldByName('logradouro').AsString;
        edBairro.Text := FieldByName('bairro').AsString;
        edCidade.Text := FieldByName('localidade').AsString;
        edUF.Text := FieldByName('uf').AsString;
        edCEP.Text := FieldByName('cep').AsString;
      end;
    end;
  end;

  //vou setar o foco no tipo de logradouro, pois o campo é obrigatório
  try
    edTipoLogradouro.SetFocus;
  except

  end;

end;

procedure TfCadCliente.btnNovoClick(Sender: TObject);
var
  ls_sql : String;
begin
  lblRegistros.Caption := '';

  try
    edNome.SetFocus;
  except

  end;
end;

procedure TfCadCliente.btnCancelarClick(Sender: TObject);
begin
 // qClientes.Cancel;
end;

procedure TfCadCliente.btnSalvarClick(Sender: TObject);
var
  ls_sql : String;
begin
  //se não validar campos obrigatórios, não tenta salvar
  if validarCamposObrigatorios() = false then
    Exit;

  ls_sql :=
    'INSERT INTO ClienteCad (Nome, ' +
    'Identidade, ' +
    'CPF, ' +
    'Telefone, ' +
    'Email, ' +
    'CEP, ' +
    'Logradouro, ' +
    'Numero, ' +
    'Complemento, ' +
    'Bairro, ' +
    'Cidade, ' +
    'Estado) ' +
    'Values ( ' + edNome.Text + ', ' +
    edIdentidade.Text + ', ' +
    edCpf.Text + ', ' +
    edTelefone.Text + ', ' +
    edEmail.Text + ', ' +
    edCEP.Text + ', ' +
    edLogradouro.Text + ', ' +
    edNumero.Text + ', ' +
    edComplemento.Text + ', ' +
    edBairro.Text + ', ' +
    edCidade.Text + ', ' +
    edUF.Text + ')';

  with FrmDados.qGeral do
  begin
    Close;
    Sql.Clear;
    Sql.Add(ls_sql);
    try
      Execute;
    except
      ShowMessage('Atenção! Erro ao inserir dados do cadastro!');
    end;
  end;

end;

//Validação do e-mail informado
procedure TfCadCliente.qClientesEMAILValidate(Sender: TField);
const
  EMAIL_REGEX = '^((?>[a-zA-Z\d!#$%&''*+\-/=?^_`{|}~]+\x20*|"((?=[\x01-\x7f])'
             +'[^"\\]|\\[\x01-\x7f])*"\x20*)*(?<angle><))?((?!\.)'
             +'(?>\.?[a-zA-Z\d!#$%&''*+\-/=?^_`{|}~]+)+|"((?=[\x01-\x7f])'
             +'[^"\\]|\\[\x01-\x7f])*")@(((?!-)[a-zA-Z\d\-]+(?<!-)\.)+[a-zA-Z]'
             +'{2,}|\[(((?(?<!\[)\.)(25[0-5]|2[0-4]\d|[01]?\d?\d))'
             +'{4}|[a-zA-Z\d\-]*[a-zA-Z\d]:((?=[\x01-\x7f])[^\\\[\]]|\\'
             +'[\x01-\x7f])+)\])(?(angle)>)$';
var
  rRegex: TRegex;
  bRet  : Boolean;
begin
  bRet := rRegex.IsMatch(Sender.AsString, EMAIL_REGEX);
  if not bRet then
    raise Exception.Create('E-mail inválido!');
end;

procedure TfCadCliente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frmDados.qGeral.Close;
  fCadCliente := nil;
  Action := caFree;
end;

procedure TfCadCliente.FormKeyPress(Sender: TObject; var Key: Char);
begin
  //pular campo com o ENTER
  if key = #13 then
  begin
    Key:= #0;
    Perform(Wm_NextDlgCtl,0,0);
  end;
end;

function TfCadCliente.validarCamposObrigatorios() : boolean;
var
  li_id : Integer;
  ld_dt_nascimento : TDate;
begin
  result := true;

  if trim(edNome.Text) = '' then
  begin
    ShowMessage('Atenção! Informe o nome do cliente!');
    edNome.SetFocus;
    result := false;
    exit;
  end;

  if trim(edTelefone.Text) = '' then
  begin
    ShowMessage('Atenção! Informe o telefone do cliente!');
    edTelefone.SetFocus;
    result := false;
    exit;
  end;

  if trim(edEmail.Text) = '' then
  begin
    ShowMessage('Atenção! Informe o email do cliente!');
    edEmail.SetFocus;
    result := false;
    exit;
  end;

  if trim(edTipoLogradouro.Text) = '' then
  begin
    ShowMessage('Atenção! Informe o tipo de logradouro do cliente!');
    edTipoLogradouro.SetFocus;
    result := false;
    exit;
  end;

  if trim(edLogradouro.Text) = '' then
  begin
    ShowMessage('Atenção! Informe o logradouro do cliente!');
    edLogradouro.SetFocus;
    result := false;
    exit;
  end;

  if trim(edNumero.Text) = '' then
  begin
    ShowMessage('Atenção! Informe o número do logradouro do cliente!');
    edNumero.SetFocus;
    result := false;
    exit;
  end;

  if trim(edBairro.Text) = '' then
  begin
    ShowMessage('Atenção! Informe o bairro do cliente!');
    edBairro.SetFocus;
    result := false;
    exit;
  end;

  if trim(edCidade.Text) = '' then
  begin
    ShowMessage('Atenção! Informe a cidade do cliente!');
    edCidade.SetFocus;
    result := false;
    exit;
  end;

  if trim(edUF.Text) = '' then
  begin
    ShowMessage('Atenção! Informe a UF do cliente!');
    edUF.SetFocus;
    result := false;
    exit;
  end;

  if trim(edCEP.Text) = '' then
  begin
    ShowMessage('Atenção! Informe o CEP do cliente!');
    edCEP.SetFocus;
    result := false;
    exit;
  end;

end;

end.

