object fCadCliente: TfCadCliente
  Left = 0
  Top = 0
  Caption = 'Cadastro de Clientes'
  ClientHeight = 458
  ClientWidth = 704
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 417
    Width = 704
    Height = 41
    Align = alBottom
    BevelInner = bvLowered
    Caption = 'Panel1'
    ShowCaption = False
    TabOrder = 0
    object lblRegistros: TLabel
      Left = 219
      Top = 14
      Width = 55
      Height = 13
      Caption = 'lblRegistros'
    end
    object DBNavigator1: TDBNavigator
      Left = 5
      Top = 6
      Width = 120
      Height = 25
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbDelete, nbEdit]
      TabOrder = 0
    end
    object btnNovo: TButton
      Left = 131
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Novo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btnNovoClick
    end
    object btnCancelar: TButton
      Left = 624
      Top = 9
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = btnCancelarClick
    end
    object btnSalvar: TButton
      Left = 546
      Top = 9
      Width = 75
      Height = 25
      Caption = 'Gravar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = btnSalvarClick
    end
    object btnEnviarEmail: TButton
      Left = 355
      Top = 9
      Width = 69
      Height = 25
      Caption = 'Enviar @'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      OnClick = btnEnviarEmailClick
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 704
    Height = 417
    Align = alClient
    TabOrder = 1
    object Label1: TLabel
      Left = 9
      Top = 56
      Width = 31
      Height = 13
      Caption = 'NOME'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 9
      Top = 104
      Width = 68
      Height = 13
      Caption = 'IDENTIDADE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 334
      Top = 104
      Width = 52
      Height = 13
      Caption = 'TELEFONE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 490
      Top = 104
      Width = 35
      Height = 13
      Caption = 'EMAIL'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label12: TLabel
      Left = 9
      Top = 13
      Width = 60
      Height = 13
      Caption = 'ID CLIENTE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label14: TLabel
      Left = 151
      Top = 104
      Width = 20
      Height = 13
      Caption = 'CPF'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object GroupBox1: TGroupBox
      Left = 9
      Top = 173
      Width = 584
      Height = 206
      Caption = 'Endere'#231'o'
      TabOrder = 0
      object Label5: TLabel
        Left = 210
        Top = 19
        Width = 108
        Height = 13
        Caption = 'TIPO LOGRADOURO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label6: TLabel
        Left = 16
        Top = 62
        Width = 78
        Height = 13
        Caption = 'LOGRADOURO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label7: TLabel
        Left = 437
        Top = 62
        Width = 47
        Height = 13
        Caption = 'N'#218'MERO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label8: TLabel
        Left = 16
        Top = 102
        Width = 82
        Height = 13
        Caption = 'COMPLEMENTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label9: TLabel
        Left = 226
        Top = 144
        Width = 42
        Height = 13
        Caption = 'CIDADE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label10: TLabel
        Left = 380
        Top = 144
        Width = 14
        Height = 13
        Caption = 'UF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label11: TLabel
        Left = 16
        Top = 19
        Width = 20
        Height = 13
        Caption = 'CEP'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label13: TLabel
        Left = 16
        Top = 144
        Width = 44
        Height = 13
        Caption = 'BAIRRO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btnLocCEP: TButton
        Left = 137
        Top = 33
        Width = 22
        Height = 25
        TabOrder = 1
        OnClick = btnLocCEPClick
      end
      object edTipoLogradouro: TEdit
        Left = 210
        Top = 35
        Width = 121
        Height = 21
        TabOrder = 2
      end
      object edLogradouro: TEdit
        Left = 16
        Top = 78
        Width = 399
        Height = 21
        TabOrder = 3
      end
      object edNumero: TEdit
        Left = 437
        Top = 78
        Width = 121
        Height = 21
        TabOrder = 4
      end
      object edComplemento: TEdit
        Left = 16
        Top = 121
        Width = 265
        Height = 21
        TabOrder = 5
      end
      object edBairro: TEdit
        Left = 16
        Top = 160
        Width = 181
        Height = 21
        TabOrder = 6
      end
      object edCidade: TEdit
        Left = 226
        Top = 160
        Width = 147
        Height = 21
        TabOrder = 7
      end
      object edUF: TEdit
        Left = 380
        Top = 160
        Width = 42
        Height = 21
        TabOrder = 8
      end
      object edCEP: TEdit
        Left = 16
        Top = 35
        Width = 108
        Height = 21
        TabOrder = 0
      end
    end
    object edId: TEdit
      Left = 9
      Top = 29
      Width = 53
      Height = 21
      TabOrder = 1
    end
    object edNome: TEdit
      Left = 9
      Top = 75
      Width = 612
      Height = 21
      TabOrder = 2
    end
    object edIdentidade: TEdit
      Left = 9
      Top = 123
      Width = 121
      Height = 21
      TabOrder = 3
    end
    object edCpf: TEdit
      Left = 151
      Top = 123
      Width = 121
      Height = 21
      TabOrder = 4
    end
    object edTelefone: TEdit
      Left = 334
      Top = 123
      Width = 121
      Height = 21
      TabOrder = 5
    end
    object edEmail: TEdit
      Left = 490
      Top = 123
      Width = 175
      Height = 21
      TabOrder = 6
    end
  end
end
