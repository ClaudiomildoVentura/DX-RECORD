unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TfrmMain = class(TForm)
    Panel1: TPanel;
    btnOk: TBitBtn;
    edtTxt: TEdit;
    Label1: TLabel;
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

procedure TfrmMain.btnOkClick(Sender: TObject);
var Arq: TextFile; // Declaração da variável do tipo arquivo texto
  I,N: Integer;
begin
  try
    // 1° Associa a variável "Arq" ao arquivo externo "x.txt"  na unidade de disco "D"
    AssignFile(Arq, 'd:\\x.txt');

    Rewrite(Arq); // 2° Cria o arquivo de texto "x.txt" na unidade de disco "D"

    N := StrToInt(edtTxt.Text); // Atribuido o valor do edit a variável "N"

    Writeln(Arq, '+---Resultado--+'); // [ 8 ] Grava uma linha no arquivo
    for I := 1 to 10 do
    begin
      Writeln(Arq, '| ', I:2, ' X ', N, ' = ', (I * N):2, '  |'); // Executa a tarefa, Grava uma linha no arquivo.
    end;
    Writeln(Arq, '+--------------+'); // [ 8 ] Grava uma linha no arquivo

    CloseFile(Arq); // [ 8 ] Fecha o arquivo contendo todo o conteudo do  Writeln() .

    MessageDlg('TXT gravado com sucesso em "d:\x.txt".', mtWarning, [mbOK], 0);
    Application.Terminate;
  except
  end;
end;

{

Resultado esperado

+---Resultado--+ 
|  1 X 7 =  7  |
|  2 X 7 = 14  |
|  3 X 7 = 21  |
|  4 X 7 = 28  |
|  5 X 7 = 35  |
|  6 X 7 = 42  |
|  7 X 7 = 49  |
|  8 X 7 = 56  |
|  9 X 7 = 63  |
| 10 X 7 = 70  |
+--------------+
}
end.
