

//Criador e mantido por Paulo Junior (99)8238-5000
//Componente REST para integrar com a EVOLUTION API uma plataforma 100% rest para interagir com WhatsApp, Facebook e Instagram.
//Está com dificuldade de criar seu servidor, manda um zap e ajudamos voce, ou criamos e mantemos um em nossa estrutura,
// Mais barato que uma VPS basica.



unit ApiEuAtendo;
interface
uses
  IdMultipartFormData,System.Classes, IdHTTP, IdSSL, System.JSON, System.SysUtils,
  System.NetEncoding, IdSSLOpenSSL, IdCoderMIME, VCL.Graphics ,Vcl.ExtCtrls, VCL.Imaging.jpeg
  //baixar imagem disco
  ,System.Net.HttpClientComponent,System.Net.HttpClient

  ;
type
  TInstanceStatus = record
    InstanceName: string;
    State: string;
  end;

  type
  TContato = record
    fone: string;
    Nome: string;
    foto: string;
  end;

  TInstanceResponse = record
    InstanceName: string;
    Status: string;
    ApiKey: string;
  end;


  type
  TQrCodeResponse = record
    Base64: string;
  end;

  type
  TGrupo = record
    ID: string;
    Subject: string;
    SubjectOwner: string;
    SubjectTime: Int64;
    Creation: Int64;
    Owner: string;
    Desc: string;
    DescId: string;
    Restrict: Boolean;
    Announce: Boolean;
  end;

  type
  TGrupoMembro = record
    ID: string;
    Admin: Boolean;
  end;

  TGrupoMembros = array of TGrupoMembro;



  type
  TInstanceDetail = record
    InstanceName: string;
    InstanceId: string;
    Owner: string;
    ProfileName: string;
    ProfilePictureUrl: string;
    ProfileStatus: string;
    Status: string;
    ServerUrl: string;
    ApiKey: string;
    WebhookWaBusiness: string;
  end;
  TInstances = array of TInstanceDetail;

 TGrupos = array of TGrupo;
 TContatos = array of TContato;

  type
    TFotoPerfilResponse = record
        WUID: string;
        ProfilePictureURL: string;
        Filepath:String;
    end;

  type
  TOnObterGrupos = procedure(Sender: TObject; const Grupos: TGrupos) of object;

  type
  TOnObterInstancias = procedure(Sender: TObject; const Instancias: TInstances) of object;

  TOnObterFotoPerfil = procedure(Sender: TObject; const FotoPerfilResponse: TFotoPerfilResponse) of object;
  TOnObterContatos = procedure(Sender: TObject; const Contatos: TContatos) of object;

  TOnStatusInstancia = procedure(Sender: TObject; const InstanceStatus: TInstanceStatus) of object;
  TOnCriarInstancia = procedure(Sender: TObject; const InstanceResponse: TInstanceResponse) of object;
  TOnObterQrCode = procedure(Sender: TObject; const Base64QRCode: string) of object;
  TApiEuAtendo = class(TComponent)
  private
    FProxyHost: String;
    FProxyPort: String;
    FProxyProtocol: String;
    FProxyUsername: String;
    FProxyPassword: String;
    FGlobalAPI: String;
    FEvolutionApiURL: String;
    FChaveApi: String;
    FNomeInstancia: String;
    FOnStatusInstancia: TOnStatusInstancia;
    FOnCriarInstancia: TOnCriarInstancia;
    FOnObterQrCode: TOnObterQrCode;
    FOnObterFotoPerfil: TOnObterFotoPerfil;
    FOnObterGrupos: TOnObterGrupos;
    FCodigoPais: String;
    FdddPadrao:String;
    FUrlTypebot:String;
    FNomeTypeBot:String;
    FTypeBotMensagemNaoEntendeu:String;
    FOnObterInstancias: TOnObterInstancias;
    FOnObterContatos: TOnObterContatos;
    procedure DecodeBase64Stream(Input, Output: TStream);
    function  DetectFileType(const filePath: string): string;
    procedure DoObterFotoPerfil(const FotoPerfilResponse: TFotoPerfilResponse);
    procedure DoObterGrupos(const Grupos: TGrupos);
    function FormatPhoneNumber(const Numero: string): string;
    function SaveImageFromURLToDisk(const ImageURL,
      NumeroContato: string): string;
  protected
    procedure DoStatusInstancia(const InstanceStatus: TInstanceStatus);
    procedure DoCriarInstancia(const InstanceResponse: TInstanceResponse);
    procedure DoObterQrCode(const Base64QRCode: string);
    procedure DoObterContatos(const Contatos: TContatos);
  public
    function SoNumeros(const ATexto: string): string;
    procedure CarregarImagemDaUrl(const AURL: string; AImage: TImage);
    procedure obterDadosInstancia;
    function ObterMembrosGrupo(GroupJid: string; out ErroMsg: string): TGrupoMembros;
    procedure ObterContatos;
    function ExistWhats(NumeroTelefone: string; out ErroMsg: string): Boolean;
    function DeletarInstancia(nomeInstancia: string): Boolean;
    function DeslogarInstancia(): Boolean;
    function ReiniciarInstancia: Boolean;
    procedure obterInstancias;
    function FileToBase64(const FileName: string): string;
    function EnviarMensagemDeMidia(NumeroTelefone, Mensagem, MediaCaption, caminho_arquivo: string): string;
    function EnviarMensagemDeBase64(NumeroTelefone, MediaCaption, base64,tipoArquivo,nomeArquivo:String): string;
    function SendMessageGhostMentionToGroup(const GroupID, MessageText: string;
      out ErroMsg: string): Boolean;
    function AlterarPropriedadesInstancia(rejeitarLigacao,ignorarGrupos,sempreOnline,lerMensagens,lerStatus : Boolean;mensagemRejeitaLigacao:String; out ErrorMsg: string): Boolean;
    function ObterDadosContato(const ContactID: string; out ErroMsg: string): TContato;
    procedure ObterFotoPerfil(Numero: string; SalvarNoDisco: Boolean);
    function CriarInstancia(out ErrorMsg: string): Boolean;
    function StatusInstancia( ): TInstanceStatus;
    procedure ObterQrCode();
    function EnviarMensagemDeTexto(NumeroTelefone, Mensagem: string): string;
    function StatusDaMensagem(idMensagem: string): string;
    function EnviarLista(NumeroTelefone, Titulo, Descricao, TextoBotao, TextoRodape: string; Secoes: TJSONArray): Boolean;
    procedure ObterGrupos;
    constructor Create(AOwner: TComponent);
  published
    property ProxyHost: String read FProxyHost write FProxyHost;
    property ProxyPort: String read FProxyPort write FProxyPort;
    property ProxyProtocol: String read FProxyProtocol write FProxyProtocol;
    property ProxyUsername: String read FProxyUsername write FProxyUsername;
    property ProxyPassword: String read FProxyPassword write FProxyPassword;
    property OnObterInstancias: TOnObterInstancias read FOnObterInstancias write FOnObterInstancias;
    property OnObterContatos: TOnObterContatos read FOnObterContatos write FOnObterContatos;
    property MensagemNaoReconhecida: String read FTypeBotMensagemNaoEntendeu write FTypeBotMensagemNaoEntendeu;
    property UrlTypeBot: String read FUrlTypebot write FUrlTypebot;
    property NomeTypeBot: String read FNomeTypeBot write FNomeTypeBot;
    property CodigoPais: String read FCodigoPais write FCodigoPais;
    property DDDPadrao: String read FdddPadrao write FdddPadrao;
    property OnObterGrupos: TOnObterGrupos read FOnObterGrupos write FOnObterGrupos;
    property OnObterFotoPerfil: TOnObterFotoPerfil read FOnObterFotoPerfil write FOnObterFotoPerfil;
    property ChaveApi: String read FChaveApi write FChaveApi;
    property NomeInstancia: String read FNomeInstancia write FNomeInstancia;
    property GlobalAPI: String read FGlobalAPI write FGlobalAPI;
    property EvolutionApiURL: String read FEvolutionApiURL write FEvolutionApiURL;
    property OnStatusInstancia: TOnStatusInstancia read FOnStatusInstancia write FOnStatusInstancia;
    property OnCriarInstancia: TOnCriarInstancia read FOnCriarInstancia write FOnCriarInstancia;
    property OnObterQrCode: TOnObterQrCode read FOnObterQrCode write FOnObterQrCode;
  end;

