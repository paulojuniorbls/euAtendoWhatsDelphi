object Form9: TForm9
  Left = 0
  Top = 0
  Caption = 'Demo do euAtendo - API'
  ClientHeight = 654
  ClientWidth = 1106
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object Shape1: TShape
    Left = 662
    Top = 208
    Width = 311
    Height = 291
  end
  object Image1: TImage
    Left = 672
    Top = 222
    Width = 289
    Height = 265
    Center = True
    Stretch = True
  end
  object Label1: TLabel
    Left = 24
    Top = 16
    Width = 145
    Height = 45
    Caption = 'Nome da instancia (cliente) sem espa'#231'os e caracteres especiais'
    WordWrap = True
  end
  object Label2: TLabel
    Left = 193
    Top = 16
    Width = 203
    Height = 45
    Caption = 
      'Senha ou ChaveApi(deixa em branco que ele gera automatico, ou pr' +
      'eencha com a j'#225' gerada)'
    WordWrap = True
  end
  object Label4: TLabel
    Left = 457
    Top = 27
    Width = 148
    Height = 30
    Caption = 'Enviar mensagem para esse numero'
    WordWrap = True
  end
  object Label10: TLabel
    Left = 656
    Top = 27
    Width = 118
    Height = 30
    Caption = 'Nome contato obtido pelo numero'
    WordWrap = True
  end
  object Label14: TLabel
    Left = 736
    Top = 182
    Width = 135
    Height = 21
    Alignment = taCenter
    Caption = 'QrCode / Imagem'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    WordWrap = True
  end
  object edtNome: TEdit
    Left = 24
    Top = 65
    Width = 145
    Height = 23
    TabOrder = 0
    Text = 'integrar'
    OnExit = edtNomeExit
  end
  object edtSenha: TEdit
    Left = 193
    Top = 65
    Width = 248
    Height = 23
    PasswordChar = '*'
    TabOrder = 1
    Text = 'B1E77E3C8E6C-4C8A-A7BA-31F37FBEC33B'
    OnExit = edtSenhaExit
  end
  object edtNumeroContato: TEdit
    Left = 457
    Top = 65
    Width = 177
    Height = 23
    TabOrder = 2
    Text = '559982385000'
  end
  object Button13: TButton
    Left = 783
    Top = 64
    Width = 135
    Height = 25
    Caption = 'Verifica se tem whats'
    TabOrder = 3
    OnClick = Button13Click
  end
  object edtNomeContato: TEdit
    Left = 656
    Top = 65
    Width = 121
    Height = 23
    ReadOnly = True
    TabOrder = 4
  end
  object DBGrid1: TDBGrid
    Left = 24
    Top = 430
    Width = 612
    Height = 216
    DataSource = DataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
  end
  object PageControl1: TPageControl
    Left = 24
    Top = 102
    Width = 612
    Height = 307
    ActivePage = TabSheet7
    TabOrder = 6
    object TabSheet7: TTabSheet
      Caption = 'Configuracoes'
      ImageIndex = 6
      object Label6: TLabel
        Left = 258
        Top = 91
        Width = 55
        Height = 15
        Caption = 'Api Global'
      end
      object Label7: TLabel
        Left = 245
        Top = 141
        Width = 99
        Height = 15
        Caption = 'Url do seu Servidor'
      end
      object Label11: TLabel
        Left = 200
        Top = 22
        Width = 188
        Height = 63
        Alignment = taCenter
        Caption = 'Essas informa'#231#245'es n'#227'o muda, pode fixar no seu componente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        WordWrap = True
      end
      object Label13: TLabel
        Left = 160
        Top = 202
        Width = 71
        Height = 15
        Caption = 'Vers'#227'o da API'
      end
      object edtApiGlobal: TEdit
        Left = 160
        Top = 112
        Width = 249
        Height = 23
        PasswordChar = '*'
        TabOrder = 0
        Text = '9bb2b5203266a594dfbe41597c7ff0f24'
        OnExit = edtApiGlobalExit
      end
      object edtUrl: TEdit
        Left = 160
        Top = 162
        Width = 249
        Height = 23
        TabOrder = 1
        Text = 'https://euatendov1.apieuatendo.com.br'
        OnExit = edtUrlExit
      end
      object cbVersao: TComboBox
        Left = 245
        Top = 199
        Width = 81
        Height = 23
        ItemIndex = 0
        TabOrder = 2
        Text = 'V1'
        OnChange = cbVersaoChange
        Items.Strings = (
          'V1'
          'V2')
      end
      object Button25: TButton
        Left = 338
        Top = 198
        Width = 75
        Height = 25
        Caption = 'Obter vers'#227'o'
        TabOrder = 3
        OnClick = Button25Click
      end
    end
    object TabSheet1: TTabSheet
      Caption = 'Instancia'
      object Label3: TLabel
        Left = 311
        Top = 123
        Width = 141
        Height = 30
        Caption = 'Status da instancia (Closed,Open,Connecting)'
        WordWrap = True
      end
      object Label12: TLabel
        Left = 311
        Top = 191
        Width = 71
        Height = 15
        Caption = 'Qtd Contatos'
        WordWrap = True
      end
      object Button1: TButton
        Left = 7
        Top = 150
        Width = 282
        Height = 25
        Caption = 'CriarInstancia'
        TabOrder = 0
        OnClick = Button1Click
      end
      object Button11: TButton
        Left = 7
        Top = 119
        Width = 282
        Height = 25
        Caption = 'Excluir instancia'
        TabOrder = 1
        OnClick = Button11Click
      end
      object Button4: TButton
        Left = 7
        Top = 54
        Width = 282
        Height = 25
        Caption = 'status da instancia'
        TabOrder = 2
        OnClick = Button4Click
      end
      object Button8: TButton
        Left = 7
        Top = 23
        Width = 282
        Height = 25
        Caption = 'Listar instancias'
        TabOrder = 3
        OnClick = Button8Click
      end
      object Button15: TButton
        Left = 311
        Top = 23
        Width = 282
        Height = 25
        Caption = 'Reiniciar instancia'
        TabOrder = 4
        OnClick = Button15Click
      end
      object Button16: TButton
        Left = 311
        Top = 54
        Width = 282
        Height = 25
        Caption = 'Desconectar instancia'
        TabOrder = 5
        OnClick = Button16Click
      end
      object Button20: TButton
        Left = 311
        Top = 85
        Width = 282
        Height = 25
        Caption = 'Alterar configuracao da instancia'
        TabOrder = 6
        OnClick = Button20Click
      end
      object edtStatus: TEdit
        Left = 311
        Top = 159
        Width = 282
        Height = 23
        ReadOnly = True
        TabOrder = 7
        Text = 'status'
        OnChange = edtStatusChange
      end
      object edtQtdContatos: TEdit
        Left = 311
        Top = 208
        Width = 282
        Height = 23
        ReadOnly = True
        TabOrder = 8
        Text = 'status'
        OnChange = edtStatusChange
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Envio'
      ImageIndex = 1
      object Label8: TLabel
        Left = 315
        Top = 19
        Width = 161
        Height = 15
        Caption = 'Codigo da mensagem enviada'
      end
      object Label5: TLabel
        Left = 315
        Top = 83
        Width = 103
        Height = 15
        Caption = 'Mensagem a enviar'
      end
      object Button3: TButton
        Left = 17
        Top = 25
        Width = 282
        Height = 25
        Caption = 'enviar texto'
        TabOrder = 0
        OnClick = Button3Click
      end
      object Button5: TButton
        Left = 17
        Top = 56
        Width = 282
        Height = 25
        Caption = 'enviar arquivo'
        TabOrder = 1
        OnClick = Button5Click
      end
      object Button10: TButton
        Left = 17
        Top = 180
        Width = 282
        Height = 25
        Caption = 'Status da mensagem'
        TabOrder = 2
        OnClick = Button10Click
      end
      object Button18: TButton
        Left = 17
        Top = 118
        Width = 282
        Height = 25
        Caption = 'Enviar base64'
        TabOrder = 3
        OnClick = Button18Click
      end
      object btEnviaLista: TButton
        Left = 17
        Top = 87
        Width = 282
        Height = 25
        Caption = 'Enviar lista'
        TabOrder = 4
        OnClick = btEnviaListaClick
      end
      object Button23: TButton
        Left = 17
        Top = 149
        Width = 282
        Height = 25
        Caption = 'Envia os 3 botoes juntos'
        TabOrder = 5
        OnClick = Button23Click
      end
      object edtIDMensagem: TEdit
        Left = 315
        Top = 40
        Width = 278
        Height = 23
        TabOrder = 6
      end
      object memoMensagemEnviar: TMemo
        Left = 315
        Top = 104
        Width = 278
        Height = 105
        Lines.Strings = (
          'Esta '#233' uma mensagem de teste, se voce recebeu'#55358#56606
          #233' porque deu certo '#55357#56845'.'
          ''
          '*Pode usar negrito* e qualquer outro comando '
          'nativo '
          'do WhatsApp')
        TabOrder = 7
      end
      object Button24: TButton
        Left = 17
        Top = 211
        Width = 282
        Height = 25
        Caption = 'Enviar localiza'#231#227'o'
        TabOrder = 8
        OnClick = Button24Click
      end
      object Button26: TButton
        Left = 17
        Top = 242
        Width = 282
        Height = 25
        Caption = 'Enviar fluxo typebot'
        TabOrder = 9
        OnClick = Button26Click
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Dados'
      ImageIndex = 2
      object Button6: TButton
        Left = 141
        Top = 125
        Width = 282
        Height = 25
        Caption = 'Carregar foto perfil'
        TabOrder = 0
        OnClick = Button6Click
      end
      object Button12: TButton
        Left = 141
        Top = 94
        Width = 282
        Height = 25
        Caption = 'Obter contatos'
        TabOrder = 1
        OnClick = Button12Click
      end
      object Button17: TButton
        Left = 141
        Top = 63
        Width = 282
        Height = 25
        Caption = 'Dados do contato'
        TabOrder = 2
        OnClick = Button17Click
      end
      object Button2: TButton
        Left = 141
        Top = 156
        Width = 282
        Height = 25
        Caption = 'obtem qrCode'
        TabOrder = 3
        OnClick = Button2Click
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'Grupos'
      ImageIndex = 3
      object Label9: TLabel
        Left = 314
        Top = 19
        Width = 146
        Height = 30
        Caption = 'Buscar participantes de um grupo (coloque o ID aqui)'
        WordWrap = True
      end
      object Button7: TButton
        Left = 10
        Top = 23
        Width = 282
        Height = 25
        Caption = 'Obter lista de grupos'
        TabOrder = 0
        OnClick = Button7Click
      end
      object Button14: TButton
        Left = 10
        Top = 54
        Width = 282
        Height = 25
        Caption = 'Listar participante grupo'
        TabOrder = 1
        OnClick = Button14Click
      end
      object Button19: TButton
        Left = 10
        Top = 85
        Width = 282
        Height = 25
        Hint = 
          'Marcar todos os contatos de um grupo ao enviar a mensagem, conhe' +
          'cido como men'#231#227'o fantasma'
        Caption = 'Marcar contatos no grupo'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = Button19Click
      end
      object edtIdGrupo: TEdit
        Left = 314
        Top = 55
        Width = 271
        Height = 23
        TabOrder = 3
      end
    end
    object TabSheet5: TTabSheet
      Caption = 'Botoes'
      ImageIndex = 4
      object Label15: TLabel
        Left = 104
        Top = 171
        Width = 369
        Height = 32
        Caption = 'Deixou de funcionar novamente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -24
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btEnviaURL: TButton
        Left = 149
        Top = 78
        Width = 282
        Height = 25
        Caption = 'botao URL'
        TabOrder = 0
        OnClick = btEnviaURLClick
      end
      object Button9: TButton
        Left = 149
        Top = 140
        Width = 282
        Height = 25
        Caption = 'botao COPY'
        TabOrder = 1
        OnClick = Button9Click
      end
      object Button21: TButton
        Left = 149
        Top = 109
        Width = 282
        Height = 25
        Caption = 'botao ligue de volta'
        TabOrder = 2
        OnClick = Button21Click
      end
      object Button22: TButton
        Left = 149
        Top = 47
        Width = 282
        Height = 25
        Caption = 'botao Resposta'
        TabOrder = 3
        OnClick = Button22Click
      end
    end
    object TabSheet6: TTabSheet
      Caption = 'Ligacao Fake'
      ImageIndex = 5
      object Label16: TLabel
        Left = 112
        Top = 139
        Width = 369
        Height = 32
        Caption = 'Deixou de funcionar novamente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -24
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btFakeCall: TButton
        Left = 146
        Top = 88
        Width = 282
        Height = 25
        Hint = 
          'Aqui voce pode chamar aten'#231#227'o do seu cliente, um lembrete de ate' +
          'ndimento por exemplo, ap'#243's enviar a mensgaem voce faz uma chamad' +
          'a de 5 segundos para refor'#231'ar a visualiza'#231#227'o.'
        Caption = 'Fazer liga'#231#227'o '#39'Uma chamada fake por x segundos'#39
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = btFakeCallClick
      end
    end
  end
  object ApiEuAtendo1: TApiEuAtendo
    OnObterInstancias = ApiEuAtendo1ObterInstancias
    OnObterContatos = ApiEuAtendo1ObterContatos
    CodigoPais = '55'
    DDDPadrao = '99'
    OnObterGrupos = ApiEuAtendo1ObterGrupos
    OnObterFotoPerfil = ApiEuAtendo1ObterFotoPerfil
    GlobalAPI = 'ASD3F21APIDEVS6A5SPAULOJRDEVFA1'
    EvolutionApiURL = 'https://apiv1demo.apicomponente.com.br'
    OnStatusInstancia = ApiEuAtendo1StatusInstancia
    OnCriarInstancia = ApiEuAtendo1CriarInstancia
    OnObterQrCode = ApiEuAtendo1ObterQrCode
    Left = 1024
    Top = 16
  end
  object FileOpenDialog1: TFileOpenDialog
    FavoriteLinks = <>
    FileTypes = <>
    Options = []
    Left = 1024
    Top = 72
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 1024
    Top = 128
  end
  object DataSource1: TDataSource
    DataSet = ClientDataSet1
    Left = 1024
    Top = 184
  end
end
