## SYSTEM DATA

Characteristics of the development environment.<br/>
IDE RADStudio [Delphi] 10.3 <br/>
SQL Server  14.0.1000 EXPRESS <br/>
Microsoft Windows 10  Home<br/>

<hr />
This app uses external component from [leogregianin] (https://github.com/leogregianin/ofx-reader)

<hr/>
API from [HG Brasil] (https://api.hgbrasil.com/finance)

<pre><code>
{
  "by": "default",
  "valid_key": false,
  "results": {
    "currencies": {
      "source": "BRL",
      "USD": {
        "name": "Dollar",
        "buy": 5.207,
        "sell": 5.2311,
        "variation": -0.14
      },
      "EUR": {
        "name": "Euro",
        "buy": 6.0769,
        "sell": 6.0993,
        "variation": 0.539
      },
...
</code></pre>

<hr />
### MS-SQL TABLES

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

--NO RELATIONSHIPS.
</code>
</pre>


