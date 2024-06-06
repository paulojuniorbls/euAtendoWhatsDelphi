unit uPrincipal;

interface

uses
   Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, ApiEuAtendo,
  Vcl.ExtCtrls, EncdDecd, JPEG,Vcl.Imaging.pngimage,
  IdHTTP, IdMultipartFormData, IdSSL, IdSSLOpenSSL,IdCoderMIME

  //uses para baixar o arquivo direto para o disco
  ,System.Net.HttpClientComponent,System.Net.HttpClient
  //uses para enviar menu e lista
  ,System.JSON
  ;


type
  TForm9 = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Button1: TButton;
    edtNome: TEdit;
    edtSenha: TEdit;
    edtStatus: TEdit;
    Memo1: TMemo;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    edtNumeroContato: TEdit;
    edtTextoMensagem: TEdit;
    Button8: TButton;
    edtApiGlobal: TEdit;
    edtUrl: TEdit;
    ApiEuAtendo1: TApiEuAtendo;
    FileOpenDialog1: TFileOpenDialog;
    Button9: TButton;
    edtIDMensagem: TEdit;
    Label8: TLabel;
    Button10: TButton;
    Button11: TButton;
 procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure voceAtendeAPIObterQrCode(Sender: TObject;
      const Base64QRCode: string);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure voceAtendeAPIObterFotoPerfil(Sender: TObject;
      const FotoPerfilResponse: TFotoPerfilResponse);
    procedure voceAtendeAPIObterGrupos(Sender: TObject; const Grupos: TGrupos);
    procedure Button7Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ApiEuAtendo1StatusInstancia(Sender: TObject;
      const InstanceStatus: TInstanceStatus);
    procedure ApiEuAtendo1CriarInstancia(Sender: TObject;
      const InstanceResponse: TInstanceResponse);
    procedure ApiEuAtendo1ObterQrCode(Sender: TObject;
      const Base64QRCode: string);
    procedure ApiEuAtendo1ObterFotoPerfil(Sender: TObject;
      const FotoPerfilResponse: TFotoPerfilResponse);
    procedure ApiEuAtendo1ObterGrupos(Sender: TObject; const Grupos: TGrupos);
    procedure ApiEuAtendo1ObterInstancias(Sender: TObject;
      const Instancias: TInstances);
    procedure Button8Click(Sender: TObject);
    procedure edtNomeExit(Sender: TObject);
    procedure edtSenhaExit(Sender: TObject);
    procedure edtApiGlobalExit(Sender: TObject);
    procedure edtUrlExit(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
  private
    procedure LoadBase64ToImage(const Base64: string; Image: TImage);
    function SaveImageFromURLToDisk(const ImageURL,
      NumeroContato: string): string;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form9: TForm9;

implementation

{$R *.dfm}

procedure TForm9.LoadBase64ToImage(const Base64: string; Image: TImage);
var
  CleanedBase64: string;
  Input: TStringStream;
  Output: TMemoryStream;
  Img: TPNGImage;  // Para PNG
begin
  // Remover o prefixo da string Base64
  CleanedBase64 := Base64.Replace('data:image/png;base64,', '', [rfIgnoreCase]);

  Input := TStringStream.Create(CleanedBase64, TEncoding.ASCII);
  try
    Output := TMemoryStream.Create;
    try
      DecodeStream(Input, Output);
      Output.Position := 0;

      Img := TPNGImage.Create;  // Para PNG
      try
        Img.LoadFromStream(Output);
        Image.Picture.Assign(Img);
      finally
        Img.Free;
      end;

    finally
      Output.Free;
    end;
  finally
    Input.Free;
  end;
end;


procedure TForm9.ApiEuAtendo1CriarInstancia(Sender: TObject;
  const InstanceResponse: TInstanceResponse);
  begin
    edtNome.Text   := InstanceResponse.InstanceName;
    edtStatus.Text := InstanceResponse.Status;
    edtSenha.Text  := InstanceResponse.ApiKey;

    ApiEuAtendo1.ChaveApi      := InstanceResponse.ApiKey;
    ApiEuAtendo1.NomeInstancia := InstanceResponse.InstanceName;
  end;

procedure TForm9.ApiEuAtendo1ObterFotoPerfil(Sender: TObject;
  const FotoPerfilResponse: TFotoPerfilResponse);
begin

  if FotoPerfilResponse.Filepath <> '' then
    image1.Picture.LoadFromFile(FotoPerfilResponse.Filepath);
end;

procedure TForm9.ApiEuAtendo1ObterGrupos(Sender: TObject;
  const Grupos: TGrupos);
  var
  i:Integer;
begin
 i:=0;
    memo1.Lines.Clear;
   for I := 0 to Length(Grupos) - 1 do
   begin

      memo1.Lines.Add(grupos[I].ID);
      memo1.Lines.Add(grupos[I].Owner);
      memo1.Lines.Add(grupos[I].Desc);
      memo1.Lines.Add(grupos[I].Subject);
      memo1.Lines.Add('----------------------------');
   end;




end;

procedure TForm9.ApiEuAtendo1ObterInstancias(Sender: TObject;
  const Instancias: TInstances);
  var
  i:Integer;
begin
   i:=0;

   for I := 0 to Length(Instancias) - 1 do
     begin
          memo1.Lines.Add('Instancia ' + Instancias[i].InstanceName);
          memo1.Lines.Add('Chave ' + Instancias[i].ApiKey);
          memo1.Lines.Add('Numero ' + Instancias[i].Owner);
          memo1.Lines.Add('---------------------------------------- ' + Instancias[i].Owner);
     end;


end;

procedure TForm9.ApiEuAtendo1ObterQrCode(Sender: TObject;
  const Base64QRCode: string);
begin
  LoadBase64ToImage(Base64QRCode,Image1);
end;

procedure TForm9.ApiEuAtendo1StatusInstancia(Sender: TObject;
  const InstanceStatus: TInstanceStatus);
  begin
   edtNome.Text   := InstanceStatus.InstanceName;
   edtStatus.Text := InstanceStatus.State
end;

procedure TForm9.Button10Click(Sender: TObject);
begin
memo1.Lines.Add(ApiEuAtendo1.StatusDaMensagem(edtIDMensagem.Text));
end;

procedure TForm9.Button11Click(Sender: TObject);
begin
if ApiEuAtendo1.DeletarInstancia(edtNome.Text) then
   showmessage('Instancia excluida com sucesso');
end;

procedure TForm9.Button1Click(Sender: TObject);
begin
 try
    ApiEuAtendo1.NomeInstancia := edtNome.Text;
    ApiEuAtendo1.ChaveApi := edtSenha.Text;
    ApiEuAtendo1.CriarInstancia();
 except on E: Exception do
   begin
   showmessage('essa instancia já existe');
   ApiEuAtendo1.StatusInstancia;
   end;
 end;

end;

procedure TForm9.Button2Click(Sender: TObject);
begin
ApiEuAtendo1.ObterQrCode;
end;

procedure TForm9.Button3Click(Sender: TObject);
var
id:String;
begin
 edtIDMensagem.Text := ApiEuAtendo1.EnviarMensagemDeTexto(edtNumeroContato.Text,edtTextoMensagem.Text);
end;

procedure TForm9.Button4Click(Sender: TObject);
begin
ApiEuAtendo1.StatusInstancia();
end;

procedure TForm9.Button5Click(Sender: TObject);
begin
   FileOpenDialog1.Execute;
   if FileOpenDialog1.FileName <> '' then
     edtIDMensagem.Text := ApiEuAtendo1.EnviarMensagemDeMidia(edtNumeroContato.Text,'',edtTextoMensagem.Text,FileOpenDialog1.FileName);

end;

procedure TForm9.Button6Click(Sender: TObject);
begin
ApiEuAtendo1.ObterFotoPerfil(edtNumeroContato.text,true);
end;

procedure TForm9.Button7Click(Sender: TObject);
begin
ApiEuAtendo1.obterGrupos;
end;

procedure TForm9.Button8Click(Sender: TObject);
begin
ApiEuAtendo1.obterInstancias;
end;

procedure TForm9.Button9Click(Sender: TObject);
var
Secoes: TJSONArray;
Secao, Linha: TJSONObject;
Linhas: TJSONArray;
begin

try
    Secoes := TJSONArray.Create;
    // Adiciona a seção de Vendas
    Secao := TJSONObject.Create;
    Secao.AddPair('title', 'Vendas');
    Linhas := TJSONArray.Create;
    Linha := TJSONObject.Create;
    Linha.AddPair('title', 'Promoção de Medicamentos');
    Linha.AddPair('description', 'Confira as promoções especiais de medicamentos desta semana.');
    Linha.AddPair('rowId', 'vendas_001');
    Linhas.AddElement(Linha);
    Linha := TJSONObject.Create;
    Linha.AddPair('title', 'Novidades');
    Linha.AddPair('description', 'Conheça os novos produtos disponíveis em nossa farmácia.');
    Linha.AddPair('rowId', 'vendas_002');
    Linhas.AddElement(Linha);
    Secao.AddPair('rows', Linhas);
    Secoes.AddElement(Secao);
    // Adiciona a seção de Financeiro
    Secao := TJSONObject.Create;
    Secao.AddPair('title', 'Financeiro');
    Linhas := TJSONArray.Create;
    Linha := TJSONObject.Create;
    Linha.AddPair('title', 'Segunda Via de Boleto');
    Linha.AddPair('description', 'Solicite a segunda via de seu boleto.');
    Linha.AddPair('rowId', 'financeiro_001');
    Linhas.AddElement(Linha);
    Linha := TJSONObject.Create;
    Linha.AddPair('title', 'Histórico de Pagamentos');
    Linha.AddPair('description', 'Consulte seu histórico de pagamentos.');
    Linha.AddPair('rowId', 'financeiro_002');
    Linhas.AddElement(Linha);
    Secao.AddPair('rows', Linhas);
    Secoes.AddElement(Secao);
    // Adiciona a seção de Dúvidas
    Secao := TJSONObject.Create;
    Secao.AddPair('title', 'Dúvidas');
    Linhas := TJSONArray.Create;
    Linha := TJSONObject.Create;
    Linha.AddPair('title', 'Horário de Funcionamento');
    Linha.AddPair('description', 'Saiba os horários de funcionamento de nossas lojas.');
    Linha.AddPair('rowId', 'duvidas_001');
    Linhas.AddElement(Linha);
    Linha := TJSONObject.Create;
    Linha.AddPair('title', 'Contatos');
    Linha.AddPair('description', 'Veja os contatos para atendimento ao cliente.');
    Linha.AddPair('rowId', 'duvidas_002');
    Linhas.AddElement(Linha);
    Secao.AddPair('rows', Linhas);
    Secoes.AddElement(Secao);
    if ApiEuAtendo1.EnviarLista(edtNumeroContato.Text, 'Serviços da Farmácia', 'Selecione uma opção abaixo:', 'Clique Aqui', 'Farmácia XYZ\nhttps://exemplo.com.br', Secoes) then
      ShowMessage('Lista enviada com sucesso!')
    else
      ShowMessage('Falha ao enviar a lista.');
  finally
   //ApiEuAtendo.Free;
  end;
end;

procedure TForm9.edtApiGlobalExit(Sender: TObject);
begin
ApiEuAtendo1.GlobalAPI := edtApiGlobal.Text;
end;

procedure TForm9.edtNomeExit(Sender: TObject);
begin
ApiEuAtendo1.NomeInstancia := edtNome.Text;
end;

procedure TForm9.edtSenhaExit(Sender: TObject);
begin
ApiEuAtendo1.ChaveApi := edtSenha.Text;
end;

procedure TForm9.edtUrlExit(Sender: TObject);
begin
ApiEuAtendo1.EvolutionApiURL := edtUrl.Text;
end;

function TForm9.SaveImageFromURLToDisk(const ImageURL, NumeroContato: string): string;
var
  HttpClient: TNetHTTPClient;
  ImageStream: TMemoryStream;
  HttpResponse: IHTTPResponse;
  DirPath, FilePath: string;
begin
  Result := '';

  HttpClient := TNetHTTPClient.Create(nil);
  try
    ImageStream := TMemoryStream.Create;
    try
      HttpResponse := HttpClient.Get(ImageURL, ImageStream);
      if HttpResponse.StatusCode = 200 then
      begin
        ImageStream.Position := 0;  // Reset stream position

        // Define o diretório e o caminho do arquivo
        DirPath := ExtractFilePath(ParamStr(0)) + 'foto_perfil\';
        FilePath := DirPath + NumeroContato + '.jpg';

        // Se o diretório não existir, cria o diretório
        if not DirectoryExists(DirPath) then
          ForceDirectories(DirPath);

        // Salva o arquivo no disco
        ImageStream.SaveToFile(FilePath);

        // Retorna o caminho do arquivo
        Result := FilePath;
      end
      else
        raise Exception.Create('Erro ao baixar a imagem. HTTP Status: ' + HttpResponse.StatusCode.ToString);
    finally
      ImageStream.Free;
    end;
  finally
    HttpClient.Free;
  end;
end;

procedure TForm9.voceAtendeAPIObterFotoPerfil(Sender: TObject;
  const FotoPerfilResponse: TFotoPerfilResponse);
  var
  caminho:String;
begin
caminho := FotoPerfilResponse.ProfilePictureURL;
if FotoPerfilResponse.Filepath <> '' then
  image1.Picture.LoadFromFile(FotoPerfilResponse.Filepath);

end;

procedure TForm9.voceAtendeAPIObterGrupos(Sender: TObject;
  const Grupos: TGrupos);
  var
  grupo : Tgrupo;
begin
  memo1.Lines.Clear;
  memo1.Lines.Add(Grupos[1].ID);
  memo1.Lines.Add(Grupos[1].Owner);
  memo1.Lines.Add(Grupos[1].Desc);
end;

procedure TForm9.voceAtendeAPIObterQrCode(Sender: TObject;
  const Base64QRCode: string);
begin
   LoadBase64ToImage(Base64QRCode,Image1);
end;


end.
