object frmOrdemOperadorApontamentos: TfrmOrdemOperadorApontamentos
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Ordem > Operador > Apontamentos'
  ClientHeight = 519
  ClientWidth = 776
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label8: TLabel
    Left = 209
    Top = 67
    Width = 74
    Height = 13
    Caption = 'C'#243'digo Produto'
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 776
    Height = 228
    Align = alTop
    Caption = '  Dados da Ordem  '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object Label2: TLabel
      Left = 18
      Top = 20
      Width = 79
      Height = 13
      Caption = 'C'#243'digo Ordem'
    end
    object Label3: TLabel
      Left = 18
      Top = 71
      Width = 72
      Height = 13
      Caption = 'C'#243'd. Produto'
    end
    object Label5: TLabel
      Left = 106
      Top = 163
      Width = 54
      Height = 13
      Caption = 'Opera'#231#227'o'
    end
    object Label9: TLabel
      Left = 106
      Top = 71
      Width = 91
      Height = 13
      Caption = 'C'#243'd. Alternativo'
    end
    object Label10: TLabel
      Left = 106
      Top = 20
      Width = 91
      Height = 13
      Caption = 'C'#243'd. Alternativo'
    end
    object Label11: TLabel
      Left = 314
      Top = 20
      Width = 105
      Height = 13
      Caption = 'Data Recebimento'
    end
    object Label12: TLabel
      Left = 18
      Top = 163
      Width = 81
      Height = 13
      Caption = 'Seq. Opera'#231#227'o'
    end
    object Label13: TLabel
      Left = 406
      Top = 163
      Width = 108
      Height = 13
      Caption = 'Centro de Trabalho'
    end
    object Label1: TLabel
      Left = 460
      Top = 20
      Width = 93
      Height = 13
      Caption = 'C'#243'd. Ordem Real'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object edORD_IN_CODIGO: TEdit
      Left = 460
      Top = 35
      Width = 82
      Height = 32
      BevelInner = bvNone
      BevelKind = bkFlat
      BevelOuter = bvRaised
      BorderStyle = bsNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      Visible = False
      OnExit = edORD_IN_CODIGOExit
    end
    object edPRO_IN_CODIGO: TEdit
      Left = 18
      Top = 88
      Width = 82
      Height = 32
      TabStop = False
      BevelInner = bvNone
      BevelKind = bkFlat
      BevelOuter = bvRaised
      BorderStyle = bsNone
      Color = cl3DLight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
    object edPRO_ST_DESCRICAO: TEdit
      Left = 18
      Top = 126
      Width = 743
      Height = 32
      TabStop = False
      BevelInner = bvNone
      BevelKind = bkFlat
      BevelOuter = bvRaised
      BorderStyle = bsNone
      Color = cl3DLight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
    end
    object edOPR_IN_CODIGO: TEdit
      Left = 106
      Top = 181
      Width = 74
      Height = 32
      TabStop = False
      BevelInner = bvNone
      BevelKind = bkFlat
      BevelOuter = bvRaised
      BorderStyle = bsNone
      Color = cl3DLight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
    end
    object edOPR_ST_OPERACAO: TEdit
      Left = 186
      Top = 181
      Width = 186
      Height = 32
      TabStop = False
      BevelInner = bvNone
      BevelKind = bkFlat
      BevelOuter = bvRaised
      BorderStyle = bsNone
      Color = cl3DLight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
    end
    object edPRO_ST_ALTERNATIVO: TEdit
      Left = 106
      Top = 88
      Width = 348
      Height = 32
      TabStop = False
      BevelInner = bvNone
      BevelKind = bkFlat
      BevelOuter = bvRaised
      BorderStyle = bsNone
      Color = cl3DLight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 5
    end
    object edORD_ST_ALTERNATIVO: TEdit
      Left = 106
      Top = 35
      Width = 200
      Height = 32
      TabStop = False
      BevelInner = bvNone
      BevelKind = bkFlat
      BevelOuter = bvRaised
      BorderStyle = bsNone
      Color = cl3DLight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 6
    end
    object edORD_DT_RECEBIMENTO: TEdit
      Left = 314
      Top = 35
      Width = 140
      Height = 32
      TabStop = False
      BevelInner = bvNone
      BevelKind = bkFlat
      BevelOuter = bvRaised
      BorderStyle = bsNone
      Color = cl3DLight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 7
    end
    object edPLF_IN_SQOPERACAO: TEdit
      Left = 18
      Top = 181
      Width = 82
      Height = 32
      BevelInner = bvNone
      BevelKind = bkFlat
      BevelOuter = bvRaised
      BorderStyle = bsNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 8
      OnExit = edPLF_IN_SQOPERACAOExit
    end
    object edMAQ_IN_CODIGO: TEdit
      Left = 406
      Top = 182
      Width = 82
      Height = 32
      TabStop = False
      BevelInner = bvNone
      BevelKind = bkFlat
      BevelOuter = bvRaised
      BorderStyle = bsNone
      Color = cl3DLight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 9
    end
    object edMAQ_ST_NOME: TEdit
      Left = 492
      Top = 182
      Width = 269
      Height = 32
      TabStop = False
      BevelInner = bvNone
      BevelKind = bkFlat
      BevelOuter = bvRaised
      BorderStyle = bsNone
      Color = cl3DLight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 10
    end
    object edORD_IN_CODIGO_PAI: TEdit
      Left = 18
      Top = 35
      Width = 82
      Height = 32
      BevelInner = bvNone
      BevelKind = bkFlat
      BevelOuter = bvRaised
      BorderStyle = bsNone
      Color = cl3DLight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 11
      OnExit = edORD_IN_CODIGOExit
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 228
    Width = 776
    Height = 254
    Align = alClient
    Caption = '  Apontamentos  '
    TabOrder = 1
    object gdApontamentos: TDBGrid
      Left = 2
      Top = 15
      Width = 772
      Height = 237
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Tahoma'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'APT_DT_APONTAMENTO'
          Title.Caption = 'Data Inicial'
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'APT_HR_TEMPOINICIAL'
          Title.Caption = 'Hora Inicial'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'APT_DT_ENCERRAMENTO'
          Title.Caption = 'Data Encerramento'
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'APT_HR_TEMPOFINAL'
          Title.Caption = 'Hora Encerramento'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'APT_RE_QUANTIDADE'
          Title.Caption = 'Qtde. Produzida'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'APT_RE_QUANTIDADEREF'
          Title.Caption = 'Qtde. Refugada'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'APT_REF_IN_CODIGO'
          Title.Caption = 'C. Refugo'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'REF_ST_NOME'
          Title.Caption = 'Refugo'
          Width = 200
          Visible = True
        end>
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 482
    Width = 776
    Height = 37
    Align = alBottom
    BevelOuter = bvNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    DesignSize = (
      776
      37)
    object boApontar: TButton
      Left = 385
      Top = 6
      Width = 100
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Apontar'
      TabOrder = 0
      OnClick = boApontarClick
    end
    object boExcluir: TButton
      Left = 524
      Top = 6
      Width = 100
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Excluir'
      TabOrder = 1
      OnClick = boExcluirClick
    end
    object Button1: TButton
      Left = 661
      Top = 6
      Width = 100
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Fechar'
      TabOrder = 2
      OnClick = Button1Click
    end
  end
  object cdsApontamentos: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 584
    Top = 200
  end
  object dsApontamentos: TDataSource
    DataSet = cdsApontamentos
    Left = 584
    Top = 248
  end
end