procedure Register;

implementation

uses
  Functions;

procedure TApiEuAtendo.DoObterContatos(const Contatos: TContatos);
begin
  if Assigned(FOnObterContatos) then
    FOnObterContatos(Self, Contatos);
end;

function TApiEuAtendo.ObterMembrosGrupo(GroupJid: string; out ErroMsg: string): TGrupoMembros;
var
  HTTP: TIdHTTP;
  SSL: TIdSSLIOHandlerSocketOpenSSL;
  ResponseStr: string;
  ResponseJSON: TJSONObject;
  ParticipantsJSON: TJSONArray;
  I: Integer;
  MembroJSON: TJSONObject;
  Membros: TGrupoMembros;
begin
  SetLength(Membros, 0);  // Initialize as empty
  ErroMsg := '';  // Initialize error message
  HTTP := TIdHTTP.Create(nil);
  SSL := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  try
    SSL.SSLOptions.SSLVersions := [sslvTLSv1, sslvTLSv1_1, sslvTLSv1_2];
    HTTP.IOHandler := SSL;
    HTTP.Request.CustomHeaders.AddValue('apikey', FChaveApi);
    try
      ResponseStr := HTTP.Get(FEvolutionApiURL + '/group/participants/' + FNomeInstancia + '?groupJid=' + GroupJid);
      ResponseJSON := TJSONObject.ParseJSONValue(ResponseStr) as TJSONObject;
      if Assigned(ResponseJSON) then
      begin
        ParticipantsJSON := ResponseJSON.GetValue<TJSONArray>('participants');
        if Assigned(ParticipantsJSON) then
        begin
          SetLength(Membros, ParticipantsJSON.Count);
          for I := 0 to ParticipantsJSON.Count - 1 do
          begin
            MembroJSON := ParticipantsJSON.Items[I] as TJSONObject;
            Membros[I].ID := MembroJSON.GetValue<string>('id');
            Membros[I].Admin := MembroJSON.GetValue<string>('admin') <> '';
          end;
        end;
      end;
    except
      on E: EIdHTTPProtocolException do
      begin
        ResponseStr := E.ErrorMessage;
        ErroMsg := 'Erro ao obter membros do grupo: ' + ResponseStr;
      end;
      on E: Exception do
      begin
        ErroMsg := 'Erro ao obter membros do grupo: ' + E.Message;
      end;
    end;
  finally
    SSL.Free;
    HTTP.Free;
  end;
  Result := Membros;
end;


procedure TApiEuAtendo.ObterContatos;
var
  HTTP: TIdHTTP;
  SSL: TIdSSLIOHandlerSocketOpenSSL;
  JSONToSend: TJSONObject;
  PostDataStream: TStringStream;
  ResponseStr: string;
  JSONArray: TJSONArray;
  Contatos: TContatos;
  JSONContato: TJSONObject;
  Value: TJSONValue;
  I: Integer;
begin
  HTTP := TIdHTTP.Create(nil);
  SSL := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  try
    SSL.SSLOptions.SSLVersions := [sslvTLSv1, sslvTLSv1_1, sslvTLSv1_2];
    HTTP.IOHandler := SSL;
    HTTP.Request.ContentType := 'application/json';
    HTTP.Request.CustomHeaders.AddValue('apikey', FChaveApi);
    JSONToSend := TJSONObject.Create;
    try
      JSONToSend.AddPair('where', TJSONObject.Create);
      PostDataStream := TStringStream.Create(JSONToSend.ToString, TEncoding.UTF8);
      try
        ResponseStr := HTTP.Post(FEvolutionApiURL + '/chat/findContacts/' + FNomeInstancia, PostDataStream);
      finally
        PostDataStream.Free;
      end;
      JSONArray := TJSONObject.ParseJSONValue(ResponseStr) as TJSONArray;
      try
        SetLength(Contatos, JSONArray.Count);
        for I := 0 to JSONArray.Count - 1 do
        begin
          JSONContato := JSONArray.Items[I] as TJSONObject;
          if JSONContato.TryGetValue('id', Value) then
            Contatos[I].fone := Value.Value;
          if JSONContato.TryGetValue('pushName', Value) then
            Contatos[I].Nome := Value.Value;
          if JSONContato.TryGetValue('profilePictureUrl', Value) then
            Contatos[I].foto := Value.Value;
        end;
        DoObterContatos(Contatos);
      finally
        JSONArray.Free;
      end;
    finally
      JSONToSend.Free;
    end;
  finally
    SSL.Free;
    HTTP.Free;
  end;
end;

function TApiEuAtendo.SoNumeros(const ATexto: string): string;
var
  I: Integer;
  Resultado: string;
begin
  Resultado := '';
  for I := 1 to Length(ATexto) do
  begin
    if ATexto[I] in ['0'..'9'] then
      Resultado := Resultado + ATexto[I];
  end;
  Result := Resultado;
end;

procedure TApiEuAtendo.obterInstancias;
var
  HTTP: TIdHTTP;
  SSL: TIdSSLIOHandlerSocketOpenSSL;
  ResponseStr: string;
  JSONArray: TJSONArray;
  Instances: TInstances;
  I: Integer;
  JSONInstance, IntegrationJSON: TJSONObject;
  Value: TJSONValue;
begin
  HTTP := TIdHTTP.Create(nil);
  SSL := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  try
    SSL.SSLOptions.SSLVersions := [sslvTLSv1, sslvTLSv1_1, sslvTLSv1_2];
    HTTP.IOHandler := SSL;
    HTTP.Request.CustomHeaders.AddValue('apikey', FGlobalAPI);
    ResponseStr := HTTP.Get(FEvolutionApiURL + '/instance/fetchInstances');
    JSONArray := TJSONObject.ParseJSONValue(ResponseStr) as TJSONArray;
    SetLength(Instances, JSONArray.Count);
    for I := 0 to JSONArray.Count - 1 do
    begin
      JSONInstance := JSONArray.Items[I].GetValue<TJSONObject>('instance');
      Instances[I].InstanceName := '';
      Instances[I].InstanceId := '';
      Instances[I].Owner := '';
      Instances[I].ProfileName := '';
      Instances[I].ProfilePictureUrl := '';
      Instances[I].ProfileStatus := '';
      Instances[I].Status := '';
      Instances[I].ServerUrl := '';
      Instances[I].ApiKey := '';
      Instances[I].WebhookWaBusiness := '';
      if JSONInstance.TryGetValue('instanceName', Value) then
        Instances[I].InstanceName := Value.Value;
      if JSONInstance.TryGetValue('instanceId', Value) then
        Instances[I].InstanceId := Value.Value;
      if JSONInstance.TryGetValue('owner', Value) then
        Instances[I].Owner := Value.Value;
      if JSONInstance.TryGetValue('profileName', Value) then
        Instances[I].ProfileName := Value.Value;
      if JSONInstance.TryGetValue('profilePictureUrl', Value) then
        Instances[I].ProfilePictureUrl := Value.Value;
      if JSONInstance.TryGetValue('profileStatus', Value) then
        Instances[I].ProfileStatus := Value.Value;
      if JSONInstance.TryGetValue('status', Value) then
        Instances[I].Status := Value.Value;
      if JSONInstance.TryGetValue('serverUrl', Value) then
        Instances[I].ServerUrl := Value.Value;
      if JSONInstance.TryGetValue('apikey', Value) then
        Instances[I].ApiKey := Value.Value;
      // Tratamento para o campo "integration" -> "webhook_wa_business"
      if JSONInstance.TryGetValue('integration', IntegrationJSON) then
        if IntegrationJSON.TryGetValue('webhook_wa_business', Value) then
          Instances[I].WebhookWaBusiness := Value.Value;
    end;
    if Assigned(FOnObterInstancias) then
      FOnObterInstancias(Self, Instances);
  finally
    SSL.Free;
    HTTP.Free;
  end;
end;

