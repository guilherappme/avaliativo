USE [briefing]
GO
	CREATE TABLE [dbo].[Estados](
	                             [codigo] [int] NOT NULL,
	                             [UF] [nvarchar](50) NULL,
	                             [SIGLA] [nvarchar](2) NULL,
 CONSTRAINT [PK_Estados] PRIMARY KEY CLUSTERED 
(
	[codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE TABLE [dbo].[cidades](
	[codigo] [int] NOT NULL,
	[nome] [nvarchar](50) NULL,
	[id_uf] [int] NOT NULL,
 CONSTRAINT [PK_cidades] PRIMARY KEY CLUSTERED 
(
	[codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[cidades]  WITH CHECK ADD  CONSTRAINT [fk_cidade_estado] FOREIGN KEY([id_uf])
REFERENCES [dbo].[Estados] ([codigo])
GO

ALTER TABLE [dbo].[cidades] CHECK CONSTRAINT [fk_cidade_estado]
GO


CREATE TABLE [dbo].[Usuarios](
	[codigo] [int] NOT NULL,
	[email] [nvarchar](50) NULL,
	[CPF] [nvarchar](11) NULL,
	[sexo] [nvarchar](20) NULL,
	[senha] [nvarchar](50) NULL,
    [telefone] [nvarchar](11) NULL,
	[Dat_cadastro] [datetime] NULL,
	
 CONSTRAINT [PK_usuario] PRIMARY KEY CLUSTERED 
(
	[codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


CREATE TABLE [dbo].[TblPais](
	[codigo] [int] NOT NULL,
	[Nome] [nvarchar](50) NULL,
	[CPF] [nvarchar](11) NULL,
	[RG] [nvarchar](20) NULL,
	[profissao] [nvarchar](50) NULL,
    [cel] [nvarchar](11) NULL,
	[Dat_cadastro] [date] NULL,
	[id_usuario] [int] NOT NULL,
	[Dat_alteração] [date] NULL,
 CONSTRAINT [PK_pais] PRIMARY KEY CLUSTERED 
(
	[codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[TblPais]  WITH CHECK ADD  CONSTRAINT [fk_usuario_tblpais] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[usuarios] ([codigo])
GO

ALTER TABLE [dbo].[TblPais] CHECK CONSTRAINT [fk_usuario_tblpais]
GO

CREATE TABLE [dbo].[TblMaes](
	[codigo] [int] NOT NULL,
	[Nome] [nvarchar](50) NULL,
	[CPF] [nvarchar](11) NULL,
	[RG] [nvarchar](20) NULL,
	[profissao] [nvarchar](50) NULL,
    [cel] [nvarchar](11) NULL,
	[Dat_cadastro] [date] NULL,
	[id_usuario] [int] NOT NULL,
	[Dat_alteração] [date] NULL,
 CONSTRAINT [PK_maes] PRIMARY KEY CLUSTERED 
(
	[codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TblMaes]  WITH CHECK ADD  CONSTRAINT [fk_usuario_TblMaes] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[usuarios] ([codigo])
GO

ALTER TABLE [dbo].[TblMaes] CHECK CONSTRAINT [fk_usuario_TblMaes]
GO


CREATE TABLE [dbo].[alunos](
	[codigo] [int] NOT NULL,
	[email] [nvarchar](50) NULL,
	[CPF] [nvarchar](11) NULL,
	[nome] [nvarchar](20) NULL,
	[endereço] [nvarchar](50) NULL,
	[matricula] [nvarchar](50) NULL,
	[numero] [nvarchar](50) NULL,
    [telefone] [nvarchar](11) NULL,
	[Dat_nasc] [date] NULL,
	[Dat_cadastro] [date] NULL,
	[Dat_alter] [date] NULL,
	[id_cidade] [int] NOT NULL,
	[id_usuario] [int] NOT NULL,
	
	[id_mae] [int] NOT NULL,
	[id_pai] [int] NOT NULL,

 CONSTRAINT [PK_alunos] PRIMARY KEY CLUSTERED 
(
	[codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[alunos]  WITH CHECK ADD  CONSTRAINT [fk_aluno_cidade] FOREIGN KEY([id_cidade])
REFERENCES [dbo].[Cidades] ([codigo])
GO

ALTER TABLE [dbo].[alunos] CHECK CONSTRAINT [fk_aluno_cidade]
GO

GO
ALTER TABLE [dbo].[alunos]  WITH CHECK ADD  CONSTRAINT [fk_usuario_aluno] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[usuarios] ([codigo])
GO

ALTER TABLE [dbo].[alunos] CHECK CONSTRAINT [fk_usuario_aluno]
GO

GO
ALTER TABLE [dbo].[alunos]  WITH CHECK ADD  CONSTRAINT [fk_aluno_mae] FOREIGN KEY([id_mae])
REFERENCES [dbo].[tblmaes] ([codigo])
GO

ALTER TABLE [dbo].[alunos] CHECK CONSTRAINT [fk_aluno_mae]
GO

GO
ALTER TABLE [dbo].[alunos]  WITH CHECK ADD  CONSTRAINT [fk_aluno_pai] FOREIGN KEY([id_pai])
REFERENCES [dbo].[tblpais] ([codigo])
GO

ALTER TABLE [dbo].[alunos] CHECK CONSTRAINT [fk_aluno_pai]
GO



