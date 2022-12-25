unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, sStatusBar, Vcl.Buttons,
  sSpeedButton, Vcl.Imaging.jpeg, Vcl.ExtCtrls, acImage, Vcl.StdCtrls, sLabel,
  sPanel;

type
  TForm2 = class(TForm)
    sStatusBar1: TsStatusBar;
    sPanel1: TsPanel;
    sLabelFX1: TsLabelFX;
    sLabelFX2: TsLabelFX;
    sLabelFX3: TsLabelFX;
    sLabelFX4: TsLabelFX;
    sImage1: TsImage;
    sSpeedButton1: TsSpeedButton;
    procedure sSpeedButton1Click(Sender: TObject);
    procedure sImage1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

const
shell32 = 'shell32.dll';
kernel32 = 'kernel32.dll';

Function Wow64DisableWow64FsRedirection(Var Wow64FsEnableRedirection: LongBool): LongBool; stdcall;
External kernel32 name 'Wow64DisableWow64FsRedirection';

function ShellExecuteW(hWnd: THandle; Operation, FileName, Parameters,
Directory: WideString; ShowCmd: Integer): HINST; stdcall;
external shell32 name 'ShellExecuteW';

procedure ShellExecute(hWnd: THandle; Operation, FileName, Parameters, Directory: WideString; ShowCmd: Integer);
var
WFER: LongBool;
begin
if Wow64DisableWow64FsRedirection(WFER) then
ShellExecuteW(hWnd, Operation, FileName, Parameters, Directory, ShowCmd)
else ShellExecuteW(hWnd, Operation, FileName, Parameters, Directory, ShowCmd);
end;


procedure TForm2.sImage1Click(Sender: TObject);
begin
sImage1.Picture.SaveToFile(ExtractFilePath(ParamStr(0))+'image.png');
ShellExecute(0, 'open', ExtractFilePath(ParamStr(0))+'image.png', '', '', 1);
end;

procedure TForm2.sSpeedButton1Click(Sender: TObject);
begin
Form2.Close;
end;

end.