procedure TApiEuAtendo.CarregarImagemDaUrl(const AURL: string; AImage: TImage);
var
  HTTP: TIdHTTP;
  SSL: TIdSSLIOHandlerSocketOpenSSL;
  ImageStream: TMemoryStream;
  JpegImage: TJPEGImage;
begin
  HTTP := TIdHTTP.Create(nil);
  SSL := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  ImageStream := TMemoryStream.Create;
  JpegImage := TJPEGImage.Create;
  try
    try
      SSL.SSLOptions.SSLVersions := [sslvTLSv1, sslvTLSv1_1, sslvTLSv1_2];
      HTTP.IOHandler := SSL;
      // Fazendo o download da imagem
      HTTP.Get(AURL, ImageStream);
      // Carregando a imagem no TJPEGImage
      ImageStream.Position := 0; // Resetando a posição do stream
      JpegImage.LoadFromStream(ImageStream);
      // Exibindo a imagem no TImage
      AImage.Picture.Graphic := JpegImage;
    except
      on E: Exception do
        raise Exception.Create('Erro ao baixar a imagem: ' + E.Message);
    end;
  finally
    SSL.Free;
    HTTP.Free;
    ImageStream.Free;
    JpegImage.Free;  // Libera a memória alocada para a imagem JPEG
  end;
end;


procedure TApiEuAtendo.obterDadosInstancia;
var
  HTTP: TIdHTTP;
  SSL: TIdSSLIOHandlerSocketOpenSSL;
  ResponseStr: string;
  JSONResponse, JSONInstance, IntegrationJSON: TJSONObject;
  Instances: TInstances;
  Instance: TInstanceDetail;
  Value: TJSONValue;
begin
  HTTP := TIdHTTP.Create(nil);
  SSL := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  try
    SSL.SSLOptions.SSLVersions := [sslvTLSv1, sslvTLSv1_1, sslvTLSv1_2];
    HTTP.IOHandler := SSL;
    HTTP.Request.CustomHeaders.AddValue('apikey', FGlobalAPI);
    // Ajuste na URL com o parâmetro instanceName
    ResponseStr := HTTP.Get(FEvolutionApiURL + '/instance/fetchInstances' + '?instanceName=' + FNomeInstancia);
    JSONResponse  := TJSONObject.ParseJSONValue(ResponseStr) as TJSONObject;
// Acessando o objeto "instance" dentro do JSON retornado
    if JSONResponse.TryGetValue<TJSONObject>('instance', JSONInstance) then
    begin
      // Inicializa o array de instâncias com tamanho 1
      SetLength(Instances, 1);
      // Limpa e inicializa a estrutura da instância
      Instance.InstanceName := '';
      Instance.InstanceId := '';
      Instance.Owner := '';
      Instance.ProfileName := '';
      Instance.ProfilePictureUrl := '';
      Instance.ProfileStatus := '';
      Instance.Status := '';
      Instance.ServerUrl := '';
      Instance.ApiKey := '';
      Instance.WebhookWaBusiness := '';
      // Preenchendo os campos da instância
      JSONInstance.TryGetValue<string>('instanceName', Instance.InstanceName);
      JSONInstance.TryGetValue<string>('instanceId', Instance.InstanceId);
      JSONInstance.TryGetValue<string>('owner', Instance.Owner);
      JSONInstance.TryGetValue<string>('profileName', Instance.ProfileName);
      JSONInstance.TryGetValue<string>('profilePictureUrl', Instance.ProfilePictureUrl);
      JSONInstance.TryGetValue<string>('profileStatus', Instance.ProfileStatus);
      JSONInstance.TryGetValue<string>('status', Instance.Status);
      JSONInstance.TryGetValue<string>('serverUrl', Instance.ServerUrl);
      JSONInstance.TryGetValue<string>('apikey', Instance.ApiKey);
      // Tratamento para o campo "integration" -> "webhook_wa_business"
      if JSONInstance.TryGetValue('integration', IntegrationJSON) then
        IntegrationJSON.TryGetValue<string>('webhook_wa_business', Instance.WebhookWaBusiness);
      // Adiciona a instância ao array
      Instances[0] := Instance;
      // Chamando o evento para retornar o array de instâncias
      if Assigned(FOnObterInstancias) then
        FOnObterInstancias(Self, Instances);
    end;
  finally
    SSL.Free;
    HTTP.Free;
  end;
end;


procedure TApiEuAtendo.ObterGrupos;
var
t:TThread;
begin
t.CreateAnonymousThread(procedure
var
  HTTP: TIdHTTP;
  SSL: TIdSSLIOHandlerSocketOpenSSL;
  ResponseStr: string;
  ResponseJSON: TJSONObject;
  Grupos: TGrupos;
  JSONArray: TJSONArray;
  JSONGroup: TJSONObject;
  Value : TJSONValue;
  I: Integer;
 begin
  HTTP := TIdHTTP.Create(nil);
  SSL := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  try
    SSL.SSLOptions.SSLVersions := [sslvTLSv1, sslvTLSv1_1, sslvTLSv1_2];
    HTTP.IOHandler := SSL;
    HTTP.Request.CustomHeaders.AddValue('apikey', FChaveApi);

    try
     ResponseStr := HTTP.Get(FEvolutionApiURL + '/group/fetchAllGroups/' + FNomeInstancia + '?getParticipants=false');
     JSONArray := TJSONObject.ParseJSONValue(ResponseStr) as TJSONArray;
      try
        SetLength(Grupos, JSONArray.Count);
        for I := 0 to JSONArray.Count - 1 do
          begin
            JSONGroup := JSONArray.Items[I] as TJSONObject;

            if JSONGroup.TryGetValue('id', Value) then
              Grupos[I].ID := Value.Value;

            if JSONGroup.TryGetValue('subject', Value) then
              Grupos[I].Subject := Value.Value;

            if JSONGroup.TryGetValue('subjectOwner', Value) then
              Grupos[I].SubjectOwner := Value.Value;

            if JSONGroup.TryGetValue('subjectTime', Value) and (Value is TJSONNumber) then
              Grupos[I].SubjectTime := TJSONNumber(Value).AsInt64;

            if JSONGroup.TryGetValue('creation', Value) and (Value is TJSONNumber) then
              Grupos[I].Creation := TJSONNumber(Value).AsInt64;

            if JSONGroup.TryGetValue('owner', Value) then
              Grupos[I].Owner := Value.Value;

            if JSONGroup.TryGetValue('desc', Value) then
              Grupos[I].Desc := Value.Value;

            if JSONGroup.TryGetValue('descId', Value) then
              Grupos[I].DescId := Value.Value;

            if JSONGroup.TryGetValue('restrict', Value) and (Value is TJSONBool) then
              Grupos[I].Restrict := TJSONBool(Value).AsBoolean;

              if JSONGroup.TryGetValue('announce', Value) and (Value is TJSONBool) then
              Grupos[I].Announce := TJSONBool(Value).AsBoolean;

          end;


        DoObterGrupos(Grupos);
      finally
       // ResponseJSON.Free;
      end;

    except
      on E: Exception do
        // Trate exceções conforme necessário.
    end;
  finally
    SSL.Free;
    HTTP.Free;
  end;

  end).Start;


  end;


procedure TApiEuAtendo.DecodeBase64Stream(Input, Output: TStream);
var
  Decoder: TIdDecoderMIME;
begin
  Decoder := TIdDecoderMIME.Create(nil);
  try
    Decoder.DecodeBegin(Output);
    Decoder.Decode(Input);
    Decoder.DecodeEnd;
  finally
    Decoder.Free;
  end;
end;

function TApiEuAtendo.FormatPhoneNumber(const Numero: string): string;
var
  I: Integer;
  FormattedNumber, DDD, NumeroFinal: string;
  CountryCodeLength, DDDLength, NumeroLength: Integer;
