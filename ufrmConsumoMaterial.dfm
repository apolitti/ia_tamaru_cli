object frmConsumoMaterial: TfrmConsumoMaterial
  Left = 0
  Top = 0
  Caption = 'Consumo de Material'
  ClientHeight = 434
  ClientWidth = 784
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Pn_Topo: TPanel
    Left = 0
    Top = 0
    Width = 784
    Height = 31
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Lb_CMAQ_IN_CODIGO: TLabel
      Left = 41
      Top = 8
      Width = 40
      Height = 13
      Caption = 'M'#225'quina'
    end
    object Ed_CMAQ_IN_CODIGO: TEdit
      Left = 87
      Top = 4
      Width = 121
      Height = 21
      TabOrder = 0
      OnChange = Ed_CMAQ_IN_CODIGOChange
      OnExit = Ed_CMAQ_IN_CODIGOExit
      OnKeyDown = Ed_CMAQ_IN_CODIGOKeyDown
    end
    object Bo_OK: TBitBtn
      Left = 214
      Top = 0
      Width = 75
      Height = 25
      Caption = 'OK'
      TabOrder = 1
      OnClick = Bo_OKClick
    end
  end
  object Pn_Principal: TPanel
    Left = 0
    Top = 31
    Width = 784
    Height = 370
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object Lb_ORD_IN_CODIGO: TLabel
      Left = 49
      Top = 4
      Width = 32
      Height = 13
      Caption = 'Ordem'
    end
    object Lb_PLF_RE_QUANTIDADEORI: TLabel
      Left = 155
      Top = 6
      Width = 60
      Height = 13
      Alignment = taRightJustify
      Caption = 'Qtde.Ordem'
    end
    object Lb_APO_RE_QTDEPRODUZIDAKG: TLabel
      Left = 5
      Top = 81
      Width = 116
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Qtde.Produzida Total'
    end
    object Lb_PRO_IN_CODIGO: TLabel
      Left = 43
      Top = 26
      Width = 38
      Height = 13
      Caption = 'Produto'
    end
    object Lb_PRO_ST_ALTERNATIVO: TLabel
      Left = 162
      Top = 26
      Width = 53
      Height = 13
      Caption = 'Alternativo'
    end
    object Lb_PRO_ST_DESCRICAO: TLabel
      Left = 35
      Top = 48
      Width = 46
      Height = 13
      Caption = 'Descri'#231#227'o'
    end
    object Label2: TLabel
      Left = 343
      Top = 4
      Width = 23
      Height = 13
      Alignment = taRightJustify
      Caption = 'U.M.'
    end
    object Bevel1: TBevel
      Left = 8
      Top = 72
      Width = 753
      Height = 5
      Shape = bsTopLine
    end
    object Bevel2: TBevel
      Left = 8
      Top = 150
      Width = 753
      Height = 9
      Shape = bsTopLine
    end
    object Lb_APO_RE_QTDEPRODUZIDAKG1: TLabel
      Left = 251
      Top = 81
      Width = 15
      Height = 13
      AutoSize = False
      Caption = 'kg'
    end
    object Lb_APO_RE_QTDEPRODUZIDAKGNRM: TLabel
      Left = 2
      Top = 103
      Width = 116
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Qtde.Produzida Normal'
    end
    object Lb_APO_RE_QTDEPRODUZIDAKGNRM1: TLabel
      Left = 251
      Top = 103
      Width = 15
      Height = 13
      AutoSize = False
      Caption = 'kg'
    end
    object Lb_APO_RE_QTDEPRODUZIDAKGSPA: TLabel
      Left = 5
      Top = 125
      Width = 116
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Qtde.Produzida Sub'
    end
    object Lb_APO_RE_QTDEPRODUZIDAKGSPA1: TLabel
      Left = 251
      Top = 125
      Width = 15
      Height = 13
      AutoSize = False
      Caption = 'kg'
    end
    object Bo_Confirmar: TBitBtn
      Left = 343
      Top = 339
      Width = 75
      Height = 25
      Caption = 'Confirmar'
      TabOrder = 10
      OnClick = Bo_ConfirmarClick
    end
    object Ed_ORD_IN_CODIGO: TDBEdit
      Left = 87
      Top = 1
      Width = 65
      Height = 21
      TabStop = False
      Color = clSilver
      DataField = 'ORD_IN_CODIGO'
      DataSource = Ds_Ord
      ReadOnly = True
      TabOrder = 0
    end
    object Ed_PLF_RE_QUANTIDADEORI: TDBEdit
      Left = 221
      Top = 1
      Width = 120
      Height = 21
      TabStop = False
      Color = clSilver
      DataField = 'PLF_RE_QUANTIDADEORI'
      DataSource = Ds_Ord
      ReadOnly = True
      TabOrder = 1
    end
    object Ed_APO_RE_QTDEPRODUZIDAKG: TDBEdit
      Left = 124
      Top = 78
      Width = 121
      Height = 21
      TabStop = False
      Color = clSilver
      DataField = 'APO_RE_QTDEPRODUZIDAKG'
      DataSource = Ds_Enc
      ReadOnly = True
      TabOrder = 6
    end
    object Ed_PRO_IN_CODIGO: TDBEdit
      Left = 87
      Top = 23
      Width = 65
      Height = 21
      TabStop = False
      Color = clSilver
      DataField = 'PRO_IN_CODIGO'
      DataSource = Ds_Ord
      ReadOnly = True
      TabOrder = 3
    end
    object Ed_PRO_ST_ALTERNATIVO: TDBEdit
      Left = 221
      Top = 23
      Width = 120
      Height = 21
      TabStop = False
      Color = clSilver
      DataField = 'PRO_ST_ALTERNATIVO'
      DataSource = Ds_Ord
      ReadOnly = True
      TabOrder = 4
    end
    object Ed_PRO_ST_DESCRICAO: TDBEdit
      Left = 87
      Top = 45
      Width = 442
      Height = 21
      TabStop = False
      Color = clSilver
      DataField = 'PRO_ST_DESCRICAO'
      DataSource = Ds_Ord
      ReadOnly = True
      TabOrder = 5
    end
    object DBEdit2: TDBEdit
      Left = 372
      Top = 1
      Width = 53
      Height = 21
      TabStop = False
      Color = clSilver
      DataField = 'UNI_ST_UNIDADE'
      DataSource = Ds_Ord
      ReadOnly = True
      TabOrder = 2
    end
    object Gd_Consumo: TDBGrid
      Left = 8
      Top = 159
      Width = 753
      Height = 174
      DataSource = DS_Dde
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 9
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'PRO_IN_CODIGO'
          ReadOnly = True
          Title.Caption = 'C'#243'digo'
          Width = 55
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRO_ST_ALTERNATIVO'
          ReadOnly = True
          Title.Caption = 'Alternativo'
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'pro_st_descricao'
          ReadOnly = True
          Title.Caption = 'Descri'#231#227'o'
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'uni_st_unidade'
          ReadOnly = True
          Title.Caption = 'U.M.'
          Width = 40
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'mqd_re_empenhada'
          Title.Alignment = taRightJustify
          Title.Caption = 'Qtde.Emp.'
          Width = 80
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'mqd_re_requisitada'
          Title.Alignment = taRightJustify
          Title.Caption = 'Qtde.Req.'
          Width = 80
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'mqd_re_saldo'
          Title.Alignment = taRightJustify
          Title.Caption = 'Qtde.Disp.'
          Width = 80
          Visible = True
        end
        item
          Alignment = taRightJustify
          Color = clGradientActiveCaption
          Expanded = False
          FieldName = 'mqd_re_qtdeinfo'
          Title.Alignment = taRightJustify
          Title.Caption = 'Qtde. Consumir'
          Width = 80
          Visible = True
        end>
    end
    object Ed_APO_RE_QTDEPRODUZIDAKGNRM: TDBEdit
      Left = 124
      Top = 100
      Width = 121
      Height = 21
      TabStop = False
      Color = clSilver
      DataField = 'APO_RE_QTDEPRODUZIDAKGNRM'
      DataSource = Ds_Enc
      ReadOnly = True
      TabOrder = 7
    end
    object Ed_APO_RE_QTDEPRODUZIDAKGSPA: TDBEdit
      Left = 124
      Top = 122
      Width = 121
      Height = 21
      TabStop = False
      Color = clSilver
      DataField = 'APO_RE_QTDEPRODUZIDAKGSPA'
      DataSource = Ds_Enc
      ReadOnly = True
      TabOrder = 8
    end
  end
  object Pn_Rodape: TPanel
    Left = 0
    Top = 401
    Width = 784
    Height = 33
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object Bo_Fechar: TBitBtn
      Left = 686
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Fechar'
      TabOrder = 0
      OnClick = Bo_FecharClick
    end
  end
  object Cl_Pro: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 288
    Top = 119
  end
  object Cl_Cmq: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 292
    Top = 168
  end
  object Cl_Ord: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 20
    Top = 199
  end
  object Cl_Enc: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 20
    Top = 256
  end
  object Ds_Ord: TDataSource
    DataSet = Cl_Ord
    Left = 56
    Top = 199
  end
  object Ds_Enc: TDataSource
    DataSet = Cl_Enc
    Left = 56
    Top = 256
  end
  object Cl_Dde: TClientDataSet
    Aggregates = <>
    Params = <>
    BeforeInsert = Cl_DdeBeforeInsert
    BeforeDelete = Cl_DdeBeforeDelete
    Left = 20
    Top = 312
  end
  object DS_Dde: TDataSource
    DataSet = Cl_Dde
    Left = 56
    Top = 312
  end
end
