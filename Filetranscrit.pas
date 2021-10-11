unit Filetranscrit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, XPMan, StdCtrls, ComCtrls, StrUtils;

type
  TForm1 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label1: TLabel;
    Ouvrir: TButton;
    Label2: TLabel;
    Code: TEdit;
    Button1: TButton;
    Label3: TLabel;
    TabSheet2: TTabSheet;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Label5: TLabel;
    OriginalFile: TEdit;
    Button5: TButton;
    Label6: TLabel;
    ProgressBar2: TProgressBar;
    Label4: TLabel;
    PageControl2: TPageControl;
    TabSheet3: TTabSheet;
    Memo1: TMemo;
    TabSheet4: TTabSheet;
    Memo2: TMemo;
    PageControl4: TPageControl;
    TabSheet7: TTabSheet;
    Memo3: TMemo;
    TabSheet8: TTabSheet;
    Memo4: TMemo;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    UncodeTxt: TEdit;
    CodeTxt: TEdit;
    Op1: TLabel;
    Op2: TLabel;
    Label7: TLabel;
    Edit1: TEdit;
    Label8: TLabel;
    Edit2: TEdit;
    Button6: TButton;
    Button7: TButton;
    ProgressBar1: TProgressBar;
    procedure Button7Click(Sender: TObject);
    procedure Arret2Click(Sender: TObject);
    procedure ArretClick(Sender: TObject);
    procedure initialisation(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure OuvrirClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form1: TForm1;
  quitcode, quitdecode: boolean;

implementation

{$R *.dfm}

procedure TForm1.Button3Click(Sender: TObject);
begin
 OpenDialog1.Execute;
 codeTxt.Text:=OpenDialog1.FileName;
end;

procedure TForm1.OuvrirClick(Sender: TObject);
begin
 OpenDialog1.Execute;
 UncodeTxt.Text:=OpenDialog1.FileName;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
 SaveDialog1.DefaultExt:='.rcd';
 SaveDialog1.FilterIndex:=1;
 SaveDialog1.Execute;
 Code.Text:=SaveDialog1.FileName;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
 SaveDialog1.DefaultExt:='.txt';
 SaveDialog1.FilterIndex:=2;
 SaveDialog1.Execute;
 OriginalFile.Text:=SaveDialog1.FileName;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
 S: file;
 ch: char;
 T: file of char;
 strbuff, labo: string;
 Buf: array [1..1000] of char;
 truc,passpos,passlength,txtlength,e,lus,ecrits: integer;
begin
{
 // Programme de codage
 Memo3.Text := '';
 Memo4.Text := '';
 Memo3.Lines.LoadFromFile(UncodeTxt.Text);
 AssignFile(T,Code.Text);
 Rewrite(T);
 ProgressBar1.Max := Length(Memo3.Lines.Text);
 passlength := Length(Edit1.Text);
 quitcode := true;

 For e := 0 To Length(Memo3.Lines.Text) do
 begin
  ch := Memo3.Lines.Text[e];
  txtlength := txtlength + 1;
  passpos := txtlength mod passlength;
  truc := (Integer(ch) - 50) + integer(Edit1.Text[passpos]);
  Application.ProcessMessages; //Pour ne pas donner l'aspect bloqué
  ProgressBar1.Position := ProgressBar1.Position + 1;

  //Memo3.Text := Memo3.Text + ch;
  ch := Char(truc);
  Memo4.Text := Memo4.Text + ch;
  Write(T,ch);
 end;
 ShowMessage('Processus de codage terminé.');
 CloseFile(T);
}

 // Ici on lit(par paquets,c'est plus rapide)
 AssignFile(S,UncodeTxt.Text);
 AssignFile(T,Code.Text);
 Reset(S,1);
 Rewrite(T);
 repeat
  //ShowMessage('Lecture...');
  BlockRead(S,Buf,SizeOf(buf),Lus);
  if(Lus < 1000) then
  begin
    if(Lus > 0) then
    begin
      labo := string(Buf);
      labo := LeftStr(labo,Lus);
      Strbuff := Strbuff + labo;
    end;
  end
  else
    Strbuff := Strbuff + string(Buf);

 //  Memo3.Lines.Add(Buf);
 Memo3.Lines.Add(IntToStr(Lus));
 //  Memo3.Lines.Add('--------------------------Nouvel item------------------------------');

 until (Lus=0) or (Lus<0);
 Memo3.Lines.Add(IntToStr(Length(StrBuff)));
 Memo3.Lines.Add(StrBuff);
 //Ici,on code
 passlength := Length(Edit1.Text);
 ProgressBar1.Max := Length(strbuff);
 ProgressBar1.Position := 0;
 Memo3.Text := Strbuff;

 for e := 1 to Length(StrBuff) do
  begin
   ch := StrBuff[e];
   //Memo3.Text := Memo3.Text + IntToStr(Integer(ch)) + ' ';
   txtlength := txtlength + 1;
   passpos := txtlength mod passlength;
   truc := (Integer(ch) - 50) + integer(Edit1.Text[passpos]);
   //Application.ProcessMessages; //Pour ne pas donner l'aspect bloqué
   //ProgressBar1.Position := ProgressBar1.Position + 1;
   //Memo3.Text := Memo3.Text + ch;
   ch := Char(truc);
   //Memo4.Text := Memo4.Text + ch;
   Write(T,ch);
  end;
 CloseFile(S);
 CloseFile(T);
 ShowMessage('Le processus de cryptage est terminé');
 Memo4.Lines.LoadFromFile(Code.Text);
end;

procedure TForm1.Button4Click(Sender: TObject);
{
 var T : File of Char;
 ch : Char;
 truc : Integer;
 passpos : Integer;
 passlength : Integer;
 txtlength : Integer;
 e : Integer;
begin
 //Décodage
 Memo3.Text := '';
 Memo4.Text := '';
 Memo3.Lines.LoadFromFile(CodeTxt.Text);

 AssignFile(T,OriginalFile.Text);
 Rewrite(T);
 ProgressBar2.Max := Length(Memo1.Lines.Text);
 passlength := Length(Edit2.Text);
 quitdecode := true;
 For e := 1 To Length(Memo1.Lines.Text) do
 begin
  ch := Memo1.Lines.Text[e];
  txtlength := txtlength + 1;
  passpos := txtlength mod passlength;
  truc := (Integer(ch) + 50) - integer(Edit2.Text[passpos]);
  Application.ProcessMessages; //Pour ne pas donner l'aspect bloqué
  ProgressBar2.Position := ProgressBar2.Position + 1;
  ch := Char(truc);
  Memo2.Text := Memo2.Text + ch;
  Write(T,ch);
 end;
 ShowMessage('Processus de décodage terminé.');
 CloseFile(T);
end;
}
var
 S: file;
 ch: char;
 T: file of char;
 strbuff, labo: string;
 Buf: array [1..1000] of char;
 truc,passpos,passlength,txtlength,e,lus,ecrits: integer;
begin
{
 //Programme de codage
 Memo3.Text := '';
 Memo4.Text := '';
 Memo3.Lines.LoadFromFile(UncodeTxt.Text);
 AssignFile(T,Code.Text);
 Rewrite(T);
 ProgressBar1.Max := Length(Memo3.Lines.Text);
 passlength := Length(Edit1.Text);
 quitcode := true;

 For e := 0 To Length(Memo3.Lines.Text) do
 begin
  ch := Memo3.Lines.Text[e];
  txtlength := txtlength + 1;
  passpos := txtlength mod passlength;
  truc := (Integer(ch) - 50) + integer(Edit1.Text[passpos]);
  Application.ProcessMessages; //Pour ne pas donner l'aspect bloqué
  ProgressBar1.Position := ProgressBar1.Position + 1;

  //Memo3.Text := Memo3.Text + ch;
  ch := Char(truc);
  Memo4.Text := Memo4.Text + ch;
  Write(T,ch);
 end;
 ShowMessage('Processus de codage terminé.');
 CloseFile(T);
}
 // Ici on lit(par paquets,c'est plus rapide)
 AssignFile(S,CodeTxt.Text);
 AssignFile(T,OriginalFile.Text);
 Reset(S,1);
 Rewrite(T);
 repeat
  //ShowMessage('Lecture...');
  BlockRead(S,Buf,SizeOf(buf),Lus);
  if(Lus < 1000) then
  begin
    if(Lus > 0) then
    begin
      labo := string(Buf);
      labo := LeftStr(labo,Lus);
      Strbuff := Strbuff + labo;
    end;
  end
  else
    Strbuff := Strbuff + string(Buf);

 //  Memo1.Lines.Add(Buf);
 Memo1.Lines.Add(IntToStr(Lus));
 //  Memo1.Lines.Add('--------------------------Nouvel item------------------------------');

 until (Lus=0) or (Lus<0);
 Memo1.Lines.Add(IntToStr(Length(StrBuff)));
 Memo1.Lines.Add(StrBuff);
 //Ici,on code
 passlength := Length(Edit2.Text);
 ProgressBar2.Max := Length(strbuff);
 ProgressBar2.Position := 0;
 Memo1.Text := Strbuff;

 for e := 1 to Length(StrBuff) do
 begin
  ch := StrBuff[e];
  //Memo1.Text := Memo1.Text + IntToStr(Integer(ch)) + ' ';
  txtlength := txtlength + 1;
  passpos := txtlength mod passlength;
  truc := (Integer(ch) + 50) - integer(Edit2.Text[passpos]);
  Application.ProcessMessages; //Pour ne pas donner l'aspect bloqué
  ProgressBar2.Position := ProgressBar2.Position + 1;

  //Memo1.Text := Memo1.Text + ch;
  ch := Char(truc);
  //Memo2.Text := Memo2.Text + ch;
  Write(T,ch);
 end;
 CloseFile(S);
 CloseFile(T);
 Memo2.Lines.LoadFromFile(OriginalFile.Text);
 ShowMessage('Le processus de cryptage est terminé');
end;

procedure TForm1.initialisation(Sender: TObject);
begin
 Op1.Caption:='';
 Op2.Caption:='';
end;

procedure TForm1.ArretClick(Sender: TObject);
begin
 quitdecode:=false;
end;

procedure TForm1.Arret2Click(Sender: TObject);
begin
 quitcode:=false;
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
 quitcode:=false;
end;

end.
