object Form9: TForm9
  Left = 0
  Top = 0
  Caption = 'Demo do euAtendo - API'
  ClientHeight = 914
  ClientWidth = 974
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object Image1: TImage
    Left = 551
    Top = 280
    Width = 413
    Height = 490
    AutoSize = True
    Center = True
  end
  object Label1: TLabel
    Left = 24
    Top = 8
    Width = 145
    Height = 45
    Caption = 'Nome da instancia (cliente) sem espa'#231'os e caracteres especiais'
    WordWrap = True
  end
  object Label2: TLabel
    Left = 209
    Top = 8
    Width = 203
    Height = 45
    Caption = 
      'Senha ou ChaveApi(deixa em branco que ele gera automatico, ou pr' +
      'eencha com a j'#225' gerada)'
    WordWrap = True
  end
  object Label3: TLabel
    Left = 466
    Top = 8
    Width = 141
    Height = 30
    Caption = 'Status da instancia (Closed,Open,Connecting)'
    WordWrap = True
  end
  object Label4: TLabel
    Left = 26
    Top = 83
    Width = 148
    Height = 30
    Caption = 'Enviar mensagem para esse numero'
    WordWrap = True
  end
  object Label5: TLabel
    Left = 26
    Top = 147
    Width = 103
    Height = 15
    Caption = 'Mensagem a enviar'
  end
  object Label8: TLabel
    Left = 333
    Top = 208
    Width = 161
    Height = 15
    Caption = 'Codigo da mensagem enviada'
  end
  object Label9: TLabel
    Left = 333
    Top = 142
    Width = 146
    Height = 30
    Caption = 'Buscar participantes de um grupo (coloque o ID aqui)'
    WordWrap = True
  end
  object Label10: TLabel
    Left = 209
    Top = 83
    Width = 118
    Height = 30
    Caption = 'Nome contato obtido pelo numero'
    WordWrap = True
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
    Top = 57
    Width = 145
    Height = 23
    TabOrder = 1
    Text = 'Teste'
    OnExit = edtNomeExit
  end
  object edtSenha: TEdit
    Left = 209
    Top = 57
    Width = 145
    Height = 23
    TabOrder = 2
    Text = '1234569'
    OnExit = edtSenhaExit
  end
  object edtStatus: TEdit
    Left = 464
    Top = 57
    Width = 145
    Height = 23
    ReadOnly = True
    TabOrder = 3
    Text = 'status'
    OnChange = edtStatusChange
  end
  object Memo1: TMemo
    Left = 24
    Top = 280
    Width = 233
    Height = 490
    Lines.Strings = (
      'iVBORw0KGgoAAAANSUhEUgAAAooAAA'
      'D/CAYAAAB2BPfXAAAAAXNSR0IArs4c6Q'
      'A'
      'AAARnQU1BAACxjwv8YQUAAAAJcEhZc'
      'w'
      'AADsQAAA7EAZUrDhsAADbzSURBVHhe7'
      'd'
      '0JnM3V/z/wI'
      '+vY931nRHYismUnhWRShL6EhAqRKGWL'
      '/I'
      'RCRSQKjVLZSRlFkojKln1fk7GO/f7v'
      '+9N7/o1x7sxnOZ/l3vt6Ph7n4X0+Zj6fmTt'
      '3'
      '5r7v'
      '+ZzzPil8fgIAAAAAIJF7+F8AAAAAgDsgUQ'
      'QAAAAAKSSKAAAAACCFRBEAAAAApJA'
      'o'
      'AgAAAIAUEkUAAAAAkEKiCAAAAABSSB'
      'Q'
      'BAAAAQAqJIgAAAABIIVEEAAAAACkkigA'
      'A'
      'AAAghUQRAAAAAKSQKAIAAACAFBJFAA'
      'AAAJBCoggAAAAAUkgUAQAAAEAKiSIA'
      'A'
      'AAASCFRBAAAAAApJIoAAAAAIIVEEQAA'
      'A'
      'ACkkCgCAAAAgBQSRQAAAACQQqIIAA'
      'A'
      'AAFJIFAEAAABACokiAAAAAEghUQQAAA'
      'AAKSSKAAAAACCFRBEAAAAApJAoAgAA'
      'AIAUEkUAAAAAkEKiCAAAAABSSBQBAA'
      'A'
      'AQAqJIgAAAABIIVEEAAAAACkkigAAAAA'
      'g'
      'hUQRAAAAAKSQKAIAAACAFBJFAAAAAJ'
      'B'
      'CoggAAAAAUkgUAQAAAEAqhc'
      '+PYwAAAICAtmzZIjZt2iT+'
      '+OMPsWvXLrFv3z5x5MgRcfPmTf6IpOXLl'
      '0'
      '8UL15clC5dWpQtW1ZUqVJF1KpVS6RKlYo'
      '/'
      'ArwGiSIAAADc5fTp02LBggVi'
      '+fLlYuXKleL69ev8P/aoUaOGaNasmWjZsq'
      'WoXLkyHwW3IVEEAAAADSWEH3/8sZg/f'
      'z'
      '4fcQ'
      '+NNP7vf/8TXbt25SPgBiSKAAAAYSwmJka'
      'MHTtWrFixgo94z3333ScGDBggnnnmGT4'
      'C'
      'TkGiCAAAEGZu3bqlJV4TJkzgI8GjTZs24p13'
      '3'
      'hFFixblI2AnJIoAAABhYu/evaJLly5i7dq1fC'
      'R'
      '4FS5cWMyYMUM0atSIj4AdkCgCAACEuO'
      '3'
      'bt2sjcbt37+YjoSN9+vTiiy+'
      '+EA8//DAfAZWQKAIAAISoM2fOiIYNG4o/'
      '/'
      '/yTj4SurFmziu'
      '+//14ruQPqoOA2AABACIqKihK5c'
      '+cOiySRxMbGiqpVq4pq1aqJ27dv81GwCi'
      'O'
      'KAAAAIWTOnDni6aef5p49smXLptU6LFO'
      'm'
      'jFZAu1ChQlpSSqN6ERERIl26dOLatWviyp'
      'Ur'
      'WgJHNRmPHTumFejeuXOnVrCbRjvtNGz'
      'Y'
      'MDF06FDugVlIFAEAAEJEqVKlxJ49e7inTtu2'
      'b'
      'bVi2LRwpEiRInzUOkoeV69eLZYtWya+'
      '+uor5UW9af7i0aNHtcQWzEGiCAAAEOQ'
      'W'
      'LlwoWrduzT3rSpYsKZ5//nmt4DWNEjrl6t'
      'Wr'
      'YubMmWLatGli69atfNQ6KqfTr18/7oERSB'
      'Q'
      'BAACCWKtWrcSiRYu4Zx7dLqbbtQMHDu'
      'Qj7psyZYp48803xd9//81HzKNb5b/99hv3'
      'Q'
      'C8kigAAAEEqQ4YM2jxAK2irvEmTJnl6f'
      '+UDBw6I3r17a7eorbpw4YLIlCkT9yA5WPU'
      'MAAAQZKhwdooUKSwliS1bthQXL14U69a'
      't'
      '83SSSIoVKyaWLl0qaGyrc'
      '+fOfNSczJkzi40bN3IPkoNEEQAAIIgsX75c'
      'R'
      'EZGcs'
      '+4mjVrikuXLmnzGjNmzMhHg8cnn3yiJYy'
      'U'
      '6Jr1wAMPiNmzZ3MPkoJEEQAAIEhMnTrV'
      '9'
      'A4kqVOn1srSrF'
      '+/XrtlHewo0T1x4oTImzcvHzGGRiZHjRrFP'
      'QgEcxQBAACCwPjx40X//v25ZwwtCHnjjT'
      'e'
      '4p8aWLVu029a0QGTXrl3aPEKqjZi42DXd6i'
      '1'
      'YsKC49957RYUKFbQRzcaNG4t77lE3VvXRR'
      'x'
      '+J7t27c8+YV155RYwZM4Z7kBgSRQAAAI'
      '+j8i4vv/wy9/SjlcwnT54UWbJk4SPm/fXXX'
      '2'
      'L69OkiOjpaHDlyhI'
      '+aR3Msn3zySa0EDyWOKlCNx8OHD3NPv'
      '9'
      'dee02MGDGCe5AQbj0DAAB4GNUUNJMk'
      't'
      'mvXTsTFxVlKEqmuIY1iUlJXunRpMW7cOC'
      'V'
      'JIqFxqnnz5okmTZpo56evl3ZuseLQoUOm'
      'd'
      'mMZOXKktvIb7oYRRQAAAI'
      '+ihStm5iTSqN8TTzzBPePoVjLN4XNjdXD'
      '+/PnFZ599JurXr89HjKO5mBUrVuSefrSy2u'
      'w'
      'c0FCFRBEAAMCD9u/fL0qUKME9/WhUrX'
      'D'
      'hwtwzhm5TN2jQQNuP2W05cuQQa9asEe'
      'X'
      'KleMjxqVKlUrcunWLe/rQXMuiRYtyD5Ao'
      'A'
      'gAAeBDdjjWKFpKY+TwSFRUlvvzyS'
      '+55B40s0n7QZlHSR8mzEUiN/oM5igAAA'
      'B'
      '5jdOeQlClTasmNmSRx7dq12ud5MUkkMT'
      'E'
      'x2te3YsUKPmLMwYMHRdWqVbmnD41m'
      'wr'
      '+QKAIAAHjIY489phXE1otur968eZN7xnTq'
      '1'
      'EnUrVuXe97WvHlz8dRTT3HPmE2bNonat'
      'W'
      'tzL3n//POPthobcOsZAADAMxYtWiRatWr'
      'F'
      'PX3MvoxToepTp05xL3jQ102Fts24//77xeb'
      'N'
      'm7mXPKoTSXthhzMkigAAAB5h9NaxmZd'
      'wGn2kXVqCndn0xeicxXBPk3DrGQAAwA'
      'O'
      'oTqERx48f50i/2NjYkEgSidlFOzRnkeZ06m'
      'Wl'
      'TE8oQKIIAADgsjlz5mg7n'
      '+hFt6jz5cvHPX1u3LghsmXLxr3QYDZZND'
      'K'
      'nk0r00C3ocIVbzwAAAC4zkvB07dpV20rPK'
      'L'
      'NJldfRCvELFy5wTz'
      '+jRbnDNV3CiCIAAICLqH6hXtmzZzeVJOb'
      'K'
      'lYuj0HPx4kVTt4crVKig7fGs1+DBgzkKLxhR'
      'B'
      'AAAcMnp06dFnjx5uJc8umVqZH4d6dixo7'
      'Y'
      'lXqibOnWq6N69O/f0K1iwoDh27Bj3khaO'
      'K'
      'RNGFAEAAFxSr149jpL34YcfGk4Sf/zxx7BIE'
      'k'
      'mPHj1EXFwc9/QzsgL6ySef5Ch8YEQRAAD'
      'ABVu2bBFVqlThXtIKFCggjh49yj39QnVeYi'
      'D'
      '58+fXPTqY0DvvvCNefvll7iXt2rVrIk2aNNw'
      'Lf'
      'RhRBAAAcAHtwKLXtm3bONLP7C4mwYx'
      'K'
      'BtEKcqP69+8v0qVLx72k0a38cIIRRQAAAId'
      't'
      '375dlCtXjntJ69y5s/jkk0+4p8/Zs2dFzpw5u'
      'R'
      'd'
      '+zKQ2RkZ4wyl1wogiAACAw4zsI2w0SSSN'
      'G'
      'zfmKDyNHj2aI/0qV66srYTWY'
      '+DAgRyFPowoAgAAWEA7fdCeyRkyZBC3'
      'b'
      '98WmTNn1o7TDigRERHasYwZM4p77rlH'
      'm'
      '9tG5VziPyY5gwYNMpz0HDlyRBQuXJh74c'
      't'
      'MemPksWvfvr32M6afb/r06UWqVKm0Oa'
      'F'
      'U1zHhMfo6aH/qli1bBmWZIiSKAAAABv3'
      '+'
      '+'
      '+9i6NCh2g4pdjLzEt2sWTOxcuVK7oWvad'
      'O'
      'miW7dunFPv/vvv19s3ryZe2rRqnWq3fjm'
      'm'
      '2/yEe9DoggAAKDT3r17RZ06dcTJkyf5iH16'
      '9'
      'eolJk+ezD39wm2lcyA0anv'
      '+/Hnu6bdjxw5RtmxZ7tnnxRdfFBMnTuSe'
      'd'
      'yFRBAAA0IHq9NEolVNu3bql3a42Yty4cW'
      'L'
      'AgAHcA5oWUKRIEe7pR0XQqRi6E3bv3i0iI'
      'y'
      'O55z1YzAIAAJAMeiF3Mkl88MEHDSeJhOo'
      'Bwn8ocTZjwoQJHNmvVKlS4qOPPuKe92B'
      'E'
      'EQAAIAklS5YU+/bt454zvv/'
      '+e9GgQQPu6UMLKIzu3BLq6DY8PS5mOH'
      '0'
      'Ln5JaqufoNRhRBAAACKBLly6OJ4nEaJJIZs'
      '2'
      'axRHEo7Gwf/75h3vG0KpmJ9HOMAsWLO'
      'CedyBRBAAAkKBFDTNnzuSeczp16sSRMQ'
      's'
      'XLuQIEoqOjubIGDfmerZt29bUAhw74dYz'
      'A'
      'ACARLZs2URsbCz3nLNx40ZRrVo17ulHNR'
      'u'
      'vXr3KPYj36KOPmi5j5MYK8ixZsrjyvAsEI4o'
      'A'
      'AACJULLm1ou1mSSRIEmUi4mJ4ci4J598ki'
      'P'
      'n0Ijip59+yj33IVEEAABIZNiwYRw5q0mTJh'
      'w'
      'ZQ/UdQe7SpUscGWd2GoBVbl1XBokiAAB'
      'A'
      'IsuWLePIWY8//jhHxtB8SrcFKufjhQLgJ06c'
      '4'
      'MiY5s2bc'
      '+Q8KyOhKiFRBAAA8Ig2bdpwZMyBAwc4')
    TabOrder = 4
  end
  object Button2: TButton
    Left = 410
    Top = 279
    Width = 135
    Height = 25
    Caption = 'obtem qrCode'
    TabOrder = 5
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 410
    Top = 341
    Width = 135
    Height = 25
    Caption = 'enviar texto'
    TabOrder = 6
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 263
    Top = 310
    Width = 135
    Height = 25
    Caption = 'status da instancia'
    TabOrder = 7
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 263
    Top = 372
    Width = 135
    Height = 25
    Caption = 'enviar arquivo'
    TabOrder = 8
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 410
    Top = 310
    Width = 135
    Height = 25
    Caption = 'Carregar foto perfil'
    TabOrder = 9
    OnClick = Button6Click
  end
  object Button7: TButton
    Left = 263
    Top = 496
    Width = 135
    Height = 25
    Caption = 'Obter lista de grupos'
    TabOrder = 10
    OnClick = Button7Click
  end
  object edtNumeroContato: TEdit
    Left = 26
    Top = 121
    Width = 177
    Height = 23
    TabOrder = 11
    Text = '559982385000'
  end
  object Button8: TButton
    Left = 263
    Top = 434
    Width = 135
    Height = 25
    Caption = 'Listar instancias'
    TabOrder = 12
    OnClick = Button8Click
  end
  object Button9: TButton
    Left = 263
    Top = 403
    Width = 135
    Height = 25
    Caption = 'Enviar Lista/Menu'
    TabOrder = 13
    OnClick = Button9Click
  end
  object edtIDMensagem: TEdit
    Left = 333
    Top = 229
    Width = 161
    Height = 23
    ReadOnly = True
    TabOrder = 14
  end
  object Button10: TButton
    Left = 410
    Top = 403
    Width = 135
    Height = 25
    Caption = 'Status da mensagem'
    TabOrder = 15
    OnClick = Button10Click
  end
  object Button11: TButton
    Left = 410
    Top = 527
    Width = 135
    Height = 25
    Caption = 'Excluir instancia'
    TabOrder = 16
    OnClick = Button11Click
  end
  object Button12: TButton
    Left = 263
    Top = 465
    Width = 135
    Height = 25
    Caption = 'Obter contatos'
    TabOrder = 17
    OnClick = Button12Click
  end
  object Button13: TButton
    Left = 410
    Top = 434
    Width = 135
    Height = 25
    Caption = 'Verifica se tem whats'
    TabOrder = 18
    OnClick = Button13Click
  end
  object Button14: TButton
    Left = 263
    Top = 527
    Width = 135
    Height = 25
    Caption = 'Listar participante grupo'
    TabOrder = 19
    OnClick = Button14Click
  end
  object edtIdGrupo: TEdit
    Left = 333
    Top = 179
    Width = 121
    Height = 23
    TabOrder = 20
    Text = 'edtIdGrupo'
  end
  object Button15: TButton
    Left = 410
    Top = 465
    Width = 135
    Height = 25
    Caption = 'Reiniciar instancia'
    TabOrder = 21
    OnClick = Button15Click
  end
  object Button16: TButton
    Left = 410
    Top = 496
    Width = 135
    Height = 25
    Caption = 'Desconectar instancia'
    TabOrder = 22
    OnClick = Button16Click
  end
  object Button17: TButton
    Left = 263
    Top = 341
    Width = 135
    Height = 25
    Caption = 'Dados do contato'
    TabOrder = 23
    OnClick = Button17Click
  end
  object edtNomeContato: TEdit
    Left = 209
    Top = 121
    Width = 121
    Height = 23
    ReadOnly = True
    TabOrder = 24
  end
  object Button18: TButton
    Left = 410
    Top = 372
    Width = 135
    Height = 25
    Caption = 'Enviar base64'
    TabOrder = 25
    OnClick = Button18Click
  end
  object Panel1: TPanel
    Left = 694
    Top = 8
    Width = 272
    Height = 178
    TabOrder = 26
    object Label6: TLabel
      Left = 106
      Top = 75
      Width = 55
      Height = 15
      Caption = 'Api Global'
    end
    object Label7: TLabel
      Left = 93
      Top = 125
      Width = 99
      Height = 15
      Caption = 'Url do seu Servidor'
    end
    object Label11: TLabel
      Left = 48
      Top = 6
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
    object edtApiGlobal: TEdit
      Left = 44
      Top = 96
      Width = 173
      Height = 23
      TabOrder = 0
      Text = 'B6D711FCDE4D4FD5936544120E713976PauloJunior'
      OnExit = edtApiGlobalExit
    end
    object edtUrl: TEdit
      Left = 52
      Top = 146
      Width = 173
      Height = 23
      TabOrder = 1
      Text = 'https://evo.voceatende.com.br'
      OnExit = edtUrlExit
    end
  end
  object memoMensagemEnviar: TMemo
    Left = 26
    Top = 168
    Width = 301
    Height = 89
    Lines.Strings = (
      'Esta '#233' uma mensagem de teste, se voce recebeu'#55358#56606
      #233' porque deu certo '#55357#56845'.'
      ''
      '*Pode usar negrito* e qualquer outro comando nativo '
      'do WhatsApp')
    TabOrder = 27
  end
  object Button19: TButton
    Left = 263
    Top = 574
    Width = 282
    Height = 25
    Hint = 
      'Marcar todos os contatos de um grupo ao enviar a mensagem, conhe' +
      'cido como men'#231#227'o fantasma'
    Caption = 'Marcar contatos no grupo'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 28
    OnClick = Button19Click
  end
  object Button20: TButton
    Left = 263
    Top = 624
    Width = 282
    Height = 25
    Caption = 'Alterar configuracao da instancia'
    TabOrder = 29
    OnClick = Button20Click
  end
  object ApiEuAtendo1: TApiEuAtendo
    OnObterInstancias = ApiEuAtendo1ObterInstancias
    OnObterContatos = ApiEuAtendo1ObterContatos
    CodigoPais = '55'
    DDDPadrao = '99'
    OnObterGrupos = ApiEuAtendo1ObterGrupos
    OnObterFotoPerfil = ApiEuAtendo1ObterFotoPerfil
    GlobalAPI = 'B6D711FCDE4D4FD5936544120E713976PauloJunior'
    EvolutionApiURL = 'https://evo.voceatende.com.br'
    OnStatusInstancia = ApiEuAtendo1StatusInstancia
    OnCriarInstancia = ApiEuAtendo1CriarInstancia
    OnObterQrCode = ApiEuAtendo1ObterQrCode
    Left = 608
    Top = 176
  end
  object FileOpenDialog1: TFileOpenDialog
    FavoriteLinks = <>
    FileTypes = <>
    Options = []
    Left = 1024
    Top = 208
  end
end
