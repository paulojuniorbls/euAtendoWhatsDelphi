object Form9: TForm9
  Left = 0
  Top = 0
  Caption = 'Demo do euAtendo - API'
  ClientHeight = 837
  ClientWidth = 827
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Image1: TImage
    Left = 404
    Top = 280
    Width = 413
    Height = 490
    AutoSize = True
    Center = True
  end
  object Label1: TLabel
    Left = 24
    Top = 27
    Width = 33
    Height = 15
    Caption = 'Nome'
  end
  object Label2: TLabel
    Left = 24
    Top = 72
    Width = 32
    Height = 15
    Caption = 'Senha'
  end
  object Label3: TLabel
    Left = 26
    Top = 120
    Width = 32
    Height = 15
    Caption = 'Status'
  end
  object Label4: TLabel
    Left = 26
    Top = 171
    Width = 105
    Height = 15
    Caption = 'Numero do contato'
  end
  object Label5: TLabel
    Left = 26
    Top = 221
    Width = 103
    Height = 15
    Caption = 'Mensagem a enviar'
  end
  object Label6: TLabel
    Left = 236
    Top = 27
    Width = 55
    Height = 15
    Caption = 'Api Global'
  end
  object Label7: TLabel
    Left = 236
    Top = 75
    Width = 92
    Height = 15
    Caption = 'Url da plataforma'
  end
  object Label8: TLabel
    Left = 209
    Top = 221
    Width = 72
    Height = 15
    Caption = 'Id Mensagem'
  end
  object Label9: TLabel
    Left = 336
    Top = 171
    Width = 63
    Height = 15
    Caption = 'Id do Grupo'
  end
  object Label10: TLabel
    Left = 209
    Top = 171
    Width = 77
    Height = 15
    Caption = 'Nome contato'
  end
  object Button1: TButton
    Left = 263
    Top = 279
    Width = 135
    Height = 25
    Caption = 'CriarInstancia'
    TabOrder = 0
    OnClick = Button1Click
  end
  object edtNome: TEdit
    Left = 24
    Top = 48
    Width = 145
    Height = 23
    TabOrder = 1
    Text = 'testePJ'
    OnExit = edtNomeExit
  end
  object edtSenha: TEdit
    Left = 24
    Top = 93
    Width = 145
    Height = 23
    TabOrder = 2
    Text = '10zk38o8wme8cpins9xkyat'
    OnExit = edtSenhaExit
  end
  object edtStatus: TEdit
    Left = 24
    Top = 138
    Width = 145
    Height = 23
    TabOrder = 3
    Text = 'status'
  end
  object Memo1: TMemo
    Left = 24
    Top = 280
    Width = 233
    Height = 490
    TabOrder = 4
  end
  object Button2: TButton
    Left = 263
    Top = 310
    Width = 135
    Height = 25
    Caption = 'obtem qrCode'
    TabOrder = 5
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 263
    Top = 436
    Width = 135
    Height = 25
    Caption = 'enviar texto'
    TabOrder = 6
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 263
    Top = 342
    Width = 135
    Height = 25
    Caption = 'status da instancia'
    TabOrder = 7
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 263
    Top = 467
    Width = 135
    Height = 25
    Caption = 'enviar arquivo'
    TabOrder = 8
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 263
    Top = 373
    Width = 135
    Height = 25
    Caption = 'Carregar foto perfil'
    TabOrder = 9
    OnClick = Button6Click
  end
  object Button7: TButton
    Left = 263
    Top = 622
    Width = 135
    Height = 25
    Caption = 'Obter lista de grupos'
    TabOrder = 10
    OnClick = Button7Click
  end
  object edtNumeroContato: TEdit
    Left = 26
    Top = 192
    Width = 177
    Height = 23
    TabOrder = 11
    Text = '82385000'
  end
  object edtTextoMensagem: TEdit
    Left = 26
    Top = 237
    Width = 177
    Height = 23
    TabOrder = 12
    Text = 'apenas uma mensagem teste'
  end
  object Button8: TButton
    Left = 263
    Top = 560
    Width = 135
    Height = 25
    Caption = 'Listar instancias'
    TabOrder = 13
    OnClick = Button8Click
  end
  object edtApiGlobal: TEdit
    Left = 236
    Top = 45
    Width = 173
    Height = 23
    TabOrder = 14
    Text = 'B6D711FCDE4D4FD5936544120E713976PauloJunior'
    OnExit = edtApiGlobalExit
  end
  object edtUrl: TEdit
    Left = 236
    Top = 96
    Width = 173
    Height = 23
    TabOrder = 15
    Text = 'https://evo.apidevs.app'
    OnExit = edtUrlExit
  end
  object Button9: TButton
    Left = 263
    Top = 498
    Width = 135
    Height = 25
    Caption = 'Enviar Lista/Menu'
    TabOrder = 16
    OnClick = Button9Click
  end
  object edtIDMensagem: TEdit
    Left = 209
    Top = 237
    Width = 121
    Height = 23
    TabOrder = 17
  end
  object Button10: TButton
    Left = 263
    Top = 529
    Width = 135
    Height = 25
    Caption = 'Status da mensagem'
    TabOrder = 18
    OnClick = Button10Click
  end
  object Button11: TButton
    Left = 263
    Top = 777
    Width = 135
    Height = 25
    Caption = 'Excluir instancia'
    TabOrder = 19
    OnClick = Button11Click
  end
  object Button12: TButton
    Left = 263
    Top = 591
    Width = 135
    Height = 25
    Caption = 'Obter contatos'
    TabOrder = 20
    OnClick = Button12Click
  end
  object Button13: TButton
    Left = 263
    Top = 684
    Width = 135
    Height = 25
    Caption = 'Verifica se tem whats'
    TabOrder = 21
    OnClick = Button13Click
  end
  object Button14: TButton
    Left = 263
    Top = 653
    Width = 135
    Height = 25
    Caption = 'Listar participante grupo'
    TabOrder = 22
    OnClick = Button14Click
  end
  object edtIdGrupo: TEdit
    Left = 336
    Top = 192
    Width = 121
    Height = 23
    TabOrder = 23
    Text = 'edtIdGrupo'
  end
  object Button15: TButton
    Left = 263
    Top = 715
    Width = 135
    Height = 25
    Caption = 'Reiniciar instancia'
    TabOrder = 24
    OnClick = Button15Click
  end
  object Button16: TButton
    Left = 263
    Top = 746
    Width = 135
    Height = 25
    Caption = 'Desconectar instancia'
    TabOrder = 25
    OnClick = Button16Click
  end
  object Button17: TButton
    Left = 263
    Top = 404
    Width = 135
    Height = 25
    Caption = 'Dados do contato'
    TabOrder = 26
    OnClick = Button17Click
  end
  object edtNomeContato: TEdit
    Left = 209
    Top = 192
    Width = 121
    Height = 23
    ReadOnly = True
    TabOrder = 27
    Text = 'edtNomeContato'
  end
  object ApiEuAtendo1: TApiEuAtendo
    OnObterInstancias = ApiEuAtendo1ObterInstancias
    OnObterContatos = ApiEuAtendo1ObterContatos
    CodigoPais = '55'
    DDDPadrao = '99'
    OnObterGrupos = ApiEuAtendo1ObterGrupos
    OnObterFotoPerfil = ApiEuAtendo1ObterFotoPerfil
    ChaveApi = '10zk38o8wme8cpins9xkyat'
    NomeInstancia = 'testePJ'
    GlobalAPI = 'B6D711FCDE4D4FD5936544120E713976PauloJunior'
    EvolutionApiURL = 'https://evo.voceatende.com.br'
    OnStatusInstancia = ApiEuAtendo1StatusInstancia
    OnCriarInstancia = ApiEuAtendo1CriarInstancia
    OnObterQrCode = ApiEuAtendo1ObterQrCode
    Left = 560
    Top = 56
  end
  object FileOpenDialog1: TFileOpenDialog
    FavoriteLinks = <>
    FileTypes = <>
    Options = []
    Left = 752
    Top = 56
  end
end
