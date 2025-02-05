USE [master]
GO
/****** Object:  Database [Nm_CodeGenerator]    Script Date: 2019/8/9 22:55:49 ******/
CREATE DATABASE [Nm_CodeGenerator]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Nm_CodeGenerator', FILENAME = N'D:\Database\SqlServer\Nm_CodeGenerator.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Nm_CodeGenerator_log', FILENAME = N'D:\Database\SqlServer\Nm_CodeGenerator_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Nm_CodeGenerator] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Nm_CodeGenerator].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Nm_CodeGenerator] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Nm_CodeGenerator] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Nm_CodeGenerator] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Nm_CodeGenerator] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Nm_CodeGenerator] SET ARITHABORT OFF 
GO
ALTER DATABASE [Nm_CodeGenerator] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Nm_CodeGenerator] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Nm_CodeGenerator] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Nm_CodeGenerator] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Nm_CodeGenerator] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Nm_CodeGenerator] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Nm_CodeGenerator] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Nm_CodeGenerator] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Nm_CodeGenerator] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Nm_CodeGenerator] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Nm_CodeGenerator] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Nm_CodeGenerator] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Nm_CodeGenerator] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Nm_CodeGenerator] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Nm_CodeGenerator] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Nm_CodeGenerator] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Nm_CodeGenerator] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Nm_CodeGenerator] SET RECOVERY FULL 
GO
ALTER DATABASE [Nm_CodeGenerator] SET  MULTI_USER 
GO
ALTER DATABASE [Nm_CodeGenerator] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Nm_CodeGenerator] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Nm_CodeGenerator] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Nm_CodeGenerator] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Nm_CodeGenerator] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Nm_CodeGenerator', N'ON'
GO
--ALTER DATABASE [Nm_CodeGenerator] SET QUERY_STORE = OFF
GO
USE [Nm_CodeGenerator]
GO
/****** Object:  Table [dbo].[Class]    Script Date: 2019/8/9 22:55:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Class](
	[Id] [uniqueidentifier] NOT NULL,
	[ProjectId] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[TableName] [nvarchar](50) NOT NULL,
	[BaseEntityType] [smallint] NOT NULL,
	[Remarks] [nvarchar](50) NOT NULL,
	[CreatedTime] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[ModifiedTime] [datetime] NOT NULL,
	[ModifiedBy] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK__class__3214EC077CEBA953] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Class_Method]    Script Date: 2019/8/9 22:55:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Class_Method](
	[Id] [uniqueidentifier] NOT NULL,
	[ClassId] [uniqueidentifier] NOT NULL,
	[Query] [bit] NOT NULL,
	[Add] [bit] NOT NULL,
	[Delete] [bit] NOT NULL,
	[Edit] [bit] NOT NULL,
	[CreatedTime] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[ModifiedTime] [datetime] NOT NULL,
	[ModifiedBy] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK__class_me__3214EC072CE795F7] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Enum]    Script Date: 2019/8/9 22:55:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Enum](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Remarks] [nvarchar](50) NOT NULL,
	[CreatedTime] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[ModifiedTime] [datetime] NOT NULL,
	[ModifiedBy] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK__enum__3214EC07719DB03B] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Enum_Item]    Script Date: 2019/8/9 22:55:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Enum_Item](
	[Id] [uniqueidentifier] NOT NULL,
	[EnumId] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Value] [int] NOT NULL,
	[Remarks] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK__enum_ite__3214EC078DB0D805] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Model_Property]    Script Date: 2019/8/9 22:55:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Model_Property](
	[Id] [uniqueidentifier] NOT NULL,
	[ProjectId] [uniqueidentifier] NOT NULL,
	[ClassId] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Type] [smallint] NOT NULL,
	[ModelType] [smallint] NOT NULL,
	[Nullable] [bit] NOT NULL,
	[EnumId] [uniqueidentifier] NULL,
	[Remarks] [nvarchar](50) NOT NULL,
	[Sort] [int] NOT NULL,
	[CreatedTime] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[ModifiedTime] [datetime] NOT NULL,
	[ModifiedBy] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK__model_pr__3214EC07E72825FB] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Project]    Script Date: 2019/8/9 22:55:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Project](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[No] [int] NULL,
	[Prefix] [nvarchar](50) NULL,
	[Code] [nvarchar](50) NOT NULL,
	[CreatedTime] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[ModifiedTime] [datetime] NOT NULL,
	[ModifiedBy] [uniqueidentifier] NOT NULL,
	[Deleted] [bit] NOT NULL,
	[DeletedTime] [datetime] NOT NULL,
	[DeletedBy] [uniqueidentifier] NULL,
 CONSTRAINT [PK__project__3214EC075D3C079E] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[property]    Script Date: 2019/8/9 22:55:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[property](
	[Id] [uniqueidentifier] NOT NULL,
	[ProjectId] [uniqueidentifier] NOT NULL,
	[ClassId] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[IsPrimaryKey] [bit] NOT NULL,
	[IsInherit] [bit] NOT NULL,
	[Type] [smallint] NOT NULL,
	[Length] [int] NOT NULL,
	[Precision] [int] NOT NULL,
	[Scale] [int] NOT NULL,
	[EnumId] [uniqueidentifier] NOT NULL,
	[Nullable] [bit] NOT NULL,
	[ShowInList] [bit] NOT NULL,
	[HasDefaultValue] [bit] NOT NULL,
	[Remarks] [nvarchar](50) NOT NULL,
	[Sort] [int] NOT NULL,
	[CreatedTime] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[ModifiedTime] [datetime] NOT NULL,
	[ModifiedBy] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK__property__3214EC07FC35608A] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Class] ADD  CONSTRAINT [DF_Class_CreatedTime]  DEFAULT (getdate()) FOR [CreatedTime]
GO
ALTER TABLE [dbo].[Class] ADD  CONSTRAINT [DF_Class_ModifiedTime]  DEFAULT (getdate()) FOR [ModifiedTime]
GO
ALTER TABLE [dbo].[Class_Method] ADD  CONSTRAINT [DF_Class_Method_CreatedTime]  DEFAULT (getdate()) FOR [CreatedTime]
GO
ALTER TABLE [dbo].[Class_Method] ADD  CONSTRAINT [DF_Class_Method_ModifiedTime]  DEFAULT (getdate()) FOR [ModifiedTime]
GO
ALTER TABLE [dbo].[Enum] ADD  CONSTRAINT [DF_Enum_CreatedTime]  DEFAULT (getdate()) FOR [CreatedTime]
GO
ALTER TABLE [dbo].[Enum] ADD  CONSTRAINT [DF_Enum_ModifiedTime]  DEFAULT (getdate()) FOR [ModifiedTime]
GO
ALTER TABLE [dbo].[Model_Property] ADD  CONSTRAINT [DF_model_property_CreatedTime]  DEFAULT (getdate()) FOR [CreatedTime]
GO
ALTER TABLE [dbo].[Model_Property] ADD  CONSTRAINT [DF_model_property_ModifiedTime]  DEFAULT (getdate()) FOR [ModifiedTime]
GO
ALTER TABLE [dbo].[Project] ADD  CONSTRAINT [DF_Project_No]  DEFAULT ((0)) FOR [No]
GO
ALTER TABLE [dbo].[Project] ADD  CONSTRAINT [DF_Project_CreatedTime]  DEFAULT (getdate()) FOR [CreatedTime]
GO
ALTER TABLE [dbo].[Project] ADD  CONSTRAINT [DF_Project_ModifiedTime]  DEFAULT (getdate()) FOR [ModifiedTime]
GO
ALTER TABLE [dbo].[Project] ADD  CONSTRAINT [DF_Project_DeletedTime]  DEFAULT (getdate()) FOR [DeletedTime]
GO
ALTER TABLE [dbo].[property] ADD  CONSTRAINT [DF_property_CreatedTime]  DEFAULT (getdate()) FOR [CreatedTime]
GO
ALTER TABLE [dbo].[property] ADD  CONSTRAINT [DF_property_ModifiedTime]  DEFAULT (getdate()) FOR [ModifiedTime]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Class', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Class', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'表明' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Class', @level2type=N'COLUMN',@level2name=N'TableName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'基类类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Class', @level2type=N'COLUMN',@level2name=N'BaseEntityType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'说明' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Class', @level2type=N'COLUMN',@level2name=N'Remarks'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Class', @level2type=N'COLUMN',@level2name=N'CreatedTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Class', @level2type=N'COLUMN',@level2name=N'CreatedBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Class', @level2type=N'COLUMN',@level2name=N'ModifiedTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Class', @level2type=N'COLUMN',@level2name=N'ModifiedBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'实体编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Class_Method', @level2type=N'COLUMN',@level2name=N'ClassId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'查询列表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Class_Method', @level2type=N'COLUMN',@level2name=N'Query'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'添加' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Class_Method', @level2type=N'COLUMN',@level2name=N'Add'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'删除' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Class_Method', @level2type=N'COLUMN',@level2name=N'Delete'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编辑' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Class_Method', @level2type=N'COLUMN',@level2name=N'Edit'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Class_Method', @level2type=N'COLUMN',@level2name=N'CreatedTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Class_Method', @level2type=N'COLUMN',@level2name=N'CreatedBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Class_Method', @level2type=N'COLUMN',@level2name=N'ModifiedTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Class_Method', @level2type=N'COLUMN',@level2name=N'ModifiedBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Enum', @level2type=N'COLUMN',@level2name=N'CreatedTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Enum', @level2type=N'COLUMN',@level2name=N'CreatedBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Enum', @level2type=N'COLUMN',@level2name=N'ModifiedTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Enum', @level2type=N'COLUMN',@level2name=N'ModifiedBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'所属枚举' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Enum_Item', @level2type=N'COLUMN',@level2name=N'EnumId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Enum_Item', @level2type=N'COLUMN',@level2name=N'Value'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'关联项目' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Model_Property', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'模型类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Model_Property', @level2type=N'COLUMN',@level2name=N'ModelType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'可空' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Model_Property', @level2type=N'COLUMN',@level2name=N'Nullable'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Model_Property', @level2type=N'COLUMN',@level2name=N'Remarks'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Model_Property', @level2type=N'COLUMN',@level2name=N'Sort'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Model_Property', @level2type=N'COLUMN',@level2name=N'CreatedTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Model_Property', @level2type=N'COLUMN',@level2name=N'CreatedBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Model_Property', @level2type=N'COLUMN',@level2name=N'ModifiedTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Model_Property', @level2type=N'COLUMN',@level2name=N'ModifiedBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Project', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Project', @level2type=N'COLUMN',@level2name=N'No'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'前缀' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Project', @level2type=N'COLUMN',@level2name=N'Prefix'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Project', @level2type=N'COLUMN',@level2name=N'Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Project', @level2type=N'COLUMN',@level2name=N'CreatedTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Project', @level2type=N'COLUMN',@level2name=N'CreatedBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Project', @level2type=N'COLUMN',@level2name=N'ModifiedTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Project', @level2type=N'COLUMN',@level2name=N'ModifiedBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'关联项目' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'property', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'property', @level2type=N'COLUMN',@level2name=N'IsPrimaryKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否继承自基类实体' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'property', @level2type=N'COLUMN',@level2name=N'IsInherit'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'长度' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'property', @level2type=N'COLUMN',@level2name=N'Length'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'精度' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'property', @level2type=N'COLUMN',@level2name=N'Precision'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'刻度' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'property', @level2type=N'COLUMN',@level2name=N'Scale'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'关联枚举' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'property', @level2type=N'COLUMN',@level2name=N'EnumId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'可空' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'property', @level2type=N'COLUMN',@level2name=N'Nullable'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'列表中显示' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'property', @level2type=N'COLUMN',@level2name=N'ShowInList'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'有默认值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'property', @level2type=N'COLUMN',@level2name=N'HasDefaultValue'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'property', @level2type=N'COLUMN',@level2name=N'Remarks'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'property', @level2type=N'COLUMN',@level2name=N'Sort'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'property', @level2type=N'COLUMN',@level2name=N'CreatedTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'property', @level2type=N'COLUMN',@level2name=N'CreatedBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'property', @level2type=N'COLUMN',@level2name=N'ModifiedTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'property', @level2type=N'COLUMN',@level2name=N'ModifiedBy'
GO
USE [master]
GO
ALTER DATABASE [Nm_CodeGenerator] SET  READ_WRITE 
GO
