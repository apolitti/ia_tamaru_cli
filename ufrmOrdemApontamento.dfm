object frmOrdemApontamento: TfrmOrdemApontamento
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Ordem > Apontamento'
  ClientHeight = 432
  ClientWidth = 677
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = [fsBold]
  FormStyle = fsStayOnTop
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 677
    Height = 395
    Align = alClient
    Caption = '  Apontamento  '
    TabOrder = 0
    object Label13: TLabel
      Left = 13
      Top = 198
      Width = 108
      Height = 13
      Caption = 'Centro de Trabalho'
    end
    object Label1: TLabel
      Left = 13
      Top = 137
      Width = 48
      Height = 13
      Caption = 'Maquina'
    end
    object lbAPT_DT_APONTAMENTO: TLabel
      Left = 13
      Top = 252
      Width = 81
      Height = 13
      Caption = 'Data Abertura'
    end
    object lbAPT_RE_TEMPOINICIAL: TLabel
      Left = 169
      Top = 252
      Width = 81
      Height = 13
      Caption = 'Hora Abertura'
    end
    object lbAPT_RE_QUANTIDADE: TLabel
      Left = 116
      Top = 311
      Width = 65
      Height = 13
      Caption = 'Quantidade'
    end
    object lbAPT_DT_ENCERRAMENTO: TLabel
      Left = 361
      Top = 252
      Width = 110
      Height = 13
      Caption = 'Data Encerramento'
    end
    object lbAPT_RE_TEMPOFINAL: TLabel
      Left = 517
      Top = 252
      Width = 110
      Height = 13
      Caption = 'Hora Encerramento'
    end
    object lbAPT_RE_QUANTIDADEREF: TLabel
      Left = 218
      Top = 311
      Width = 84
      Height = 13
      Caption = 'Qtde Refugada'
    end
    object lbAPT_REF_IN_CODIGO_INT: TLabel
      Left = 320
      Top = 311
      Width = 39
      Height = 13
      Caption = 'Motivo'
    end
    object Label9: TLabel
      Left = 389
      Top = 137
      Width = 38
      Height = 13
      Caption = 'Ordem'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object Label10: TLabel
      Left = 101
      Top = 22
      Width = 105
      Height = 13
      Caption = 'Ordem Alternativo'
    end
    object Label12: TLabel
      Left = 313
      Top = 19
      Width = 24
      Height = 13
      Caption = 'Seq.'
    end
    object Label11: TLabel
      Left = 401
      Top = 19
      Width = 54
      Height = 13
      Caption = 'Opera'#231#227'o'
    end
    object Label14: TLabel
      Left = 13
      Top = 73
      Width = 45
      Height = 13
      Caption = 'Produto'
    end
    object Label7: TLabel
      Left = 306
      Top = 194
      Width = 80
      Height = 13
      Caption = 'C'#243'd. Operador'
    end
    object Label4: TLabel
      Left = 394
      Top = 194
      Width = 53
      Height = 13
      Caption = 'Operador'
    end
    object Label5: TLabel
      Left = 529
      Top = 137
      Width = 105
      Height = 13
      Caption = 'Seq. Apontamento'
    end
    object Label2: TLabel
      Left = 13
      Top = 22
      Width = 79
      Height = 13
      Caption = 'C'#243'digo Ordem'
    end
    object lbPOD_RE_QTDE_SALDO: TLabel
      Left = 13
      Top = 311
      Width = 31
      Height = 13
      Caption = 'Saldo'
    end
    object edMAQ_IN_CODIGO: TEdit
      Left = 13
      Top = 213
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
      TabOrder = 7
    end
    object edMAQ_ST_NOME: TEdit
      Left = 101
      Top = 213
      Width = 194
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
      TabOrder = 8
    end
    object edCMAQ_IN_CODIGO: TEdit
      Left = 13
      Top = 152
      Width = 56
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
      TabOrder = 2
      OnExit = edCMAQ_IN_CODIGOExit
    end
    object edCMAQ_ST_DESCRICAO: TEdit
      Left = 92
      Top = 152
      Width = 270
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
    object edAPT_RE_QUANTIDADE: TEdit
      Left = 116
      Top = 326
      Width = 95
      Height = 32
      Alignment = taRightJustify
      BevelInner = bvNone
      BevelKind = bkFlat
      BevelOuter = bvRaised
      BorderStyle = bsNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -22
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      OnExit = edAPT_RE_QUANTIDADEExit
    end
    object edAPT_RE_QUANTIDADEREF: TEdit
      Left = 218
      Top = 326
      Width = 95
      Height = 32
      Alignment = taRightJustify
      BevelInner = bvNone
      BevelKind = bkFlat
      BevelOuter = bvRaised
      BorderStyle = bsNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -22
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      OnExit = edAPT_RE_QUANTIDADEREFExit
    end
    object edAPT_REF_IN_CODIGO_INT: TEdit
      Left = 320
      Top = 326
      Width = 50
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
      TabOrder = 6
      OnExit = edAPT_REF_IN_CODIGO_INTExit
    end
    object edREF_ST_DESCRICAO: TEdit
      Left = 393
      Top = 326
      Width = 274
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
    object edORD_IN_CODIGO: TEdit
      Left = 389
      Top = 152
      Width = 82
      Height = 32
      TabStop = False
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
    object edORD_ST_ALTERNATIVO: TEdit
      Left = 101
      Top = 37
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
      TabOrder = 11
    end
    object edPLF_IN_SQOPERACAO: TEdit
      Left = 313
      Top = 38
      Width = 82
      Height = 32
      Alignment = taRightJustify
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
      TabOrder = 1
      OnExit = edPLF_IN_SQOPERACAOExit
    end
    object edOPR_IN_CODIGO: TEdit
      Left = 401
      Top = 37
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
      TabOrder = 12
    end
    object edOPR_ST_OPERACAO: TEdit
      Left = 481
      Top = 37
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
      TabOrder = 13
    end
    object edPRO_ST_ALTERNATIVO: TEdit
      Left = 13
      Top = 92
      Width = 193
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
      TabOrder = 14
    end
    object edPRO_ST_DESCRICAO: TEdit
      Left = 212
      Top = 92
      Width = 455
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
      TabOrder = 15
    end
    object edOPD_ST_ALTERNATIVO: TEdit
      Left = 306
      Top = 213
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
      TabOrder = 3
      OnExit = edOPD_ST_ALTERNATIVOExit
    end
    object edOPD_ST_DESCRICAO: TEdit
      Left = 394
      Top = 213
      Width = 273
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
      TabOrder = 16
    end
    object edAPT_IN_SEQUENCIA: TEdit
      Left = 529
      Top = 152
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
      TabOrder = 17
    end
    object boAPT_REF_IN_CODIGO_INT: TButton
      Left = 371
      Top = 326
      Width = 16
      Height = 32
      Caption = '...'
      TabOrder = 18
      OnClick = boAPT_REF_IN_CODIGO_INTClick
    end
    object boCMAQ_IN_CODIGO: TButton
      Left = 70
      Top = 152
      Width = 16
      Height = 32
      Caption = '...'
      TabOrder = 19
      TabStop = False
      OnClick = boCMAQ_IN_CODIGOClick
    end
    object edORD_IN_CODIGO_PAI: TEdit
      Left = 13
      Top = 37
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
      TabOrder = 20
      OnExit = edORD_IN_CODIGOExit
    end
    object edAPT_CH_STATUS: TCheckBox
      Left = 13
      Top = 368
      Width = 148
      Height = 17
      Caption = 'Encerra Apontamento'
      TabOrder = 21
    end
    object edAPT_DT_APONTAMENTO: TMaskEdit
      Left = 13
      Top = 268
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
      TabOrder = 22
      Text = '  /  /    '
    end
    object edAPT_RE_TEMPOINICIAL: TMaskEdit
      Left = 166
      Top = 268
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
      TabOrder = 23
      Text = '  :  '
    end
    object edAPT_DT_ENCERRAMENTO: TMaskEdit
      Left = 361
      Top = 268
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
      TabOrder = 24
      Text = '  /  /    '
    end
    object edAPT_RE_TEMPOFINAL: TMaskEdit
      Left = 517
      Top = 268
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
      TabOrder = 25
      Text = '  :  '
    end
    object edPOD_RE_QTDE_SALDO: TEdit
      Left = 13
      Top = 326
      Width = 95
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
      TabOrder = 26
    end
    object edPOD_BO_VALIDA_SALDO: TEdit
      Left = 13
      Top = 326
      Width = 29
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
      TabOrder = 27
      Visible = False
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 395
    Width = 677
    Height = 37
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      677
      37)
    object lbTipoApontamento: TLabel
      Left = 7
      Top = 7
      Width = 176
      Height = 22
      Caption = 'lbTipoApontamento'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -18
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object boConfirmar: TButton
      Left = 445
      Top = 6
      Width = 100
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Confirmar'
      TabOrder = 0
      OnClick = boConfirmarClick
    end
    object boCancelar: TButton
      Left = 567
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