begin
  FormattedNumber := '';
  DDD := FdddPadrao;  // DDD padrão
  CountryCodeLength := Length(FCodigoPais);
  DDDLength := Length(FdddPadrao);
  // Manter apenas os dígitos numéricos
  for I := 1 to Length(Numero) do
  begin
    if CharInSet(Numero[I], ['0'..'9']) then
      FormattedNumber := FormattedNumber + Numero[I];
  end;
  NumeroLength := Length(FormattedNumber);
  // Extração de partes do número baseado no comprimento
  case NumeroLength of
    8:
      NumeroFinal := FormattedNumber; // Somente o número
    9:
      begin
        if StrToIntDef(DDD, 0) <= 35 then
          NumeroFinal := FormattedNumber // nono dígito + número
        else
          NumeroFinal := Copy(FormattedNumber, 2, 8); // Removendo o nono dígito
      end;
    10:
      begin
        // DDD + número
        DDD := Copy(FormattedNumber, 1, 2);
        if StrToIntDef(DDD, 0) >= 35 then
          NumeroFinal := Copy(FormattedNumber, 3, 8)
        else
          NumeroFinal := '9' + Copy(FormattedNumber, 3, 8); // Adicionando nono dígito
      end;
    11:
      begin
        // DDD + nono dígito + número
        DDD := Copy(FormattedNumber, 1, 2);
        NumeroFinal := Copy(FormattedNumber, 3, 9);
      end;
    12:
      begin
        // Código do país + DDD + número
        DDD := Copy(FormattedNumber, 3, 2);
        if StrToIntDef(DDD, 0) >= 35 then
          NumeroFinal := Copy(FormattedNumber, 5, 8)
        else
          NumeroFinal := '9' + Copy(FormattedNumber, 5, 8); // Adicionando nono dígito
      end;
    13:
      begin
        // Código do país + DDD + nono dígito + número
        DDD := Copy(FormattedNumber, 3, 2);
        NumeroFinal := Copy(FormattedNumber, 5, 9);
      end;
  end;
  // Montar o número final
  if NumeroFinal <> '' then
    Result := FCodigoPais + DDD + NumeroFinal
  else
    Result := FormattedNumber;
end;

function TApiEuAtendo.SaveImageFromURLToDisk(const ImageURL, NumeroContato: string): string;
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

procedure TApiEuAtendo.ObterFotoPerfil(Numero: string; SalvarNoDisco: Boolean);
begin
  TThread.CreateAnonymousThread(
    procedure
    var
      HTTP: TIdHTTP;
      SSL: TIdSSLIOHandlerSocketOpenSSL;
      JSONToSend, ResponseJSON: TJSONObject;
      ResponseStr, FilePath: string;
      PostDataStream: TStringStream;
      ResultData: TFotoPerfilResponse;
    begin
      try
        Numero := FormatPhoneNumber(Numero);
        HTTP := TIdHTTP.Create(nil);
        SSL := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
        SSL.SSLOptions.SSLVersions := [sslvTLSv1, sslvTLSv1_1, sslvTLSv1_2];
        HTTP.IOHandler := SSL;
        HTTP.Request.ContentType := 'application/json';
        HTTP.Request.CustomHeaders.AddValue('apikey', FChaveApi);

        JSONToSend := TJSONObject.Create;
        try
          JSONToSend.AddPair('number', Numero);
          PostDataStream := TStringStream.Create(JSONToSend.ToString, TEncoding.UTF8);
          try
            ResponseStr := HTTP.Post(FEvolutionApiURL + '/chat/fetchProfilePictureUrl/' + FNomeInstancia, PostDataStream);
          finally
            PostDataStream.Free;
          end;

          ResponseJSON := TJSONObject.ParseJSONValue(ResponseStr) as TJSONObject;
          try
            ResultData.WUID := ResponseJSON.GetValue<string>('wuid');
            ResultData.ProfilePictureURL := ResponseJSON.GetValue<string>('profilePictureUrl');

            if SalvarNoDisco then
              begin
               FilePath := SaveImageFromURLToDisk(ResultData.ProfilePictureURL, Numero); // Ou qualquer outro nome que você tenha dado à função
               ResultData.Filepath := FilePath;
              end;
            TThread.Queue(TThread.CurrentThread,
              procedure
              begin
                DoObterFotoPerfil(ResultData); // Você pode decidir passar FilePath também, se necessário
              end);
          finally
            ResponseJSON.Free;
          end;
        finally
          JSONToSend.Free;
        end;
      finally
        SSL.Free;
        HTTP.Free;
      end;
    end
  ).Start;
end;

procedure TApiEuAtendo.DoObterFotoPerfil(const FotoPerfilResponse: TFotoPerfilResponse);
begin
    if Assigned(FOnObterFotoPerfil) then
        FOnObterFotoPerfil(Self, FotoPerfilResponse);
end;

procedure TApiEuAtendo.DoObterGrupos(const Grupos: TGrupos);
begin
  if Assigned(FOnObterGrupos) then
    FOnObterGrupos(Self, Grupos);
end;

procedure TApiEuAtendo.DoStatusInstancia(const InstanceStatus: TInstanceStatus);
begin
  if Assigned(FOnStatusInstancia) then
    FOnStatusInstancia(Self, InstanceStatus);
end;

procedure TApiEuAtendo.DoCriarInstancia(const InstanceResponse: TInstanceResponse);
begin
  if Assigned(FOnCriarInstancia) then
    FOnCriarInstancia(Self, InstanceResponse);
end;


procedure TApiEuAtendo.DoObterQrCode(const Base64QRCode: string);
begin
  if Assigned(FOnObterQrCode) then
    FOnObterQrCode(Self, Base64QRCode);
end;

constructor TApiEuAtendo.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FCodigoPais := '55'; // valor padrão
  FdddPadrao := '99';
end;

function TApiEuAtendo.DetectFileType(const filePath: string): string;
var
  fileExt: string;
begin
  // Extrai a extensão do arquivo a partir do caminho do arquivo
  fileExt := LowerCase(ExtractFileExt(filePath));

  // Verifica a extensão e associa a um tipo
  if (fileExt = '.pdf') or (fileExt = '.doc') or (fileExt = '.docx') or (fileExt = '.txt') or (fileExt = '.xls') or (fileExt = '.xlsx') then
    Result := 'document'
  else if (fileExt = '.jpg') or (fileExt = '.jpeg') or (fileExt = '.png') or (fileExt = '.webp') or (fileExt = '.gif') or (fileExt = '.bmp') then
    Result := 'image'
  else if (fileExt = '.mp3') or (fileExt = '.wav') or (fileExt = '.ogg') then
    Result := 'audio'
  else if (fileExt = '.zip') or (fileExt = '.rar') then
    Result := 'document'
  else
    Result := 'document'; // na duvida vamos enviar como documento
end;

function CleanInvalidBase64Chars(const Base64Str: string): string;
var
  I: Integer;
begin
  Result := '';
  for I := 1 to Length(Base64Str) do
  begin
    // Adiciona ao resultado apenas se for um caractere válido em Base64
    if Base64Str[I] in ['A'..'Z', 'a'..'z', '0'..'9', '+', '/', '='] then
      Result := Result + Base64Str[I];
  end;
end;

function TApiEuAtendo.EnviarMensagemDeBase64(NumeroTelefone, MediaCaption, base64,tipoArquivo,nomeArquivo: string): string;
var
  HTTP: TIdHTTP;
  SSL: TIdSSLIOHandlerSocketOpenSSL;
  JSONToSend: TJSONObject;
  OptionsJSON, MediaMessageJSON: TJSONObject;
  PostDataStream: TStringStream;
  Response: string;
  Base64Str, FileName: string;
  ResponseJSON, KeyJSON: TJSONObject;
