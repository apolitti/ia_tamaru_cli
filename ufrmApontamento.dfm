object frmApontamento: TfrmApontamento
  Left = 0
  Top = 0
  Caption = 'Apontamentos'
  ClientHeight = 353
  ClientWidth = 647
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
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
    Width = 647
    Height = 209
    Align = alTop
    Caption = '  Dados da Ordem  '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    ExplicitLeft = -8
    ExplicitTop = -120
    object Label7: TLabel
      Left = 18
      Top = 25
      Width = 80
      Height = 13
      Caption = 'C'#243'd. Operador'
    end
    object Label1: TLabel
      Left = 106
      Top = 25
      Width = 53
      Height = 13
      Caption = 'Operador'
    end
    object Label2: TLabel
      Left = 18
      Top = 67
      Width = 79
      Height = 13
      Caption = 'C'#243'digo Ordem'
    end
    object Label3: TLabel
      Left = 18
      Top = 108
      Width = 72
      Height = 13
      Caption = 'C'#243'd. Produto'
    end
    object Label4: TLabel
      Left = 271
      Top = 108
      Width = 45
      Height = 13
      Caption = 'Produto'
    end
    object Label5: TLabel
      Left = 106
      Top = 152
      Width = 71
      Height = 13
      Caption = 'C'#243'digo Oper.'
    end
    object Label6: TLabel
      Left = 195
      Top = 152
      Width = 54
      Height = 13
      Caption = 'Opera'#231#227'o'
    end
    object Label9: TLabel
      Left = 106
      Top = 108
      Width = 91
      Height = 13
      Caption = 'C'#243'd. Alternativo'
    end
    object Label10: TLabel
      Left = 106
      Top = 67
      Width = 91
      Height = 13
      Caption = 'C'#243'd. Alternativo'
    end
    object Label11: TLabel
      Left = 209
      Top = 67
      Width = 105
      Height = 13
      Caption = 'Data Recebimento'
    end
    object Label12: TLabel
      Left = 18
      Top = 152
      Width = 81
      Height = 13
      Caption = 'Seq. Opera'#231#227'o'
    end
    object edOPD_ST_ALTERNATIVO: TEdit
      Left = 18
      Top = 42
      Width = 82
      Height = 21
      BevelInner = bvNone
      BevelKind = bkFlat
      BevelOuter = bvRaised
      BorderStyle = bsNone
      TabOrder = 0
      OnExit = edOPD_ST_ALTERNATIVOExit
    end
    object edOPD_ST_DESCRICAO: TEdit
      Left = 106
      Top = 42
      Width = 395
      Height = 21
      TabStop = False
      BevelInner = bvNone
      BevelKind = bkFlat
      BevelOuter = bvRaised
      BorderStyle = bsNone
      Color = cl3DLight
      TabOrder = 1
    end
    object edORD_IN_CODIGO: TEdit
      Left = 18
      Top = 82
      Width = 82
      Height = 21
      BevelInner = bvNone
      BevelKind = bkFlat
      BevelOuter = bvRaised
      BorderStyle = bsNone
      TabOrder = 2
      OnExit = edORD_IN_CODIGOExit
    end
    object edPRO_IN_CODIGO: TEdit
      Left = 18
      Top = 125
      Width = 82
      Height = 21
      TabStop = False
      BevelInner = bvNone
      BevelKind = bkFlat
      BevelOuter = bvRaised
      BorderStyle = bsNone
      Color = cl3DLight
      TabOrder = 3
    end
    object edPRO_ST_DESCRICAO: TEdit
      Left = 271
      Top = 125
      Width = 354
      Height = 21
      TabStop = False
      BevelInner = bvNone
      BevelKind = bkFlat
      BevelOuter = bvRaised
      BorderStyle = bsNone
      Color = cl3DLight
      TabOrder = 4
    end
    object edOPR_IN_CODIGO: TEdit
      Left = 106
      Top = 171
      Width = 82
      Height = 21
      TabStop = False
      BevelInner = bvNone
      BevelKind = bkFlat
      BevelOuter = bvRaised
      BorderStyle = bsNone
      Color = cl3DLight
      TabOrder = 5
    end
    object edOPR_ST_OPERACAO: TEdit
      Left = 195
      Top = 171
      Width = 430
      Height = 21
      TabStop = False
      BevelInner = bvNone
      BevelKind = bkFlat
      BevelOuter = bvRaised
      BorderStyle = bsNone
      Color = cl3DLight
      TabOrder = 6
    end
    object edPRO_ST_ALTERNATIVO: TEdit
      Left = 106
      Top = 125
      Width = 160
      Height = 21
      TabStop = False
      BevelInner = bvNone
      BevelKind = bkFlat
      BevelOuter = bvRaised
      BorderStyle = bsNone
      Color = cl3DLight
      TabOrder = 7
    end
    object edORD_ST_ALTERNATIVO: TEdit
      Left = 106
      Top = 82
      Width = 97
      Height = 21
      TabStop = False
      BevelInner = bvNone
      BevelKind = bkFlat
      BevelOuter = bvRaised
      BorderStyle = bsNone
      Color = cl3DLight
      TabOrder = 8
    end
    object edORD_DT_RECEBIMENTO: TEdit
      Left = 209
      Top = 82
      Width = 97
      Height = 21
      TabStop = False
      BevelInner = bvNone
      BevelKind = bkFlat
      BevelOuter = bvRaised
      BorderStyle = bsNone
      Color = cl3DLight
      TabOrder = 9
    end
    object edPLF_IN_SQOPERACAO: TEdit
      Left = 18
      Top = 171
      Width = 82
      Height = 21
      BevelInner = bvNone
      BevelKind = bkFlat
      BevelOuter = bvRaised
      BorderStyle = bsNone
      TabOrder = 10
      OnExit = edPLF_IN_SQOPERACAOExit
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 209
    Width = 647
    Height = 144
    Align = alClient
    Caption = '  Apontamentos  '
    TabOrder = 1
    ExplicitLeft = 312
    ExplicitTop = 216
    ExplicitWidth = 185
    ExplicitHeight = 105
    object gdApontamentos: TDBGrid
      Left = 2
      Top = 15
      Width = 643
      Height = 90
      Align = alClient
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
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
          Title.Caption = 'Data Abertura'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'APT_DT_ENCERRAMENTO'
          Title.Caption = 'Data Encerramento'
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
          Title.Caption = 'Motivo Refugo'
          Width = 200
          Visible = True
        end>
    end
    object Panel1: TPanel
      Left = 2
      Top = 105
      Width = 643
      Height = 37
      Align = alBottom
      TabOrder = 1
      ExplicitTop = 106
      object Button1: TButton
        Left = 13
        Top = 6
        Width = 100
        Height = 25
        Caption = 'Apontar'
        TabOrder = 0
      end
      object Button2: TButton
        Left = 133
        Top = 6
        Width = 100
        Height = 25
        Caption = 'Encerrar'
        TabOrder = 1
      end
      object Button3: TButton
        Left = 253
        Top = 6
        Width = 100
        Height = 25
        Caption = 'Excluir'
        TabOrder = 2
      end
    end
  end
  object cdsApontamentos: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 496
    Top = 72
  end
  object dsApontamentos: TDataSource
    DataSet = cdsApontamentos
    Left = 496
    Top = 120
  end
end
