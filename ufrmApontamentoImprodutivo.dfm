object frmApontamentoImprodutivo: TfrmApontamentoImprodutivo
  Left = 0
  Top = 0
  Caption = 'Ocorr'#234'ncia'
  ClientHeight = 474
  ClientWidth = 662
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = [fsBold]
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object gbDados: TGroupBox
    Left = 0
    Top = 0
    Width = 662
    Height = 437
    Align = alClient
    Caption = '  Dados  '
    TabOrder = 0
    object pnDados: TPanel
      Left = 2
      Top = 15
      Width = 658
      Height = 420
      Align = alClient
      BevelOuter = bvNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object pnAPT_ST_OBSERVACAO: TPanel
        Left = 0
        Top = 300
        Width = 658
        Height = 89
        Align = alTop
        BevelOuter = bvNone
        Caption = 'pnAPT_ST_OBSERVACAO'
        TabOrder = 6
        object Label3: TLabel
          Left = 7
          Top = 6
          Width = 70
          Height = 13
          Caption = 'Observa'#231#227'o:'
        end
        object edAPT_ST_OBSERVACAO: TMemo
          Left = 7
          Top = 22
          Width = 634
          Height = 67
          BevelInner = bvNone
          BevelKind = bkFlat
          BevelOuter = bvRaised
          BorderStyle = bsNone
          TabOrder = 0
        end
      end
      object pnAPT_CH_STATUS: TPanel
        Left = 0
        Top = 389
        Width = 658
        Height = 43
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 7
        object edAPT_CH_STATUS: TCheckBox
          Left = 9
          Top = 4
          Width = 148
          Height = 17
          Caption = 'Encerra Apontamento'
          TabOrder = 0
        end
        object edAPT_IN_SEQUENCIA: TEdit
          Left = 190
          Top = 4
          Width = 138
          Height = 32
          TabStop = False
          Alignment = taRightJustify
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
          Visible = False
        end
      end
      object pnAPT_ATI_IN_CODIGO: TPanel
        Left = 0
        Top = 0
        Width = 658
        Height = 50
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object Label5: TLabel
          Left = 7
          Top = 2
          Width = 61
          Height = 13
          Caption = 'Ocorr'#234'ncia'
        end
        object edAPT_ATI_IN_CODIGO: TEdit
          Left = 7
          Top = 14
          Width = 80
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
          OnEnter = edAPT_ATI_IN_CODIGOEnter
          OnExit = edAPT_ATI_IN_CODIGOExit
        end
        object boAPT_ATI_IN_CODIGO: TButton
          Left = 90
          Top = 14
          Width = 16
          Height = 32
          Caption = '...'
          TabOrder = 1
          TabStop = False
          OnClick = boAPT_ATI_IN_CODIGOClick
        end
        object edATI_ST_NOME: TEdit
          Left = 112
          Top = 14
          Width = 400
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
      end
      object pnAPT_MAQ_IN_CODIGO: TPanel
        Left = 0
        Top = 50
        Width = 658
        Height = 50
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
        object Label13: TLabel
          Left = 7
          Top = 2
          Width = 108
          Height = 13
          Caption = 'Centro de Trabalho'
        end
        object edAPT_MAQ_IN_CODIGO: TEdit
          Left = 7
          Top = 17
          Width = 80
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
          OnExit = edAPT_MAQ_IN_CODIGOExit
        end
        object boAPT_MAQ_IN_CODIGO: TButton
          Left = 90
          Top = 17
          Width = 16
          Height = 32
          Caption = '...'
          TabOrder = 1
          TabStop = False
          OnClick = boAPT_MAQ_IN_CODIGOClick
        end
        object edMAQ_ST_NOME: TEdit
          Left = 112
          Top = 17
          Width = 400
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
      end
      object pnCMAQ_IN_CODIGO: TPanel
        Left = 0
        Top = 100
        Width = 658
        Height = 50
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 2
        object Label1: TLabel
          Left = 7
          Top = 2
          Width = 48
          Height = 13
          Caption = 'Maquina'
        end
        object edCMAQ_IN_CODIGO: TEdit
          Left = 7
          Top = 17
          Width = 80
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
          OnExit = edCMAQ_IN_CODIGOExit
        end
        object boCMAQ_IN_CODIGO: TButton
          Left = 90
          Top = 17
          Width = 16
          Height = 32
          Caption = '...'
          TabOrder = 1
          TabStop = False
          OnClick = boCMAQ_IN_CODIGOClick
        end
        object edCMAQ_ST_DESCRICAO: TEdit
          Left = 112
          Top = 17
          Width = 400
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
      end
      object pnOPD_ST_ALTERNATIVO: TPanel
        Left = 0
        Top = 150
        Width = 658
        Height = 50
        Align = alTop
        BevelOuter = bvNone
        Caption = 'pnOPD_ST_ALTERNATIVO'
        TabOrder = 3
        object Label7: TLabel
          Left = 7
          Top = 2
          Width = 80
          Height = 13
          Caption = 'C'#243'd. Operador'
        end
        object edOPD_ST_ALTERNATIVO: TEdit
          Left = 7
          Top = 14
          Width = 99
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
          OnExit = edOPD_ST_ALTERNATIVOExit
        end
        object edOPD_ST_DESCRICAO: TEdit
          Left = 112
          Top = 12
          Width = 400
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
      end
      object pnORD_IN_CODIGO: TPanel
        Left = 0
        Top = 200
        Width = 658
        Height = 50
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 4
        object Label2: TLabel
          Left = 7
          Top = 2
          Width = 98
          Height = 13
          Caption = 'Ordem/Opera'#231#227'o'
        end
        object Label10: TLabel
          Left = 152
          Top = 2
          Width = 105
          Height = 13
          Caption = 'Ordem Alternativo'
        end
        object Label4: TLabel
          Left = 391
          Top = 2
          Width = 54
          Height = 13
          Caption = 'Opera'#231#227'o'
        end
        object edORD_IN_CODIGO: TEdit
          Left = 7
          Top = 17
          Width = 139
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
          OnExit = edORD_IN_CODIGOExit
        end
        object edORD_ST_ALTERNATIVO: TEdit
          Left = 152
          Top = 17
          Width = 233
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
        object edOPR_IN_CODIGO: TEdit
          Left = 391
          Top = 17
          Width = 121
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
      end
      object pnHorarios: TPanel
        Left = 0
        Top = 250
        Width = 658
        Height = 50
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 5
        object pnAPT_DT_APONTAMENTO: TPanel
          Left = 0
          Top = 0
          Width = 328
          Height = 50
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 0
          object lbAPT_DT_APONTAMENTO: TLabel
            Left = 7
            Top = 2
            Width = 81
            Height = 13
            Caption = 'Data Abertura'
          end
          object lbAPT_RE_TEMPOINICIAL: TLabel
            Left = 163
            Top = 2
            Width = 81
            Height = 13
            Caption = 'Hora Abertura'
          end
          object edAPT_DT_APONTAMENTO: TMaskEdit
            Left = 7
            Top = 17
            Width = 145
            Height = 32
            BevelInner = bvNone
            BevelOuter = bvRaised
            BevelKind = bkFlat
            BorderStyle = bsNone
            EditMask = '99/99/9999;1;_'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -20
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            MaxLength = 10
            ParentFont = False
            TabOrder = 0
            Text = '  /  /    '
            OnExit = edAPT_DT_APONTAMENTOExit
          end
          object edAPT_RE_TEMPOINICIAL: TMaskEdit
            Left = 160
            Top = 17
            Width = 81
            Height = 32
            BevelInner = bvNone
            BevelOuter = bvRaised
            BevelKind = bkFlat
            BorderStyle = bsNone
            EditMask = '!99:99;1;_'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -20
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            MaxLength = 5
            ParentFont = False
            TabOrder = 1
            Text = '  :  '
            OnExit = edAPT_RE_TEMPOINICIALExit
          end
        end
        object pnAPT_DT_ENCERRAMENTO: TPanel
          Left = 328
          Top = 0
          Width = 324
          Height = 50
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 1
          object lbAPT_DT_ENCERRAMENTO: TLabel
            Left = 7
            Top = 2
            Width = 110
            Height = 13
            Caption = 'Data Encerramento'
          end
          object lbAPT_RE_TEMPOFINAL: TLabel
            Left = 163
            Top = 2
            Width = 110
            Height = 13
            Caption = 'Hora Encerramento'
          end
          object edAPT_RE_TEMPOFINAL: TMaskEdit
            Left = 163
            Top = 17
            Width = 81
            Height = 32
            BevelInner = bvNone
            BevelOuter = bvRaised
            BevelKind = bkFlat
            BorderStyle = bsNone
            EditMask = '!99:99;1;_'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -20
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            MaxLength = 5
            ParentFont = False
            TabOrder = 0
            Text = '  :  '
            OnExit = edAPT_RE_TEMPOFINALExit
          end
          object edAPT_DT_ENCERRAMENTO: TMaskEdit
            Left = 7
            Top = 17
            Width = 147
            Height = 32
            BevelInner = bvNone
            BevelOuter = bvRaised
            BevelKind = bkFlat
            BorderStyle = bsNone
            EditMask = '!99/99/9999;1;_'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -20
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            MaxLength = 10
            ParentFont = False
            TabOrder = 1
            Text = '  /  /    '
            OnExit = edAPT_DT_ENCERRAMENTOExit
          end
        end
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 437
    Width = 662
    Height = 37
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      662
      37)
    object boConfirmar: TButton
      Left = 442
      Top = 6
      Width = 100
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Confirmar'
      TabOrder = 0
      OnClick = boConfirmarClick
    end
    object boCancelar: TButton
      Left = 562
      Top = 6
      Width = 100
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Cancelar'
      TabOrder = 1
      OnClick = boCancelarClick
    end
  end
end
