object frmEmissaoEtiquetaRecebimento: TfrmEmissaoEtiquetaRecebimento
  Left = 0
  Top = 0
  Caption = 'Emiss'#227'o de Etiquetas de Recebimento'
  ClientHeight = 426
  ClientWidth = 788
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 138
    Width = 788
    Height = 5
    Align = alTop
    Shape = bsTopLine
    ExplicitLeft = 8
    ExplicitTop = 32
    ExplicitWidth = 569
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 788
    Height = 138
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 12
      Top = 48
      Width = 55
      Height = 13
      Caption = 'Fornecedor'
    end
    object Label2: TLabel
      Left = 207
      Top = 48
      Width = 46
      Height = 13
      Caption = 'Descri'#231#227'o'
    end
    object Label3: TLabel
      Left = 555
      Top = 47
      Width = 54
      Height = 13
      Caption = 'Documento'
    end
    object Label4: TLabel
      Left = 29
      Top = 80
      Width = 38
      Height = 13
      Caption = 'Produto'
    end
    object Label5: TLabel
      Left = 207
      Top = 80
      Width = 46
      Height = 13
      Caption = 'Descri'#231#227'o'
    end
    object Label6: TLabel
      Left = 555
      Top = 80
      Width = 53
      Height = 13
      Caption = 'Alternativo'
    end
    object Lb_CMAQ_IN_CODIGO: TLabel
      Left = 15
      Top = 19
      Width = 52
      Height = 13
      Caption = 'Nota Fiscal'
    end
    object Label7: TLabel
      Left = 46
      Top = 109
      Width = 21
      Height = 13
      Caption = 'Lote'
    end
    object Ed_AGN_IN_CODIGO: TEdit
      Left = 72
      Top = 44
      Width = 121
      Height = 21
      TabOrder = 1
      Text = '13.987.573/0005-26'
      OnExit = Ed_AGN_IN_CODIGOExit
      OnKeyDown = Ed_AGN_IN_CODIGOKeyDown
    end
    object Ed_AGN_ST_FANTASIA: TDBEdit
      Left = 263
      Top = 44
      Width = 277
      Height = 21
      TabStop = False
      Color = cl3DLight
      DataField = 'AGN_ST_FANTASIA'
      DataSource = Ds_Fornecedor
      ReadOnly = True
      TabOrder = 5
    end
    object Ed_AGN_ST_CGC: TDBEdit
      Left = 614
      Top = 43
      Width = 118
      Height = 21
      TabStop = False
      Color = cl3DLight
      DataField = 'AGN_ST_CGC'
      DataSource = Ds_Fornecedor
      ReadOnly = True
      TabOrder = 6
    end
    object Ed_PRO_IN_CODIGO: TEdit
      Left = 72
      Top = 76
      Width = 121
      Height = 21
      TabOrder = 2
      Text = '9637'
      OnExit = Ed_PRO_IN_CODIGOExit
    end
    object Ed_PRO_ST_DESCRICAO: TDBEdit
      Left = 263
      Top = 76
      Width = 277
      Height = 21
      TabStop = False
      Color = cl3DLight
      DataField = 'PRO_ST_DESCRICAO'
      DataSource = Ds_Produto
      ReadOnly = True
      TabOrder = 7
    end
    object Ed_PRO_ST_ALTERNATIVO: TDBEdit
      Left = 614
      Top = 76
      Width = 118
      Height = 21
      TabStop = False
      Color = cl3DLight
      DataField = 'PRO_ST_ALTERNATIVO'
      DataSource = Ds_Produto
      ReadOnly = True
      TabOrder = 8
    end
    object Ed_RCB_ST_NOTA: TEdit
      Left = 72
      Top = 15
      Width = 121
      Height = 21
      TabOrder = 0
      Text = '19030801'
    end
    object Bo_Procurar: TBitBtn
      Left = 657
      Top = 101
      Width = 75
      Height = 25
      Caption = 'Procurar'
      TabOrder = 4
      OnClick = Bo_ProcurarClick
    end
    object Ed_MVS_ST_LOTEFORNE: TEdit
      Left = 72
      Top = 105
      Width = 121
      Height = 21
      TabOrder = 3
      OnExit = Ed_PRO_IN_CODIGOExit
    end
  end
  object Gd_Itens: TDBGrid
    Left = 0
    Top = 143
    Width = 788
    Height = 242
    Align = alClient
    DataSource = Ds_Itens
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'AGN_IN_CODIGO'
        Title.Caption = 'C'#243'd Fornecedor'
        Width = 84
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRO_IN_CODIGO'
        ReadOnly = True
        Title.Caption = 'Cod. Mega'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRO_ST_ALTERNATIVO'
        ReadOnly = True
        Title.Caption = 'Cod. Alternativo'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRO_ST_DESCRICAO'
        ReadOnly = True
        Title.Caption = 'Descri'#231#227'o'
        Width = 207
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UNI_ST_UNIDADE'
        ReadOnly = True
        Title.Caption = 'U.M.'
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MVL_ST_LOTEFORNE'
        Title.Caption = 'Lote'
        Width = 110
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MVL_RE_QUANTIDADE'
        Title.Caption = 'Qtde'
        Width = 75
        Visible = True
      end
      item
        Color = clGradientActiveCaption
        Expanded = False
        FieldName = 'QTD_IN_ETIQUETAS'
        Title.Caption = 'Etiquetas'
        Width = 50
        Visible = True
      end>
  end
  object Panel4: TPanel
    Left = 0
    Top = 385
    Width = 788
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    DesignSize = (
      788
      41)
    object Bo_Confirmar: TBitBtn
      Left = 588
      Top = 6
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Confirmar'
      TabOrder = 0
    end
    object Bo_Cancelar: TBitBtn
      Left = 475
      Top = 6
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Cancelar'
      TabOrder = 1
      OnClick = Bo_CancelarClick
    end
    object Bo_Fechar: TBitBtn
      Left = 700
      Top = 6
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Fechar'
      TabOrder = 2
      OnClick = Bo_FecharClick
    end
  end
  object Cl_Fornecedor: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 720
    Top = 1
  end
  object Ds_Fornecedor: TDataSource
    DataSet = Cl_Fornecedor
    Left = 720
    Top = 49
  end
  object Ds_Produto: TDataSource
    DataSet = Cl_Produto
    Left = 644
    Top = 49
  end
  object Cl_Produto: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 644
    Top = 1
  end
  object Cl_Itens: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 571
    Top = 1
  end
  object Ds_Itens: TDataSource
    DataSet = Cl_Itens
    Left = 571
    Top = 49
  end
end