begin
  Result := '';  // Assume failure by default
  NumeroTelefone := FormatPhoneNumber(NumeroTelefone);
  HTTP := TIdHTTP.Create(nil);
  SSL := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  Base64Str := CleanInvalidBase64Chars(base64);
  FileName := nomeArquivo;
  try
    SSL.SSLOptions.SSLVersions := [sslvTLSv1, sslvTLSv1_1, sslvTLSv1_2];
    HTTP.IOHandler := SSL;
    HTTP.Request.ContentType := 'application/json';
    HTTP.Request.CustomHeaders.AddValue('apikey', FChaveApi);
    JSONToSend := TJSONObject.Create;
    try
      JSONToSend.AddPair('number', NumeroTelefone);
      OptionsJSON := TJSONObject.Create;
      OptionsJSON.AddPair('delay', TJSONNumber.Create(1200));
      OptionsJSON.AddPair('presence', 'composing');
      JSONToSend.AddPair('options', OptionsJSON);
      MediaMessageJSON := TJSONObject.Create;
      MediaMessageJSON.AddPair('mediatype', TipoArquivo);
      MediaMessageJSON.AddPair('fileName', FileName);
      MediaMessageJSON.AddPair('caption', MediaCaption);
      MediaMessageJSON.AddPair('media', Base64Str);
      JSONToSend.AddPair('mediaMessage', MediaMessageJSON);
      PostDataStream := TStringStream.Create(JSONToSend.ToString, TEncoding.UTF8);
      try
        Response := HTTP.Post(FEvolutionApiURL + '/message/sendMedia/' + FNomeInstancia, PostDataStream);
        // Analisar a resposta JSON e extrair o ID da mensagem
        ResponseJSON := TJSONObject.ParseJSONValue(Response) as TJSONObject;
        try
          if ResponseJSON.TryGetValue('key', KeyJSON) then
          begin
            Result := KeyJSON.GetValue<string>('id');
          end;
        finally
          ResponseJSON.Free;
        end;
      finally
        PostDataStream.Free;
      end;
    finally
      JSONToSend.Free;
    end;
  finally
    SSL.Free;
    HTTP.Free;
  end;

end;

function TApiEuAtendo.EnviarMensagemDeMidia(NumeroTelefone, Mensagem, MediaCaption, caminho_arquivo: string): string;
var
  HTTP: TIdHTTP;
  SSL: TIdSSLIOHandlerSocketOpenSSL;
  JSONToSend: TJSONObject;
  OptionsJSON, MediaMessageJSON: TJSONObject;
  PostDataStream: TStringStream;
  Response: string;
  Base64Str, FileName, TipoArquivo: string;
  ResponseJSON, KeyJSON: TJSONObject;
begin
  Result := '';  // Assume failure by default
  NumeroTelefone := FormatPhoneNumber(NumeroTelefone);
  HTTP := TIdHTTP.Create(nil);
  SSL := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  TipoArquivo := DetectFileType(caminho_arquivo);
  Base64Str := FileToBase64(caminho_arquivo);
  FileName := ExtractFileName(caminho_arquivo);
  try
    SSL.SSLOptions.SSLVersions := [sslvTLSv1, sslvTLSv1_1, sslvTLSv1_2];
    HTTP.IOHandler := SSL;
    HTTP.Request.ContentType := 'application/json';
    HTTP.Request.CustomHeaders.AddValue('apikey', FChaveApi);
    JSONToSend := TJSONObject.Create;
    try
      JSONToSend.AddPair('number', NumeroTelefone);
      OptionsJSON := TJSONObject.Create;
      OptionsJSON.AddPair('delay', TJSONNumber.Create(1200));
      OptionsJSON.AddPair('presence', 'composing');
      JSONToSend.AddPair('options', OptionsJSON);
      MediaMessageJSON := TJSONObject.Create;
      MediaMessageJSON.AddPair('mediatype', TipoArquivo);
      MediaMessageJSON.AddPair('fileName', FileName);
      MediaMessageJSON.AddPair('caption', MediaCaption);
      MediaMessageJSON.AddPair('media', Base64Str);
      JSONToSend.AddPair('mediaMessage', MediaMessageJSON);
      PostDataStream := TStringStream.Create(JSONToSend.ToString, TEncoding.UTF8);
      try
        Response := HTTP.Post(FEvolutionApiURL + '/message/sendMedia/' + FNomeInstancia, PostDataStream);
        // Analisar a resposta JSON e extrair o ID da mensagem
        ResponseJSON := TJSONObject.ParseJSONValue(Response) as TJSONObject;
        try
          if ResponseJSON.TryGetValue('key', KeyJSON) then
          begin
            Result := KeyJSON.GetValue<string>('id');
          end;
        finally
          ResponseJSON.Free;
        end;
      finally
        PostDataStream.Free;
      end;
    finally
      JSONToSend.Free;
    end;
  finally
    SSL.Free;
    HTTP.Free;
  end;
end;

function TApiEuAtendo.FileToBase64(const FileName: string): string;
var
  InputStream: TFileStream;
  Bytes: TBytes;
  base64:String;
begin
  Result := '';
  if not FileExists(FileName) then
    Exit;

  InputStream := TFileStream.Create(FileName, fmOpenRead or fmShareDenyWrite);
  try
    SetLength(Bytes, InputStream.Size);
    InputStream.Read(Bytes[0], InputStream.Size);
    base64 := TNetEncoding.Base64.EncodeBytesToString(Bytes);
    base64 := CleanInvalidBase64Chars(base64);
    Result := base64;
  finally
    InputStream.Free;
  end;
end;

function TApiEuAtendo.StatusDaMensagem(idMensagem: string): string;
var
  HTTP: TIdHTTP;
  SSL: TIdSSLIOHandlerSocketOpenSSL;
  JSONToSend, WhereJSON: TJSONObject;
  PostDataStream: TStringStream;
  Response: string;
  ResponseJSON: TJSONArray;
  MessageStatusJSON: TJSONObject;
begin
  Result := '';  // Assume failure by default
  HTTP := TIdHTTP.Create(nil);
  SSL := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  try
    SSL.SSLOptions.SSLVersions := [sslvTLSv1, sslvTLSv1_1, sslvTLSv1_2];
    HTTP.IOHandler := SSL;
    HTTP.Request.ContentType := 'application/json';
    HTTP.Request.CustomHeaders.AddValue('apikey', FChaveApi);
    JSONToSend := TJSONObject.Create;
    try
      WhereJSON := TJSONObject.Create;
      WhereJSON.AddPair('id', idMensagem);
      JSONToSend.AddPair('where', WhereJSON);
      PostDataStream := TStringStream.Create(JSONToSend.ToString, TEncoding.UTF8);
      try
        Response := HTTP.Post(FEvolutionApiURL + '/chat/findStatusMessage/' + FNomeInstancia, PostDataStream);
        // Analisar a resposta JSON e extrair o status da mensagem
        ResponseJSON := TJSONObject.ParseJSONValue(Response) as TJSONArray;
        try
          if (ResponseJSON.Count > 0) and (ResponseJSON.Items[0] is TJSONObject) then
          begin
            MessageStatusJSON := ResponseJSON.Items[0] as TJSONObject;
            Result := MessageStatusJSON.GetValue<string>('status');
          end;
        finally
          ResponseJSON.Free;
        end;
      finally
        PostDataStream.Free;
      end;
    finally
      JSONToSend.Free;
    end;
  finally
    SSL.Free;
    HTTP.Free;
  end;
end;

function TApiEuAtendo.EnviarMensagemDeTexto(NumeroTelefone, Mensagem: string): string;
var
  HTTP: TIdHTTP;
  SSL: TIdSSLIOHandlerSocketOpenSSL;
  JSONToSend: TJSONObject;
  TextMessageJSON, OptionsJSON: TJSONObject;
  PostDataStream: TStringStream;
  Response: string;
  ResponseJSON, KeyJSON: TJSONObject;
begin
  Result := '';  // Assume failure by default
  HTTP := TIdHTTP.Create(nil);
  SSL := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  NumeroTelefone := FormatPhoneNumber(NumeroTelefone);
  try
     SSL.SSLOptions.SSLVersions := [sslvTLSv1, sslvTLSv1_1, sslvTLSv1_2];
    HTTP.IOHandler := SSL;
    HTTP.Request.ContentType := 'application/json';
    HTTP.Request.CustomHeaders.AddValue('apikey', FChaveApi);
    JSONToSend := TJSONObject.Create;
    try
      JSONToSend.AddPair('number', NumeroTelefone);
      TextMessageJSON := TJSONObject.Create;
      TextMessageJSON.AddPair('text', Mensagem);
      JSONToSend.AddPair('textMessage', TextMessageJSON);
      OptionsJSON := TJSONObject.Create;
      OptionsJSON.AddPair('delay', TJSONNumber.Create(1200));
      JSONToSend.AddPair('options', OptionsJSON);
      PostDataStream := TStringStream.Create(JSONToSend.ToString, TEncoding.UTF8);
      try
        Response := HTTP.Post(FEvolutionApiURL + '/message/sendText/' + FNomeInstancia, PostDataStream);
        // Analisar a resposta JSON e extrair o ID da mensagem
        ResponseJSON := TJSONObject.ParseJSONValue(Response) as TJSONObject;
        try
          if ResponseJSON.TryGetValue('key', KeyJSON) then
          begin
            Result := KeyJSON.GetValue<string>('id');
          end;
        finally
          ResponseJSON.Free;
        end;
      finally
        PostDataStream.Free;
      end;
    finally
      JSONToSend.Free;
    end;
  finally
    SSL.Free;
    HTTP.Free;
  end;
