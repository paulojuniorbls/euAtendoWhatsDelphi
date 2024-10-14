```markdown
# euAtendo - Componente Delphi para Comunicação com WhatsApp

**Autor:** ApiDevs

**Contato:** paulojuniorbls@gmail.com
**Contato:** https://wa.me/559982385000

********Nosso canal no youtube********
https://www.youtube.com/@euAtendo

Apresentação do componente e primeiros passos.
https://youtu.be/FYHuuJA8fcM

Aula de Typebot Com Horse um bot no WhatsApp  .
https://youtu.be/4tYj7OAqD98


********  Servidor para testes do componente **************
*            ************V1*************                  *
**ApiGlobal** ASD3F21APIDEVS6A5SPAULOJRDEVFA1 *
**endPoint** https://apiv1demo.apidevs.app                *
**Manager** https://apiv1demo.apidevs.app/manager         *
*                                                         *
*            ************V2*************                  *
**ApiGlobal** ASD3F21APIDEVS6A5SPAULOJRDEVFA1             *
**endPoint** https://apiv2demo.apicomponente.com.br/      *
**Manager** https://apiv2demo.apicomponente.com.br/manager*
*                                                         * 
********  Servidor para testes do componente **************

```
## Quer doar um café para nossa equipe?  
![QR Code](https://s3.apidevs.app/euatendo/cafe.png)

## nosso grupo no whatsApp -> https://chat.whatsapp.com/DxuXCabArWdLZZBhx5wb1r

O `euAtendo` é um componente Delphi desenvolvido para facilitar
 a integração com o WhatsApp, proporcionando funcionalidades
como criação de instâncias, envio de mensagens,
anexos, menu/lista, entre outras.

## Funcionalidades

- Criação de instância
- Exibir QR Code para conectar
- Envio de texto
- Envio de anexos por arquivos
- Envio de anexos por base64
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

1. Começe sempre criando a sua instancia.
2. Confirme se a instancia está criada (Salve os dados de nome da instancia  e senha).
3. Leia o qrCode.
4. Confirme que está conectado (pode usar o manager).
5. envie um texto ou arquivo.

*Sempre confirme que voce tem uma instancia conectada antes de usar os recursos do componente*


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
