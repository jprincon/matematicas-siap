unit uFDataSnapMADS;

interface

uses
  Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.AppEvnts, Vcl.StdCtrls, IdHTTPWebBrokerBridge, Web.HTTPApp, Vcl.ComCtrls,
  Vcl.ExtCtrls, Vcl.Buttons, System.ImageList, Vcl.ImgList, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, Vcl.Menus;

type
  TFDataSnapMADS = class(TForm)
    ApplicationEvents1: TApplicationEvents;
    pMensajes: TPanel;
    Panel2: TPanel;
    tvMensajes: TTreeView;
    menuPrincipal: TPageControl;
    tabConexion: TTabSheet;
    iconos32: TImageList;
    Panel3: TPanel;
    Panel4: TPanel;
    sbIniciar: TSpeedButton;
    sbParar: TSpeedButton;
    Bevel1: TBevel;
    Panel5: TPanel;
    sbAbrirNavegador: TSpeedButton;
    Panel6: TPanel;
    Bevel2: TBevel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    Label1: TLabel;
    EditPort: TEdit;
    Panel10: TPanel;
    Label2: TLabel;
    edServidor: TEdit;
    Bevel3: TBevel;
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    Panel11: TPanel;
    lbDatos: TListBox;
    Panel12: TPanel;
    sbConfigurar: TSpeedButton;
    Panel13: TPanel;
    Bevel4: TBevel;
    IdHTTP1: TIdHTTP;
    PopupMenu1: TPopupMenu;
    LimpiarConsola1: TMenuItem;
    Panel14: TPanel;
    Label3: TLabel;
    edToken: TEdit;
    TrayIcon1: TTrayIcon;
    menuAplicacion: TPopupMenu;
    VerServidor1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure ApplicationEvents1Idle(Sender: TObject; var Done: Boolean);
    procedure iniciarServidor(Sender: TObject);
    procedure pararServidor(Sender: TObject);
    procedure abrirNavegador(Sender: TObject);
    procedure LimpiarConsola1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure VerServidor1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure TrayIcon1DblClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    FServer: TIdHTTPWebBrokerBridge;
    letras: array [1 .. 36] of string;

    procedure WMSysCommand(var Msg: TWMSysCommand); message WM_SYSCOMMAND;

    procedure StartServer;
    procedure generarNuevoToken;
  public
    tokenServidor: string;

    procedure escribirMensaje(Msg: string; tipo: integer);
    function obtenerToken: string;
  end;

var
  FDataSnapMADS: TFDataSnapMADS;

implementation

{$R *.dfm}

uses
  Winapi.Windows, Winapi.ShellApi, Datasnap.DSSession;

procedure TFDataSnapMADS.ApplicationEvents1Idle(Sender: TObject;
  var Done: Boolean);
begin
  sbIniciar.Enabled := not FServer.Active;
  sbParar.Enabled := FServer.Active;
  EditPort.Enabled := not FServer.Active;
end;

procedure TFDataSnapMADS.abrirNavegador(Sender: TObject);
var
  LURL: string;
begin
  StartServer;
  LURL := Format('http://localhost:%s', [EditPort.Text]);
  ShellExecute(0, nil, PChar(LURL), nil, nil, SW_SHOWNOACTIVATE);
end;

procedure TFDataSnapMADS.iniciarServidor(Sender: TObject);
begin
  StartServer;
end;

procedure TFDataSnapMADS.LimpiarConsola1Click(Sender: TObject);
begin
  tvMensajes.Items.Clear;
  escribirMensaje(obtenerToken, 2);
end;

function TFDataSnapMADS.obtenerToken: string;
begin
  Result := tokenServidor;
end;

procedure TerminateThreads;
begin
  if TDSSessionManager.Instance <> nil then
    TDSSessionManager.Instance.TerminateAllSessions;
end;

procedure TFDataSnapMADS.pararServidor(Sender: TObject);
begin
  TerminateThreads;
  FServer.Active := False;
  FServer.Bindings.Clear;
end;

procedure TFDataSnapMADS.escribirMensaje(Msg: string; tipo: integer);
begin
  with tvMensajes.Items.Add(nil, Msg) do
  begin
    ImageIndex := tipo;
    SelectedIndex := tipo;
  end;

  TrayIcon1.BalloonTitle := 'DATA SNAP SAEM';
  TrayIcon1.BalloonHint := Msg;
  TrayIcon1.BalloonFlags := bfInfo;
  TrayIcon1.ShowBalloonHint;
end;

procedure TFDataSnapMADS.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := MessageDlg('¿Esta seguro de cerrar el servidor?', mtConfirmation,
    [mbyes, mbno], 0) = mrYes;

  if not CanClose then
    hide;
end;

procedure TFDataSnapMADS.FormCreate(Sender: TObject);
begin
  FServer := TIdHTTPWebBrokerBridge.Create(Self);

  letras[1] := 'a';
  letras[2] := 'b';
  letras[3] := 'c';
  letras[4] := 'd';
  letras[5] := 'e';
  letras[6] := 'f';
  letras[7] := 'g';
  letras[8] := 'h';
  letras[9] := 'i';
  letras[10] := 'j';
  letras[11] := 'k';
  letras[12] := 'l';
  letras[13] := 'm';
  letras[14] := 'n';
  letras[15] := 'o';
  letras[16] := 'p';
  letras[17] := 'q';
  letras[18] := 'r';
  letras[19] := 's';
  letras[20] := 't';
  letras[21] := 'u';
  letras[22] := 'v';
  letras[23] := 'w';
  letras[24] := 'x';
  letras[25] := 'y';
  letras[26] := 'z';
  letras[27] := '0';
  letras[28] := '1';
  letras[29] := '2';
  letras[30] := '3';
  letras[31] := '4';
  letras[32] := '5';
  letras[33] := '6';
  letras[34] := '7';
  letras[35] := '8';
  letras[36] := '9';

  generarNuevoToken;

  TrayIcon1.Visible := True;
end;

procedure TFDataSnapMADS.FormResize(Sender: TObject);
begin
  if WindowState = wsMinimized then
    hide;
end;

procedure TFDataSnapMADS.FormShow(Sender: TObject);
begin
  escribirMensaje(obtenerToken, 2);
  edToken.Text := obtenerToken;
end;

procedure TFDataSnapMADS.generarNuevoToken;
var
  token: string;
  i, n: integer;
begin
  token := '';
  for i := 1 to 32 do
  begin
    n := Round(Random(36)) + 1;
    token := token + letras[n];
  end;

  tokenServidor := token;
end;

procedure TFDataSnapMADS.StartServer;
begin
  if not FServer.Active then
  begin
    FServer.Bindings.Clear;
    FServer.DefaultPort := StrToInt(EditPort.Text);
    FServer.Active := True;
  end;
end;

procedure TFDataSnapMADS.TrayIcon1DblClick(Sender: TObject);
begin
  Show;
end;

procedure TFDataSnapMADS.VerServidor1Click(Sender: TObject);
begin
  FDataSnapMADS.Show;
end;

procedure TFDataSnapMADS.WMSysCommand(var Msg: TWMSysCommand);
begin
  { if (Msg.CmdType = SC_MAXIMIZE) then
    .. .else
    if (Msg.CmdType = SC_MINIMIZE) then
    .. .else
    if (Msg.CmdType = SC_RESTORE) then
    .. .else DefaultHandler(Msg); }

  if (Msg.CmdType = SC_MINIMIZE) then
    hide
  else
    DefaultHandler(Msg);
end;

end.