end;

function TApiEuAtendo.CriarInstancia(out ErrorMsg: string): Boolean;
var
  HTTP: TIdHTTP;
  SSL: TIdSSLIOHandlerSocketOpenSSL;
  JSONToSend, ResponseJSON, InstanceJSON, HashJSON, ProxyJSON: TJSONObject;
  JSONString: string;
  ResponseStr: string;
  PostDataStream: TStringStream;
  ResultData: TInstanceResponse;
begin
  Result := False;
  ErrorMsg := '';

  // Inicializa o ResultData com valores padrão
  FillChar(ResultData, SizeOf(ResultData), 0);

  if FNomeInstancia = '' then
  begin
    ErrorMsg := 'Nome da Instância não pode ser vazio.';
    Exit(False);
  end;
  if FGlobalAPI = '' then
  begin
    ErrorMsg := 'Chave API Global não pode ser vazia.';
    Exit(False);
  end;

  HTTP := TIdHTTP.Create(nil);
  SSL := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  JSONToSend := TJSONObject.Create;
  ProxyJSON := TJSONObject.Create;
  ResponseJSON := nil;
  try
    SSL.SSLOptions.SSLVersions := [sslvTLSv1, sslvTLSv1_1, sslvTLSv1_2];
    HTTP.IOHandler := SSL;
    HTTP.Request.ContentType := 'application/json';
    HTTP.Request.CustomHeaders.AddValue('apikey', FGlobalAPI);

    JSONToSend.AddPair('instanceName', FNomeInstancia);
    JSONToSend.AddPair('apikey', FChaveApi);
    JSONToSend.AddPair('token', FChaveApi);
    //{$IFDEF VER340 }
    JSONToSend.AddPair('groups_ignore', VariantToJSON(false));
    //{$ENDIF}

    if (FUrlTypebot <> '') and (FNomeTypeBot <> '') then
    begin
      JSONToSend.AddPair('typebot_url', FUrlTypebot);
      JSONToSend.AddPair('typebot', FNomeTypeBot);
      JSONToSend.AddPair('typebot_expire', '60');
      JSONToSend.AddPair('typebot_keyword_finish', '#SAIR');
      JSONToSend.AddPair('typebot_delay_message', '1000');
      JSONToSend.AddPair('typebot_unknown_message', FTypeBotMensagemNaoEntendeu);
    end;

    // Armazenar o JSON em uma variável string para análise
    JSONString := JSONToSend.ToString;

    // Use JSONString para enviar via HTTP
    PostDataStream := TStringStream.Create(JSONString, TEncoding.UTF8);
    try
      try
        ResponseStr := HTTP.Post(FEvolutionApiURL + '/instance/create', PostDataStream);
        ResponseJSON := TJSONObject.ParseJSONValue(ResponseStr) as TJSONObject;
        if Assigned(ResponseJSON) then
        begin
          InstanceJSON := ResponseJSON.Values['instance'] as TJSONObject;
          HashJSON := ResponseJSON.Values['hash'] as TJSONObject;
          ResultData.InstanceName := InstanceJSON.Values['instanceName'].Value;
          ResultData.Status := InstanceJSON.Values['status'].Value;
          ResultData.ApiKey := HashJSON.Values['apikey'].Value;
          FChaveApi := ResultData.ApiKey;
          DoCriarInstancia(ResultData);
          Result := True;
        end
        else
        begin
          ErrorMsg := 'Resposta JSON inválida recebida.';
          Result := False;
        end;
      except
        on E: EIdHTTPProtocolException do
        begin
          ResponseStr := E.ErrorMessage;
          ResponseJSON := TJSONObject.ParseJSONValue(ResponseStr) as TJSONObject;
          if Assigned(ResponseJSON) and (ResponseJSON.Values['response'] is TJSONObject) then
          begin
            if (ResponseJSON.Values['response'] as TJSONObject).Values['message'] is TJSONArray then
              ErrorMsg := ((ResponseJSON.Values['response'] as TJSONObject).Values['message'] as TJSONArray).Items[0].Value
            else
              ErrorMsg := E.ErrorMessage;
          end
          else
          begin
            ErrorMsg := E.ErrorMessage;
          end;
          Result := False;
        end;
        on E: Exception do
        begin
          ErrorMsg := 'Erro ao criar a instância: ' + E.Message;
          Result := False;
        end;
      end;
    finally
      PostDataStream.Free;
    end;
  finally
    ProxyJSON.Free;
   // if Assigned(JSONToSend) then
   //   JSONToSend.Free;
   // if Assigned(ResponseJSON) then
    //  ResponseJSON.Free;
   // SSL.Free;
    //HTTP.Free;
  end;
end;


function TApiEuAtendo.AlterarPropriedadesInstancia(rejeitarLigacao,ignorarGrupos,sempreOnline,lerMensagens,lerStatus : Boolean;mensagemRejeitaLigacao:String; out ErrorMsg: string): Boolean;
var
  HTTP: TIdHTTP;
  SSL: TIdSSLIOHandlerSocketOpenSSL;
  JSONToSend, ResponseJSON, InstanceJSON, HashJSON, ProxyJSON: TJSONObject;
  JSONString: string;
  ResponseStr: string;
  PostDataStream: TStringStream;
  ResultData: TInstanceResponse;
begin
  Result := False;
  ErrorMsg := '';

   HTTP := TIdHTTP.Create(nil);
  SSL := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  JSONToSend := TJSONObject.Create;
  ProxyJSON := TJSONObject.Create;
  ResponseJSON := nil;
  try
    SSL.SSLOptions.SSLVersions := [sslvTLSv1, sslvTLSv1_1, sslvTLSv1_2];
    HTTP.IOHandler := SSL;
    HTTP.Request.ContentType := 'application/json';
    HTTP.Request.CustomHeaders.AddValue('apikey', FGlobalAPI);

    //{$IFDEF VER340 }
    JSONToSend.AddPair('reject_call', VariantToJSON(rejeitarLigacao));
    JSONToSend.AddPair('groups_ignore', VariantToJSON(ignorarGrupos));
    JSONToSend.AddPair('always_online', VariantToJSON(sempreOnline));
    JSONToSend.AddPair('read_messages', VariantToJSON(lerMensagens));
    JSONToSend.AddPair('read_status', VariantToJSON(lerStatus));
    JSONToSend.AddPair('sync_full_history', VariantToJSON(false));
    //{$ENDIF}


    JSONToSend.AddPair('msg_call', mensagemRejeitaLigacao);


    // Armazenar o JSON em uma variável string para análise
    JSONString := JSONToSend.ToString;

    // Use JSONString para enviar via HTTP
    PostDataStream := TStringStream.Create(JSONString, TEncoding.UTF8);
    try
      try
        ResponseStr := HTTP.Post(FEvolutionApiURL + '/settings/set/' + FNomeInstancia, PostDataStream);
        ResponseJSON := TJSONObject.ParseJSONValue(ResponseStr) as TJSONObject;
        if Assigned(ResponseJSON) then
        begin
          Result := True;
        end
        else
        begin
          ErrorMsg := 'Resposta JSON inválida recebida.';
          Result := False;
        end;
      except
        on E: EIdHTTPProtocolException do
        begin
          ResponseStr := E.ErrorMessage;
          ResponseJSON := TJSONObject.ParseJSONValue(ResponseStr) as TJSONObject;
          if Assigned(ResponseJSON) and (ResponseJSON.Values['response'] is TJSONObject) then
          begin
            if (ResponseJSON.Values['response'] as TJSONObject).Values['message'] is TJSONArray then
              ErrorMsg := ((ResponseJSON.Values['response'] as TJSONObject).Values['message'] as TJSONArray).Items[0].Value
            else
              ErrorMsg := E.ErrorMessage;
          end
          else
          begin
            ErrorMsg := E.ErrorMessage;
          end;
          Result := False;
        end;
        on E: Exception do
        begin
          ErrorMsg := 'Erro ao criar a instância: ' + E.Message;
          Result := False;
        end;
      end;
    finally
      PostDataStream.Free;
    end;
  finally
    ProxyJSON.Free;
   // if Assigned(JSONToSend) then
   //   JSONToSend.Free;
   // if Assigned(ResponseJSON) then
    //  ResponseJSON.Free;
   // SSL.Free;
    //HTTP.Free;
  end;
