```markdown
# euAtendo - Componente Delphi para Comunicação com WhatsApp

**Autor:** ApiDevs

**Contato:** paulojuniorbls@gmail.com
**Contato:** https://wa.me/559982385000

********  Servidor para testes do componente *************

**ApiGlobal** B6D711FCDE4D4FD5936544120E713976PauloJunior
**endPoint** https://evo.voceatende.com.br

```


## nosso grupo no whatsApp -> https://chat.whatsapp.com/DxuXCabArWdLZZBhx5wb1r

O `euAtendo` é um componente Delphi desenvolvido para facilitar
 a integração com o WhatsApp, proporcionando funcionalidades
como criação de instâncias, envio de mensagens,
anexos, menu/lista, entre outras.

## Funcionalidades

- Criação de instância
- Exibir QR Code para conectar
- Envio de texto
- Envio de anexos
- Envio de menu/lista
- Confirmação de entrega de mensagem
- Confirmação de leitura
- Obter nome do contato
- Listar todas as instancias
- Verificar se o numero possui WhatsApp
- Obter todos os grupos
- Listar todos os participantes de um grupo
- Obter todas as instâncias
- Deletar instância
- Reiniciar instância

## Instalação

Para instalar o componente `euAtendo`, siga os passos abaixo:

1. **Baixe e copie os arquivos**:
   - Baixe os arquivos do repositório.
   - Copie esses arquivos para um diretório de sua preferência.

2. **Instale o pacote no Delphi**:
   - Abra o Delphi.
   - Vá para a pasta
   - build
   - install

3. **Adicione o caminho das units ao Delphi**:
   - Vá para `Tools > Options...`.
   - Em `Environment Options > Delphi Options > Library`, adicione o caminho onde os arquivos estão localizados.

## Uso

Aqui está um exemplo básico de como usar o componente `euAtendo` em um projeto Delphi:

```delphi
unit MainForm;


interface

uses
  Vcl.Forms, ApiEuAtendo;

type
  TForm1 = class(TForm)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    ApiEuAtendo: TApiEuAtendo;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  ApiEuAtendo := TApiEuAtendo.Create(Self);
  ApiEuAtendo.ChaveApi := 'SUA_CHAVE_API';
  ApiEuAtendo.EvolutionApiURL := 'URL_DA_API';
  
  // Exemplos de uso
  ApiEuAtendo.CriarInstancia();
  ApiEuAtendo.DeletarInstancia('nome_da_instancia');
  ApiEuAtendo.ReiniciarInstancia('nome_da_instancia');
end;

end.
```

## Funções Disponíveis

### Criar Instância
```delphi
function CriarInstancia(): TInstanceResponse;
```

### Deletar Instância
```delphi
function DeletarInstancia(nomeInstancia: string): Boolean;
```

### Reiniciar Instância
```delphi
function ReiniciarInstancia(nomeInstancia: string): Boolean;
```

### Enviar Mensagem de Texto
```delphi
function EnviarMensagemDeTexto(NumeroTelefone, Mensagem: string): string;
```

### Enviar Mensagem de Mídia
```delphi
function EnviarMensagemDeMidia(NumeroTelefone, Mensagem, MediaCaption, caminho_arquivo: string): string;
```

### Obter Instâncias
```delphi
procedure obterInstancias(nomeInstancia: string);
```

### Obter Foto de Perfil
```delphi
procedure ObterFotoPerfil(Numero: string; SalvarNoDisco: Boolean);
```

### Obter Grupos
```delphi
procedure ObterGrupos;
```

### Exibir QR Code para Conectar
```delphi
procedure ObterQrCode();
```

### EAlguns prints de tela
![Alt text](https://s3.apidevs.app/apidevs/Screenshot_1.png)
![Alt text](https://s3.apidevs.app/apidevs/Screenshot_2.png)
![Alt text](https://s3.apidevs.app/apidevs/Screenshot_3.png)
![Alt text](https://s3.apidevs.app/apidevs/Screenshot_4.png)

## Contribuição

Contribuições são bem-vindas! Sinta-se à vontade para abrir issues e pull requests para melhorar o componente.

## Licença

Este projeto está licenciado sob a Licença MIT - veja o arquivo [LICENSE](LICENSE) para mais detalhes.

---


Este README fornece uma visão geral do componente, instruções de instalação, um exemplo de uso
e uma descrição das funções disponíveis.
