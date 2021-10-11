object Form1: TForm1
  Left = 212
  Top = 128
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'File coder / decoder'
  ClientHeight = 333
  ClientWidth = 591
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Icon.Data = {
    0000010001002020040000000000E80200001600000028000000200000004000
    0000010004000000000000020000000000000000000000000000000000000000
    000000008000008000000080800080000000800080008080000080808000C0C0
    C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00CCC0
    000CCCC0000000000CCCC8888CCCCCCC0000CCCC00000000CCCC8888CCCCCCCC
    C0000CCCCCCCCCCCCCC8888CCCCC0CCCCC0000CCCCCCCCCCCC8888CCCCC800CC
    C00CCCC0000000000CCCC88CCC88000C0000CCCC00000000CCCC8888C8880000
    00000CCCC000000CCCC888888888C000C00000CCCC0000CCCC88888C888CCC00
    CC00000CCCCCCCCCC88888CC88CCCCC0CCC000CCCCC00CCCCC888CCC8CCCCCCC
    CCCC0CCCCCCCCCCCCCC8CCCCCCCCCCCC0CCCCCCCCCCCCCCCCCCCCCC8CCC80CCC
    00CCCCCCCC0CC0CCCCCCCC88CC8800CC000CCCCCC000000CCCCCC888CC8800CC
    0000CCCC00000000CCCC8888CC8800CC0000C0CCC000000CCC8C8888CC8800CC
    0000C0CCC000000CCC8C8888CC8800CC0000CCCC00000000CCCC8888CC8800CC
    000CCCCCC000000CCCCCC888CC8800CC00CCCCCCCC0CC0CCCCCCCC88CC880CCC
    0CCCCCCCCCCCCCCCCCCCCCC8CCC8CCCCCCCC0CCCCCCCCCCCCCC8CCCCCCCCCCC0
    CCC000CCCCC00CCCCC888CCC8CCCCC00CC00000CCCCCCCCCC88888CC88CCC000
    C00000CCCC0000CCCC88888C888C000000000CCCC000000CCCC888888888000C
    0000CCCC00000000CCCC8888C88800CCC00CCCC0000000000CCCC88CCC880CCC
    CC0000CCCCCCCCCCCC8888CCCCC8CCCCC0000CCCCCCCCCCCCCC8888CCCCCCCCC
    0000CCCC00000000CCCC8888CCCCCCC0000CCCC0000000000CCCC8888CCC0000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    000000000000000000000000000000000000000000000000000000000000}
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = initialisation
  PixelsPerInch = 120
  TextHeight = 16
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 591
    Height = 333
    ActivePage = TabSheet1
    Align = alClient
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MultiLine = True
    ParentFont = False
    ScrollOpposite = True
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Encode'
      DesignSize = (
        583
        302)
      object Label1: TLabel
        Left = 8
        Top = 13
        Width = 92
        Height = 16
        Caption = 'File for encode:'
      end
      object Label2: TLabel
        Left = 8
        Top = 48
        Width = 53
        Height = 16
        Caption = 'Save as:'
      end
      object Label3: TLabel
        Left = 0
        Top = 417
        Width = 126
        Height = 16
        Anchors = [akLeft, akBottom]
        Caption = '&Encodage en cours...'
      end
      object Op1: TLabel
        Left = 0
        Top = 530
        Width = 413
        Height = 16
        Caption = 
          '**Operation en cours.Ce texte ne sera pas affiche lors de l'#39'exec' +
          'ution.**'
        Visible = False
      end
      object Label7: TLabel
        Left = 8
        Top = 80
        Width = 63
        Height = 16
        Caption = 'Password:'
      end
      object UncodeTxt: TEdit
        Left = 112
        Top = 8
        Width = 201
        Height = 24
        TabOrder = 0
      end
      object Ouvrir: TButton
        Left = 320
        Top = 8
        Width = 137
        Height = 25
        Caption = 'Open'
        TabOrder = 1
        OnClick = OuvrirClick
      end
      object Code: TEdit
        Left = 72
        Top = 40
        Width = 241
        Height = 24
        TabOrder = 2
      end
      object Button1: TButton
        Left = 320
        Top = 41
        Width = 137
        Height = 24
        Caption = 'Choose ...'
        TabOrder = 3
        OnClick = Button1Click
      end
      object Button2: TButton
        Left = 320
        Top = 72
        Width = 137
        Height = 25
        Caption = 'Start operation'
        TabOrder = 4
        OnClick = Button2Click
      end
      object PageControl4: TPageControl
        Left = 0
        Top = 104
        Width = 583
        Height = 198
        ActivePage = TabSheet7
        Align = alBottom
        TabOrder = 5
        object TabSheet7: TTabSheet
          Caption = 'Original file'
          object Memo3: TMemo
            Left = 0
            Top = 0
            Width = 575
            Height = 167
            Align = alClient
            BevelInner = bvNone
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -17
            Font.Name = 'Times New Roman'
            Font.Style = []
            Lines.Strings = (
              '')
            ParentFont = False
            ScrollBars = ssBoth
            TabOrder = 0
          end
        end
        object TabSheet8: TTabSheet
          Caption = 'File coded'
          ImageIndex = 1
          object Memo4: TMemo
            Left = 0
            Top = 0
            Width = 575
            Height = 167
            Align = alClient
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -17
            Font.Name = 'Times New Roman'
            Font.Style = []
            Lines.Strings = (
              '')
            ParentFont = False
            ScrollBars = ssBoth
            TabOrder = 0
          end
        end
      end
      object Edit1: TEdit
        Left = 80
        Top = 72
        Width = 233
        Height = 24
        PasswordChar = '*'
        TabOrder = 6
      end
      object Button7: TButton
        Left = 464
        Top = 72
        Width = 113
        Height = 25
        Caption = 'Stop'
        TabOrder = 7
        OnClick = Arret2Click
      end
      object ProgressBar1: TProgressBar
        Left = 464
        Top = 8
        Width = 113
        Height = 25
        Anchors = [akLeft, akRight, akBottom]
        TabOrder = 8
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Decode'
      ImageIndex = 1
      DesignSize = (
        583
        302)
      object Label5: TLabel
        Left = 8
        Top = 48
        Width = 53
        Height = 16
        Caption = 'Save as:'
      end
      object Label6: TLabel
        Left = 0
        Top = 419
        Width = 128
        Height = 16
        Anchors = [akLeft, akBottom]
        Caption = '&Decodage en cours...'
      end
      object Label4: TLabel
        Left = 8
        Top = 13
        Width = 92
        Height = 16
        Caption = 'File for encode:'
      end
      object Op2: TLabel
        Left = 0
        Top = 530
        Width = 413
        Height = 16
        Caption = 
          '**Operation en cours.Ce texte ne sera pas affiche lors de l'#39'exec' +
          'ution.**'
        Visible = False
      end
      object Label8: TLabel
        Left = 8
        Top = 80
        Width = 63
        Height = 16
        Caption = 'Password:'
      end
      object CodeTxt: TEdit
        Left = 112
        Top = 8
        Width = 201
        Height = 24
        TabOrder = 0
      end
      object Button3: TButton
        Left = 320
        Top = 8
        Width = 137
        Height = 25
        Caption = 'Open'
        TabOrder = 1
        OnClick = Button3Click
      end
      object Button4: TButton
        Left = 320
        Top = 72
        Width = 137
        Height = 25
        Caption = 'Start operation'
        TabOrder = 2
        OnClick = Button4Click
      end
      object OriginalFile: TEdit
        Left = 72
        Top = 40
        Width = 241
        Height = 24
        TabOrder = 3
      end
      object Button5: TButton
        Left = 320
        Top = 41
        Width = 137
        Height = 24
        Caption = 'Choose ...'
        TabOrder = 4
        OnClick = Button5Click
      end
      object ProgressBar2: TProgressBar
        Left = 464
        Top = 8
        Width = 113
        Height = 25
        Anchors = [akLeft, akRight, akBottom]
        TabOrder = 5
      end
      object PageControl2: TPageControl
        Left = 0
        Top = 104
        Width = 583
        Height = 198
        ActivePage = TabSheet3
        Align = alBottom
        TabOrder = 6
        object TabSheet3: TTabSheet
          Caption = 'File coded'
          object Memo1: TMemo
            Left = 0
            Top = 0
            Width = 575
            Height = 167
            Align = alClient
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -17
            Font.Name = 'Times New Roman'
            Font.Style = []
            Lines.Strings = (
              '')
            ParentFont = False
            ScrollBars = ssBoth
            TabOrder = 0
          end
        end
        object TabSheet4: TTabSheet
          Caption = 'Original file'
          ImageIndex = 1
          object Memo2: TMemo
            Left = 0
            Top = 0
            Width = 575
            Height = 167
            Align = alClient
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -17
            Font.Name = 'Times New Roman'
            Font.Style = []
            Lines.Strings = (
              '')
            ParentFont = False
            ScrollBars = ssBoth
            TabOrder = 0
          end
        end
      end
      object Edit2: TEdit
        Left = 80
        Top = 72
        Width = 233
        Height = 24
        PasswordChar = '*'
        TabOrder = 7
      end
      object Button6: TButton
        Left = 464
        Top = 72
        Width = 113
        Height = 25
        Caption = 'Stop'
        TabOrder = 8
        OnClick = ArretClick
      end
    end
  end
  object OpenDialog1: TOpenDialog
    Filter = 'Fichier textes|*.txt|Tous les fichiers|*.*'
    Left = 144
    Top = 192
  end
  object SaveDialog1: TSaveDialog
    Filter = 
      'Fichier ROT14 Transcriptor|*.rcd|Fichiers texte|*.txt|Tous les f' +
      'ichiers|*.*'
    OptionsEx = [ofExNoPlacesBar]
    Left = 184
    Top = 192
  end
end