end;



function TApiEuAtendo.ObterDadosContato(const ContactID: string; out ErroMsg: string): TContato;
var
  IdHTTP: TIdHTTP;
  SSLHandler: TIdSSLIOHandlerSocketOpenSSL;
  JSONToSend, JSONObject: TJSONObject;
  JSONArray: TJSONObject;
  StringStream: TStringStream;
  ResponseStr: string;
  URL: string;
  Contato: TContato;
  numero:String;
begin
  // Inicializar valores padrão
  Contato.fone := '';
  Contato.Nome := '';
  ErroMsg := '';
  IdHTTP := TIdHTTP.Create(nil);
  SSLHandler := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  JSONToSend := TJSONObject.Create;
  JSONArray := nil;
  try
    IdHTTP.IOHandler := SSLHandler;
    SSLHandler.SSLOptions.SSLVersions := [sslvTLSv1, sslvTLSv1_1, sslvTLSv1_2];
    IdHTTP.Request.ContentType := 'application/json';
    IdHTTP.Request.CustomHeaders.Values['User-Agent'] := 'insomnia/2023.5.8';
    IdHTTP.Request.CustomHeaders.Values['apikey'] := FChaveApi;
    numero := FormatPhoneNumber(ContactID);
    // Construindo o JSON de envio
    JSONToSend.AddPair('number', numero + '@s.whatsapp.net');
    // Convertendo JSON para string
    StringStream := TStringStream.Create(JSONToSend.ToString, TEncoding.UTF8);
    // URL de requisição
    URL := FEvolutionApiURL + '/chat/fetchProfile/' + FNomeInstancia;
    try
      try
        // Enviando a requisição POST e obtendo a resposta
        ResponseStr := IdHTTP.Post(URL, StringStream);
        // Convertendo a resposta para JSON
        JSONArray := TJSONObject.ParseJSONValue(ResponseStr) as TJSONObject; //TJSONObject.ParseJSONValue(ResponseStr) as TJSONArray;
        if Assigned(JSONArray) and (JSONArray.Count > 0) then
        begin
          // Pegando o primeiro objeto do array
          JSONObject := JSONArray as TJSONObject;
          // Extraindo os valores
          Contato.fone := JSONObject.GetValue<string>('wuid');
          Contato.Nome := JSONObject.GetValue<string>('description');
          Contato.foto := JSONObject.GetValue<string>('picture');
        end;
      except
        on E: EIdHTTPProtocolException do
        begin
          ResponseStr := E.ErrorMessage;
          ErroMsg := 'Erro ao obter dados do contato: ' + ResponseStr;
        end;
        on E: Exception do
        begin
          ErroMsg := 'Erro ao obter dados do contato: ' + E.Message;
        end;
      end;
    finally
      StringStream.Free;
    end;
  finally
    JSONToSend.Free;
    if Assigned(JSONArray) then
      JSONArray.Free;
    SSLHandler.Free;
    IdHTTP.Free;
  end;
  Result := Contato;
end;

function TApiEuAtendo.ExistWhats(NumeroTelefone: string; out ErroMsg: string): Boolean;
var
  HTTP: TIdHTTP;
  SSL: TIdSSLIOHandlerSocketOpenSSL;
  JSONToSend: TJSONObject;
  NumbersArray: TJSONArray;
  PostDataStream: TStringStream;
  ResponseStr: string;
  ResponseJSONArray: TJSONArray;
  ResponseItem: TJSONObject;
begin
  Result := False;  // Assume failure by default
  ErroMsg := '';    // Initialize error message
  HTTP := TIdHTTP.Create(nil);
  SSL := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  JSONToSend := TJSONObject.Create;
  NumbersArray := TJSONArray.Create;
  ResponseJSONArray := nil;
  try
    NumeroTelefone := FormatPhoneNumber(NumeroTelefone);
    SSL.SSLOptions.SSLVersions := [sslvTLSv1, sslvTLSv1_1, sslvTLSv1_2];
    HTTP.IOHandler := SSL;
    HTTP.Request.ContentType := 'application/json';
    HTTP.Request.CustomHeaders.AddValue('apikey', FChaveApi);

    NumbersArray.Add(NumeroTelefone);
    JSONToSend.AddPair('numbers', NumbersArray);

    PostDataStream := TStringStream.Create(JSONToSend.ToString, TEncoding.UTF8);
    try
      try
        ResponseStr := HTTP.Post(FEvolutionApiURL + '/chat/whatsappNumbers/' + FNomeInstancia, PostDataStream);
        ResponseJSONArray := TJSONObject.ParseJSONValue(ResponseStr) as TJSONArray;
        if Assigned(ResponseJSONArray) and (ResponseJSONArray.Count > 0) then
        begin
          ResponseItem := ResponseJSONArray.Items[0] as TJSONObject;
          Result := ResponseItem.GetValue<Boolean>('exists');
        end;
      except
        on E: EIdHTTPProtocolException do
        begin
          ResponseStr := E.ErrorMessage;
          ErroMsg := 'Erro ao verificar número: ' + ResponseStr;
        end;
        on E: Exception do
        begin
          ErroMsg := 'Erro ao verificar número: ' + E.Message;
        end;
      end;
    finally
      PostDataStream.Free;
    end;
  finally
    NumbersArray.Free;
    //JSONToSend.Free;
    if Assigned(ResponseJSONArray) then
      ResponseJSONArray.Free;
    SSL.Free;
    HTTP.Free;
  end;
end;

function TApiEuAtendo.SendMessageGhostMentionToGroup(const GroupID, MessageText: string; out ErroMsg: string): Boolean;
var
  HTTP: TIdHTTP;
  SSL: TIdSSLIOHandlerSocketOpenSSL;
  JSONToSend, JsonOptions, JsonTextMessage: TJSONObject;
  PostDataStream: TStringStream;
  ResponseStr: string;
begin
  Result := False;  // Assume failure by default
  ErroMsg := '';    // Initialize error message
  HTTP := TIdHTTP.Create(nil);
  SSL := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  JSONToSend := TJSONObject.Create;
  JsonOptions := TJSONObject.Create;
  JsonTextMessage := TJSONObject.Create;
  try
    // Configurações SSL
    SSL.SSLOptions.SSLVersions := [sslvTLSv1, sslvTLSv1_1, sslvTLSv1_2];
    HTTP.IOHandler := SSL;
    HTTP.Request.ContentType := 'application/json';
    HTTP.Request.CustomHeaders.AddValue('apikey', FChaveApi);

    // Criação do JSON para envio
    JsonOptions.AddPair('delay', TJSONNumber.Create(1200));
    JsonOptions.AddPair('presence', 'composing');
    JsonOptions.AddPair('mentions', TJSONObject.Create.AddPair('everyOne', TJSONBool.Create(True)));

    JsonTextMessage.AddPair('text', MessageText);

    JSONToSend.AddPair('number', GroupID);
    JSONToSend.AddPair('options', JsonOptions);
    JSONToSend.AddPair('textMessage', JsonTextMessage);

    PostDataStream := TStringStream.Create(JSONToSend.ToString, TEncoding.UTF8);
    try
     // try
        // Enviando a requisição POST
        ResponseStr := HTTP.Post(FEvolutionApiURL + '/message/sendText/' + FNomeInstancia, PostDataStream);
        Result := True;  // Sucesso
