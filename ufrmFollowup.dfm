object frmFollowup: TfrmFollowup
  Left = 0
  Top = 0
  Align = alClient
  Caption = 'Followup'
  ClientHeight = 336
  ClientWidth = 834
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  KeyPreview = True
  OldCreateOrder = False
  Visible = True
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object pcPrincipal: TPageControl
    Left = 0
    Top = 0
    Width = 834
    Height = 336
    ActivePage = tsFiltro
    Align = alClient
    TabOrder = 0
    object tsFiltro: TTabSheet
      Caption = 'Filtro'
      object gbParametro: TGroupBox
        Left = 0
        Top = 0
        Width = 826
        Height = 308
        Align = alClient
        Caption = '  Parametros  '
        TabOrder = 0
        object Label4: TLabel
          Left = 9
          Top = 81
          Width = 97
          Height = 13
          Caption = 'Centro de Trabalho:'
        end
        object Label5: TLabel
          Left = 236
          Top = 81
          Width = 16
          Height = 13
          Caption = 'at'#233
        end
        object Label6: TLabel
          Left = 9
          Top = 108
          Width = 71
          Height = 13
          Caption = 'Limite p/ Maq.:'
        end
        object Label1: TLabel
          Left = 73
          Top = 53
          Width = 33
          Height = 13
          Caption = 'Celula:'
        end
        object Label2: TLabel
          Left = 236
          Top = 53
          Width = 16
          Height = 13
          Caption = 'at'#233
        end
        object edMAQ_IN_CODIGO_I: TEdit
          Left = 109
          Top = 78
          Width = 121
          Height = 21
          BevelInner = bvNone
          BevelKind = bkFlat
          BevelOuter = bvRaised
          BevelWidth = 3
          BorderStyle = bsNone
          TabOrder = 0
        end
        object edMAQ_IN_CODIGO_F: TEdit
          Left = 259
          Top = 78
          Width = 121
          Height = 21
          BevelInner = bvNone
          BevelKind = bkFlat
          BevelOuter = bvRaised
          BevelWidth = 3
          BorderStyle = bsNone
          TabOrder = 1
        end
        object boFiltrar: TButton
          Left = 305
          Top = 132
          Width = 75
          Height = 25
          Caption = 'Filtrar'
          TabOrder = 2
          OnClick = boFiltrarClick
        end
        object edRank: TEdit
          Left = 109
          Top = 105
          Width = 121
          Height = 21
          BevelInner = bvNone
          BevelKind = bkFlat
          BevelOuter = bvRaised
          BevelWidth = 3
          BorderStyle = bsNone
          TabOrder = 3
        end
        object edCEL_IN_CODIGO_I: TEdit
          Left = 109
          Top = 50
          Width = 121
          Height = 21
          BevelInner = bvNone
          BevelKind = bkFlat
          BevelOuter = bvRaised
          BevelWidth = 3
          BorderStyle = bsNone
          TabOrder = 4
        end
        object edCEL_IN_CODIGO_F: TEdit
          Left = 259
          Top = 50
          Width = 121
          Height = 21
          BevelInner = bvNone
          BevelKind = bkFlat
          BevelOuter = bvRaised
          BevelWidth = 3
          BorderStyle = bsNone
          TabOrder = 5
        end
      end
    end
    object tsDados: TTabSheet
      Caption = 'Maquinas x Ordens de Produ'#231#227'o'
      ImageIndex = 1
      object Panel1: TPanel
        Left = 0
        Top = 267
        Width = 826
        Height = 41
        Align = alBottom
        BevelKind = bkTile
        BevelOuter = bvNone
        TabOrder = 0
        DesignSize = (
          822
          37)
        object Label7: TLabel
          Left = 7
          Top = 8
          Width = 263
          Height = 24
          Caption = 'C'#243'digo Ordem / Opera'#231#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -20
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edORDEMOPERACAO: TEdit
          Left = 276
          Top = 4
          Width = 165
          Height = 32
          Cursor = crHandPoint
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
          OnExit = edORDEMOPERACAOExit
        end
        object boFollowup: TButton
          Left = 659
          Top = 4
          Width = 150
          Height = 32
          Anchors = [akTop, akRight]
          Caption = 'Followup '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -20
          Font.Name = 'Tahoma'
          Font.Style = []
          HotImageIndex = 1
          ImageIndex = 1
          ImageMargins.Left = 10
          ImageMargins.Right = -10
          Images = DM.ilBotoes
          ParentFont = False
          TabOrder = 1
          OnClick = boFollowupClick
        end
        object boApontamentoImprodutivo: TButton
          Left = 449
          Top = 4
          Width = 200
          Height = 32
          Anchors = [akTop, akRight]
          Caption = 'Ocorr'#234'ncia'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -20
          Font.Name = 'Tahoma'
          Font.Style = []
          HotImageIndex = 2
          ImageIndex = 2
          ImageMargins.Left = 30
          ImageMargins.Right = -30
          Images = DM.ilBotoes
          ParentFont = False
          TabOrder = 2
          OnClick = boApontamentoImprodutivoClick
        end
      end
    end
    object tsAtualizando: TTabSheet
      Caption = 'Atualizando Dados'
      ImageIndex = 2
      TabVisible = False
    end
    object tsHistorico: TTabSheet
      Caption = 'Hist'#243'rico'
      ImageIndex = 3
      object gdHistorico: TDBGrid
        Left = 0
        Top = 73
        Width = 826
        Height = 235
        Align = alClient
        DataSource = dsHistorico
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
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
            FieldName = 'ORD_IN_CODIGO'
            Title.Caption = 'Ordem'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PLF_IN_SQOPERACAO'
            Title.Caption = 'Seq. Oper.'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ORD_IN_CODIGO_PAI'
            Title.Caption = 'Ordem Pai'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'APT_CMAQ_IN_CODIGO'
            Title.Caption = 'C'#243'd. Maquina'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'APT_ST_STATUS'
            Title.Caption = 'Status'
            Width = 100
            Visible = True
          end
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
      object pnHistoricoFiltro: TPanel
        Left = 0
        Top = 0
        Width = 826
        Height = 73
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
        DesignSize = (
          826
          73)
        object Label8: TLabel
          Left = 10
          Top = 3
          Width = 68
          Height = 13
          Caption = 'C'#243'digo Ordem'
        end
        object Label9: TLabel
          Left = 103
          Top = 3
          Width = 93
          Height = 13
          Caption = 'Centro de Trabalho'
        end
        object Label11: TLabel
          Left = 211
          Top = 3
          Width = 51
          Height = 13
          Caption = 'Data Inicio'
        end
        object Label10: TLabel
          Left = 368
          Top = 3
          Width = 64
          Height = 13
          Caption = 'Data Termino'
        end
        object Label12: TLabel
          Left = 526
          Top = 2
          Width = 35
          Height = 13
          Caption = 'Status:'
        end
        object edHistoricoORD_IN_CODIGO: TEdit
          Left = 10
          Top = 18
          Width = 82
          Height = 27
          BevelInner = bvNone
          BevelKind = bkFlat
          BevelOuter = bvRaised
          BevelWidth = 4
          BorderStyle = bsNone
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
        object edHistoricoMAQ_IN_CODIGO: TEdit
          Left = 103
          Top = 18
          Width = 93
          Height = 27
          BevelInner = bvNone
          BevelKind = bkFlat
          BevelOuter = bvRaised
          BevelWidth = 4
          BorderStyle = bsNone
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
        end
        object boHistoricoFiltrar: TButton
          Left = 695
          Top = 18
          Width = 118
          Height = 27
          Anchors = [akTop, akRight]
          Caption = 'Filtrar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          HotImageIndex = 0
          ImageIndex = 0
          ImageMargins.Left = 10
          ImageMargins.Right = -10
          Images = DM.ilBotoes
          ParentFont = False
          TabOrder = 2
          OnClick = boHistoricoFiltrarClick
        end
        object edHistoricoAPT_CH_STATUS: TComboBox
          Left = 526
          Top = 18
          Width = 125
          Height = 27
          AutoDropDown = True
          BevelInner = bvNone
          BevelKind = bkFlat
          BevelOuter = bvRaised
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ItemIndex = 0
          ParentFont = False
          TabOrder = 3
          Text = 'Todos'
          Items.Strings = (
            'Todos'
            'Abertos'
            'Encerrados')
        end
        object edHistoricoAPT_DT_APONTAMENTO: TMaskEdit
          Left = 211
          Top = 18
          Width = 145
          Height = 27
          BevelInner = bvNone
          BevelOuter = bvRaised
          BevelKind = bkFlat
          BevelWidth = 4
          BorderStyle = bsNone
          EditMask = '99/99/9999;1;_'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          MaxLength = 10
          ParentFont = False
          TabOrder = 4
          Text = '  /  /    '
        end
        object edHistoricoAPT_DT_ENCERRAMENTO: TMaskEdit
          Left = 368
          Top = 18
          Width = 145
          Height = 27
          BevelInner = bvNone
          BevelOuter = bvRaised
          BevelKind = bkFlat
          BevelWidth = 4
          BorderStyle = bsNone
          EditMask = '99/99/9999;1;_'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          MaxLength = 10
          ParentFont = False
          TabOrder = 5
          Text = '  /  /    '
        end
      end
    end
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 716
  end
  object cdsHistorico: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 584
    Top = 200
  end
  object dsHistorico: TDataSource
    DataSet = cdsHistorico
    Left = 584
    Top = 248
  end
end
