object FResumenes: TFResumenes
  Left = 0
  Top = 0
  Caption = 'Exportar Resumenes'
  ClientHeight = 799
  ClientWidth = 826
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 19
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 826
    Height = 799
    ActivePage = TabSheet3
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Documento'
      ExplicitWidth = 153
      ExplicitHeight = 738
      object seResumen: TSynEdit
        Left = 0
        Top = 0
        Width = 818
        Height = 765
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Courier New'
        Font.Style = []
        TabOrder = 0
        CodeFolding.GutterShapeSize = 11
        CodeFolding.CollapsedLineColor = clGrayText
        CodeFolding.FolderBarLinesColor = clGrayText
        CodeFolding.IndentGuidesColor = clGray
        CodeFolding.IndentGuides = True
        CodeFolding.ShowCollapsedLine = False
        CodeFolding.ShowHintMark = True
        UseCodeFolding = False
        Gutter.Font.Charset = DEFAULT_CHARSET
        Gutter.Font.Color = clWindowText
        Gutter.Font.Height = -11
        Gutter.Font.Name = 'Courier New'
        Gutter.Font.Style = []
        Lines.Strings = (
          'seResumen')
        FontSmoothing = fsmNone
        ExplicitLeft = -2
        ExplicitWidth = 665
        ExplicitHeight = 772
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Configuraci'#243'n'
      ImageIndex = 1
      ExplicitWidth = 506
      ExplicitHeight = 738
      object GroupBox1: TGroupBox
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 812
        Height = 54
        Align = alTop
        Caption = 'Ruta para Resumenes'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        ExplicitWidth = 500
        object edRuta: TEdit
          Left = 2
          Top = 21
          Width = 808
          Height = 31
          Align = alClient
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          Text = 'C:\xampp\htdocs\matematicas\descargas\resumenes-emem'
          ExplicitWidth = 496
          ExplicitHeight = 27
        end
      end
      object GroupBox2: TGroupBox
        AlignWithMargins = True
        Left = 3
        Top = 63
        Width = 812
        Height = 54
        Align = alTop
        Caption = 'Ruta para listas de Talleres'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        ExplicitLeft = 5
        ExplicitTop = 171
        ExplicitWidth = 500
        object edListas: TEdit
          Left = 2
          Top = 21
          Width = 808
          Height = 31
          Align = alClient
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          Text = 'C:\xampp\htdocs\matematicas\descargas\listas'
          ExplicitWidth = 496
          ExplicitHeight = 27
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'TabSheet3'
      ImageIndex = 2
      object seExcel: TSynEdit
        Left = 0
        Top = 0
        Width = 818
        Height = 765
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        TabOrder = 0
        CodeFolding.GutterShapeSize = 11
        CodeFolding.CollapsedLineColor = clGrayText
        CodeFolding.FolderBarLinesColor = clGrayText
        CodeFolding.IndentGuidesColor = clGray
        CodeFolding.IndentGuides = True
        CodeFolding.ShowCollapsedLine = False
        CodeFolding.ShowHintMark = True
        UseCodeFolding = False
        Gutter.Font.Charset = DEFAULT_CHARSET
        Gutter.Font.Color = clWindowText
        Gutter.Font.Height = -11
        Gutter.Font.Name = 'Courier New'
        Gutter.Font.Style = []
        Lines.Strings = (
          'seExcel')
        FontSmoothing = fsmNone
        ExplicitLeft = 464
        ExplicitTop = 160
        ExplicitWidth = 257
        ExplicitHeight = 137
      end
    end
  end
end