//      except
//        on E: EIdHTTPProtocolException do
//        begin
//          ResponseStr := E.ErrorMessage;
//          ErroMsg := 'Erro ao enviar mensagem: ' + ResponseStr;
//        end;
//        on E: Exception do
//        begin
//          ErroMsg := 'Erro ao enviar mensagem: ' + E.Message;
//        end;
//      end;
    finally
//      PostDataStream.Free;
    end;
  finally
    JsonTextMessage.Free;
    JsonOptions.Free;
    SSL.Free;
    HTTP.Free;
  end;
end;


function TApiEuAtendo.DeletarInstancia(nomeInstancia: string): Boolean;
var
  HTTP: TIdHTTP;
  SSL: TIdSSLIOHandlerSocketOpenSSL;
  ResponseStr: string;
begin
  Result := False;  // Assume failure by default
  HTTP := TIdHTTP.Create(nil);
  SSL := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  try
    SSL.SSLOptions.SSLVersions := [sslvTLSv1, sslvTLSv1_1, sslvTLSv1_2];
    HTTP.IOHandler := SSL;
    HTTP.Request.CustomHeaders.AddValue('apikey', FGlobalAPI);
    try
      ResponseStr := HTTP.Delete(FEvolutionApiURL + '/instance/delete/' + nomeInstancia);
      Result := HTTP.ResponseCode = 200;  // Assume success if HTTP response code is 200
    except
      on E: Exception do
        Result := False;  // On exception, assume failure
    end;
  finally
    SSL.Free;
    HTTP.Free;
  end;
end;


function TApiEuAtendo.DeslogarInstancia(): Boolean;
var
  HTTP: TIdHTTP;
  SSL: TIdSSLIOHandlerSocketOpenSSL;
  ResponseStr: string;
begin
  Result := False;  // Assume failure by default
  HTTP := TIdHTTP.Create(nil);
  SSL := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  try
    SSL.SSLOptions.SSLVersions := [sslvTLSv1, sslvTLSv1_1, sslvTLSv1_2];
    HTTP.IOHandler := SSL;
    HTTP.Request.CustomHeaders.AddValue('apikey', FGlobalAPI);
    try
      ResponseStr := HTTP.Delete(FEvolutionApiURL + '/instance/logout/' + NomeInstancia);
      Result := HTTP.ResponseCode = 200;  // Assume success if HTTP response code is 200
    except
      on E: Exception do
        Result := False;  // On exception, assume failure
    end;
  finally
    SSL.Free;
    HTTP.Free;
  end;
end;

function TApiEuAtendo.ReiniciarInstancia(): Boolean;
var
  HTTP: TIdHTTP;
  SSL: TIdSSLIOHandlerSocketOpenSSL;
  ResponseStr: string;
begin
  Result := False;  // Assume failure by default
  HTTP := TIdHTTP.Create(nil);
  SSL := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  try
    SSL.SSLOptions.SSLVersions := [sslvTLSv1, sslvTLSv1_1, sslvTLSv1_2];
    HTTP.IOHandler := SSL;
    HTTP.Request.CustomHeaders.AddValue('apikey', FGlobalAPI);
    try
      ResponseStr := HTTP.Put(FEvolutionApiURL + '/instance/restart/' + NomeInstancia, TStringStream.Create(''));
      Result := HTTP.ResponseCode = 200;  // Assume success if HTTP response code is 200
    except
      on E: Exception do
        Result := False;  // On exception, assume failure
    end;
  finally
    SSL.Free;
    HTTP.Free;
  end;
end;



function TApiEuAtendo.StatusInstancia(): TInstanceStatus;
var
  HTTP: TIdHTTP;
  SSL: TIdSSLIOHandlerSocketOpenSSL;
  ResponseStr: string;
  ResponseJSON, InstanceJSON: TJSONObject;
  StatusData: TInstanceStatus;
begin
  HTTP := TIdHTTP.Create(nil);
  SSL := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  try
    SSL.SSLOptions.SSLVersions := [sslvTLSv1, sslvTLSv1_1, sslvTLSv1_2];
    HTTP.IOHandler := SSL;
    HTTP.Request.CustomHeaders.AddValue('apikey', FChaveApi);
    ResponseStr := HTTP.Get(FEvolutionApiURL + '/instance/connectionState/' + FNomeInstancia);
    ResponseJSON := TJSONObject.ParseJSONValue(ResponseStr) as TJSONObject;
    try
      InstanceJSON := ResponseJSON.GetValue<TJSONObject>('instance');
      StatusData.InstanceName := InstanceJSON.GetValue<string>('instanceName');
      StatusData.State := InstanceJSON.GetValue<string>('state');
      DoStatusInstancia(StatusData);
    finally
      ResponseJSON.Free;
    end;
  finally
    SSL.Free;
    HTTP.Free;
  end;
  Result := StatusData;
end;

procedure TApiEuAtendo.ObterQrCode();
var
  MyThread: TThread;
begin
  MyThread := TThread.CreateAnonymousThread(
    procedure
    var
      HTTP: TIdHTTP;
      SSL: TIdSSLIOHandlerSocketOpenSSL;
      ResponseStr: string;
      ResponseJSON: TJSONObject;
      Base64: string;
    begin
      HTTP := TIdHTTP.Create(nil);
      SSL := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
      try
        SSL.SSLOptions.SSLVersions := [sslvTLSv1, sslvTLSv1_1, sslvTLSv1_2];
        HTTP.IOHandler := SSL;
        HTTP.Request.CustomHeaders.AddValue('apikey', FChaveApi);
        ResponseStr := HTTP.Get(FEvolutionApiURL + '/instance/connect/' + FNomeInstancia);
        ResponseJSON := TJSONObject.ParseJSONValue(ResponseStr) as TJSONObject;
        try
          Base64 := ResponseJSON.GetValue<string>('base64');
          DoObterQrCode(Base64);
        finally
          ResponseJSON.Free;
        end;
      finally
        SSL.Free;
        HTTP.Free;
      end;

    end);
  MyThread.Start;
end;

function TApiEuAtendo.EnviarLista(NumeroTelefone, Titulo, Descricao, TextoBotao, TextoRodape: string; Secoes: TJSONArray): Boolean;
var
  HTTP: TIdHTTP;
  SSL: TIdSSLIOHandlerSocketOpenSSL;
  JSONToSend, OptionsJSON, ListMessageJSON: TJSONObject;
  PostDataStream: TStringStream;
  Response: string;
begin
  Result := False;  // Assume failure by default
  NumeroTelefone := FormatPhoneNumber(NumeroTelefone);
  HTTP := TIdHTTP.Create(nil);
  SSL := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  try
    SSL.SSLOptions.SSLVersions := [sslvTLSv1, sslvTLSv1_1, sslvTLSv1_2];
    HTTP.IOHandler := SSL;
    HTTP.Request.ContentType := 'application/json';
    HTTP.Request.CustomHeaders.AddValue('apikey', FChaveApi);
    JSONToSend := TJSONObject.Create;
    try
      JSONToSend.AddPair('number', NumeroTelefone);
      OptionsJSON := TJSONObject.Create;
      OptionsJSON.AddPair('delay', TJSONNumber.Create(1200));
      OptionsJSON.AddPair('presence', 'composing');
      JSONToSend.AddPair('options', OptionsJSON);
      ListMessageJSON := TJSONObject.Create;
      ListMessageJSON.AddPair('title', Titulo);
      ListMessageJSON.AddPair('description', Descricao);
      ListMessageJSON.AddPair('buttonText', TextoBotao);
      ListMessageJSON.AddPair('footerText', TextoRodape);
      ListMessageJSON.AddPair('sections', Secoes);
      JSONToSend.AddPair('listMessage', ListMessageJSON);
      PostDataStream := TStringStream.Create(JSONToSend.ToString, TEncoding.UTF8);
      try
        Response := HTTP.Post(FEvolutionApiURL + '/message/sendList/' + FNomeInstancia, PostDataStream);
        if HTTP.ResponseCode = 201 then
          Result := True;
      finally
        PostDataStream.Free;
      end;
    finally
      JSONToSend.Free;
    end;
  finally
    SSL.Free;
    HTTP.Free;
  end;
end;


procedure Register;
begin
  RegisterComponents('EuAtendo', [TApiEuAtendo]);
end;

end.

