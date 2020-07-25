# DADOS DO SISTEMA

## SQL TABLES

<pre><code>
USE [SelecaoRicardo]
GO
/****** Object:  Table [dbo].[Cotacao]    Script Date: 20/8/19 11:34:35 ******/
CREATE TABLE [dbo].[Cotacao](
  [id] [int] IDENTITY(1,1) NOT NULL,
  [data] [datetime] NULL,
  [moeda] [char](10) NULL,
  [operacao] [char](10) NULL,
  [valor] [float] NULL,
  CONSTRAINT [PK_Cotacao] PRIMARY KEY CLUSTERED 
  (
    [id] ASC
  )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS 
  = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
  ) ON [PRIMARY]
GO
CREATE TABLE [dbo].[Movimento](
  [Id] [int] NOT NULL,
  [cliNum] [int] NULL,
  [descmov] [nvarchar](50) NULL,
  [datamov] [date] NULL,
  [valormov] [float] NULL,
  [saldomov] [float] NULL,
  PRIMARY KEY CLUSTERED 
  (
    [Id] ASC
    )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS 
    = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
  ) ON [PRIMARY]
GO

--NAO HA RELACIONAMENTOS.
</code>
</pre>


