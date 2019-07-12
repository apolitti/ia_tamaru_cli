object frmConsultaGrid: TfrmConsultaGrid
  Left = 0
  Top = 0
  Caption = 'Consulta Grid'
  ClientHeight = 269
  ClientWidth = 688
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnTopo: TPanel
    Left = 0
    Top = 0
    Width = 688
    Height = 65
    Align = alTop
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 11
      Width = 42
      Height = 13
      Caption = 'Campo:'
    end
    object Label2: TLabel
      Left = 207
      Top = 11
      Width = 32
      Height = 13
      Caption = 'Valor:'
    end
    object edValor: TEdit
      Left = 207
      Top = 27
      Width = 474
      Height = 32
      BevelInner = bvNone
      BevelKind = bkFlat
      BevelOuter = bvRaised
      BevelWidth = 3
      BorderStyle = bsNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnExit = edValorExit
    end
    object edCampo: TComboBox
      Left = 8
      Top = 27
      Width = 193
      Height = 32
      AutoDropDown = True
      BevelInner = bvNone
      BevelKind = bkFlat
      BevelOuter = bvRaised
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
  end
  object gdConsulta: TDBGrid
    Left = 0
    Top = 65
    Width = 688
    Height = 168
    Align = alClient
    DataSource = dsConsulta
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = gdConsultaDblClick
    Columns = <
      item
        Expanded = False
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        Width = 500
        Visible = True
      end>
  end
  object pnBase: TPanel
    Left = 0
    Top = 233
    Width = 688
    Height = 36
    Align = alBottom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    DesignSize = (
      688
      36)
    object boConfirmar: TButton
      Left = 581
      Top = 6
      Width = 100
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Confirmar'
      TabOrder = 0
    end
  end
  object dsConsulta: TDataSource
    DataSet = cdsConsulta
    Left = 424
    Top = 120
  end
  object cdsConsulta: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 328
    Top = 120
  end
end
