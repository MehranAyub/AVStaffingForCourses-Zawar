USE [master]
GO
/****** Object:  Database [MyHealthCare]    Script Date: 2021-06-27 1:37:13 AM ******/
CREATE DATABASE [MyHealthCare]
 CONTAINMENT = NONE
 ON  PRIMARY 

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MyHealthCare].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MyHealthCare] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MyHealthCare] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MyHealthCare] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MyHealthCare] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MyHealthCare] SET ARITHABORT OFF 
GO
ALTER DATABASE [MyHealthCare] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MyHealthCare] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MyHealthCare] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MyHealthCare] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MyHealthCare] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MyHealthCare] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MyHealthCare] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MyHealthCare] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MyHealthCare] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MyHealthCare] SET  ENABLE_BROKER 
GO
ALTER DATABASE [MyHealthCare] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MyHealthCare] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MyHealthCare] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MyHealthCare] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MyHealthCare] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MyHealthCare] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [MyHealthCare] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MyHealthCare] SET RECOVERY FULL 
GO
ALTER DATABASE [MyHealthCare] SET  MULTI_USER 
GO
ALTER DATABASE [MyHealthCare] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MyHealthCare] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MyHealthCare] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MyHealthCare] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MyHealthCare] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'MyHealthCare', N'ON'
GO
USE [MyHealthCare]
GO
/****** Object:  Schema [Content]    Script Date: 2021-06-27 1:37:13 AM ******/
CREATE SCHEMA [Content]
GO
/****** Object:  Schema [Emails]    Script Date: 2021-06-27 1:37:13 AM ******/
CREATE SCHEMA [Emails]
GO
/****** Object:  Schema [HangFire]    Script Date: 2021-06-27 1:37:13 AM ******/
CREATE SCHEMA [HangFire]
GO
/****** Object:  Schema [Logs]    Script Date: 2021-06-27 1:37:13 AM ******/
CREATE SCHEMA [Logs]
GO
/****** Object:  Schema [MAR]    Script Date: 2021-06-27 1:37:13 AM ******/
CREATE SCHEMA [MAR]
GO
/****** Object:  Schema [Workers]    Script Date: 2021-06-27 1:37:13 AM ******/
CREATE SCHEMA [Workers]
GO
/****** Object:  Table [Content].[AboutUs]    Script Date: 2021-06-27 1:37:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Content].[AboutUs](
	[PortfolioId] [int] NOT NULL,
	[Title] [nvarchar](max) NULL,
	[Subtitle] [nvarchar](max) NULL,
	[Section1] [nvarchar](max) NULL,
	[Section2] [nvarchar](max) NULL,
	[Section3] [nvarchar](max) NULL,
	[Section4] [nvarchar](max) NULL,
	[Section5] [nvarchar](max) NULL,
 CONSTRAINT [PK_Content.AboutUs] PRIMARY KEY CLUSTERED 
(
	[PortfolioId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Content].[ContactUs]    Script Date: 2021-06-27 1:37:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Content].[ContactUs](
	[PortfolioId] [int] NOT NULL,
	[Title] [nvarchar](max) NULL,
	[Subtitle] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
 CONSTRAINT [PK_Content.ContactUs] PRIMARY KEY CLUSTERED 
(
	[PortfolioId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Content].[Media]    Script Date: 2021-06-27 1:37:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Content].[Media](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MediaUrl] [nvarchar](max) NULL,
	[FileName] [nvarchar](max) NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateUpdated] [datetime] NOT NULL,
 CONSTRAINT [PK_Content.Media] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Content].[Portfolio]    Script Date: 2021-06-27 1:37:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Content].[Portfolio](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Language] [nvarchar](max) NULL,
	[HomeTitle] [nvarchar](max) NULL,
	[HomeSubTitle] [nvarchar](max) NULL,
	[WhiteLogo] [nvarchar](max) NULL,
	[BlackLogo] [nvarchar](max) NULL,
	[Services] [nvarchar](max) NULL,
	[TestimonialTitle] [nvarchar](max) NULL,
	[TestimonialSubtitle] [nvarchar](max) NULL,
	[PackagesTitle] [nvarchar](max) NULL,
	[About] [nvarchar](max) NULL,
 CONSTRAINT [PK_Content.Portfolio] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Content].[TermsOfService]    Script Date: 2021-06-27 1:37:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Content].[TermsOfService](
	[PortfolioId] [int] NOT NULL,
	[Title] [nvarchar](max) NULL,
	[DateUpdated] [datetime] NOT NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Content.TermsOfService] PRIMARY KEY CLUSTERED 
(
	[PortfolioId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Content].[Testimonial]    Script Date: 2021-06-27 1:37:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Content].[Testimonial](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ImagePath] [nvarchar](max) NULL,
	[ClientName] [nvarchar](max) NULL,
	[ClientOccupation] [nvarchar](max) NULL,
	[Text] [nvarchar](max) NULL,
	[PortfolioId] [int] NOT NULL,
 CONSTRAINT [PK_Content.Testimonial] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 2021-06-27 1:37:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 2021-06-27 1:37:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LastModified] [datetime] NOT NULL,
	[IsSysAdmin] [bit] NOT NULL,
	[RoleDescription] [nvarchar](max) NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 2021-06-27 1:37:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 2021-06-27 1:37:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserNotifications]    Script Date: 2021-06-27 1:37:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserNotifications](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[Type] [nvarchar](max) NULL,
	[Title] [nvarchar](max) NULL,
	[Message] [nvarchar](max) NULL,
	[DateCreated] [datetime] NOT NULL,
	[IsRead] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsReminder] [bit] NOT NULL,
	[Code] [nvarchar](max) NULL,
	[IsAjaxMessage] [bit] NULL,
	[IsRedirectMessage] [bit] NULL,
	[IsViewMessage] [bit] NULL,
	[Discriminator] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserNotifications] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 2021-06-27 1:37:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 2021-06-27 1:37:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](100) NOT NULL,
	[LastName] [nvarchar](100) NULL,
	[Level] [tinyint] NOT NULL,
	[JoinDate] [datetime] NOT NULL,
	[LastModified] [datetime] NOT NULL,
	[Inactive] [bit] NOT NULL,
	[ImagePath] [nvarchar](max) NULL,
	[SupportedLanguage] [nvarchar](max) NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
	[Initials] [nvarchar](max) NULL,
	[Signature] [nvarchar](max) NULL,
	[MedicalRecord_Id] [int] NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContentPages]    Script Date: 2021-06-27 1:37:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContentPages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NavTitle] [nvarchar](max) NULL,
	[Content] [nvarchar](max) NULL,
	[PageId] [int] NULL,
	[Title] [nvarchar](max) NULL,
	[Route] [nvarchar](max) NULL,
	[PageOrder] [int] NOT NULL,
 CONSTRAINT [PK_dbo.ContentPages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContentPages2]    Script Date: 2021-06-27 1:37:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContentPages2](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NavTitle] [nvarchar](max) NULL,
	[Content] [nvarchar](max) NULL,
	[PageId] [int] NULL,
	[Title] [nvarchar](max) NULL,
	[Route] [nvarchar](max) NULL,
	[PageOrder] [int] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContentPages3]    Script Date: 2021-06-27 1:37:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContentPages3](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NavTitle] [nvarchar](max) NULL,
	[Content] [nvarchar](max) NULL,
	[PageId] [int] NULL,
	[Title] [nvarchar](max) NULL,
	[Route] [nvarchar](max) NULL,
	[PageOrder] [int] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Permission]    Script Date: 2021-06-27 1:37:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permission](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Controller] [nvarchar](max) NOT NULL,
	[Action] [nvarchar](max) NOT NULL,
	[AllowAll] [bit] NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_dbo.Permission] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PermissionApplicationRoles]    Script Date: 2021-06-27 1:37:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PermissionApplicationRoles](
	[Permission_Id] [int] NOT NULL,
	[ApplicationRole_Id] [int] NOT NULL,
 CONSTRAINT [PK_dbo.PermissionApplicationRoles] PRIMARY KEY CLUSTERED 
(
	[Permission_Id] ASC,
	[ApplicationRole_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Emails].[EmailTemplate]    Script Date: 2021-06-27 1:37:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Emails].[EmailTemplate](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EmailTemplateType] [int] NOT NULL,
	[Title] [nvarchar](max) NULL,
	[Subject] [nvarchar](max) NULL,
	[Body] [nvarchar](max) NULL,
	[Language] [nvarchar](max) NULL,
 CONSTRAINT [PK_Emails.EmailTemplate] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Emails].[TemplateVariable]    Script Date: 2021-06-27 1:37:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Emails].[TemplateVariable](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NULL,
	[EmailTemplateId] [int] NOT NULL,
 CONSTRAINT [PK_Emails.TemplateVariable] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[AggregatedCounter]    Script Date: 2021-06-27 1:37:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[AggregatedCounter](
	[Key] [nvarchar](100) NOT NULL,
	[Value] [bigint] NOT NULL,
	[ExpireAt] [datetime] NULL,
 CONSTRAINT [PK_HangFire_CounterAggregated] PRIMARY KEY CLUSTERED 
(
	[Key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[Counter]    Script Date: 2021-06-27 1:37:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[Counter](
	[Key] [nvarchar](100) NOT NULL,
	[Value] [int] NOT NULL,
	[ExpireAt] [datetime] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [CX_HangFire_Counter]    Script Date: 2021-06-27 1:37:13 AM ******/
CREATE CLUSTERED INDEX [CX_HangFire_Counter] ON [HangFire].[Counter]
(
	[Key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[Hash]    Script Date: 2021-06-27 1:37:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[Hash](
	[Key] [nvarchar](100) NOT NULL,
	[Field] [nvarchar](100) NOT NULL,
	[Value] [nvarchar](max) NULL,
	[ExpireAt] [datetime2](7) NULL,
 CONSTRAINT [PK_HangFire_Hash] PRIMARY KEY CLUSTERED 
(
	[Key] ASC,
	[Field] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[Job]    Script Date: 2021-06-27 1:37:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[Job](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[StateId] [bigint] NULL,
	[StateName] [nvarchar](20) NULL,
	[InvocationData] [nvarchar](max) NOT NULL,
	[Arguments] [nvarchar](max) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[ExpireAt] [datetime] NULL,
 CONSTRAINT [PK_HangFire_Job] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[JobParameter]    Script Date: 2021-06-27 1:37:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[JobParameter](
	[JobId] [bigint] NOT NULL,
	[Name] [nvarchar](40) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_HangFire_JobParameter] PRIMARY KEY CLUSTERED 
(
	[JobId] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[JobQueue]    Script Date: 2021-06-27 1:37:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[JobQueue](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[JobId] [bigint] NOT NULL,
	[Queue] [nvarchar](50) NOT NULL,
	[FetchedAt] [datetime] NULL,
 CONSTRAINT [PK_HangFire_JobQueue] PRIMARY KEY CLUSTERED 
(
	[Queue] ASC,
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[List]    Script Date: 2021-06-27 1:37:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[List](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Key] [nvarchar](100) NOT NULL,
	[Value] [nvarchar](max) NULL,
	[ExpireAt] [datetime] NULL,
 CONSTRAINT [PK_HangFire_List] PRIMARY KEY CLUSTERED 
(
	[Key] ASC,
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[Schema]    Script Date: 2021-06-27 1:37:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[Schema](
	[Version] [int] NOT NULL,
 CONSTRAINT [PK_HangFire_Schema] PRIMARY KEY CLUSTERED 
(
	[Version] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[Server]    Script Date: 2021-06-27 1:37:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[Server](
	[Id] [nvarchar](200) NOT NULL,
	[Data] [nvarchar](max) NULL,
	[LastHeartbeat] [datetime] NOT NULL,
 CONSTRAINT [PK_HangFire_Server] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[Set]    Script Date: 2021-06-27 1:37:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[Set](
	[Key] [nvarchar](100) NOT NULL,
	[Score] [float] NOT NULL,
	[Value] [nvarchar](256) NOT NULL,
	[ExpireAt] [datetime] NULL,
 CONSTRAINT [PK_HangFire_Set] PRIMARY KEY CLUSTERED 
(
	[Key] ASC,
	[Value] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[State]    Script Date: 2021-06-27 1:37:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[State](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[JobId] [bigint] NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
	[Reason] [nvarchar](100) NULL,
	[CreatedAt] [datetime] NOT NULL,
	[Data] [nvarchar](max) NULL,
 CONSTRAINT [PK_HangFire_State] PRIMARY KEY CLUSTERED 
(
	[JobId] ASC,
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Logs].[Log]    Script Date: 2021-06-27 1:37:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Logs].[Log](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime] NOT NULL,
	[Thread] [nvarchar](max) NULL,
	[Level] [nvarchar](max) NULL,
	[Logger] [nvarchar](max) NULL,
	[Message] [nvarchar](max) NULL,
	[Exception] [nvarchar](max) NULL,
 CONSTRAINT [PK_Logs.Log] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [MAR].[AdministeredMedicine]    Script Date: 2021-06-27 1:37:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [MAR].[AdministeredMedicine](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MedicationId] [int] NOT NULL,
	[MarId] [int] NOT NULL,
	[StaffId] [int] NOT NULL,
	[Day] [datetime] NOT NULL,
	[StartTime] [datetime] NOT NULL,
	[EndTime] [datetime] NOT NULL,
 CONSTRAINT [PK_MAR.MedicalRecordMedication] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [MAR].[Goal]    Script Date: 2021-06-27 1:37:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [MAR].[Goal](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[GoalName] [nvarchar](max) NULL,
	[GoalTitle] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[TreatmentPlan_Id] [int] NULL,
 CONSTRAINT [PK_MAR.Goal] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [MAR].[MedicalRecord]    Script Date: 2021-06-27 1:37:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [MAR].[MedicalRecord](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Record] [nvarchar](max) NULL,
	[PhysicianId] [int] NOT NULL,
	[PatientId] [int] NOT NULL,
	[AdmissionDate] [nvarchar](max) NULL,
	[StartStopDate] [nvarchar](max) NULL,
	[FacilityName] [nvarchar](max) NULL,
	[Diagnosis] [nvarchar](max) NULL,
	[Comments] [nvarchar](max) NULL,
	[Allergies] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.MedicalRecord] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [MAR].[Medication]    Script Date: 2021-06-27 1:37:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [MAR].[Medication](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Medication] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [MAR].[NotAdministeredMedicine]    Script Date: 2021-06-27 1:37:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [MAR].[NotAdministeredMedicine](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MarId] [int] NOT NULL,
	[MedicationId] [int] NOT NULL,
	[StaffId] [int] NOT NULL,
	[Date] [datetime] NOT NULL,
	[Initials] [nvarchar](max) NULL,
	[Reason] [nvarchar](max) NULL,
	[Result] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.NotAdministeredMedicine] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [MAR].[Patient]    Script Date: 2021-06-27 1:37:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [MAR].[Patient](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[DateOfBirth] [datetime] NOT NULL,
	[Sex] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[InsuranceId] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Patient] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [MAR].[Physician]    Script Date: 2021-06-27 1:37:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [MAR].[Physician](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[Name] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Physician] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [MAR].[TreatmentPlan]    Script Date: 2021-06-27 1:37:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [MAR].[TreatmentPlan](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PatientId] [int] NOT NULL,
	[Date] [datetime] NOT NULL,
	[Signature] [nvarchar](max) NULL,
	[StaffId] [int] NOT NULL,
	[FirstShift] [bit] NOT NULL,
	[SecondShift] [bit] NOT NULL,
	[ThirdShift] [bit] NOT NULL,
	[FaceToFace] [bit] NOT NULL,
	[Location] [nvarchar](max) NULL,
	[Effectiveness] [nvarchar](max) NULL,
	[Intervention] [nvarchar](max) NULL,
	[Service] [nvarchar](max) NULL,
 CONSTRAINT [PK_MAR.TreatmentPlan] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [Content].[ContactUs] ([PortfolioId], [Title], [Subtitle], [Email], [Address], [PhoneNumber]) VALUES (2, N'Contact Us', N'Contact Us', N'temp@temp.com', N'22B Baker Street', N'1281024738743')
GO
SET IDENTITY_INSERT [Content].[Media] ON 
GO
INSERT [Content].[Media] ([Id], [MediaUrl], [FileName], [DateCreated], [DateUpdated]) VALUES (1, N'~/Public/Content/82c9f442-07e0-4119-a7b3-0b4732b11474.png', N'Worker.png', CAST(N'2021-03-01T18:35:47.610' AS DateTime), CAST(N'2021-03-01T18:35:47.610' AS DateTime))
GO
INSERT [Content].[Media] ([Id], [MediaUrl], [FileName], [DateCreated], [DateUpdated]) VALUES (2, N'~/Public/Content/27503658-02a3-4245-b864-50d463fabcb0.png', N'Worker.png', CAST(N'2021-03-01T18:55:53.590' AS DateTime), CAST(N'2021-03-01T18:55:53.590' AS DateTime))
GO
INSERT [Content].[Media] ([Id], [MediaUrl], [FileName], [DateCreated], [DateUpdated]) VALUES (3, N'~/Public/Content/354d031b-3adb-4e0b-9979-17beadb85a7d.png', N'1.png', CAST(N'2021-03-01T18:56:05.357' AS DateTime), CAST(N'2021-03-01T18:56:05.357' AS DateTime))
GO
INSERT [Content].[Media] ([Id], [MediaUrl], [FileName], [DateCreated], [DateUpdated]) VALUES (4, N'~/Public/Content/145f45f6-93d3-4e81-8324-b0c4353eb117.png', N'2.png', CAST(N'2021-03-01T18:56:19.460' AS DateTime), CAST(N'2021-03-01T18:56:19.460' AS DateTime))
GO
INSERT [Content].[Media] ([Id], [MediaUrl], [FileName], [DateCreated], [DateUpdated]) VALUES (5, N'~/Public/Content/3ae6b018-3c07-430c-a75f-2eec9bb19875.png', N'4.png', CAST(N'2021-03-01T18:56:27.507' AS DateTime), CAST(N'2021-03-01T18:56:27.507' AS DateTime))
GO
INSERT [Content].[Media] ([Id], [MediaUrl], [FileName], [DateCreated], [DateUpdated]) VALUES (6, N'~/Public/Content/af56a97a-625a-457a-a494-51a76057eb8d.jfif', N'517c21aa-908d-49a5-99d3-071c76b2a725.jfif', CAST(N'2021-03-06T13:39:48.537' AS DateTime), CAST(N'2021-03-06T13:39:48.537' AS DateTime))
GO
INSERT [Content].[Media] ([Id], [MediaUrl], [FileName], [DateCreated], [DateUpdated]) VALUES (7, N'~/Public/Content/8124071a-22df-427e-9d11-910c3cd9df7d.jfif', N'1d340de6-ab35-48a4-87ad-1eaf2ecd0c3a.jfif', CAST(N'2021-03-06T13:42:13.273' AS DateTime), CAST(N'2021-03-06T13:42:13.273' AS DateTime))
GO
INSERT [Content].[Media] ([Id], [MediaUrl], [FileName], [DateCreated], [DateUpdated]) VALUES (8, N'~/Public/Content/98ffdc9e-9fc9-4726-b05b-c0bd6e149b94.jfif', N'87130eb7-3e51-48cd-8bf8-8076b4d1e127.jfif', CAST(N'2021-03-06T13:42:36.863' AS DateTime), CAST(N'2021-03-06T13:42:36.863' AS DateTime))
GO
INSERT [Content].[Media] ([Id], [MediaUrl], [FileName], [DateCreated], [DateUpdated]) VALUES (9, N'~/Public/Content/f2df9583-3f8c-4a8e-8a61-d62efa33157d.jfif', N'e091806c-2e20-4ac6-ac6f-0a3d1370317b.jfif', CAST(N'2021-03-06T13:42:48.823' AS DateTime), CAST(N'2021-03-06T13:42:48.823' AS DateTime))
GO
INSERT [Content].[Media] ([Id], [MediaUrl], [FileName], [DateCreated], [DateUpdated]) VALUES (10, N'~/Public/Content/b08320a1-21eb-4d37-b591-e38b4d80d6f1.png', N'mceclip0.png', CAST(N'2021-03-06T13:52:32.207' AS DateTime), CAST(N'2021-03-06T13:52:32.207' AS DateTime))
GO
SET IDENTITY_INSERT [Content].[Media] OFF
GO
SET IDENTITY_INSERT [Content].[Portfolio] ON 
GO
INSERT [Content].[Portfolio] ([Id], [Language], [HomeTitle], [HomeSubTitle], [WhiteLogo], [BlackLogo], [Services], [TestimonialTitle], [TestimonialSubtitle], [PackagesTitle], [About]) VALUES (2, N'en-GB', N'Focus on recruitment', N'Monitor sites for keywords. find a job on your favorite sites', NULL, NULL, N'<div class="row"><div class="col-md-6 col-sm-6 post-grid"><div class="card mb-3" style="max-width: 540px;"><div class="row no-gutters"><div class="col-md-3"><img class="img-thumbnail" src="https://via.placeholder.com/80" alt="..." /></div><div class="col-md-9"><div class="card-body"><h3 class="card-title">Automated Billing</h3><p class="card-text">ICAN serves as a clearinghouse for our providers. Your billing is automatically sent to your payers.....<small class="text-muted float-right"><a class="btn btn-primary" href="#">View more</a></small></p></div></div></div></div></div><div class="col-md-6 col-sm-6 post-grid"><div class="card mb-3" style="max-width: 540px;"><div class="row no-gutters"><div class="col-md-3"><img class="img-thumbnail" src="https://via.placeholder.com/80" alt="..." /></div><div class="col-md-9"><div class="card-body"><h3 class="card-title">Client Note Entry &amp; Approval</h3><p class="card-text">Our note entry and approval process supports standard formats (i.e. PIE, BIRP, GIRP, SOAP, State Specific) ...<small class="text-muted float-right"><a class="btn btn-primary" href="#">View more</a></small></p></div></div></div></div></div></div><div class="row mt-10"><div class="col-md-6 col-sm-6 post-grid"><div class="card mb-3" style="max-width: 540px;"><div class="row no-gutters"><div class="col-md-3"><img class="img-thumbnail" src="https://via.placeholder.com/80" alt="..." /></div><div class="col-md-9"><div class="card-body"><h3 class="card-title">Data Backup</h3><p class="card-text">Staff Certified Network Engineers ensure your data is backed up real-time by using SQL Server Clustering ...<small class="text-muted float-right"><a class="btn btn-primary" href="#">View more</a></small></p></div></div></div></div></div><div class="col-md-6 col-sm-6 post-grid"><div class="card mb-3" style="max-width: 540px;"><div class="row no-gutters"><div class="col-md-3"><img class="img-thumbnail" src="https://via.placeholder.com/80" alt="..." /></div><div class="col-md-9"><div class="card-body"><h3 class="card-title">24/7 Support</h3><p class="card-text">Our customer service staff is available to answer questions and assist when needed ...<small class="text-muted float-right"><a class="btn btn-primary" href="#">View more</a></small></p></div></div></div></div></div></div><div class="row mt-10"><div class="col-md-6 col-sm-6 post-grid"><div class="card mb-3" style="max-width: 540px;"><div class="row no-gutters"><div class="col-md-3"><img class="img-thumbnail" src="https://via.placeholder.com/80" alt="..." /></div><div class="col-md-9"><div class="card-body"><h3 class="card-title">Security</h3><p class="card-text">Security isn&rsquo;t just important to your customers, it&rsquo;s the law. My Healthcare Company ensures ...<small class="text-muted float-right"><a class="btn btn-primary" href="#">View more</a></small></p></div></div></div></div></div><div class="col-md-6 col-sm-6 post-grid"><div class="card mb-3" style="max-width: 540px;"><div class="row no-gutters"><div class="col-md-3"><img class="img-thumbnail" src="https://via.placeholder.com/80" alt="..." /></div><div class="col-md-9"><div class="card-body"><h3 class="card-title">Employee Screening</h3><p class="card-text">Create an applicant pool seperate from your employees to allow credentialing and verification<small class="text-muted float-right"><a class="btn btn-primary" href="#">View more</a></small></p></div></div></div></div></div></div><div class="row mt-10"><div class="col-md-6 col-sm-6 post-grid"><div class="card mb-3" style="max-width: 540px;"><div class="row no-gutters"><div class="col-md-3"><img class="img-thumbnail" src="https://via.placeholder.com/80" alt="..." /></div><div class="col-md-9"><div class="card-body"><h3 class="card-title">Eligibility Checks</h3><p class="card-text">When dealing with multiple payers, let our system perform automated eligibiity checks on your consumers ...<small class="text-muted float-right"><a class="btn btn-primary" href="#">View more</a></small></p></div></div></div></div></div><div class="col-md-6 col-sm-6 post-grid"><div class="card mb-3" style="max-width: 540px;"><div class="row no-gutters"><div class="col-md-3"><img class="img-thumbnail" src="https://via.placeholder.com/80" alt="..." /></div><div class="col-md-9"><div class="card-body"><h3 class="card-title">Plagiarism Checks</h3><p class="card-text">If you think your staff is coping documentation, the plagiarism checker will let you know how close each note matches ...<small class="text-muted float-right"><a class="btn btn-primary" href="#">View more</a></small></p></div></div></div></div></div></div><div class="row mt-10"><div class="col-md-6 col-sm-6 post-grid"><div class="card mb-3" style="max-width: 540px;"><div class="row no-gutters"><div class="col-md-3"><img class="img-thumbnail" src="https://via.placeholder.com/80" alt="..." /></div><div class="col-md-9"><div class="card-body"><h3 class="card-title">Real-Time Reporting</h3><p class="card-text">Run real-time reports on financials, outcome measurements, labels, listings, EHR Meaningful Use ...<small class="text-muted float-right"><a class="btn btn-primary" href="#">View more</a></small></p></div></div></div></div></div><div class="col-md-6 col-sm-6 post-grid"><div class="card mb-3" style="max-width: 540px;"><div class="row no-gutters"><div class="col-md-3"><img class="img-thumbnail" src="https://via.placeholder.com/80" alt="..." /></div><div class="col-md-9"><div class="card-body"><h3 class="card-title">Payroll Generation</h3><p class="card-text">Generate your payroll based on various combinations or customer defined queries ...<small class="text-muted float-right"><a class="btn btn-primary" href="#">View more</a></small></p></div></div></div></div></div></div><div class="row mt-10"><div class="col-md-6 col-sm-6 post-grid"><div class="card mb-3" style="max-width: 540px;"><div class="row no-gutters"><div class="col-md-3"><img class="img-thumbnail" src="https://via.placeholder.com/80" alt="..." /></div><div class="col-md-9"><div class="card-body"><h3 class="card-title">Multiple locations</h3><p class="card-text">Our system and staff service clients in over 6 states in the Mental and Home Health sectors ...<small class="text-muted float-right"><a class="btn btn-primary" href="#">View more</a></small></p></div></div></div></div></div><div class="col-md-6 col-sm-6 post-grid"><div class="card mb-3" style="max-width: 540px;"><div class="row no-gutters"><div class="col-md-3"><img class="img-thumbnail" src="https://via.placeholder.com/80" alt="..." /></div><div class="col-md-9"><div class="card-body"><h3 class="card-title">E-Prescribing</h3><p class="card-text">Use this feature to create, monitor and send prescriptions to your pharmacist with a few clicks ...<small class="text-muted float-right"><a class="btn btn-primary" href="#">View more</a></small></p></div></div></div></div></div></div><div class="row mt-10"><div class="col-md-6 col-sm-6 post-grid"><div class="card mb-3" style="max-width: 540px;"><div class="row no-gutters"><div class="col-md-3"><img class="img-thumbnail" src="https://via.placeholder.com/80" alt="..." /></div><div class="col-md-9"><div class="card-body"><h3 class="card-title">Lab Results</h3><p class="card-text">Integrate with labs accross the country to submit and receive lab results on your consumers ...<small class="text-muted float-right"><a class="btn btn-primary" href="#">View more</a></small></p></div></div></div></div></div><div class="col-md-6 col-sm-6 post-grid"><div class="card mb-3" style="max-width: 540px;"><div class="row no-gutters"><div class="col-md-3"><img class="img-thumbnail" src="https://via.placeholder.com/80" alt="..." /></div><div class="col-md-9"><div class="card-body"><h3 class="card-title">Scheduling</h3><p class="card-text">Schedule your case loads so you know which staff are responsible for each consumer ...<small class="text-muted float-right"><a class="btn btn-primary" href="#">View more</a></small></p></div></div></div></div></div></div>', N'What our users say about us', N'We enable people, small and big companies to automate website checks.', N'Scales with your business', N'Lead Monitor allows you to monitor websites for specific keywords and instantly notifies if anything changes on the website. you can define your user groups and get alerts on your email or inside panel.')
GO
SET IDENTITY_INSERT [Content].[Portfolio] OFF
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'202102211707416_init', N'MyHealthCare.Models.ApplicationDbContext', 0x1F8B0800000000000400ED5D5B6FDCBAB57E3FC0F90FC23CB545EAB19D9D6237B05B3876D2BAB56323E3EC9E3783D6D06375EB329534D9360EFACBCE437F52FFC2A1EE8B7752A23433A91120F090D4C7DBC7C5452E2EF2DFFFF7AF933F3E47A1F70DA75990C4A7B3A383C39987633F5906F1EA74B6C91F7FFBE3EC8F7FF8EFFF3AF9B88C9EBD9F9A746F8B74E4CB383B9D3DE5F9FAFD7C9EF94F3842D94114F86992258FF9819F4473B44CE6C78787BF9F1F1DCD318198112CCF3BF9B289F320C2E50FF2F33C897DBCCE3728BC4E9638CCEA7012B32851BDCF28C2D91AF9F874F6271CE334F06FD3E4EFD8CF0F2EE3C7146579BAF1F34D8A67DE59182052A8050E1F671E8AE324473929F2FBAF195EE46912AF166B1280C2BB973526E91E5198E1BA2AEFBBE4A6B53A3C2E6A35EF3E6CA0FC4D96279125E0D1DBBA99E6ECE7BD1A7BD6362369C88FA4C1F397A2D665639ECECE1E924DFE359B796C5EEFCFC3B448C73575D53707255280B3831AE18D7785D1F23A89833C49FF861FDEB434216C2AFEBDF1CE3761D13BA731DEE4290ADF78B79B8730F0FF8A5FEE929F717C1A6FC21096969497C45101248894638DD3FCE50B7EACEB709BA4F9631206C9E572E6CD6980398BD07E2FFAB8AAF0659CBF3D9E799F4971D043885B7ACC954077411EE20682908C0C9D99778D9EAF70BCCA9F4E67E4CF99F72978C6CB26A486FD1A0764A4918F087DB5B92C360FF9341991BE26BD77345546C75365F476AA8C7E982AA377EE33FA8CBE05AB520EC886CBCCFB82C33245F614AC2B51DBC8827B90EA539A445F92B013355DE4FD22D9A47E41E54496E20EA52B9CD3C53B9977524C29DB40297A4BB716638BF2AD8F58D34B33D0180B52255C3604CAF1F216E5394EE30203974DAAA3E1158A571BB41A5F26FD3989F03462B6C88988DA6932FBDB5390E3AB64958C9ED38710F93F4F92D302A7DF021F67A367748733A24392614994B9497A0B6438D9647C4BBA8D0CB06C9A1A966278C239A5D54187CF28CD7C219F519A39C7B470645192235F56BC36565C4041345744511ADB42DEE134CA6E1EEB41272C299D445C5C591AAECCD284F6056F0793B881410259990509040516A51295D658BB00C4E8AD5DB418AFABA7EF6BF5F431424138BEA05E2E539C8D3FC7DE3E2531FEBC891E70BA334B8D1E92975D6EA8A4732F91C08AE1DE7281067A150E938CD90BB2F8F9BA5E164BA026AF22E82E88B075892F70E6A7C1BADAB4DB911133480360C78E5655E83980DA69DA7EF4808F5F17EBF2BC22B290205F3D8D3E9ECEC38014A9F87BA2AC6E7C7FB346E38C394E6F7D1E6185E44C7EF69610BD946D5E36A854F25E82A1D4A7EE70B426651E32B15238AF52429A17D54E45A6FB308113EDBEE8F4F177D192E5CBE8998CB7A92A150E3FA134283A55B612AFD8D0A4BA67C6249412AA9482B5B932F9A0453A8B3D4827A7A15EA5C796873B451377532443EB3147023F711A0D9C5E23E11A2F033480FEE5F7AF9C97E655B6CFD774FC4D9F4F41882751AA8BC5EF798ADDAC877BAFAD8D09FE39C983C7C0AFF5FFDE3C8730AF7497E6F535C3E9E06D1DA0578EB7529B642EBAC659368505DCE598BCCCBE107637301F123205A1B807CA050E31284F7FA02F380AE265B7C7DC17E99C34E7846A733114847A021425F755AA4E35E022396D804F314801385BAFC31AAD2A8BB188A40F571E3040AF42529AD7A720CD741B60478787466CB41C0357C859CE9A8CF037DC2A3D1F5E72FBA2FE2509E28B52711E28D08A3A93E99C0C1A17D231467E1E7CC383C5DA64FBAD8BCD7A9DA484A7939DC7D259398FDFFDCE552EE749FC18A4D1F069E61665D92F49BAFC33CA26E812EC6F52222816398AD6FB6DA695E7E5AC6BEE7E493E914197A41FE3E2ABC1785789FF73B2C93FC6CB72F991FBBC50300470529C33DF275AE2274266BC3C4F36713E4C7B2EE65E8D84371D7FBDF74ACE43144492835BB49670DF2405A7B78429F843C1E264225D4855D4AB6415C466456D92CA8B5AA5D016B54E665BD402CCACA4754A7941CB04DA7256A95C6A9765273953314BB4573D53290A862EC6CB369E64455EE6F4130A37AEB3EA4BD672983A236B89B645B296F993E06F41B9949EEBBF68121378A3F40DDD6C87045332F9C2E4F8C73196445435A7CEDC7E88F6657321CC9D91B900DB2297C54C13262D4ADA87942E646793B71B0354D581FAD9BF48775F25962A006D1A9D0ED02574A50638E3E19639B8EB93BFDB5D8F6CF1929D2DA3201EBADA297A6DD453904C7EDB5E0ADDE2340AB2829262D5BD8BE7B576368E3B22C125B0F5B32886B87649510EFF3AA550A2740954E204A41AE6BED956BABF18E9305E258834AFE21C7C9A84A1936D23EB4D1147D2C136DF304C7E21FF0D15736622EE9D9B3DFE1E3B065662871DD452B934D840DFDA4B9DD8E96B345743DCFB80325CF7256BC79B69A6CFB3BFA367C6183CC420BA0C52527967803F05F8975E60565E7144EADCDA752E23B501C8ABD896E645A4C134871BEAEE98C0CB79C52FA34C45E0BA649CC451AC26D37D9588F61283714217312A81ED5E6EF1A5DC75D8B85C22A76161C17B0DDAAB6435401293AF5F47A9342F2796EDBBA7141CD519EFCC39B4E58F974BB25A4D60A19CEA48D6C7E7E2D232F74B5CD9E83DCBB2C40F4A6E02F9CCBAC2D245FE182F3D03BFD84EE501CEEDD764E006C5E28E94E57476787070C4B5881ABE955D1D3C702EA2E1796C32D2715A0C35549C01203A020AE29C170B41EC076B14EA8BC17C6A28538AEE683361632EF01AC78538D0B7B149EE0A9FDBA2186D6E8CD0D335D4C91C30474D28A9A7A8ACDBF56EA35DDFB34ED256FCD2DF50311DC97465998069BA76DF17BA89DC0EE51450FA2042A20167629A01BF51524C79A18811BFD856BC89AB43B25EB5DD414404CA7CB4E4E71622F3974EA8A9A8C324BC54F4D17E9092BF78484618C5BD761D59DA3B8EACC49DE282A3E9E49CB410131049DAB6FB41228DA7985C0499B98D4159C7FA39DA083C3377CD2E37C6DF6DF7A49F498526118326FD685210CED7713B32517CA64F2ABD3407FC8074647D1346A494B67C02C28B4FB7E986583F69AB6CB42944AEB2554C0A203DB5B10D8ED687394D39C09EECDC358E32474AE5E5AB0FB54DC251BAD1B6C051BA55769EA39C514ED6FB720B1D50FF8099DC7CD2971F391032AA3ACCA384EF3746C199038321203A80605CDEF147A8E0E4837C801A34A983F1C9B7D8B4C3936F1293FCC587F9B6338374C7EC0C65B4E0CCDD40121864653F7CB7AFA7EB2A33FD44C275DDBE9155339F68DC43764DD9319999A613A57C8B6D41D3A19A64E7151DDE035ED6F50A7778C9411C0BA929F7A4DF12E57B51515A8B096828ED9E9DA72077CC424612F95910DA2CDA9E6E32E79FFC388711B47093B8B75D5454900918246B5EA38DDCFA60D00404AA6CEEA505378871CACFB2170F654D8AEB3FB9133384E8F5A199ACB6E8B38C28C01738A76D0C33AFB3F4B3E6028E533442BBC52D020186010D0C30F77328204E83C25A7639283681160F3E0E204003F63D0D14B57F2A0263B6B4B525A33776C5C563B7E435A0E50D6222A4FAEA36CDE750448B50E8C95303567B01F0BC6427490D8E68E3D400B7DE60B5036FDCB675E0F5CE981D787D785A875D69A21A68032C231CCAE5841FFD605F4807541D52140EFD764ED2602C5EB21C47A46D4540E5014306000860812082F70F83948ACBFFD9B9C1ECCC535B0D4A0872138DD9092700060533AB0ED235376815F9CDED7CD3989DDDA1AAA43DBD03EAA516E166B0E33797F01A6B515B690F9E3035521D3DA15A09CE5CCA36521D3619AB81048F2AF18DA33900412FDCA547204015243A8D06687CB2A82F7315B1C6DCA8CF74B691599FE211A76728C96464C807F8AC5A349C59925B5F04F432B0252B3787186B32A855ADBCA868A6B6FC42D28A1518E70DD5282FFA861219346D4C9A831A8A313FCA1BAAA9CFE086E21DD8F82652DBD3CC2C6A50BE40BD4AD138521B1AC0AACBEC922FD04D574917996DCDC2BAA6AB8985254CCE9511DA88B91F413BAA24461E3B338F650DED0C3BE3720ADE26A51741BA41A636330C1240D2813612A70477B8F2EDA3D9E636DCE8069561D6F28AF6916F6DEB9AB94763F02E6BE2A5997CBFD56CC715CAE26A69AA599009375775288A06687C6FDA7DC036EE64BEF09F7084EA8093394952F8FF6C5058F9C53511D768BD0EE255D67D5987788B35F28B72FF7631F39EA330CE4E674F79BE7E3F9F6725747610057E9A64C9637EE027D11C2D93F9F1E1E1EFE74747F3A8C298FBD4F063772DDB9CF22425356762AB0B92CBBB692F508E1E50E18874BE8CB864C25D4FC92E409325BDB1C9F75AB331D0A42FFEAEBED1DC072346EC9AF513A969546C3797FE7A826507F725F976E1A310A5ACCB263C367C9E849B2836384F2CC7AB9D7421521D648ED13D5C0961BA500BA4EACDF82306A90DB5463A1622719EBB06486F85486F7B20FD2044FAA107D23B21D23B11D2C99CA12267ADE0E8CFD909E9D16434D6C06AD8DD70932EFA0D069CE25B5963B323CD6E8075F71D438C2ED41C093C300FA140B01D56F7843C0BD7C598238277E2211C0836C7022FC1432C106C33549AB7DEE9A1D2845A884AEE31774A6A72B1BD90C5B25498C01C9F79A19D9A36E82873CCFA1D76885507ED8CF0E9F6CCDDC91E29A681EC517CFB9F39DDD757B443983AC88287CD33D314139B408B3102EF27A75A1A46EC0CB71953873B82AB810D58AE03D827AA532F4341242AC2020F5EC845E1C1881D2219B014B9A4587736A20FBF145F8FA3C381673228902ED81C0B3E3C0CC160B82D1A7C5B98C784B1363AC973CE2A21CFC2D9DDF580DE12D91973933BBA2B2D700684D77C3F0EE5056FEC72D3341D3DB912523DA7CBE82055A0C552A37C2E975A659421632EF0B626CD597BAD4B91CE9C27EB23D77510E330DD051B390F68E958D92991571FEA734783EA30A07DDF4BBE1BA7C3BBC7502146176A8ED4BD760A91BA503B45B37D3A915534DB88F115D72D11913629D9F0F1322BFEBE79FC959A9830835FF720A8FC9655552F0CE369E399001164DE0A72147EEEDEC674DDDE77470FB93A707BE3A4796694EAA53ACC06A57D6694066A83ED4AD4BC34CA96AA09B7581F94AF8D526B828477022ABF1F38F207CD1BA2DB97F7639032972AD33D4645D95180B95B996502136D834D5DB34CE3525142CCF3245E06A50353F94692E4DE6C6A6006C5CE06612E22BDB5D3C4DB3DC6295B7BE266EE39B3CB4E78F536B5333E1E3D4CEE3A84710405786E975616DB609B25A708AA0BB540AA2ED5A560AA20738CEE895C08D385DAD5AB7B2D86AD5B176321EEDA8772A99E6B43B7B30728780C97DEC6E0A2A7B5A9B08FDA726020CEC60A091FB7A58D9030C6EA18047CC196390B01A3C6B70319E0495A549CC2423FE75EA6A554752ED6623CF26FD45283928FEE812D28331B67610DE49FB1A5EC827CB4DD7A8C97BA5DE8CECCB962B780D1E6E0CA1F72F0442C81D9E5B53578969436BBB4C19658F5C3A31C581DBEAB0C937A7D386258E5143B98611218B984A25E04A50594F2195339E62D7CE6939A0454CF9CCAF1EC78BC1B6C911DD077441691A3843D57C428E38A93E6AE268822BBBF696B9D3962EF0DEF39BB5E1B7AB0D3F96205BC6F496FCC74E1766C929E37E122CD71791568C7D41FE821E78EA7E0C6027B8AAA3E1E879DF0D9447AFBB70BB751AB790A35611628EDB386144E1BFADD9EA3AA3C7CDC71115E7D614F46E5D7E3B0B17B0D8E961B4DA81DAF31BBAC6B036D362356DC5C2BBBC9696BBC01D796B8234F71DD893D69845F8D43167E2FD1761FB179918CDA07A9C3A6DD1B6D9E1363160F2B3BF1EBCA7A0A5E03A3B6F4BAE0E9A94FBB39CA66F2C6FDD77EB66EBE944FC91AFDB1F0E6648587C44F9F6F3CA3E101E0C417C98112F4289CF41A3DA3C231AD635942D68D95A700E7CDCA2669095887B4BF5B6FD6DA939472712DAB5738AC96D5CA6AAF56D6B5B44A32F39AD57723720F8A04078B7F84D509DA2EC1358A83479CE5D5B390B3E3C3A3E39977160628AB3C8C6BA7D9F7ECED7B465EB4476F0B2F5ABC8CE6ECE7F6BEB8054A962DA923D2FCDB9A42F753B3A72D158778F56F5C521F57577105B1E8D2C2CB78899F4F67FF5B7EF7DEBBFC9F7BF0E91BEF26257DF2DE3BF4FE69FF6A257C9D36FE8652FF09A5BF8AD0F3AF2194C91B8B9DE78B0BB0D6D7D51DD8B14BB0B72EC17E7009F6AE0798F12BB4B297B6267806B61C19DA875E2DE9DF99161D740070417584D679A03A00043EA80ED08017AA13EE368EA80EC0781F54B7A04E251DE379EA00B1F63F1D4F08481C385F27CC2D4E98F5E10617F4699C465D901B1E16188F902A5FCB5756DA75197532BEC22B7EE47D9E44A7B621C7EC7E892BE4DEAA25E03895832E853E95CEE0A03BA593E9F5B9CF9CB50383D198A6AA7745F795A802074890DB36A7D6CA03D285A25B3A423A001AB0D6B010852AEFC1BDA5993B66705E88762282F97C0C31217002DCDB7EEBBC091D745DE750E848CD691DA586AA39BD55266352C83D2CF6961BCDC120BB01587D354C5706D3D4309DC599546A8D583BC6ECC607B0827908ECE774E0FC3704A473FAEB8F52B9FC396861C6A34D5822331CCE836D0016E5B5D61B8771A0A25B6BE65DA3E72B1CAFF2A7D3D9D1F18FAEA49BD217696F051CF0695235E3E1618F5D6B7B60230DB5B2EB57A07910BFF4D1E23B8FA781C2873E3F385492B5BE4E03C490D355B9C0BD69AC7D408A17C7EF7ED70B1438E5F46F42DAC5C98DD10B3A386D7DCF5289E7A409794FA6FE5802D725F9383392208CCB52FFA2097C94FAEF2C74DE49ECC0D0A99CCD9765F01BEF32FB1A07FFD890883BD21A85F2291F590E67448153D0DE4E8B5BD3FB813F92935DD0CE2169BCFD1CA1EB8EA2BDFED987241A371E91B944E5A663FCBAAC9E8A4CC90669A302C90C6BE1187B2296F72552F5E48A631E49DF10E6938AFD79F484D89AF0680A6C9771F5D5C8FDC99FD6DCDBB9C1ADCA0FFC85FAEB219C8B9083B9A39F2A5294640BAAC8ADC469676F49067D7F349D69A8A91A11C30CABF502EACF58055B298EBCD36D3C581D0812BAD2EC2D473A9F1C17AA62E397E3E4B8D8AAC73C547D259B8706E8A79C3FCCDEF6B8932DABC6BBC685B518EEC50D43AA1D6D76CC4E01DC6DC65B3FDD9AB9B7181E12D338A8F05FE8BD460C4E97D1B95A0E7CF8F12005585415BBB2F0080E1463E05703A4ADF2DD71F83A68F7B8725597EAA9D22EF47A13E641516C92355908728D2478739C8202A134D4E1C1018F468883D3427EA162B735CB5314F08E66B76910FBC11A855C1D98948692B768DB16938DB9C06B1C172295ABA54966CA1BEE4FE62D38332274CD407953A9C960F6D2FA388C609F6107786CD477C10DED9329BB4910EDF3F243D8C156E926AECCE15EB56820030A653EE2AFA22D5D09E5C4EACEBBD2AC02E174497EB3977C52BD8FB28B64AAFD08A715338DF322046AC3BE0BC1227F57741749C01EC1BC579DFBEDBA914E053B93899948C430E7486939C3468E226C740FC68C2070B4AF77F0796A9FB59846F2304F708B2E3B94BFD84DCB0E366E12C2090D9E8A62D50946219EFE7265F722CEEC2E490B9BCB365827BA00719F58579B57E5C5AA137CA7AC93DD2FB963ACBB35B97604EA5A9D018352B640F0246493EF45898BC5A51A47A5575DE8E69C7186FB7192CC751B705B619FE85E19B188E1FA5AD3C3FF513CECC387AD92D1EC46A06967E1B22082B726769A8FC2A329F239F8FBE2A0D9ADBDA60768B6A3F795AC1318555E49F74ABAF1161B821B98F769ADB11B8CDBD24AC398715B5D6840A7CB7B8163D22EB38D7E220B14878EF85EF8A579C06CC78805CE4BDDAFF94353B451B93958C59A95DB70833D7E21627551A319AA2366A86F6C1EC55A0D2B6BB4C694DC7E3C0231981B3F5B7230B77372ECA82F6FA58D4E33AF3B20C15A81AAFB3DE141B4EA9C459B80A30B9D05B04B71998038593620892623705C82CB08C4C93202493419B106782E3736812C4B369D365F60A215640A62E53982449AEC18D311972113DF645906676D8E4C2A6D1559EB90A09E6C1249CE7C424DE6D5E5197C8E75B8AC4DEB680D383D757279D0D14D56CB87A41B6FD9FA33CE4B9732EAA5675DC69C0AC10F7536853A7BEB2C6B738B2EDF3A993AF3DA366559827AEB5D57823A99BA04B59DC2B2049546AE2B40954A9D7F7D17B779F6FAAC75D99A6509F7C479490F224519C1780339DF6A1A4249DFC68A720209F4752A8E28F37994A10D76F9B440035EC618B793BE931469D5ADC824E76B4ADF29AE38FEE88194EC6C2A3BAC426F19B30A407577BC6C5EE7344E6A4E6F5FDF104FD5CC55E90655961EF213D4DBEC40A0B3CA8BF58C1240A339F46906D15136611B68CFBC396C004EE1A96B2FD762ECABCE1FBC12545B733ACB59951985BC7A9C4BA269F7E965E5F12261779B1F48A22A22D41ECBEA283542A6FFC5DA604D028D7AD78309E28330223A181C99516FF2C0FE65E354FC50A856F21741DD374DA305E99B46FAB0E5C84D43E97CF2A72C87378DEC4881A06D8C4E1F48ECADB43091AA4BA6D65A211897CA7DE3D4166F93C6113FBAA2B20C893B5B54951D6B26B119563DBA64F6DA519A48B19C913EFDE95CEA74B642BDDC91D815BFDFC6691E69D24B6481F16B0A813C51B3F08617419368AC33A334876807A804A123063700672090ACE0E44604B919815984B5E19A251C653430C350549C7BEEAA8D3B9957ABE23A80FCE49EB53A997FD9C4857F6EF5EB0267C1AA8338219871F5144E07DAA4B98C1F9366CF9F295193847379CDD112E5E82C253D4C56AC24BAB8982A885733AFBCFEA7D0861FF0F232BED9E4EB4D4EAA8CA38790BA17A7B01DA8F23F9973653EB9297D6333175520C50C0A97E69BF8C32608976DB93F09DC2C25108551A276B62EFA322F9CAE572F2DD2E7243604AA9BAFB5A5344B80EC265EA0E27A3EFBB291517B8557C87FE92E0A9281E83B826EF6938B00AD5214653546F73DF94938BC8C9EFFF0FF9AAE93809B290100, N'6.4.4')
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'202102251122577_workers', N'MyHealthCare.Models.ApplicationDbContext', 0x1F8B0800000000000400ED5DDD6EDC3896BE5F60DFA15057338D8CCB763A839EC09E81E338D39EB66323E574EF9D21AB685B13955423A9121B8B79B2BDD847DA575852A224FE1CFE4994AA2A6DF8C645521FFF3E1E1E928787FFF73FFF7BF4B7A7653CF98AB23C4A93E3E9C1DEFE748292305D44C9C3F1745DDCFFE9A7E9DFFEFA9FFF7174B6583E4D7EADD3BD26E9F097497E3C7D2C8AD5DBD92C0F1FD132C8F7965198A5797A5FEC85E972162CD2D9E1FEFE5F660707338421A6186B3239FAB44E8A6889CA1FF8E7699A846855AC83F8325DA038A7E138665EA24E3E064B94AF82101D4FFF8E129445E17596FE1385C5DE79729F057991ADC3629DA1E9E4248E025CA8398AEFA7932049D222287091DF7ECED1BCC8D2E461BEC201417CF3BC4238DD7D10E78856E56D9BDCB656FB87A456B3F6C31A2A5CE745BA74043C784D9B69267EDEA9B1A74D33E2863CC30D5E3C935A978D793C3DB94BD7C5E77C3A11F37A7B1A67249DD4D455DFEC954811CAF728C2ABC9050A169769121569F61BBA7BD5D004B389FCBD9A9CAE63D23BC7095A175910BF9A5CAFEFE228FC053DDFA45F50729CACE3982D2D2E2F8EE30270102EC70A65C5F327744FEB709D66C57D1A47E9F9623A99F1003311A1F91EFAB8AAF07952BC3E9C4E3EE2E20477316AE831D302DD44458C6A084C323C74A693CBE0E902250FC5E3F114FF3B9D7C889ED0A20EA1B09F93088F34FC11A6AF3197F9FAAE182723DCD7B8F70EC6CAE870AC8C5E8F95D18F6365F4C67F461F83AFD143290754C3653AF984E23245FE18AD2A515BCB825B26D5872C5D7E4AE356D4B491B7F3749D8584CAA92AC54D903DA0822FDED1AC95625AD9C694A2B3746B303628DFBA8835B334631A638EAB84CA86080AB4B80E8A026509C14065939A687811240FEBE0617899F473BA44E38859921316B5E364F6DB6354A08BF4211D3CA77771107E1925A739CABE4621CA07CFE806E55887C4C3122B73A3F41693E16893F135EE363CC0F2716A588AE111E7944607ED3FA3D4F3857A46A9E71CDBC2E145491184AAE235B170018168A988501AD742DEA06C995FDDD3410796944F02175795462AB332A17BC19BC104373093405566200150602815545A6BED82214667EDA2C178593D7D5FABA7B36510C5C30BEAC52243F9F073ECF5639AA08FEBE51DCAB666A9D141F28ACB0D9D74EE24124431DC592EF0402FC2619431FB1E2F7E3EAF16640954E745826EA225722EF17B948759B4AA36EDB664C4F4D200C4B16354153A0EA0669A761F3DCCC72F8B75755E4BBC90C05F3D0E3E9E4EE3081789FC3F52565761B85E05C38C39496F7D1A6085E44D7E7696109D946D5936E854F28ECAF6721524CF3AA1C08F7840D52E115E248332AF51462A6E0E94A1241C61176324E5986A91E328E1BBBA70510AA4DFD2EC0B1E800A15BF1CB2B74D1A56BDE7A200D59E8FEF257C2A901EB2A70278113DCABC3E44593E8EA6305F67C918F97C8CC22FA36474937E1B5EDDC13FBF466308EDD3922C834BEC755264C3E7739DE6C5294EBDAB425BC8E532BD8B4658866329B218629F49AC4D94CC83386869D06D6B0217A6138C72429C7F8962C55E78358D94096EEB39A99D12E55869171C48D26B0B9CC1EB3D3B96281B9C22AB52C8132598B82C6C9749B5CDA50FE99AEC7B835CA0AF684C758F72052077C5CA9AFD2DADD97089D05CA4EBD9533D847C8C3451FFD40CC64E23ADEF18DBF4E8DA760574A01DE62E52DE6A20887C034749E763CD0CAF67C9066FAFED9616E6857763F34ED2DC92E23177992EACE952AA9E3768B9C23CEE73E2C5E1BC10469917D74E24D35D38599BAFEF48A70F6FDE962E865FD50D67EDA89C2D7E0DB28874AACA44A662439DEA561893ECF6BD2E256034A34DDE6BE92062F73A2CE7A15EA4C786873B47137F675702AD871C09F28996D5C0E934122ED1220A7AD0BFFCFE85F3CABCCAF6F99C0DBF3FF6218AD1287BD8C42AE534437E0C553A1BBD5813FC635A44F751480FE63BF39C8579A1BB32AFCF79FFFD2556AF1CEEE0629CA50FCAF331AEA6F81C93E7F927CCEE1AE65D8AA7A020E980F21EC588294F77A04F6819B19BF25D9186390C512A0C6428807A022B4A6EAB54AD6A20454ADA809CA2970270B25AC514AD2A8BB588E46F3DEF09402F42529997CD79F3C1FEBE151B1DC7C045E02D674346ECD6FEBBE7C2BDA8FF48A3E47DA938F71468A4CE783AC783C687744C82B088BEA2DE626D3443C8F97AB54A33CCD3D12E4A9A0E840FDFFCD9572EA769721F65CBFED3CC7590E7DFD26CF173908FD025285C675850CC8B60B9DAEDFB13EABCBC75CDCDB7F4031E7469769690AF7AE35DA4E197745D9C258B72F95184B250B004F0529C9330C45AE2074C66B4286D43FA69CF64EE354878DBF1D779AFE4340EA2A5E24625AF25DCD649996B95600AF9B63E9C0CD2857445BD481FA2C4AEA875527551AB14C6A2D264AE4525607625A529D5052D1318CB59A5F2A95D969DE44DC52CD15EF44CAD28E8BB182FDB7894157999D3AF41BCF69D5557B296C3D41B594BB40D92B5CCBFB4A42C97D216664675620C6F95BEA69BEB90104AA65E981CFE34C49288ABE6D899BB0FD1AE6C26C2DC1B9909D806B90C330D4C4A4ADA85943E64679DB79F03A8AA03CDB33F49775B25562A004D1A930ED026F4A50678E3E18639B8ED93BFDF5D8F7CFE9C9F2C9651D277B5437A6DD0EBC96ED7CA065F0A5DA36C19E58492B0EADEC6CB5ABB1827994848095C8D50C910372E29CAE14F538212A54DA013274CAA7E7ED59A4A7717232DC68B0451E6551A51A671EC65DBC87953C4937470CD378ED36F2771DC57CCD989B8377EF6F83BEC1838891D71502BE552EF03FAE6BCD4CB393D45F335C427EF821CD1BE14CFF1A686E9F3E49FC1937018DCE740741165B8F2DE007F8DD0B74E604E76DD58EA5CBB75AE20B5199017B1ADCC0B4B83718C1B68770C7FA680FB5B6A406BFDAB649CC2831325D36D958877DFC4C681BE9BB804AE7BB9E423B54F3FEB7241DEFCC082771AB417E9430F498CBF7E19A5CABCBC9C6CDF3C668CA9CE7036E7C35CD393B7011FC6B8793B9249D6D913794DC0FF1257357A4FF23C0DA3929B8C7C167DD4F1453E4B16130B8775ADCAC3789DBCC40337228B3B5C96E3E9FEDEDE81D4227AF84676B5F08CD71F1E5EC6A69E5CC82B0A181CEB08419414B2588892305A05B1B918C2A79632857447938918F31EADC865F2A430B7B14DEE1A6778A4184D6E82D03335D4D18C618E9E504A176EAA6E37FB736BFB5EF45EE8C42FB3EBD8F148662ACB084C33B5FBAED00DF207A6A680D639184B34C6CB1FCF801FB414D37AFAB5E297D88A574965243BA9B63BB08808F23058C8730B96F90B2FD4D4D461145E6AFA683748297B04571146F3E0444B96C6F9B893B8D3781E1F4FCE290B310291946DBB1B24E22ED9AB3A19BE71DFF62F75CA30A08C519405E01AE78AC524533BB10D6A8D11880655DC265B858B9691F805381051F5ACCE9B48C7FED5822BC9B37DB3A5BAF423104FDD2F36996BDC098DC13FD175A27A59A8F0A3C8AE38A9EB55C7F526EC80D1C8BA1FC4C5B683B6AABDFDAB562BEDAE02B3FAAB7877DD4589B5BB82DFE626DC61DEB6316A57A151545B9B7EB42988747F7D337A2E6CA7ADD4480D46DB8CC62BDE371B458131588BABCB472D9607D169F48D36861AAD6D159B02282DF136C1516AA06FCB01D15A7FDB382A5C1350978F1A2A8FC251BED136C051BE55B69EA392A185AAF7D55617CC929E317DB29FF4D5666420A32A034D5F6A116C4766310420A332EBF20E3F42016B36F500B568520FE3536EB17187A7DC2436F9C306DA9B99415AD3694B190DD851F724814556EEC377F37ABAA932E34F2452D7ED1A590DF389E1CADFB6293B3633D378A2546EB10D683A5C936CBDA2237B355175BDC6C589C2B8D2416AAABDA36C88F29DA8A8ACC508345476CFD65350329D536F0FAAECFB785397C662D59E7F6A133D2B68705FB3B3AD0B54901118A46A5E9BAC6B63CF110854D95195563951823279967D7F57D684BCB526594162A25343C89C5A69898C20E07354F0E7C6D3496BBD251E014B9CE2119A634B088439EC35C030265C120A13674011AD7524283181118F7D891940636C368C15247BFF11822B484F130C18CD9B4F12427D6C600550BB5157A0D0F334039412C4EE73D615BAAACF5B8FEB06306E6F1A42138E0B8CBDCE6F9AC35D2F1E7718404B8F9B101275756AF89C9DFE20145E313180D15B73F298171510030EB4296D814B37AFDDC06B37272670BAEBE8064E2F1B99B02B2DDF006D816585C35DD194252BB3E76602AA8CFAC121D6CCF7A6D1FE9C176889DB16022A0DF20500667203843CFB9026935294F72A732649B551D90837D5E026186912B7B30866C0D8494F54B5F99A5BB48AFA0962B969EC6C5DB92A19AD5D997AE9A7473BD8E19B0B7C8F156A2BA3A1A650239DA926D74AAC56A06D239D71E6500D24DB02028D633018E437459426834C1514FAA20168E8B6E0DF8D919B416DF2C6151C347A63CA5C67A0A93B68ABC640F0AA59EF8A438F35C9D53759647135D0D86459D6C304A76C161F2D223D9C0A4D3C1A0321619E804D84B809A751F8B5130E6C12344813989E028064A8BDF99020FAAC0C8838A92A69DD5AD16A6532C4E08B8B84FE7256E1331010B616562BDA6D68C16E85A91555E57542576F63C28A70589DF7DE50B52A6F6E28C874425B39C178A2574309860EEA86AAEBD3BBA164F7077213E94FEEB90A29CFEED9D9965D65681A47795ACF60D132FBE40B7338AFA78BEA145FD5C3C039BEA926165066AE0CD04682772DE3A8521C27BB1D283BD6D0ED0879584EB1BE48CD22C834C8F4079ABD049072A00DC429E00500B97D0C076A96476A4C65849D2D4DFBA80FD14CCDDC495D141D1EC01B15EA931DBBB31D5616571B3586ED09F018C784A26980FAE67673E2D0C41DCDE6E1235A0634E068869390DBE3EB20AEBC2AD41197C16A15250F79FB250D99CC574148CAFDA7F974F2B48C93FC78FA5814ABB7B3595E42E77BCB28CCD23CBD2FF6C274390B16E9EC707FFF2FB38383D9B2C29885DCF013CF479A9C8A34C3351762ABE735CA970DDE07457017906BECA78BA5940C3C5F51EC89D559F2472872AFD5DB64757AF27FF58DC19B208CD836EB075CD32539D82ABD3D008B70E94BFCED3C244F728B0E3FD84B67A769BC5E2616B7D1D478D4C50B8B4483EC31E6EBBB428669431D9050792E7E202035A1CE48872092E4F7C502E93588F4BA03D28F20D28F1D90DE80486F20A4A3994045E95C54A2BF6491C08F26ABB1C6EC0DF91B6ECA2D308B01A7F956D5D8E248731B60ED6B192C461B6A8FF473BA44C0706582DDB0F00055C0B531F688BF3D4605C20BAB94876382EDB1DEC541F845C662825D864AB9DF9D8B43A50E751095EDE6302435A5D84EC8B02C0513D8E35FE376234A06506C21CA1EB39CB9782C1AB435C2A73D41F2277B949816B247F3EDEF73BAA70FFCB03034C881878B458672617837810E63847DDD866B6936626BB82D1CFCF923B81ED882E526805DA23AF7AE288BC44538E0B1EE5C393C36628B48C69C9BFAA4586B85D5855F9AAF87D1E19847D6389036D81EEB348E70ADC8FF3C181BEE8A761586EB5520B34A8E75D1499E0A510979026777DF037A63DA427DFCE7535BA8EC04BBE80A8A2F8761B8CC47572652F3D950806182C79FD3A9C2250C8A3AD0513700B482A1749D0D8D00F5297A57FEC3260A16F4577D380CFB998754591026D8453BCE1209A90974189151F845066A431D2479FA4D9817AA1007FE93A78DA4A1DD863A8CC888B8B4E58663243BB9D52290A70D3311A40E74999DF2A27AC9999F9AEAD071573197E95D246AAB75983DCADF51F5BE358B52873994254AE62458686326D8012B7802B1DAE02D937E4ACBB27E22B0B2B1EF2A07155F2BB7E21AAF4DDC4E9CD297931AA9713FC60933954F32030E75FF2C41D1F0AD2182770A74ED7CC76EEF3707BA2C9737B89FD75E41F1BBA7D75C5DE9B6ADA7FE7CF3BDA59E7392E23117E79C2A6C6BFA5C3002F4D7E95ABB488B5E377C3F4CB77399929A026A071F3DFAD630696B6967B80A7438004A1782C650850C79ECB6B13D36D18AD6E7469B70E7ADCB6E9B09627B059CE4014F3956B66A238A5E3CF44783EAC2A27BDF2BBE1BA6C3CBCC3E678282D886BAACE663042DE6EB50B7EDFFD30CC1DBFF4DC4F0C7091B22226FE8E7C2C7F39CFC7F75FF073D31D90CFED881A0EA97D374BDD08FA7B5670A1641E5AD428D22CFDD9B98AE9B376CF821470337374EC8D37481D84B34CC05A572B6220135C16E255A46F2EE0A1BEEB28725EE3BA9F69CFA8EFC5EF306F4A2E26E0C52E1A144BEC7B828370A08EF258A4C10A25DB0B9A713795C2E0AC4C42BD045543AB0F93588D748F1162637302372DE8C991BE0DEDA6AE26D1FE3B4AD3D7233779CD955F76E3A1B400B7E28DCFBCC88B0FD273FE4A57419AA0D754092774A959BA42A8C7FA451523D0EC8C2B4A16EF56A5F8017EBD6C63888BB24088BE8AB28E99AD0CD5866CCD7AB559A61C500DE3B00A2C73D232A3FC0C2E73ECA96624F88712EB6A179FE2DCD163F07B9D0887C8C9371FA3A23E3BA08962BC9429D8D1ADE3ACF024FD1A2700A07FDFC5BFA01F339CDCE12B26F22A0CBB10EE3310DBFA4EBE22C5994CBC6221406A51CDD011B28B318E760CF11865809F980298A16E551AD60D92147BBADC764A9DB866ECD9C0B5FD61E6C0EAE7C36F59E881530DBBCB62E8B2C2FB0996047AC52CD03C068F8B6324C7917DF13C32AC75DBD19A680514B289CBC343D9116E34294A37D0BFEE617249C3A701143F1783BD8A2BA36ED892CD0F57577AEC028C38A93DA573767D5A8F0DFBDB1CE1CB0F7FAF79C5BAFF5BD6EE77DB192CF9FF393C53212D6F66CB81B9B94B700A4C8210C7837751394F15BE28FA72D6A97BBA09A8F876167692A92C6B13873B1E12E6AB54CA13ACC01258ED36F27B1B03A6D43BFDBDB2D95DF057F5C64DD73BA9351FBF5306CFC187C054E91DA50375E237159D704BA6C463C4873ADCA93F7C678C3B856F5471EE292D59D34E057C39045DE4B74DD47BC79CCA453BD3A6CDCBD51DC6C0FC0E2E1C1D14EDAD3E9E9D913F1D122094D26787CEAF3CE67A08B528C5F46C7DB50ED8776B73E883B1D49DE80DE1CE566B21A08351AFC5E0093BB7BC1948F25741EA1DA02B54753E7F9C7751C1F4FEF833897CE9A55D5159D0E3953E35AF287E7AEC8D55FAAB535C3D202E81611BD276118380F9C910AD78F3442EB3896D04C01C9FD9498A4914D34A4F9DDB89FA2AE9F389F5465F58887A9B25A39754325FA82AA924C27F5C64C3D1BEF91047BF37FC5D595D736C1659044F7282F6ED22F28399E1EEE1F1C4E27277114E4954B30EAE5EAADF8308795DBAB83D7C4ED155A2C67E2E7EECEB3084A9E2F387B7F469FA89575C85FD4D12F48A259DDB9CC8B28EA5BB7473311E148E428FB71E5493E4AA0F74CCE93057A3A9EFE77F9DDDBC9F97FDD329FBE9A5C65B84FDE4EF627FF9E4E88802247098D909A698B4095D22AF3E46B90858F41F68765F0F44716AA7C42C580D4BAAAF001D638A7F20776E813ECB54FB01F7D82BDE900C62A36DA91A270F4643756BA0C11616494D35739E711EBB7EBA02850969054A82CA933FDDB53670F1DC0F88CF284D6BA8CF200C8388DF280C6B88DF2C2DDDA73940730D969945F50AF924E7015E501913A8C1A4E08283C2EBD4C981B9C30A9DD8B0FFAD41E217C909BB523198E903AE7482FAC74EB32EED24485477E60D9879C4BC5ED500FD9FD0ADF453BAB963096761EBA947582E40D8EF57FE4657A7DEA32676DC16074983601E7433B4B516F74627C196DD9ECD5F834F235136E74A6B7E629B45FBCB334656CCEBDA86CD4E39007ACD6E9900FF159FA1EF2C1D3C6FD908F0154F6989791483D117999206A67445BA576D77E893C40D5CE897C94AA754FC40C52C731C8F825EA0EC29EAFB84DEBED97AA59BDB7B0047CCAD8494CB5FB2020B1C2459059C6B6B9B8B55CFD5DAFA549536AB7BCE967FDB3A6E7D8C3CD979D3B7F0BA7CBAEEB48A7BD23D8ADCFEFAECDA039A0F213642B25AD5B5DE35667679B1D70CBD37D76F1BAAB57F9E5F1B1C75EBAE7F100D4E398C3611746E7D3666769E68F19926F1CB70951F87C881D0AC035CDCEF65BEBE3C643D7B56E6E3CEDB036EE3BFAEEB076DEADB52685FADEFFCE72A3BEAEE23600ABAFFA6DD333D354BFF5BE3F9DA336ADDC3266D79E692A98BBC87D4E675CD2F401695DD17447F1B6DF20F859014B648723F955E981C5F952E98C23B8F5E05B6B3AB90C9E2E50F2503C1E4F0F0E7FF225DDB41E327656C029773DF966DCDFEF6030E30E6CA5A1B2ABF4224A9EBB68F1AD1F8E9EC287BFD5D65792351E387A8821AF078280D38DA1F642395E1CBEF9732750C65544F726E41D6FF8B1B763DD6E6CDC5C428BE7A50965FF1ADDB100871AEA7166254104471ADD8B0678CEE8BEB3D0FACC10078649E5ACBF2C835F4DCEF3CF49F4AF358EB8C1AD41944FF5C8F2382302AE2A76765ADC98DECF78C9F06280D1BAC9186E3F077428A169AF7F772189C1B90464A9A5731E01A4875D1398A92894AC9736AA3866AD6BE1197B249677255279B9C8378F540E2880A4B09709332136263CEA02BB655C7D35707FCA17C576766EF0ABF2335E2CBAEB2192E30A1F56279D541152920DA822D70A57123B4B32D62385A1332D35552B62D86135BE29BA3356C3568E236F4C1B0F4EE7C9A083879DE548EB29C29309234AFC9C46D62E23DCE6A1EAAB012C6F242F0D3BDBE35EB6AC6A9F0F3E4E8B3B5ACC804AF4832F4B348FE7148C1388E1D64FD77637EB2DEFA718EEC6CB5F982FAC5B5C6CE173751CF8ECC7BD1460A82A6E6591113C28C6CC957E46DA9617E36E55F764CF9245A94CB13769695DC8BDF93D26F4721D17112936CE1A2F04A5466AA1DAFB782C1413CA43EDEFEDC968D40ABF8802B2DB9A175910C9EE4FAEB32809A355104B7510525A4A5ED2B60DA618F31EAD881D6B5248B5B4C94CFB1AF6D1AC01174684A91938470E7A32F097D2C6658470218EC513A3BE0B6EE82E006E31419A6B6B43B043ACD255521D874FAA45031E50411E06F20329A5171335B1DAAB763CAB9870BE243FEC249F14370AB7964CD485C9B862A6F69BC2023561DF8560013DC36C2D094A4BF45BE8A55DA6D32A7375B6CB68C8280284BD2FC196810B1F4480A8DE0BF6CE19FDDBD4D6D73A46E20C53DA5BF0E69FD87740B77DF7DC815DE86D0379341788C6608FE87C50BD44A9EE3EF30B141A6631537420A1A7AE076F6D0FD9F75639E99D2B8EA2BCF2D6FEB7BA2B266DEFF1A9D84E146246D266852B0BBC4A2B460EC22FD38BD903E8B6C6E78BE53C8DEFFA8EA3E4F227C9B7D06B2FAC7A2AD876726AAA18370AE140DB1A4DB168824188677E5DCEBF366DF7988EC3F1FE265807BD00B34BACA3963CEA62D104DF29EB540FEC6C19EBAE6D9CEBB2CBFAF6AC9C5BD733C1A3904D7DEC01174B4A35CCEE91EE450BEF8CB33CFA51646E3AEBD908FB20EFC9B08891FADAD0C3BF2B1E76E1C346C968E7F77ADC59B82C08F0D8EE56F311B48254CFC1DF1707ED9E2DB3B5D5DC8CDE57B20E38BF7F21DD0BE9865B6C004FD0EDD25A633B18B7A1958635E336BAD060EFF7DF027760B7996D9C6F02B6387CC4F7C22FB52B866D2416639A7B0BD8E7F2F64BB50DAF68C1D4843B1D12305F56CF91D8A17A3B32D03D59378861145B59AB35A6E2F9B7018871C6BF6BD3904378834662077DA288B76F984E5A5B3CD1E0A07AC586B579AE4CFA9A04125DF82C1813082913264E950D93C4901163992765C4C4A93262921832126DBDA4DCC404AA2CC574C67C196B20205326569D2393C8D89EF42011684D1A5367D3BEAE56B7254D60C8A23E629472A8235419D4F156F8F4085B91098DD5E7441319B2536564C8C20E9C73F10733BC8D56770C9BCA90A37076286529C4D77996C16D96422A23C7C5E34180E8621245CE724243E695A32E39471AAE1A5434DA00CEEB4E521E7C749DD5E22E6D056EBEFA888AF2FA3A93D62CAE241D5296F5620A7DF6CE59D2F33653BE34993E737A38E958027AF6622A014DA62F013DA8722C41B5243315A04AA5CF9F3E39689FBD396B53B67659B28722F254CF444219B1F11692B051354141D8C442393109CC7522D7A1E43CCAD01ABB7C5CB7062F63ACDBC9DC499AB4FA561492CB35E59F4ED45CB598302945754A6518CB9F19881A60F544A64AB193961C9C52D7BC3F0DEB6AC28B901655565E2800EA6D77F9C05BE56145B30430A88E5D9A01329B07DBC0685FEFB101248D97D65EADC6BA575D36F206AA6DB004F756656145567EA95A6AB957953365066AA93675E60AC929BA6511411D96FB06D0C5997794611DD8BD8280DD2D504D93752E5070A0CC5B505DE9956A48566B6C490559CB2DF8A8A4055772DD1AA89358D21A4482F2C9DE8492AB06B8DC296BA35DC208020B5EBE50A965588F74105DB0E91E24BF2C8CFCF4DBD2AC4012E374024DB31680C06802EF4D53ABEDE6A6812CD1C6681A6E910281D104BD9B46650405B48D95BD143FF949AB00E145746D93187563C3F3EA03340EB5D1B1691CF83174DD5936DCD95055B6AC9960C311FDE85259980CD2449AF53734B6FC370B6FDD60963B0A4B88EFB771E829BC8544068EEBC710C823358B7C540C3489E13C7990E680B62C4B103EC283162B1C692AB61CD4C79EEA834F61D7A00937EC3970C79C76189A8AD7BE2E9AE3BA26EE68566DE3D000FCB348330C7E992E509C97A147B34FEB8438AFA97EBD4779F4D0421C61CCA47AA2BE05ADD39C27F7697D4A2994A84E22F98329824550042719EEE1202C7034F1DA1A250FD349E91B9368C37768719E5CAD8BD5BAC05546CBBB985B2090D34E5DFE4733A9CC4757A5E398DC4715703123E2EFE72A79B78EE24553EE0F800F1205043946A59E88485F16C423D1C37383F4B17C74D20688365F73FA5B2F01F2AB641E10DFD5EE65C3A3F6023D04E173EB45530562EE08BED98FDE47C143162C738AD17E8F7F620E2F964F7FFD7F8F114FE8BB6E0100, N'6.4.4')
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'202102251219114_Validations', N'MyHealthCare.Models.ApplicationDbContext', 0x1F8B0800000000000400ED5DDB72DC38927DDF88FD878A7A9A99E85149727BA2C721CD84DB976E4F5BB6C22577EF9B82624112C72CB28664D9726CCC97EDC37ED2FEC2822448E292890B09B2AADC0ABDA800F0E07690480089C4FFFDCFFF9EFDFD611DCF3E932C8FD2E47C7E72743C9F91244C575172773EDF16B77FFE61FEF7BFFDE77F9CBD5AAD1F66BF36E99E94E9E897497E3EBF2F8ACDB3C5220FEFC93AC88FD65198A5797A5B1C85E97A11ACD2C5E9F1F15F1727270B4221E6146B363BFBB04D8A684DAA1FF4E78B3409C9A6D806F145BA2271CEC269CCB2429DBD0BD624DF0421399FBF25C1EA224DA222CD7E2337476F92DB2CC88B6C1B16DB8CCC67CFE328A0855A92F8763E0B92242D828216F9D9C79C2C8B2C4DEE961B1A10C4575F3784A6BB0DE29CB0AA3CEB92DBD6EAF8B4ACD5A2FBB0810AB77991AE1D014F9EB0665AC89FF76AEC79DB8CB4215FD1062FBE96B5AE1AF37CFEFC26DD161FF3F94CCEEBD98B382BD39DCF7F2209C9A2F0324BFF49C2E2A8EE9BA30A2922F91143F86E2676C9772D4D289BCABFEF662FB671D93BE709D91659107F37BBDCDEC451F80BF97A957E22C979B28D63BEB4B4BC344E08A041B41C1B92155F3F905B5687CB342B6ED3384ADFACE6B38508B09011DAEFA18FEB0ABF498A27A7F3D93B5A9CE026262D3D165AA0ABA888490341494687CE7C76113CBC25C95D717F3EA7FFCE67AFA307B26A4218ECC724A2238D7E44E96BCC65B9BD29A6C988F635EDBD93A9323A9D2AA3275365F4FD54193DF59FD1BBE0737457C9016CB8CC671F485CA5C8EFA34D2D6A1B5970CDA57A9DA5EB0F69DC899A2EF27A996EB3B0A4728AA5B80AB23B5288C53B5B74524C2BDBB852F4966E2DC60EE55B1FB16696665C632C699548D510414156974151902C293148D5A4261ABE0D92BB6D7037BE4CFA395D9369C46C991315B5D364F6DB7D5490B7E95D3A7A4E3FC641F869929C9624FB1C85241F3DA32B92531D920E4BAACC4DD25B5C86934DC697B4DBE800CBA7A9612586279C535A1D74F88CD2CC17F88CD2CC39B685A38B922208B1E2B5B170018168A588501AD7425E916C9DBFBF65830E2CA998042E2E964629339AD0BDE0ED60821B984B809519480014184A0595D65ABBE088D15BBB68311E574FDFD6EAE9D53A88E2F105F56A95917CFC39F6F23E4DC8BBEDFA86647BB3D4E82179E5E5864E3AF71209B218EE2D1744A047E130C9987D49173F1F37AB7209D4E455065D456BE25CE297240FB368536FDAEDC98819A401C863C7A82AF41C40ED34ED3E7AB88F1F17EB785E6BBA90A05FDD8F3E9E5EC4112D52F9FF4459BD0FC3ED261867CC297AEBC3082B246FF2B3B784E8A56CABB241A792F754B6D79B20F93A48D5AE101E25039A97A791EA3853D2F6211949C209B63526D296995A398D567EA82B195442FD96669FE88804E5531D77DD0A834E308931CAF25F8A1EB4EEAFB10648A21AE05110A179BD8EB2DC97DEE0288D96DB2C9942617917859F26C9E82AFD32BE36447F7E8EA610E12F2AF68C2EBFB74991F9C8C7917C97695EBCA09F1F8C4C77ACDF457A137959C73BE64B25D16A8C9D2BB97A51B20CE2A0634EBFCD0E5A181F306CAEF3B7746867DD2113B3BC5440E66DDB322D3F4531727050235709AE9B295B2E161F8BE80C42120F7A4385375879A85076A841D4A550F508307155D83E3A4797CB9081D0663F18E42DF94CA6548519570072D7AC6CD8DFD19A0F57082D44BA1ED43543C8C74883850038187B8DB4A1636CD7A36BDFF5735FDBF1BDA7228DD8B71A193201C161D3FB5038A38BFF727B7CE0B97003F348C49D1351D16393E23E779950ACF95369E65764BDA1C41E728028E03C3208CD4B68A732D34338A85C6E6FCA4E1FDF5A305D8DBFDA1ECF78149D3E7E0DB2A8EC54CCE2A8664393EA5A1A93FC69882E256083A44D3E687121630FB23D10A11EA5C78E87BB40137FEB7989D6638E04F580D06AE0F41A091764150503E85F7DFFC87934AFAA7D3E66E31BB7BD8E623289F14069E4F322237EEC7E7ADB105913FC5D5A44B751C8EC1C7AF39C8779A43B9AD7C77CF80E14AF578E77D033C95C7441F27C8A9B3E3EC7E49BFC03657703F3634AA7A020E981F292C4842B4F7FA00F641DF127127D91C6392B4215867228807A022F4AAEEB549D6AA0442ADA809A629002F07CB389195A5D166B11295E223F92801E85249A97CD81FDC9F1F1187B316F036F391B32E237FF7FFC5AB817F51F6994BCAC14E78102ADAC339DCEE9A0F1211D93202CA2CF64B0589BCCAE74B9DD6CD28CF274B27BA7A6F3F2D3A77FF195CB8B34B98DB2F5F069E632C8F32F69B6FA39C827E812126E332A289645B0DE1CF675143C2F6F5D73F5257D4D075D9ABD4ACAAF06E3BD4DC34FE9B67895ACAAE54711AA42C112C04B719E8721D5125F53329355654B334C7B2EE75E8384B71D7FFD6D1FE2205A231754452DE1BA49CADD520553A8CE0FE064AE26116FD3BB28B12B6A93142F6A9DC2585496CCB5A825985D49594ABCA055026339EB543EB5CBAA93BCA99815DAA39EA915054317E3551B4FB222AF72FA3588B7BEB3EA4BD66A987A236B85B643B256F95796A7D552DAC210A9494CE1ADD23774731D1252C9F085C9E90FA39891F2D59C3A73F721DA97CDA530F746E6126C875C869906262D4BDA87943E646793B79F03A8BA03CDB37F99EEBA4E8C2A006D1A930ED025F4A50678E3E18E39B8EF93BFDF5D8F7CF9357FBE5A47C9D0D54ED96BA3DEF6966F8EEC78297449B2759497948455F72E5ED5DAE538C5444249E06AA65A0E71E392A21AFE2C252851BA043A71C2A51AE6A6AEAD747F31D2613C4A1034AFCAAA328D632FDB46CE9B229EA4836BBE719C7E791EC743C59C9D887BEA678FBFC78E8193D89107352A97061FD0B7E7A55ECEE9199AAF213EFB31C809EB4BF91C6F6E983E9FFF3378900E83871C88AEA28C56DE1BE0AF11F9D20BCCC9D09B4A9D4B43E76ADD541F71208F621BCD8B4A83698C1B58778C7FA640FB5B69406BFDAB621CE2108B91E9BA4E247AC3E2E34057584202D7BDDCF223DC45A275B920E78860C17B0DDAB7E9DD00494CBF7E1CA5685E5E4EB6AFEE33CE54673C9BF3712EF2A9DB8077535C3B9EC824EBD543F93883FF252E367A9FE7791A46153739F92CBBFC138BFC2A59CD2CFCFF752A0FE7C4F3820EDCA85CDCD1B29CCF8F8F8E4E9416D1C3B7B2AB83E79C2889F02A36F383533E4A41C1A98E104449A18A852809A34D109B8B217D6A2953CAEE683391635E924D79933E29CC6D6C93BBC6B760598C363749E8991AEA6CC131474F28D4231ED6ED66F7785DDFCBCE209DF865F6C43B1DC94C65998069A6763F14BA41EED5700A687DADF144E39C268A0CF89396625AC7C956FC925BF17D521BC9CEEAED0E2A22823C0C56EADC4265FECA0B3535759884979A3E3A0C52AA0ED631C268DEEFE8C8D2FA727712771A47EED3C939B4101310096DDBC32091E4FF05EB66CC194CD7C78DFF087B3186797EE3753CE69566DFA4175CF409D806F7834DC69C57A19D104D70EF805102F6F5D01182F90719910E485900720A5E814CACEFC532A83526E01854719B6C116F41930A32C1978D5EF0C08E6D7AF6AF161C25CFBE0A36A8F4930937A85F6C32D778B69A6689A0BD728DEBF276F7AFF94583EC30C065E560E7F7A0CB4DBA38BE6F7CB5ABD024EB099B7EB42988E23460378B0BD8381E5D06182CE5B965867CC96F92C9DC60A28F978F99898F32BFEB1B6D8AB58BB6556C0A809A3FEE82A3EC56842D07E42B12FBC651E96E065E3E661D3E0947C546DB0147C556D97B8E2AD62D58EFE3A62EDC3E0A676F663FE9E3B67B20A36AAB582D7CBF31CA19EF590C01C892CFBABCE38F50C084101FA0164DEA617CAA2D36EDF0549BC4267FD82A7E37334867AF6E29A301E3F58124B0C8CA7DF8EE5E4F375566FA8944E9BA4323AB613E31DCB3DC3765C766669A4E94AA2DB6034D476892BD577454573258D76BFCCA2016AD0E52137749B323CAF7A2225A8B09688876CFDE5350B157C448821B558AF645AD99B03DFF70BB482B68F0B4B5B78111549009188435AF4DD68D85ED0404AA8DD72A53A82821993ACBBEBCA96A52BE17A8989E52A233EBD39C99C6C98C28C197A4100FEBE7B3CE644E3E7757382522B467C5100877C26E80E1ECE614142ECE80229B4829507202231EFF9A3880C619CA182B581E744604AE203B503660B44F992908CDC18D1540E3CC1E4161674B062814C4EE73DE213DD6E79DDF7B0398B0370DA149C705C65E1737CDE1AE978F3B0CA0959B530889F997357CCE4F7F108AA89818C0D8554575CCCB0A880107DA94B6C0659BD76EE08D6F191338DB7574036737BC4CD8B5966F80B6C0B2C211EEC5AA9295DB733301D53729C021D6CEF7A6D1FE352FC89AB62D0454DD829000B8C90D10F2FC63B05C4A59DE6336648A6A831966B7D51026186512B733C3E6C0F8494F56B5C59A5BB40AFE8CB6DA347606C642958C26C65CBDF4D3A31DECF8CD05BE290CB595D13A56AA91CE3E5668255E2BD0B691CE2276AC06520D3081C63158698A9B22A89D265705445F34008DDD16F23B726A43E82C0D85C223B6865CC95BF54CD3048875A120A85A457170F5C5C78BD4CAE3D66F42A141FB37AEC84D069A7A83666B4ADBC140BDFB5D7C420CEB7BDC380BE839D03CCBB21E2638B459FC884DFDDB0B90FCB4371D92C49E95F1902051158D5B2B56ADCC85387C7981305CC6224E1A01416B61B1A2DD82966C56B85A31355E2770F5F625BCF8865579EF0DD5A8F1E68682CC26B495930C2706359464E4803754539FC10DA5FA9B509B487F6A2F54083DB7E7675A7E85A1691CF4A49EC36265F6C917EE605E4F17EC041FEB61E00CDF54130B283357466823C99D9971542147C96E87C98E35743B3E1E9753BCF357B308320D32FD61E62001840EB49138053CB9A0B68FE130CDF2388DAB8CB4ABA5691FFC00CDD4CC3D1A43F530016F52E0A73A76E73ABC2CAE37690C5B13E0118E0945D300CD55F9F6B4A18D3B5B2CC37BB20E58C0D9822629AFEB6F83B87663D1445C049B4D94DCE5DD972C64B6DC046159EE3F2FE7B387759CE4E7F3FBA2D83C5B2CF20A3A3F5A476196E6E96D7114A6EB45B04A17A7C7C77F5D9C9C2CD635C62214869F7C36D2E654A419ADB9145BBF67523D25F13228829BA0F41BF062B5569281672BC87E5893A5787CA2F65AB345D6A42FFF6F7C45E83CF820885DB3BEA6355D97875A957B0D6001AE7C49BF5D86E503F0B28715FE96DF8B34DEAE138BEB7F381EF3A9C323B1207B8CE5F6A65061BA500724529D899F48486DA833D22988A438DAB1407A02223DE981F43D88F47D0FA4A720D25308E96C215151391355E8AF582388A3C96AAC71FB42FE861BBAFD6531E034DF628D2D8F34B701D63D4FC26374A1F6483FA76B020C572ED80D8B0E5004AE8BB147FCED3E2A085D58A5221C176C8FF5631C849F542C2ED865A8547BDDB93C549A500751D96D0C43525389ED850CCB5230813DFE256DB752C9008A2D45D96356339788C582F646F874A747FE640F8A69217B34DFFE3EA77BF6A2120FC3821C78B85A65249786771BE83046F8E7848496E623F686DBD2A19F3F82EB812D586E023824AA0B0FB9F2484284031EEF3F57C0E323F68864DC99A94F8A7516587DF8A5F97A1C1D8E7BD54E00E982EDB15EC411AD55F9BF08C687BBA2BD0FC3ED265059A5C6BAE8240F85AC843C80B3BBEF01BD336DA139C2F5A92D8007D456BA02F2E5380C57F9E8CA44663A1B4A305CF0F4733A53B8A441D1043AEA0680563096AEB3A311D09C5BFBE33F7C3E6F417FECC371D8CFBD5CCB8370C12EDA719628486DA0C3888CC24F2A5017EA20C9D32FD2BC508738F0BF7C4B4A19DA5DA8C3888C4A1FC2C2708C54AFC25A84F22DC94C0669025D66A7BCA89FCE16A7A62674DA55CC457A13C9DA6A13668FF213A91F14E7519A3087B244C9B20C96DA980B76C00A1E40AC2ED8A5E75BAF6362DFA3CEC8762C495113AD61E2B4B6D5EF2B5391AFD16DBDD61392B0AB87FA47C2915A975E8260C4FC7C197098EF6E058A85EF0D11BC53A06FE73B76FBB0F9D465E9BDC3BDC1EE2A8BDFFDC1F60A4CBF2D42FCF3DDF7163E7F25C57D2ECF5F75D8DEF4B96450E8AFD3B5369616BD6EF87E9C6E17322D6B0AA83062F4E4DBCCE5031CCA2E731DE8709894AE24EDA30E19F3086F67FB75B245AECF4D3BE9EE5C9F9D3B13C4FE0A38C5931E3A56F64A11651718FDD1A0BEF8E8DEF7C877E3747895D9C74C5210BB50979D8198401B034DA8DB51C28B8CC047096DC4F847133B22A26834E8C2C73779F9FFFBDB3FE889C967F0C71E04C59FBDD3F5C2309E361E2E7804CCEB058EA2CEDDBB98AEDB0788C421C70277374ECA770503B99758980B4AEDB445016A83DD4AB48ED49D1A3EDC655744DEC3C2F6AF868EFC41F306F41CE6610C52E9954BB1C78428370A488F5DCA4C90A25DB085772F455C210AC4A42BD0555439C2F93588B70479C85418985179764D991BD0DEDA6BE2ED1FE3B4AD3D7133F79CD9B13B3CBD8DA9257F16EE7D6644D8FF53A4F2997B15AA0B754052774AD14D520CE31F6994D42F3BF2305DA85BBD2ED215A5B83C958A310EE22E09C222FA2C4BBA367437561ECBED669366543180F70E80E869CF9BAA0FA8F0B98DB2B5DC13729C8B9D699E7F49B3D5CF412E35A218E364E8BECDCA715D04EB8D62EDCE478D6FE9678187B4289CC2413FFF92BEA67C4EB35749B96F22A1ABB10EE3310D3FA5DBE255B2AA968D45280D4A35BA0736506639CEC136240CA912F29A5294ACAA635FC94A448D765B8FA952B70BDD9B3917BEF83DDA1C5CFB7E1A3C112330FBBCB6AE8AAC2EB0B96047AC4ACD03C058F8BE320CBDD7EF8961B503B0C10C43607009459357662CCA625C8A72B495A1DFFC42A4530721622C1EEF075BB02BD89EC8025D8577E70A8C32AE38697C7E0B1692881FF09D75E688BD37BCE7DC7A6DE8D53DEF8B957CF9357FBE5A47D2DA9E0F7763137AA340891CC3187857B74A391F28FE78DAA1F6B957AAF9781C7656A622691CCB33171FEEA256AB146AC21C50E238FDF23C9656A75DE8377B53A6F6E1E08F8BBC9B4F77326ABF1E878DEF82CFC0295217EAC66B222FEBDA4097CD883B65AEC53C82EF8C379C8B567FE4295DBBBA9306FC6A1CB2A87B89AEFB8857F79972AAD7844DBB374A9BED0E583CDC39DA5C7B3A3D7DF550FA7B518426173C3DF5454736D84CDE3878729FAD9B2FF129D9A03F96FE7A64E1817862531BCF6A787070F083045C097A140E7D8EC1AA7052EB3896507654A45240F15724276909C842DADFADBF22E62B4870625455AF744954552B677E8B64E7417592F9AC597D3722F7A84C70B4FC575CDF91EC125C0449744BF2E22AFD4492F3F9E9F1C9E97CF63C8E82BCF621C5DC223D935F71B0F29374F2A4F4934456EB85FCB9BBB7A51225CF578251373769341A19E460E8EC17A2D0ACE95CEEF90CFC9AE6D94246389339CA7F5CBB1D8F12E8F18B37C98A3C9CCFFFBBFAEED9ECCD7F5D739F7E377B9FD13E79363B9EFD7B3E7BB78DE372BFF87C7E1BC4B9EAFF1CB66AA9334F3E0759781F647F58070F7FE4A1AAF7360C489D6F031F60AD37237F60A73EC19EF804FBDE27D8D31E60FCECA51D29886720BBB1D267884823A39ABE7E22543E96264E974151902C295391AAA4CEF4EF8E163D7400E764C8135AE763C80320E765C8031AE767C80B771B57431EC0542F437E41BD4A3AC9B7900744E661683C2180B8E8799C3077386132E3061FF4695C08F820376F2C301E2175DE741E59E9D66582657C8D57FEA0B28F38974AD8861CB3FB11673707AB9670E6541EBA94F79AE30D8E7798E3657A7DE83367EDC160749836016F35074B512B3A592171DE6FF66CFA6ABDE0F89A0A773AD55B1315F22B73B03CE52C8B7D90B57552E3A1233B3F353E0468E5AEC607515B8F353E4650D5655E8622735EE3A3133B0736930D47AB7235CE6C7C60352E6D3CD490736AC30D54D7BA75DE6CFA83706E6CDCA6F6F6C3312676D4678C9DD0C4FDC40089115F306631DBE5E2D672CD778396276DA9DDF2669F0DCF9A1D588E3765F6EEFC3D9C31EDD692C33461CC81CBEFAFD1A059A07609632B26AD9B5DE341E560DB1DF0C0D27F7AF1BAB757BB60F1B1D35E7962F10034E0B0C3612F46E7BEE46069E68F198A1B14B72951FA7C0C7506F04272B0FDD6B933F1D0759D47134FFBACADA786A1FBACBDF76CAD49815FF13E586E343713DC0660FDD5B0CD7A6E9A1AB6E6F726955A2BBA3D6376E384A486B989DCE774CEFBC81090CEEB487F146F5B0E924B0DB04476388A0B8D015882DB8CDE38920707B1B5E6B38BE0E12D49EE8AFBF3F9C9E90FBEA49BD619C2C10A3874EB536CC6E3E31E6633EEC0561A2ABF4E2FA2E46B1F2DBE73B93050F8881798864AB2D6D9C20031E4F55810F0AF30D676A8C08BD3A77FE905CA7905E8DF84A28F053F5677BC87859D1B4D68F1BC34A1EA4AA13F16E03B011F67561244F299D0BF68809384FE3B0B9D7B0479609854CEE6CB2AF8BBD99BFC6312FD6B4B23AE686B94CA273EB23CCE88805782839D1677A6F7730E11BC9861741E11C6DBCF017D0768DAEBDF7D4862F02300D96BE9FC0400E9E15BE8662A4A251BA48D2247AD4D2D3C634FC4F2BE44AAAE18F9E611E66B00480A3B1430136267C2A329B05BC6F55723F7A77A5DEC60E706BF2A3FE7B0A0BF1EA2F828F06179D24B15294BB20355E412F11A70B024E39D0FF838306C5C1078C16ADD10F467AC86AD02479E9A361E9C0E94C1BBFC07CB91CE2980273B4692F8398D6CBC03B8CD43F557D83C34403F552EE41F6C8F7BD9B26AAEF7FB382DEE6933032AD177BE4CD13C9E5370F7FDC75B3F5DDADDAFB7BCA562B821AF7E61BEB66E71BD45CCD571E0F31F0F5280A1AAB8954545F0A0187317FB39695B5D8FBBC66ECBBE4A569532C5DFA76575296FCF1F71A117DBB888CA62D3ACE9425069A40EAABB95C74371A122D4F1D1918AC64CF18B2828775BF3220B22D5D3C565162561B40962A50E524A4BC95BB66D8B29C7BC249BD2903529945ADA64A67D44F96CD1824B23C2D40C823B073D19C4AB69D33242BA16C7E3C951DF043774D700F79820EDE5B531D82157E97D521F87CFEA45031D50411E06EA5B18952F139C58DD853B91555CB858923F1D249F907B857B4B26E6C8645A31D3784FE181DAB06F42B080FE61F69604B5C5FE357CDD90D717EA78515B606193881176CF8C2F4013348AF0005B641CC6A06FBAAB39699E669E842ED5D5856BE80D5EAEABEAFB0D7C4FB1900989A29641081F8532D84BC22311C63E3BF44DE809454CCD1CF0B6688F41FECD71C741064C4C1ECD8DB369545EF18EC0B5EE624AD793622ABE2FA598897460E9A283A808CB91A330CCF4A4F2081AB1F17D5B354FE3C3AFD3A8C6E2F9F335F41C08AFD44A16A182722BC74D4238D02247532C966014E2999F1FF3AF83DBBDB6E26014B00BD6414F841C12EB98FD0F5E2C96E01B651DF602CB9EB1EED2C6312FBF19D09DB00BBB015CF02464C30F4BE06229A9C6D973D23D79E09D7196074648E6A613A29DB00FF2BC0C8B18A5AF0D3DFCBBE2611F3EEC948C763EB3A79D85AB8200AFB1EE351F41DB497C0EFEB63868F7AE95AD85E76EF4BE8A75C0A9FF23E91E4937DE620378A3EC90D61AFBC1B81DAD34AC19B7D38506EF15E01AB839BBCF6C131F91E78A23467C2BFCC21D38EC23B13883DE6BC0AA57B47A6A2C7F65BBA736DCE2101A44AC9F32B143F57646A97BD36C14732ABEB2566B4CE47DB01188F14A7C13A72587F47E8DC20EF6BC916815319F75167CB29942FD020E6F295D1B02B60914BA88597086134A265C1C960D97C4901167CFA764C4C5611971490C19C916624A6E72022C4B399D315FCE8608C8948BC573E41219DB93593C00ADC9629A6CEA53B39C6B4B96C0904573DCA9E4D044601934F156F8EC2413C984C5EA7362890CD9611919B2B003173C03C20CEFA2F18EE153197294CE0E952CA5F826CF2AB8CB524A65E4B87C3C08105D4E82E4AC2634645EBBF7527364E1D8A062D10670517752F210A39BAC5637692770F3CD3B525497DEB9B46671A5E890AAAC9753E8B377CE929DB799F265C9F499B3C349C712B0B317530958327D09D841956309EA2599A900752A7DFEECB942FBECCD599BB2B5CB923F1451A77A2E12CA888FB79084ADAA090AC23616CA894B60AE5379894ACDA30A6DB0ABD7571BF02AC6BA9DCC9DA449AB6F4529B95A53F1D945CD058D19975256A730735AF1CC40D600EBE73531C54E5972084A5DFB4031ACAB49AF495A5419BD8600D4DBEECA82B7CAC38A660560501DFB3403646C0FB681D12ADF6303281A2FAB3DAEC6BA575D350D07AA6DB01FF756656945567D892DB5DCAB2A194003F5D499484B2353581EB07109EAFDC277A2CE5F7D8668F3EED5130C7681CAE106BD4211053DBE2A21A8A203D552BFD4AD1FFAF69F605D8AF6216E83DAAF3F76505D833924289DEC0D28850A818B9DAA4ADA058C24AEE0C50B935986D5480FC1051BEE41D2CBC2C44FBF29CD8B23394E27CE342B01088C25F0DE348DD26E6E1AC80E6D8AA611962810184B30B869301328A06DACACA5C4A94F5903486FA96B9BC4A8191B1E661FA17198858E4DE3C0CFA8EB4EB2E1CE86AAB267CD049B8DE84717665F324A136956DFD0D8F2DF2CA26D8359EE207610DF6EE3B033780B890C1CD64F2190276A16F5A0186812C369F228CD016D58562062C4E006500E34910D07FCD0133FF694F60CDA70C38E8370C86987A1A978E31FA33DAC6BE3CE16F5260E0BA03F8B34A3E017E98AC479157AB6F8B04D4A8737F5AF97248FEE3A88338A99D48FDB77A04D9A37C96DDA9C514A256A92283E648A601514C1F38CF670101634BAF4F41A2577F359E54FB3D4866FC8EA4DF27E5B6CB605AD3259DFC4C282AF3CEBD4E57FB650CA7CF6BE723693FBA8022D6654FA087A9FFCB88DE2555BEED780DF1204A23C4465DE8BCABE2C4A2F46775F5BA477D56B953640ACF9DAB3DF660990BF4F9641E9EFDABD6C74D4BE257741F8B5F3BC8981983B426CF6B39751709705EB9C6174DFD39F94C3ABF5C3DFFE1FD48C66CEE66F0100, N'6.4.4')
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'202102251843313_ContractTerms', N'MyHealthCare.Models.ApplicationDbContext', 0x1F8B0800000000000400ED5D5B73DCB8957EDFAAFD0F5DFD94A41CB5248F5313979494C7978C3396AD72CB33FBA6A2D890C4984D7648B62DD7567ED93EEC4FDABFB0200992B89C830B09B2BB1D955ED400F8E1F6E1E0003838F8BFFFF9DFB3BF3EACE3D91792E5519A9CCF4F8E8EE7339284E92A4AEECEE7DBE2F68F3FCEFFFA97FFFC8FB3D7ABF5C3ECD726DDD3321DFD32C9CFE7F745B179BE58E4E13D5907F9D13A0AB3344F6F8BA3305D2F8255BA383D3EFEF3E2E4644128C49C62CD66671FB74911AD49F583FE7C992621D914DB20BE485724CE59388D5956A8B3F7C19AE49B2024E7F3BF918464517899A5FF206171F436B9CD82BCC8B661B1CDC87CF6228E025AA825896FE7B32049D2222868919F7FCAC9B2C8D2E46EB9A101417CF56D4368BADB20CE09ABCAF32EB96DAD8E4FCB5A2DBA0F1BA8709B17E9DA11F0E4296BA685FC79AFC69EB7CD481BF2356DF0E25B59EBAA31CFE72F6ED26DF1299FCFE4BC9EBF8CB3329DD2D475DF1C554811C98F18C293D93B12AC2ED2242AD2EC3772F3A4A5096553F9F764F6721B97BD739E906D9105F193D9E5F6268EC25FC8B7ABF43349CE936D1CF3A5A5E5A57142000DA2E5D890ACF8F691DCB23A5CA659719BC651FA76359F2D4480858CD07E0F7D5C57F86D523C3D9DCFDED3E204373169E9B1D0025D45454C1A084A323A74E6B38BE0E11D49EE8AFBF339FD773E7B133D905513C2603F25111D69F4234A5F632ECBED4D314D46B4AF69EF9D4C95D1E954193D9D2AA31FA6CAE899FF8CDE075FA2BB4A0E60C3653EFB48E22A457E1F6D6A51DBC8826B2ED59B2C5D7F4CE34ED47491D7CB749B852595532CC55590DD91422CDED9A293625AD9C695A2B7746B317628DFFA8835B334E31A6349AB44AA86080AB2BA0C8A8264498941AA2635D1F05D90DC6D83BBF165D2CFE99A4C2366CB9CA8A89D26B3DFEEA382BC4BEFD2D173FA290EC2CF93E4B424D9972824F9E8195D919CEA90745852656E92DEE2329C6C32BEA4DD4607583E4D0D2B313CE19CD2EAA0C3679466BEC0679466CEB12D1C5D9414418815AF8D850B08442B4584D2B816F28A64EBFCC32D1B746049C5247071B1344A99D184EE056F0713DCC05C02ACCC4002A0C0502AA8B4D6DA05478CDEDA458BF1B87AFABE564FAFD741148F2FA857AB8CE4E3CFB197F76942DE6FD73724DB9BA5460FC92B2F3774D2B9974890C5706FB920023D0A8749C6EC2BBAF8F9B459954BA026AF32E82A5A13E712BF227998459B7AD36E4F46CC200D401E3B4655A1E7006AA769F7D1C37DFCB858C7F35AD38504FDEA7EF4F1F4328E6891CAFF27CAEA43186E37C138634ED15B1F46582179939FBD25442F655B950D3A95BCA7B2BDDE04C9B741AA7685F02819D0BC3C8D54C79992B60FC948124EB0AD3191B6CCD4CA69B4F2435DC9A012EAB734FB4C4724289FEAB8EB56187482498C5196FF52F4A0757F8D354012D5008F8208CDEB4D94E5BEF4064769B4DC66C9140ACBFB28FC3C494657E9D7F1B521FAF34B3485087F59B16774F9BD4D8ACC473E8EE4BB4CF3E225FDFC6064BA63FD2ED29BC8CB3ADE315F2A895663EC5CC9D58B926510071D73FA6D76D0C2F8806173DDD0AD975299C9A83653AEF7E96455DCE7BE9622ED2C3E64A297971E881E605BA6E5E728460E226AE42AC175A302C8C5E263111D4448E2410FA9F0062B2315CA0E3592BA14AA5E0226AE0ADB4787E972193222DAEC0783BC235FC894AA35E30A40EE9A950DFB3B5AF3E10AA18548D783BF6608F91869B010000763AF9136748CED7A74EDBBBEEF6B7BBFF754A411FB5623432620386C7A1F3237D3EFC073E606E691883B27A2A217BBEA55D6FCA934FD2BB2DE50620F399014701E1984E625B45399E9211C7C2EB73765A78F6F7D98AEC65FBD8F678C8A4E1FBF065954762A66C154B3A149752D8D49FE74459712B069D2261FB4B890B107D93288508FD263C7C35DA089BFA34589D6638E04F5C0D16AE0F41A091764150503E85F7DFFC87934AFAA7D3E65E31BCBBD8962328931426934F432237EEC887ADB245913FC7D5A44B751C8EC267AF39C8779A43B9AD7A77CF80E14AF578E777034C95C7441F27C8A9B433EC7E4DBFC23657703F3534AA7A020E981F28AC4842B4F7FA08F641DF1271C7D91C6397B4215867228807A022F4AAEEB549D6AA0442ADA809A629002F062B389195A5D166B11295E4A3F92801E85249A978D01C0C9F1F1187B31EF026F391B32E237FF7FFA56B817F5EF6994BCAA14E78102ADAC339DCEE9A0F1211D93202CA22F64B0589BCC4E75B9DD6CD28CF274B27BACA6F3F7D3677FF295CBCB34B98DB2F5F069E632C8F3AF69B6FA39C827E812126E332A289645B0DE1CF6F5163C2F6F5D73F5357D43075D9ABD4ECAAF06E3BD4BC3CFE9B6789DACAAE54711AA42C112C04B715E8421D512DF50329355659B334C7B2EE75E8384B71D7FFD6D1FE2205A23175E452DE1BA49CADD7A0553A8CE14E064AE2611EFD2BB28B12B6A93142F6A9DC2585496CCB5A825985D49594ABCA055026339EB543EB5CBAA93BCA99815DAA39EA91505830DA4CA369E64455EE5F46B106F7D67D597ACD530F546D60A6D8764ADF2AF2C59ABA5B48521529398C25BA56FE8E63A24A492E10B93D31F47314BE5AB3975E6EE43B42F9B4B61EE8DCC25D80EB90C330D4C5A96B40F297DC8CE266F3F075075079A67FF32DD759D185500DA34261DA04BE84B0DF0C6C31D7370DF277FBFBB1EF9F25BFE62B58E92A1AB9DB2D746BD3D2EDF44D9F152E89264EB282F2909ABEE5DBCAAB5CB718A898492C0D54CB51CE2C6254535FC594A50A2740974E2844B35CCED5D5BE9FE62A4C3789420685E9555651AC75EB68D9C37453C4907D77CE338FDFA228E878A393B11F7CCCF1E7F8F1D0327B1230F6A542E0D3EA06FCF4BBD9CD333345F437CF6539013D697F239DEDC307DBEF847F0201D060F39105D4519ADBC37C05F23F2B5179893A137953A976E9D2B496D0EE4516CA3795169308D7103EB8EF1CF14687F2B0D68AD7F558C431C6C31325DD78944EF5A7C1CE85A4B48E0BA975B7E84BB5CB42E17E46C112C78AF41FB2EBD1B2089E9D78FA314CDCBCBC9F6D57DC699EA8C67733ECE453E751BF06E8A6BCC139964BD7E281F7BF0BFC4C546EF8B3C4FC3A8E226279F65178262915F27AB99853FC14EE5E19C825ED0811B958B3B5A96F3F9F1D1D189D2227AF8567675F09C5326115EC5667E75CA472E2838D51182282954B1102561B409627331A44F2D654AD91D6D2672CC2BB2296FE62785B98D6D72D7F82A2C8BD1E626093D53439D2D38E6E809857AD8C3BADDEC6EAFEB7BD9B9A413BFCC9E7DA72399A92C1330CDD4EE874237C85D1B4E01ADEF369E689C134691017FD0524CEB88D98A5F722B7E486A23D959BDDD4145449087C14A9D5BA8CC5F79A1A6A60E93F052D34787414AD5613B4618CD7B201D595ADFF04EE24EE3187E3A398716620222A16D7B182492FCBF60DD8C3983E9FAB8F11F612FC6304F72BC8EC7BCD2EC9BF4828B3E01DBE07EB0C998F352B413A209EE1D304AC0BE1E3A4230FF2023D201290B404EC12B9089F5BD5806B5C6041C832A6E932DE22D68524126F8B2D10B1ED8B14DCFFED582A3E4D957C106957E32E106F58B4DE61ACF56D32C11B457AE715DDEEEFE35BF68901D06B8AC1CECFC1E74B94917C7F78DAF76159A643D61D38F3605519C06EC6671011BC7A3CB0083A53CB7CC902FF94D32991B4CF4F1F23133F151E6777DA34DB176D1B68A4D0150F3C75D7094DD8AB0E5807C4562DF382ADDCDC0CBC7ACC327E1A8D8683BE0A8D82A7BCF51C5BA05EB7DDCD485DB47E1ECCDEC277DDC760F64546D15AB85EF374639E33D8B210059F2599777FC110A9810E203D4A2493D8C4FB5C5A61D9E6A93D8E40F5BC5EF6606E9ECD52D653460BC3E90041659B90FDFDDEBE9A6CA4C3F91285D77686435CC27867B96FBA6ECD8CC4CD38952B5C576A0E9084DB2F78A8EEA4A06EB7A8D5F19C4A2D5416AE22E697644F95E54446B31010DD1EED97B0A2AF68A184970A34AD1BEA83513B6E71F6E1769050D9EB6F63630820A320183B0E6B5C9BAB1B09D8040B5F15A650A1525245367D95737554DCAF70715D3534A74667D9A33D338991125F89214E261FD7CD699CCC9E7EE0AA74484F6AC1802E14ED80D309CDD9C82C2C51950641329054A4E60C4E35F2707D03843196305CB83CE88C0156407CA068CF6693405A139B8B102689CD92328EC6CC9008582D87DCE3BA4C7FABCF37B6F0013F6A62134E9B8C0D8EBE2A639DCF5F2718701B472730A2131FFB286CFF9E90F421115130318BBAAA88E79590131E0409BD216B86CF3DA0DBCF12D630267BB8E6EE0EC869709BBD6F20DD016585638C2BD5855B2727B6E26A0FA260538C4DAF9DE34DABFE50559D3B68580AA5B10120037B901429E7F5C964B29CB7BCC864C516D30C3ECB61AC204A34CE27666D81C183FE9C9AAB658738B56C19FE5569BC6CEC058A892D1C498AB977E7AB4831DBFB9C0378AA1B6325AC74A35D2D9C70AADC46B05DA36D259C48ED540AA0126D038062B4D715304B5D3E4AA80E88B06A0B1DB427E474E6D089DA5A15078C4D6902B79AB9E699A00B12E140455AB280EAEBEF878915A79DCFA4D283468FFC615B9C940536FD06C4D693B18A877BF8B4F88617D8F1B67013D079A6759D6C30487368B1FB1A97F7B01929FF6A64392D8B3321E1224AAA2716BC5AA95B910872F2F1086CB58C4492320682D2C56B45BD092CD0A572BA6C6EB04AEDEBE8417DFB02AEFBDA11A35DEDC5090D984B67292E1C4A086928C1CF0866AEA33B8A1547F136A13E94FED850AA1E7F6FC4CCBAF30348D839ED47358ACCC3EF9C21DCCEBE9829DE0633D0C9CE19B6A620165E6CA086D24B933338E2AE428D9ED30D9B1866EC7C7E3728A77FE6A1641A641A63FCC1C2480D0813612A7802717D4F6311CA6591EA771959176B534ED831FA0999AB94763A81E26E04D0AFC54C7EE5C8797C5F5268D616B023CC231A1681AA0B92ADF9E36B471678B65784FD6010B385BD024E575FD6D10D76E2C9A888B60B38992BBBCFB9285CC969B202CCBFDC7E57CF6B08E93FC7C7E5F149BE78B455E41E747EB28CCD23CBD2D8EC274BD0856E9E2F4F8F8CF8B9393C5BAC65884C2F093CF46DA9C8A34A3359762EBF74CAAA7245E05457013947E035EAED64A32F06C05D90F6BB2148F4FD45E6BB6C89AF4E5FFF53706F78D3062D7AC6F684DD7E5A156E55E0358802B5FD26F9761F9A0BCEC6185BFE5F7328DB7EBC4E2FA1F8EC77CEAF0482CC81E63B9BD2954982ED401895467E22712521BEA8C740A22298E762C909E82484F7B20FD0022FDD003E91988F40C423A5B485454CE4415FA2BD608E268B21A6BDCBE90BFE1866E7F590C38CDB75863CB23CD6D8075CF93F0185DA83DD2CFE99A00C3950B76C3A2031481EB62EC117FBB8F0A421756A908C705DB63FD1407E167158B0B76192AD55E772E0F9526D44154761BC390D454627B21C3B2144C608F7F49DBAD543280624B51F698D5CC2562B1A0BD113EDDE9913FD983625AC81ECDB7FF9ED33D7B51898761410E3C5CAD32924BC3BB0D741823FC7342424BF3117BC36DE9D0CF1FC1F5C0162C37011C12D585875C792421C2018FF79F2BE0F1117B4432EECCD427C53A0BAC3EFCD27C3D8E0EC7BD6A278074C1F6582FE388D6AAFC5F04E3C35DD13E84E17613A8AC52635D7492874256421EC0D9DDF780DE99B6D01CE1FAD416C0036A2B5D01F9721C86AB7C746522339D0D25182E78FA399D295CD2A068021D7503402B184BD7D9D10868CEADFDF11F3E9FB7A03FF6E138ECE75EAEE541B86017ED384B14A436D0614446E16715A80B7590E4E957695EA8431CF85FBE25A50CED2ED4614446A50F61613846AA57612D42F99664268334812EB3535ED44F678B5353133AED2AE622BD89646DB509B347F91BA91F14E7519A3087B244C9B20C96DA980B76C00A1E40AC2ED8A5E75BAF6362DFA3CEC874589DA5FA05FDFF3E572709397ECFE4346A00364C58D73701FA4A6CE46B74D3B0F5B324EC19A2DE9770A4D661982076312F62061CE6195C8162E17B4304EF14E8DBF98EDD3E6CB67659D8EF70E7B1BB28E377F7B1BD60D36F0312FF7CF7BD85CF8EAA84DE3BA92C992BFAEB74AD05A745AF1BBE1FA7DB854CCB9A020A92183DF92676D9D6CA1E761DE8705495AE24DDA60E19F3807067BB81B2BDAFCF2D41E9665E9F7D4113C4FE0A38C54F1F3A56F66ACB8C5D8FF44783FA5AA57BDF23DF8DD3E155669F324941EC425DF61D62026D3B34A16E07152F33021F54B411E31F7CEC8888A249A20B1FDFE6E5FF1F6E7FA727269FC1EF7B10147F544FD70BC378DAF8CFE011309F1A388A3A77EF62BA6E9F3712871C0BDCDD38295F2D0CE45E62612E28B54B1805A80D762BD13A52F781F870977D1279870CDB1D1B3AF207CD1BD0639B873148A53734C51E13A2DC28203DA52933418A76C1165ED5147185281093AE405751E566E7D720DE12E49954616046E5C938656E407B6BAF89B77F8CD3B6F6C4CDDC7366C76E08F536D596BC65B8F7991161FFCFA8DE05105417EA80A4EE94A29BA418C6DFD328A9DF8DE461BA50B77A5DA42B4A71792A15631CC45D128445F44596746DE86E6C4896DBCD26CDA86200EF1D00D1D39E66551F50E1731B656BB927E438172BD63CFF9A66AB9F835C6A4431C6C98C7E9B95E3BA08D61BC5969E8F1ADF8ED0020F69513885837EFE357D43F99C66AF9372DF444257631DC6631A7E4EB7C5EB64552D1B8B501A946A740F6CA0CC729C83E549185225E40DA528595587CA920D8A1AEDB61E53A56E17BA37732E7CAD7CB439B8F62C3578224660F6796D5D15595D6073C18E58959A0780B1F07D6518EA35C013C36AF762831986C0E0128A26AF8C6494C5B814E5688943BFF98548A70E42C4583CDE0FB66017BC3D9105BA68EFCE1518655C71D2781417EC2F112FE33BEBCC117B6F78CFB9F5DAD08B81DE172BF9F25BFE62B58EA4B53D1FEEC626F4BE82123986A9F1AEEEAC721E56FCF1B443ED736B55F3F138ECAC4C45D23896672E3EDC45AD5629D48439A0C471FAF5452CAD4EBBD0EFF61E4EED21C21F177927A2EE64D47E3D0E1BDF075F8053A42ED48DD7445ED6B5812E9B1177CA5C8BF91BDF196F3807B0FEC8533A8E75270DF8D5386451F7125DF711AFEE33E554AF099B766F9436DB1DB078B873B4E8F6747AFAFAA1F426A3084D2E787AEA8B6E72B099BC711FE53E5B375FE253B2417F2CBD01C9C203F1F3A6369ED5F0E0E0E0E70EB812F4281CFAD88355E1A4D6712CA1EC0649A580E20D494ED2129085B4BF5B6F48CC1391E022A9AA5EE9F0A8AA56CEBC22C9AE89EA24F359B3FA6E44EE5199E068F9CFB8BE81D925B80892E896E4C555FA9924E7F3D3E393D3F9EC451C0579EDA18A395D7A2EBF1161E585E9E469E98589ACD60BF973775F4E254A9EAF04A36E6ED2683432C87DD1D92F44A159D3B9DCE31CF825D0B3858C70267394FFB8766A1E25D0D31A6F931579389FFF77F5DDF3D9DBFFBAE63E7D32FB90D13E793E3B9EFD6B3E7BBF8DE372BFF87C7E1BC4B9EA5D1DB66AA9334FBE0459781F64BF5B070FBFE7A1AAD73C0C489DE7041F60ADAF247F60A73EC19EFA04FBC127D8B31E60FCECA51D2988DF21BBB1D267884823A39ABEAA39AF3471BA0C8A826449998A542575A67F77B4E8A1033817469ED03A0F461E00391F461ED0382F465EB8DB3832F200A6FA30F20BEA55D2499E8B3C2032FF45E30901C401D0E384B9C309931937F8A04FE3A0C007B9796381F108A9F3D5F3C84AB72E132CE36BBCF207957DC4B954C236E498DD8FB8D23958B58433A7F2D0A5BC4F1E6F70BC3B1E2FD3EB439F396B0F06A3C3B409F8C239588A5AD1C90A89F3ADB367D357EB63C7D754B8D3A9DE9AA890D79A83E5296759EC83ACAD0B1C0F1DD979C1F121402B67383E88DAFAC3F13182AA2EF33214996B1C1F9DD8B9C7996C385A95AB7195E303AB7198E3A1869CCB1C6EA0BAD6ADF395D31F847392E336B5B71F0ED2B221773AB6957194BE802B123B118C7B9D0112239E65CC42BBCBC5AD1F9AEF0675435B6AB7BCD967C3B366C79FE34DC0BD3B7F0FE75FBB95E930BD1A7307F3EFD768D09C32929CD2F86339D87607FCB9F49FACBCEE14D60E5D7CECDB577E5D3C000D383A71D8D9D1394339589AF96386E254C56D4A943E1F63D703F06972B0FDD63947F1D0759D7F144FBBB6ADDF87A1BBB6BD7780AD49815F183F586E34F71CDC0660FDD5B0AD7F6E9A1AB683E04D2AB536797BC6ECC6A5490D7313B9CFE99C2F9321209D0F93FE28DE363024071D6089EC7014871C03B004271CBD71247F10626BCD6717C1C33B92DC15F7E7F393D31F7D4937AD6B85831570E846AAD88CC7C73D8C70DC81AD34547E9D5E44C9B73E5A7CE7C061A0F011AF430D9564ADEB860162C8EB2123E0AD61ACCD558117A7CFFED40B94F331D0BF09458F0D5EECA0047F0D3B37C1D0E2796942D531437F2CC013033ECEAC2488E481A17FD100970BFD77163A670BF2C030A99CCD9755F093D9DBFC5312FD734B23AE686B94CA273EB23CCE88808F83839D1677A6F773EE15BC187574FE15C6DBCF013D1168DAEB5F7D4862F04A00597FE9BC0E00E9E13BED662A4A251BA48D2207B74D2D3C634FC4F2BE44AA2E2CF9E611E6B900480ABB2730136267C2A329B05BC6F55723F7A77AF9EC60E706BF2A3FE7FEA0BF1EA2783CF061C7D24B15294BB20355E412F14170B024E35D19F838306C1C1A78C16A9D1AF467AC86AD02479E99361E9C0E9441CF0007CB91CEC58017532CE666C0C76A92F91A709B87EAAFB07968807EAA5CEF3FD81EF7B265D5380BF0715ADCD3660654A2EF7C19B6793CA7E0BC078CB77EBAB4BBAD6F79E7C570DF5EFDC27C09DEE2B28C98ABE3C0E73F1EA4004355712B8B8AE04131E6DC0470D2B6BA6C778DDDBD7D9DAC2A658ABF9DCBEA52DEC53FE2422FB6711195C5A659D385A0D2481D5477C78F87E24245A8E3A323158D19F6175150EEB6E6451644AADF8CCB2C4AC26813C44A1DA4949692B76CDB16538E794536A5596C5228B5B4C94CFBE0F3D9A205974684A91904E7107A328817DDA6658474C98EC793A3BE0B6EE82E15EE3141DAAB7063B043AED287A43E0E9FD58B063AA0823C0CD497352ACF2838B1BAEB7B22ABB870B1247F38483E21B714F7964CCC2DCAB462A6F1C5C203B561DF856001BDCDEC2D096A8BFD6BF8F222AF2FD4F1A2B6C0C2261123ECD61A5F80266814E101B6C8388C41DF9F5773D23C233D095DAAAB0BD7D08BBE5C57D5F71BF89E62211312452D83103E0A65B0778947228C7D76E80BD3138A989A39E0DDD31E83FCBBE38E830C98983C9A1B67D3A8BCE21D816BDDC594AE27C5547C5F4A3113E9C0D2450751119623476198E981E6113462E36BB96A9EC66764A7518DC5F3E76BE871115EA9952C4205E5568E9B8470A0458EA6582CC128C4333F66E65F07B77BBBC5C1286017AC831E1C3924D631FB1FBC582CC177CA3AEC3D973D63DDA58D9B5F7E33A03B61177603B8E049C8861F96C0C552528DB3E7A47B40C13BE32C0F8C90CC4D27443B611FE4C71916314A5F1B7AF8DF8A877DF8B05332DA79E09E7616AE0A02BCEDBAD77C046D27F139F8FBE2A0DD2B59B6169EBBD1FB2AD601A7FE8FA47B24DD788B0DE0C5B3435A6BEC07E376B4D2B066DC4E171ABC57806BE0E6EC3EB34D7C929E2B8E18F1BDF00B77E0B08FC4E20C7AAF01AB5ED1EAA9B1FC95ED9EDA708B436810B17E18C50ED5DB19A5EE85B451CCA9F8CA5AAD3191D7C64620C66BF1859D961CD26B380A3BD86349A255C47CD659F0C9660AF57B3ABCA5746D08D82650E82266C1194E2899707158365C1243469C3D9F9211178765C4253164245B8829B9C909B02CE574C67C391B2220532E16CF914B646C4F66F100B4268B69B2A94FCD72AE2D59024316CD71A79243138165D0C45BE1B3934C241316ABCF89253264876564C8C20E5CF00C0833BC8BC63B864F65C8513A3B54B294E29B3CABE02E4B299591E3F2F1204074390992B39AD09079EDDE4BCD918563838A451BC045DD49C9438C6EB25ADDA49DC0CD37EF49515D7AE7D29AC595A243AAB25E4EA1CFDE394B76DE66CA9725D367CE0E271D4BC0CE5E4C2560C9F4256007558E25A89764A602D4A9F4F9B3C70FEDB337676DCAD62E4BFE50449DEAB94828233EDE4212B6AA262808DB5828272E81B94EE5252A358F2AB4C1AEDE726DC0AB18EB7632779226ADBE15A5E46A4DC5471C351734665C4A599DC2CC69C533035903AC1FEBC4143B65C9212875ED73C7B0AE26BD4D695165F41A02506FBB2B0BDE2A0F2B9A15804175ECD30C90B13DD80646AB7C8F0DA068BCACF6B81AEB5E75D5341CA8B6C17EDC5B95A51559F525B6D472AFAA64000DD45367222D8D4C6179C0C625A8F70BDF893A7FF519A2CDBB574F30D8052A871BF40A4514F4F8AA84A08A0E544BFD52B77EE8DB7F827529DA87B80D6ABFFED841750DE690A074B237A0142A042E76AA2A69173092B882172F4C661956233D04176CB807492F0B133FFDA6342F8EE4389D38D3AC04203096C07BD3344ABBB969203BB4299A4658A240602CC1E0A6C14CA080B6B1B29612A73E650D20BDCCAE6D12A3666C78E67D84C661163A368D033FCAAE3BC9863B1BAACA9E35136C36A21F5D987DC9284DA4597D4363CB7FB388B60D66B983D8417CBF8DC3CEE02D243270583F85409EA859D48362A0490CA7C9A33407B46159818811831B4039D044361CF0434FFCD853DA3368C30D3B0EC221A71D86A6E28D7F8CF6B0AE8D3B5BD49B382C80FE2CD28C825FA42B12E755E8D9E2E336291DDED4BF5E913CBAEB20CE28664242E170B04DF336B94D9B334AA9444D12C5874C11AC82227891D11E0EC28246979E5EA3E46E3EABFC6996DAF00D59BD4D3E6C8BCDB6A05526EB9B5858F095679DBAFCCF164A99CF3E54CE66721F55A0C58C4A1F411F929FB651BC6ACBFD06F05B82409487A8CC7B51D99745E9C5E8EE5B8BF4BE7AFBD20688355F7BF6DB2C01F20FC93228FD5DBB978D8EDA77E42E08BF759E373110734788CD7EF62A0AEEB2609D338CEE7BFA937278B57EF8CBFF03D2F4B92CE2700100, N'6.4.4')
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'202102251844365_CVAndVideoPath', N'MyHealthCare.Models.ApplicationDbContext', 0x1F8B0800000000000400ED5DDD72DCB895BEDFAA7D87AEBE4A5213B5648F531397949447B633CE58B6CA2D7BF64E45B12189319BEC906C5BAEAD3CD95EEC23ED2B2C4882247ECEC10F09B2BB1D956ED400F8E1EFC3C1017070F07FFFF3BFA77F7D58C7B32F24CBA334399B9F1C1DCF672409D35594DC9DCDB7C5ED1F7F9AFFF52FFFF91FA7AF56EB87D9A726DDD3321DFD32C9CFE6F745B179BE58E4E13D5907F9D13A0AB3344F6F8BA3305D2F8255BA78727CFCE7C5C9C982508839C59ACD4E3F6C93225A93EA07FD799E2621D914DB20BE485724CE59388D5956A8B377C19AE49B202467F3BF918464517899A5FF206171F426B9CD82BCC8B661B1CDC87CF6228E025AA825896FE7B32049D2222868919F7FCCC9B2C8D2E46EB9A101417CF56D4368BADB20CE09ABCAF32EB96DAD8E9F94B55A741F3650E1362FD2B523E0C953D64C0BF9F35E8D3D6F9B9136E42BDAE0C5B7B2D655639ECD5FDCA4DBE2633E9FC9793D3F8FB3329DD2D475DF1C554811C98F18C20FB3B724585DA44954A4D96FE4E6879626944DE5DF0FB3F36D5CF6CE5942B64516C43FCC2EB7377114FE4ABE5DA59F4972966CE3982F2D2D2F8D130268102DC78664C5B70FE496D5E132CD8ADB348ED237ABF96C21022C6484F67BE8E3BAC26F92E2E993F9EC1D2D4E701393961E0B2DD05554C4A481A024A343673EBB081EDE92E4AEB83F9BD37FE7B3D7D1035935210CF66312D191463FA2F435E6B2DCDE14D36444FB9AF6DEC954193D992AA3A75365F4E354193DF39FD1BBE04B7457C9016CB8CC671F485CA5C8EFA34D2D6A1B5970CDA57A9DA5EB0F69DC899A2EF27A996EB3B0A4728AA5B80AB23B5288C53B5D74524C2BDBB852F4966E2DC60EE55B1FB16696665C632C699548D510414156974151902C293148D5A4261ABE0D92BB6D7037BE4CFA255D9369C46C991315B5D364F6DB7D5490B7E95D3A7A4E3FC741F879929C9624FB1285241F3DA32B92531D920E4BAACC4DD25B5C86934DC697B4DBE800CBA7A9612586279C535A1D74F88CD2CC17F88CD2CC39B685A38B922208B1E2B5B170018168A588501AD7425E916C9DBFBF65830E2CA998042E2E964629339AD0BDE0ED60821B984B809519480014184A0595D65ABBE088D15BBB68311E574FDFD7EAE9D53A88E2F105F56A95917CFC39F6F23E4DC8BBEDFA86647BB3D4E82179E5E5864E3AF71209B218EE2D1744A047E130C9987D49173F1F37AB7209D4E455065D456BE25CE297240FB368536FDAEDC98819A401C863C7A82AF41C40ED34ED3E7AB88F1F17EB785E6BBA90A05FDD8F3E9ECEE38816A9FC7FA2ACDE87E176138C33E614BDF56184159237F9D95B42F452B655D9A053C97B2ADBEB4D907C1BA46A57088F9201CDCBD348759C2969FB908C24E104DB1A1369CB4CAD9C462B3FD4950C2AA17E4BB3CF744482F2A98EBB6E85412798C41865F92F450F5AF7D7580324510DF02888D0BC5E4759EE4B6F709446CB6D964CA1B0BC8BC2CF936474957E1D5F1BA23FBF445388F0F38A3DA3CBEF6D52643EF27124DF659A17E7F4F38391E98EF5BB486F222FEB78C77CA9245A8DB17325572F4A96411C74CCE9B7D9410BE30386CD7543B75E4A6526A3DA4CB9DEA79355719F0FC4FB34C9DAF353B422E93839694E8A985A32447391D7528862635BA6E5E728464E566AE42AC175A3D3C8C5E26311A54A48E241B1AAF0066B5715CA0E55ACBA14AAA20526AE0ADB4729EB72193224DBEC0783BC255FC8946B05C61580DC352B1BF677B4E6C315420B91AE2799CD10F231D26021000EC65E236DE818DBF5E8DAF7058CAFF38ADEDB7C1AB16F3532640282C3A6F7A979A34F0C3C386F601E89B873222A8ABEABA268CD9F6AE97245D61B4AEC2127AC02CE2383D0BC84762A333D8493DCE5F6A6ECF4F1CD29D3D5F8DB11E359D7A2D3C7A7208BCA4EC54CB26A3634A9AEA531C91F17E95202465ADAE483161732F620E30C11EA517AEC78B80B34F177562AD17ACC91A09EA05A0D9C5E23E182ACA26000FDABEF1F398FE655B5CFC76C7CEBBFD7514C26B1AE28ADA0CE33E2C730AAB7919535C1DFA545741B85CC10A437CF799847BAA3797DCC87EF40F17AE578276193CC451724CFA7B80AE5734CBEC93F507637303FA7740A0A921E282F494CB8F2F407FA40D6117F64D317699CC3345461288702A827F0A2E4BA4ED5A9064AA4A20DA8290629002F369B98A1D565B11691E22DFB2309E85148A279D958349C1C1F8FB117F336F096B321237EF3FFE76F857B51FF9E46C9CB4A711E28D0CA3AD3E99C0E1A1FD23109C222FA42068BB5C90C6F97DBCD26CD284F27BB986B322878F2EC4FBE72394F93DB285B0F9F662E833CFF9A66AB5F827C822E21E136A382625904EBCD61DFD7C1F3F2D635575FD3D774D0A5D9ABA4FC6A30DEDB34FC9C6E8B57C9AA5A7E14A12A142C01BC14E74518522DF13525335955C646C3B4E772EE354878DBF1D77BAFE43C0EA235728357D412AE9BA4DC355E3085EA1D024EE66A12F136BD8B12BBA23649F1A2D6298C4565C95C8B5A82D99594A5C40B5A253096B34EE553BBAC3AC99B8A59A13DEA995A5130D8E2AB6CE34956E4554E9F8278EB3BABBE64AD86A937B256683B246B957F659A5B2DA52D0C919AC414DE2A7D4337D72121950C5F983CF969143B5BBE9A5367EE3E44FBB2B914E6DEC85C82ED90CB30D3C0A46549FB90D287EC6CF2F673005577A079F62FD35DD7895105A04D63D201BA84BED4006F3CDC3107F77DF2F7BBEB912FBFE52F56EB2819BADA297B6DD4EBF0F2D59A1D2F852E49B68EF29292B0EADEC5AB5ABB1CA7984828095CCD54CB216E5C5254C39FA504254A9740274EB854C3FCF8B595EE2F463A8C470982E6555955A671EC65DBC87953C4937470CD378ED3AF2FE278A898B31371CFFCECF1F7D83170123BF2A046E5D2E003FAF6BCD4CB393D43F335C4673F0739617D299FE3CD0DD3E78B7F040FD261F09003D15594D1CA7B03FC1491AFBDC09C0CBDA9D4B974EB5C496A73208F621BCD8B4A83698C1B58778C7FA640FB5B69406BFDAB621CE2318C91E9BA4E24BA0BE3E3405F614202D7BDDCF223DC87A475B920EF9160C17B0DDAB7E9DD00494CBF7E1CA5685E5E4EB6AFEE33CE54673C9BF3712EF2A9DB807753DCCB9EC824EBD543F97A85FF252E367A5FE4791A46153739F92CFB44148BFC2A59CD2C1C24762A0FE7E5F4820EDCA85CDCD1B29CCD8F8F8E4E9416D1C3B7B2AB83E7BC4C89F02A36731454BEDA41C1A98E104449A18A852809A34D109B8B217D6A2953CAEE683391635E924DE96A2029CC6D6C93BBC6F962598C363749E8991AEA74C131474F28D46520D6ED66FF815DDFCBDE329DF86576553C1DC94C65998069A6763F14BA41FEE7700A689DD1F144E3BC4A8A0CF88396625ACFD256FC925BF17D521BC9CEEAED0E2A22823C0C56EADC4265FECA0B3535759884979A3E3A0C52AA1EE831C2681E38E9C8D23ABB7712771A4FF7D3C939B4101310096DDBC32091E4FF05EB66CC194CD7C78DFF087B3186B9C6E3753CE69566DFA4175CF409D806F7834DC69CDBA59D104D70EF805102F6F5D01182F90719910E485900720A5E814CACEFC532A83526E01854719B6C116F41930A32C1978D5EF0C08E6D7AF6AF161C25CFBE0A36A8F4930937A85F6C32D778B69A6689A0BD728DEBF276F7AFF94583EC30C065E560E7F7A0CB4DBA38BE6F7CB5ABD024EB099B7EB42988E23460378B0BD8381E5D06182CE5B965867CC96F92C9DC60A28F978F99898F32BFEB1B6D8AB58BB6556C0A809A3FEE82A3EC56842D07E42B12FBC651E96E065E3E661D3E0947C546DB0147C556D97B8E2AD62D58EFE3A62EDC3E0A676F663FE9E3B67B20A36AAB582D7CBF31CA19EF590C01C892CFBABCE38F50C084101FA0164DEA617CAA2D36EDF0549BC4267FD82A7E37334867AF6E29A301E3F58124B0C8CA7DF8EE5E4F375566FA8944E9BA4323AB613E31DCB3DC3765C766669A4E94AA2DB6034D476892BD577454573258D76BFCCA2016AD0E52137749B323CAF7A2225A8B09688876CFDE5350B157C448821B558AF645AD99B03DFF70BB482B68F0B4B5B78111549009188435AF4DD68D85ED0404AA8DD72A53A82821993ACBBEBCA96A523EA8A8989E52A233EBD39C99C6C98C28C197A4100FEBE7B3CE644E3E7757382522B467C5100877C26E80E1ECE614142ECE80229B4829507202231EFFDC3A80C619CA182B581E744604AE203B503660B46FBD2908CDC18D1540E3CC1E4161674B062814C4EE73DE213DD6E79DDF7B0398B0370DA149C705C65E1737CDE1AE978F3B0CA0959B530889F997357CCE4F7F108AA89818C0D8554575CCCB0A880107DA94B6C0659BD76EE08D6F191338DB7574036737BC4CD8B5966F80B6C0B2C211EEC5AA9295DB733301D53729C021D6CEF7A6D1FE2D2FC89AB62D0454DD829000B8C90D10F2FC6BB95C4A59DE6336648A6A831966B7D51026186512B733C3E6C0F8494F56B5C59A5BB40AFECEB8DA347606C642958C26C65CBDF4D3A31DECF8CD053EBA0CB595D13A56AA91CE3E5668255E2BD0B691CE2276AC06520D3081C63158698A9B22A89D265705445F34008DDD16F23B726A43E82C0D85C223B6865CC95BF54CD3048875A120A85A457170F5C5C78BD4CAE3D66F42A141FB37AEC84D069A7A83666B4ADBC140BDFB5D7C420CEB7BDC380BE839D03CCBB21E2638B459FC884DFDDB0B90FCB4371D92C49E95F1902051158D5B2B56ADCC85387C7981305CC6224E1A01416B61B1A2DD82966C56B85A31355E2770F5F625BCF8865579EF0DD5A8F1E68682CC26B495930C2706359464E4803754539FC10DA5FA9B509B487F6A2F54083DB7E7675A7E85A1691CF4A49EC36265F6C917EE605E4F17EC041FEB61E00CDF54130B283357466823C99D9971542147C96E87C98E35743B3E1E9753BCF357B308320D32FD61E62001840EB49138053CB9A0B68FE130CDF2388DAB8CB4ABA5691FFC00CDD4CC3D1A43F530016F52E0A73A76E73ABC2CAE37690C5B13E0118E0945D300CD55F9F6B4A18D3B5D2CC37BB20E58C0E9822629AFEB6F83B87663D1445C049B4D94DCE5DD972C64B6DC046159EE3F2EE7B387759CE467F3FBA2D83C5F2CF20A3A3F5A476196E6E96D7114A6EB45B04A174F8E8FFFBC383959AC6B8C45280C3FF96CA4CDA948335A7329B67ECFA47A4AE26550043741E937E07CB5569281672BC87E5893A5787CA2F65AB345D6A42FFFAFBF31B86F8411BB667D4D6BBA2E0FB52AF71AC0025CF9927EBB0C8338C8640F2BFC2DBFF334DEAE138BEB7F381EF3A9C323B1207B8CE5F6A65061BA500724529D899F48486DA833D213104971B46381F414447ADA03E94710E9C71E48CF40A46710D2E942A2A27226AAD05FB146104793D558E3F685FC0D3774FBCB62C069BEC51A5B1E696E03AC7B9E84C7E842ED917E49D70418AE5CB01B161DA0085C17638FF8DB7D5410BAB04A45382ED81EEBE738083FAB585CB0CB50A9F6BA7379A834A10EA2B2DB1886A4A612DB0B1996A560027BFC4BDA6EA59201145B8AB2C7AC662E118B05ED8DF0E94E8FFCC91E14D342F668BEFDF79CEED98B4A3C0C0B72E0E16A95915C1ADE6DA0C318E19F13125A9A8FD81B6E4B877EFE08AE07B660B909E090A82E3CE4CA2309110E78BCFF5C018F8FD823927167A63E29D65960F5E197E6EB717438EE553B01A40BB6C73A8F235AABF27F118C0F77457B1F86DB4DA0B24A8D75D1491E0A590979006777DF037A67DA427384EB535B000FA8AD7405E4CB7118AEF2D19589CC74369460B8E0E9E774A6704983A20974D40D00AD602C5D674723A039B7F6C77FF87CDE82FED887E3B09F7BB99607E1825DB4E32C5190DA40871119859F55A02ED44192A75FA579A10E71E07FF9969432B4BB50871119953E8485E118A95E85B508E55B92990CD204BACC4E79513F9D2D4E4D4DE8B4AB988BF42692B5D526CC1EE56FA47E509C4769C21CCA1225CB32586A632ED8012B7800B1BA60979E6FBD8E897D8F3A23D3617596EA17F4FFFB5C9D24E47807F44FAAB2D884D9A37C8A56245581B8E03D9B395093B461D3477D37A1EF1C827C8D6E63B69E9F845D4CD41F148ED4BA30132602CCAF990187F92A57A058F8DE10C13B05FA76BE63B70FD31F5CB61A76B817DA5DDDF1BB1FDA5EF9E9B7258A7FBEFBDEC2E76B75CEC0E7891DF5B96440E9AFD3B536A516BD6EF87E9C6E17322D6B0AA86C62F4E4DBEA655B2BBBEA75A0C3E159BA92B4AD3A64CC23CB9DED4FCA16C83E3729A5BB827D762A4D10FB2BE014CF81E858D9AB4D3C7661D31F0DEA8B9EEE7D8F7C374E8757997DCC2405B10B75D9098909B411D284BA1D9D9C67043E3A6923C63F8AD91111452349173EBEC9CBFFDFDFFE4E4F4C3E83DFF72028FECC9FAE1786F1B4F1E8C123605E3E701475EEDEC574DD3EB8240E3916B8BB7152BEA318C8BDC4C25C506A27350A501BEC56A275A4EE4CF1E12E3B37F29E1DB65F3774E40F9A37A0E73F0F63904AAF7A8A3D2644B951407ADC53668214ED822DBCF329E20A5120265D81AEA2CAF1CFA720DE12E4E156616046E5593D656E407B6BAF89B77F8CD3B6F6C4CDDC7366C7EE2CF5361E97FC77B8F7991161FF4FCDDE06105417EA80A4EE94A29BA418C6DFD328A95FB2E461BA50B77A5DA42B4A71792A15631CC45D128445F44596746DE86EAC5A96DBCD26CDA86200EF1D00D1D39EAF551F50E1731B656BB927E43817BBDA3CFF9A66AB5F825C6A4431C6C9B07F9B95E3BA08D61BC5BA9F8F1ADFB2D1020F69513885837EFE357D4DF99C66AF9272DF444257631DC6631A7E4EB7C5AB64552D1B8B501A946A740F6CA0CC729C832D4C185225E435A5285955C7DC92558C1AEDB61E53A56E17BA37732E7CD17DB439B8F6753578224660F6796D5D15595D6073C18E58959A0780B1F07D6518EAC7C013C36A8767831986C0E0128A26AFCC7694C5B814E5681B44BFF99548A70E42C4583CDE0FB66057CE3D9105BAFAEFCE1518655C71D2F838172C4211BFE73BEBCC117B6F78CFB9F5DAD0AB8ADE172BF9F25BFE62B58EA4B53D1FEEC626F40685123986F1F3AE6ED1723E5FFCF1B443ED738F56F3F138ECAC4C45D23896672E3EDC45AD5629D48439A0C471FAF5452CAD4EBBD0EFF66650EDB3C21F1779B7A6EE64D47E3D0E1BDF055F8053A42ED48DD7445ED6B5812E9B1177CA5C8B7940DF196F3897B4FEC853BAB275270DF8D5386451F7125DF711AFEE33E554AF099B766F9436DB1DB078B873B431F7747AFAEAA1F46FA3084D2E787AEA8B8E7BB099BC7168E53E5B375FE253B2417F2CFD13C9C203F13CA7369ED5F0E0E0E00718B812F4281CFAFC8455E1A4D6712CA1EC9849A580E29F494ED2129085B4BF5BFF4CCC3792E0B4A9AA5EE982A9AA56CEFC34C9CE92EA24F359B3FA6E44EE5199E068F9CFB8BE13DA25B80892E896E4C555FA992467F327C7274FE6B3177114E4B5CF2CE606EAB9FC6A85955FA893A7A55F28B25A2FE4CFDDBD4B952879BE128CBAB949A3D1C820874AA7BF1285664DE772CF85E0D7524F1732C2A9CC51FEE3DACD7A94408F7DBC4956E4E16CFEDFD577CF676FFEEB9AFBF487D9FB8CF6C9F3D9F1EC5FF3D9BB6D1C97FBC567F3DB20CE557FEFB0554B9D79F225C8C2FB20FBDD3A78F83D0F55BD2F6240EA7C39F8006BBD37F9037BE213ECA94FB01F7D823DEB01C6CF5EDA91827842B21B2B7D86883432AAE9AB9AF34A13A7CBA028489694A948555267FA77478B1E3A8073AAE409ADF3A9E40190F3AAE4018DF3ABE485BB8D6B250F60AA5725BFA05E259DE44BC90322F3A8349E10405C123D4E983B9C309971830FFA342E137C909B3716188F903AEF418FAC74EB32C132BEC62B7F50D9479C4B256C438ED9FD88739F83554B38732A0F5DCA7B09F206C73B08F232BD3EF499B3F660303A4C9B80779E83A5A8159DAC90386F3F7B367DB55E7F7C4D853B9DEAAD890AF9D139589E7296C53EC8DA3AE5F1D0919D5F1E1F02B472CFE383A8AD871E1F23A8EA322F439139EBF1D1899DC39EC986A355B91AE73D3EB01A173E1E6AC839F1E106AA6BDD3AEF3DFD4138B73D6E537BFBE1202D1B72F033A0329FBC69789C7B9FB1A705C0478ADDDC80BBC30112232E6FCCB349978B1B419AEF06F1A32DB55BDEECB3E159B373D9F128D0BBF3F75031B05B320F53F8313F35FF7E8D064D766E02D4BAD9358E620EB6DD014733FD271EAF5B98B5A7191F070A95C3190F4003CE741CB69C745E5A0E9666FE98A1787B719B12A5CFC7D88E019CAD1C6CBF755E5B3C745DE7B8C5D37672EB9062E87672EFAD696B52E037D90F961BCD050CB701587F35EC4C829BA6866D6D78934AADB1E09E31BBF1B552C3DC44EE733AE764650848E75CA53F8AB79D15C9730858223B1CC553C8002CC13B486F1CC95185D85AF3D945F0F0962477C5FDD9FCE4C94FBEA49BD6E7C3C10A387487576CC6E3E31ED641EEC0561A2ABF4E2FA2E45B1F2DBEF32C3150F888F7B4864AB2D6A7C40031E4F5F413702331D6AEAFC08B27CFFED40B94737ED0BF094557125E0CB40447123BB70DD1E2796942D563447F2CC045043ECEAC2488E41AA27FD1005F10FD77163A2F10F2C030A99CCD9755F00FB337F9C724FAE796465CD1D628954F7C64799C1101E70B073B2DEE4CEFE7FC3E78B136E91C3F8CB79F03BA48D0B4D7BFFA90C4E02E01324BD3B94300D2C397EDCD54944A36481B454E949B5A78C69E88E57D8954DDA4F2CD23CCA5029014F69B6026C4CE84475360B78CEBAF46EE4FF556DCC1CE0D7E557ECE2F437F3D4471C5E0C3C0A6972A52966407AAC825E21CE16049C6FB58F07160D8785AF082D57A5BE8CF580D5B058E3C336D3C381D28832E0B0E96239DEF032F3662CCFF818FD5247382E0360FD55F61F3D000FD54F13B70B03DEE65CBAAF162E0E3B4B8A7CD0CA844DFF9B2B8F3784EC1B935186FFD7469E746C0F2328EC11180FA85F976BEC52D1E3157C781CF7F3C480186AAE2561615C18362CCF92FE0A46D750BF01ABB14FC2A5955CA147F6D98D5A5741270C4855E6CE3222A8B4DB3A60B41A5913AA8EEF2210FC5858A50C747472A1ABB71504441B9DB9A175910A90E3D2EB32809A34D102B7590525A4ADEB26D5B4C39E625D994F6BA49A1D4D22633EDDBD8A78B165C1A11A66610BC56E8C920DEC09B9611D2ED3F1E4F8EFA2EB8A1BBEDB8C70469EFE88DC10EB94AEF93FA387C562F1AE8800AF230509FFCA85CB6E0C4EAEE158AACE2C2C592FCE120F9845C9FDC5B32317F2DD38A99C6490C0FD4867D1782057483B3B724A82DF6AFE15B95BCBE50C78BDA020B9B448CB0EB747C019AA0518407D822E33006BA2988E4A479717B12BA545717AEA1A786B9AEAAEF37F03DC54226248A5A06217C14CA600F268F4418FBECD0A7AF2714313573C04BB13D06F977C71D07193031793437CEA65179C53B02D7BA8B295D4F8AA9F8BE946226D281A58B0EA2222C478EC230D3CBD12368C4C6677CD53C8DEFDB4EA31A8BE7CFD7D0AB27BC522B59840ACAAD1C3709E1408B1C4DB158825188677E65CDBF0E6EF7A88C8351C02E5807BD847248AC63F63F78B15882EF9475D843337BC6BA4B1BFFC3FC664077C22EEC0670C193900D3F2C818BA5A41A67CF49F7B28377C6591E1821999B4E8876C23EC8C1342C6294BE36F4F0BF150FFBF061A764B4730D3EED2C5C1504787476AFF908DA4EE273F0F7C541BBE7BB6C2D3C77A3F755AC034EFD1F49F748BAF1161BC0536C87B4D6D80FC6ED68A561CDB89D2E3478AF00D7C0CDD97D669BE0D1802F8E18F1BDF00B77E0B08FC4E20C7AAF01AB5ED1EAA9B1FC95ED9EDA708B436810B17EB1C50ED5DB19A5EEE9B651CCA9F8CA5AAD319167D04620C62BF1E99F961CD2333D0A3BD82B4EA255C47CD659F0C9660AF5433FBCA5746D08D82650E82266C1194E2899707158365C1243469C3D9F9211178765C4253164245B8829B9C909B02CE574C67C391B2220532E16CF914B646C4F66F100B4268B69B2A94FCD72AE2D59024316CD71A79243138165D0C45BE1B3934C241316ABCF89253264876564C8C20E5CF00C0833BC8BC63B864F65C8513A3B54B294E29B3CABE02E4B299591E3F2F1204074390992B39AD09079EDDE4BCD918563838A451BC045DD49C9438C6EB25ADDA49DC0CD37EF48515D7AE7D29AC595A243AAB25E4EA1CFDE394B76DE66CA9725D367CE0E271D4BC0CE5E4C2560C9F4256007558E25A89764A602D4A9F4F9B35719EDB337676DCAD62E4BFE50449DEAB94828233EDE4212B6AA262808DB5828272E81B94EE5252A358F2AB4C1AE1E996DC0AB18EB7632779226ADBE15A5E46A4DC5D725351734665C4A599DC2CC69C533035903AC5F11C5143B65C9212875ED3BCCB0AE263D9A695165F41A02506FBB2B0BDE2A0F2B9A15804175ECD30C90B13DD80646AB7C8F0DA068BCACF6B81AEB5E75D5341CA8B6C17EDC5B95A51559F525B6D472AFAA64000DD45367222D8D4C6179C0C625A8F70BDF893A7FF519A2CDBB574F30D8052A871BF40A4514F4F8AA84A08A0E544BFD52B77EE8DB7F827529DA87B80D6ABFFED841750DE690A074B237A0142A042E76AA2A69173092B882172F4C661956233D04176CB807492F0B133FFDA6342F8EE4389D38D3AC04203096C07BD3344ABBB969203BB4299A4658A240602CC1E0A6C14CA080B6B1B29612A73E650D203D19AF6D12A3666C787F7E84C661163A368D03BF16AF3BC9863B1BAACA9E35136C36A21F5D987DC9284DA4597D4363CB7FB388B60D66B983D8417CBF8DC3CEE02D243270583F85409EA859D48362A0490CA7C9A33407B46159818811831B4039D044361CF0434FFCD853DA3368C30D3B0EC221A71D86A6E28D7F8CF6B0AE8D3B5DD49B382C80FE2CD28C825FA42B12E755E8E9E2C336291DDED4BF5E923CBAEB204E29664242E170B04DF326B94D9B334AA9444D12C5874C11AC82227891D11E0EC28246979E5EA3E46E3EABFC6996DAF00D59BD49DE6F8BCDB6A05526EB9B5858F095679DBAFC4F174A994FDF57CE66721F55A0C58C4A1F41EF939FB751BC6ACBFD1AF05B82409487A8CC7B51D99745E9C5E8EE5B8BF4AE7A94D30688355F7BF6DB2C01F2F7C93228FD5DBB978D8EDAB7E42E08BF759E373110734788CD7EFA320AEEB2609D338CEE7BFA937278B57EF8CBFF03F1BD587BDE720100, N'6.4.4')
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'202102251901044_unkownChanges', N'MyHealthCare.Models.ApplicationDbContext', 0x1F8B0800000000000400ED5DDD72DCBA91BEDFAA7D87A9B94A52271AC93E4E9DB8A4A47C643BC73996ADF2C83E7BA7A23890C498434E488E2DD7569E6C2FF691F615162441123FDDF82141CE8CA3D28D0600BFC64FA3D140371AFFF73FFF7BFAD787753CFB42B23C4A93B3F9C9D1F17C4692305D45C9DDD97C5BDCFEF1A7F95FFFF29FFF71FA6AB57E987D6ACA3D2DCBD12F93FC6C7E5F149BE78B451EDE9375901FADA3304BF3F4B6380AD3F52258A58B27C7C77F5E9C9C2C08859853ACD9ECF4C33629A235A97ED09FE76912924DB10DE28B7445E29CA5D39C65853A7B17AC49BE09427236FF1B494816859759FA0F1216476F92DB2CC88B6C1B16DB8CCC672FE228A0955A92F8763E0B92242D828256F9F9C79C2C8B2C4DEE961B9A10C457DF368496BB0DE29CB0A63CEF8ADBB6EAF849D9AA45F76103156EF3225D3B029E3C65DDB4903FEFD5D9F3B61B6947BEA21D5E7C2B5B5D75E6D9FCC54DBA2D3EE6F3994CEBF9799C95E594AEAEC7E6A8428A487EC4107E98BD25C1EA224DA222CD7E23373FB46C42B9A9FCFB6176BE8DCBD1394BC8B6C882F887D9E5F6268EC25FC9B7ABF43349CE926D1CF3B5A5F5A57942024DA2F5D890ACF8F681DCB2365CA659719BC651FA66359F2D4480858CD07E0F7D5C37F84D523C7D329FBDA3D5096E62D2B2C7420B7415153169202893D1A9339F5D040F6F497257DC9FCDE9BFF3D9EBE881AC9A1406FB3189E84CA31F51F63552596E6F8A6908D1B1A6A3773215A12753117A3A15A11FA722F4CC3FA177C197E8AE9203D87499CF3E90B82A91DF479B5AD436B2E09A2BF53A4BD71FD2B813355DE6F532DD6661C9CA2956E22AC8EE482156EF74D14931AD6CE36AD15BBAB5183B946F7DC49A599A719DB1A44D2255470405595D064541B2A4C42055979AD8F06D90DC6D83BBF165D22FE99A4C23664B4A54D44E43ECB7FBA8206FD3BB74744A3FC741F879124A4B927D8942928F4EE88AE45487A4D3922A73938C164770B2C5F8920E1B9D60F9342DACC4F0846B4AAB830E5F519AF5025F519A35C7B672745352042156BD3617AE2090AD54112AE35AC92B92ADF3F7B76CD28135158BC0D5C5CA2875460BBA57BC9D4C70077305B03A0305800A43A5A0DA5A6B171C63F4D62E5A8CC7DDD3F7B57B7AB50EA2787C41BD5A65241F7F8DBDBC4F13F26EBBBE21D9DE6C357A485E79BBA193CEBD44822C867BCB0511E851384C32675FD2CDCFC7CDAADC0235B4CAA4AB684D9C6BFC92E461166DEA43BB3D993183340079EE1855859E13A85DA6DD670FF7F1E3661DA7B5A61B09FAD5FDE8F3E93C8E6895CAFF2722F53E0CB79B609C39A7E8AD0F23EC90BCC9CFDE12A297B2ADCA069D4ADE53D95E6F82E4DB2055BB4278940C282D4F33D571A5A4FD43329284131C6B4CA42D33B5721AADFC507732A884FA2DCD3ED31909CAA73AEFBA15069D60127394EDBF943D68DF5F630D904435C0A3204269BD8EB2DC97DEE0288D96DB2C9942617917859F272174957E1D5F1BA23FBF445388F0F38A7B4697DFDBA4C87CD07164BECB342FCEE9E70723D31DDB7791DE445EF6F18E74A9245A8D717225372F4A96411C749CD3EFB08356C6070C5BEB14B96DD65D32AABC94DB7BBA3615F7F9C05A7C9A64ABF9295A91741C4A1AC310D34286282AF2D609D1636CEBB4FC1CC58821A546AE0A5C372A8C5C2D3E17D1A184221EF4A80A6FB03255A1EC50A3AA6BA1EA5560E1AAB27D74B08ECA9029D9921F0CF2967C21536E0D18AF00CC5D7365C3FD1D5BF3E90A430B99AE86CB660AF99869B010002763AF9936748EED7A76EDFB7EC59779A2F7A99E46EC5BCD0C9901C169D3DB48DEE81303EDE40DCC2323EE9C1115BDDE5551B4E69F6AA77245D61BCAD8430CAA02CE2307A1B4847E2A891E82E176B9BD29077D7CEFC97435FEE9C378CEB4E8F2F129C8A27250310FAC9A1B9A52D7D29CE4AD43BA92804F96B6F8A0CD858C3DC81743847A941E3B9EEE029BF8338D4A6C3DE64C500DA65613A7D74CB820AB2818C0FED5F78F3C8FD2AAFAE76336BEB3DFEB2826933853944E4FE719F1E307D5DBA7CA9AC1DFA545741B85CCEFA3379FF3308FEC8ED2FA980F3F81E2F5CAF10C5F93AC451724CFA7B8F9E4734EBEC93F50EE6E607E4EE91214243D505E929870F5E90FF481AC23DE42D317691CDB19AA30945301D4137851725D97EA54032553D106D412831480179B4DCCD0EABA588B48F152FD9104F42824515A360E0C27C7C7639CC5BC0DBC513610E20FFF7FFE56B857F5EF6994BCAC14E78102AD6C335DCEE9A4F1211D93202CA22F64B0589BCCCF76B9DD6CD28CF2E964F7704DFE034F9EFDC91795F334B98DB2F5F065E632C8F3AF69B6FA25C8271812126E332A289645B0DE1CF6F51C9C96B7A1B9FA9ABEA6932ECD5E25E55783F1DEA6E1E7745BBC4A56D5F6A30855A16009E0A53A2FC2906A89AF29339355E55B344C7B2ED75E8384B79D7FBDCF4ACEE3205A231776452DE1BA29CADDDA054BA8C120E062AE2E116FD3BB28B1AB6A5314AF6A5DC2585556CCB5AA25985D4D5949BCA25501633DEB523EB5CB6A90BCA99815DAA39EA915054337E3551F4FB223AF287D0AE2AD6F527D99B59AA6DE98B542DB21B356F42B4FDC6A2B6DE188D414A6F056E51B76739D1252CDF08DC9939F4671ABE59B393571F729DA979B4B61EE8D994BB01DF232CC6960D1B2A67D98D287EC6C68FB3140D503685EFDCB72D77561540168CB987480AEA02F35C01B1FEE9807F77DF1F77BEA912FBFE52F56EB2819BADB29476DD4DBEFF24D9A1D6F852E49B68EF2922561D5BDCB57B576394F7191500AB8BAA99653DCB8A5A8A63F2B094A94AE804E9C70A58685ED6B1BDD5F8C74188F1204A5557955A671ECE5D8C8F950C4937470A51BC7E9D717713C54CCD989B8677ECEF87B9C1838891D7952A37269B081BEB5977AB1D333345F537CF67390133696B21D6F6E583E5FFC2378908CC1430CA2AB28A38DF706F829225F7B8139397A53A973E936B892D4E6401EC5364A8B4A83699C1BD8708C6F53A0E36DBAA788EB5F15C72101C218335DD785C4E8607C1E181A4C28E07A965B7E84878CB4AE17142C12AC78AF49FB36BD1B2089E9D78FB314A5E5C5B27D759F71AE3AE3F99C8F73914F3D06BC9BE21AF6442E59AF1ECAC72AFC6F71B1D9FB22CFD330AA789393CF720844B1CAAF92D5CC221E62A7F270414D2FE8C48DCACD1DADCBD9FCF8E8E844E9113D7C2BBB3A782EA89408AF62B3B840E5231D149CEA08419414AA58889230DA04B1B91AD2A79632A51C8E96889CF3926CCAC8024961EE631BEA9A588B65355A6A92D03375D4E982E31C3D43A11102B16137870BECC65E0E8EE9C45FE6C8C4D33199A92E13709AA9DF0F85DDA07073380B6863CFF18CC605911439E00F5A16D30692B6E22FB917DF27B593ECAC3EEEA02222C8C360A5AE2D54E6AFBCB0A6A60D93F0A5668C0E8329D580F318C368DE33E998A58D6DEF24EE3481EDA793736825266024B46F0F8389A4F82FD83063C160BA316EE247D88B312C121EAFE3B1A834162CD98B71E02A4CC035707FDA10E6A225ED846184300DD8D0C2311BBA8165713E465C9490BA004C2644F731716F2F2E837A63021E831A6E431689FA33A9401262D2E805081CA0A6E7F86AC151E6D93FF50AAFFD64C20D1A171BE29A0855D3A8FADAABD3B84E6E778F9A57FEE58BFF2E3B00BBF8051D35E902F8BEF1AB5D8326D917D88CA34D4594CBFFBBD924C04EEEA83A6FF078E7B60BF265BD49167383AB3D5E3FE6EE3DCAFAAEEFB429F620DA5EB1A900EAC6B80B1E65B71B6C7940BEEAB06F3C2ADDB1C0EBC7BCBC27E151B1D376C0A362AFEC3D8F2A5E2AD8E8E32E2BDC7908E73766BFE8E33E782047D5DEAD5AF87E739473C2B3980290479E757DC79FA1802B203E412DBAD4C3FC547B6CDAE9A976890D7DD8BB7D372B48E7776E29A30127F4814C6041CA7DFAEE5E4F373566FA854419BA436356C37A62B82FB96FCA8ECDCA349D28557B6C079A8ED0257BAFE8A82161B0A1D7C487413C531DA4261E5A66472CDF8B15D1564CC086E8F0EC3D0B2A7E871893E0CE91A29F50EBEE6BCF7FB87FA315B43F13155691093808EB5E1BD28DA7EC040C543BA1552E4D51423275957D7953B5A47C07517121A58CCEBC4873E6E226734409BE248568749FCF3AD737D97EAEF09488D0DA7C2110CE526E80E1FCDF14142ECF8022BB3A29507201231EFF4A3A80C639BC181B581A3A2302379019860D18ED136D0A4263B8B1026882D22328CCB664804241EC3EE703CB6363DEC5AF37800967D3109A642E308EBA78680E0FBD6CEE308056E14A21241627D6F039BFFC4128A262620063570ED5392F2B20061CE850DA02971D5EBB813731624CE0ECD4D10D9CDDD43261D75ABE01DA02CB0A47B8DFAA4A56EECCCD0454DF8800A758BBDE9B66FBB7BC206BDAB71050759B4102E0163740C8F38FDC722565798FF98229AA0DE660DD364358609445DCCE9D9A03E3173D59D5165B6ED12BF8F3E06AD7D8390A0B4D32BA0A73EDD22F8F76B0E37717F85632D457462F57A9453A3F57A19778AD40DB473ACFD6B13A4875A4043AC7E06D291E8AA0FE965C13107DD10034765FC8EFC1A91DA1F318142A8FF80C72356FD5334D17205E8282A06A15C5C1CD171F21521B8F7BBF099506FDDFB82A370434ED06DDD694BE83817A8FBBF8141836F6B873163072A07B96653B4C7068B7F8119BFA371420F969EF3A24893D2BE72141A22A1AB756AC5AB90B71F8F20661B88C45822D0282D6C263457B042DF9AC70AD626ABC4EE0EAFD4B78F10DABF2DE3BAA51E3CD1D05B94D681B27394E0CEA28C9C901EFA8A63D833B4A8D1BA17691DE6A2F3408B5DBF32B2DBFC3D0740E6AA9E7B0589D7DF20B6798D7B30B66C1C74618B0E19B5A620165E69511FA480A4B669C558829D9CD98ECD84237F3F1B83CC50771358B20D324D31B3307092074A28DC453C0D3096AFF188C6996E634AE31D2A996A67F70039AA99B7B74861A29023EA4C0AD3A76761D5E16D7873486A309D0846342D1744073E5BDB536B479A78B65784FD6014B385DD022E5B5FB6D10D7E1289A8C8B60B38992BBBCFB92A5CC969B202CEBFDC7E57CF6B08E93FC6C7E5F149BE78B455E41E747EB28CCD23CBD2D8EC274BD0856E9E2C9F1F19F1727278B758DB10885E927DB465A4A459AD1964BB9F5BB24D593102F8322B809CAFBFFE7ABB5520CB4AD20E7610D49D17CA28E5A7344D6942FFFAFBF3184618411BB6E7D4D5BBA2E8D5A55980C6003AE7C49BF5D86E5C3F672A414FEB6DE791A6FD789C5353E1C8FC5C6E19158923DC6727B53A8305DAA0312A96CE22712529BEA8CF404445202E658203D05919EF640FA1144FAB107D23310E9198474BA905851B1892AECAF782388B3C96AAE71E742FEA61B7AFC6531E134DF629D2DCF34B709D63D33C26374A9F648BFA46B024C572ED90D8B4E5004AECBB147FCED3E2A08DD58A5221C976C8FF5731C849F552C2ED965AA5467DDB93C559A540751D91D0C435253C9ED850CCB52B0803DFE25EDB752C900AA2D65D963562B9788C592F646F874D6237FB207C5B4903D9A6FFF3D977BF632120FC3921CF870B5CA482E4DEF36D1618EF0CF02093DCD67EC0D6F4B463F7F0CAE07B6E07213C021B1BAF0202B8F246438E0F17170053C3E638F988CB399FA64B1CE03AB0F7F69BE1E4787E35EA71340BA647BACF338A2AD2AFF17C1F87457B4F761B8DD042A57A9B92E3AC943212B210FE0EAEE7B42EF4C5B684CB83EB505D0406DA52B205F8EC3E12A3FBA7222739D0D25182E79FA359D295CD2A468121D7503402B184BD7D9D10C68ECD6FEF81FB6CF5BB03FF6E138DCCFBD40CB8370C92EDA719628486DA2C38C8CC2CF2A5097EA20C9D3AFD2BA50A738F07FF9269432B5BB5487191995B18085E918A9D181B508E59B90990CD224BAAC4E79513F812D2E4D4DEAB4BB988BF42692B5D526CD1EE56FA47E189C4769D21CEA1225CB3259EA632ED9012B7800B1BA6497916FA38E89638F0623D361759EEA17F4FFFB5C5D24E47C07F44FAAB2D8A4D9A37C8A56245581B8E43D5B395097B461CB477D37A1EF1A827C8D1E63B6919F84534C341E148ED486301316022CAE990187C51C57A058FADE30827716E83BF88EC33E4C7F70396AD8E159687775C7EF79687BE5A7DF9128FEF9EE470B5FAFD535035F277634E69203A5BF41D7FA945A8CBAE1FB71865D205AB61450D9C4ECC98FD5CBBE564ED5EB4407E359BA92B4AD3A654C93E5CECE27650F649F8794D25DC13E27952688FD15704AE44074AEECD5211EBBB0E98F0DEA8B9EEE638F7C37CE8057C43E669282D8A5BA9C84C4043A086952DD4C27E719814D276DC6F8A6981D31A2E824E9C28F6FF2F2FFF7B7BFD333264FE0F73D18147FAE4F370AC3F8B489E8C12360513E701475EDDEC572DD3E9C244E3996B8BB7952BE8718C8A3C4D25C50EA20350A509BEC56A375A49E4CF1E92E2737F2991D765E3774E60F5A37A0673C0F63924AAF738A232664B9B180F448A7CC0952B60BB6F05EA7882B6481987407BA8AAAC03F9F82784B90075885891995B67ACAB9011DADBD66BCFDE3386D6F4FDCCD3D5776ECCE526FE771297E87FB981911F6DF6AF63680A0BA540724F5A4143D24C530FE9E4649FD22250FD3A5BAB5EB225D511697975231C741DC254158445F6449D7A6EEC6AB65B9DD6CD28C2A06F0D901903DAD7DADFA800A9FDB285BCB2321E7B9F8D5E6F9D7345BFD12E452278A394E8EFDDBAC9CD745B0DE28DEFD7CD6F89E8D1678488FC2251CF4F3AFE96BCACF69F62A29CF4D247435D7613EA6E1E7745BBC4A56D5B6B108A549A966F7C006EA2CE739F8C2842155425E531625ABCACC2D79C5A8D96EFB3155EA76A97BB3E6C217DD475B83EB585783176204669FF7D65595D50D3697EC8855A97900184BDF570E43E31878E2B03AE0D9600E43607009458B576E3BCA665CCA72F40DA2DFFC4A24AB839031161FEF07B76057CE3D310B74F5DF9D57609471C54913E35CF00845E29EEF6C30471CBDE123E7366A43AF2A7ADFACE4CB6FF98BD53A92F6F67CBA1B37A1372894CC319C9F77758B968BF9E28F4F3BD43EF768351F8FC39D95AB481AC7F2CAC5A7BBA8D52A0B35690E28719C7E7D114BBBD32EF5BBBD1954C7ACF0C78B7C58537766D47E3D0E37BE0BBE0056A42ED58DAF89BCAD6B135D0E23EE94B5168B80BE33BEE142D2FA639E3294AD3BD3805F8DC32CEA59A2EB39E2D57DA658F59AB469CF4669B7DD019B873B471F734FD6D3570F657C1B456872C9D3B3BE18B8075BC99B8056EEAB75F325BE241BF4C7323E912C3C90C8736AE7594D0F0E0E7E8081AB418FCAA1CF4F58554EEA1DC71ACA8199541650E233C9455A066429EDEF363E138B8D24046DAA9A578660AA9A95B3384D72B0A4BAC87CD6ECBE1B917B5416385AFE33AEEF8476052E8224BA257971957E26C9D9FCC9F1C993F9EC451C05791D338B85817A2EBF5A611517EAE46919178AACD60BF973F7E852254A9EAF04A76E6ED168343228A0D2E9AF4461B36670B9E742F06BA9A70B19E154E651FEE33ACC7A94408F7DBC4956E4E16CFEDFD577CF676FFEEB9AFBF487D9FB8C8EC9F3D9F1EC5FF3D9BB6D1C97E7C567F3DB20CED578EFB0574B4D3CF91264E17D90FD6E1D3CFC9E87AADE17312075B11C7C80B5D19BFC813DF109F6D427D88F3EC19EF500E3572FED4C412221D9CD953E53449A19D5F255AD79A58BD3655014244BCA52A4AAA933FB77A6450F03C00555F284D6C554F200C84555F280C6C555F2C2BB4D68250F606A5425BFA05E259D144BC903228BA8349E104042123D2E983B5C309973830FF6694226F8606EDE59603C86D4450F7AE44AB721133CE36BBCF207957DC4B956C231E498C38F04F73958B58473A7F230A47C94206F707C80202FCBEB439F356B0F26A3C3B20944E7395816B562272B242EDACF9E2D5F6DD41F5F4BE14E977A6B4685E2E81C2C9F729EC53E98B50DCAE36120BBB83C3E0468159EC707A3B6117A7CCCA06AC8BC4C4516ACC7C72076017B269B8E56F56A82F7F8C06A42F878682117C4879BA8AE6DEBA2F7F407E1C2F6B82DEDED87D8C26EBB1CC8F17D06B4E59337058F8BEE33F6AA008448B15B1AF06838406124E28D7931E9A8B8F147F3DDA04D585B6B37DAECB3E1A49959763C16E83DF87BA817D8ED9887E9FB58989A7FBF4E83D63A37016ADDED9A383107DBEF409C99FE0B8FD713CC3AD08C0F7B42156FC603D000938EC389932E48CBC1B2993FCE5082BDB82D89D2E7639CC600B1560E76DCBAA02D1E86AE8BDBE2E934B98D4731F434B9F7C9B43553E017D90F96379AFB176E13B0FE6A9849825BA6869D6C78934AADAFE09E7176136AA586B989DCD7742EC6CA10902EB64A7F146F072B52E010B04676384AA0900158427090DE38529C0AB1B7E6B38BE0E12D49EE8AFBB3F9C9939F7C49376DC887831570E801AFD88DC7C73D9C83DC81AD34547E9F5E44C9B73E5A7C175862A0F011AF690D95646D48890162C8ABF113882231D6A1AFC0174F9EFDA9172817FBA07F178A9124BCF86709712476EE1AA2C5F3D2856AC088FE584084087C9E594910293244FFAA01A120FA9F2C744120E4896152399B2FABE41F666FF28F49F4CF2DCDB8A2BD512A9FF8CCF2B82202B1170E7659DC99DECF857DF0E26CD2C57D18EF3C078C90A0E9AF7FF5611243B404C82B4D170D01280FDFB537B3A254B341DA2862506E5AE1197B222EEFCB48D5452ADF7C844554008AC26113CC0CB133E1D154D88D70FDD5C8E3A95E8A3BD8B5C1AFCACF8565E8AF872891187CF8D7F45245CA9AEC4015B94462231C2C93F121167C180C9B400B5EB0DA600BFD3956C3AD028F3C331D3C381994C1880507CB235DE8032F2E622CFC818FDD248B81E0B60ED55FD9BB18598FBC1276E06047DCCB915513C4C087B5B8A7CF0CA844DFF972B8F368A7E0A21A8CB77FBAB48B22607917C7100740FDC27C39DFE2128F48D571E2F31F0F5280A1A6B8D54545F0A01873E10B38695B5D02BCC6EE04BF4A569532C5DF1A666D2963041C71A917DBB888CA6A53D27423A8745207D5DD3DE4A1B85411EAF8E8484563170E8A28284F5BF3220B22359EC765162561B40962A50D52494BC95BF66D8B29E7BC249BD25D37299456DA10D33E8D7DBA68C1A51961EA062168859E19C40B78D3728474F98FC793B3BE0BDED05D76DC630669AFE88DC11D7293DE27B5397C566F1AE8840AF230505FFCA822B6E08CD55D2B14B98A4B176BF28783E427E4F6E4DE32130BD732AD986962C4F0406DDA772158C028387BCB04B5C7FE357CA992D717EA7C515B606916C3D621B15B713C5093348A10005B36CEC84317FE104A9A87B32719F6EA0AC235F462303754F53D057EA458CA24EB067F5146E516B0269E58067BF7782486B12787BE603DA1A8A83907BCDBDA63927F77BCE3200326661ECDCDB1695457D1D7FF5A77C1A41B49B1143F9652CE44BAAC7461415468E5CC5138CCF400F4089AADF1355E95A6F199DA69545CD18E7C0D3D5EC22BA79267A7A0A4CA7993301CE859A3A9162B300AE3991F4BF3AF4BDBBD0DE360DCDF05D7410F9A1C12D7313F1EBC5AACC077CA75D87B317BC67597366184F94D7D67291776F55CF224CC861B3DE06A29A5C6393BD23DD0E09DE32C0D3F087193A56727DC07C58986458C32D68611FEB7E2C33EFCB05366B48BF03DED2A5C5504783B76AFF911F481C4D7E0EF8B07ED5EE1B2F5D4DC8DDE57711D60BD7F64BA47A61B6FB301BCA876487B8DFDE0B81DED34AC396EA71B0DFE76FF357003769FB94D7CF29EAB8E98F1BDF0171E88611F198B73CCBD06BC7345EFA5C68357F65F6AD39DAC92DC97F5C32B76A8DE6C94BA17D846718BE21B6BB5C7445E331B81315E892FF8B4CC21BDB6A370077B8C49F46E98CF3A4F3CD9DDA07EAF87F778AE1DFADA020ABB88243807088508978791E18A1808717E790A212E0F23C4153110923DBD146A72018CA45CCE4897F305028872B93845AE90B13F99E702D09B2CA721535BCD72AE2F59010389C6DCA950683230024DBE153EB364224458AE9E122B642087113290B0031722FCC11CDE65E303C3973250946C870A4929BFA159257724A552461E97CD8300A3CB4510CA6A4103F13A4C974A91A563938A651BC045DD49A1216637A45637692770F3CD3B525497D7B9B26671A5E890AAAC974BE8C93B9364F636135D564C4F9C19271D6BC06C2FA61AB062FA1A304395630DEA2D99A90275293D7DF6B8A23D79336913593B92BC51445DEAB94C88109F6F21095B551314846D2E44892B606E5379194AA551A536D8D55BB10D789563DD4FE641D294D5F7A2545C6DA9F848A4E6A2C58C2B29AB53985BAC68339035C0FA31504CB153B61C8252D73EA70CEB6AD2DB97164D46AF1300EDB6BB7AE0ADF1B0A259011854C73EDD0039CD837D60F4AEF7D8018AC6CB5A8FABB1EE4D575DBC81661BFCC0BD3559DA91555F625B2DF7A64A8ECC403B75AECED2CC14B6076C5E827ABFF09DA8F3579F21DABC7BF304875DA071B843AF5045418FAF6A08AAE840B3D42F75FB87BEE3277897A26388FBA0F61B8F1D34D7E00E094A277B074AA141E066A76A92760323892B78F3C264966137D24370C18E7B90F4B270F1D31F4AF3E248CED38933CD4E00026305BC774DA3B49BBB06F2439BA26B842D0A04C60A0CEE1ACC050AE81B2B6F2971E953F600D2CBEFDA2E316AC68667E447E81CE6A163D339F0A3EF3A4B363CD85053F6AC9B60B711FDECC2FC4B46E922CDEE1B9A5BFEBB45F46D30CB1DC40FE2FBED1C6683B790C880B17E0A813C51B7A88662A04B0CD6E451BA033AB0AC40C48CC11DA01834910307DCE8899B3DA5338336DD70E2201839ED30340D6FE25CB4C6BA36EF74511FE2B004FAB348330A7E91AE489C57A9A78B0FDBA40C5C53FF7A49F2E8AE8338A598090905E3605BE64D729B36364AA9464D1125164C11AC82227891D1110EC2826697115BA3E46E3EABE26296DAF00D59BD49DE6F8BCDB6A04D26EB9B58D8F095B64E1DFDD38552E7D3F755D098DC47136835A332D6CFFBE4E76D14AFDA7ABF06E28F2010A5119545212AC7B228A311DD7D6B91DE556F6BDA00B1EE6B6DBFCD16207F9F2C83326EB57BDDE8AC7D4BEE82F05B17411303310F84D8EDA72FA3E02E0BD639C3E8BEA73F290FAFD60F7FF97F71539DE35C720100, N'6.4.4')
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'202102251911292_UserSpecificData', N'MyHealthCare.Models.ApplicationDbContext', 0x1F8B0800000000000400ED5DDD72DCBA91BEDFAA7D87A9B94A528E46928F53272E2929D996739423592A8FACB3772A8A8424C61C7242726CA9B6F2647BB18FB4AFB0200992F86BFC902039E3A874A301C00F40A3BBD1001A8DFFFB9FFF3DFAEBD32A9A7D43691626F1F1FC606F7F3E43B19F0461FC703CDFE4F77FFC79FED7BFFCE77F1C9D06ABA7D94D5DEE75510E7F1967C7F3C73C5FBF5D2C32FF11ADBC6C6F15FA699225F7F99E9FAC165E902C0EF7F7FFBC383858200C31C758B3D9D1E74D9C872B54FEC03FDF27B18FD6F9C68B2E9200451949C739CB1275F6C95BA16CEDF9E878FE3714A334F4AFD2E41FC8CFF7CEE2FBD4CBF274E3E79B14CD672751E8E1462D51743F9F79719CE45E8E9BFCF64B8696799AC40FCB354EF0A2EBE735C2E5EEBD2843A42B6FDBE2A6BDDA3F2C7AB5683FACA1FC4D96272B4BC083D7844C0BFEF34EC49E3764C4843CC504CF9F8B5E97C43C9E9FDC259BFC4B369FF175BD7D1FA5453981D4D5D8EC954821CAF608C2ABD939F2828B240EF324FD0DDDBD6AD8047353F1F76AF67E1315A3731CA34D9E7AD1ABD9D5E62E0AFD5FD1F375F215C5C7F1268AE8D6E2F6E23C260127E176AC519A3F7F46F7A40F57499ADF2751989C05F3D9820558F008CDF7B28FAB0E9FC5F9EBC3F9EC136E8E7717A1863D164AA0EB308F500D81990C8BCE7C76E13D9DA3F8217F3C9EE37FE7B38FE1130AEA1402FB250EB1A4E18F30FB6A6B596EEEF2712AC2638D47EF60AC8A0EC7AAE8F55815FD3456456FDC57F4C9FB163E947A001297F9EC338ACA12D963B8AE546DAD0B6EA9521FD364F539895A55D366DE2E934DEA17AC9C4025AEBDF401E56CF38E16AD1653EA36AA159DB55B8331A17EEBA2D6F4DA8C22C61277099584F072145C79798ED2B8C0402549756C78EEC50F1BEF61789DF44BB242E3A8D9A226AC6AC7A9ECB7C73047E7C94332784DEF22CFFF3A4A4D4B947E0B7D940D5ED135CAB00D89C5121B73A38C1655E16893F1151E362C60D9383D2CD5F088734A6383F69F51EAF9029E51EA39C7B4717851927B3ED4BC2657DE4049B6D0445919DB465EA374955DDE13A193B6942D226F2E5446683358D0BEE18D30C9094C1580DA2C292069B0AC94ACB5C6D605C5189DAD8B06E365F5F463AD9E4E575E180DAFA8832045D9F073ECD56312A34F9BD51D4AB766A9D141F3F2CB0D9576EEA4127835DC592FB0402FCA611499FD80173F5FD641B104AAEB2A92AEC315B26EF10794F969B8AE36EDB644627A5900BCEC684D858E02D44CD3F6D2437DFCB25887EB5AE18504FEEA7170797A1F85B849C5FF235575E9FB9BB5378CCC0976EBD3002B2467FAB3B386E8646C8BBA4165927734B6576B2F7EEE656A97082F9A01ACCB91A45ACE94983E2845B13FC2B6C648D632312BC7B1CA777525036AA8DF92F42B9648A97EAAF26E1B65D02A26364758FE73D9BDD6FD15560F4D5401BC2822B0AE8F619AB9B21B2CB5D17293C663182C9F42FFEB28155D27DF87B786F0CF6FE1182AFC7DC93D83EBEF4D9CA72EEAB164BEAB24CBDFE3CF7746A75BF6EF22B90B9DACE32DEBC59A281862E78AEF5E182FBDC86B39A7DB66076E8C0B1832D7097A5B6FBBA4D8782996F7786ECA1FB39EADB81965A97913062819A5A62F194ADD2DC71A4BA68FB1C32FBF005BC8B44DCBAF61041CC654C86581DBDA0CE29B45E702761853C4F6C4A8180015BDAA7C8158453244A932AFD7F294EA576FC3B04499D03AAC5A21DA88D2C26563BBD8936D2D7DD44B537D6F9073F40D8DB9CC21BC22E1E34A3A6A296C19994E17048BC9B415A95A945D48BC5CC4A44AA193A4F595B1A9A56BDBD75EAE8E5A3A4F898AE9C748327806948A4D27D63B59AF3107948DAA2619632664BDD3F738A0176E04EB32D90938D8DF1F62D170EE39AB5953113DF3BC7BCEED9BFAF7248C8B93CADEA796459FB1C20CEF430747A067315E4784DF9A56BD4BB03C7AB13DCE680756CBCD7A9DA4984F477368D52DC40FDFFCC9552D7865771FA6AB7660BB8EC7959765DF9334F8C5CB461812E46F52AC2896B9B75AEFB69F0B5C97B3A1B9FE9E7CC44297A4A771F1556FBCF3C4FF9A6CF2D338287D23725F540A86004E9A73E2FB28CB3E62664641B949D7CFEE2FE65E8D863795BFEE1B009117AE00CF57D64AB8AD8B52EEAFD212E2AD0A7931DB7D81F3E4218CCD9A5A17859B5A95D0369514B36D6A0166D65252126E685940DBCEAA944BEBB21C2467266689F662672A5541DF6D8492C605C008DE2EB8A61B2FDAB8AEAA2BB39662EA8C594BB40999B5ACBF3CD22A4F0D0C76C1EAC218DEA87CCD6EB622C1B50C5E981CFE3CC8F914DDCDB12BB717D1AEDC5C287367CC5C804DC8CB724E93162D5ADA85295DE8CEBA6E37A72AD500EA67FFA2DC6D551834009A323A1BA02DE8CA0C70C68713F3E0B64FFE6E773DB2E5737612ACC2B8EF6AA718B541DDC8EDDCFF065F0A5DA1741566054BCA4DF7365FB4DAF93CE17C4428D0E5D851BBA428C59F94946A94B6804A9D50A5FADD7F6F3ADD5D8DB4182F1A04ACABF49A48A2C8C9B691F5A68823ED605B6F1425DF4FA2A8AF9A3353716FDCECF177D831B0523BBC50837AA9F38DD3DA39A7E7A5D31AE645A8C1BAC63A09159CE46CBDAE8CF9A73C07B846AB75541E1675662006E78583C0BA183AD13B43DB7C0B72B9B92B067DF850244930BC2BEF700779E04C72E3A56131A85038838A1BEA52B79C4CD257AD542525010E94C57BDD78E0B17B5D6C66A15EB4C7C4E2CEB089BB2D188EAD879404F1F6A191E07492840B14845E0FF62FBF7FE179B0AE923E5FD2E123677C0C23E4E88691667983E9F03E456E820A740E5060CCE09F923CBC27DB103DF89C86796177B02E175BE7A39C388E33175DA02C1BC3EBCAA54C9E659F3177F7F671CB3EA008E5FD5D648AE6AC42FABA5357A4612EA2D95FEBA0558970B943C814AC01B1442F0380866BD8D5899A2468AEB4E5EC9D9721327A3C19E71A163AF987F7C4C9621F7E0CC21477DE19E04D88BE7702B3DA67C30AFCCA6E70B98D730AE4650604EBC2FA609CB9850CC7F06E9D78BC75772EE123B092E380606784996EAB426CA4333A4F1AE68C2960EB4E577C0487BF346E972CF0A5B4E19D84F63C79E8A189F1D72F520AD6E5E472C1F5634A594AC36DF90D73914FF4C47A18E34AF94816F1E953F1F0867B2F03487A4FB22CF1C3923729FDCC8773649B7C1A073383D88EADC9430568BDC0821B16E7EBB82DC7F3FDBDBD0381226AF84677B5F054802C165EC426318E8A07473038B611BC30CE45B510C67EB8F6227D33B84F0D754A311C4D257CCE07B42EA224C4B99EC626B52BE24616CD686AE3949E8E50470B8A73D40C05463B84865D1FFAB01D7B3ED0A7157FE9A32C8FC764BAB68CC0693ABAEF0ABBC942E7C12CA08CA347331A151093E5803F28594C1914DB88BF782A5EC6D51EC5ACF238C12AC2CB7C2F10E716ACF30327ACA9E8C3287CA918A3DD604A31783EC4308AB7595A6669E2F45BA93B4590FEF1F41CD888111809A4ED6E30111787061A6628284D3BC675FC0873350645F5A36D3C121DC780253B318EBC0923708D9C9E261553919F266118264C0334B4F2980DEDC092381F034E4A405B244CC644F7D1716F272E935163041E9375DCA45A20EACFA80A898949A35620F200351DC757090E32CFF6995770EB47536EB27131A95C11A16A14AB4A7E311BB47F34B7B429FB8A0F30338AF6D35C0F87DB47AE280FA210D5441BC3685352C5A401E0D5BB297894DCC837E501FE7AFEB6F1281717006E1FB9993C0A8FB2449B804759AA6C3D8F0A372BA0D187AF59500B48EAAE93F9140EDF1B93725475235309DF4D46A98B63062220BB4566DCDEE12554727D0D165003923A904F9162E38AA7481293FAE537B2A79941DABBD2863A5A7271BA27131854652FBED31BE2BACE8C3F910843B76BCCAA994F34317EB6CDD8319999C653A522C526B07418926CBDA14347A6D66C75B23E8C0EF64E1997C78958BBCFC62BDDFEF1765DE961D87AF6D2DCA48118C4F45A0D7D18C9DF03B3399134BBCED6D6C6DD07DA36FE34EBD0082C6B368E260D11EE824DC2CEA2C337C4530AEF6FC0F1D9826161C7F15DD2A2602F46604C7078B65EA30A6EAD1093C0BEB7AC1B5AE34D6ECE7FB0FBAC11B4BB1350A821237010445E93AA6B47EC1118A8F2712C3DE6C218A5E29AE4C35DD993E2C950C14319333A7152CE880725CF1105F812E5AC4FC77CD67A56F2EE19024FB1088D4B810C8472C4D0C050EE95020A95A741E13DE90428BE8016AFF1DA91358CF1A7D276B038470F91BC83C4EF4083D1BC662820D416BD1140FDE60180428E2E35502088D9E724AE95C876FC1CA8C1919D2219E092D3263BF03A10B10E9C1C13D8819370403AEC6A59AE8136C032C26182A889C24D6D921B48771D240892F0361691068C312C65689CADAF9571D6E2950B3ABF56D1809657CF6548E4CEBFE673DAD891A1B066A86E14AB0B3752A237F3BD4EDA9FB31CAD3063CB80CACB321C0035B949943CFD1E345592D7F790ABA160DA40FEFB4D3798094698C4CDBCF529307AD2E34D6DB6E70654017DCB25A431F343E7D6CA1A4F74AA5FEAE9D10C767872499F1597D14AEB44CDF548E546CD5089B60A943452394E0F4520D14F57421C8D332FBB850CBAF3525D00EC450DD0D0B4E09F3D1409A17248956D81F22EA954CB1BF34C4102C0099551548DA1D8BBFBEC1B5762E761E74AA6D152F74AAAC975058A7E4BBD2205DAC9813A8F3BFBD21C34F6B0EF9F64E4A4DE7F86FDD0C1816471A21580074024AAC1C0234D79C4C4F9A451DD2156BF4A45A8FDC7688523B7FC9D13AAB6FAF58492B945293BC73946F52214E7C40413AAEE4F6F4289B14C4512A9BD72980E817E39F4DC402F4814C4013D71282CD26697FC4239DEA8D905F2D0814658E2A3A3EB8901949E5706A011172A5F2B5580AB884A16446711CB1E9A818FC353F4C3427A15A41332B5B3422F05040ADA403CC5BCD00CDA75E2910F78AEDDCFA2630E757484ECB4EC51473894AD7FCC4F72BB9CE5322B22610F45B92C323ABDA5F0F92D9FDED494C4811209A8393B343C3DA4BAC16DEB2848049F170EC05A62DC15F99E0C7C8865768C454FE4D59E946627467A62A5435110A00E20D11CAE3479478BA5FF88561E49385AE02245108B8D1755C15DEA8C0B6FBD0EE387ACFD92A4CC966BCF2FDAFDC7E57CF6B48AE2EC78FE98E7EBB78B455642677BABD04F932CB9CFF7FC64B5F0826471B8BFFFE7C5C1C16255612C7C4677F347414D4D7992E29E73B95590B5F28DDB0F5EEEDD7945348DF7C14A28263D4A02B6FFEA2AD9D32271D4EA1DC1BA7CF17FF58DE65D1939624BD68FB8A7ABE20CAF0C3A23D96F10BEC4DF2E7D2FF2523EEE107DF7F57D126D56B1C1A558188F449AA291489239C67273978B306DAA05122A5D000E38A426D51AE9508A24849F32407A2D457ADD01E92729D24F1D90DE4891DEC8908E161C2B0A47C002FB73FA8897262359A3B6C1DC891BB8DB6720708A6F2162F3926627606DB8751AA34D3547FA25592189B852C97658584001B836C71CF1B7C7304778559EB07054B239D6BBC8F3BF8A5854B28DA8945BFB192F2A75AA85AA6CF7C1655A53C8ED842CD7A5D202E6F857986E859121693697658E59CE5C2C1649DA1AE5D31E96B9D33D20A681EE517CFBEF39DD93A7DE69189264C1874190A28C13EF26D14246E877CE194AD3195BC3DBDC19A73B0657031B70B90E6097589D892E4F2331191678F4C35E0C1E9DB1454C461D11BB64B1D6E1AC0B7F29BE1EC6863B5BE129F2CACB1F399036D91CEB7D14E25E15FFB36074BA2DDAA5EF6FD69EC85562AE8D4DF294F346C8937476772DD093590BF589B54B6B417A1E6F642B005F0EC3E1223FDA7222F114F639182A79FC399D185C9C50D48996B681C42A18CAD6994802EA730277FC2F774730607FE8C361B8BFDC6E1445804AB6B18ED358406A122D2432F4BF8A406DAA85264FBE73F3429562C1FFC523F78268B7A91612191691B519710CC558DB4A846413E7290F5227DACC4E595EBDE7C14E4D75EAB8AB988BE42EE4ADD53ACD1CE56FA87AE58446A9D32CDA12C6CB2299A331956C81E53D49B1DA649B916F62F8B1630F86F65361B5AEDAF5EBA2FC24C1E75BA0DF88C6629D668E721306281181A86473ACFAEA180D045D279B78FE01FDF8FA4D42D5858EAE3311F035B819DA446363F642C1186D3052135690994EA058831A1CF20E800045D2B786119CB340D7C1B71CF67E5688CD86C5440303397B753E38E5EE49753840D5216CBFC578EEC9A0DA540B2451BE41D18630FE9E8471F5B6090DD3A6DAF5EB2209C2FB90DF3D63732CF661623C2587DFB8B6B5A9D3ECE82C37EB7592E628901FF549B2C7B52DCB0FB041731FA62B7E24F83C9B33A52CFB9EA4C12F5EC61191CDB13AD4DEA4855CE7DE6A2D9C6CD359C3EFEA1BE001149597B09805BE271F313F27E9695C789571E862AE853C26FED764939FC641B97B9DFB9C508AD91DB0256DE6F32CF6817C1F65D947CCA228289778DC8E90986D67118B5AB74DDD9A39577E4360B039B8BA53DC7B22066086998DED5637F05E3A6E72F5742CBB89DE245B62DD78D1460646D2B795C3C00B208E38ACBA58DE9BC300185843E1E2E59695B045C26559EE8BE16F7E45DCFE0693F183ADD2A58EF083318BECCE843DAFC85186552775F047E63404080839D9600E387AFD47CE6ED4FABAE9395FAC64CBE7EC245885DCE63B9D6EC74DA0F7809039C4C1DF541EA4D46539777C4A45FDB06751D5C7C37067B91D9D44113F73D1E93666B5C842759A054A1425DF4F226E75DAA6FEB05E316C1818773CC9848FB1E74AF5E7D36F59C2475FE2F10B7CE432D1987357B7DC0DBAF2369BC1A86BBE1F66D8994AC51593247B740FD582D682836A9568E1879E049C615FA50CE9FD3F99AB1F7FF7D11D8F0B71A7ECD95C0FB1BD0A4E08210BCACA562D0D48F02F776C50050DB31F7BE0BB6106BCACEC4BCA59356DAACD11518444EBBA4DB5F3427E9F22B917729331BC57F3448CC8DE37B6E1C7B3ACF8FFF2FE776AC6A42BF87D070665E2D8EDD496A738774F315D5FA02C13E6C826713A3939CB3E238F1F259266835285B716809A64BB16AD42D1C98B4EB75955F2EE6F90EB5B5FC9EF356FD0E25573C56E08E95976F20FEF49CADE5C961D0B04618AE904E00AD936D83721FA0EE03259524CBC020DC282BEB3F28483A5B914F543582CF031E77A78B4B69AF1B68FE394D41E99CC5DF7F6CAC8176E7750108905DB6D0305FC7A1805F1C9FB269940DB54BB1D42C41F903789366E1D0FC21A050A1B3F19DF50717CDD314F11FFD79E69A45F0DC32CA25796AD47D6F5632A183475DAB85E66986C0F9263D8074B4F754786E3E953112547509B54F2F8ACCF86FF81CE44EA986AF6E71EF597F0E186E624AE8872C42B0F20F8A1483C23F1A0E0E4AF56502DE8D038F0CD0EA3C671D4B16C211FDE49640121CA135FA4614092D2FC6EA23C91084B4CE8A7B27B4520A7B25B1989F6C4875CAA8ACC67B51F43AD72F78A027BCB7F46D5CDD2B6C0851787F728CBAF93AF283E9E1FEE1F1CCE672751E86555E42D124CEA2DFFD4875174A983D745742914AC16FCE7F631AA0A942C0B18A76E6AD2A8CFB66461998E7E45029BD5834BBDB1025F6E3D5AF008473C8FD21F57B1E9C358F642CA195EEB3D1DCFFFBBFCEEEDECECBF6EA94F5FCD2E533C266F67FBB37FCD679F3651546C991ECFEFBD281383E4CB17F455E5F1372FF51FBDF4772BEFE9F73454F9288B06A98D08E102AC8901E50EECD025D86B97603FB9047BD3018C9EBD949202C4533293952E22C24946397D95735EB1BB73E5E5394AE3A2142A5B6ACDFEEDD18C8301A0423339426B23333900A462333940A3A23339E1DD3A409303303136935B50A79A8E8BC8E40091C4651A4E0900818D5E26CC09274C724DC405FBD481175C30377DED62388654C5207AE14ABB21630E052BBCE207D67DC8BA558C43D790C30F8408DA59B384BA98E66048E95843CEE0E830434EA6D7A72E73D61608A3C5B42989F1B3B32C6AC44E464854CCA02D9BBE9AD841AEA6C249A77A63469545E3D9593EA5EE68BB60D626B48F83816CA3FBB850A065901F178CDAC4F9712141E59039114512F2C7C520B6617F461347A376D521805C60D581801CF4900A054409AA6DDFDA1840DD41A8E03F76537BF32134B19B4E077C94A01E7DB97166E05131821CA0D57E657614AEBE1AC26E0243F298CD4970181E496120D48E7E166B6BB1235BFD5DAFD55FD36ABBBAC967FDAB26E7C1C359249D077F0B0D12B3A57A1F815106C9D959BA8186DC7C86E79673143FE48FC7F383FDFD0E8700F6C0268A94118B3C8C9FBB4C136D289E9E9B31ECC5D69E606D109E0AE82EB4EF99DB4D0E49DC9DA18C3B862F0EDFFCA91328152DA63B09D9D83B6ECE10E9C83B936F012BF19C90500CB1D31D4B1253079633230DC2C5D2E9DE3449F09CEEA66B1B3687170C9DD5517F5926BF9A9D655FE2F09F1B9C718DA951981FB064399C1125D16A76765A1CC95A976D033781729C6C2AB7917286B323A5316514F4FA571726D1C497919D3EA9E2C748CACB6FFEE859916B99CADA39FCD97E32A27BE1187BDBD6A4B28033AEF908BADF25292A0F34A36788C99447DD60BB8AABAF061E4FD1F97567E706B7263F15C8A6BB1D22C4AE71B18FDEC914295A32812972054493D95926A383D2B8D8B8AE43D338C16AC2D374E75805B7323CF246B7F160E55F250FEDB2B34CD279D34B764862B7F36E4C76456C959DA5BB24364BF7659F53D7B72A388B03AC2A468B03A01E1B4716AE4AAAC0263BCB66EE38430890626721729F0F612A4AE293ECECB8B5814E1C0C5D1BEBC4911B6213C3A1AF1B6267974663A6802F7FEF2C6F4CB63674B6A7E44E2B35974CB78CB3EBF0243D0E61DAB8247D40DA7824DD519C79E470C136A42D32C311826BF4C062026A74C6E1623BF4DA66B35A90484325ECAC726B632E38F14D2371175C1C6F91E00B765AB7FACADCB7C978E48578073B3BE24ECED0EBE8092E561B1D7D66A4BBFA0FAE3CFD1CCE73543885E1D6535766E10B0C2F01690210885FE8A30218DC1E626BB5147CFAE35E5697AC2B766D11111C2CBFA8B80994B62D6F1FDE4297914FE3A0DCDDA5AF2B93BE14C109F6A8D48B4D948745B371D578CA1488D442B5971E69282A9585DADFDB13D1C84D873CF40AF78F2C4FBD500C24729586B11FAEBD48E80357D250F316B46D30F99C0F685DF809C7B9D04B93CA942F7B1F2D1A704E22746460A265A89981BDF9372E4770B70E693C3EEB87E00DD52DCB2D6690E66EE010DCC177E932AE9653B3EA14030B9497F99E1865B10C150333567B9F91E52A2A9D6DC91F76929F806B9B5BCB4C244ECCB86AA60E4E430335693F84629186DFD95A26A83CF66FE5B739697BA1CA67AD059266306C2D12B98E4703D54983280169CF861979D94D43A026C5BBDFA30C7B7905E156F654313554D53D057AA448CA28F3067D5146E416694B1CB10CF4E0F2400C635E1DF874F688AAA2E21CE9A5DA0E42FEC3F18E850E1899791437C746B136581FC35BD953A0B49DC0DDFA61EC053E6F149E927A5D2B9A450A0CC265FAA7C7DD9B35662FAD5A387E4EC175B2E7417789EB888F37DC2C52E007E53AE8F5D52DE3BA2B9350B2F4FAAAF5A264165854F228CC06EF3FCB9B25941A6619AF7AEED039C719EEC10395EB36DD27E13E59AC60B98A11C65A33C2FF567CD8851F266546B328CFE3CEC265430AE56C34096F093F4AEFC7C073F08FC583666F5A9BDEE299C6EE2BB94E7290FAC2742F4C37DC6243F23EF92EAD35B683E3265A691873DCA40B0DB27B2F898BB2CD7C36F611C004DC64B10D382903F137386E55D786DA11644BD103C9E58C74C2CC5D43618F99F9CC41784CF714F600E7CDDA7789C53AB50FF68EC274F4F5825DD35DEC3B755473D88C1F458F695E11DC326D467976DF4ADCBB59F7B7DA059C77806BD2AD8EB5A92FAB2783CC509D1D72ABDE0E1CC4AF8EEEACD1CE18F00EDF008C71CABE3D455DC860DE8912B8833C23C6BAC7CC67AD2B27EFAF52BD3445BBCC571EA14D01815DD82A280F1AA1122A0FAA862AA2A98872EC142AA2F2A08AA8229A8A785741A136BE0054255F4E5B2FE54C26A994CA856BA40A69E9495C5F24D42439753595259851B424053455D416B150439D015550E71BE193A370A01292ABAE8914D2540755A4A9C20C5C30054491E54BD4150677492BB6D9FA13CAABCD49CB2AC961AFAE5E524C5D393919B76C0139F8D3B5801453B7809C925AB6A0DA0FD035A02AA5AE9FBCEE685EBDBE6A5DB56655D22772A2C6A6326515D1F906FABA89992157D96D36AC69E8529A1AB9759B5025975FD75926B75572A5B44A9B5F9A4934375F04A8592CA8A9BCBAF82ED648D2A15982646BC0D9C58050079BAD9605BAAC9E41195353CA374DAEAC5AAA80BEAEE2369D5847995A6397AF1CD7E0658EB180E9A55B51562D7E5C71B1A7ECF3A68A9B3A33AA246F4E417ED5CCB241B000AB676C21C34E587230465DF310B8DC56E35E6D35E832781F45D26FB3BB2BCE3A2F37344B008DE9D8850CB25B17521A68AF6738248060F192DEC366AC7DD7C53B02926E6B2E1238EB32B7222BBF84965AF65DE53CE125FD54F9CA7392C92C0F885C4AED7EE9C638F51960CDDB778FF1F896740EF608679AC8D8F1650BA526BAA45BE297AAF543D7F163DC93C131849D98BB8DC704DD05FC6965E269E079ABDE75A5E58DCF53C9AB628D240323059C93A65ECEE84923730F1D8334CCE24D06460AF4260DE49928A18D911323ABDB85D551A5DCC1750FF03560FA71604229F7C4218E7326C491F9D841232E744AD3952D2393DC9B4B2D5D90DBD7202452EC4BC864CB3D59589723BDDE01DC937E5CE210D718038D2CF1A11943218F4416DA7F03363865877D03906048EB53E367205D4B997B26A87C13A8DE2877A7341E05CC0A4BB3D5644F1EF1445C4211CDB1F9203C21DBC82A41D88CDE04104E6E819D15F874173EDFE536479A74CDD60A739A6B86A1E8781D11A639956CF28E16D56E1549C03FF324C5E0174980A2AC4C3D5A7CDEC44588A7EAD70794850F2DC411C68C91CF9C823665CEE2FBA43E8CE55A541711A226E55EE0E5DE498A47D8F3739C5D3CB612C60FF359F9A44521487728388B2F37F97A93E32EA3D55DC4AC6C8B435D55FD470BA1CD47976578A5CC45177033C3222AD665FC6E134641D3EE8F92483D0044715A4CE2751563991771BB1E9E1BA44FE5F3B72640847CCD2177AD3DB2CB78E9154F4ED9B70D4BED397AF0FCE7F6F10B08443F102CD98F3E84DE43EAAD3282D17E8F7F621E0E564F7FF97F43116B305F7A0100, N'6.4.4')
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'202102271629201_init2', N'MyHealthCare.Models.ApplicationDbContext', 0x1F8B0800000000000400ED5DDB6E1CBB957D1F20FF50E8A72470D4927C1C9C18520259B2E7682259825B3E993781AAA65A9553974E55B58F84205F360FF349F30BC3BA6FDEC92A5675B7231830D4246BF1B6B8B9C9CD4DFEDFFFFCEFC95F9EA3D0FB86D32C48E2D3D9D1C1E1CCC3B19F2C8378753ADBE48F7FF871F6973FFFE63F4E3E2EA367EFE726DDDB221DF932CE4E674F79BE7E3F9F67FE138E507610057E9A64C9637EE027D11C2D93F9F1E1E19FE64747734C206604CBF34EBE6CE23C8870F983FC3C4F621FAFF30D0AAF93250EB33A9CC42C4A54EF338A70B6463E3E9D5DBFFC8451983F9DA3141F5CC68F29CAF274E3E79B14CFBCB33040A4480B1C3ECE3C14C7498E7252E0F75F33BCC8D3245E2DD6240085772F6B4CD23DA230C37545DE77C94DEB74785CD469DE7DD840F99B2C4F224BC0A3B77523CDD9CF7B35F5AC6D44D28C1F4973E72F45ADCBA63C9D9D3D249BFC6B36F3D8BCDE9F8769918E69E8AA5F0E4A9C006707F5F76F3C98EA4D4B10C2A3E2DF1BEF7C13163D731AE34D9EA2F08D77BB790803FFAFF8E52EF905C7A7F1260C61494959491C1540826ED3648DD3FCE50B7EACCB7F9BA4F9631206C9E572E6CD6980398BD07E2FFAB8AAEC659CBF3D9E799F4971D043885B6ACC954077411EE20682108C0C9A99778D9EAF70BCCA9F4813A2E799F72978C6CB26A486FD1A07648C918F0875B5B92C360FF9341961BFA0C0D154191D4F95D1DBA932FA61AA8CDEB9CFE833FA16AC4A19201B2E33EF0B0ECB14D953B0AEC46C2309EE41AA4F69127D49C24ECC7491F78B6493FA059513598A3B94AE704E17EF64DE4930A55C03A5E829D95A84ADC9B63E224D2FC940432CF224C5FF89639CA21C2F6F519EE3342E3070D99C3A0A5EA178B541ABF1E5D14F4984A711B1454E44CC4E93D9DF9E821C5F25AB64F49C3E84C8FF65929C1638FD16F8381B3DA33B9C11CD31890B256E92DE02194E3611DF926E23032C9BA686A5089E703E6975CFE1B3493357C8679366BE312D1C598AE4C89715AF8D15175010CD155194C6B69077388DB29BC77AD0094B4A2711175796862BB334A17DC1DBC1246E60904056664102418145A944A535D62C00317A6A162DC2EBAAE97B5A357D8C50108E2FA497CB1467E3CFAFB74F498C3F6FA2079CEECC12A387D46597192AC9DC4B1CB022B8A74CA0615E05C304E3F5822C7ABEAE97C5D2A7C9AB08BA0B226C5DE20B9CF969B0AE36E97664B40C9AF9D971A355117A0E9E767AB61D39E0D3D705BA2CAF882C1EC8574FA38FA5F33020452AFE9E28AB1BDFDFACD138E38DD3559F47581539939DBDA5432F059B970B2A35BC975028F5A83B1CAD4999FB4FA814CAAB8490E445B55291E93E4CDC44A3FF3BF6C71F931F92E5CBE8998CB7892A150C3FA334283A55B6F2AED8D0A4BA67C6239410AA9482B5B832F9A045398B3D400FA7815E25C756873A451177532343E93147013F611A0D9A5EA3E01A2F03D49BFAE5D7AF7C97E455B6CED774FC0D9E4F41882751A48BC5EE798ADDAC7F7BAFA58DC9FD39C983C7C0AF75FE9E1C8720AF5497E4F535C3E9E02D1CA04B8EB7329B640EBAC659368595DBE578BCCCBE60D4C27C48C8D483E21E281738C4A03CFD81BEE0288897DD5E725FA473D29C13AACAC55010EA075090DC57A93A95808BE4B4003EC5A089FF6CBD0E6BB4AA2C86E2913E3679C0C0BC0A48495E9F8234D36D761D1D1E1A31D192FF57C859CE9A8CF037DC2A3B1F5E72FBA2FE5712C417A5B23C5098157526133919302E24638CFC3CF886078BB4C9F656179BF53A49094F273B6FA5B3641EBFFBA3AB5CCE93F83148A3E153CC2DCAB25F9374F913CA26E812EC6F52222816398AD6FB6D8A95E7E5AC6BEE7E4D3E914197A41FE3E2ABC1785789FF4BB2C93FC6CB72D991FBBC50300470529C33DF271AE2274266BC3C4F36713E4C732E665E8D84371D7FBDF747CE431444928359B48E70DF2405A7B38429F803BFE264223D4855D4AB6415C466456D92CA8B5AA5D016B54E665BD402CCACA4754A7941CB04DA7256A95C6A96652739522F4BAC571D532106862EC2CB169E64255EE6F4330A37AEB3EA4BD472883A226A89B535A296B993E06F41B97C9EEBBF68121378A3F40DD56C87035332F982E4F8C73196425435A7CEDC7E78F6657221C41D11B980DA1A8FC52C13262DCAD987902E646693B71B4353D579FA19BF48775F25964EFA6D1ADDBCDF257435F53BE2E056F9B7EB13BEDB5D8E6CF1929D2DA3201EBABA29FA6CD4D38D4C7EDB5EFADCE2340AB282926255BD8BE7B574368E3B02C125B0F59B2886B77609510EFD3AA5509A740954A204A41AE68AD956BAAF08E9105EA58724AFE25C7B9A84A1932D22EB0D104792C136DF304C7E25FF0D157166E2ED9D9BFDFC1EBB035622871DD0529934D808DFDA451DD8E26B2C37C3DBFB80325CF7236BAB9B69A6CDB3BFA367C6E03BC4E8B90C52ECE7CE007F0EF0AFBDC0ACBCDB88C4B9B5E958465A038857712DC98B4881690E2FD49D3181A7F28A5F3619EB5C25DB240E5F3595EEAB44B4B7178C13BA7A51096CF76B8B8FE4EEBFC6E51239FE0A0BDE6BC05E25ABDE12987CFB3A42257939B15CDF3DA5E018CE7867C8A1AD7EBC5C92D56A020BE454C7AD3E3E17578DB95FD2CA46EE5996257E507213C866D69D952EF2C778E919F8B676AA0E704EBF260337281673A42CA7B3C3838323AE45D4F0ADDCEAE081A3100DCF6393918ED362A8A1C2C64FB40314C4392F1682D80FD628D41783F9D450A614DDD166C2C65CE0358E0B71A06F6393DC15BEB34531DADC18A1A76BA89339608E9A50528F4F59B7EBDD3FBBBE671D9DADF8A5BF61623A92E9CA3201D374EDBE2F7413B910CA29A0F4278444034EC134037EAFA498F24210237EB1AD7813570760BD6A8B83880894F968C9CF2D44E62F9D505351874978A9E8A3FD20257F71908C308A3BE93AB2B4771459893BC50545D3C9396921262092B46DF783441AEF2FB90832730583B28EF55BB4117866EE975D6E8C0FDBEE493F930A4D22064DFAD1A4209CFFE27664A2F8CC9E547A690EF001E9C8FA1D8C48296DF90484179F5ED30DB17ED256D96853885C65AB9814407A42631B1CAD0F6B9A72803DB9B96B1C658E8CCACB571F5C9B84A374A36D81A374ABEC3C4739439CACF7E55639A0FE01B3B8F9A42F3F6220645475704709DF6F8C82330606434074E0C0B8BCE38F50C14907F90035685207E3936FB1698727DF2426F98B0FEE6D6706E98ED419CA68C1F9BA812430C8CA7EF86E5F4FD75566FA8984EBBA7D23AB663ED1B87FEC9AB26332334D274AF916DB82A64335C9CE2B3ABC77BBACEB15AEEE920338165253EE25BF25CAF7A2A2B41613D050DA3D3B4F41EE88858C24F27320B459B43DD564CE3FF9510E2368E126716FBBA8A820133048D6BC461BB9F5A1A0090854D9DC4B0B6E10E3949F652F1ECA9A14577972A76508D1EB0333596DD1671951802F704EDB18665E67E967CD051CA76884768B5B04020C031A1860EEE750409C0685B5EC72506C022D1EBCDC5F8006EC7B1A286AFF5404C66C696B4B466FEC8A8BC76EC96B40CB9BC14448F5756C9ACFA18816A1D093A706AC3EF5CFF3929D243538A28D5303DC7A83D50EBC71CBD681D73B6376E0F581691D76A5896AA00DB08C702817137EF4837D211D5075405138F4DB394983B178C9721C91B6150195870B19002080058208DE250C522A2EF067E706B3334F6D352821C84D3466279C001814CCAC3A48D7DCA055E437B0F34D63767687AA92F6F40EA8975A849BC18EDF5CC22BA9456DA53D78C2D44875F4846A25387329DB4875D864AC06123C8AC4378EE60004BD70971E81005590E8341AA0F1C9A2BEA055C41A73A33ED3D946667D8A479C9EA1249391211FE0B36AD17066496E7511D0CBC096ACDC1C62ACC9A056B5F2A2A299DAF20B492B56609C3754A3BCE81B4A64D0B431690E6A28C6FC286FA8A63E831B8A775AE39B486D4F33B3A841F902F52A45E3486D6800AB2EB34BBE40B75C255D64B6350BEB9AAE261696303957466823E62E04EDA8921879ECCC3C9635B433EC8CCB29785B945E04E90699DACC3048004907DA489C12DCCFCAB78F669BDB70A31B548659CB2BDA47BEB5AD6BE61E8DC1BBAB899766F2FD56B31D57288BABA5A9664126DC5CD5A1281AA0F1BD69F701DBB893F9C27FC211AA034EE62449E1FFB34161E515D7445CA3F53A885759F7651DE22DD6C82FCAFD87C5CC7B8EC2383B9D3DE5F9FAFD7C9E95D0D94114F86992258FF9819F4473B44CE6C787877F9A1F1DCDA30A63EE53C38FDDB56C73CA9394D49C89AD2E3F2EEF9EBD40397A408523D2F932E29209773D25BB004D96F4C626DF6BCDC64093BEF8BBDEFE52DDFD22C6EB1AF513A967546C3697DE7A824507F725F976E1A310A5ACB3263C347C9E849B2836384D2CC7ABDD7321521D648ED13D3D0961BA500BA4EAB5F72306A90DB5463A1622713EBB06486F85486F7B20FD2044FAA107D23B21D23B11D2C99CA12267ABE0C8CF5909E9B16434D2C05AD8D560932EF80D869BE25B5953B3E3CC6E78757719438C2ED41C093C0E0FA140B01D56F7FC3B0BD7C598238237DE211C0836C702AFB8432C106C33509A77DAE981D2845A084AEE21764A6672B1BD90C5925498C01C9F795D9D9A34E82873CCFA0D75885507ED8CE8E9F6CB5D491E29A281E4517CFBEF39D5D797AF43983AC88285CD23D1140F9B408B11026F1EA75A1A46EC0CB31923872B7AAB610D38AE03D827A2532F3D41242AC2020F5EBE45E1C1881DA218B010B923587722A20FBB145F8FA3BD81C72F28902ED81C0B3E1D0CC160B82D1A7C1D98C784B136DAC873CEAA1FCFC279DDF570DE12D51923932BB22BAD6E0674D77C3F0EE105EFE47213341D3DB9FA513D89CB681F55A0C512A37CF2965A5D9421632EECB626C9591BAD3B71CE9C20EB23D37510E3F0DC0517399F67E948D92971571FE3734582EAF09F7DCF4BBE1BA7BBBB474D2146176A8ED4BD5A0A91BA503B05B37D06915530DB88F115D62DD1903621D9B0F1322BFEBE79FCAD8A9610FE773DE829BF4B55D507C358DAF8214004996F821C859FB5B73151B7B7DBD103AE0EDCDE28691E0CA57AA90EB341691F0CA581DA60BB12356F86B2A56AC22DD605E5BBA1D45A20E15D7ECAEF078EFB017386E876E5FD18A2CCC5C9747F5151760460EE4F6679C044DB60535729D3B8549410F33C899741E9AC54BE7924B9179B1A9641B19B41788B486FED30ED768F6FCAB69EB8917BCEE9B2B35C3D8DEA8C2F470FE3BA0E611C21019ECDA595C436D866992982EA422D90AACB7329982AC81CA37BEA16C274A176F5EA5E8161EBD6C55888BAF6C15BAAE7DAD0EDECFA091EB5A5B72EB8E8692D28ECE3B41C1888B3B138C2476A6983238CB13AF0005FA2654E3DC0A8F1AD3E0678921615A7B0D0CCB9176629259D8BB5188FFC5BB3D4A0E4A37B600BCACCC659D8FEF8E768292B201F6DB712E3A56E17BA3333AEF8F8FF483370E5F538781A96C0ECF29A1A3C304A9B59DA604BACFA09510EAC0EDF557E497D3B9CF0AB727C1DCC2F098C5C3A51AF7BD2C249F924A91CF3163ED9494D00AA274BE578762CDE0DAEC80EE13BA18AC815C29E296294714549731B134491DDD0B4B5AE1CADEF86F79B5D9F0D3DBCE97C9102DEABA43763BA703B2E49CF957091E6B8BCEAB3636A0FF48073C552701F813D41551F8FC34DF81022BDDDDB85DB28D33C819A300B94F6A1420AA70DFD6E4F4B55FE3BAE9808AFB5B0A7A2F2EB71B8D8BDF246CB8C26D48ED5985DCAB581361B102B6E9695DDD2B435D6802B495C51A7B8C8C49E32C2AFC6A10ABF7B68BB73D8BC3546ED7CD461D3EE86360F85314B86959DE875652905EF7C519B785DF0F4C4A71D18657378E3D86B3B4F37DFC927638DDE587869B28243E27FCF379DD1E00070E20BE240097A144E7A3D9E51E198D6B12C21EB9ECA1380F3526593B4F4AB43DADFAD976AED214AB9AE96D52B1C51CB6A65B5B72AEB325A259979CD8ABB11B707458283C53FC2EA8C6C97E01AC5C123CEF2EAB9C7D9F1E1D1F1CC3B0B0394559EC3B533EC7BF6563D23EFD8A3B785772C5E4673F6737B1FDB0225CB96D42168FEBD4CA163A9D993958A63BAFAB72BA98FAB2BB682587419E165BCC4CFA7B37F96DFBDF72EFFFB1E7CFAC6BB49499FBCF70EBD7FD9BF46095F9C8DBFA1D47F42E96F23F4FC3B0865F27662E7D7E202ACF562750776EC12ECAD4BB01F5C82BDEB0166FCB2ACEC05AD099E772D4786F601574BFA77A644071D00DC4B1DA175DEA50E00817FA90334E061EA84BB8D93A90330DEBFD42DA85349C778953A40AC7D4BC7130212F7CCD709738B13667D98C1057D1A975017E4868703C623A4CA97F29595765D469D80AFF08A1F799FA7CEA90DC831BB5FE2ECB8B76A09383EE5A04BA1D7A43338E830E9647A7DEE3367EDC06034A6A9EABDD07D25AAC0C911E4B6CDA9B5F27274A1E896CE8E0E8006AC352C44A1CA47706F69E68E199CAFA19D88603E1F434C089CFDF6B6DF3AAF41075DD7390E3A52735A97A8A16A4E6F95C99814727F8ABDE546731CC86E00565F0DD395C134354C677126955A13D68E31BBF1F6AB601E02FB391DB8F90D01E9DCFBFAA354CE7D0E5A98F15E1396C80C87F3561B804579A8F5C661DCA5E8D69A79D7E8F90AC7ABFCE9747674FCA32BE9A6F43DDA5B01077C9854CD7878D863D7DA1ED84843ADACFA15681EC42F7DB4F8CEC369A0F0A1CF0D0E9564AD6FD30031E474552E70671A6B1F90E2C5F1BB3FF602054E38FD9B9076697263F4820E4D5BDFB354E2396942DE73A93F96C055493ECE8C2408E3A2D4BF68029FA4FE3B0B9D37123B30742A67F36519FCC6BBCCBEC6C13F3624E28EB446A17CCA4796C31951E006B4B7D3E2D6F47EE081E46417B473411A6F3F47E8AEA368AF7FF52189C67547642E51B9E618BF1AABA72253B241DAA84032C35A38C69E88E57D89543DA5E29847D2B781F9A4622F1E3D21B6263C9A02DB655C7D35727FF2A735F7766E70ABF2033FA1FE7A08E71AE460EEE8A78A1425D9822A722B71D7D95B9241AF1F4D671A6AAA46C430C36AFD7FFA3356C1568A23EF741B0F560782846E347BCB91CE1FC785AAD8F8E438392EB6EA310F555FC9E6A101FA29E70DB3B73DEE64CBAAF1AD71612D867B71C3906A379B1DB35300679BF1D64FB766EE2D8687C4340E2AFC177AAF1183D36574AE96031F7E3C48011655C5AE2C3C8203C518F8D50069AB7C4F1CBEFAD93D9A5CD5A57A82B40BBDDE847950149B644D16825C2309DE12A7A040280D757870C0A311E2E0B4905FA8D86DCDF21405BC9BD96D1AC47EB04621570726A5A1E42DDAB6C564632EF01AC78548E56A699299F20EFB93790BCE8C085D3350DE546A3298BDA03E0E23D8E7D5011E1BF55D7043FB24CA6E1244FB6CFC1076B055BA892B73B8572D1AC88042998FF84B674B574239B1BAF3AE34AB40385D92DFEF259F542FA0EC2299B817EFA710338DF322046AC3BE0BC1227F31741749C01EC1BC579DFBEDBA914E053B93899948C430E7486939C3468E226C748FC28C2070B46F74F0796A1FAF9846F2304F6B8B2E3794BFC44DCB0E366E12C2090D9E8A62D50946219EFE3265F722CEECF6480B9BCB365827BAF2709F58579B57E5C5AA137CA7AC93DD29B963ACBB35B97604EA5A9D018352B640F0246493EF45898BC5A51A47A5575DE5E69C7186FB7192CC751B705B619FE85E19B188E1FA5AD3C3FF563CECC387AD92D1EC46A06967E1B220829725769A8FC2A329F239F8FBE2A0D95DBDA60768B6A3F795AC1318555E49F74ABAF1161B827B97F769ADB11B8CDBD24AC398715B5D6840A7CB7B8163D22EB38D7E100B14878EF85EF8A579AE6CC78805CE4BDD0B0E4DD146E5E660156B566EC30DF6F88588D5458D66A88E98A1BEAD79146B35ACACD11A5372F3F108C4606EFC6CC9C1DCCEC9B1A3BEBC95363ACDBCEE80046B05AAEEF78407D1AA73166D028E2E7416C02EC56502E264D980249A8CC071092E231027CB0824D164C41AE0B9DCD804B22CD974DA7C81895690298895E7081269B2634C475C864C7C9365199CB53932A9B45564AD43827AB2492439F3093599579767F039D6E1B236ADA335E0F4D4C9E5414737592D1F926EBC65EBCF382F5DCAA8179D7519732A043FD4D914EAECADB3ACCD2DBA7CEB64EACC6BDB946509EAAD775D09EA64EA12D4760ACB12541AB9AE00552A75FEF55DDCE6D9EBB3D6656B9625DC13E7253D88146504E30DE47CAB6908257D1B2BCA0924D0D7A938A2CCE7518636D8E5B3020D781963DC4EFA4E52A455B722939CAF297DA7B8E2F8A30752B2B3A9ECB00ABD65CC2A00D5DDF1B2799DD338A939BD7D79433C553357A51B54597AC84F506FB30381CE2A2FD6334A008DE6D0A7194447D9846DA03DF3E6B0013885A7AEBD5C8BB1AF3A7FF04A506DCDE92C67556614F2EA512E89A6DDA79795C78B84DD6D7E2089AA88507B2CABA3D40899FE176B83350934EA5D0F26880FC288E860706446BDC903FB978D53F143A15AC9DF0075DF348D16A46F1AE9539623370DA5F3C99FAF1CDE34B2230582B6313A7D20B1B7D2C244AA2E995A6B85605C2AF78D535BBC4D1A47FCE88ACA3224EE6C515576AC99C46658F5E892D96B476922C57246FAE0A773A9D3D90AF572476257FC7E1BA779A4492F9105C6AF2904F244CDC21B5E044DA2B1CE8CD21CA21DA012848E18DC009C8140B282931B11E466046611D6866B967094D1C00C435171EEB9AB36EE645EAD8AEB00F2937BD6EA64FE651317FEB9D5AF0B9C05AB0EE28460C6D553381D6893E6327E4C9A3D7FA6444D12CEE535474B94A3B394F43059B192E8E262AA205ECDBCF2FA9F421B7EC0CBCBF86693AF3739A9328E1E42EA5E9CC276A0CAFF64CE95F9E4A6F48DCD5C54811433285C9A6FE20F9B205CB6E5FE2470B39440144689DAD9BAE8CBBC70BA5EBDB4489F93D810A86EBED696D22C01B29B78818AEBF9ECCB4646ED155E21FFA5BB284806A2EF08BAD94F2E02B44A5194D518DDF7E427E1F0327AFEF3FF035C9B85FE29290100, N'6.4.4')
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'202103011741324_ContentPAges', N'MyHealthCare.Models.ApplicationDbContext', 0x1F8B0800000000000400ED5DDD6EE4BA91BE5F20EFD0E8AB2498B86DCF99E064602798B167F678638F8D69CFC9DE19B49A6E2B472D7524B58F8D204FB617FB48FB0A4B499454FC27254ADD3D310618B849EAE35FB1586455B1FEEF7FFEF7E42FCFAB68F284D32C4CE2D3E9D1C1E17482E3205984F1F274BAC91FFEF0E3F42F7FFECD7F9C7C5AAC9E273FD7E5DE16E5C89771763A7DCCF3F5FBD92C0B1EF10A6507AB3048932C79C80F826435438B64767C78F8A7D9D1D10C138829C19A4C4EBE6EE23C5CE1F207F97996C4015EE71B145D250B1C65349DE4CC4BD4C917B4C2D91A05F8747AF5F2134651FE7886527C70113FA428CBD34D906F523C9D7C8842449A34C7D1C37482E238C9514E1AFCFE5B86E7799AC4CBF99A24A0E8F6658D49B90714659876E47D5BDCB64F87C7459F66ED873554B0C9F264E50878F4960ED28CFFBCD3504F9B4124C3F8890C77FE52F4BA1CCAD3E987FB64937FCBA613BEAEF767515A94E306BA9A97831227C4D901FDFECD04967AD31008A1A3E2DF9BC9D9262A66E634C69B3C45D19BC9CDE63E0A83BFE297DBE4171C9FC69B28822D256D25794C0249BA4993354EF397AFF881B6FF2649F387240A938BC574326301663C42F3BDECE3AAB31771FEF6783AF9429A83EE23DC90C64C0B741BE611AE2108819145339D5CA1E74B1C2FF3473284E8793AF91C3EE3459D4261BFC5215963E42342BAC65AE69BFB7C9C8A705090C0D158151D8F55D1DBB12AFA61AC8ADEF9AFE80B7A0A97250F502D97E9E42B8ECA12D963B8AED86CCD09EE40A9CF69B2FA9A442D9B6933EFE6C9260D0A524E54256E51BAC439DBBC9359CBC1B47C0DB4A223676B10B6C6DBBAB0343327030331CF9314FF278E718A72BCB841798ED3B8C0C0E5709A48F012C5CB0D5A0ECF8F7E4A56781C165BD444D8EC3895FDED31CCF165B24C06AFE96384825F46A9698ED3A730C0D9E015DDE28C488E495C0871A3CC16A870B48DF8864C1B5960D9383D2C59F088FB49237BF6DF4DEABD42BD9BD4FB8D6DE3C851244781AA794DAEBC81926CA189B232AE8DBCC5E92ABB7EA08B4EDA52B688BCB9AA32429B9505DD1BDE2C26F9008302AA364B0A481A2C2B256BADB5640108A3A364D120BC9E9ABEA753D3A7150AA3E199F46291E26CF8FDF5E63189F197CDEA1EA73B73C4E8C075F963868E337762073C0BEEC813589857C630C27A3D27879E6FEB4571F4A9EB2A926EC315766EF139CE82345C5797743BB25A7AEDFCFCBA318A081D174FB33DBBAE1CF0E9EB015D55D78A1C1EC8578F83AFA5B328244D2AFE1EA9AAEB20D8ACD130EB4D90559F07381579E39D9DB94327015BE40B3A31BC135328E5A85BBC5A933677DF501994570EA1A88B19A5A2D27DD8B88944FF771C0CBF263F268B97C12B19EE1255C9187E4669584CAAEAE45D51435DEA8E5B8F9043E84A4ACEE2DAE2BD0EE53C760F399C057AE51C5B5DEA0C89F8DB1A39921E7215881BA6D5A2E9B40AAEF022449D49BFFCFA95DE157595A3F32D1DFE82E77318E15104E9E2B07B96623FE7DFCE67696BE2FE92E4E143185099BF238D4390575257D4F52DC369EF2B1C204B0E77321B650FBAC259368696DBE77ABCC8BE62D4C07C4CC8D683E20E28E738C2A03DDD81BEE255182FDABBE4AE486764384714958BA520950F2023B9AB4AB522819029480162895E1BFF87F53AA268555B2CD9236B3679C0C1BC3248455D9FC334335D761D1D1E5A51A223FD5F226F351B2AC24FB811763EBEE4EE4DFDAF248CCF4B61B927332BFA4C3672B2607C70C6180579F8847BB3B4D1EE56E79BF53A49099D8E666F65D2641EBFFBA3AF5ACE92F8214C57FDB7981B9465BF26E9E227948D302538D8A48451CC73B45AEFB72A565D97B7A9B9FD35F94C165D927E8A8BAF7AE35D26C12FC926FF142FCA63471E884CC112C04B733E040191103F1362C68BB36413E7FD24E762E7357078DBF5D7F97EE42C42E14A6198C5CA08777551609D252D211AFCCA8BC9E4205D532F936518DB35B52EAA6E6A55C2D8545ACCB5A905985D4B69497543CB02C67656A57C4A96E52479122F4BAC571953C306FA1EC2CB111EE5245ED6F4338A36BEABEA4AA8E512F544A825D6D608B5AC9D243F85E5F17966FEA22E4CE0ADCAD7A4E6BA1CB896A90F24C73F0E711462BA3976E5EECBB32B25174CDC132117505BA3633995498B16EDEC42903E78665DB71F45533579E61DBF28775715566EFA4D19D3BEDF16F4B5F57BA2C1ADD2DFAE6FF87E6F39B2F94BF661B10AE3BEA79B62CE06B56EE4EADBF6D1E706A7AB302B48522EAAB7F9A294CEE7092610420157BF8962791B8F10E5D2A725A5DCA42DA06325A0543F57CCA6D35D59488BF0CA3D14751576ED6912455EAE889C2F403C7106D77AA328F995FCD797C5D9B1B7777EEEF33BDC0E38B11C7E412B79526F257CA317F5A08BA7587E96F7E423CA309D475E5737356C9B1FFE8E9E39856F1FA5E7224C71907B03FC39C4BF760273F26E231CE7A6CFC4028C577EADA86B1CD385AFC9261FBE16C2D2C6E90E25AC11DCAE97E219D05A802C978EC27B8D2E8BBBAA10EBBA06F3A47E6B4C01D7CBE7E223B52FB375BB645ECCD28677E23E97C9B233D721DFBE721B455D5ED4F0B78F29B0291ACE201E1A1E0C574BB25C8EA04E1DCB76ECD373F16E9AFFF3B96AE57EC8B224084BDA04BC99F7CD659BFC295E4C2C1C755BB90D78DA5F91851B162753D296D3E9E1C1C19130227AF8866FB5F0C0EB898517B1C94AC769B1D45061B0400EA6288C73912D847110AE51646E06F7A9254F29A6A3A984CF39C76B1C17ECC03CC636B56B1C818B6634B5714CCF3450273340397A8252BAAFAAA6DDECCBDACE3DEFB5ED445FE6E732C62332535B46A034D3B8EF0BB9C9FC21D524A0758E8484063C9C590AF8BD96C4B4AF9B58D1173F8AD77165CD3BA9EE6B088B40598016E2DE4278FEC20B696AFA300A5D6AE6683F88527C054945309A07F65A62691E5C7262779AD796C6E373CA468C4048CAB1DD0F2232B8B2A959909D5F1BE475BC13A60BC3B3F3256D6BE31CF2768FFBD97468143668338F360D119C31B7C313E506884AEE65B04604DC9177A21890A48CED9310BCDC14CFB4C4BA715BEDA08DC172B5A362D300A5B9C93668945A9EDAD2006F86BA6B34CAD9BFAADB47ADF046A15176D0B640A3ECA8EC3C8D0A5A45D5ECAB558C40FC033A7EFB4D5F6D2F21A5A8CA0A490BDF6D8D0283098B2520B39EB06EEFF02B5462B6A15EA01643EA617D8A2336EEF21487C4A67EB915E2767690D63ED092474B8C057B12814555EECB77FB72BAA933E36F24C2D4ED1BB11AF613832FCBAE093B363BD378AC541CB12D483ACC90ECBCA023BAEAABA65EE3B7AFB02672E09A6A97FF2D917C275254F6620432544ECFCE93A06062A12212B51D08AB166D4CB4ECE94F6DCA61052DBD24EEAC17953564040A520DAFD5452E350A1A81802A9D7BA9C10D639C8ABBECF97DD993E25D52C15A86103A3598C9A8469FA788027C8E7356C7309DB49A7E5E5D20D0148BD05C71CB408062C00003D4FD020AC833A0F09A5D018A2F60C483910A246840BF678062EE4F6560DC95B6B165ECC5AEBC79FC95BC01B47CE64C8644DF96337C0E59B40C85DD3C0D60D48541A44B7E9334E0C82E4E2D70E905AB1B78ED636E02A737636EE0D4FADB845D49A206680B2C2B1CC65F465CFDE05EC8045419284A977EB3271930E62F598E57646C6540A57121070018B08411C1879141494D34027E6FB0B3796ABAC1304161A3B1B37002609031F3E220DB738B51513F272F0E8D9DED0ED325A3F50EE8979E85DBC10E3F5CD2F7B5656365343CE17AA4333D614609EE5CDA31D2199B0C354092084FE2E0180C20D883BBD20402744121D31880862716FD6BB332AAB157EA73936DA5D667E8489033B4C464A5C807F8BC58D49FB2144FD448C8CB4297ACBD1CE2B4C9A0575478D191995EF30B89562EC0781FA85A78310F944CA1E9A2D2EC35509CFA513D50757F7A0F94E881270E915E9F66A75183FC05CA559AC151EAD000166DB34F7A813EC65A7251E9D61CB46BA69E3868C2D4B432C018710F3B18579542C9E3A6E671ECA19B6267589A824F5F9959906991E9D50CBD189072A10D445392C766C5F1315C735B5E7483CE706779CDF8A8AFB64DC3DC6130447735F9D14C7DDF6A77E30A79717534351CC8A497AB2614CD00D4BE37CD3D609377329B078F788568C2C98C1429FC7F3628AABCE2EA8C2BB45E87F1326BBFA42993F91A0545BBFF309F4E9E57519C9D4E1FF37CFD7E36CB4AE8EC6015066992250FF94190AC666891CC8E0F0FFF343B3A9AAD2A8C59C02C3FFED6B2A9294F52D2732EB77AC9B97C48F71CE5E81E158E48678B95504C7AEBA9B805A8AB642F36C559AB2F06EAF2C5DFF4FA4BF7908D1CAF1DD4CFA49FABE2B2B9F4D6931C3A842FC9B7F3004528E59D35A1D1F059126D56B18535B11A8FBAE742249A648FD1C6D184306DAA035215BAFE88436A529D918EA54882CFAE05D25B29D2DB0E483F48917EE880F44E8AF44E867432E34851D05508C42F6809D9B564B5D2C059D8D762531EF82D969BE65BD550F3EBCC6D79B50F33438C36D51E0944BA875020D90DAB8D65CFC3B539F68820603D8403C9F65820243DC402C92E0BA50E3ACF2E943AD581510A51E5199E29E4764296735269017B7C2E543CB369B059F69834203CC4A2493BC37ADAFB725F9C478968C17934DFFE7B6EF5F425790843931CA8B08E78CDD0619DE8B042E033EACC48C38C9DA16C4EC9E18BBCF5B016346E02D8274267C256412426C3010FBE24C6E0C18C1D2231A021F24760AD454417EAD27C3D8CF406227930206DB23D168C830CC160BA2B1A0C752C62C25C1769E439E7C58F67E9BEEE7B396F89D43925932F62D76ADD2CC8DDF0FD30042F09FA2B6CD06CF6E8E24715DF97933EAA4487234619BF97395D9429431EECB6C6C9791DAD3F76CE599075E1E9268861E8DC072D0A3ECFCA95B253EC8E9AF1F92282CAF8CF7DE615DF0D33DD6D845688D1A6DA23B5215821529BEA266036311D7901B3C9185E60DD1219B22A24176ABCC88ABFAF1F7EAB234B08FFBB0EE4A97E18563707FDA8B4F64380082ADF04358AB86B6F63A36E5EB763171C4DDCDE2AA9A39F32B344D35C509AE8A72C5093ECD6A23A002ADFAA3ADDE15C50064165CE0289E8F2537EDF73DDF7D833644F45EFC712E55E8166E78BC9722300EE31689E0EB86C176CE65D681697C992629E25F1222C9D95CA004E8A47BE99651916B719846E1199AD1D26BBDDA337ED588F3CC81DF774952D5747A53AE7CBD141B96E421886498018C0AC90D824BB1C3365506DAA0352F5782E035325D963B4717B214C9BEAD6AF36A40DDFB736C781D535D17B99996B52B773EB2789D0CB5E5D08D9E36A50F848BB0218C873D138C288BBACC211E638193CC0B0BA9CD503CC1A5EEB6381A71851790907C95C0897CB08E942AEC37A1403E7328B52CCEE802D69339FE7A0FB1363EB325A4031DBED242672DD367567765CB9F9FF403B70E5F5D87B1B56C0ECF2991A444B65D52C4DB223168D872A80D1F45DA52FA56F8717FAAA1C5F7BD3970246CD9D9850A52C73D2C6575563DEC0F8A3CC06A08BBFAAC673A3E2DDA0159511BE175291B942B8538A1C65585652BFC60451542F346D6D2A079BBBFEF3E636677D8D37BD1F5240F04DF632A64D77A325A55D8990698F2B8A3E3B26F6400F385F540ADE23702750DDC7C3D0268CEAC85EF7B6E92EC2B44840759A034A137591C16952BF5B6BA9CA7FC71725C2672DDC4951FBF5EE6AD3693C3A96836DDC2E95DA68732CEF7A726E4D134E8E5F5AD8ED2059BF0CC55E81C85F8BDA1AF582A7517C9170F1A08A3BE94ABF1A8664C55B4CD71BCC3AE61943F5346DDC5BD93A6019777459BA6D01BE34B620DE187399D8268F4FF8AC23A54A96A81D8C5DE585FA3BB55060905F0B6F519E7128DE011087CE6A710038F94375A0051D1AA77CA6CFAA71DCE838B6907793150940F096E58B34E447539ADF8DB72CF554655C68CBEE150EB165B732EA35CBBBAE5645A693FAE45FB3DB83A2C0C1FC1F5165ABDB16B84271F880B3BC0A3B393D3E3C3A9E4E3E4421CA2A0F66EA94FB9E7FDDCFCA4BF7E86DE1A58B17AB19FFB9BBAF6F8192650BC6185B8CDB297570B50B9DA9311736C7D0643EAE9EFA0A63D9A38817F1023F9F4EFF597EF77E72F1DF77E0D33793EB94CCC9FBC9E1E45FEE513161E4DBF809A5C1234A7FBB42CFBF835036311C5BFF1A1F608D37AD3FB0639F606F7D82FDE013EC5D0730EB08B7AA485E2384992D57863190AC23F9B72A4D0F1300DC5C3DA1B55EAE1E00819FAB0734E0E9EA85766B67570F60A29FAB5F50AF9C8EF36EF580487D5C8763020A37D1D70D738B1B2635AAF0413EB56BAA0FE286460AC311A4CEA7F3952ADDA68CB1C4AFF08A1F799790EBCC45E890D3AF70BADC5BB1049871799852E8BDE90D0E3A6E7AD95E9FBBEC593BB018ADC95417B7745F0955E26C096ADBE6D65A795BFA10744BA74B0F403DCE1A0EAC50E7ABB8B764E68F32049F473716C17D3E049B90381DEEEDBCB5DE8B1EA6AE7560F424E634AE597DC59CCE22933551A8FD3AF696366AB324B705587DD54F5606DB543F99C51B576A54583B46D9B5D76105731FBAEFE9C0DDB00F48EB66D81DA57232F430C29C179DB445763882D75C0F2CC653AE330EE7B6C58ED67472859E2F71BCCC1F4FA747C73FFAE26E5A1FA8BD6570C0974A378C87871D6EADDD81AD24D44AAB5F81E661FCD2458A6F3DAD7A321FD67EB12F276B7CAC7AB021AFA772895BD550F7800C5D1CBFFB632750E00CD47D0859D72A3F4A2FE858B5F53B4B2D9E9721143DA8BA63495CA6D4EBCC8A8370AE52DD9B26F18DEA7EB3D07A45F10BC32472D65F96C96F2617D9B738FCC78664DC92D128844FF5CAF2B8234ADC91F6765BDC9ADC0F3CA1BCDC82B6AE50C3DDE748DD8634E3F5AF2E4462702192A94B742E42D6D16BCDA4C8B5AC97342AE1CCB0179EB147A2F2AE84548574F14C47CA18C56251B937919920B6C63CEA06BB555C7D35F07C8AD69A7BBB37F815F981BF527739447051F2B0777413458A966C4114B951B80DED2D9141EF23C3645A4AAA56846187D5F82175A7580DB53234F2CE74F1E064102475E7D95B1AF177B54B1D84BC708D277FCD6AFC84BC98B02D3BEC8DD557AABDB187CC2C78E8EC2D157AB946ABFD7D7C68B0E1FD603F24EAFAB363BA13E00034DC99EEC6CEE5C6D270CDE034237E61F664B1B078636B755CF8F0E35E42B9AC2B6E6D11113C08EBC0D707705B6DAC751811B50D285DF5A50ACFDAA65E6DA23C2C9A4DAA26875361902471D6192890CA421D1E1C88688470705AF02F54DC0067798A42D1F5ED260DE3205CA348E80357D292F31663DB60F239E7788DE382A50ABDB4A94CFBBEFFC9AC01E756846918180F2F3D31D845971F8622F8D0F3008FCFFA2E68C3182E6637094412D0DE1F75F05DBA8E2B15FDA43AC8900585B200890FF296EE8D6AC26A6D7059AA02E96C4B7EBF97F4A48B0EB38BC4447D1BC76533B54325046AD2BE0BC6A28EA6BA8B44C09B85DEE96C91DB69644BC1C9E4724662319C6D2BCB67F8CC41988D2960CE000CC718BF44ACD318D8631CCEC3851D973DFCA88E52CEF20E3E6F1482932A6135CDA20506213CF343D3FE599CDDCB9A0E7AA06D509DEC39C87DA23AAAF255378B16F84EA94EF5DEE68E51DD8DCD532850D66A952A8CB00592472136F55D94BC5942A961447ADD3377DE29CEF23E4E51B9E9026E2BD4277BEB46CE6284B936CCF0BF151D76A187AD12A3DD2B45E3EEC26543245137769A1EA5E632EA3DF8FBA241BB778C6D8D7AB623F795542751AABC12DD2BD10D77D890BC49BD4F678DDDA0B82D9D34AC296EAB070DE8087A277196DA656A63838581E6B019DF0B7D1942B9ED1861011BAE3B892117AB54AE8DBD78B572936E71C72F45AC1E8FB443F54419FA97AC07D156C3CE5A9D3115AF310F4018DC2BA40D71702F860AD4411F9465954ED3496B20C16B81AA3747A1215A6567D11410C885AD02E8A5844A409EAA1A50C450113097102A0279AA8A40114345BC025EA88D2FA0AA922F67AC17A8682595825C758DA090A13A4E752454C8E5D75596C959532357CAD8455E3B24E9275F4451B358D05079F5A08758234D578D29CD3680B35BA750079B5D57B5B84FDAF596ADBFE0BC747363A25D9B2A16440871A9F325F4D53B5749D52DA67A69317DE55437E5D8027AF56E6A012DA66F01D55338B6A092C84D0DA84AE9EBA7EF83DB576FAEDA54AD5D95F04E5CE4F420535611CCB7E0F38DA421E5F44DAEAC2650C0DCA7C24459ACA34CADB1CB5007357899633D4EE649D294D58F22575CEC29FBCEB9C6FC71024AF2BBA9CA5885BD32E60580EA3D7BD5BE2E489CCC9EDE4425916FD5DCF3ED165D561AF949FA6D6710E8ADF37239A30430480E5D864166CA261D03A3CD9BC70110041EDA7BB514E3DE75D1F04AD26D837596B72E73027915B04C2169779965AD799174BAED0D92988E48A5C7B23B5A89909B7FB9344889C020DE75A004B9218C8C1C2C4C66F4973C707EF93C1D7D68442B757C54FF43534B41E6A15186F91C786818994F1DDAB3FFD0A84C0A246363657DA0D0B7B2CC44292ED96A6BA5604229FF834335DE3683230F04A3D30CC9275BD6951D1B26B91A56BFBA54FADA418648739C510643F5CE755A5DA199EF28F48ADFEFE0D481A3CC1C59A2FC1A83218F342CA2E245322406EDCC20C321BB012A41D88CDE03202808142738B51241AD46E00E614DBAE108C7280DEC30341D174270357927B3EA544C13C84F21D4D6C9ECEB262EFC73AB5FE7380B972DC409C18CABF03C2D685DE6227E48EA3B7FAE457511C1E535470B94A30F299961726225D9C5635961BC9C4ECA27890A69F81E2F2EE2EB4DBEDEE4A4CB78751F316FF514BA035DFD2733A1CD27D7A56F6CE6A30BA49961E1D27C1D7FDC84D1A269F767899BA502A2504A5067EB622EF3C2E97AF9D2207D49624B203A7C8D2EA53E0264D7F11C154F06BAB78DACDA4BBC44C14BFB78910AC43C11ECB09F9C876899A2554631DAEFC94F42C38BD5F39FFF1F8490A0B7122B0100, N'6.4.4')
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'202103031237056_pageOrder', N'MyHealthCare.Models.ApplicationDbContext', 0x1F8B0800000000000400ED5DDD6EE4BA91BE5F20EFD0E8AB2498B86DCF99E064602798B167F678638F8D69CFC9DE19B49A6E2B472D7524B58F8D204FB617FB48FB0A4B499454FC27254ADD3D310618B849EAE35FB1586455B1FEEF7FFEF7E42FCFAB68F284D32C4CE2D3E9D1C1E17482E3205984F1F274BAC91FFEF0E3F42F7FFECD7F9C7C5AAC9E273FD7E5DE16E5C89771763A7DCCF3F5FBD92C0B1EF10A6507AB3048932C79C80F826435438B64767C78F8A7D9D1D10C138829C19A4C4EBE6EE23C5CE1F207F97996C4015EE71B145D250B1C65349DE4CC4BD4C917B4C2D91A05F8747AF5F2134651FE7886527C70113FA428CBD34D906F523C9D7C8842449A34C7D1C37482E238C9514E1AFCFE5B86E7799AC4CBF99A24A0E8F6658D49B90714659876E47D5BDCB64F87C7459F66ED873554B0C9F264E50878F4960ED28CFFBCD3504F9B4124C3F8890C77FE52F4BA1CCAD3E987FB64937FCBA613BEAEF767515A94E306BA9A97831227C4D901FDFECD04967AD31008A1A3E2DF9BC9D9262A66E634C69B3C45D19BC9CDE63E0A83BFE297DBE4171C9FC69B28822D256D25794C0249BA4993354EF397AFF881B6FF2649F387240A938BC574326301663C42F3BDECE3AAB31771FEF6783AF9429A83EE23DC90C64C0B741BE611AE2108819145339D5CA1E74B1C2FF3473284E8793AF91C3EE3459D4261BFC5215963E42342BAC65AE69BFB7C9C8A705090C0D158151D8F55D1DBB12AFA61AC8ADEF9AFE80B7A0A97250F502D97E9E42B8ECA12D963B8AED86CCD09EE40A9CF69B2FA9A442D9B6933EFE6C9260D0A524E54256E51BAC439DBBC9359CBC1B47C0DB4A223676B10B6C6DBBAB0343327030331CF9314FF278E718A72BCB841798ED3B8C0C0E5709A48F012C5CB0D5A0ECF8F7E4A56781C165BD444D8EC3895FDED31CCF165B24C06AFE96384825F46A9698ED3A730C0D9E015DDE28C488E495C0871A3CC16A870B48DF8864C1B5960D9383D2C59F088FB49237BF6DF4DEABD42BD9BD4FB8D6DE3C851244781AA794DAEBC81926CA189B232AE8DBCC5E92ABB7EA08B4EDA52B688BCB9AA32429B9505DD1BDE2C26F9008302AA364B0A481A2C2B256BADB5640108A3A364D120BC9E9ABEA753D3A7150AA3E199F46291E26CF8FDF5E63189F197CDEA1EA73B73C4E8C075F963868E337762073C0BEEC813589857C630C27A3D27879E6FEB4571F4A9EB2A926EC315766EF139CE82345C5797743BB25A7AEDFCFCBA318A081D174FB33DBBAE1CF0E9EB015D55D78A1C1EC8578F83AFA5B328244D2AFE1EA9AAEB20D8ACD130EB4D90559F07381579E39D9DB94327015BE40B3A31BC135328E5A85BBC5A933677DF501994570EA1A88B19A5A2D27DD8B88944FF771C0CBF263F268B97C12B19EE1255C9187E4669584CAAEAE45D51435DEA8E5B8F9043E84A4ACEE2DAE2BD0EE53C760F399C057AE51C5B5DEA0C89F8DB1A39921E7215881BA6D5A2E9B40AAEF022449D49BFFCFA95DE157595A3F32D1DFE82E77318E15104E9E2B07B96623FE7DFCE67696BE2FE92E4E143185099BF238D4390575257D4F52DC369EF2B1C204B0E77321B650FBAC259368696DBE77ABCC8BE62D4C07C4CC8D683E20E28E738C2A03DDD81BEE255182FDABBE4AE486764384714958BA520950F2023B9AB4AB522819029480162895E1BFF87F53AA268555B2CD9236B3679C0C1BC3248455D9FC334335D761D1D1E5A51A223FD5F226F351B2AC24FB811763EBEE4EE4DFDAF248CCF4B61B927332BFA4C3672B2607C70C6180579F8847BB3B4D1EE56E79BF53A49099D8E666F65D2641EBFFBA3AF5ACE92F8214C57FDB7981B9465BF26E9E227948D302538D8A48451CC73B45AEFB72A565D97B7A9B9FD35F94C165D927E8A8BAF7AE35D26C12FC926FF142FCA63471E884CC112C04B733E040191103F1362C68BB36413E7FD24E762E7357078DBF5D7F97EE42C42E14A6198C5CA08777551609D252D211AFCCA8BC9E4205D532F936518DB35B52EAA6E6A55C2D8545ACCB5A905985D4B69497543CB02C67656A57C4A96E52479122F4BAC571953C306FA1EC2CB111EE5245ED6F4338A36BEABEA4AA8E512F544A825D6D608B5AC9D243F85E5F17966FEA22E4CE0ADCAD7A4E6BA1CB896A90F24C73F0E711462BA3976E5EECBB32B25174CDC132117505BA3633995498B16EDEC42903E78665DB71F45533579E61DBF28775715566EFA4D19D3BEDF16F4B5F57BA2C1ADD2DFAE6FF87E6F39B2F94BF661B10AE3BEA79B62CE06B56EE4EADBF6D1E706A7AB302B48522EAAB7F9A294CEE7092610420157BF8962791B8F10E5D2A725A5DCA42DA06325A0543F57CCA6D35D59488BF0CA3D14751576ED6912455EAE889C2F403C7106D77AA328F995FCD797C5D9B1B7777EEEF33BDC0E38B11C7E412B79526F257CA317F5A08BA7587E96F7E423CA309D475E5737356C9B1FFE8E9E39856F1FA5E7224C71907B03FC39C4BF760273F26E231CE7A6CFC4028C577EADA86B1CD385AFC9261FBE16C2D2C6E90E25AC11DCAE97F83A05971ADD8E92058C4053D67268B902154E707475DD5585580F389827757F630AB8DE61171FA95DA2ADDB2573869636BC1313BB4C969D9917F9F6956929EAF2A2CDBF7D4C8169D27076F5D07E61B85A92E57204ADEC5826689F9E8BE7D7FC1FF3552BF74396254158D22660F1BC8B2FDBE44FF16262E1EFDB8A7FC061FF8A2CDCB038E092B69C4E0F0F0E8E8411D1C3377CAB8507CE532CBC884D563A4E8BA5860ABB0772BE45619C8B6C218C83708D227333B84F2D794A311D4D257CCE395EE3B86007E631B6A95DE34F5C34A3A98D637AA6813A9901CAD11394D20B5635ED6697D876EE79E76F27FA32BFBA311E9199DA3202A599C67D5FC84DE656A92601AD8F252434E028CD52C0EFB524A67D24C58ABEF851BC8E2BA3E04975ED435804CA02B410F716C2F3175E4853D38751E8523347FB4194E2634A2A82D1BCD3D7124BF36E9313BBD33CDA341E9F5336620442528EED7E1091C1234ECD82ECDCE320AFE37D395D189E9D4B6A5B1BE7D7B77BDCCFA643A3B0419B79B46988E0D3B91D9E28B76354722F835123E08EBC2FC68024656C9F84E0E5167DA625D68DDB6A076D0C96AB1D159B0628AD56B641A3D480D59606786BD65DA351CE8C56DD3E6ACC370A8DB283B6051A654765E76954504EAA665FADA904E21F3015B0DFF4D56617528AAA8C99B4F0DDD628B0BBB0580232230CEBF60EBF4225D61FEA056A31A41ED6A73862E32E4F71486CEA971B336E670769CD0C2D79B4C4E6B027115854E5BE7CB72FA79B3A33FE46224CDDBE11AB613F31B8C4EC9AB063B3338DC74AC511DB82A4C30CC9CE0B3AA2C7BF6AEA35EEFF0AA32407AEA97E39604B24DF891495BD18810C95D3B3F324289858A888446D07C2AA451B4B2F7BFA539B7258414B2F893BEB45650D19818254C36B75914B8D824620A04AE75E6A70C318A7E22E7B7E5FF6A478DE54B09621844E0D6632AAD1E729A2009FE39CD5314C27ADA69F57170834C5223457DC3210A01830C00075BF8002F20C28BC665780E20B18F160C003091AD0EF19A098FB53191877A56D6C197BB12B6F1E7F256F002D5F4B9321D127EA0C9F43162D4361374F0318F58410E992DF240D38B28B530B5C7AC1EA065EBBAA9BC0E9CD981B38352237615792A801DA02CB0A8771BB11573FB817320155068AD2A5DFEC49068CF94B96E315195B1950695CC80100062C6144F07D65505213D480DF1BEC6C9E9A6E304C50D868EC2C9C001864CCBC38C8F6DC6254D4AFD28B436367BBC374C968BD03FAA567E176B0C30F97F4996ED958190D4FB81EE94C4F9851823B97768C74C626430D902450943838060308F6E0AE3481005D50C83406A0E18945FF68AD8C6AEC95FADC645BA9F5193A12E40C2D315929F2013E2F16F5A72CC54B3712F2B2D0256B2F87386D32E815155E7464A6D7FC42A2950B30DE07AA165ECC03255368BAA8347B0D14A77E540F54DD9FDE03253AF28943A4D7A7D969D4207F8172956670943A348045DBEC935EA0ABB2965C54BA3507ED9AA9270E9A3035AD0C3046DCFB10C655A550F2B8A9791C7BE8A6D81996A6E00B5A6616645A647A35432F06A45C6803D194E4CD5A717C0CD7DC9617DDA033DC595E333EEAAB6DD33077180CD15D4D7E3453DFB7DADDB8425E5C1D4D0D0732E9E5AA09453300B5EF4D730FD8E49DCCE6C1235E219A703223450AFF9F0D8A2AAFB83AE30AADD761BCCCDA2F69CA64BE4641D1EE3FCCA793E7551467A7D3C73C5FBF9FCDB2123A3B5885419A64C9437E1024AB195A24B3E3C3C33FCD8E8E66AB0A631630CB8FBFB56C6ACA9394F49CCBAD1E842EDFE33D4739BA478523D2D962251493DE7A2A6E01EA2AD98B4D71D6EA8B81BA7CF137BDFED2BD8723C76B07F533E9E7AAB86C2EBDF524870EE14BF2ED3C40114A79674D68347C96449B556C614DACC6A35EBE108926D963B4E138214C9BEA80844B5DD51187D4A43A231D4B91049F5D0BA4B752A4B71D907E9022FDD001E99D14E99D0CE964C691A2A0AB10885FD012B26BC96AA581B3B0AFC5A63CF05B2C37CDB7AAA1E6D799DBF26ADF7786186DAA3D5211C65EB25841B21B16599E0AB836C71E11C4BD877020D91E0B44B6875820D965A1D4B1EBD98552A73A304A21383DC33385DC4EC8724E2A2D608FCF459C67360D36CB1E93C6958758346967584F7B5FEE8BF328112D388FE6DB7FCFAD9E3E480F6168920315D681B3193AAC131D56087C8D9D196998B13394CD29397C91B71ED682C64D00FB44E84CF42B88C46438E0C107C9183C98B14324063444FE08ACB588E8425D9AAF8791DE40401006A44DB6C782E19421184C7745831193454C98EB228D3CE7BCF8F12CDDD77D2FE72D913AA764F245EC5AAD9B05B91BBE1F86E025B183850D9ACD1E5DFCA8C20473D24795E870C428C30033A78B3265C883DDD63839AFA3F5C7CE390BB22E3CDD04310C9DFBA045C1E759B952768ADD51333E5F445019FFB9CFBCE2BB61A6BB0DF40A31DA547BA436922B446A53DD04CC2634242F603619C30BAC5B22435685E4428D1759F1F7F5C36F756409E17FD7813CD5EFCBEAE6A01F95D67E081041E59BA0461177ED6D6CD4CDEB76EC82A389DB5B257510556696689A0B4A134495056A92DD5A54C751E55B55A73B9C0BCA58AACC5920115D7ECAEF7BAEFB1E7B86ECC5E9FD58A2DC63D2EC7C31596E04C0BD29CDD30197ED82CD3C2FCDE2325952CCB3245E84A5B35219074AF15638B32CC3E23683D02D22B3B5C364B77BF4A61DEB9107B9E39EAEB2E5EAA854E77C393A28D74D08C33009104A9815129B649763A60CAA4D7540AA1ECF6560AA247B8C36FC2F846953DDFAD546C6E1FBD6E638B0BA26083033734DEA766EFD24817ED9AB0B217B5C0D0A1FB0570003792E1A4718B8975538C21C278307189D97B37A8059C36B7D2CF014232A2FE120990B517719215DC875588F62FC5D66518AD91DB0256DE6F31C747F62885E460B2866BB9DC444AEDBA6EECC8E2B37FF1F6807AEBC1E7B6FC30A985D3E5383A0ABAC9AA54976C4A2615505309ABEABF4A5F4EDF0425F95E36B6FFA52C0A8B91313F194654EDA30AD6ACC1B18C694D90074615CD5786E54BC1BB4A232C2F7422A325708774A91A30CCB4AEAD798208AEA85A6AD4DE56073D77FDEDCE6ACAFF1A6F7430A88E1C95EC6B4E96EB4A4B42B1132ED7145D167C7C41EE801E78B4AC17B04EE04AAFB7818DA84C121D9EBDE36DD45981609A84E734069823732384DEA776B2D55F9EFF8A244F8AC853B296ABFDE5D6D3A0D6BC772B08DDBA5521BB48EE55D4FCEAD69A2D2F14B0BBB1D2441D439F616A44976C3122CAA142F4F6D6D258067567C2D87E27116F76520FD6A18F2176F445D6F43EBF869CC0AA269E3DEF0D6C1CFB863D0D28D547D697F41EC32E662B24D1E9FF059A74C955C523B2BBBCA1EF5776A01C3200B179EA73CE350BC29200E9DD5E20070F247EF400B3A344EF9E49F55E3B8D1716C21EF722B1280E079CB1769C88FA634BF1BCF5BEAF5CAB8E396DD2B9C6BCB6E65D403977783AD8A4C27F52D42CD6E0F8A0207F37F4495DD6F5BE00AC5E103CEF22A84E5F4F8F0E8783AF9108528ABBCA1A983EF7BFEA5402B8FDFA3B785C72F5EAC66FCE7EE7EC3054A962D18C36E3106A8D459D62E0CA7C6F4D81C8F93F9B87A362C8C650F2C5EC40BFC7C3AFD67F9DDFBC9C57FDF814FDF4CCA2DFFFDE470F22FF7089B30186FFC84D2E011A5BF5DA1E7DF41289B7890ADAF8E0FB0C633D71FD8B14FB0B73EC17EF009F6AE039875B45C5554B01142D6962BC31894D691FC5BF5A88709002EB39ED05A8F590F80C067D6031AF09AF542BBB5E3AC0730D167D62FA8574EC779CA7A40A4FEB2C3310185CBE9EB86B9C50D931A68F8209FDACDD50771438387E10852E71FFA4A956E53C658F55778C58FBC4BF876E65275C8E9573870EEAD58024CC23C4C29F404F506079D40BD6CAFCF5DF6AC1D588CD664AA8B81BAAF842A71DC04B56D736BAD3C377D08BAA503A707A01E670D0756A8F37BDC5B32F3471982FFA41B8BE03E1F824D481C18F776DE5A4F480F53D73A437A12731A37AFBE624E6791C99A28D43E227B4B1BB58993DB02ACBEEA272B836DAA9FCCE28D2B352AAC1DA3ECDA83B182B90FDDF774E0BAD807A47559EC8E52392C7A1861CE234FDA223B1CC103AF0716E375D71987730163476B3AB942CF97385EE68FA7D3A3E31F7D7137AD3FD5DE3238E097A51BC6C3C30EB7D6EEC056126AA5D5AF40F3307EE922C5B75E5B3D990F6B0BD9979335FE5A3DD890D753B9C4456BA87B40862E8EDFFDB11328702CEA3E84AC9B961FA51774D2DAFA9DA516CFCB108ADE58DDB124EE57EA7566C54138B7ABEE4D93F85975BF59683DACF885611239EB2FCBE437938BEC5B1CFE6343326EC96814C2A77A6579DC1125AE4D7BBB2D6E4DEE075E555E6E415BB7AAE1EE73A42E489AF1FA57172231B823C9D4253A7723EB48B86652E45AD64B1A957066D80BCFD82351795742AAC2C378A62365BC63B1A8DC33C94C105B631E7583DD2AAEBE1A783E456BCDBDDD1BFC8AFCC0F7A9BB1C22B83B79D83BBA8922454BB6208ADC285C90F696C8A0279361322D25552BC2B0C36A7C9ABA53AC865A191A7967BA7870320892BA06ED2D8DF8BBDAA5CE465EB8C693BF66353E475E4CD81AAFA3EE47B4DAE3C851655F7EA5DA607B08DE829BCFDE92B297BBB8DA69C8871A1C5E32F643A2FE433BA680015E44C31D0C6FECFC762CADDF0C9E37E2176677180BB339B656C7850F3FEE25D9CBBAE2D61611C183C40F1C8600CBD6067F87215ADB08D7555FAA78B16DEAD526CAC3A2D9A46A72C215064912F89D8102A92CD4E1C18188460807A705FF42C5357296A72814FDE76ED2300EC2358A843E70252D396F31B60D269F738ED7382E58AAD04B9BCAB401074E660D38B7224CC3C0B889E989C12EDCFD3014C199DB423C3EEBBBA00D63FC9ADD2490C6287608EAE0BB741D577AFE49751A220B0A6501125F082E7D24D584D51AF2B25405D2D996FC7E2FE94917AE661789893A488ECB666AAF4C08D4A47D178C451DDE75178980B72DBDD31934B7D3C8968293C9E58CC46238035996CFF09983301B53049F01188E31A08A58A731D2C8389C878B832E7B89521D369DE51D7CDE280427D5E46A9A450B0C4278E697AFFDB338BBA73E1D9449DBA03AD9FB94FB4475546FAC6E162DF09D529DEA01D01DA3BA1B9BF754A0ACD56A6618610B248F426CEABB2879B38452C388F4BA77F7BC539CE57D9CA272D305DC56A84FF6608E9CC508736D98E17F2B3AEC420F5B2546BBA78EC6DD85CB8648C280EC343D4A6D6ED47BF0F74583760F2BDB5A066D47EE2BA94EA2547925BA57A21BEEB02179247B9FCE1ABB41715B3A695853DC560F1AD09BF44EE271B5CBD4C6462F03CD6133BE17FA32C496DB31C202866077126B3056A95C5B8CF16AE526DDE28E5F8A58BD406987EA8932F44F6B0FA2AD869DB53A632A9E741E8030B8A74C1BE2E09E1D15A883BE4ACB2A9DA693D64082D702550F97426BB6CACEA22920900B5B05D04B0995803C5535A088A122602E215404F254158122868A7805BC501B5F4055255FCE582F50D14A2A05B9EA1A412143759CEA48A890CBAFAB2C93B3A646AE94B18BBC7648D24FBE88A266B1A0A1F2EA5510B1469AAE1A539A6D0067B74EA10E36BBAE6A719FB4EB2D5B7FC179E92BC784DF36552C8810E252E74BE8AB77AE92AA5B4CF5D262FACAA96ECAB105F4EADDD4025A4CDF02AAA7706C4125919B1A5095D2D74F1F19B7AFDE5CB5A95ABB2AE19DB8C8E941A6AC22986FC1E71B4943CAE99B5C594DA080B94F8589B25847995A6397F1126AF032C77A9CCC93A429AB1F45AEB8D853F6B1748DF9E30494E4775395B10A7B65CC0B00D5A3F8AA7D5D9038993DBD099322DFAAB937E02DBAAC34F293F4DBCE20D05BE7E572460960901CBA0C83CC944D3A06469B378F0320083CB4F76A29C6BDEBA2E195A4DB06EB2C6F5DE604F22A829A42D2EE32CB5AF322E974DB1B24311D914A8F6577B4122137FF726990128141BCEB400972431819395898CCE82F79E0FCF2793AFAD08856EA80ADFE87A69682CC43A38C3B3AF0D030329F3AD668FFA151991448C6C6CAFA40A16F659989525CB2D5D64AC18452FE07876ABC6D06471E4D46A719924FB6AC2B3B364C7235AC7E75A9F4B5830C91E638A38CCEEA9DEBB4BA4233DF51E815BFDFC1A9A34F9939B244F93506431E695844C58B64480CDA9941864376035482B019BD07405010284E706A25825A8DC01DC29A74C3118E511AD861683A2EC4F16AF24E66D5A99826909F42BCAE93D9D74D5CF8E756BFCE71162E5B8813821957317E5AD0BACC45FC90D477FE5C8BEA2282CB6B8E1628471F5232C3E4C44AB28B17B7C278399D94EF1A15D2F03D5E5CC4D79B7CBDC94997F1EA3E621EFC297407BAFA4F66429B4FAE4BDFD8CC47174833C3C2A5F93AFEB809A345D3EECF12374B0544A194A0CED6C55CE685D3F5F2A541FA92C4964074F81A5D4A7D04C8AEE3392ADE1D746F1B59B59778898297F6052415887922D8613F390FD13245AB8C62B4DF939F848617ABE73FFF3F5164F88EEA2B0100, N'6.4.4')
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'202105301400368_MAR_Form', N'MyHealthCare.Migrations.Configuration', 0x1F8B0800000000000400ED5DDD6EDC3A92BE5F60DFA1D1573383336EDB39199C09EC1938B633F19C38366CE7CCDE198C9A6E6B8E5AEA91D4898DC13ED95EEC23ED2B2CA95FFE14FF244ADDED630408DC2455248B1F8B5564B1F87FFFF3BF477F7D5A46936F38CDC2243E9E1EECED4F27380E9279182F8EA7EBFCE18F3F4DFFFA97FFFC8FA3F3F9F269F24B5DEE0D2D47BE8CB3E3E9639EAFDECD6659F0889728DB5B86419A64C943BE1724CB199A27B3C3FDFD3FCF0E0E66989098125A93C9D1CD3ACEC3252E7E909FA7491CE055BE46D16532C75156A5939CDB82EAE4335AE26C85027C3CBD7CFE8851943F9EA214EF5DC40F29CAF2741DE4EB144F2727518848936E71F4309DA0384E72949306BFFB92E1DB3C4DE2C5ED8A24A0E8EE798549B9071465B8EAC8BBB6B86D9FF60F699F66ED8735A9609DE5C9D291E0C19B8A4933F1F34EAC9E364C246C3C27ECCE9F69AF0B561E4F4FBE26EBFC4B369D8875BD3B8D525A4E6074392E7B059D10677BD5F73F4CD8523F34002138A2FF7E989CAE233A32C7315EE7298A7E985CAFBF4661F0337EBE4B7EC5F171BC8E22B6A5A4AD248F4B2049D769B2C269FE7C831FAAF65F2769FE90446172319F4E663C819948A1F91EFAB8ECEC459CBF399C4E3E93E6A0AF116EA031D312BA0BF308D72408C0C8A4994E2ED1D3271C2FF247C242F4349D7C089FF0BC4EA9C87E894332C7C84704BAC65A6ED75FF3712AC20185C0C158151D8E55D19BB12AFA71AC8ADEFAAFE833FA162E0A19A09A2ED3C90D8E8A12D963B82AC56C2D09EE99521FD264799344AD986933EF6F93751A502827AA1277285DE09C6FDED1AC95605AB9C6B4A2A3646B286C4CB67511696649C630E2364F52FC371CE314E5787E8DF21CA731A5810B769A20F809C58B355A0C2F8F3E264B3C8E88A53511313B4E65FF780C73FC29592483D7F43E42C1AFA3D4748BD36F6180B3C12BBAC319D11C93982A71A38C1653E1680BF135193632C1B2717A5888E011D79346F7ECBF9AD46B857A35A9D71BDBC61153244781AA794D2EDC40205B6A2254C6B59177385D66570FD5A4035BCA17819BAB2A23B55959D0BDE1CD648219CC1450B519280034182A05B5D65AB36080D151B36828BC5A4D2FC96A3A5FA2301A5E48CFE729CE865F5FAF1F93187F5E2FBFE2746B4C8C0E525734337492B993381045704799C09379150C23CCD73362F47C59CDA9E953D74593EEC225766EF119CE82345C959B745B325B7AADFCE2BC31AA081D274FB33CBBCE1CE6D357035D55D792180FE4ABC7C1E7D269149226D1BF47AAEA2A08D62B34CC7C9374D5A701AC226FB2B3B374E8A460CB7241A78677120A851E7587972BD2E6EE0B2A47E5554228EAE2B8442BDD85859B68F4FFC4C1F073F27D327F1EBC92E136519582E117948674505596778986BAD4BD301F5909A12B09D8E2DAE2BD8C7291760F3D9C27F42A39363AD53988F85B1A05480F390BE405D36AD2749A05972737D6C0E73D26F6C8A7AF5057D4358A5A7B8383249D8F62F45E3DBC0FD3D628E86CF4DEE2A711B6BB9661466178564CBBA1358B1CA53941CB6A94DA3EA0208C08FE46C1D7598816719285C3EF1C9E26CB259958C357741245385D84231C365E3F3E676110A27894A1DACCD6EB259E8741B90C822B629B7F7F89527605E47324BD4FC8763D2AFA4CA4381102719811A98DE7AB54D1BECF5777276797179F2F6EEFCE6FCECFAE6F3E8BED844B48ED5514736D3791250F0F604B8B1CB1714DA2D49E36A7978ADC0E43671DA1A1F0AA2A28EA1A453E1028F853850B18F699EEA282AB9006EE62E80C3D9B2591501A6E255748DB60BE64F7B67F24753834BE2A6E687D51CAAEF965D17EC684C0DABE328352D998DC289A11C6B88BFC60BF1D4B8E10667916231DC6BD4265DF812FC8BC8EBCE5C8536E6D6AE865CDA7EBE8CB945E550615C83AACE68051DFDB9ABF88C3BC74C71A5A7D6114D1C1375550364A351901EF18BB130F0FA30D5351DB6DB8885179A56A3C4354A1917636F0448DC9600776129D95B5D74D5A161FBF0AC8E104E42866D98073653451ED3C290D7B19E2D49377393AEBA8A8F3195FF1F5EB74534D37CA9D2FE9F09EAC1FC2088FB3F54DF8709A623F8E7E9D9D06EDB5F0240F1F5CB7EA448CB3445EA1AEA8EB4B867B2F2DACD3CC702E68A31CB65FE22C1BE33A9FCFF97891111DBF21F33E21AB0C8A3B5039C31166DAD39DD00D5E86F1BC3DB9E94AE994B073C4F59D4E0558EB6604C97D598A51B8C54C59D7964AF45AF84F56ABA8A256B6A59BC22D907915908ABA3E846966F2EA3DD8DFB742A223FE3F216F351B2AC2DF70A3ECBC7FCEDD9BFAF7248CBD6CC1D03E93859C4C181F923146411E7EC3BD45DA684EE4B7EBD52A49094E47BB586EBAB275F8F64FBE6A394DE287305DF65F62AE51967D4FD2F947948D30243858A7445010BB6DB9DA6DC707755DDE86E6EE7BF2814CBA243D8FE957BDE97D4A825F93757E1ECF0BB3230F64A16049C04B734E828068881F0898F1FC3459C7793FCD99AEBC06096F3BFF3A9F7E9F46285C2A6EA0F33AC27D5D94B9860E9690239BC0C55C0F973F258B50E1FA22D650175537B52C616C6A55CCB5A994985D4BAB92EA8616058CED2C4BF9D42C8B41F2A45E16B45E754C8D18E86B84171C1EC5122F6AFA05456BDF5575056A31453D01B5A0B531A016B593E46F61613ECFCC5FD4850979ABF235D45CA783D032B54172F8D310A610D7CDB12B779F9E5D914C85B8272053521BC3318C32B0286D671740FA909975DD7EDC08CBC133AFF8B4DC7D5958B9E837654CEB7E5BD0D7D2EF09831BC5DFB62FF87E7739B2DBE78C5E1289FB5A3774CC060DE3E076263DB8E9738DD3EA6A0DACAAB7F9B2962EE6493EEB520157EF793ABD8D264431F5AB92A034690BE8440953AA5FCCC9A6D35D45484BE1557A28EAA2017CD284DEFCF130439D37403C4906D77AA328F94EFEEB2BE2ECC4DB5B3FFBF91D76079C448E38A19532A9F7217C732EEAE12CBEA2E5677A4FDEA30C57E3289ED54D0DCBE6C93FD19370E0DBE7D0731EA638C8BD11FC25C4DF3B11730AE34724CE759F816568BCCA6B455DE3B82EDC24EB112EEC1291364E772A600D7F0842907B95329B1ADD4C494A46C294B51E5ACC4045B4BF6A76DD9785F8507F6C1E18E78F2BE0BA874D3F52C77EB56E1714F5156C782721F6295974165EE4DB57A1A5A8CBCB69FEDD63CAB8260D174088F55F18AE9664B118E154762C17B4F327FACE8C7F335F35734FB22C09C2029B8C88176399F24D3E8FE7138BC0A6ADFAC74426BE241337A4062E69CBF1747F6FEF40E2889E7C23B75AF24C94389EBC4C9BCC749CD2A986A8DF03B16F5118E7B25808E3205CA1C8DC0CE1534B994287A3A944CC39C32B1C537160E6B14DED9AC0A9B4194D6D82D03331EA68C620470F2865B84FD5B09B637FB6632F46B975C29739BCF8782033B56504A499F8BE2B7083E247AA21A00D26C9028D8908CB23E00F5A8869A3C15BE14BE4E2555C3A054FCA6D1F22225016A0B9BCB610993FF7024D4D1F46C1A5668C760394F2AB112AC0681E246AC1D23C50E124EE34AF538C27E7948D1801484ADEEE06880CA1FFD422C82E0E202BEBC4A0952E02CF2EF6665B9B10C070FBA49F4D8746118336E368D3102978E546E02C04F251014A15D5A705107B6FDF1EA8AAE0600C5D1AB572DBE008377B04F8C1E3605371754F7AE320E3E306D9E042119FC9067A86B5D81CDB09ACA58C78A405795FE694C1759CDA2DC47F1A8A3D7CEC28B09A2A32902F0629223BA85A6D0AF3C01C8801016DEC4597295EE0968B307DF3471065FA71DA7691D6463650E1030873D042A20A08628F362000E496034C6AF108989278BEED30525C23511A8F863B258C712A5E851D101EC6F60190852F5498E643376357CBB4312C5E2D576C1AA0741ADE0446ABFB43B618102F136D1B46855B4CEAF655772946C128CFB40D6094E7CAD66354F20D538DBEDA518CD97D633C35ED5768B5D72B88A8D297DC978E0CBBBD5A4C01C807D6BABDC3CF50C0F9563D412D58EA617ECA1C1B777ACA2CB1A91FBE4BB29915A4BDE56129A3812B1F3D41605195FBF4DDBCCE6DEACCF80B893474BB0656C37A62B891BC6DCA8ECDCA349E289539B6014D8763C9D62B3A72C025E5FE943AFA92C227DC65F34B19B8694390EFB607A6EAC518DB5FAAE1D97A084A1EAE2A90A8DD7079AFB4C6D1DE1E7F6A4F5A2BD2E0C67767B734A821232048C55E9BAA6B9FEC110054BA3C160E74618C5379953DFB5AF4843EA32B392B13A057FECA59E55029228212BFC539EFE2319DB48E96A2B78684299E42E361001161FC320C64186F4B890A9367A0223AD649A4C402467A8D130FD430CEBDCA408A3BBE8688091E05C696F1E7EA70F3448F0803D122F0B044A6D82D377DC93E772553604ED4AC0995A7861A5A65016B7AD5299B866055C240117C414BA20A9D95190857671C12A92ADDA2A348D53F64D3AB667905FBC3293E0662D5256259A6880A8E810EB4E96D41B7DA1C77235E47793211AF7635DD8857F72F4DB44B2BC240DA8296151DEEC6BA2CB9993D3D13A1F26E0F28B61B7DC284FD67329B9684B710A1E25E8E4080593C8145847D839D2929AE272ACF464975525D1768BAC12D6092926077398021C62EAAA22ACFF7DC822B4A57768035766EEF5C978C8EEF4CBFF4CBAF1DD9E1D905B96283BC32FA6C0B3DD2796D735C62B50E2D8F747EDA433148760B069863F01DE6375D94DEC34C1714FAA881D0F060D13F6C0DA1C6DE1F56186C2B8F580E47928EA80593950F2C435F54697B73537C2551E69ECEFD92EB8DC20193693DA7B26AF8A270B96429215995E9D77941C7D5F341E321A8EC08EC23D8933BB04B204814D4DD3DF1AC52E32D9906780E9A3BC8FB0EFA621BEF2A0852854D1477C6A95E7F929966E34DC86F75EAFD09996E8196948669060F42EF3392798D47E68BC2A18D6BB0ECD2C6B41134EB149F0FD64555585E6041B7F0BCD21EA508BE574C572A7351B7B0EBFDA45835013619BD33AA3617CD8C82DC7FB49D131C807A314A70D65133AAEE4F6F46C951876416E9BD4FB80E29FD4F588D8EB56435CC517A9C30B4AA36FBC40BE360A2878BCA134535C2802F8AA92716A4CC5819804742304BE3AC52B844E8E682EC14E1D8433BE2E3608A0DF76D1641A649A63F94EF258094136D204C010FEC003A8DFE50D8F25898D764D8DD539D0EA33C0836B1B90333E4D83AF06698FA74D2EE7C9295C5E566A0610B0C3C8A3451D130A00E14D29C9A357947B3DBE0112F51957034234568B092358ACA103E75C6255AADC27891B55F562993DB150A68BBFF783B9D3C2DA3383B9E3EE6F9EADD6C9615A4B3BD6518A449963CE47B41B29CA179323BDCDFFFF3ECE060B62C69CC026EFA89677C4D4D7992929E0BB9E5EB55C5E3416728475F118D9A723A5F4AC5C03342C5BE6B5D257F0C288F5ABD155B97A77F57B6972E782F4CAF65EA07D2CF253D9A2D420B01DB3CD297E4DBDB00452815234BB1379C4F9368BD8C2DAE3EABE95521C9584A55923D8DDBF5D75C26D3A63A50C28567C78140A94975A674085292028C59507A03527AD381D28F20A51F3B507A0B527A0B513A9A0950944EF625F00BD2489C4B56338DD97DF435D9945BAC16D34DF3AD8AD5E23C739B5EED63542C8D36D59ED2C7648981C9CA24BBD122D35341AECDB1A7F88FC730C7C4A84A78724CB23DADF7110A7E956931C92E13A5384FC9C48952A73A08CAF6F0019299526E27CAB024050BD8D3BF267CA30A06D06C21CB9E66B16EF1B4AAA4AD113DED09A52FC9A3A468217934DFFE3697FAEAF53C964C95E480C2F93CC59930B99B448719C23E1DC7719ACDD81A640BC7CABEE0AD276B817113815D023AF754374B89CB70A0C7464FE7E8B1195B0431E64CDE1FC05AFFC12EE8D27C3D8CF6C6BC5ECA116993ED699D4621E915FD9B27C6A6BB52BB0A82F50AC99892735DB491A75C543F9EC075DDF774DE10D485637D5F60D7FA3958C0DDF0FD3080E72AA5FD0416683E7B74F5E39FC4C895B48F32D1C1C448E6CF827551A40C69D86D4C928B5E31FEC4B9E06FDD45A69B480C83731F589402B42967CA56893BF808BF1B02A8ABBCFBA0835F0D33CEF272EBBAD0DEE020498536D4696EDAE4D5C3FB301555092EC3655BE349DCD17872339CAA93E132563D6F3E71590E6DCA519A93B15EC934852C7B9A1F5010460437F238F2390E2311A2459C64A1603432C90E4A58B2A4001748B5A90EE3419FA45A84E23E1593EC62CC3E676110A258669A90F5620D64D62DCD9BAC6B2FF57410799A8FB755F25571AF58128A50585B30CE0A5FD0BE430D91751A6E988092E5F4BB3096B40936DD65D17916171B50C5DDF8E0A97C52FB8E1E48D769F81414C6193F5AB9783AB3DE26310B39B4FA1A45E042A1FB40DA101946FCBA084F9DD2286B8B4EFB57719897B76AB89E34A90EFD61AEB44AC876DE63BAC1281329D5692E54B275948B54CA3427B5F5E101669490E548F3365CC488621920CAE46DCD6C2E1DB47DCD5F909AC594557CB7BDB3B4BFA2A5028A0E23FE66FC06577FE477D1471D977AE0BB81E0462BFB9246B2082D531DECE230C2804DDCA4BA2D32A72986CFB99A8CE1CFCD36A7C2309EAC2E68BCC8E8DF570FBFD36A310CF9DF775160946FF2EAC6A01F4AEBE0412C055540213515F9F06013E705CD8B80FC84AB1237374BE8A3C7481CA52ACD854A190F4B22D424BBB588A8F2737183874D77D9199B8BC79C891CA7ABF8BEE7BCEF636200AF74EFC614151EE0E6C78BCB720380F00EB7880321DB8536F724374F97CB02699E26F13CA4FC9DFC82A2B520B541AA672175AA20B84564B4B61876DB87372DAF476672C7355D75A5ACA36FBF10C4C77DC48C14861112C50D0A48496C925D4EBB21526DAA03A5F2C1618E4C99644FE3EF49081C5CB5A96EFDBA4CE604E0E222CAE7B8186028C8C36FA2946B5237E37C74BB5EAD9294A804B0DB02903DAE2367F101113D0F61BA144742CC73717CCEB2EF493AFF883281897C8ED3BD8B754AE7758E962BE9F2059B35FCD99A053D0547E1120E9AF9F7E403C173929EC7D46943A02EE73ACCC724F83559E7E7F1BC3017F3409894727607DA409BC53C8793DB20200AC80702513C3F4DD6B1E8142F67BB5962B2D46D53B766C53D01A3100CB40297E1EE7A2FC30A32DB6C53174D960D6B26D99156A1E201C4AAF46DC59732C484177C95110F7BE34B41462D9D487192F62D944C7021CB6125A8BEF9190B07C15CC65028DE0EACA8620178810A1491C11D293095614549FD84027776A6785661634339D8D8F51F37B731EB7B87D4BB9192DD3E67D4D14FB0E8D974372C29AFB74899439CAC6DEA72331388C7174A5B9A5DAE376B3E1E069BF45A639A50374571BBB74D7751A66500D5694ECE94C977F29FE44B59A5BED84B5B6518115F4864E319BB4351FBF53058F471607443AC402C4AB0B5DBA6D267F40D684A9BEA36BBB0685236892E1B210B7C954A8A2593EC464BBAD8A5782E6263338189AFED6B3AD0A8DCEED300FC6A18F8F77717BB7B4CA553C93A6DDC1D5EC2B60560062DDCA0EAEBF4F7FC89865092160126797CE0F3B1A1549EB552685D57175A89809BAB338D83A5F4245484E5955969355918BAF0CB354C53FAB452F9808F378F606D53DBF3B98BECF33A8A8EA70F28CA248C6B7821C615F303AF2A526F0F7C55141C9DB16DC78E0B61BCBD10E36222FF8631762D855575359FEAEFD43692C19C07864CA4DE134F0C390F78921AE78622B17102771C5B68068014C3502CD2ACA0554AF3BB896158C50FE4021B16DDA3610A8B6E65552C4331A06059643AA937426B8D718F16D8BBFD57544650680B5CA2387CC0597E97FC8AE3E3E9E1FEC1E174721285282BE34A56A112DF892F9459C54E3C78436327E2F972267EEE1E819152C9B239172283D1796B13190A3B78F4339660560F2EF3349C3A88C3D14CA470246294FDB87CF2268CA187DD2EE2397E3A9EFEBBF8EEDDE4E2BFEE994F7F981456CBBBC9FEE4BFA7132AA1E8B15D23A566DA265446585979FC0DA5C1234A7FB7444FBF6749156FC91928B5518F7C106B621CFA2376E893D81B9FC47EF449EC6D0762ACFAAD9D298A88817673A5CB14116646B17CFD0D13F9487D4CAF519EE334A6A570D15267F8B71E1E1E0680093EE8895A1B7BD0034126FAA0076A4CFC412FD8AD43107A2026471FF44BD4ABA413620E7AA058451E1C4E082882F7BD2E981B5C302B1F331FF0A90306FA0037EBB3351C207591F65E51E93664DCC5A4921EFD41641F766E15772E34E4F02B42E1EDAC5AC278B57A185236A69E37726C383D2FCBEB5397356B0B26A3354C3521EC7616A840083CA6B64D2EAD650C3C1F8A6E110ACF03A11EB6868328D44590DB5998F943861489CE4D44089F0F2126A478703B3B6ADE569C3AC29C27F5A68930D753BD29A2CC79D1B8B918733EE41F1F61CE03453EC09C8F816843CCF9D0499A28733EC6A38D33E7C506E2A2CCED8E55A58AD2F62A8FAAA8286E4B47F1D1200B86C6E7C06EACD447A3E63163BF1D70EC8A606D3E868E3FA7751C42F663D5507A9971C0E1FE8B19CA326CDB4B1F4B53B0B59D95A2A3083F5871EBADB1B5919FBCC2CF93925B467CF342AA0CFBE647936483BEF9A2C844F31A4E810182A7BDCEBA0DA94C7D06DCEB3C765A8CD14B414F1354CD8729D8C455F3648F3711A3FA1E37743EBAB05FD595E16676161BF56D4937D1527ED5EFCC8AD92EEE7776E06D77B0F186DF3264D7C1D04A325F43F7BD75260A5A1F226DF4B3EE54CAD8673E56013EB817D8223B3A5230AF1EB4B8005E9DE908D1A4786E4D2797E8E9138E17F9E3F1F4E0F0275FD24D1B9A6967051C13E249C7C6FDFD0EDE63EE84AD4E8ACA0B4225D13C8C9FBB9CA6B501A07A0A1FFE5A756F0BAC0EFDD4430C793D1D07A23D0DE58FC3E1E2F0ED9F3A116562147567211FF1C98B031F17EF69E3BBDC5A7A5E58280776EA4E0B88E4A49E6756124488E0D4BD6940C8A6EE27FC6DB02671629854CEFACB22F987C945F6250EFFB5261977841B54F954CF2C8F2B221025696797C58DE9FD4C80262FDE486D84A6E13603CCD18CEC7060085E047926EA821301E5E1E03766B4092DEBA57002C297ED8567DA2301B92B56E4CB747650514531028AC2A18ACC63BE31115037D8ADE2F2AB8187ACEB706DA184F7ABB833C190BA6B1352FC230F2B40378582B664030AC5B52226D1CE828C0D6D64184C4B7DD30A1876B49A2047DD11AB412B8791B7A6ED03A7EB3560ACA09DC588BF0DDA2AFA9017A9F1CD5FB39A20443EECD4360C517743AB0E41E4B6C0965F0DE00C21C5FDD959287BD951ABA30879400BB755D88F52155068CB8E5198B042C39977D77651302CEF9219E258C85F98834B585C42E36B759CF8ECC7BD347BA82B6E6D912978D0F899F01B8CC82E2EB1DEABEEB49FC7F3424B646FBD577DA1312EF698D4CB759487B4D9A46A62C44A4C6A49B5776759524C2A4F6A7F6F4FA6468083532ABF10DD0CCEF214857240ADEB348C83708522A90F42494BC94B79DBD01473CEF00AC754A44ABDB4A94C73F992D6DA10176684890D5CD0153D18F80BA4E32242B8BCCAD213B35E0436749775B71820CD15D321D02176E92A2E4FEB27A535442614CA02243F1956441C5203ABBD16CBA38A49E75BF2879DC493E2F6EFD682A90A3734AE98A9631CB1849AB4172158C0284E5B0B02F1A6E6BDEE7A703B8C7C297630859C91448C70DD94973362E620C246C3B76170A6BF63ABA853BA77BA11D0B1411691E8DFD30E2BBD82CA8E64F17B1440C93EF5650398E44140245DBA1D063AAA2B758ADA14AF6F8F0E15DD05B31E6307AE3310BD3658AF44B3CC1A06136E83E50D1A50E460181EA600AC9B8209747B6D0C9C30517725A255DE8B420A1802786BA122DF88DBD24508B8BAC73604CADEE545C974535105A90D2E4EC5CDAE2D454F79EB8CADBB4AD9658C0057E9B6101682E7CD3DF4F2226B120BEEEE9C692CE68D821DD0DD50D3ACAAC020C832BFF4ECDF82B77BDAD2C1576A13A883DE63DC25D495CE8D9A6655055E28EA540F5E6E19EAAE6D82EFB35B89ADE311B797C8248F0236F5512BDC2CA9D4303BD6BA77E6BC23CEF2B85951B9E97C7923E8835E5780458C34D68611FE4DE1B00B1E360A46BB7731C65D858B8650E16CB5086F091E21AF71CD1AFCB23068F790B0ADE3FB66F4BE027580CFD02BE85E41379CB1013C0ABD4BB6C676206E43968635E2366A68B0214FEE81B000DB8C362E5C0BB787CB65BC147CA9A3D36C23B0987B0EF7C06507DE67B2BE10217A4D36E94E4746CC97E5736576543D2143FF94F420CE986C67AD6C4CC513C60300E39C7FF7AE0187F0469D848EEA0943DEA76A3A69FD7F4527A7F2953BF6B246E946DC1490E0C257C1B85D49953079AA6A9822868A186F60A922264F551153C45091E85F2AD526165055299633D6CB7820029532B9EA1A994286EA04CF28A94221BFAEB248CE9A1A8552C62E8ACE4F403FC5228A9AE58286CA8BC32EA9BE22B5AE62FE3569E8930C3356D8E37999349309D6D0E4BB5454FA76682AABDE60D6565896B1AEB37213D0545A3FCCABADB52A64A8163A49966A860A4195CBE5CC0DA84E26A53AAB74A89A22CB8EA348C147A49ED655B6896F9CF626738CCB863A7192AD3EE3BC8829C29435F74AD262E5D5462CA1AFDEB9CAEAC4CF546F554C5F79753CEAD882EAF4C7D482AA98BE05D55199630B4AA3D0D480B294BEFEEA5164FBEACD559BAAB5AB923D9691950D2613AA88CDB750351A651754369A5CA826A680B94FF412A85C47915AD3263FDA65AFC8B1E69379903465F55C148ACB3DE51F77D65C309B302545854E751D803FB51075D0F2116F956A29193D9C5A597CABD6168537AB2DBAACBC4605F4DBEECA95B7CEC3AA6E41C0A0BC766103745908E481F156914706483A77D57BB522EDDE75F96A0BD06DC3FD176F5D166CC2E24B95B1D76594B51738C0E1B6BFF2C1750434608AEE688D1261FC6183A40281C1C270678F70D5006087EE3202D774C69C295A5BFCD674553655CACF9864AFDD136C0D7D4FB56EDE7D3AA1F89A35A2040AA069E48915950164C90BD09179006670D69D400236D9DCD9A17073065861E310DD6B22A8EDCBE27328BB77F75BD75CA0C70ABFDD5E9DE46CD8E28B2AA5FF6206BB93422B9A85E3A9FEA8845DA2C43CDD12A7B10E21625501EFACA90D39336B20EFC83158C399AD10B1AA406FD6A81CF300DE58F9F0F1EA90641796FA90D2E2537CADB09604625229FFCCA9FCC66C9803B998A9465CEA94A12B5BC626D899493FBB545E4F83B048B32303CD2DFF6CE13D6ECC7247E19DF37299537986584864C085640C813C125B64F7054813D3FB380CC20E6813BB54CBB88CDE0C908ED9159B50EAA378F561BCB08FD4A41B76A1B8A3773B1A9A8ED7319F9A23E426EF68566EEC5509E4679EA484F86532C75156A41ECD6ED6310DE256FE3AC359B868491C119A312E1C505AA275998BF821A94FCE8516D545A4B868399AA31C9DA464845190936C1A5C3D8C17D34911C29A1AF45FF1FC22BE5AE7AB754EBA8C975F232EF0333D81D7D57F3493DA7C74550450CB7C74813433A471EFAEE2F7EB309A37EDFE00C4E25290A047FB55443E3A96398DCCB7786E287D4E624B4215FB1A8F847A1723BB8A6F117D62C2BD6D64D67EC20B143CB791B05544CC03C1B3FD88BE789CA26556D168BF273F0986E7CBA7BFFC3F614BAAA33D8C0100, N'6.1.3-40302')
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'202106201838580_initials', N'MyHealthCare.Migrations.Configuration', 0x1F8B0800000000000400ED5DDD6EDC3A92BE5F60DFA1D1573383336EDB39199C09EC1938B633F19C38366CE7CCDE198C9A6E6B8E5AEA91D4898DC13ED95EEC23ED2B2CA95FFE14FF244ADDED630408DC2455248B1F8B5564B1F87FFFF3BF477F7D5A46936F38CDC2243E9E1EECED4F27380E9279182F8EA7EBFCE18F3F4DFFFA97FFFC8FA3F3F9F269F24B5DEE0D2D47BE8CB3E3E9639EAFDECD6659F0889728DB5B86419A64C943BE1724CB199A27B3C3FDFD3FCF0E0E66989098125A93C9D1CD3ACEC3252E7E909FA7491CE055BE46D16532C75156A5939CDB82EAE4335AE26C85027C3CBD7CFE8851943F9EA214EF5DC40F29CAF2741DE4EB144F2727518848936E71F4309DA0384E72949306BFFB92E1DB3C4DE2C5ED8A24A0E8EE798549B9071465B8EAC8BBB6B86D9FF60F699F66ED8735A9609DE5C9D291E0C19B8A4933F1F34EAC9E364C246C3C27ECCE9F69AF0B561E4F4FBE26EBFC4B369D8875BD3B8D525A4E6074392E7B059D10677BD5F73F4CD8523F34002138A2FF7E989CAE233A32C7315EE7298A7E985CAFBF4661F0337EBE4B7EC5F171BC8E22B6A5A4AD248F4B2049D769B2C269FE7C831FAAF65F2769FE90446172319F4E663C819948A1F91EFAB8ECEC459CBF399C4E3E93E6A0AF116EA031D312BA0BF308D72408C0C8A4994E2ED1D3271C2FF247C242F4349D7C089FF0BC4EA9C87E894332C7C84704BAC65A6ED75FF3712AC20185C0C158151D8E55D19BB12AFA71AC8ADEFAAFE833FA162E0A19A09A2ED3C90D8E8A12D963B82AC56C2D09EE99521FD264799344AD986933EF6F93751A502827AA1277285DE09C6FDED1AC95605AB9C6B4A2A3646B286C4CB67511696649C630E2364F52FC371CE314E5787E8DF21CA731A5810B769A20F809C58B355A0C2F8F3E264B3C8E88A53511313B4E65FF780C73FC29592483D7F43E42C1AFA3D4748BD36F6180B3C12BBAC319D11C93982A71A38C1653E1680BF135193632C1B2717A5888E011D79346F7ECBF9AD46B857A35A9D71BDBC61153244781AA794D2EDC40205B6A2254C6B59177385D66570FD5A4035BCA17819BAB2A23B55959D0BDE1CD648219CC1450B519280034182A05B5D65AB36080D151B36828BC5A4D2FC96A3A5FA2301A5E48CFE729CE865F5FAF1F93187F5E2FBFE2746B4C8C0E525734337492B993381045704799C09379150C23CCD73362F47C59CDA9E953D74593EEC225766EF119CE82345C959B745B325B7AADFCE2BC31AA081D274FB33CBBCE1CE6D357035D55D792180FE4ABC7C1E7D269149226D1BF47AAEA2A08D62B34CC7C9374D5A701AC226FB2B3B374E8A460CB7241A78677120A851E7587972BD2E6EE0B2A47E5554228EAE2B8442BDD85859B68F4FFC4C1F073F27D327F1EBC92E136519582E117948674505596778986BAD4BD301F5909A12B09D8E2DAE2BD8C7291760F3D9C27F42A39363AD53988F85B1A05480F390BE405D36AD2749A05972737D6C0E73D26F6C8A7AF5057D4358A5A7B8383249D8F62F45E3DBC0FD3D628E86CF4DEE2A711B6BB9661466178564CBBA1358B1CA53941CB6A94DA3EA0208C08FE46C1D7598816719285C3EF1C9E26CB259958C357741245385D84231C365E3F3E676110A27894A1DACCD6EB259E8741B90C822B629B7F7F89527605E47324BD4FC8763D2AFA4CA4381102719811A98DE7AB54D1BECF5777276797179F2F6EEFCE6FCECFAE6F3E8BED844B48ED5514736D3791250F0F604B8B1CB1714DA2D49E36A7978ADC0E43671DA1A1F0AA2A28EA1A453E1028F853850B18F699EEA282AB9006EE62E80C3D9B2591501A6E255748DB60BE64F7B67F24753834BE2A6E687D51CAAEF965D17EC684C0DABE328352D998DC289A11C6B88BFC60BF1D4B8E10667916231DC6BD4265DF812FC8BC8EBCE5C8536E6D6AE865CDA7EBE8CB945E550615C83AACE68051DFDB9ABF88C3BC74C71A5A7D6114D1C1375550364A351901EF18BB130F0FA30D5351DB6DB8885179A56A3C4354A1917636F0448DC9600776129D95B5D74D5A161FBF0AC8E104E42866D98073653451ED3C290D7B19E2D49377393AEBA8A8F3195FF1F5EB74534D37CA9D2FE9F09EAC1FC2088FB3F54DF8709A623F8E7E9D9D06EDB5F0240F1F5CB7EA448CB3445EA1AEA8EB4B867B2F2DACD3CC702E68A31CB65FE22C1BE33A9FCFF97891111DBF21F33E21AB0C8A3B5039C31166DAD39DD00D5E86F1BC3DB9E94AE994B073C4F59D4E0558EB6604C97D598A51B8C54C59D7964AF45AF84F56ABA8A256B6A59BC22D907915908ABA3E846966F2EA3DD8DFB742A223FE3F216F356FC9BEC727FC0D375AD5FBE7DC9D277F4FC2D8CB5E0F652ED118C8CCF421826314E4E137DC5B768EE6AD7EBB5EAD92944C88D16EB09BEE861DBEFD93AF5A4E93F8214C97FDD7B26B9465DF9374FE1165230C090ED6299148C4405CAE76DBC3425D97B7A1B9FB9E7C20932E49CF63FA556F7A9F92E0D7649D9FC7F3C2BEC90359285812F0D29C932020AAE80702663C3F4DD671DE4F45A74BBC6129B19D7F9D8FD94F23142E1557DD7965E4BE2ECADC77074BC82154E062AEA7D89F9245A8F0B1116BA88BAA9B5A963036B52AE6DA544ACCAEA5554975438B02C67696A57CAAB0C52079D2630B5AAFCAAC460CF4B5F60B0E8F62F21735FD82A2B5EFAABA02B598A29E805AD0DA18508BDA49F2B7B0B0D367E62FEAC284BC55F91A6AAED3416899DAF239FC69089B8BEBE6D895BB4FCFAE48A642DC139029A98DE11846195894B6B30B207DC8CCBA6E3FFE8AE5E099577C5AEEBE2CAC5CF49B32A675BF2DE86BE9F784C18DE26FDB177CBFBB1CD9ED73466FA3C47DAD1B3A6683C68B703BFC1EDCF4B9C66975870756D5DB7C594B17F324E778A980AB9B3E9DDE4613A298FA5549509AB40574A28429D52FB865D3E9AE22A4A5F02A3D1475D148416942AF187998A1CE1B209E24836BBD51947C27FFF5157176E2EDAD9F83830EBB034E22479CD04A99D4FBB4BF3980F570E85FD1F233BD27EF5186AB71140F05A78665F3E49FE8493859EE73BA3A0F531CE4DE08FE12E2EF9D8839C50B2412E7BACFC032345EE5B5A2AE717C246E92F508378389481BA73B15B0863F0421C8BD4A994D8D6EA624252361CA5A0F2D66A022AC6035BBEECB427C4C41360F0C28C81570DDC3A61FA983CC5AB70B0A2F0B36BC9310FB942C3A0B2FF2EDABD052D4E5E534FFEE31657CA0C6F15F18AE9664B118E154762C5FB7F327FAA08D7F335F35734FB22C09C2029B8C881783A6F24D3E8FE7138B08AAADFAC78440BE241337A4062E69CBF1747F6FEF40E2889E7C23B75AF24C383A9EBC4C9BCC749CD2A986A8DF03B16F5118E7B25808E3205CA1C8DC0CE1534B994287A3A944CC39C32B1C537160E6B14DED9A08ADB4194D6D82D03331EA68C620470F28655C51D5B09B838CB6632F86D375C297398EF9782033B56504A499F8BE2B70830255AA21A08D5AC9028D093DCB23E00F5A8869C3CE5BE14BE4E2555C7A1F4FCA6D1F22225016A0B9BCB610993FF7024D4D1F46C1A5668C760394F2F3142AC0685E3E6AC1D2BC84E124EE34CF608C27E7948D1801484ADEEE06880C3106D522C82EE0202BEBC4E8982E02CF2EC8675B9B102971FBA49F4D8746118336E368D310294AE646E02C440C52014A153EA805101B20C01EA8AA28640C5D1A1E73DBE008377B04F8C1E360537175217BE320E30314D9E0421108CA067A86B5D81C440AACA50CADA405795FE694517C9CDA2D049A1A8A3D7C902AB09A2A04912F06294248A85A6D8A27C11C88019173EC45972930E1968B307DF3471065FA71DA7691D6865050E10388A7D042A28A3C628F3620D2E496034C6AF108989278BEED30525C23511A8F863B258C712ADEB91D101EC6F60190852F5498E643376357CBB4312C5E2D576C1AA0741ADE0446ABFB43B618102F136D1B46855B4CEAF655772946C128CFB40D6094E7CAD66354F20D538DBEDA518CD97D633C35ED5768B5D72B88A8D297DC978E0CBBBD5A4C01C807D6BABDC3CF50C0F9563D412D58EA617ECA1C1B777ACA2CB1A91FBE4BB29915A4BDE56129A3812B1F3D41605195FBF4DDBCCE6DEACCF80B893474BB0656C37A62B891BC6DCA8ECDCA349E289539B6014D8763C9D62B3A726427E5FE943ACC93C227DC65F34B19216A4390EFB607A6EAC518DB5FAAE1D97A084A1EAE2A90A8DD7079AFB4C6D1DE1E7F6A4F5A2BD2E0C67767B734A821232048C55E9BAA6B9FEC110054BA3C160E74618C5379953DFB5AF484BED72B392B13A057FECA59E55029228212BFC539EFE2319DB48E96A2B78684299E42E361001161FC320C64186F4B890A9367A0223AD649A4C402467A8D130FD430CEBDCA408A3BBE8688091E05C696F1E7EA70F3448F0803D122C2B144A6D82D377DC9BEAB2553604ED4AC0995A7861A5A65016B7AD5299B866055C240117CAA4BA20A9D95190857671C12A92ADDA2A348D53F64D3AB667905FBC3293E0662D5256259A6880A8E810EB4E96D41B7DA1C77235E47793211AF7635DD8857F72F4DB44B2BC240DA8296151DEEC6BA2CB9993D3D13A1F26E0F28B61B7DC284FD67329B9684B710A1E25E8E4080593C8145847DEC9D2929AE272ACF464975525D1768BAC12D6092926077398021C62EAAA22ACFF7DC822B4A57768035766EEF5C978C8EEF4CBFF4CBAF1DD9E1D905B96283BC32FA6C0B3DD2796D735C62B50E2D8F747EDA433148760B069863F01DE6375D94DEC34C1714FAA881D0F060D1BFA00DA1C6DE1F56186C2B8F580E47928EA80593950F2C435F54697B73537C8E51E69ECEFD92EB8DC20193693DA7B26AF8A270B96429215995E9D77941C7D5F341E321A8EC08EC23D8933BB04B204814D4DD3DF1AC52E32D9906780E9A3BC8FB0EFA621BEF2A0852854D1477C6A99E99929966E34DC86F75EAFD09996E8196948669060F42EF339279F647E68BC2A18D6BB0ECD2C6B41134EB149F0FD64555585E6041B7F0BCD21EA508BE574C572A7351B7B0EBFDA45835013619BD33AA3617CD8C82DC7FB49D131C807A314A70D65133AAEE4F6F46C951876416E9BD4FB80E29FD4F588D8EB56435CC517A9C30B4AA36FBC40BE360A2878BCA134535C2802F8AA92716A4CC5819804742304BE3AC52B844E8E682EC14E1D8433BE2E3608A0DF76D1641A649A63F94EF258094136D204C012FF9003A8DFE50D8F25898D764D8DD539D0EA33C0836B1B90333E4D83AF06698FA74D2EE7C9295C5E566A0610B0C3C8A3451D130A00E14D29C9A357947B3DBE0112F51957034234568B092358ACA103E75C6255AADC27891B55F562993DB150A68BBFF783B9D3C2DA3383B9E3EE6F9EADD6C9615A4B3BD6518A449963CE47B41B29CA179323BDCDFFFF3ECE060B62C69CC026EFA89677C4D4D7992929E0BB9E53359C52B456728475F118D9A723A5F4AC5C03342C5BE6B5D257F0C288F5ABD155B97A77F57B6972E782F4CAF65EA07D2CF253D9A2D420B01DB3CD297E4DBDB00452815234BB1379C4F9368BD8C2DAE3EABE95521C9584A55923D8DDBF5D75C26D3A63A50C28567C78140A94975A674085292028C59507A03527AD381D28F20A51F3B507A0B527A0B513A9A0950944EF625F00BD2489C4B56338DD97DF435D9945BAC16D34DF3AD8AD5E23C739B5EED63542C8D36D59ED2C7648981C9CA24BBD122D35341AECDB1A7F88FC730C7C4A84A78724CB23DADF7110A7E956931C92E13A5384FC9C48952A73A08CAF6F0019299526E27CAB024050BD8D3BF267CA30A06D06C21CB9E66B16EF1B4AAA4AD113DED09A52FC9A3A468217934DFFE3697FAEAF53C964C95E480C2F93CC59930B99B448719C23E1DC7719ACDD81A640BC7CABEE0AD276B817113815D023AF726384B89CB70A0C7464FE7E8B1195B0431E64CDE1FC05AFFC12EE8D27C3D8CF6C6BC5ECA116993ED699D4621E915FD9B27C6A6BB52BB0A82F50AC99892735DB491A75C543F9EC075DDF774DE10D485637D5F60D7FA3958C0DDF0FD3080E72AA5FD0416683E7B74F5E39FC4C895B48F32D1C1C448E6CF827551A40C69D86D4C928B5E31FEC4B9E06FDD45A69B480C83731F589402B42967CA56893BF808BF1B02A8ABBCFBA0835F0D33CEF272EBBAD0DEE020498536D4696EDAE4D5C3FB301555092EC3655BE349DCD17872339CAA93E132563D6F3E71590E6DCA519A93B15EC934852C7B9A1F5010460437F238F2390E2311A2459C64A1603432C90E4A58B2A4001748B5A90EE3419FA45A84E23E1593EC62CC3E676110A258669A90F5620D64D62DCD9BAC6B2FF57410799A8FB755F25571AF58128A50585B30CE0A5FD0BE430D91751A6E988092E5F4BB3096B40936DD65D17916171B50C5DDF8E0A97C52FB8E1E48D769F81414C6193F5AB9783AB3DE26310B39B4FA1A45E042A1FB40DA101946FCBA084F9DD2286B8B4EFB57719897B76AB89E34A90EFD61AEB44AC876DE63BAC1281329D5692E54B275948B54CA3427B5F5E101669490E548F3365CC488621920CAE46DCD6C2E1DB47DCD5F909AC594557CB7BDB3B4BFA2A5028A0E23FE66FC06577FE477D1471D977AE0BB81E0462BFB9246B2082D531DECE230C2804DDCA4BA2D32A72986CFB99A8CE1CFCD36A7C2309EAC2E68BCC8E8DF570FBFD36A310CF9DF775160946FF2EAC6A01F4AEBE0412C055540213515F9F06013E705CD8B80FC84AB1237374BE8A3C7481CA52ACD854A190F4B22D424BBB588A8F2737183874D77D9199B8BC79C891CA7ABF8BEE7BCEF636200AF74EFC614151EE0E6C78BCB720380F00EB7880321DB8536F724374F97CB02699E26F13CA4FC9DFC82A2B520B541AA672175AA20B84564B4B61876DB87372DAF476672C7355D75A5ACA36FBF10C4C77DC48C14861112C50D0A48496C925D4EBB21526DEA26B624AAA78BB9069549F634FE9E84C011589BEAC6A1CB644EA68AB81CF3392E9C42411E7E13E56593BA1937A6DBF56A95A444B9801D2080EC715D428B0F88107B08D3A53812629E8B0B75967D4FD2F94794094CE4739C6E70AC532A2172B45C49D738D8ACE14FE92CE829380A9770D0F1BF271F089E93F43CA6EE1F027539D7613E26C1AFC93A3F8FE785E19907C2A494B33BD006DA2CE6399C01070151653E1088E2F969B28E45F77A39DBCDA693E5779BBA356BF70918CF60A0B5BC0C9CD77B415790D966EBBC68B26CA233C98EB40A65112056A56F2BBE94C12ABCE0AB8C9DD81B5F0A326AE9448A93B46FA164CC0B590E2B41F5CDCF583852E6328642F17660451555C00B54A0D80EEE4881A90C2B4AEAC718B85338C5030D1B1BCAC1C6AEFFB8B98D59DFDBA8DE8D94ECF639A32E83C2DE009BEE8625E5451929738833BA4D5D936642FAF842694BB3CB4569CDC7C360935E904C13EAF0286E1CB7E92ECAB40CA03ACDC92D33F94EFE93BC32ABD4177BFDAB0C48E20B896C646477286ABF1E068B3E8E9E6E8815884509B676DB54FA8CBE014D6953DD6617164DCA26D165236481AF5249B16492DD684957C4140F4F6C6C263091BA7D4D071ADFDB7D1A805F0D03FFFE8E67778FA974BE59A78DBBC34BD8B600CCA0851B547D9D239F3FD1604CD222C0248F0F7C3ECA94CA47570AD2EBEA8C2B1170739AA611B5943E898A00BF322BAD260B43177E0387694A9F562A9F02F2E65BAC6D6A7BD277917D5E47D1F1F401459984710D2FC408657EE055C5FCED81AF8A82A35BB7EDD871C190B717625C74E5DF30C6AEA500ADAEE653FD9DDA463298F3C09089D47BE28921E7014F52E3DC5024364EE08E630BCD0090A2218A459A15B44A697E37D110AB48845C88C4A27B34E061D1ADAC8A8A2886262C8B4C27F54668AD31EED1027BB7FF8ACA580C6D814B14870F38CBEF925F717C3C3DDC3F389C4E4EA210656584CA2AE8E23BF1AD33AB288C076F6814463C5FCEC4CFDD6339522A5936E7826D303A6F6D2243010C8F7EC612CCEAC1651E99538783389A89148E448CB21F978FE78431F444DC453CC74FC7D37F17DFBD9B5CFCD73DF3E90F93C26A7937D99FFCF7744225143DB66BA4D44CDB84CA082B2B8FBFA1347844E9EF96E8E9F72CA9E2553A03A5367E920F624DB4447FC40E7D127BE393D88F3E89BDED408C55BFB53345117BD06EAE749922C2CC2896AFBF61221FA9B7EA35CA739CC6B4142E5AEA0CFFD6C3C3C30030610C3D516BA3187A20C8C431F4408D8964E805BB7530430FC4E438867E897A957442F4420F14AB1886C309014518C0D70573830B66E563E6033E75E8411FE0667DB68603A42E66DF2B2ADD868CBBE254D2A33F88ECC3CEADE2CE85861C7E4550BD9D554B18AF560F43CA46E7F3468E0DCCE765797DEAB2666DC164B486A92618DECE021508A6C7D4B6C9A5B58CA6E743D12D82EA7920D4C3D6701085BA58743B0B337FC89062DAB98908E1F321C48414596E6747CDDB8A53C7AAF3A4DE34B1EA7AAA3745BC3A2F1A3717ADCE87FCE363D579A0C887AAF331106DB03A1F3A4913AFCEC778B411EBBCD8405CBCBADDB1AA54F1DE5EE551155FC56DE9283E1A64C1D0F81CD88D95FA68D43C66ECB7038E5D11F6CDC7D0F1E7B48E43C87EAC1A4A2F330E38DC7F31435906807BE963690ADBB6B3527414E1072B6EBD35B6F68AB657F8795272CBD8715E489501E4FC68926CF8385F1499B860C329304018B6D759B72195A9CF807B9DC74E8B317A29E869C2B3F930059B086D9EECF126F654DFE386CE4717F6ABBA3270CDCE62A3BE2DE9265ACAAFFA9D5931DBC5FDCE0EBCED0E36DEF05B86EC3AAC5A49E66BE8BEB7CEC453EB43A48DA3D69D4A1945CDC72AC08709035B6447470A0BD68316170AAC331D212E15CFADE9E4123D7DC2F1227F3C9E1E1CFEE44BBA69833CEDAC80638245E9D8B8BFDFC17BCC9DF0C0EA0DD0C8F2B65149290FE3E72E47736D34A99E928CBFA3DDDB9CABE348F590695E8FDA81D0514339F770203B7CFBA74E44998047DD59C8878FF2E20DC8058FDAF896B9969E1716CA51A2BAD302C242A9E799950411C241756F1A10FFA9BBBB401BF9499C1826FDB5FEB248FE6172917D89C37FAD49C61DE106D564D533CBE3F20A845CDAD9357663460413EDC98B6B531BEE69B89D057368243B1C182221416E8EBA4847407938928E196D42CB7A69AF80F0657BE199F64840EE8A15F9669E1D5454219180A270DC23F3986F4C04D40D76ABB8FC6AE021EB3A5C5B28E1FD2AEE4C64A5EEDA84144CC9C30AD04DA1A02DD9804271AD0870B4B32063E3241906D352DFB402861DAD26625277C46AD0CA61E4AD692FC2E9AE0E1878686731E26FB7B70A65E4456A7CF3D7AC26A2910F3BB58D69D4DDD0AAE319B92DB0E5570378564841847616CA5E76D4EA9044BEB70AFB51AAA2136DD9990C13A36838F3EEDA2EA486E5C53443500CF90B73A40A8B1B6D7CAD8E139FFDB897660F75C5AD2D32050F1A3F13CB8311D9C58DD87BD505F9F3785E6889EC15FAAA2F3460C61E937AB98EF290369B544D8C5889492DA9F6222E4B8A49E549EDEFEDC9D40870704AE517A29BC1599EA2508ECE759D867110AE5024F54128692979296F1B9A62CE195EE1988A54A9973695696E72D25A1BE2C28C30B1818BE0A207037F1B755C44083761597A62D68BC086EEE6EF1603A4B9AF3A043AC42E5DC5E5D1FFA4B486C884425980E497CC8AF0456A60B5776C795431E97C4BFEB09378525C25DE5A3055B18BC6153375C024965093F622040B18126A6B41205EFBBCD7DD356E87912FC50EA69033928811EEAEF27246CC1C44D868F8360CCEF4177615754A975837023A366223129D85DA61A5F759D9912C7E8F0228D941BF6C00933C0888A41BBCC34047753F4F519BE251F0D1A1A2BBADD663ECC07506A2D746FE95689659C360C26DB0BC41030A430CC3C314CD75533081AEC28D81132684AF44B4CA7B514801E3096F2D54E4EB755BBA0801F700D98640D9BBBC2899AE3DAA20B5C1C5A9B826B6A5E829AFB0B1755729BB8C11E05EDE16C242F0BCB9879E71644D62C1779E338DC5BC51B003BA1B6A9A5515180459E607A8FD5BF076EF643AF84A6D0275D0E38EBB84BAD2B951D3ACAAC00B459DEAF5CC2D43DDB54D247F762BB1753CE2F61299E451C0A63E6A859B25951A66C75AF7689D77C4591E372B2A379D2F6F047DD0530DB08891C6DA30C2BF291C76C1C346C168F7C8C6B8AB70D1102A9CAD16E12DC123E435AE59835F1606ED5E25B6757CDF8CDE57A00EF0197A05DD2BE88633368017A677C9D6D80EC46DC8D2B046DC460D0D367ECA3D1063609BD1C6C57EE1F670B98C97822F75A89B6D041673CFE11EB8ECC0FB4CD6172244AFC926DDE9C888F9B27CFBCC8EAA2764E8DFA51EC41993EDAC958DA9780F7900609CF38FE835E0101EBC93D051BD87C8FB544D27ADFFAFE8E4543E99C75ED628DD889B02125CF82A18B72BA912264F550D53C45011E30D2C55C4E4A92A628A182A12FD4BA5DAC402AA2AC572C67A190F44A05226575D2353C8509DE019255528E4D75516C95953A350CAD845D1F909E8A7584451B35CD0507971D825D557A4D655CCBF260D7D9261C60A7B3C2F936632C11A9A7C978A4ADF0E4D65D583CEDA0ACB32D675566E029A4AEB577EB5B556850CD54227C952CD5021A872B99CB901D5C9A45467950E555364D9711429F888D4D3BACA36F18DD3DE648E71D950274EB2D5679C17314598B2E65E495AACBCDA8825F4D53B57599DF899EAAD8AE92BAF8E471D5B509DFE985A5015D3B7A03A2A736C4169149A1A5096D2D75FBDB06C5FBDB96A53B57655B2C732B2B2C1644215B1F916AA46A3EC82CA46930BD5C41430F7895E0295EB28526BDAE447BBEC1539D67C320F92A6AC9E8B4271B9A7FC4BD19A0B6613A6A4A8D0A9AE03F0A716A20E5ABE08AE522D25A387532B8B6FD5DAA2F000B6459795D7A8807EDB5DB9F2D67958D52D081894D72E6C802E0B813C30DE2AF2C80049E7AE7AAF56A4DDBB2E5F6D01BA6DB8FFE2ADCB824D587CA932F6BA8CB2F6020738DCF6573EB88E80064CD11DAD51228C3F6C905420305818EEEC11AE1A00ECD05D46E09ACE9833456B8BDF9AAECAA64AF91993ECB57B82ADA1EFA9D6CDBB4F27145FB346944001348D3CB1A232802C79013A320FC00CCEBA1348C0269B3B3B146ECE002B6C1CA27B4D04B57D597C0E65F7EE7EEB9A0BF458E1B7DBAB939C0D5B7C51A5F45FCC6077526845B3703CD51F95B04B9498A75BE234D62144AC2AE09D35B52167660DE41D39066B38B315225615E8CD1A95631EC01B2B1F3E5E1D92ECC2521F525A7C8AAF15D692404C2AE59F3995DF980D73201733D5884B9D327465CBD8043B33E96797CAEB691016697664A0B9E59F2DBCC78D59EE28BC735E2E732ACF100B890CB8908C219047628BECBE0069627A1F8741D8016D62976A1997D19B01D231BB62134A7D14AF3E8C17F6919A74C32E1477F46E4743D3F13AE6537384DCE41DCDCA8DBD2A81FCCC939410BF4CE638CA8AD4A3D9CD3AA641DCCA5F67380B172D89234233C685034A4BB42E73113F24F5C9B9D0A2BA8814172D477394A393948C300A72924D83AB87F1623A2942585383FE2B9E5FC457EB7CB5CE4997F1F26BC4057EA627F0BAFA8F66529B8FAE8A006A998F2E90668634EEDD55FC7E1D46F3A6DD1F80585C0A12F468BF8AC847C732A791F916CF0DA5CF496C49A8625FE39150EF626457F12DA24F4CB8B78DCCDA4F788182E73612B68A88792078B61FD1E79353B4CC2A1AEDF7E427C1F07CF9F497FF0739F428723D8D0100, N'6.1.3-40302')
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'202106201956593_MAR-refactored', N'MyHealthCare.Migrations.Configuration', 0x1F8B0800000000000400ED5D5B6F1CBB917E5F60FFC3609E92C58946928F83C49012D8929DA3C4B2044B3ED937819EA1467D4E4FF7A4BBC796B0D85FB60FFB93F62F2CD9575E8AB76EF6657404038686972259FC582C9255D5FFF73FFF7BF2D7C74D38FB86933488A3D3F9D1C1E17C86A365BC0AA2F5E97C97DDFFE14FF3BFFEE5DFFFEDE4FD6AF338FBB92AF78A962335A3F474FE9065DB378B45BA7CC01B941E6C826512A7F17D76B08C370BB48A17C787877F5E1C1D2D30213127B466B393CFBB280B3638FF417E9EC5D1126FB31D0A2FE3150ED3329DE4DCE454679FD006A75BB4C4A7F3CBA79F300AB3873394E0838BE83E416996EC96D92EC1F3D9DB3040A44B3738BC9FCF5014C519CA4887DF7C49F14D96C4D1FA664B125078FBB4C5A4DC3D0A535C0EE44D53DC764C87C7744C8BA662456AB94BB378E348F0E855C9A48558BD15ABE73513091BDF1376674F74D4392B4FE76FBFC6BBEC4B3A9F896DBD390B135A4E6074312F07399D00A70765FD1F666CA91F6A80101CD17F3FCCCE76219D99D308EFB204853FCCAE775FC360F90FFC741BFF8AA3D36817866C4F495F491E974092AE93788B93ECE933BE2FFB7F1D27D97D1C06F1C56A3E5BF004162285BA3E54B918EC4594BD3A9ECF3E91EEA0AF21AEA1B1D012BA0DB210572408C0C8A299CF2ED1E3471CADB307C242F4389F7D081EF1AA4A29C97E8902B2C64825025D632B37BBAFD9300DE12585C0D1500D1D0FD5D0ABA11AFA71A8865EFB6FE813FA16AC7319A05A2EF3D9671CE625D287605B88D94A12DC31A53E24F1E6731C3662A6C9BCBB8977C99242395695B845C91A677CF74E168D04D3CA35A6172D255B4D6134D9D646A4992519C3889B2C4EF0DF70841394E1D535CA329C449406CED96982E04714AD7768DDBF3CFA29DEE061442C6D8988D9611AFBE74390E18FF13AEEBDA577215AFE3A484B3738F9162C71DA7B43B738259A631C51256E90D9621A1C6C23BE26D34616583ACC0873113CE07E52EB9EDD77936AAF50EF26D57E63DB397214C9D052D5BD3A17EE20902D75112AE3DAC95B9C6CD2ABFB72D1813DE58BC0DD559591FAAC2CE8DEF17A31C10C660AA8FA0C14003A0C95827A6BAD5930C068A959D4145E4E4DCFE9D4F47E8382B07F21BD5A2538ED7F7FBD7E8823FC69B7F98A93C91C315A485DF198A193CCADC48128825BCA049ECC8B601860BD9E9343CF97ED8A1E7DAAB668D26DB0C1CE3D3EC7E93209B6C525DD44564BA79D5F5C374615A1E5E2A9B767D795C3547D39A0ABDADA90C303A9F5D0FB5A3A0B03D225FAF7404D5D2D97BB2DEA67BD49BAEA630FA7226FB2B3B57468A560CB7241A786B7120AB91E758B375BD2E7F61B2A47E5454228DAE2B8441BDD878D9B68F4BFE065FF6BF25DBC7AEABD91FE2E519582E167940474525527EF020D55A93B613DB212425712388B6B8B773A948BB43BE8E13CA117C931EA52E720E26F6B1420DDE72A90374CAB45D36A155CE255B044E167BC8C9395F512E06D270E38222FF057B455F1B8F75B98A734580628EA7AA42603A46A7357326F579B20A50838CF5741DF1B7D86928C4CD47690D63EA0651092A91FE414731EA07514A741FF177967F1664366BEFF86DE86214ED6411F6F7F4A415E08AB5C768362BCC9BF13846323C0556524054659D0F5F5E3539CD185140529113A7895130B22853EA628AC1E8F5505697076B55C475A8A1DCDDC5494EB92E2C40805A40D152E05EDA3DA8E5682D6A6AB4D596567AB22A6EED6E55C3B4C64E3FDBD4567CB72AA8EE6D9864E16653C6826C5754D17B584967FD149146D0DB2715DA2C49F1E2EC830DF021C86B546D2BB6F3BE7E8C972E7694A6B7A5E153277BD2ED9BEEF3F91361C3A5F1637F43E2F65D7FDA2A827B952B0B6AB6CA15446932FD59EDB46CEB07587923784599EC54D8B792F51D975E273322F336F39F3945B634DBD42516D0B0105B917254305B716FBBF7207EA4A29D74CBB12612F175A1B005C44415618B3F5AC7F7DC6281DE0D1F3334E09C0073FC9EB54C19E0EC2A2AAE2767C76D7BA5A8CADA8663BB05CCB721B555EC5DF0954D5987416D516B41E8387F3E9DBED362CF9F025A5166FED361381CCCB26A268EB4390A4266B91A3C3432B01E328A83F226F2D4F6447F888BFE1DAEEF4DD53E6CE93BFC741E46517A4CCBD8C57C17DE0C1A6EE2242CB2CF856F7EA5D4CA400BD7473A5339815D44DB08E50E180DCBB09C4761B2764E90DE68365B26E3E7EFD475FAD9CC5D17D906C1A08B59DF96B94A6DFC96EFD134A07987CBCDC2544F691DD68B3DD6FF36C755BDEA6E6F67BFC812CEF38791FD15A9DE97D8C97BFC6BBEC7DB4CACD7AB3A52C7E2C0978E9CEDBE512A7E9070266BC3A8B7751D6ED88429509C3A665BBFE5ADFD59E8528D8289CB578B5E7AE2ACA786C8125642760B898AB66FA315E078A0741B185AAA8BAAB45096357CB62AE5DA5C4EC7A5A965477342F60EC6751CAA7B29C4F92278D39A7F5A2366BC440D7DB8E9CC3ACA5678F86DAA4A59F51B8F3DD545BA0E64BD41350735AA301356F9D247F0B5674FF5F986B54850979ABF215D45C9783D033F519EBF84F7D9CEEB8610EDDB8FBF26C8B642AC43D0199921A0DC730CAC0A2B49F6D00E94366566DFB79F42E26CFBCE3D372774561E5A65F9731EDFB4D415F5BBF270C8E8ABFA96FF87EEF53D29BA734BF40ED7ABAA173D6ABC7A39B614BEF479F6B9C9466AFB0AADEE4CB5ABA982719DE49055C6DECE8F2361E21F2A55F9604A5495340274A9852DDC233D5836E2B421A0A2FD243D116F5754F626A95EB61853A5F8078920CAEED8661FC9DFCD755C4D989B7D77E9E285ADC0E38891C71412B6552BBB55C59EEB65CC845F59755AC686B187704D2B5ABFB7741D2BC92B4D6336EF0E358077EC632BB25182B022F7054B4557368105CF6F7CCE1646A885AFB93E6B55FC0A4682BE7CE97A4FFA8491F82100F2648CF12EC27A84CEB00352EC694E470E9E89921629C25F20275455B3EEEA106B9B61FC6B1FB12A7E910660B3ED7E345FA19A3CE4FC317E9390E71D6FD8D9976671344CC3D7B5B4A67849D039A7A161676B0DD602D48EE8A529CAD209F09D9070A253A9D6B5872355C3D88C892961F49397B87525CCE9CC8C2B9013E6F7F418FC23AEC82C55590E065E68DE0CF01FEDE8A9853244F22BCAFBB4C2C43E365EB53B435CC8EF239DE0D10248008B561865302ABFF131641EE55C26C226DE34BACE527327B2FF135FC22C6ACAEBBA2101FED93CD03437D72059C7DC269E8EDEEFD82023F831D6F25C43EC6EBD6C28BD47D115A8AB6BCD843DF3E248CC6388C05787FADC4EBF500D6A6439D0CDE3FD24F4DF97FBE54ADDCB7691A2F831C9B8C8817C319F35D7E1FAD6616B18D1BF58F094E7E49166E401FEE485F4EE7870707471247F4E46BB9D590670245F2E465DA64A5E3842E3544EDB953223B822893C542102D832D0ACDDD10AA5ACA143A1D752362CE39DEE2888A03338F6D5AD7C44EA6DDA85B13849E8951270B06397A402923FEAAA6DD1CFEB7997B31D0B513BECC5F18180E64A6BE0C803413DFF7056E5008593504B4F16459A03141A17904FC871662DA0F4258E14BE4E25554DCD5CC8AE76C222250BA442B796F21327FE5059A9A310C824BCD1CED0728E50FC7A800A3F926590396FA1B354EE24EF3819AE1E49CB213030049C9DBFD009121FAA75A04D9850265659D18B7D645E0D985DF6D5A1362984E4FFAD90C68103168338F361D91E2D78E026765102D15B4CC11B51A50B1210AECC16B0EBA28B6500778981A6C4D431900B0A6F9B2E94219D8651A00AD237A59E3A7AAE10651C33E6E8EBA06B652C422D32E86AECC29C25E39F55B88CCD6177BF8A86E603365CC2E5F0CB20B0CA31A84639418EEA90D0E44652F051D43B5EE8D48741AD700F2D1698EA72E2C2D6205B5C35BBE90C7007ADEB05662EC1BC4D9118D8E6F765EADC0CDC5671BE7140F4714509EB70DE10598F3BC18E8A9475C19FB07401EF6AD372DB476F7035AA60D7149A0E58A4D0794FEA36360B40C25618B0131AEC4D4302A04B450F7AF74AB1F04A33CD346C028CF95C96354721352CDBEDA6788B9B0649CF6ECB77EB5032488A8C2ADD8D7D100F680B45802903BA4757FFB5FA1801FA67A815AB0D4C3FA943936ECF2945962D33E1C56609C1DA471F8B794D180F77F47105834E5BE7CC757D64D83197E2391A66EDFC06AD84F0CC1A9A6A6ECD8EC4CC38952996323683A1C4B26AFE8E8430EBB5E4B08F18707B90AE1A3188FB442BC5E8570231AF116849B4D9B7ED461E5477C0C11BF8BA5BF83577E24CBF2CAD8FC54A7FAC0167B3E28BB3A39806A47300030B57364D33EF3F5C62940B2F6B2B7848CFC3134FFB0943EA4C602B3090B3071688AA3181E9CE25C59C193FD4AE90400AADFF481B2CEC0B47A1885BF9F67BFB3777A11151C2935DA88CAAB52E154E8A6EA281C32F74CBD8147318C4A034FCFE41572C9454A0512B51F17EFD6507B6ADAE34FED8A65451A5CE4ADFD1AA08E0C8020157BEDD48EF550F70D85CF4CEE814154F644BE7338FF9A8FE4118A3345805E3ABCA5A5478E88084AFC0667BC8DF07CD678EA88E6BE12A6780AB5892A448431EC359061DC75242A4C9E818AE8992191120B18E9D556E050C738FB7C0329CEFE11222698A41A7BC61B66C2DD134D6A0D442F51029011B67F138DFAC91CEA126BC7604DA83022D3D02A0A58D32B8DAE3404CB12068AEA8F574BA495B7258626CA3895F2EA145505031DE831DD826EF9E8EE46BCFA90808978F95AEA46BC0CF167A25DDC4E1A485BD0B2A2C30545956520F3566822541C6E412AD58D8289447500018934A73F8BC582546B04D9AC8C5A59532C07468D3672650D4E13A7AF1868DC3C9185B721888308E58EE302016673063629C6A766C69414F72B95EB8DA49AA9FC59EB61701BA4A484D879AF32C4D84D5B3C2AF023B7E08AD2D712608D9D5F263724A36726332EFDF66E47B67F7641BE8220AF8C4E85C288746E851C9758AD46CB239D23615F0C92FDD600E6189CDBF8272EA57B1B330485BE6B20D43F58B4EE57206AEC1DB684C9B672D9E27024E9A05A3059396931F44595B9333795DE3F001FED3C8580BB2EB90AC43B4E4DD670CDE81DC4D244B222E881498D866DC1A5BAB0C390AA3A5EF954138518A53F3978E2597988B0641AE0C6621E20EFC8E28B6DBCDF0A48153E20B933CEF24BC6320F5B78BA58BD3D1B17AEFAD0A761B39B778BF7256DF34D655716E7B5DA8E3807DC30CCCD9BD262D98BCEA2F8EE1FA0B858D8F3F34A87DEA29F19527959A05360F4D6F7AC3A045F1878675475596066146454AE1D9C6056DE89518209B89A51D5783A334AFEAC81CC22BD4D333720A55533ABB9B2F7181AE628ED98195A659F7DE285315BD6C34565DFAC9A61C0C2D934120B5266ACF4C023E16B59C655A530B4D5AD05D9D4D6718476C487C114FB3D51B308322D32BDA9672701A45C683D614A6F45E8A02D00160856BB376F8DD0978EC01B249866A8F5C9403461531E0AB4B66E1AC30AD1DA4DAF425A10822E36EADB69DF5C69AEA58D7C810DAE7403924CAEDAF346B2AC62B9C35CBC7BE68F72CD196D7D348351AE2F379EF4BE808048E8A0F0D159F988A24061E7C30B19F601432F5914963D3D30438EB60BBF3EA8CD4DEC0C4EB855BF36C856A56D89898A860155E8D0DA0CA2CE3B59DC2C1FF0069509270B5284862FDDA1B008EA5B655CA2ED3688D66953B34C99DD6CD192F6FB0F37F3D9E3268CD2D3F943966DDF2C16694E3A3DD804CB244EE3FBEC60196F1668152F8E0F0FFFBC383A5A6C0A1A8B25A70788461B754B599C90910BB9C567063E04499A9DA30C7D45348EEAD96A2315038D3E140F5D5593BC5D873C6BD5DB57559EFE5D0A1DDD674A617A0D533F90716EA8AD4D1E6C18B857976A92BA37448EA0448C35CDC63C3B8BC3DD26B20886A6A657062967299549F6346E765F33994C93EA4009E7A67A4702A53AD599D23148490A396E41E91548E9550B4A3F82947E6C41E93548E93544E964214051C4FE4202BF208DC4B564B5D298E71E5F8B4DF9A665B1DC347555AC16D799DBF2FA88A2F52EDF8A581A4DAA3DA59FE20D06162B93EC468B2C4F05B926C79EE23F1F820C7F8CD7314F8E49B6A7F52E44CB5F655A4CB2CB42C91FB05371A154A90E82B279ED8564A694DB8A322C49C102F6F4AF09DFA88201745BC8B2A799EF5B3CAD326932A2A73109F1257994142D248FA6EE6F73ABCF9FAF79326592030A57AB04A7C2E2AE131D5608FBF5488ED36CC664902DD8F1F882B79EAC05C64D04F609E8DC3715594A5C86033DF63BD11C3D36634210638CA0FC01AC31086F832E4DED7EB4B78B0DD91CAF11FDD63147A449B6A77516D2EB41FA374F8C4D77A576B55CEEB648C6949CEBA28D3C66A2FAF108EEEBBE97F3485017ECA87C815D6B5866017743FD7E00CF355A7C4554DAA0F9ECC1D58F5FC82157D23E8A44872346BC7A124E17794A9F07BBD124B96886E84F9C0B0E346D64BA89443F38F781452964BB72A54C4ADCD1070C5F08D09A93594CBFA17E3F735F59CDB11460EF2D1D15CE959D3F32687CDC35F4501DB9813FA02B033AA869D1B7DCDC00A5F8361D7F38E2B21C246F86928CCCDF56A62964D9D3FC80964148B0202B457C8E83961DA07514A781702464921D54AC78B3291E7439D5AA4E75988F30C4C93A106FA198E4E94807C6EECFAF94802C22AD45045CB91FF920A3D1158565D06F9684220EF804E659618EDE75AA21B24ED30D1350B2BC345991F8CEA4BB1CFE9FC4433FA81C8E3E792AB3F8AEB307D2759A3E058561E68F362EBE6BECA67483A7B4D2F235952A8F6AF729B5A6D48F347691A55A70E5A804E155E738694345E037410F82A3C1A9E9C8CA94AB0E75110559E1A9C8F1B84E75D18B512A5E2455692E54D25D9889548AB4C92C3F95F5734BEB0F21DA80FB1A3352E8676DE5363680F2DD24BBDC8740A49AD431105D7EEE9AEB5091644FE3EF71001CA39A54370E5DC6ABE03E109F14F81C174EA165167CC322A7AAD4712EBA6F827584E8C210A46393EC72DFB7DDC6498657F0751B903DEC03645EE12C8EEE836423CEAA98E7721790A6DFE364F5134A8509E1739CEC857609953619DA6C25A32136ABFF47530B7A0A8EC2251C6EFDBEC71FC8DA8893F711BD6C14A8CBB90E6B3B5EFE1AEFB2F7D12A7F1ECC96C20297B35BD006FA2CE639DC492C97384D3F1088E2D559BC8B44630E39DB9E36DDC3E4BDA0499D8C1E00BBF1F5A41714D1823A2B070A32FD6808556440711EDDA8E45D965F939864475A3FA37007112BD3A78A2FA58FA6177C1501A33AE34B41462D9D487192F62D5889FB8090E5B0139475FE81856B182EA32F144F032B2A673A2F50815C1ADD910253E95794545FB6E08E978AAF5D8C3695BDCD5DF779739BB3AEB6CFDE0F3CE9CD539ADF4609FD62D2DDB0A434CB9232FB784018CB289FF164F78552268E9F3B407595FBC12635C74D62FA00273EEF35E92ECAB40CA02ACDE99930FE4EFE935E09CBD4676B6C58BBCE7A0323EC1F6C834455CDA9BE35D203E5D5FDBB2011EF6EB80C979B8247F17EE0714A5069FC88BD8145E5346D031775DD7E005337282347C87AB6D6EF65F0559F8F9EA8E5532750AFA75730DAD89744D81A9A54973BFF104357FE55AA9BE4394B306C215F67F46F713FDE132EE303EF82C68B94FE7D75FF3BC3036E4DFEF7ED9E6D9B18C27B755B245F148D61697C89D3547A6FA813C75B2517E9678CC4592AD35CA8149F469108D5C96E3D22272FE9FA874D7751CC57E2CD5E2C7FB225AFDF71DD77D833D8C55561623F96E845FAF617F408825BC87203C02A48F03253D095B25D68FF1CE0EF0ABA5C1648931CE75601E5EF2CBF1AE6790E523D0FE80989E01691D99A30ECA687372DAF076672EB83E8DAE3C51D1B81DF7DB6B4B5FB110E3EF6CDCFF14E349628935C4EC5DF80AE34A96ED73C587CDBAC135D5EE4D7F82A91B63826D98D966CE60F7F4069B495C07C11C2D772A0DF91705F0660AD7EE0DFDD18EFF6219194B32A6D58B325C2B635F01EB77683AA2F25F8FD238D41256D034CF2F0C0E7836BA90CACA520EFAE96D41201378B771A484C69CDAA08102FB3D26AB13074E16FB9315DE9D24BE527EDBC19866BBBDAA82917E9A75D189ECEEF51984A18D7F0420CCCE6075E65CCF80EF82A2938DAE4DBCE1D174C7FBA10E3A2F3FF8631762D05C8767DC7ABEAA91FEB0CEFCAC09489D43BE28921E7014F52E7DC5024764EE08E630F3D091921486A0BB7DEAAAAA3CDBA72BD8211563BC9938AA2379102466F6DD9C53E65877AE066F4482144C522B5FE55A6D4BFEB10A265F84E2EAE68CE161A253467475A861215E3791645E6B3CA9EAB3A6F1CD0020737FF0A8B00264D814B1405F738CD6EE35F71743A3F3E3C3A9ECFDE86014A8BB0AE65A4D237E2175FAD42971EBDA2A14BF16AB310ABBB0740A554D274C545A8614E4CD54B3F14F5F3E41F5802430512E653BBEA182A270B91C28928E1D8CAC527FE8208FA50EE45B4C28FA7F3FFCAEBBD995DFCE71D53F587597EE67D333B9CFDF77C46314AAD8F6B9C2EB45D288FF045E3D137942C1F50F2BB0D7AFC3D4B2AFF36AF81521374CC07B13AC4A83F62C73E89BDF249EC479FC45EB720C61EDEB42B4511B0D36EADB45922C2CAC877BDBF61221FE943CD35CA329C44B414CE7BEA0CFFC651C5C30430B13F3D516B427F7A20C804FFF4408D09FFE905BB5504500FC4E4E09F7E897A957442C84F0F14CBC09FFD090145ECCC970D73C40DB37495F3019F2A5EA70F70B3164BFD015217E8F205956E53C659F714F4E80F22FBB073AF38F3D63EA75F1189726FD512C6D1D7C394B2212DBD9163A3597AD95E1FDBEC5913588CD630D54490DC5BA002112899D6C6DC5A8B10943E14DD3C12A507421DCE1A0EA25017C0716F61E60F1952204837112154EF434C688230EEEDFC55F11CBDA8944C3C4747F9DE54EDA46C3141201D3B5055ECD4BC1033D287B8E423467AA0C8078CF4A1963621237DA83075D4481F07A6266E647F825D1577716F4582376494E1C7DC56625EA93FE90D9B8FD8CD95FA95DB3C676CDD1EE72E0FBFE863EAF82777C729642BABA6D2CB8A03EC349ECD541681189FFB5C5A054DDC5B513A8804D4CD789709EFD8893AC8A35BFB65B54E4DB3CA52EB2BB2268E9E8735588587F442AA8811D99F46A33558D9DBB5C8046BE459379F5DA2C78F385A670FA7F3A3C3C3164F95EE846D66DA2B024BC3E8825216444F6DEE819A688E1D17171FD7A4F34AADE2381684BE06EE23F37BAFCB8470F4726726056FECEB5D8A83ECF1EB3FB622CA841C6C3F217C00473F46186CF8C6D1DFD0B4F4BCB0508ED3D89E16109851BD6AADE4911090B17DD780088CED6FBA9BD88BE2C230E92E55CD3CF987D945FA250AFEB52319B7841B548951AF2C07A58EB5646CA3D835F57B50E6CD0118F7567BA8BCF3DD785ED4EAA4CB32B11FBDBC1036C11F075320814089763830C44584AC0574710F81F270D00533DA849EE9F4BEE33FB9EF7DEC283CD31E08C86DB122BB47D84145153D03280A474134CFF96822A0EAB05BC345AD9EA7ACED744D50C2FB3D92307116DB6B365268450F3B403BE586F6C49F72636FD4AC0877B8B72063A3261A26D352F7B502861DAD3A7E627BC46AD0CA61E4B5E996C51E22501CC2BDC587BF575936A8614761960736EC4F5B548406DCDB3914C20B8E7ED1E0F4AE869EC9243411FF7CD84CD441FF3CADCC3A9C59C795D9DE24D8E5814E110B696FB1319A22EFED18EFCFEAAE8E513231645791FA3ADCE83721FABA106942F3B5A75204E6F3C06121F21CD8233B3A52A4B90EB4B8E872ADE908A1CE3A5D7B38394C81B1C3F656B8F9130D6534322F67CE6FFEBA550725F3A1583561C9DA3F195421C9DCB693A2560F97F0521CB0BD85B29797E62AAA98EF27F46E94CA006313DBC09930633D1EF7ECA2E2587A071AE2DAC835CCC1662CDC0AF9561D173E5BB99BB9393014B7BEC8143CDC1733015518919DBB25DFA9A214BC8F56F91D231BC7A01C0B8D5A72C0A45EEEC22CA0DD264D135D40625243AAF186664931A93CA9C38303991A010E4EA8FC42D4AC21CD1214C801F6AE93205A065B144A63104A5A4A5ECADB9AA698738EB738A222551AA54D631A775ADA6A4D5C58112636706174F460E05D82874584E08ECCD213B39E053674EED7130648ED34DC073AC4215D45C5397156DCA5930585D2259223A9E7B1A8D4C06A1C9D795431E97C4FFE632FF1A4F0E79E2C98CA0052C38A992A6A154BA84E7B1682058CCB35591088BEB7773A87EF661AF952EC640A39038918C18198973362662FC246C3B77E70A6F79A56B42979128F023A29E82AEC38DC4C305F8A9D5D216710B8316E8D72578AE45E20A6E1553F1053F96F2A5A2B5D7AA60129853763875904F723885E13E45BA25964F5880EEBC9F2060D28E2380C0F53E0E6B16002B94A0E8113265AB744B4CC7B56480143874F162A0AF7CBBDDCB154AEA46CBF94659EC75E66E54DAB82E3881B9B1E8680E94107C9F51B43DF5012B013F4387FE571EE097833F4BBDC5142BD5F8A2EB2DC495FCC1B047FA0EF8DA65B65815E90678878DFCB8584D1F548D1AED271600CD4E56E257B8CBAC2D347D3ADB2C033451DE0E83445D45DDB7C5B84BD196DACF0B9AB51267910B0A95F8EE16E49A5FAB98057F828F48338CBD77345E3A6E7F251D0077D36041631D25C1B66F83785C3367818158C769FFD197617CE3B4285B3D5263C113C422E949A3DF87961D0E83FAA6816F6021D47EFCB51079840BD80EE0574FD1D368AAFD6EDED59631A881BE9A4618DB8510F1AAA6BBDE24379FB83BCE9DDED8D80C02E177C752CC011DFC3AAC837B0C330A3DD97F99C2E5FA50DF8F4EEFCACE2EB3C0BF1A71F48B9BF8F3001BEA7002585E73203A6BA0407A726F5B70028984B9381141BB67E02A0D26F8E2DA7D2F05CDF61CBDDD7A7D2363BA8CD57748751AB6A97EC3B2042EBC455A9C69D5CD09F988C67A43429BCE715ED8DAAAF33DEB077804B2CEF5953B9CD8ABE3575BA9304626A169F29B6A3EA09194A37E07E50210ED64EF3590F7575F09EFFDE35E3C4CE7D9B5A4247F9C573DEF27E3E6BBCC44453F8E2EBD6AC4B6FE16C561790E0C237C118E74B8D3079AA6698228686189F31A921264FD51053C4D090E88524B526165035299633B6CBF8A9008D32B9EA16994286E604FB79A94121BF6A324F4EEB168552C6218A26F2C038C5228A96E58286C605E54C6A59C8AF9A5D7D8DEB36B9226624B106508AE68A4C755B34DFA5A1C2EE57D3585140DF6051C6BACDD28454D3685942DF6A59C8D0ACF28E476A5E5912EA86A2B0B93F920A278B5AB104D4FEDB74FB0967C5AB976393A51591A9DDB298BEF1D2E4CAB107A54589A90765317D0F4AF31BC71E1417CDA60E14A5F4ED1737F20ECD9B9B36356BD7246BEA21EFB44C26D4109B6F6AA7BA67931BA972C0168A4C8B7134172F720B4D1ED846956D279D90422621F5065A669B6510734E82040F93AD871B5BD63C2A4E0B07B5A03A176A9629606E8BC63091DBC8532BDAE447B31FE739D618362F204D593DC285E2F24819951B502F1937D5195352D43455DEACFCD5A3A81C93F6343AAF741AE3F4DDBCAE5A8D5DF0C3B218B2320A00306EBB8801DE060FEBE039018356DD860D90AF3BC803A353BC470648878172F46A0DDF7DE8B26736306C83FBB6B7210B87D5BCA6EA14DA6696B5FEC7E074DB7B2C7303014F56F970B4A72561FEE193520902C3D1C79D3D4A4F598031765EB5BA2B73662C428E8625F2698A219041AA8D073634C7210B3ED4853D0E42519B3DE70914C0D39B27569467344B5E807E783D30833B800A24E053A53B3BECBCF400CEB470EFF3BE740C87E69C9AB24CCFAC2BE6D9956FD065BE37648DCB2E851B14B4335B384CE9DFA2D8AD56CCD36DD59A1B08885859C03B6BAACB02336B20AF9E2158C35D8D40C4CA029D59A37228017863E57BC2AB75D2DD43A1D7296F1514B515A73E819854CA3F734A7F071BE640AE11AA1997066518CAC4D8041BE1EB5797CA5ABF1716696EFDA0B5E59F2DBCA5B859EE28ACCA9F2F734A8B660B890C983E0F219007628BDEECD641DD014C917A61D3B83A0F6C1EAA3C6768ED4879A18AB8DBEC42845669C6C385B3D6DD7DE8CD0DB871F02A9B3ED8F6916540933A4116289788D146CFFBB9A9C3E26A2733049B32584EE80CCFFA920DD27B472510988CCE0C906C9F1417F06AFB28B5859470875EA71B6EE0397B283B1A9A8157E19A6BBB9E3AEF64513C6A9409E467162784F865BCC2619AA79E2C3EEF221A7FBDF8758ED360DD90382134239C5B053644AB3217D17D5C9933093DAA8A4821CD33B442197A9B901946CB8C64D32FFC06D17A3ECBBF5D4A2F33BFE2D54574B5CBB6BB8C0C196FBE86DC173FA95994AEFD9385D4E793AB3CF679EA6308A49B010D597F15BDDB05E1AAEEF707208CB68204B5B72A83E9D3B9CC6850FDF5534DE9532C6E7E2A4225FB6A33B1EA0637BD8A6E10FD6ABA7BDFC8AAFD88D768F9D47C025545C43C113CDB4FCE03B44ED0262D6934F5C94F82E1D5E6F12FFF0F23062DC95EB50100, N'6.1.3-40302')
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'202106202023014_MAR-refactored1', N'MyHealthCare.Migrations.Configuration', 0x1F8B0800000000000400ED5D5B6FDCBAB57E3F40FFC3609EDA22F5D8CE4EB11BD82D1C5FBADD6DC786EDA4E7CDA0257AAC1D8D349534898DE2FCB2F3707ED2F90B2575E5FD225197498C008187A416C9C58F8B8BE45A8BFFFFBFFF77F0B7E75538FB0A933488A3C3F9DECEEE7C06232FF683687938DF648F7FFA79FEB7BFFEEEBF0E4EFDD5F3EC7355EE2D2E87BE8CD2C3F95396ADDF2F16A9F7045720DD59055E12A7F163B6E3C5AB05F0E3C5FEEEEE5F167B7B0B8848CC11ADD9ECE0661365C10AE63FD0CFE338F2E03ADB80F032F6619896E928E736A73AFB0856305D030F1ECE2F5F7E8120CC9E8E410277CEA3C704A459B2F1B24D02E7B3A33000A849B7307C9CCF4014C519C85083DF7F4AE16D96C4D1F2768D124078F7B286A8DC2308535876E47D53DCB44FBBFBB84F8BE6C38A94B749B378654970EF6DC9A405FB792B56CF6B2622369E2276672FB8D7392B0FE7470FF126FB94CE676C5DEF8FC3049763185D8CCB4E4E2780E94EF9FD9B1959EA4D0D108423FCEFCDEC7813E291398CE0264B40F86676BD790803EF57F872177F81D161B40943B2A5A8AD288F4A4049D749BC8649F672031FCBF65FC749F61887417CEECF670B9AC082A5507F2FFAB8E8EC7994BDDD9FCF3EA2E6808710D6D0582809DD0559082B12086068D2CC6797E0F90246CBEC09B1103CCF6767C133F4AB9492ECA72840730C7D84A0ABADE576F3900D5311F43004F686AA687FA88ADE0E55D14F4355F4CE7D451FC1D76099CB00D97499CF6E609897489F827521662B49704F943A4BE2D54D1C3662A6C9BCBF8D378987A11CCB4ADC81640933BA79078B468229E51AD18A9692ADA6309A6C6B23D2F4928C60C46D1627F0EF308209C8A07F0DB20C2611A6017376EA207801A2E5062CFB9747BFC42B388C88C53521313B4C65FF7C0A3278112FE3DE6BFA1002EFCB2035DDC2E46BE0C1B4F78AEE608A34C738C24ADC20A3455438D8427C8D860D4DB074981EE62278C0F5A4D63DBBAF26D55A215F4DAAF5C6B471682B92014FD6BC3A57DC404136D7445119DB46DEC164955E3D96934ED852BA88B8B9B2325C9BA505ED1B5E4F2631838902B2360B0A081A2C2A256AADB1664100A3A566515378DD357D4FBBA6D31508C2FE85B4EF2730ED7F7DBD7E8A23F871B37A80C964B6182DA42EBBCD5049E656E28015C12D65024DE655300C305F4FD0A6E7D3DAC75B9FAA2E9C7417ACA0758B4F60EA25C1BA38A49BC86CE9B4F2B3F346AB22B49C3CF5F26C3B73884F5F37E8B2BA5668F380BE7AEA7D2E1D87016A12FE7BA0AAAE3C6FB306FDCC374E577DEE6157E44C76B6960EAD146C5E2EA8D4F0564221D7A3EEE06A8DDADC7E41A5A8BC4A08495D149770A5DBB070238DFE37E8F53F273FC4FE4BEF95F477882A150C9F4112E04195EDBC0B3454A5EE99F9484A085549C15E5C59BCD3A69CA5DD410FA709BD4A8E51A73A0511774B2303E93E6701BF601A4D9A56B3E012FA8107C21BE8C5896F3C0568DB891D8AC82BFC2575553CEEFD14E6250DBC00445DB7D4A883586DEE4AE6C85F052946C0493E0BFA5EE833906468A0D683D47606BC2044433FC82EE62400CB284E83FE0FF28EE3D50A8D7CFF151D85214C96411F777F52415E08AB5C760BC53825CCEEA9D28D049716E284B7BCA4486EAB1AFE31CEF05C8A8214C91DE8E7A48248A292490ADF33F2BEE991D1079C8266F695ED554F29790C86A72E291B9AB2806658AA52B64352CB5A93A63665A58DAD8AE89A5B97B36D30128F8F8F068D2DCBC91A9A676B1A599471A09C1427365D34135CFE552D91D4D5C3DA653CC012F1D176B425E45E875E52D72548BA6A77CD04EB4A2997175D89905A5FEB9B99F328C80A2B839ED59F1B08D2014EA36F608A003EB88A552B19C3A927EC8A64A7D4D86B902DFA567C66DA315CDAB257F927EEF40259659C86A02C68DC07075AC3D17A1D967CF894625384768B0943E6751191D4751624A9EE1A6F6F77D748C0580AEA0BE0ACE689AC0817F02BAC0D823EBC64F63CF9471C444E5641CCDCCBD80F1E0307C60EE711F0B2E06BDDAA0F319202782B644B67B0EBE9DB601981C233ACF7BBA9F53A4ED0D41BCC385E6776B6FFEECFAE6A398EA3C7205935106A3BF2D7204DBFA1D5FA17900E30F8D0DB2448F6A1D568B5DE6EBB39795DCE86E6EE5B7C86A6779C9C46F8ABCEF42E62EF4BBCC94E233FB7B7CA3C5EFC181270D29C23CF83697A86C00CFDE3781365DDB6285899D02C5AA6F3AFF565D671088295C48A9E567BEEABA28429BDB004EF9D252E66AB995EC4CB407252CBD650159537B528A16D6A59CCB6A99898594BCB92F286E605B4ED2C4AB95496F34172A431E7B45ED5668518E87ADA91739834C1E9D1820ED5F419849BD18E0A1970E553D41150735AA30135AF1D257F0D7CBCFE2FF45F54851179A3F215D46CA703D332F91E6BFFE73E7677543787AEDC7E7AB6453216E28E808C498D866331CA8445713BDB00D285CCACEA766315540C9E7EC5C7E5EE8BC2D245BF2EA35BF79B82AE967E47181C157F535FF0DD9EA7A4B72F697E80DA757783C7AC575714BBEBC6DEB73ED73029ED91C4AA7A93CF6BE96C1E670EC115B0B57CC0D35BBB85C8A77E5952284D9A022A514294EA1637A3EE745B11D25078951E92BAB01362126373290733D4FA00C49164B0AD370CE36FE8BFAE22CE4CBCBD737345D1E274C04AE4B0135A2A93DACDE5CA9EAAE5442E3E7F9DC592BA86B113454DBB7AFC1024CD2D496B3DE3163E7F57C7DF7D38DC9B4FAEC602B0E5F4AA08BC4EB03127D80F03586C95015AFB45E55FBF22555257CE9D4F49FFD13FCE82100EB6EE1C27D04D7084D681166C6C4FD15EDCD2BC98C53849E415EA92BA5C1CDB0D72CB318C83E2254CD321AC3C5CCEC7F3F40682CE37E9E7E9090C61D6FD4A1E37671544C4B5445B4AC7889D035AC61606896233CB5A90DC17A528D34A3A53644EC994E8B40D24C9D5707520224B5A6E24E5EC03486139722C0BE71AF81CFD069E9979D8058B7E90402F7346F07300BFB5226615910E09EFEB2E034BD0785DFA24750DB3A2DCC49B019C5D91501BA63B25B0FADFC721E45E25C422D2D64F7AC9DF289ABB3A2EC51788C4ECBA2F0AD151EBC83C61C83AAA80B563230E21DBBD5DA200A6C286B7126217F1B2B5F042DFBE0A2D495D4ECCC7EF9E1242631CC660BEBF5AE2E57280C39EA17606A7CFF8C914F7B7BDB2997B94A6B117E4D824443C1B96936EF269E4CF0C627436EA1F1164F7124DDC00DF73A2B61CCE777776F6388EA8C9D772AB214F043CA3C9F3B4D14C87099E6A009BBFA748760451C68B8520F2823508F5CD603E3594297838EA4AD89C13B8861116077A1E9BD4AE88018A9B51D7C6083D1DA30E160472D4809246AE940DBB3E8C6533F66CC0562B7CE923650F07325D5B06409A8EEFDB0237512844390494711149A011C14D6904FC510931656073237CB15CBC8A8AB39A5971FB8F4404483DE0F36B0B92F9BE13682AFA30082E1563B41DA0E41F40900146F1B64E0396FAAD052B71A77868613839276DC4004092F2763B40A489622717416621ED4859C7C65FB411786661249BDA98587CD3937E261D1A440C9A8CA34943B8388CA3C0591ECD4B862D83D05E0DAC9878155692521F198CABA8D8B329E789056FCC8270C89A6F1991833AA71707FD319FFF96C1CA0CC76B7C3160D5AF01A481D5189BB4A78C38348A283088CBD20E6F74909601814E857A311216538738D9A3D1F14D8EAB11B8A95858E36C01C4DEDB52655DE3CA4D6C06D8A03A3DE24ADB3E01E4C57ECCBA89D66E73A164DA103B0C25574C1A20F5D51B03A3A5DBBE2906581FFEA96194091E206F5FE9C23C084669A68D80519A2B93C728E792211B7DB97F0671DA413848992FFD72673321A20A174E575B03B1B799C11410B99E19B7B7FF192AF079934F5003963A989F3CC7869D9E3C4B4CEA17BB708FB38234CED586325AE069DD11040655D94FDFF195755D67865F48B8A1DB36B06AD6134D20A0A9293B262BD370A294E7D8089A0EC592C92B3AEAF0AEB6C7124CACD7418E42E888B123CD10A74721548F463C05A146D3A41D7508EF091CF5579ECC66A7EFDC33118647C62AC0AA9F9820F70795D3F5D400AAECC100C0548E9149FDC41346538064EDFF6B0819FE3910F7B0E49E122181D9382C4F1C9A6C2F8607273B5646F0249FEA9A0040D58BBEF209983EAE44DBAEEC9D6E44192F2C85362273C9927824D9A93A126FAE2D536FC4BD1846A5110FCFE41572CEBF420612B913086D135DBB7999E34FEEC761445A38C95B1B458B1A32008264EC35533B96439D371406F7B9F93652D913FECCE1E421EFC9B328A60F027AE92D9396E6FC2C2230F15B98D10686F35963E6CFDA0A7298A229D4F66D22228455A0860C61EBCF5121F2345458B36E8E145B404BAF362115358C32EED590A28CA744C4187B366DCB68AB2E71F3587B3C0DD14B9008C830CBBF8E06F9BCA28456B17A6A08C91F47E4A84ACF2234559411F778ECB30BB1868EE8AADA806E79A56D47BC0A89AE235EDE45DA112F8395E96817677F1AD206B48CE850E11D790943DCC4E908155B4721956ABFAE2351A9F74222CDDECA608E00D9F4002633A3568524D3815052B55C590A8789D20634346E5FD0C45B21C48908E53E9D0C0162E9132C0184B9FB8C28C9AE0632AB784EF191B99AD5DDA0961F6E8937732C2388914B22AB88D33D37E08AD40D4AC01A339729AA4B5AA729A25FEAC5D38C6CFFEC12B9F10879A5F5F7617AA4F2F8A1B844EA0C4A1EA97C7CFA6210EF5222608EC6EF84BE40927A9E105D9068931A42FD8345E91921448DB92F0533D846DE14148E380D4F092623FF09823EAB9076E6A6E2996D9E918656FC8AB324911D3FD1BD5C9755304C6FAB4F12233BD39951864F65F24C6B61DE6F74E12636F027FA2FD7C5151CB633E9570F9D732E17BA912D8BF3AFDAF698343EEE99B9A4D1757F38963D2C25584F0C8C98E9B5406DC64C74A9DCC3A9D615B5C931B94A89F771CE1955EDE1F48C1259D22A3BC7D8D276621463F72A6754D59FCE8CE2E366F32C521B72521D929A72920A05B9BD5430476ABC49D02ADBEC122F84ADA61A2E32A34ED9080BCC3A753D3120A5C74A0F3C629E63D1CE2A8975A16A2EF0F685963D34233E0CA6C807EBF4224837C9D4F66D9D049074A2F58429CDCBD8E6DA82E0DAD568F5A6AF60FBD211E85B58DD0875DE09D4876BBA5D80D0C04765E9C098F8B4D6FE594B1E7279A80F0D5D73A5392DD4F2456C65A2EA106767D29E379C3909C91DE23CD4317FA4734E6BE0606CE2D09A27BD4F2041EC58A1F0519936181A37D042863C57564B168939430FCCE0E3138A0F85E577EC66B7ECD4AC5F6A64ABF4425D4745C1802AD85A7DF75BE71D2C6EBD27B80265C2C10215C101DF36202CC22056199760BD0EA265DA7C59A6CC6ED7C0C3EDFED3ED7CF6BC0AA3F470FE9465EBF78B459A934E77568197C469FC98ED78F16A01FC78B1BFBBFB97C5DEDE6255D05878941EC0DE54D7356571827ACEE4168199CF8224CD4E40061E008E3C77ECAFB862C29B6EC9FD4355257D99CD8F5A75255195C77F974247F50E9E985EC3D433D4CF153630C8C3330A8E3BB92FD1B7B7488E80848DCE494689398EC3CD2A32081F23A757867525299549E6346E370F194FA649B5A00473FBA43D86529D6A4D695F48890BD26A40E9AD90D2DB16947E1252FAA905A577424AEF44940E160C1439FB140EFC8C3462E792D14C234EE15D4D36E95583C174537C2B63353BCFECA6D70588969B7C29226934A9E6947E895750305989643B5A687A4AC83539E614FFF91464F0225EC6343922D99CD68710785F785A44B2CD44C9EF155376A254A91682B2B98413C94C2EB71565B124151630A77F8DF886150C41B3992C739AF9BA45D32A9326237A9A9B7A5792474AD140F228BEFD3197FAF2752B924C99648142DF4F60CA4CEE3AD1628690AF7A519C263326836CC6BCC215BCD5640D30AE23B04D40A75EA12229511916F4C88748297A64C6842046D8A6B803586305DB065D8AAFFBD1DECE576871BC06F8314D8A48936C4EEB38C4C783F86F9A18996E4BEDCAF3366BC0638ACFB5D1469E3356FD7816AEEBAEA7F3485067CC5B5C815D69EF630077CDF7FD009EAAB478778D5BA0E9ECC1D58FDFD02697D33E8A448B2D46ECBF30BB8B3CA5CF8DDD68929CB50E7327CE19AF8136325D47A21F9CBBC02217E4563A532625EEF005862B0428CDC90C865FF37D3F635F59CD9114C42E2B2A2A94FF2EBD655038F62AE881DA5D9DDEA04BBDD8E5B4F05D6E6E8052BCE6436F8EA82C0BC99B812443E3B7E6693259E634CF801784080BBC5244E75868D9015846711A305B4222D942C58A57ABE2429752ADEA548BF10843982C03F6148A489E8E7450DAD7769112228B48631121FEB81FF9C0A35186C291C6486AE2E16AC0645E72F6A3674CA99FA12C434E93042451A81534A8C8BE142965CC5F39C53A540E2344C5F173E47478496C2B80CFA3202BBC4F281ED7A9368B2A48D95D6895664325DD84194BA5489BCCF493994EB6BC3A663C485B5C21EB28F433B7F20B7AC1CADD24DB6CA644A49AD431105DBE2E4835A84832A7F18F3810E8604DAA1D872E633F780CD8F3483AC78653C0CB82AF90E554953ACE29D96DB08C009E188C746C926D0E0BD6EB38C9A02FDEAB0BB287BDBDC83F388EA3C72059B1A3CAE6D96C24D2F41BDACCFC02D227762F41E658191B6C122C6D32B05A7316076456FF372E06F4241C1597B03832F816A35D0992BDA7113EA960A8F3B916733BF6BEC49BEC34F2F3BB85CC6326389FDD82B6A0CD6C9EC586C6F3609A9E218842FF38DE44EC4D309F6D4E1BAF61FC5AD0A44E460F10FB00F5A4171411203A2B071232FD6808552C25761CEDA8E44DE68FA289644B5A9F41B811112BD3A78A2FA98397137C1541403AE34B42462E9D507194F635F0D97580C9B25809CA6F7E85CC093F95D1178AA7811599278E13A888FCA1EC9122A6D2AF28A9628153DB4B497CF0D186B2B7B1EB3E6E7663D6D570D2F98627BD7D49F3D328A65D44BA1D96A4361D5CE67774FA48BAC1BA4229119BC91EA0AA8FFBC126B6E54B627C7ACFDE0D34E936CA340FA02ACDEA8E21FE86FEE3AE18CAD4EFD652A9F6BB730646B173A10912655F8E7D51A13A41BE7AFC1024ECD90D95617352F0CC9E0F3C8F792A60734A33167C1BC74867009679819A4058FEED5441FC0382A60C0BE8F28216B4BC9B157CD7D35D1EAEEC53C28C4C936A737311421E764DAA9DFC3C4EA0D848B8CEE8DFE878BC8B68C20DD8068DE729FEFBEAF1F79A6BE89AFC1FDA5D3E37D12DB7EACC8B3FEE1AC3D8F212A629776B52278E374BCED31B08D8512AD36CA81421F1394275B25D8BD0FE913BC422D36DB6173E7B3E19F3A1FAF3EF3BCEFB0E6B0639B92A4C6CC7143D4F8F7E03CF427033597600F083047A99842E976D43FB7300BF49E85259429A6853EA0798BFB3FC809BE6B990EA4980F77908B7008DD68461373DBC29793D30935B6FA7970E8F1FC9D8D0F6A3A5FCBA1FE1E062DDBC8937ACC9479964B32DFA2A684A936A775805D91BDA3AD1C6AE6009AF126E892392ED68F196CEE28733469B0944AC7257D3014738B79F06C2AFFA817F7793C2BBA78453CEAAB4618DAF10DB96825BC5A51D545D29C1A7CF380C0FB70C10C9C3039F8E2F24320417C6686EE11B421330B7F1C6719484F6B88AD8CE3C1B8D260A4D57FC840FD19A2E0D95BE64D47A462B9BD66825E7E9C74D181ECE1F4198729056779F8D46650DA86B2E62ABEDDD50F59DFC02487357291824967A471011E41C20886B5C37E030DCB16C61670008A3F6B59125E5A79676D0DA19AA79F2760A4244F33AF0568B0F2EA61D5BA45E0DCB94FA771DD3AE8C274705BACBD982C3D6E5EC48CBD8766C80B9A2C87C56D90855DADF0E2EB073FBAFB0F0A86F0A5C822878846976177F81D1E17C7F776F7F3E3B0A0390167106CBD079EFD977D78C62E9EDBDC5B1F4A0BF5AB09FDB47E4C354D2D4A7422610FA6B757B2C0A4377F02BE4C050818478F04EEED47FB060291CB0128EFCB8780A288844CFD59D473E7C3E9CFF3BFFEEFDECFCBFEF894FDFCCF21DC8FBD9EEEC7FE6338C516CD15AE374A16C42B9A12A2A8FBE82C47B02C9EF57E0F90F24A9FC853C0DA5260A8E0B6275CC3B77C4F65D127BEB92D84F2E89BD6B418C54A59533451241CE6CAEB49922CCCCC857BDBF43241FF1B1F935C8329844B814CC5B6A0DFFC6F9C1C10010C1E81C516B62D139204844A373408D8847E704BB55483A07C4F868746E893A95744C0C3A0714CB4874FD09014930B7D70573C405B3B4D170019F2A809C0B70933628FD01521579ED1595764346D95A14F4F00F24FBA075AB2893C93E875F121A6D6BD512C279D4C1909231D69C9123C3AB39595E9FDBAC5913988CC630558434DB5AA00A42A211B58DB9B41631D15C28BA79683407843AEC352C44A12AA2D8D6C2CC1D32B8C864762282F9BC0F31A1880AB6B5E357051873A2521201C62CE57BF36927658B884A66D980EAC34ED53341CC5C884B3A8499038A740433176A6913C3CC850A53873173B1616A0299F527D86597C45B2B129C2183BF7BB19B94ECF7B2B9D961F08CE2806DED489631C52CB98E3FEA2406E9F8636DC6BCF8B65323EAB86576F5979F75AA9A94D5AD77E84D68280733B18A78E6845411F6AC3F81AABC2FDFDAB948C41FA359379F5D82E70B182DB3A7C3F9DEEE6E8B9B127BC22623ED1481A5955C41290BA29736DBD0264059C7C945BBEA779EA95568B282D04360DF33B7C74A445432275B762E1E595FC7E21464F7DFFDB91551228A56FB01A16392B9B9032623928D7E84AFA4E784857CE8B1F6B404B1C6E4B3D6481E3131C6DA374D1054ACFD415B134E8C9D183ADDA5FA324F7E333B4F3F45C1BF3628E30E71032B31F29965A1D44D5A99D7C714DB5AEDA172D5B4E379F155275D960867E6E482A289673698022988FD6586034DA82FD165A52A9497A0BCD803578F36A6652ABD6FFF67FBB58FEC8563DA0301B92D5678EB6C33A8C85CA90545C581BDF4633E9A08A81A6C5771F155CF43D676B82628E1DD6E4988D061ED351B2E5A988315A09D72835BE24EB931B7A99444F0DA5A909181C0348369A8FB1A01C38C561D12AC3D621568A530F24E77CA620E115168ADADC587BB4B21324E57476196C7EA9AE07EB9AD619F39B6C431AF5ED1B57523290848B5B5A3D844B672711B5D07B7722474EAB03D5D0D245B1B5BDADC3D4A627E6C2D3646DBA3383BA17067CF54FBE24F0CD95544AA0E97154D28AA2E449A1054EDA91401A81C709889B0246C91191D2EA252075A5414A5D67498903E9D4E74AC5C51843172B656B8B9130D65D41D27DBE9AFEE9A5507DF71A1A235E177DADF8654A1776C6DF9968A93A70E5A1C17EF666BA1ECE412BD8A9EE3DA3AA01BA53290CEC41670229C4E8FFB45B37823867E579A8821FC17FA301E060E5B74AD96139FFCB89B21AFA02B766DE12938380A27425510223B77F8BC97F97F9F467E7E7C4A7A88977DC1F1207688D4CB4D9805B8D9A86AA40B704C6A48357EA62429229526B5BBB3C35343C08109965F005B6CA45902023E90D47512445EB00621D707A6A4A1E4C5BCAD69B23927700D232C52B95E9A54A67054C4B5D6C49919A1630315A0440D06DAD9725844308E9E243D36EBBBC086CAB175C200A9DD31FB4007DBA5ABA8D827CE8A6B0234A140EA013E62701EE5470EACC685944615914EB7E48F5B892789A7EC64C15486E61956CC54F180484275DA77215884118F260B02D6ABF15EE54ADB0C235D8A1C4C26672011C3B866D27286CDEC45D828F8D60FCED4FEA8923A391FCD5140278FE0291B61DA73931C5E26C74084B054C95D1D41B248EE052B0A3FD47EB0228F832AACCD24D8E0003091F876DDABDC783B43A6271125F35323DB252DF37D80D0C8554F864820B6CE1B1F8682CBBF0E02E607439FB1441A137A9433E4389A3A6DE37A2F7A119CD4B119FF3B4AD766F306C19FD0B05FD1ACB2402FC8D344F3ED654B60F6E4BA8555F218A813BD13BE4DA82BDC0814CD2A0B7CA7A8933DC43E31D45D9BC44D27CF261A135FEA7082481E046CF2BB1B71B3B852FD1C81A9DE3F768E38C3FB2B49E5BA0BAB51D0270A892E1631DC586B46F887C2611B3C8C0A46B3270D865D85F38660E16CB4084F048F22FF2CC51AFC7D6150EB9C26A956EC62368EDE97A34E6084F00ABA57D0F5B7D9285EE4D9DABDC6341037D24EC31871A36E3464C77AC52340DB83BCE99DED8D80C02E077C75A0B109DC8589BD1109EDBECCA774F92A6D10B8B5BC5671B59F15F1A71F48D9DF8F10C14BA7002589F32101A6BA0405A726F5470094984B93811419927702A0522F8EFDDCD2775872B7F5AAB4CD0A3A9D4BFBDA29F25E10FE71E2AA14F1A83AAD3F1119DF91D2A47AF27E62FA3AE18F762F704AA36DDB2BC735D6BABD4EB79240C497C5138C66541D2143FDD47D2F46F36467CD341FF113EB3D00E3947ECB937023A5DEDDE4D051BEE64ADBBECE678D9F066B8C5ABCDC493AD515EE1E75010E2E741584792C57099127AB8628A2A988F0DAE02A22F2641511453415B17E005C6D6C0159956C396DBD84A5B8A05222575E235148531D63C1CA55C8E45755E6C9695D23534ADB45D64855D04FB688A466BEA0A6724639E36A66F2AB6A2F8F6EEA3A99224615168BA9A4B622535E5591AFA9477AECC1552A2D296A81B4B0A6399C52C30B1FB64455BDFF103702285D7F8459710F6459656957A3ABB72CA6AEBC3442B26C416963A16B41594CDD82D220C5B205C5D1ABAE01452975FDC519B545F5FAAA75D59A55491A3FF06B0F9129AA88CCD7D5539D3CF1955439A2F95367EAC83727117C054D9EB08A26DB401601891802F205A5CCD60B2062DF20923A44B61A6C64593D0228AD54A815D4B9A26A8902FABAB0573D5F479E5AD1463F9AF529CF3146B07EFA28CAAAF1CD14E77B4ABF2CAFF0D89D112559CD4BE65F451FC5B1CA22AA4FA10372BB134AFFCBBF95AB750BBA5B065D96FAA50AFA6DE6C3EAACF3629D3427A0D132DBB041E47D29E481D64DD3210338E5B8ECBD5CE3B5EF3AEF2B28E8B6C6A1D0599799CD5BFEA56C57D66694951E71C2E136F7A1A33A22DC69E4DD51EE1E98F117EF1C4A1068B602F6EC91FB6E093863E8E8A53A44267AA3DC64086890AB2E4140B875B0678499779280292DDC9A9C3348B333CAA9996E735CB3AE181F5BBE890E31BB206242EC92B87F8824B081A388FA0C9E14A96C9E4A242BF69922626501E7ACA9B6847AD688BC1986600DB50116112B0B74668DCC905EC01B239B7B7AF9E67698C5FA2DDD3B4ABE9668F70C31AE947BE69476DE26CC119984CB469CEB94A62B136393D8F8583DBB6456CABDB04871B6239A5BEED9425BC8EAE58EC49AF6FB654E69C969209105269F4308E481D8A23637B45077042618BDB0695C9D476C16A7DD6248ECC3441674A408151F48BAD0BABB77BD39C9D4765E66CB24B6F92219203B2E9D040BA453446B9BE47CDFD46172B593198C2D8D584EA80C6EFA920DDCB9762510888CCE0CE06C3E2407AD72BB10B9650873565AA76B4E5A293B10331A8A8E5781226B7B863AEF60511C5E9709E867162788F865ECC330CD530F16379B08477E2D7E9DC0345836240E10CD08E6D6500DD1AACC79F41857661C4C8BAA225C30D50CF8200347091A61E065281B3F9B1844CBF92C7F100E1F5A3D40FF3CBADA64EB4D86BA0C570F21F58C1A360751D57FB0E0DA7C7095475D4D5D74013533C0C172AFA20F9B20F4EB769F0902784A48603B93328C2F1ECB0C87F35DBED4943EC6ECE2272354B2AF368FA94EEAD2ABE816E0A768EDDB8666ED055C02EFA579574E46443F1034DB0F4E02B04CC02A2D6934DFA39F08C3FEEAF9AFFF019520B648BD990100, N'6.1.3-40302')
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'202106202217334_administeredMedication', N'MyHealthCare.Migrations.Configuration', 0x1F8B0800000000000400ED5D5B6F1CBB917E5F60FFC3609E92C0D148F271901852025BB27394635982243BFB26503DD4A8CFE9E99E74F7C81282FD65FBB03F69FFC2B2EFBC152FDDECCBD882014343B28B64F163B1485615FFEF7FFEF7E86F4FEB60F688E3C48FC2E3F9C1DEFE7C86432F5AFAE1EA78BE4DEFFFF8E7F9DFFEFA9FFF71F461B97E9A7DADCABDCECA912FC3E478FE90A69BB78B45E23DE0354AF6D6BE174749749FEE79D17A8196D1E2707FFF2F8B8383052624E684D66C7674B50D537F8DF31FE4E749147A78936E51701E2D719094E924E73AA73AFB8CD638D9200F1FCFCF9F7FC628481F4E508CF7CEC2FB182569BCF5D26D8CE7B377818F4893AE71703F9FA1308C52949206BFFD92E0EB348EC2D5F58624A0E0E6798349B97B1424B8ECC8DBA6B8699FF60FB33E2D9A0F2B52DE3649A3B525C183D7259316FCE7AD583DAF9948D8F881B03B7DCE7A9DB3F278FEEE2EDAA65F92F98CAFEBED491067E5384617E3B297D3F171B2577EFF6A46977A550384E028FBF76A76B20DB291390EF1368D51F06A76B9BD0B7CEF17FC7C13FD86C3E3701B04744B495B491E9340922EE36883E3F4F90ADF97EDBF8CE2F43E0AFCE86C399F2D58020B9E42FDBDECE3A2B36761FAFA703EFB4C9A83EE025C4363A12474E3A701AE4810809149339F9DA3A74F385CA50F8485E8693EFBE83FE165955292FD12FA648E918F0874B5B55C6FEFD2612AC25E068183A12A3A1CAAA2D74355F4D35015BD715FD167F4E8AF7219004D97F9EC0A077989E4C1DF1462B69204B754A98F71B4BE8A8246CC3499B7D7D136F632284750891B14AF70CA36EF68D14830A55CA35AD152B2D51446936D6D449A5E92518CB84EA318FF1D873846295E5EA234C57198D1C0393B7510FC84C2D516ADFA97473F476B3C8C88CD6A22627698CAFEF9E0A7F853B48A7AAFE97D80BCDF06A9E91AC78FBE8793DE2BBAC109D11CA33053E206192DAAC2C116E24B326C648225C3F43017C103AE27B5EED97D35A9D60A7835A9D61BD3C691AD488A3CA87975AEBC81926CA189B232B68DBCC1F13AB9B82F279DB4A56C117973A132429BC182F60DAF27939CC15401A8CD92029206CB4AC95A6BAC5950C068A959D4145E764DDFD3AEE9C31AF941FF427AB98C71D2FFFA7AF91085F8F3767D87E3C96C315A485D7E9BA192CCADC4012F825BCA0496CC8B601860BE9E924DCF97CD32DBFA5475654937FE1A5BB7F814275EEC6F8A43BA89CC964E2B3F3F6FB42A42CBC9532FCFB63387FAF465830ED5B5269B07F2D543EF73E924F04993B2BF07AAEAC2F3B61BD4CF7C1374D5A71E7645CE64676BE9D04AC116E5824A0D6F2514723DEA06AF37A4CDED175486CA8B8400EA62B89455BA0B0B37D1E87FC55EFF73F27DB47CEEBD92FE0E5141C1F015C57E36A8D0CEBB404355EA969B8FB484509594ECC595C53B6DCA79DA1DF47096D08BE41875AA331071B7347290EE7316880BA6D1A469350BCEF1D2F7507085BD285E1A4F01D676628F21F2027FA0AE8AC7BD9FC23C27BEE7A3B0EB969A7430539BBB9279B75CFB498680D37C16F4BDD0A7284EC9406D06A9ED23F2FC800CFD20BB98531FADC228F1FB3FC83B89D66B32F2FD57F42E0870BCF2FBB8FB83AF90081E433F2173172F0BC195CB71A94867045B53F896939A8D6437FA405073CCBEB2BD30F91CA5425FFD1050E180C2704F8D3E107A6AF6956D4F4B49A51FC2DBBA2430645501610D9697922DBDCA8656B2D9A4A94D59B0B155115D73EB72B60D26E2F4FEDEA0B16539A8A179B6A691451977CA4C338F9CA8350DB9170507A8AB6151579DE11CC55D49E470EA4AE414D5BBF9D6E7FCB946527CD991D28770D98E0E38BD39E93EDC0AA81405DA75D3AE7B8508B0EE5BF19969C7F23FED7A95FFD99340A61BA514CD7C41E33E3813D7DD25F48B5056D4D5C3D6C47880DF6D3641393E5F92CC28A0DD2873645E861AA8EBA31F27BA0BB583FD7DA3F1B65C9A3E2167356BEE27433F2D2CC0FA3E64C78FB836CD79FF9CDAF3E41F91CF9C79B45EF733E69E474BFFDE7760767016222FF51FEB56BD8F8898CF3619B67406BB28BEF657212A7CB47ABF25DA6CA2984CBDC1CCD4750660876FFEE4AA969328BCF7E37503A1B6237F8992E41B51067E46C900838FBD6D4C641F5137D69BDDB66083EB72363437DFA28F647A47F18730FBAA33BD4F91F75BB44DC9C623B77C4A3D51FC181270D29C779E8793E42301335E9E44DB30EDB6BBCB9409CDA2653AFF5AEFC04E02E4AF017B7656EDB9AD8A5246EDD212A29F94BC98EDD6E353B4F2817352BE86AA28DCD4A284B6A96531DBA666C4CC5A5A96841B9A17D0B6B328D56937C491CC07C991C69CD37A519B1562A0EB4151CE61DA18A6475B3652D357146CA7B2ABCBA7A823A0E6B446036A5E3B497EF497D9FABFD07F511526E48DCA5750B39D0E5CCBE03DD6E19FFBD8DD31DD1CBA72FBE9D916C999107704E48CD4683896A34C5A346B671B40BA909955DD6EEC738AC1D3AFF859B9DBA230B8E8D76574EB7E53D0D5D2EF0883A3E26FEA0BBEDBF394E4FA39C9EFB4BBEE6EB231EBD529C4EE64B8F7ADCF258E4BCB20B9AADEE48B5A3A9F27181A08056C6D0AB2E9ADDD42E453BF2C2995264D019528A14A758B605177BAAD086928BC480FA0AECC1D308E32C3250733D4FA00C49164B0AD3708A26FE4BFAE22CE4CBCBD717345D1E274C04AE4F0131A9449ADE6326029D5766203E45E66395097030B1477E6308E6C591C5C450D76FD76855132800E74851302F001AD4FF516373D5962F2D2CACE7ED391C58DBA52DEE2465FDAB2578E2D6EA0CA048B1B6541E33E38B0B8A9CD5F5B6A87C5E72F8B0650D7306E00A46917F7EFFDB8B97A6F6F9B889FBEAB3BD53EE2A9984FAEC660BBE5F4AA08BC4CB03127D80F03D86C6541ADDD5EF3AF5F900AD49573E74BDC7F70A78F7E80075B774E62EC26F64DEB383A36FB67FFDED6BC98C7384DE405EA405D2EEE8206B93A1FC6FFFC1C27C910A6832EE7E35942F6DB9DCDB3CE92531CE0B4BB9D57D61CB201A2EEBADB523A21EC1C70775F58B9CBB78AB520B92D4A31DB433653B625E44A743D5BACC9D5707520224B5A6E24E5EC3D4A7039723C0BE71AF8BCFB153D71F3B00B16977E8CBDD419C1AF3EFED68A9855C05122BC2FBB0C2C45E365E903EA1A6645B98AB603C43220426D98EE94C0EA7F1F47907B11538B48DB30182BD14CC5DC337D25B74AA166D76D51880D4A4AE74923923205ACFDD0B308E1DDDB258B4F2D6D782B21F6295AB5165EE4DB17A105D4E5E422E8E621A634C661BCB0FAAB255AAD0638EC196A67F0E1297B11CBBD09113473DF2549E4F939362911CF475D669BFC215CCE0C423037EA1F1543FD9C4C5C3F339E216D399EEFEFED1D081C5193AFE556439E8A67C992176993998EE36CAAA1CCA72A21B2C30F53512CF8A1E76F50A06F06F7A9A14CC986A3AE84CF39C51B1C66E240CF6393DA15219EB366D4B571424FC7A8A305851C35A0C0C0C4D0B0EBA3143763CFC7E3B6C297FE2184E140A66BCB0048D3F17D57E0268B740B434019F696061A15BB9A45C01F941053BE5B61842F9E8B17617156332B4CCA888840898796E2DA4264FED20934157D1804978A31DA0D508AEFDB4080513C9DD680A57E4AC74ADC29DED1194ECE818D180048206F7703449A20A5B008328B584ACB3A3EBCAE8DC0338B12DCD4C6855A9D9EF433E9D02062D0641C4D1A2284D91D05CE66E1A9209C59C6AA6AE006069A33C7B865A448A0EEE941DDAA5F0320DE6A8C4DDA535A064F10EE929B1153BCB1C69403029D31C9142A96D5357588D33D1A1DDFF4B81A819BB1591F47CD9587BD0015524D0C0C4AE1E5A391F5882B6DFB2490970780D04DB4760AB492694368D14AAE98340074721E03A365BC13530CF0C14FA686512EEA0ADCBE32F6C32018659936024659AE4C1EA3822F1B34FAB0631BB5A3A73C4BCD977ED84B578AA8C2F75D49BEDD1CA5DC740DA680CC67D7B8BDFDCF5089B3303C410D58EA607E8A1C1B767A8A2C31A95F1EFB629C15A4894A6128A325212A3A82C0A02AFBE93BBEB2AEEBCCF00B893074BB0656CD7AA289A0363565C764651A4E948A1C1B41D36158327945471DF8DCF65882F3C91CE42884F5EC1C6986383D0A617A34E22908339A26EDA85DED4781B299EF37042F4B4770C6B45A1E6BC21CDA96CF01EDCC71B655BF0600BAD5184FFD38DB201C403BBC41C7D9BD037D178FB3CD7B343ABE77F0385B1D24C21665A076D223B277573B31EAD188A0DE31ED845D63AA582246CAAEF8AE9EA10660AC4E0B6FF2D1A7976553270750650F86569BF93132A99F7A23760A90AC23701842467C3FD13D2C85B7176960362143260E4DBE17C383931F2B2378D26F214F00A016471286071196E69BB22AEC57F6F69732A21FB4421B819CA2019F603B5507F0A7DE31F546DE8B61541AF9F04CFEB850F070844002BB61B25E49B5A3B539FE604F4A23D2D249DEDA2D49D690011004B1D74CED580D751B52B8BCE50E5444658FC51B91D3BBBC274FB2A87A04E8A5BF6A523AD4F188C8885FE39435F19FCF1A473BDE5A5FC0144BA1B6309711A1ECF23564286F3B810A95A7A1C23B5609A4F8025A7AB51387AC618C7B8D861463BE2C23C659946B5BC6DA55CB9BC75BC46B889EA35842865BFE7534E407E3B2F681171C4655A8A91A112A03A98BD8E717620D1D99219D01DDD2E0CE8E78F5D2958E7869296547BCB867D5D22E6E2635A40D6819D161A2F68B1286B213D210020E456454C1C32D5D5B8BDDA9B4A1D591808E44B583901269B66F06730441D30399F0AAD6B60006517AB0962B2B299719854343E3FA990CC59A805A46280FDCC011A05657C92A43F9B4CDA892FC8203B9BE09BA15E44F5E778359E1042DC2CC7B9C2246AFBABCAECFF6DC802BA0AFB38435667ED14C97B49ED154BFD4EBB319D9FED925F3D595F24AEBD4CBF548E5D6CB7089564B943C5239F2F6C520D16F54C21C8D7329D30DD8BD94EA02A0B06A08F50F16A5FBA31435E60E93DC601BB94C323812944825988C9C2429FABCCEDB999B66DE7712A6B670DB838FB1B48E7B140B607558C1693B573DBA36242AABAEB95C2CF9B62C16EFD62D7ACCDCAEF7CB5CE63E5DA84A4ABD8D84045EDA95884903E72456C4A9DD93A82E95BB1F95B854BB12D1C257BE0372CEA86AF7A36794CC4346D939CE47A613A3387F169851557F3A334A7C48486491DA4183E910E8A241AF93F4C64CC11CD02983A255B6D9255E281F0C355C20670D688425EE1ABA9E1890D263A5071E71EF536A6715E035A09A0BA2DF80650FCD880F8329FA056FBD08D24D32B5DD7A2701044EB49E30A53689B6D01624179646AB377B79D9978EC0DE5FEA46A8051F0DDF6212F9D9C29097BFA0B430E5A57A0E9FAA29F86B67BCEB5CC1357915CA96C51A05D7C27CB45FE60EA3E06A5EAA3267AE4E1E98D92DF6C5D2DEE581DC024E274FE5A6720ABB0CDE584E3DE30C08C98E55EAB371D75C690EC5B57C91DB6BA93A24586CB5E78D60984573873AF677CC1FB335D86EE555ACB7563C196241E5DF41900A1F9591102F0A00332156C8D0D7276AC9021806F5C00C31D6B6FCEE03B65631B3576166FD4A235B41D3141D150503AAC0C1B515459D77B4B8F61EF01A9509470B52240B5EBC454111D2BBCA38479B8D1FAE92E6CB326576BD415ED6EE3F5ECF674FEB204C8EE70F69BA79BB582439E9646FED7B719444F7E99E17AD1768192D0EF7F7FFB2383858AC0B1A0B8FD917F0361F754D6914939E73B9C523231FFD38494F518AEE501645F964B9168A496D46806BB6AA4AD62C441CB5EAE6AD2A9FFD5D0A1DC5437300BD86A91F493FD799A94E1E6A5C72AA2F7C49BEBD267204C57CA4793AE2E149146CD7A1412844985EF944014DA94C32A771BDBD4B45324DAA05259C5BFA1D7094EA546B4A87524AC2830306945E4B29BD6E41E92729A59F5A507A23A5F44646E968C14191C7FE42003F278DF8B96434D3A8CB2657930DBC5133986E8A6F2156F3F3CC6E7A7D42E16A9B2F45348D26D59CD2CFD11A4B262B956C478B4C4F805C93634EF19F0F7E8A3F45AB882547259BD37A1F20EF379116956C3351F2EBF3849F2855AA85A06CEE9A653253C86D45592E49A505CCE95F12BE650A86A4D95C9639CD7CDD6269954993113D8D418A2BC9035234903C8A6F7FCCA5BE7CA99526532659A070B98C71C24DEE3AD16286D02FD4329CA63326836CCE8AC815BCD5640D30AE23B04B40675E54A529311916F470E2C57EF98A0C438FCE9810C428132C77006BECC9DBA04BF1753FDADBD99A2C8E97287B189E21D2249BD33A09B2E3C1EC6F96189D6E4BEDC2F3B61B24624ACCB5D1469E525EFD7892AEEBAEA7F34850E7ACB85C815D69D6660077CDF7FD009EA9B478435858A0D9ECC1D58F5FC92657D03E8A448B2D46B47CE67617794A9F1BBBD124396F04E94E9C73FE376D64BA8E443F38778145E1C10670A64C4ADC651718AE10A0BC7D37187ECDF7FD8C7D65644053903B7FA9A8309EF0EC9641E122AFA087EAC00FEC061D8C0701D3CAEE727383B4E2654A7673C4645948DE14C52919BF8D4893CB32A7F911797E40B0202A456C8E8596EDA35518253EB725A4922D54AC68BD2E2E7419D5AA4EB5188F20C0F1CAE74FA1A8E4E94807C89CA81791019B96D80A0F15A57EC4081B0A8BA6A30E92A5A058448E6348C983C9C134EA8046DC0495473982E99CA2677EDB6BA51EE532A1780857101545B2C5421B2E454A75E2C4A64E1FB3A5D30419724E88821C12E0238D116406DDF2DA97F3A36E71FDABA3D0CF38E597EB9255B749B6D908C94835A916A72DA19F162E7F4CCFEA548B3615AF5C330D2A92CC69FC23F225FA53936AC7A1F368E9DFFBFC59229B63C329E4A5FE23E63955A58E73C275EDAF42944D0C4EE637C9361BFDCD268A53BC94EFB325D9C3DE3CE41F9C44E1BD1FAFF951E5F36C360149F28D68333FA3E481DF07D039568602DB389336295A6F046B013AABFFDB12037A0047E5252CB6FBDF22B2A320B2F743989D3270D4C55C8BB91D79BF45DB946823F9BD40EA71135CCC6E415BD2663ECF6233E27938493E1288E2E549B40DF95B5C31DB9C76B686896B41933A193D40EECFD7935E50C441E9AC1C0064FAD110AA8862FC38DA51C99B2C1E2353C996B4BEA2602B2356A64F155FA0B3A6137C15A1703AE30B20034B27529CA43DFA4B7E1DE0B22C5682F29B5F30B7FB6432FA42F134B00279D539818ACCB7D11E29722AFD8A92EABD1EE6D41678C367B4A1EC6DECBA8F9BDD9875357A74BEE149AE9F93DC45896B17956E8725D01E43C8FC8E8E3F6897765728A52294D90354F5713FD8CCECF0E2283B79E7CFF59B741B655A04509566753F107D23FF09D70365EA776B65043A2BBA022714E8CE1EA9C6947ABA6D707037E0FEC6C2DD6D037FCE667BC6E6EEECF00AA3445813CA341B2AC93648792A45DA64A65FEDB2EA6C2D90FBE59A2C04D097635F54A8207B71FFDE8FF9A35326C3E6A0EE893F9E7B1AF350CEE690742CF8363EC5CE000C39509B4018FE76AA20FE014153068E7579418B5ADECD4ABEEB4979C82AFB1207E2A25FA4DA5C1C0658845D936A273F4F622CB7AFAF33FAB7D71F4FF3A53CE86DD07896647F5FDCFF4EA3F7D6E47FDF4EDB6DE21FEFD491B378DA3C869DF2394E12E1D2B24E1C6F969C254495E547A94CB3A152BCCB2210AA93ED5A44B655C219329D6EB3BB5FF2D70391F85E4CFE7DC779DF6D535A4FAE0A13BB3145CF9277BFA22729B8B92C3B002CFD187B294057C8B6A1FDD5C7DF00BA4C9694E649142EFD8CBFB3FC7E89E5B994EAA99F1DB310DC22325A1386DDF4F0A6E4F5C04C6EBD9D5E393CBAA25F0FB01F2DE5D7FD080717EBE655B4E54F82CA249B6DD1A3A4294DAADD5931E60D24EA441BB39E15BE8885258E4AB6A3253A09C85F6F1A6D2650AF59B89A0ED91B18F6D340FA553FF0EF7E8679F3100BCA599536ACED2361DB4A72A9BFB283AA2B25F8C35316C14A5806A8E4E181CF86E6826ED9AA58BAB63769D577F07599E666378B3FC60B0E20E4B5C83AA3C94191933F1C47B5A045E3C067F38C1AC771C7B2857CE0356B0048E313B6708FA93EB5B41A97F05711DCB0258B598A0E20A0089CD8B289D68D6A74D0B3E4F336088EE7F728480401A6EEB81E3D42F43EBE482DBCCA94FA771DBDAF8C9CC784F4CBD99205E8CBD9919451FCF8507A4591F9ACB2A8AA16EBBDACC0DEF5BF8222764053E01C85FE3D4ED29BE8371C1ECF0FF70F0EE7B377818F9222A2621924F02DFF56A351D4C083D759D440BC5C2FF8CFED630F66549264C90487A0D48DEAAE5D1670EFE8172C80A10209F548261CBEE068C15338E2251CFD71F1B6971FCA9EB83C0B97F8E978FEEFFCBBB7B3B3FFBAA53E7D35CB15C6B7B3FDD97FCF67194633FBDF1AA70B65134AFDB7A83C7C44B1F780E2DFADD1D3EF6952F9AB9A1A4A4DBC1F17C4EAE87EEE881DBA24F6DA25B19F5C127BD38218ADF928670A102BCF6CAEB49922DCCCC857BDBF63221FB353CE4B94A6380EB352386FA935FC1B571107034085DD7344AD89BAE780201577CF01352AF29E13EC56C1F71C1013E3EEB925EA54D271D1F61C502C63EEF5270480B0752F0BE6880B6679A5EE023E55A83C17E0A64D06FA03A42AC6DC0B2AED868CB91A2FE8653FD2DCAFDEB2558C81699FC30F0481DB59B58472B57530A474343967E4E840724E96D7A7366BD60426A3314C15C1DB7616A892E06F546D632EAD45F437178A6E1E04CE01A10E7B0D0B51A88A9DB6B33073870C21069B9D88E03EEF434C28E29FEDECF855A1D49CA8945428354BF9DE7CDA49D9A2E2AF5936A0FAB053F55CB83617E2920DD6E680221BABCD855ADA446B73A1C2D401DB5C6C989A906DFD0976A3C0663B2B1F585F23BB49457FDB695E95BE5396B5671F75AAB6768DB2ABB8FCAC53D579FCB68E7B3C2A7A5B474A75F4362B3A9633E83B9A342D65AB31C39437CA3BCB352A9E19CBBAF9EC1C3D7DC2E12A7D389E1FECEFB7B84BB0276CB2BE340E8B2E362185D94F4129F5C3E7361BB526E059C729CFBAFE7724D6843A2B08DDF9F63D737BF042453973B2A915E29BF57570CC40F6F0CD9F5A11A5A272B51F1036C6999B5B523AC2D9E887DC4A7A4E582886326B4F4B12BB0C9EB546F2888B59D6BE69922065ED8FA29AF064FCC4D0A966D59779F2ABD959F225F4FFB5251937841B998E06CF2C0B559936356AA32E37DF430AA43BC54112A36C67B587CAF7CC8EE7C5579D54752A3C9A9323FC263EDA600AA4249698190E34A1C364D779AAD06092F27297423DDAB896A9F4BEC33FDBAF7D742F1CD31E08C86DB122DA2F9B4105F20D951495070AD38FF96822A06AB05DC5C5573D0F59DBE19AA08477BB25A14291B5D76C84E8630E568076CA4DD61277CA8DB9D52110116C6741460716D30CA6A1EE6B040C335A7588B1F68855A095C1C81BDD298B31448C4271ED2C5E463A9A9EC4B1FCA8E7E30ECEB89C1EDF5541C79C902A228FF5A7FF4BE377EDEC1C747795490703EB7AFB9205049BE019565B7354736CC9036BBDA06BE7465212F56A6747B1099FE5C286A28EA0E548E8D4B1813A0A9DF626C236EA1C10586467B131DAB981B35343775678B5C3FFC4905D85BDEA7081D8C4BBEA42A48973D59E4A11E5CA0187B9304ED21699D111C23675A0C5846A6A4D878B1BD4E994D5CA814A1A886767859B3BD15086F67172C4F5E8AE5975841F172A5A13E3A7FD0D6515DFC76E3929BEEAE1CE4F08AAB3B35076B2E9AF42F4B8B6D8E946A98CD633B1059C8AD9D3E37ED12C4A8EA1B7A026CE8DF8853EF88C819B215BABE5C4A73FEE667E2EE98A5D5B440A0EAEA7A8002B94C8CEDD946FA1A8051FC2657EA541C73528FB924531D9A352CFB741EA67CD2655135D40605243AAF18EA64951A92CA9FDBD3D911A010E8E33F985322BAA248D912F46ABBA8CFDD0F3372810FAC0953494BC196F6B9A7CCE29DEE03013A9422F4D2A53B8D766B5D6C4B919A163031356470D06D64578584470EEC9343D3EEBBBC086CA1D7BC200A99D88FB4007DFA58BB0D827CE8AAB3B32A150E221312C711E9B0A0656E3F8CCA28A4A675BF2879DC413E0DF3D59309501A586153355142B9A509DF65D0816699CAEC98280F7C5BD55398037C3C896A20793CB1948C4700EC5AC9CE1337B11360ABEF58333B5173550A7E0593C0AE8003FC15B95577133DA6C297AA8B99C41B007F93C82EDA2CBF482440517FB41A291DB275035F016DC046028B9D5E1471D1868D9D8FE60E8331EFF31A1A77C3B7018158C3528BE953DE74E2B4F9CB323A344F17983E04FEA45A1685659A017E469820BF7A2EB193D746F63023E06EA648FBCEF12EA0A9F0D45B3CA02DF29EA242E2B5344DDA54918777AD3D9D85333BB4E2A7910B0C187F2F26609A5FA39DB503D5EED1C7186171340E5BA9B8851D0278BD02E1731C2586B46F887C2611B3C8C0A46B31716865D85F38664C2D968119E081E65CE708A35F8FBC2A0D61310A856EECF378EDE97A34E72BBFC02BA17D0F5B7D9281E08DAD9BDC6341037D24EC31871A36E34A063BDE24DA2DD41DEF4CEF64640609703BEDA296F141802CE9E3B79C90139AED2ED02CB7C1F971C46BEBB40D5635E72A861B813971C5345DF50971C9DA037FE250784C05D5B8FA707C311D6E32E581C773D66638AC9DDBEA9D3B6329F395BABD28657FFCC350057E7CB32FEF40329FBA59C8A6D3E0528015EDE1498EA120C9C9AD41F0150722E4D065274C4FE09804ABD38B61C4AA945A593257757B5FA362BA8C903C2C3A855B5F7F9AD24F6F5C455A9C6739ED39FA88CEF486902020500F58D7A7E4639FEDE4ABC7F5927A2CA43987723AAD3AD2410F565F142B3195547C8003D9EFB4105DF5933CD6735D451FE07F6A96FCA5F9F79965B4047F9D83BEB64309F350E71BCD57FF1B037EDBD5CF8D5D50504B8B055507E084225541E540D55445311E51E275444E5411551453415F10E57426D7C01A84ABE9CB65ECA25475229950BD74815D254C7B90A081572F95595797252D7C895D27691F70690F4932F02D42C16D454CE296742CD5C7E55EDF9BBABBA4EAE884D85F4B99DBA6ABAA4B6117461A3E6285BA0ABD4A81E41A911850F5FA2AA717917350228D97CC669619761596569E7AAABB72CA6AEBC340AB66C4169F3A86B41594CDD82D240D4B205C555A8AE01452975FDC59DB145F5FAAA75D59A55491B238A6B0F9529AB88CED7D4031E2B0A95822565530A2CACEB76751026F6B9CA91555767EAC837072362054D9EB48A26DB401621400C21787D2BB3F5E3456D6364834465ABB14F97D503925192A54A4A9D2BAB962AA0AF2B8BA622D691A756B4C98F66B9CC738C27947E362BCAAAA71B575CEC29A5114BB43FCA61764695E41541C8AF963D19E47557529F422515364B8C3A9A7F0B6B990BB65B065D06E31148FA6D16BBC059E7E52A724E40A3F4B66183CCEB5ECA03AD7BBE430608BA7AD97B5801B7EFBAE8232EE9B6C691DC5997B9BD64FE25B4496C33CA4A4F68E9709BFB4E331D916E7CF2EE283733DCF8CB37322508343B137BF698F9EC4AB8D4C2D95775D64DF552B917826988BB10919A62B3E19A754525B67C931D2502A61B421F65DD9A10BB00A74899E031709F549F84D39284CF534922C56E4F46AC2CE09C35D5C64CCF1A998FDF10AC61B6A132626581CEAC81DCCB24BC31F24463572D619F572C5BE00E0EF81A506A39624229F7CC29BD9F4C9823739482465CE894A62B136393DC25473DBB20DF9D5E58A4386191CD2DF76C61FD46F47207F031F97E9953FA371848648923C410027920B6A88DF02DD41D8921442F6C1A57E731331697B0AD8595B973ED5A733A9953333D6A74CD3A48BBB6358B76A85D4F935DE0C4B430DFED65628ECB2EB9D5A84E7EC9CD4B596D873D432F741BF901B98B09DBBDEBCDC9BAB6F390A99FDC24926600747C3F091698AD5DDA89E142E476985CED6406676A2697132A7BB4BE648370CF5209042AA33303049328E0E01F369B820DA7B8B3FB3A5D73F2CF984999D15074BC0A585D9BFBD479478BE232A54C203FD32826C4CFA3250E923CF56871B50DB308F4C5AF539CF8AB86C411A119E2DC58B0215A95390BEFA3CACA896B51554408EA9EA2254AD1BB988C30F252929D3DA9EE87ABF92C7F2C3A3B44BDC3CBB3F0629B6EB629E9325EDF05CC13CB99B594AAFEA385D0E6A38B3CFA7BE2A20BA4997E16B4FF227CBFF58365DDEE8F9240E20089CC0CAB7C4E201BCB347B5660F55C53FA1CF18B1F44A8645F6D3D569D1C2717E1357AC46DDA4666ED27BC42DEF365FDE63444443F102CDB8F4E7DB48AD13A296934DF939F04C3CBF5D35FFF1FC1FF340490B60100, N'6.1.3-40302')
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'202106202226120_renamedMedicine', N'MyHealthCare.Migrations.Configuration', 0x1F8B0800000000000400ED5D5B6FDC3A927E5F60FF43A39F661667DC4E723298099C19247632C733716CC4CE997D331835DDD6396AA94752273616FBCBF6617FD2FE852575E5A57893A84BE7180102374915C9E2C76291AC2AFEDFFFFCEFC95F1FB6D1E22B4EB330895F2F9F1D1D2F17380E9275186F5E2FF7F9DD1FFEB4FCEB5FFEFDDF4EDEADB70F8B9FEB722F6839F2659CBD5EDEE7F9EED56A9505F7788BB2A36D18A44996DCE54741B25DA175B27A7E7CFCE7D5B3672B4C482C09ADC5E2E4D33ECEC32D2E7E909FA7491CE05DBE47D145B2C65156A5939CEB82EAE223DAE26C8702FC7A79F1F81346517E7F8A527C741EDFA528CBD37D90EF53BC5CBC8942449A748DA3BBE502C57192A39C34F8D5E70C5FE769126FAE77240145378F3B4CCADDA128C355475EB5C56DFB74FC9CF669D57E58930AF6599E6C1D093E7B513169257EDE89D5CB8689848DEF08BBF347DAEB8295AF976FBE24FBFC73B65C8875BD3A8D525A4E6074392E47059D106747D5F73F2CD8523F34002138A2FF7E589CEE233A32AF63BCCF5314FDB0B8DA7F89C2E01FF8F126F915C7AFE37D14B12D256D25795C0249BA4A931D4EF3C74FF8AE6AFF5592E677491426E7EBE562C5135889149AEFA18FCBCE9EC7F98BE7CBC547D21CF425C20D34565A4237611EE19A0401189934CBC5057AF880E34D7E4F58881E968BF7E1035ED72915D9CF7148E618F98840D758CBF5FE4B3E4E4538A01078365645CFC7AAE8C55815FD3856452FFD57F4117D0D37850C504D97E5E2138E8A12D97DB82BC56C2D096E9952EFD364FB29895A31D366DE5E27FB34A0504E54256E50BAC139DFBC93552BC1B4728D694547C9D650984CB67511696649C630E23A4F52FC371CE314E5787D85F21CA731A5810B769A20F801C59B3DDA0C2F8F7E4AB6781C114B6B2262769CCAFE791FE6F843B24906AFE96D84825F47A9E91AA75FC300678357748333A239263155E246192DA6C2D116E22B326C648265E3F4B010C123AE278DEED97F35A9D70AF56A52AF37B68D235B911C05AAE635B97003816CA9895019D746DEE0749B5DDE55930E6C295F046EAEAA8CD4666541F78637930966305340D566A000D060A814D45A6BCD82014647CDA2A1F0B46BFA9E764DEFB6288C8617D2EB758AB3E1D7D7ABFB24C61FF7DB2F389DCD16A383D415B7193AC9DC491C8822B8A34CE0C93C098611E6EB19D9F47CDEADE9D6A7AE8B26DD845BECDCE2339C0569B82B0FE966325B7AADFCE2BC31AA081D274FB33CBBCE1CE6D3A70DBAAAAE2DD93C90AFEE079F4BA751489A44FF1EA9AACB20D8EFD030F34DD2551F06D81579939D9DA54327055B960B3A35BC935028F4A81BBCDD9136775F50392A4F12425117C7255AE9212CDC44A3FF0507C3CFC9B7C9FA71F04A863B44550A869F511AD24155EDBC4B34D4A56E85F9C84A085D49602FAE2DDE6B532ED2EEA187F3849E24C7A4539D8388BFA55180F490B3405E30AD264DA7597081D76180A24F3848D2B5F514E06D278E38224FF057D455F378F05398C72C0C4214F7DD52930E52B5B92F9937EB6D9851049C15B360E8853E47694E066A374A6DEF51104664E847D9C59C856813275938FC41DE69B2DD92911FBEA2375184D34D38C4DD9FFA0A89E0310E333277F1BA145C851C87AF94C4B2618C6F0591C9DC31194BCB974EE64F5CEF493E26394415EEA0A2B0BA8F561F48DDB4FBCAB5A79580023BC6536E4AB61D010B484B2F5C0A5A71B50DAD45B24D53DBB2CAC6D6454CCD6DCAB9369848D1BB3B8BC656E5540D2DB20D8D2CCBF4D2612068755565205A4F1A8DA2AE567CF655122E50DA974401A4BE44CE50B37DEF7CB05FA820E5973D29BD8BD7DDE82827B620D7C758F224AB3DFBE5C3AD57E5C9AE5B97CA6FACFA438BBA74A628EF4FF0823549F2575DCAAEE91EA431CBD83EDB495AFE49F22AEA1A60C361BFDCEE7651353E9F337AD5DF71A5E5C93C0DB5A2AEF7619A99AEC99E1D1F5B8DB7E3FAF30179ABD970EB18877969D735F4D139FE8A1B839BB78FB93B4FFE9E84DC4946E7C59D32F722598777A1076382F3180579F8B569D5DB84C878BA8770A533DAF5EF75B88951E97935F8DDCF6E97A464EA8D667C6E32EB7AFEF28FBE6A394DE2BB30DDB610EA3AF25728CBBE11E5EB27948D30F838D8A744F6117563BB3B6CBB34755DDE86E6E65BF29E4CEF247D17D3AF7AD3FB9004BF26FB9CEC2E0A7BA63C90C58F25012FCD79130438CBDE1330E3F569B28FF37E5B38AA4C18162DDBF9D7799B751AA170AB3852E4D59EDBBA28A3C3832564FD1D2EE6BAE3F8906C42D5E9A750435D54DDD4B284B1A95531D7A65262762DAD4AAA1B5A1430B6B32CD5EF6C8A27590C92278DB9A0F5A4366BC440DFD3A082C3AC89CB80166AA4A69F51B49FCBAEAE98A29E805AD09A0CA845ED24F96BB8A6EBFFCAFC455D9890B72A5F43CD753A082D53EFB19EFF6988DD1DD7CDB12B779F9E5D914C85B82720535293E11846195894B6B30B207DC8CCBA6E3F5637E5E099577C5AEEB62CAC5CF49B32A675BF2DE86BE9F784C149F137F705DFEF794A76FD981527E47D773774CC0675F5703B191E7CEB7385D3CADE0756D5DB7C594B17F3243B02A980ABC9009DDEC62D4431F5AB92A034690BE8440953AA5F5C8AA6D35D45484BE1497A28EAA24E7E6942CD913CCC50E703104F92C1B5DE284ABE91FFFA8A383BF1F6D2CF154587D3012791234E68A54CEA34971586505D27B682DCD32C57D4E5C1CCC49FCD8B2783150F5751A35DBF7DC2281B4107FA843302F0116D4ACD663503195A8AD2CACD3CD3937D8DBE52D1C4C65CDAB1579E0D6D549549B636DA82D67DF06071D358B776D40ECBCF9F160D455DE318F793A65DDEBD0DD3F6EABDBB01227EF8AEEE54878892623FB95A7BEC8ED3AB26F034C1A69C60BF19C0D295057576662DBE7E42AAA2AE823B9FD3E14336BD0F233CDABA739A623F116D3A47C771D93F8777AEE6C522C659224F5057D4E5E32E6894ABF371BCCA2F70968D613AE8733E9E6764BFDDDB3CEB3C3BC311CEFBDB79D1E6900D1073D7DD95D22961E788BBFBD2CA1DDE2A3682E4B62CC56D0FF94C684B2894E87BB6D8906BE0EA414456B4FC48CAC55B94E16AE444162E0DF079F30B7A10E6611F2CAEC31407B937823F87F85B27624E614489F0BEEA33B00C8DA7A54F51D7382BCAA7643F42840222D4C6E94E05ACE1F77104B99729B388740D6EB191CD54EC1DCF37B0550A33BB6ECB427CA851360F8C33CA15707633A771BFFBB70B8A3A0D36BC9310FB906C3A0B2FF2ED93D052D4E5E522E8E63E6534C671BCB086AB25D96C4638EC196B67F0EE81BE73E5DF84483573DF64591284053619112FC652E69BFC2E5E2F2C022BB7EA1F1319FD824CDC901ACF90B6BC5E1E1F1D3D9338A227DFC8AD963C13A592272FD326331DA774AA21EA539511D911C6B92C16C238087728323743F8D452A6D0E1682A1173CEF00EC7541C98796C53BB2670336D46539B20F44C8C3A5931C8D1034A196E5835ECE6D8C3EDD88B51B69DF0657EDE603C9099DA3202D24C7C3F14B841F16BD510D006B36581C644A4E611F01F5A88695FA3B0C297C8C5CBB83CAB599426654444A02C406B796D21327FED059A9A3E8C824BCD181D0628E5576B5480D13C88D682A57920C749DC695EC7194FCE291B31029094BC3D0C1019428FAA45905D1C5256D68941735D049E5DECDFB6362180EAFCA49F4D8746118336E368D3102978EE3432D16C29A794640E36738CD4046D72EDA1ED1212B1AD55B0FD9B1BBCED3B358680B61E579BC65476C07303377009628531DE6872145873469712A6CB638A030234DB9D69D1CC8EA51594397BF469100D87B450A2CA10DF82C1AF18696C404419DB07801D0EEE609A5FDDB0AB65DA1890D572C5A6014A07E629305AC532B1C58018D8646E181522AAA8DB57C5751805A33CD326C028CF95D96354F253538DBEDA698DD9AD335EA3F62BBEDA03174454E9D7AE25DF6D8E322EB8165300F2C7B56EEFF033147004564F500B967A989F32C7C69D9E324B6CEA87E35A4CB382B411272C6534107EA227082CAA729FBE3350D30D9D197F219186EED0C06A584F0CD1D1E6A6ECD8AC4CE38952996313683A1C4B66AFE868FC2B9D8E22044FCB810F3E784FCD896685BF830FAE3B539D79702368D388C6697E12E0DA7971AB50E5E8D2CD1949F745B4E3BB3D077348EDD4AF1150EE34C6733FAAB670ECEF8637D581F5E0403FC4636BFB1E4D8EEF033CBCD6877B70459952231910D987AB9758F56842501F987602BF79A78293E1013C4B0D400758FDE379EC59651DC0646E00D5F66004606AC7C8A67EE60DD73940B289A5610919F9A143FFB0941E496481D906FF983934C55E8C0F4E71ACACE0C9BE553C0380EA177DEDE39696C0341862EADEC6B45FD9BB5FC1C81ECD1A6D44E5DEACF0EE755375149ED107A6DEC0BD1847A5818767F6878392AFA20A246A874ADEBFA87199B6C79FDA27D28A3438C93B3B18410D1901412AF6DAA91D9BB1EE3E4AE7B5C2158AA8ECA97CFF71F6A5E8C903141F8F00BDF23CCD2AD738111194F835CE7963FDE5A2759913EDEE254CF1141A5B71880863616F20C3F8CD4954983C0315D1454A22251630D26BDC31A086718E3206529C2132444CB00D37B68CB790869B27DAB61B885EA01420232CFF061A8AA7DA657C818707A60636C72B1049F6CCCB40A80A862EB74A5C824DBD050CE62CE85686756EC4EBD7AA4CC42B8B2837E2E57DAA9176790369206D41CB8A0E17795F962D8C3D908190E23804A2AA3CD632B5B5DC97820DAD0F034C24EABD0348A4DDB859CC11A49A1EC886578D9EA56010A3011BB9B201B9CCA91A061AD78F6428B604D410A122F8824080595781F585F14B5B3025C5A546E5BE2669552A9FF0A61BDCDA26E90F761EE00C3176BD15B57CBEE7165C51FA2B03ACB1F36DE6BA64F46E66FAA55F99EDC80ECF2EC8DF16E495D13157E891CE3597E312AB906879A473C61D8A41B2EF27C01C838328D70DB58B28D30585AA6A20343C58B42E8C206AEC9D1E85C1B6727BE47024A98F5A3059393A32F4456DB73FB22C62CD035073B46DE021636FDAC08211563474D0B4376360EA2974F521D95A2EF04E3C952FD06D3BCADD9F0FC54DEEAE9C6525BBABE8CF52C57BB800272DDC8CF8BEE91D8D982E55FB1B1D9FF44E41EC18C07B1CEF8CAAF737664641BE2EDACE09DE2EBD182578A6A81955F7A737A3E4E77E6416E95D2DB80E299D2DD89590DD7A6998A374AF6068556DF68917C69B420F1795DB856A8401C70B534F2C4899B132008F8457248DB34A61FFAF9B0BB20780630FED888F8329F69D6DB308324D32BD057A2F01A49C6843614AF3788CA57A005C439A176DFE3ED2BF52C05F469A86A403E32C9F489279D8C12A57BC6DECA6BCAA0FCA34CC75B3C4F5AEC2DA3CD6E4CA628322EB600B3A2C73C7D1680D0F48D933D72406EC8C108762E9E0F200366703F86761F7A631B2102DDFF433CE82107452D21C77FBE64A7BCE6DE40B6C7CA5EB90647ED59D37929515CB1DE624DF337F9473CE68F7A3E98C727EB9F1648C05557C9E00143E3A8B1F5114286C7E7821C3DE88E8258BC2CA670066C821B0E1EB0CB5E9899DF10937EB3706D9AAB4333151D130A08EE7DB9844347927ABEBE01E6F519570B22245684CE13D8ACA48DB75C605DAEDC27893B55F56298BEB1D0A68BBFF70BD5C3C6CA3387BBDBCCFF3DDABD52A2B486747DB3048932CB9CB8F8264BB42EB64F5FCF8F8CFAB67CF56DB92C62AE03602A2014753539EA4A4E7426EF9F6C7FB30CDF23394A32F8806373E5D6FA562A00188E2E6ACAE92B7F19047ADBE4CABCBD3BF2BA1A379FF4D41AF65EA7BD2CF2DB5BB2922800307F5D297E4DB6B2247502A06806703119E26D17E1B5B442854D3AB5E0E60295549F634AEF75F72994C9BEA400917667BCF044A4DAA33A5E72025E91D000B4A2F404A2F3A50FA11A4F463074A2F414A2F214A272B018A22F65712F8056924CE25AB99C6DC1FF99A6CCA4B328BE9A6F956C56A719EB94DAF0F28DEEC8BA588A5D1A6DA53FA29D96260B232C96EB4C8F454906B73EC29FEF33ECCF1876493F0E498647B5A6F2314FC2AD362925D264A71239E8913A54E751094EDF5312433A5DC4E9461490A16B0A77F45F846150CA0D942963DCD62DDE2695549B3113DAD8D892FC9A3A468217934DFFE3697FAEA0155964C95E480C2F53AC59930B99B448719C23E1CCB719ACD980DB205C3205FF0D693B5C0B889C021019D7BE894A5C46538D0C3599086D5E32E1C3D3663461063ACAAFC01AC350EEF822ECDD7C3686FE75BB2385E21FA5E3B47A44DB6A7751AD1E341FA374F8C4D77A5761904FB1D923125E7BA68230FB9A87E3C80EBBAEFE93C11D405C32C5F60D75AAA59C0DDF0FD3080E72A2D9FF69516683E7B74F5E317B2C995B48F32D1618B91AC1F85DD459132E4C66E32492EDA35FA13E782334D17996E22310CCE7D60517A474139536625EEE805862F04686FDF2D86DFF0FD30635F1B19B014604F2E1D15CEAD9DDF3268FCDD35F45013C581DFA02B833BA869D1BBDCC202AD7C3092DF1C71590E923747694EC66F27D314B2EC69BE474118112CC84A119FE3A0658768132759286C09996407152BD96ECB0B5D4EB56A521DC6238A70BA09C55328267936D201B61DF0764F02F99175B834B122338CF4E0C359B174F481AE3414CBE86F1C2938209C9A46139448989770A422359D33F428EE769DB4A2421494CFD24A12A24C76585FE3B54CA9499CCD8C610D8BFCAEAB90C995F5A20A7F3CCC9C90E5B74A6E4F34462A73E78E524CF088EE20C04C148619A7E24E1D586CDB6497FD0F44AA4D75386489C3BC74DEE37AD6A43AB4A97C739A6B5099644FE3EF4908A84D6DAA1B872E927578178A47887C8E0BA75090875FB1C8A93A759A83ADEB7013233A310499DF26BBECEF77BB24CDF11ADE5E03D9E35E38141F9C26F15D986EC55115F35C74FF2CFB46F61F3FA1EC5E54FFD91C27FB807D4AA54D8EB63BC94880CD1AFE92C4829E82A37009875DFEB7846C2488EC7D17D3C30581BA9CEB30B793E0D7649F136DA4B80EC8036182CBD91D68036D16F31CF6204180B3EC3D81285E9F26FB58BCBC95B3ED69D3354C5E0BDAD4D9E801B0DFDE407A4119D1A4B772A020338C8650470513C7D18D4AD164F9F4984976A4F5338AF610B12A7DAEF8523A657AC15719D4A637BE1464D4D2891427695FC3B5B80E08590E2B41F5CD3FB0B0FBE4328642F13CB0A2F29EF30215C887D11D293095614549FDC20E7758AB787567B2A11C6CECFA8F9BDB98F5B575F4BEE1C9AE1FB3E2B44F681793EE8625A5198694F91D1D7FB0AEEBBE50CAC41A7307A8EEE361B049CDEFD2841EB88BC7F96DBA8B322D03A84E73BA1648BE91FFA45B812AF5BB352E52FA28FA02A72A649D3B52AD290D74DBE0E16EC0FF8D85BFDB06F19CCDF58CCDDFD9E1278C32694DA8D25CA864FB2817A99469B3997E8DA7AAB7B50076C7B55908545F4E7D51A183ECE5DDDB30158F4EB90C9783BA07F178EE61CA43399743D2A9E0DBBA127B03B0CA6FDA06C2EA6FE70AE2DF2068AA10B03E2F6851C7BB59E0BB8194075AD9E7349217FD32D5E5E230C232ECDA5437F9799A62D8ACBEC918DE4C7F3ACD97719C7741E37946FFBEBCFB9D41EF6DC8FFBE9BB6DB46323EA82367F9B4790AF3E40B9C65D2A5659338DD2C39CF882A2B8E5295E642A57C5B4522D424BBB5886CABA4336436DD6577BF16AF0712F9CD97E2FB9EF3BEDFA6B4995C35260E638A9E676F7E410F20B8852C3700ACC31407B982AE94ED42FBE7107F53D0E5B2409AA749BC0E297F17C5FD12CF7390EA59488F59086E1119AD19C36E7E78D3F27A642677DE4E6F3C1E5DB1EF00B88F96F6EB6184838F75F353B2174F82AA24976DD157A0296DAADB5931160D249A4417B39E0DBE4CA5258E4976A325FB06C02F304D36139877297C4D07FA9A85FB3400BF1A06FEFDCF306FEE534939ABD3C6B57D246CDB0097FA1B37A8FA5282DF3DD0C055D232C0248F0F7C3E2297EA96AD8E99EB7A93567FA7BE2E33DCECD2B063A2E05084B696596735391872F0E36F4C0B3A344EF9F49D55E304EE38B6508CB7E60C00302C610747BAFA5347AB7180BF9A98861D59CC53F400014DBCC48E4D746E54AB839E671FF751F47A7987A24C1260FA8E9BD12305ED138B34C2AB4A697E3741FBAA80795C24BF822D342E5FC18EAC0ADE2746D02B8B2C17B54555BD581FD10247D7FF8ACA90016D810B14877738CB6F925F71FC7AF9FCF8D9F3E5E24D14A2AC0CA458C5067C25BEB768152CF0D90B1A2C10AFB72BF173F79083944A96ADB998108CBA51DFB54371F64EFE812530D420611EBA54472D385989144E4409C77E5CBED215C6D03395E7F11A3FBC5EFE57F1DDABC5F97FDE329FFEB02814C6578BE3C57F2F1714A3D4FEB7C1E94ADB844AFF2D2B8FBFA234B847E9EFB6E8E1F72CA9E2654C03A536CC8F0F624D503F7FC49EFB24F6C227B11F7D127BD98118ABF968678A22449EDD5CE93245849951AC7A7FC3443ED253CE2B94E7388D69295CB4D419FEADAB88870160A2ED79A2D606DBF3409009B7E7811A1370CF0B76EB987B1E88C9E1F6FC12F52AE984207B1E2856A1F68613028A68754F0BE6840B6675A5EE033E75843C1FE0664D068603A42EB4DC132ADD868CBB1A2FE9D11F79E157EFD82ACEC074C8E157C47E3B58B58471B5F530A46C10396FE4D8F8715E96D7872E6BD60C26A3354C3531DB0E16A840CC37A6B62997D632E89B0F45B788FDE681508FBD868328D4854C3B5898F94386147ACD4D44089F0F21263461CF0E76FCEA086A5E544A26829AA37C6F3FEDA56C3161D71C1B507FD8AB7A214A9B0F71C9C768F340910FD1E6432D6D83B4F950619A386D3E364C6DA4B6E104BBD9CFE8608503EF68E436A3D86F7B4DAACA71CAB176FA51AF6A1BBF28B78AABCF7A555D046FEBB9C16342B7F5A4D4846E73A2E3B8A8CA666A073B693A0A567B79A3BB4E3E58AE31C1CC78D62D1717E8E1038E37F9FDEBE5B3E3E30E1709EE846D1697D65BD1C70EA4B4F92929E561FCD86597D6463BEB39E579BFFF9EC4DA386725A12FA17BCFFC9EBA3021CEBCEC68A5E066439D1A73907DFEF28F9D883221B9BA0F081FE0CCCF15291BDE6CF2136E2D3D2F2C94E39875A705042E53CF5A2B7924042CEBDE34204259F773A836369938314CAA59FD6591FCC3E23CFB1C87FFDA938C1BC20DAAA3A9679683AACCDA19755197DBEF550AA43FC501085076B0DA43ED78E6C6F3F2AB5EAA3A131BCDCBF97D1B1C6D340512082466870343DC30E82E4F17170C280FFB139AD126B44CA7F73DFF93FBDAC7F6C233ED9180DC152BB2F1B21D54548EA14051384A9879CC2713017583DD2A2EBF1A78C8BA0ED70C25BCDF2D091387ACBB6623851EF3B00274536E684BFC2937F626878A7060070B3236AA9861302D755F2B60D8D16AE28B7547AC06AD1C465E9A4E59AC21621587EB60F132D1D1F42C8EE5273D1FF770C6E5F5F8AE8E38E6855419766C38FD1F0CDE75B073D0DF3D261B09ACEFED0B8D0636C333ACAEB6A8F6D882A36A3DA1EBE04612087975B0A3D8C6CEF26140D184CFF224749AC0403D854E77FB6017754E1155E460B131D9B981B753437F26788DB7FFCC905DC7BCEA7181D806BBEA43A40D72D59D4A19E2CA038785184E608BECE848319B7AD0E2E23475A623040DEA75CAEAE43D0546E13958E1E64F3454717DBC1C717DF5D7AC26BC8F0F15AD0DF0D3FD86B20EEEE3B69C945F0D70E72745D43958287BD9F4D7F1797C5BECF4A35485EA99D902CE04EC1970BF681722C7D255D010E446FEC21C79C6C2C790AFD571E2B31FF7B33D07BAE2D616998287EB2926BA0A23B20B1FE55B55C88277F1BAB8D260831A547DA1214C8E98D48B7D9487B4D9A46AA20B484C6A49B5AED12C29269527757C74245323C0C129955F885A5165798A423954D5551AC641B84391D407A1A4A5E4A5BC6D688A39677887632A52A55EDA54A6F1ADA5B536C485196162031753470F06DE3F785C4408BEC92C3D31EBBBC086CE177BC600693C88874087D8A5CBB8DC272ECAAB3B32A150162039267111984A0DACD6EB99471593CEB7E43F0E124F0AE7EED982A98A2635AE98A94358B1849AB4EF42B08041BA660B02D111F756E7FDDD0E235F8A1D4C21672411237813F37246CC1C44D868F8360CCEF42ED48A3A25B7E269240F600471ABF3276E879A2FC58EB390330AF0406B0E4EB481050601A0867FC300D0F2713AB95EC5E36F53430FB8C61171C71E0030A02B937FA3885384E49F11DCB40F048E833ADE70F8167AB39D1D64C1A9911B5F316F1CD841DE129A66550506819D2182F020D8B37ACDDEC5D47B0AD4412FB91F12EA4ADF0C4DB3AA02DF29EA146FDCCF0D755736B1DAD9CD656B37CDED2E99E451C0A63E7C879B25951AE60C43F742B577C4595E40282A37DD384C823E280C3B2C62A4B1368CF06F0A875DF0302918ED9E511877152E1A4285B3D5223C133C424E6F9A35F8FBC2A0D1E34F512DECB7378DDE57A00EB8457E02DD13E886DB6C94AF001DEC5E631E889B68A7618DB869B7B7D0515EF9EAD001C16E46E7795300AFEBA15EE3703709F4148E9C077987A1724A65DBA52CF37DDC6458F9E52AAA9EF232430FC383B8CF982BFAC6BAD5E805BDE92F3654083CB465787E309C6031EE83C569D7633E5E18ECD2CD9CB055F9DC795A9D360ADC3A6A00BECE9421FE0C0329F7A59C095A3E0728293CB8193035253838B5A9BF0540C15C9A0DA4D850FC3300957E71EC3894A0B5A49725F750B5FA2E2BA8CDCBC0E3A8558D67F92D10D77AE6AA54EB152FE84F4CC677A43429820028EA9BF4CC8C71EABD053C7B7907A1DAFB5774116AD29D2410F365F9F4B21D554FC8507A330F830AB1B3769ACF66ACE3FB77FC1BDE8C2F3EF7DEB6848EEA1577DE8160B9689DDD448BFEF2C56ED633B9F4996B0A4870E1AB607C0CA44A983C55354C1143458CEB9B541193A7AA882962A84874A6926A130BA8AA14CB19EB65DC6D804A995C758D4C214375821B8054A1905F575924674D8D42296317454B7FA09F621145CD724143E5827226D52CE4D7D55EBCF9D4D429143154089F45C853112C06550F97B4EA76B9A42BFA5C66AA3B5CE69B7A2BEA327247C512758DEB2F49DBC76CF711E7A5098663959549ABA9DEAA98BEF2CAFED7B1059579A3A90555317D0B2A5B50C71694B79EA60694A5F4F597D7C30ED59BAB36556B57256B77282F394C2654119B6FA847799A2855AA2C094D29656153B7EBF32FB9CF750E545D936922DF9E87C815B47960156DB6852C420A3184D4CB5A956D1E2F66F7020D1293ADC73E5BD60C484E370675932617AA962960AE8B064891EB28526BDAE447BB4A1639D613CA3C9B3565F5D34D282EF794518401A58FF1815D302545FD4FE52ACB1F088A2A2BA94FA3894A7B244E0B2DBE552B972BBE5B165D56861800FA6D178EC05BE761CDB82060D075BBB00172A4077960F4B8F7C8004945AF7AAFD6BBDDBB2EBB7D03DD36F8867BEBB2B0852CBE54ED0DBB8CB2D6B9191C6E7B7768AE23E07EA7E88E760F238C3FBC7FA94060D890744082D984058286A3E18BEE709BE99F76F3C36346A3369500B25180BCB2AB5CF59D78059D172AEC33242E413BA679B008F673843863E111A93FE8667B23E6E958A3D9D541C4AA02DE59536FC0CCAC81DCF6C6600DB7DD848855057AB346E53106F0C6CAB98C5F9DA4FD5CB93C29776A8AAF15CAAB404C2AE59F399543930D7320DF27D5884B9D327465666C82BD6CF4B34BE58E33088B342729D0DCF2CF16DE15C42C77146E23DF2F732A97050B890CF8368C2190C7628BDAA0CF56C5012C1C8661D0447A8E9DFD37C0AD0E86E3DEF567C3C96341CDF618D137EB548AB4ABA5B3475D7A9EEC52CE47078BDC41A6E4B4EC820D41013659588CF21A0E7F3E5EEA33F0E1B78F09DBBFEBEDA9B9B1F32AEB3DD8CA916580EA687E162C504E11A3359EFF238BEE93AB9BCC10ACC76039A133311B4A36487728B54060327A3340B272521CEAAB2DA1D4B650C2B97C936E38D5E72C9FEC68683A5EC7976E2C789ABC935579515225909F799212E217C91A4759917AB2FAB48F69C0F8F2D719CEC24D4BE284D08C7161FFD712ADCB9CC777496DB824B4A82E22C560CFD11AE5E84D4A46180539C9A62FA087F166B928DE76A607A45FF0FA3CBEDCE7BB7D4EBA8CB75F22EE45646A00A5ABFF6425B5F9E4B208D69EF9E80269664863EC5FC66FF761B46EDAFD1E88FBAD20412DABAAE8FF742C73FA0AC0E6B1A1F43111173F15A18A7D8D41587D2A9C5DC6D7E82BEED236326B3FE00D0A1EAF9A27A25544CC03C1B3FDE42C449B146DB38A46FB3DF94930BCDE3EFCE5FF01691DAF0AA0B50100, N'6.1.3-40302')
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'202106261321271_TreatmentPLan', N'MyHealthCare.Migrations.Configuration', 0x1F8B0800000000000400ED5D5B6FDC3A927E5F60FF43A39F661667DCB99C0C66026706899DCCF14C1C1BB17366DF0C464DB7758E5AEA91D48E8DC5FEB27DD89FB47F61495D7929DE24EAD2394680C04D5245B2F8B15824AB8AFFF73FFF7BFCD7876DB4B8C7691626F19BE5F3A367CB058E83641DC69B37CB7D7EFB873F2DFFFA977FFFB7E3F7EBEDC3E2E7BADC4B5A8E7C19676F967779BE7BBD5A65C11DDEA2EC681B06699225B7F951906C57689DAC5E3C7BF6E7D5F3E72B4C482C09ADC5E2F8F33ECEC32D2E7E909F27491CE05DBE47D179B2C65156A5939CAB82EAE213DAE26C8702FC6679FEF81346517E7782527C7416DFA628CBD37D90EF53BC5CBC8D42449A7485A3DBE502C57192A39C34F8F5970C5FE569126FAE76240145D78F3B4CCADDA228C355475EB7C56DFBF4EC05EDD3AAFDB02615ECB33CD93A127CFEB262D24AFCBC13AB970D13091BDF1376E78FB4D7052BDF2CDF7E4DF6F9976CB910EB7A7D12A5B49CC0E8725C8E0A3A21CE8EAAEF7F58B0A57E6800427044FFFDB038D9477464DEC4789FA728FA6171B9FF1A85C13FF0E375F22B8EDFC4FB28625B4ADA4AF2B804927499263B9CE68F9FF16DD5FECB24CD6F93284CCED6CBC58A27B0122934DF431F979D3D8BF3972F968B4FA439E86B841B68ACB484AEC33CC2350902303269968B73F4F011C79BFC8EB0103D2C171FC207BCAE532AB25FE290CC31F21181AEB196ABFDD77C9C8A704021F07CAC8A5E8C55D1CBB12AFA71AC8A5EF9AFE813BA0F37850C504D97E5E2338E8A12D95DB82BC56C2D096E98521FD264FB39895A31D366DE5C25FB34A0504E5425AE51BAC139DFBCE3552BC1B4728D694547C9D650984CB67511696649C630E22A4F52FC371CE314E5787D89F21CA731A5810B769A20F811C59B3DDA0C2F8F7E4AB6781C114B6B2262769CCAFE7917E6F863B24906AFE95D84825F47A9E90AA7F76180B3C12BBAC619D11C93982A71A38C1653E1680BF125193632C1B2717A5888E011D79346F7ECBF9AD46B857A35A9D71BDBC691AD488E0255F39A5CB88140B6D444A88C6B23AF71BACD2E6EAB4907B6942F02375755466AB3B2A07BC39BC904339829A06A3350006830540A6AADB566C100A3A366D15078DA357D4FBBA6F75B1446C30BE9F53AC5D9F0EBEBE55D12E34FFBED579CCE668BD141EA8ADB0C9D64EE240E4411DC5126F0649E04C308F3F5946C7ABEECD674EB53D74593AEC32D766EF129CE8234DC95877433992DBD567E71DE1855848E93A7599E5D670EF3E9D3065D55D7966C1EC8577783CFA59328244DA27F8F54D54510EC776898F926E9AA0F03EC8ABCC9CECED2A193822DCB059D1ADE4928147AD435DEEE489BBB2FA81C952709A1A88BE312ADF410166EA2D1FF8283E1E7E4BB64FD387825C31DA22A05C3CF280DE9A0AA76DE251AEA5237C27C642584AE24B017D716EFB5291769F7D0C379424F9263D2A9CE41C4DFD228407AC859202F985693A6D32CF85BE2A047F3261347F4DB27B02BEAA2CC1945B9A5158DB4FB1D6CC76A0DD773BC0E03147DC64192AEBBE29623F20460455D358F073F347CCCC2204471DF1320D241BACBEB4BE6ED7A1B661401A785D01E5A2FCD519A9381DA8D52DB0714841119FA51E4D2698836719285C39F3B9F24DB2D19F9E12B7A1B4538DD84435C55AB6F3C091EE330237317AF4BC155A81DF00DA858368CF18D2032992B516369F98ED4FC89EBB5DEA72487A8C21D541456F7D1EA03A99B765FB9F6B4125060C778CA4DC9B62360014953844B410AA2B6A1B548B6696A5B56D9D8BA88A9B94D39D70613297A7B6BD1D8AA9CAAA145B6A19165995E2A3704ADAEAA0C44EB49A351D4D58ACFBE4AC2394AFB922880D497C8296A4E9B3ADF43152A48F9654F4AEFE375373ACA892DC8F531963CC9C8D47EF970EB55B98D72EB52F98D557F685197CE14E5FD095EB02649FEAA4BD935DD83346619DB673B49CB3F495E455D036C38EC97DBDD2EAAC6E74B462D533AAEB43C99A7A156D4F5214C33D3ADEEF367CFACC6DB71FDF988BCD56CB8248FC3BC34431CFAA607DFE3C63EECDD63EECE93BF27217792D17971A7CC3D4FD6E16DE8C1F6E52C46411EDE37AD7A9710194FF710AE7446B356B80A37312A1D0507BFAADCED92944CBDD17C254C56882F5EFDD1572D27497C1BA6DB16425D47FE1265D937A27CFD84B211061F07FB94C83EA26E6C77876D46A9AECBDBD05C7F4B3E90E99DA4EF63FA556F7A1F93E0D7649F93DD45617E9707B2F8B124E0A5396F830067D9070266BC3E49F671DE6F0B479509C3A2653BFF3A6FB34E22146E15478ABCDA735317657478B084ACBFC3C55C771C1F934DA83AFD146AA88BAA9B5A963036B52AE6DA544ACCAEA5554975438B02C67696A5FA9D4DF1248B41F2A43117B49ED4668D18E87B1A547098B5C81AD0A092D4F4338AF673D9D51553D413500B5A9301B5A89D24DF876BBAFEAFCC5FD4850979ABF235D45CA783D032F51EEBC59F86D8DD71DD1CBB72F7E9D915C954887B02322535198E61948145693BBB00D287CCACEBF66324560E9E79C5A7E56ECAC2CA45BF29635AF7DB82BE967E4F189C147F735FF0FD9EA764578F597142DE777743C76C50CF24B793E1C1B73E9738ADEC7D6055BDCD97B574314FB223900AB89A0CD0E96DDC421453BF2A094A93B6804E9430A5FA8551693ADD5584B4149EA487A22EEA939A26D41CC9C30C753E00F124195CEB8DA2E41BF9AFAF88B3136FAFFC5C5174381D701239E28456CAA44E73596108D575622BC83DCD72455D1ECC4CFCD9BC783258F1701535DAF5DB678CB21174A0CF3823001FD1A6D46C563390A1A528ADDCCC333DD9D7E82B154D6CCCA51D7BE5D9D0465599646BA32D68DD070F16378D756B47EDB0FCFC69D150D4358E713F69DAC5EDBB306DAFDEBB1B20E287EFEA4E759CA03E6771B64F511C30A757639FC133B6DF1DA7724DE069324F39990F7D7238D97AA2CE7EDEC5D74F4855D45570E74B3ABCE0FB104678B435EE24C57E823D750E1CE5B2570F6F5D4D99458CB3449EA0AEA8CBC7BDD328D7F4E3B8859FE32C1BC34CD1E77C3CCBC8DEBEB729D859768A239CF7B729A3CD219B2DE65EBD2BA513C2CE114F124A8B7A785BDA08929BB214B715E533A1EDA750A2EF396643AE81AB071159D1F2232917EF5086AB911359B834C0E7ED2FE84198877DB0B80E531CE4DE08FE1CE26F9D883945D825C2FBB2CFC032349E963E455DE3AC289F93FD08D11088501BA73B15B086DFC711E45EA4CC22D23590C6463689B17772DFC01630CCECBA290BF15178D93C30042F57C0D9A59D86C4EFDF2E28203BD8F04E42EC63B2E92CBCC8B74F424B5197974BA7EBBB94D118C7F1F81AAE9664B319E1B067AC9DC1FB07FA049C7F7325FB5882745B4263D05C46DD4F4339224F93595197A7304F5E64C2884E819D2EDF95CB218D19A708E5C982F0A62AC7442E94B3E570854019F7F55A1D2B87A70FC4CA010B189AD935568EFA6296A72F5DC702D98626BA5FBDBECDB224088B8631AAA8F81C02DFD3F7F17A61F13642BB4D651E3739273229A40685A42D6F96CF8E8E9E4B8CD4936FF4AB963C13689A272FD326420CA7548A20EA674A042B0AE35C9678611C843B14999B217C6A292EE97034958839A77887632AE9CC3CB6A95DF3F6026D46539B20CF4D8C3A5E31C8D1034AF962806AD8CDCF07B4632F3E94E1842FF30B45E381CCD496119066E2FBA1C00D0A41AF8680361E3D0B34E651091E01FFA18598F641292B7C895CBC88CB33E54569664B4404CA02B496177722F3D75EA0A9E9C328B8D48CD16180527E784E0518CD9BA62D589A37EE9CC49DE681BBF1E49CB211230049C9DBC30091217AB85A04D9851267659D18F7DE45E0D985EF6F6B1362A0CF4FFAD97468143168338E360D91E2DF4F2313CDD6C34A49E66047CC484DD04FC11EDA2E6162DB5A057BE8B9C1DBBE53630868EB71B5694CE51B3137700397B55618E30DC947813567882E61BA3C4E3D2040B3DD9916CDEC585A4199F3D19906D170981F25AA0C317F18FC8AD117074494B17D00D8E18037A6F9D50DBB5AA68D01592D576C1AA00CEA300546ABF84EB61810833DCD0DA342942975FBAA5837A3609467DA0418E5B9327B8C4ABEBBAAD1573BF232BB75C693DE7EC5574725001155C6FAD092EF364799B0041653008A5160DDDEE16728101C413D412D58EA617ECA1C1B777ACA2CB1A91F8EF533CD0AD246E1B194D140489E9E20B0A8CA7DFACE404D377466FC85441ABA4303AB613D31448C9C9BB263B3328D274A658E4DA0E9702C99BDA2A3F139773A8A100C1F063EF8E04D28269A15FE0E3EB8EE4C75E6C18DA04D231A5BA649806B17D942852AC730179C33475F443BBE65763087D44EFD1A01E54E633CF7A36A8B6027DDF0A63AB01E1CE887786C6DDFA3C9F17D8087D7FA1038AE28536A240322FB70F512AB1E4D08EA03D34EE077405570323C0A6AA901E800AB7F50943DABACCDB0E706506D0F4600A6768C6CEA671C1EE600C926E68F2564E4C75FFDC3527A389605661BA468E6D0147B313E38C5B1B28227FB7EFB0C00AA5FF4B50FFE5A02D36088A97B2FD87E65EF7E0523475ED06823AA300C8A28046EAA8E2282C381A937702FC65169E0E199FDE1A0E453AD0289DAF19BF72F6A423BD8E34FEDBB6D451A9CE49D1D8CA0868C8020157BEDD48ECD74771F9017A26AA0B52E898CD933EFA2EBE64AA4F16864AAA019FEE438ECE668D744CD5640CB07ADEDB7D65FF210B602DA1E8C301DB56374085B01C8A5D50E2E4A4DCB131C0FF70045D38FD12139EBC392D2C5B970980D639CCAB7E4A75F8BF5EE018A2C4DC6BE8AC190550EF722AE28F12B9CF32E5DCB45EB582D7A6749C8E429341E451011C60FCB4086F1AE96A83079062AA223AD444A2C60A4D738ED410DE3DC290DA43877158898E041646C19EF4703374FF4803210ADC2204884CA05DFF0F1394A814F851DA6810674B40982133C9F3635B039C18748B2D72A0642D51B4472AB44196CEA2D60936D41B7B2DD76235E3F126B225E19DDBA112F4D768CB44B231703690B5A56742ED907AF64C1C4989C1A08294EDC21AACA9B13535B4B7D076C68AD649A48D4C7532091F66CD0628E20D5F44036BC6AB6F20A0631872C46AE6C402E73BB59038DAB4732145B026A88501187CC246759C50114B2BC62279063D67860AD633CA9174C4971D953395C4BE700AA28264DA7B87556D265EC629630C4D8B55FD41AF99E5B7045196103608D5D340E5E8F36C5E360FAA5D712ECC80ECF2E284204C82B632809A147BA60121C9758E548CB235DF888A11824472B0098630869C075431DD480E982426D36101A1E2C5AA77B1035F66EFAC2605B39EA73389254592D98AC5CF319FAA2E6DD1F59162F46015073B4C6E321636F8CC78211D65B74D0B437BC63EA2954FF21D95AEA0B4E3C954DBE6C3BCA597C0DC54DCEBA8B6525BB49E9CF52D8DD15E2A485632CDF37BD6B2CD3A56ABBA4E393DE8D951D0378CBE49D51F576C9CC28C83B53DB39C13FB317A3045F4A35A3EAFEF46694FC68A7CC22BD7320D721A57B20BB12B23B390D73940E810CADAACD3EF1C2F8FFE9E1A27214548D30E02A68EA890529335606E091F016BC7156293CD6747341F65973ECA11DF17130C53842598820D324D3FB4CF51240CA893614A6344F405AAA07C0758E79D1E6EF75FC2B05FCBD8E69483A30CEF2A15399871DFC48B8EEBA7992303D579FBB6998EBE63BE25D85B57972D595C50645D6C17B6158E68EA3D11A9E81B567AE490CD899CD0FC5D2C1E5016C800DF0CFC2529BEB91DE565B3FE32C08412725CDE9B96FAEB4C7E646BEC0E6C2BA0E4906C3DD7923D905B3DC612E063CF34739E78C96AA9ACE28E7971B4FC65850C587BF40E1A3B351154581C24A951732EC058B5EB228EC52076086FCB80C7C9D8195C692D2F50386CC25B959BF31C856A565A4894A970356E83901E054D564EFA731FDE12DFED8F353E18A4A7778AA31F0632856EDF7CC15CD22636103A8E9876691E9CC9B71D61BF0ED04137B4CF2546791E68335DE446BFD9C4363EBD4E41DAFAE823BBC4555C2F18A14A14FDFEC51543E0855679CA3DD2E8C3759FB6595B2B8DAA1800A813F5C2D170FDB28CEDE2CEFF27CF77AB5CA0AD2D9D1360CD2244B6EF3A320D9AED03A59BD78F6ECCFABE7CF57DB92C62AE066A76899D5D49427291123426EF944E58730CDF25394A3AF88BE5B72B2DE4AC540CB2EC5A5745D256FBC250F5C7D475D97A77F572BB8E6611E05BD96A91F483F290C8A2E63E0D64BFA927C7B451665948AEF9EB071A84F9268BF8D2D0254ABE9550FDCB194AA247B1A57FBAFB94CA64D75A0840B9BCAE702A526D599D20B9092F45C9D05A59720A5971D28FD0852FAB103A55720A55710A5E395004511FB2B09FC823412E792D54C632E637D4D36E58DB3C574D37CAB62B538CFDCA6D747146FF6855EC7D26853ED29FD946C3130599964375A647A2AC8B539F614FF7917E6F863B24978724CB23DAD77110A7E956931C92E13A5302FC9C48952A73A08CAD616039299526E27CAB024050BD8D3BF247CA3DA3AD06C21CB9E66B16EF1B4AAA4D9889ED660CB97E45152B4903C9A6F7F9B4B7D615CC293A9921C50B85EA73813267793E83043EE92187FDA6FBFD2C3088ED36CC66C902D58D9F982B79EAC05C64D040E09E8F4C9C72FBB357D8192A7C46538D0C3599086D51BA41C3D36634610634C14FD01ACF5FAE8822ECDD7C3686F675BB2385EA2FC4E20D226DBD33A89E8D907FD9B27C6A6BB52BB0882FD0EC99892735DB491875C543F1EC075DDF7749E08EA8295A32FB06BCD3E2DE06EF87E18C07395D27E020B349F3DBAFAF10BD9E44ADA4799E8B0C548D68FC2EEA248197263379924178D84FD8973C14BAE8B4C37911806E73EB0283DA3A59C29B31277AABB936E18281C1CDDC71DFE6C98B1A675C9CB6E9BEA4609400E93FCDDEA83F40ED91766B4065016E0317C3F0C8A6A3B2F9602EC9BABA3C2C5C2E2379A9A20591A7AA889F7C01FEB28C340A86951739AC208F8B4F06CE1B7D45C96C37A9DA33427E3B793690A59F6343FA0208C0816E439CDE738CCC5106DE2240B85830426D941314FB6DBF28E9353C89B5487F188229C6E42F1EC92499E8D7480CDB7BCDDAE419EC11DAEDAACC80C233DF818B82C1D7D745C0DC5326434470A8E22ADA6D104E710E6251CB1434DE71409CA7491E02825AE43713A33C90E5A59BC96293589B39931AC6DA7DF7515B27AB55E54E18F879913B2FC56C9ED89C648E571D2518A09312E3A0830138561C6A9B0C40016DB36D965D70C916A531D8EE6E2302FFDA7B99E35A90E6DC2F758B888A892EC69FC3D0901B5A94D75E3D079B20E6F43F1E099CF71E1140AF2F01E8B9CAA53A7390EBD0A3731A2134390F96DB2CBA9D06E97A4395EC3873240F6B8D754C50727497C1BA65B7154C53C17DD3FCBBE91FDC74F28BB13D57F36C7C9AA649F526993A3ED4E322D61B386BF5AB3A0A7E0285CC2E16CE85B42361244F6BE8FE99194405DCE7598DB49F06BB2CF8936525C22E58130C1E5EC0EB481368B790E7B9020C059F6814014AF4F927D2C5EF9CBD9F6B4E91A26AF056DEA6CF400D8757A20BDA08C51D55B395090194643A843098BE3E846A568B27CE7C0243BD2FA19457B8858953E577C29FDE2BDE0AB0C53D61B5F0A326AE9448A93B4FB702DAE034296C34A507DF30F2CEC3EB98CA1503C0FACA81C98BD4005722377470A4C65585142EB14A9D469B319CAC1C6AEFFB8B98D595F0B59EF1B9EECEA312B4EFB847631E96E58525ED64899DFD1F1071B3DC4174A99E891EE00D57D3C0C36A9D1669AD00377F138BF4D7751A66500D5694ED702C937F29F742B50A57EB757904A37715FE05405217547AA35A5816E1B3CDC0DF8BFB1F077DB209EB3B99EB1F93B3BFC8C5126AD09559A0B956C1FE52295326D36D3AF71DEF4B616C0CEAA360B81EACBA92F2A7490BDB87D17A6E2D12997E17250F7201ECF3D4C7928E7E390F42CCEF6298A034971E732E6331DDAE810DE26842A1486CD94507F3BD74931250827BCF5457E2F7C51C7BB5EE0BB8194115AD9973492958832D5E52232C232ECDA5437797C425DF321E78E2663786791E9346926168A0B1ACF32FAF7C5EDEF0C7A7443FEF7DDB4E736D6FD411D61CBA7D75318C99FE32C932E419BC4E966C9594654637194AA34172AE5F34B12A126D9AD45649B269D49B3E92EA7056BF1BA21919F852ABEEF39EFFB6D729BC95563E230A6E859F6F617F400825BC87203C03A4C71902BE84AD92EB47F0EF137055D2E0BA47992C4EB90F27751DC57F13C07A99E86F4D886E01691D19A31ECE687372DAF476672E7EDF9C6E35118FB528CFB6869BF1E4638F858373F277BF164A94A72D916DD034D6953DDCE9EB16870D124BA98096DF0452A2D714CB21B2DD9D7007E0676B299C0BC5CE46B3AD0F78EDCA701F8D530F0EF7F267A7D974ACA599D36AE2D2561DB063012D8B841D59712FCFE81864F939601267936C017E2D2F9023FFF4E97FB34307C3FCC84F0E918D57F7279357675BC46191A8C7C9042D515721D93DFF59AB8FE4E7D176C305BA0C118456C289ECE905967054C861CFCD02DD3820E8D533EF56BD538813B8E2D1443503A03000C7BDCC14BB4FED4D12502E0AF2666724716F3143D4040138FB963139D1BD56E88CEB24FFB287AB3BC455126ADA6FA8EF7460F181BB8C3A2557F6AE3850E8C87269A70C7F1E0297A808C263CF1AC2063EAB8193252E85BB148B3DE5529CDEF26F46D1576968B875BB08546B72DD891552170C538B46591E5A2B630AD371B47B4C0D1D5BFA232F04E5BE01CC5E12DCEF2EBE4571CBF59BE78F6FCC572F1360A51560628AE22ECBE169F23B70AB9FBFC250DB98BD7DB95F8B97BE05E4A25CBD6DC746034C6DAF6088A567BFC0F2C81A10649FB10BC26F6CFF14AA4702C2E8AECC7E513B2610CBDE27E16AFF1C39BE57F15DFBD5E9CFDE70DF3E90F8B62C3FB7AF16CF1DFCB05C528F5876870BAD236A1DABF9795C7F7280DEE50FABB2D7AF83D4BAA7838DE40A90D96E78358131AD71FB1173E89BDF449EC479FC45E7520C62ACBDA99A208346B3757BA4C116166144BDDDF30918FF496866C7B729CC6B4142E5AEA0CFFD675CEC30030316B3D516B43D67A20C804ADF5408D095BEB05BB75E45A0FC4E4A0B57E897A957442A85A0F14AB80B5C3090145CCD7A70573C205B33209F2019F3ACEAC0F70B3264FC3015217A0F509956E43C699F694F4E88FBC8833E2D82ACEE07EC8E15744503D58B584093DE06148D950ACDEC8B15158BD2CAF0F5DD6AC194C466B986A229F1E2C5081C8A94C6D532EAD65E8541F8A6E1141D503A11E7B0D0751A80B3C7AB030F3870C2980A99B88103E1F424CC8A7B7073B6C6D30520F23C78423F5A1E6F4524D00844A27C06EC012BF5721AB876CD0C4173D5884D5A14ABDEC559850A58E8A43FB692F2D9EB9C6776C40FD61AFEA8570A83ED6613E18AA078A7C2C541F82A08D86EA43376E02A2FAD889B7215187D318CC0EBD072B1C788F5EB719C57EDB6B52551ECA8EB5D38F7A55DB58CEB8555C7DD6ABEA224A6ACF930326466A4F4A4D8C54273A8E8BAA6CBF7DB093A6A360B597373AD39683E51A13359467DD72718E1E3EE27893DFBD593E7FF6ACC30D953B619BC5A50D0BE0636B5B1AC39694F2307EECB2FD6FC38AF69CF27C809D9EC4DA80A225A1AFA17BCFFC1EE731E6955E8E4AA428A2435D4770907DF1EA8F9D8832B12FBB0F081F49D4CFDD3B1B4774F2AB132D3D2F2C94038676A705440855CF5A2B79244406EDDE34201468F703CE3608A838314CAA59FD6591FCC3E22CFB1287FFDA938C6BC20DAAA3A9679683AACCDA3C765197DBEF0738BE3047023D58EDA1F6C876E379F9552F559D0942EAE562A88D423A9A020944ECB4C3812140277449AC0BC00994871DEDCD68135AA6D3FB5EFCC97DED637BE199F64840EE8A15D991C20E2AAA88094051381CA779CC2713017583DD2A2EBF1A78C8BA0ED70C25BCDF2D0913F0B3BB6623C5F8F4B00274536E684BFC2937F6B6AC8AB89B070B32367CA761302D755F2B60D8D16A02797647AC06AD1C465E994E59AC216215F0F260F132D1D1F42C8EE5273D1FF770C6E5F5F8AE0EEDE9855419DF7338FD1F8C9279B073D0DF3D261B72B3EFED0B0DBB39C3332C7F46CE5CF0CD01B10A87AF7C42EB5C90E174CF87BE93516C8354FA30C868E2547A12624D04BE9E42ACBB21BB8B7AA808DF75B0D898EC1CC2DB29A43F1BC126ACCECC905D0797EC7121D94695EC43A48D26D99D4A194BD2C792CE074B045B6447470A8ED883161710B1331D213A5FAF535B27373F30DCDDC10A377FA2A10AA0E7E5C8ECDE5FB39A387A3E54B436925EF71BCF3A8A9EDB72527E35C01DA214BAEE60A1ECE510A10E84E7DB02A81FA52A26DECC16702632DE70BB0C4D4CB98345EAC446ED5E268A6793ABB1CE1E3B5C8578B87EBB34048E93BF304773B370C2E66B75841AFB713F1F0AA02B6E6D912978187126FC14A32A14411C6E54315DDEC7EBE26A8E8DFA52F585C6783A6252CFF7511ED26693AA890E2A31A925D5C68E604931A93CA96747473235021C9C526984A8356096A72894C33F5EA6611C843B14497D104A5ACA51CADB86A698738A7738A60252EAA54D659AE003B4D686B830234C6CE0828EE9C1C0075018171142F006969E98F55D604317AC62C60069422C0C810EB14B1771793EB128AFA0C984425980E447278AC87D6A60B56121785431E97C4BFEE320F1A4887E315B3055E1F6C61533758C3F965093F65D0816308AE16C4120462AB8D185C76887912FC50EA69033928811C22DF07246CC1C44D868F8360CCEF4312614754A7117A6913C8031CF8DCE2FBE1D6ABE143BCE42CE28C003AD9238D106161804801AFE0D0340CBD78CE57A15AF054F0D3DE0FA50C41D7BF0C480AE4CFE8D224EF1E6D28CE0A67D517A1CD4F106F037858B8618B7911964C139971B5F316F1CD8415E3F9A66550506819D212AFF20D8333A3D29EA55BA2C4C81BAC2A1E5805157FA18699A5515F84E5107B858CD11759736EF9FB09BCBD6FE9FDB5D32C9A3804D7DF80E374B2A35CC1986C23B6218C4595E40282A37DD384C823EE89D0A58C448636D18E1DF140EBBE0615230DA3D4D34EE2A5C34840A67AB45782678849C37356BF0F78541A3E7AAA25AD8FF741ABDAF401D708BFC04BA27D00DB7D9285FD63BD8BDC63C1037D14EC31A71D36E6FA1A3BCF225BF0382DD8CCEF3A6005ED7433DE593A4A3404FE1907C9077182AE76AB65DCA32DFC74D86957FB9A2EA292F33F4303C88FB8CB9A26FAC5B8D5ED09BFE624385C0435B86E707C30916E33E589C763DE6E3DEC1A1099813B62A9F3B4FABD346815B470DC0D79932C49F6120E5BE94337E0A73809222720003A6A60407A736F5B70028984BB38114FBA4C40C40A55F1C3B0E25682DE965C93D54ADBECB0A6A7A747E3CB5AA89687003C4679FB92AD5466310F42726E33B529A14C12714F54D7A66C63893DF001EE5BC8350ED752EBA0835E94E1288F9B27C9BDE8EAA276428BDE8874185D8593BCD6733DDF13DFFF0157DE44B7D78CFBBC772B6D67C8E133E8A07D7586265C22068D038F80E8307F93539453DF203663380C3FC37541D2179781B2A77E44EBDA1E2A174680743D3026B027DC61D60631EFDBC2FDCAA0BBFDE30C62913BCA878FAE714E5E82BCA64B5867E758573DEF36DB978DF78698BAE6857C11DDE2236944BE9ECDD1490D631BE0AC6394EAA84C95355C3143154C4F86C4B153179AA8A9822868A442F60A936B180AA4AB19CB15EC64F14A894C955D7C814325427F8AF49150AF975954572D6D42894327651745103FA291651D42C1734545EAA59528565725DC9F9DBCF4D0D658E81AA7056219117F2A17A8422860AE1A379798283C5A0EAE19256DD2E77B88A3E9799EA0E97F9A6DE8A8BA1DC51B1445DE3FA6BD2F631DB7DC2796991E85865E5E161AAB72AA6AFBC7287716C4165ED6F6A41554CDF82CA35C2B105A51190A90165297DFDA5B59443F5E6AA4DD5DA55C99AE1CB0B19930955C4E61BEA515EAE49952A4B42534A59D8D4ED7AF722F7B9CE81AA6B324DE4DBEB01B982360FACA2CDB69045482186907AB1ACB2CDE3C51CE64183C464EBB1CF963503923B2A02359E2617AA962960AE8BC6A993EB28526BDAE447BBF61639A6B59EDF36C80B3D9F0F414028623D83CDE24353563FBF85E2326B197D1ED05D9918140BA6A4A8C6AA4255F08711A2E64DEAD328D4D21925A74C17DFAA75E415DF2D8B2E2B43FC00FDB60B07E4ADF3B0825F1030A8EC5DD80005B20179608C78E39101D24EA3EABD7AFBE0DE7539EC0AD06D436C166F5D1676C2C597AA2D6E9751D606170187DB3E1C09D71170DB567447BB1513C61FDE86552030ECAB3A20C16C420A41C3D1F05477B9CCF44FBBDBE231A3D1D34A00D9685C5ED955AA194EBC82EEEB14F6911297A02DDA3C5804C7198038631191407F34CBF646CCD3B146B38D84885505BCB3A6DEF1995903B9CD8FC11A6E7F0B11AB0AF4668DCA631BE08D957337BF3A491BC87279526E0D155F2B9457819854CA3F732A87621BE640BEC7AA11973A65E8CACCD8047BB9EA6797CA1D761016698E6EA0B9E59F2DBC2BA659EE28DC36BF5FE6542E83161219F02D1C43208FC516B541BDAD8A03DCB20EC3A089F41C3BFF2B805B1D1CB7BCEBCF86A3CE829AEDB9A56FD6A91469574F238FBAF43CD9A59C8F0E1E31834CC969D9053B62006CB2F0D8804D8C587D063E6DF73161FB77BD3DA637765E653D0F7B19B00C50DD05CC8205CA2962B486F77F64D17D7275931982F5362C277426DE43C906E9D2A616084C466F064856C68A437DACB444964EE5852B9FE65CBE49379CEA63D6F2D88E4697034FC08A163AE53419DBF2C792D08D517926A9BB08E268B0461EC5A7A01147DF0E6BE4BD8541A91779DF9159BDBBAE147646F3C74166BA7F36D44F9A34B6774DDEF1AABC1BAC12C8CF3C49C97C3A4FD638CA8AD4E3D5E77D4C9FFC297F9DE22CDCB4248E09CD1817469A2DD1BACC597C9BD43687428BEA22D27353395AA31CBD4D895043414EB2039C6561BC592E7E46D1BEB82DF88AD767F1C53EDFED73D265BCFD1A3DB2CCA0A68BBAFA8F57529B8F2F8A77A9321F5D20CD0CE92B4917F1BB7D18AD9B767F009E9A5190A03691D5F351742C73FA8CD4E6B1A1F42911F53D15A18A7D8D29677D11925DC457E81E77691B81EF47BC41C12349BF0F8BB7ED5444CC03C1B3FDF834449B146DB38A46FB3DF94930BCDE3EFCE5FF01069344803CDE0100, N'6.1.3-40302')
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'202106261331063_allowHtml', N'MyHealthCare.Migrations.Configuration', 0x1F8B0800000000000400ED5D5B6FDC3A927E5F60FF43A39F661667DCB99C0C66026706899DCCF14C1C1BB17366DF0C464DB7758E5AEA91D48E8DC5FEB27DD89FB47F61495D7929DE24EAD2394680C04D5245B2F8B15824AB8AFFF73FFF7BFCD7876DB4B8C7691626F19BE5F3A367CB058E83641DC69B37CB7D7EFB873F2DFFFA977FFFB7E3F7EBEDC3E2E7BADC4B5A8E7C19676F967779BE7BBD5A65C11DDEA2EC681B06699225B7F951906C57689DAC5E3C7BF6E7D5F3E72B4C482C09ADC5E2F8F33ECEC32D2E7E909F27491CE05DBE47D179B2C65156A5939CAB82EAE213DAE26C8702FC6679FEF81346517E7782527C7416DFA628CBD37D90EF53BC5CBC8D42449A7485A3DBE502C57192A39C34F8F5970C5FE569126FAE76240145D78F3B4CCADDA228C355475EB7C56DFBF4EC05EDD3AAFDB02615ECB33CD93A127CFEB262D24AFCBC13AB970D13091BDF1376E78FB4D7052BDF2CDF7E4DF6F9976CB910EB7A7D12A5B49CC0E8725C8E0A3A21CE8EAAEF7F58B0A57E6800427044FFFDB038D9477464DEC4789FA728FA6171B9FF1A85C13FF0E375F22B8EDFC4FB28625B4ADA4AF2B804927499263B9CE68F9FF16DD5FECB24CD6F93284CCED6CBC58A27B0122934DF431F979D3D8BF3972F968B4FA439E86B841B68ACB484AEC33CC2350902303269968B73F4F011C79BFC8EB0103D2C171FC207BCAE532AB25FE290CC31F21181AEB196ABFDD77C9C8A704021F07CAC8A5E8C55D1CBB12AFA71AC8A5EF9AFE813BA0F37850C504D97E5E2338E8A12D95DB82BC56C2D096E98521FD264FB39895A31D366DE5C25FB34A0504E5425AE51BAC139DFBCE3552BC1B4728D694547C9D650984CB67511696649C630E22A4F52FC371CE314E5787D89F21CA731A5810B769A20F811C59B3DDA0C2F8F7E4AB6781C114B6B2262769CCAFE7917E6F863B24906AFE95D84825F47A9E90AA7F76180B3C12BBAC619D11C93982A71A38C1653E1680BF125193632C1B2717A5888E011D79346F7ECBF9AD46B857A35A9D71BDBC691AD488E0255F39A5CB88140B6D444A88C6B23AF71BACD2E6EAB4907B6942F02375755466AB3B2A07BC39BC904339829A06A3350006830540A6AADB566C100A3A366D15078DA357D4FBBA6F75B1446C30BE9F53AC5D9F0EBEBE55D12E34FFBED579CCE668BD141EA8ADB0C9D64EE240E4411DC5126F0649E04C308F3F5946C7ABEECD674EB53D74593AEC32D766EF129CE8234DC95877433992DBD567E71DE1855848E93A7599E5D670EF3E9D3065D55D7966C1EC8577783CFA59328244DA27F8F54D54510EC776898F926E9AA0F03EC8ABCC9CECED2A193822DCB059D1ADE4928147AD435DEEE489BBB2FA81C952709A1A88BE312ADF410166EA2D1FF8283E1E7E4BB64FD387825C31DA22A05C3CF280DE9A0AA76DE251AEA5237C27C642584AE24B017D716EFB5291769F7D0C379424F9263D2A9CE41C4DFD228407AC859202F985693A6D32CF85BE2A047F3261347F4DB27B02BEAA2CC1945B9A5158DB4FB1D6CC76A0DD773BC0E03147DC64192AEBBE29623F20460455D358F073F347CCCC2204471DF1320D241BACBEB4BE6ED7A1B661401A785D01E5A2FCD519A9381DA8D52DB0714841119FA51E4D2698836719285C39F3B9F24DB2D19F9E12B7A1B4538DD84435C55AB6F3C091EE330237317AF4BC155A81DF00DA858368CF18D2032992B516369F98ED4FC89EBB5DEA72487A8C21D541456F7D1EA03A99B765FB9F6B4125060C778CA4DC9B62360014953844B410AA2B6A1B548B6696A5B56D9D8BA88A9B94D39D70613297A7B6BD1D8AA9CAAA145B6A19165995E2A3704ADAEAA0C44EB49A351D4D58ACFBE4AC2394AFB922880D497C8296A4E9B3ADF43152A48F9654F4AEFE375373ACA892DC8F531963CC9C8D47EF970EB55B98D72EB52F98D557F685197CE14E5FD095EB02649FEAA4BD935DD83346619DB673B49CB3F495E455D036C38EC97DBDD2EAAC6E74B462D533AAEB43C99A7A156D4F5214C33D3ADEEF367CFACC6DB71FDF988BCD56CB8248FC3BC34431CFAA607DFE3C63EECDD63EECE93BF27217792D17971A7CC3D4FD6E16DE8C1F6E52C46411EDE37AD7A9710194FF710AE7446B356B80A37312A1D0507BFAADCED92944CBDD17C254C56882F5EFDD1572D27497C1BA6DB16425D47FE1265D937A27CFD84B211061F07FB94C83EA26E6C77876D46A9AECBDBD05C7F4B3E90E99DA4EF63FA556F7A1F93E0D7649F93DD45617E9707B2F8B124E0A5396F830067D9070266BC3E49F671DE6F0B479509C3A2653BFF3A6FB34E22146E15478ABCDA735317657478B084ACBFC3C55C771C1F934DA83AFD146AA88BAA9B5A963036B52AE6DA544ACCAEA5554975438B02C67696A5FA9D4DF1248B41F2A43117B49ED4668D18E87B1A547098B5C81AD0A092D4F4338AF673D9D51553D413500B5A9301B5A89D24DF876BBAFEAFCC5FD4850979ABF235D45CA783D032F51EEBC59F86D8DD71DD1CBB72F7E9D915C954887B02322535198E61948145693BBB00D287CCACEBF66324560E9E79C5A7E56ECAC2CA45BF29635AF7DB82BE967E4F189C147F735FF0FD9EA764578F597142DE777743C76C50CF24B793E1C1B73E9738ADEC7D6055BDCD97B574314FB223900AB89A0CD0E96DDC421453BF2A094A93B6804E9430A5FA8551693ADD5584B4149EA487A22EEA939A26D41CC9C30C753E00F124195CEB8DA2E41BF9AFAF88B3136FAFFC5C5174381D701239E28456CAA44E73596108D575622BC83DCD72455D1ECC4CFCD9BC783258F1701535DAF5DB678CB21174A0CF3823001FD1A6D46C563390A1A528ADDCCC333DD9D7E82B154D6CCCA51D7BE5D9D0465599646BA32D68DD070F16378D756B47EDB0FCFC69D150D4358E713F69DAC5EDBB306DAFDEBB1B20E287EFEA4E759CA03E6771B64F511C30A757639FC133B6DF1DA7724DE069324F39990F7D7238D97AA2CE7EDEC5D74F4855D45570E74B3ABCE0FB104678B435EE24C57E823D750E1CE5B2570F6F5D4D99458CB3449EA0AEA8CBC7BDD328D7F4E3B8859FE32C1BC34CD1E77C3CCBC8DEBEB729D859768A239CF7B729A3CD219B2DE65EBD2BA513C2CE114F124A8B7A785BDA08929BB214B715E533A1EDA750A2EF396643AE81AB071159D1F2232917EF5086AB911359B834C0E7ED2FE84198877DB0B80E531CE4DE08FE1CE26F9D883945D825C2FBB2CFC032349E963E455DE3AC289F93FD08D11088501BA73B15B086DFC711E45EA4CC22D23590C6463689B17772DFC01630CCECBA290BF15178D93C30042F57C0D9A59D86C4EFDF2E28203BD8F04E42EC63B2E92CBCC8B74F424B5197974BA7EBBB94D118C7F1F81AAE9664B319E1B067AC9DC1FB07FA049C7F7325FB5882745B4263D05C46DD4F4339224F93595197A7304F5E64C2884E819D2EDF95CB218D19A708E5C982F0A62AC7442E94B3E570854019F7F55A1D2B87A70FC4CA010B189AD935568EFA6296A72F5DC702D98626BA5FBDBECDB224088B8631AAA8F81C02DFD3F7F17A61F13642BB4D651E3739273229A40685A42D6F96CF8E8E9E4B8CD4936FF4AB963C13689A272FD326420CA7548A20EA674A042B0AE35C9678611C843B14999B217C6A292EE97034958839A77887632AE9CC3CB6A95DF3F6026D46539B20CF4D8C3A5E31C8D1034AF962806AD8CDCF07B4632F3E94E1842FF30B45E381CCD496119066E2FBA1C00D0A41AF8680361E3D0B34E651091E01FFA18598F641292B7C895CBC88CB33E54569664B4404CA02B496177722F3D75EA0A9E9C328B8D48CD16180527E784E0518CD9BA62D589A37EE9CC49DE681BBF1E49CB211230049C9DBC30091217AB85A04D9851267659D18F7DE45E0D985EF6F6B1362A0CF4FFAD97468143168338E360D91E2DF4F2313CDD6C34A49E66047CC484DD04FC11EDA2E6162DB5A057BE8B9C1DBBE53630868EB71B5694CE51B3137700397B55618E30DC947813567882E61BA3C4E3D2040B3DD9916CDEC585A4199F3D19906D170981F25AA0C317F18FC8AD117074494B17D00D8E18037A6F9D50DBB5AA68D01592D576C1AA00CEA300546ABF84EB61810833DCD0DA342942975FBAA5837A3609467DA0418E5B9327B8C4ABEBBAAD1573BF232BB75C693DE7EC5574725001155C6FAD092EF364799B0041653008A5160DDDEE16728101C413D412D58EA617ECA1C1B777ACA2CB1A91F8EF533CD0AD246E1B194D140489E9E20B0A8CA7DFACE404D377466FC85441ABA4303AB613D31448C9C9BB263B3328D274A658E4DA0E9702C99BDA2A3F139773A8A100C1F063EF8E04D28269A15FE0E3EB8EE4C75E6C18DA04D231A5BA649806B17D942852AC730179C33475F443BBE65763087D44EFD1A01E54E633CF7A36A8B6027DDF0A63AB01E1CE887786C6DDFA3C9F17D8087D7FA1038AE28536A240322FB70F512AB1E4D08EA03D34EE077405570323C0A6AA901E800AB7F50943DABACCDB0E706506D0F4600A6768C6CEA671C1EE600C926E68F2564E4C75FFDC3527A389605661BA468E6D0147B313E38C5B1B28227FB7EFB0C00AA5FF4B50FFE5A02D36088A97B2FD87E65EF7E0523475ED06823AA300C8A28046EAA8E2282C381A937702FC65169E0E199FDE1A0E453AD0289DAF19BF72F6A423BD8E34FEDBB6D451A9CE49D1D8CA0868C8020157BEDD48ECD74771F9017A26AA0B52E898CD933EFA2EBE64AA4F16864AAA019FEE438ECE668D744CD5640CB07ADEDB7D65FF210B602DA1E8C301DB56374085B01C8A5D50E2E4A4DCB131C0FF70045D38FD12139EBC392D2C5B970980D639CCAB7E4A75F8BF5EE018A2C4DC6BE8AC190550EF722AE28F12B9CF32E5DCB45EB582D7A6749C8E429341E451011C60FCB4086F1AE96A83079062AA223AD444A2C60A4D738ED410DE3DC290DA43877158898E041646C19EF4703374FF4803210ADC2204884CA05DFF0F1394A814F851DA6810674B40982133C9F3635B039C18748B2D72A0642D51B4472AB44196CEA2D60936D41B7B2DD76235E3F126B225E19DDBA112F4D768CB44B231703690B5A56742ED907AF64C1C4989C1A08294EDC21AACA9B13535B4B7D076C68AD649A48D4C7532091F66CD0628E20D5F44036BC6AB6F20A0631872C46AE6C402E73BB59038DAB4732145B026A88501187CC246759C50114B2BC62279063D67860AD633CA9174C4971D953395C4BE700AA28264DA7B87556D265EC629630C4D8B55FD41AF99E5B7045196103608D5D340E5E8F36C5E360FAA5D712ECC80ECF2E284204C82B632809A147BA60121C9758E548CB235DF888A11824472B0098630869C075431DD480E982426D36101A1E2C5AA77B1035F66EFAC2605B39EA73389254592D98AC5CF319FAA2E6DD1F59162F46015073B4C6E321636F8CC78211D65B74D0B437BC63EA2954FF21D95AEA0B4E3C954DBE6C3BCA597C0DC54DCEBA8B6525BB49E9CF52D8DD15E2A485632CDF37BD6B2CD3A56ABBA4E393DE8D951D0378CBE49D51F576C9CC28C83B53DB39C13FB317A3045F4A35A3EAFEF46694FC68A7CC22BD7320D721A57B20BB12B23B390D73940E810CADAACD3EF1C2F8FFE9E1A27214548D30E02A68EA890529335606E091F016BC7156293CD6747341F65973ECA11DF17130C53842598820D324D3FB4CF51240CA893614A6344F405AAA07C0758E79D1E6EF75FC2B05FCBD8E69483A30CEF2A15399871DFC48B8EEBA7992303D579FBB6998EBE63BE25D85B57972D595C50645D6C17B6158E68EA3D11A9E81B567AE490CD899CD0FC5D2C1E5016C800DF0CFC2529BEB91DE565B3FE32C08412725CDE9B96FAEB4C7E646BEC0E6C2BA0E4906C3DD7923D905B3DC612E063CF34739E78C96AA9ACE28E7971B4FC65850C587BF40E1A3B351154581C24A951732EC058B5EB228EC52076086FCB80C7C9D8195C692D2F50386CC25B959BF31C856A565A4894A970356E83901E054D564EFA731FDE12DFED8F353E18A4A7778AA31F0632856EDF7CC15CD22636103A8E9876691E9CC9B71D61BF0ED04137B4CF2546791E68335DE446BFD9C4363EBD4E41DAFAE823BBC4555C2F18A14A14FDFEC51543E0855679CA3DD2E8C3759FB6595B2B8DAA1800A813F5C2D170FDB28CEDE2CEFF27CF77AB5CA0AD2D9D1360CD2244B6EF3A320D9AED03A59BD78F6ECCFABE7CF57DB92C62AE066A76899D5D49427291123426EF944E58730CDF25394A3AF88BE5B72B2DE4AC540CB2EC5A5745D256FBC250F5C7D475D97A77F572BB8E6611E05BD96A91F483F290C8A2E63E0D64BFA927C7B451665948AEF9EB071A84F9268BF8D2D0254ABE9550FDCB194AA247B1A57FBAFB94CA64D75A0840B9BCAE702A526D599D20B9092F45C9D05A59720A5971D28FD0852FAB103A55720A55710A5E395004511FB2B09FC823412E792D54C632E637D4D36E58DB3C574D37CAB62B538CFDCA6D747146FF6855EC7D26853ED29FD946C3130599964375A647A2AC8B539F614FF7917E6F863B24978724CB23DAD77110A7E956931C92E13A5302FC9C48952A73A08CAD616039299526E27CAB024050BD8D3BF247CA3DA3AD06C21CB9E66B16EF1B4AAA4D9889ED660CB97E45152B4903C9A6F7F9B4B7D615CC293A9921C50B85EA73813267793E83043EE92187FDA6FBFD2C3088ED36CC66C902D58D9F982B79EAC05C64D040E09E8F4C9C72FBB357D8192A7C46538D0C3599086D51BA41C3D36634610634C14FD01ACF5FAE8822ECDD7C3686F675BB2385EA2FC4E20D226DBD33A89E8D907FD9B27C6A6BB52BB0882FD0EC99892735DB491875C543F1EC075DDF7749E08EA8295A32FB06BCD3E2DE06EF87E18C07395D27E020B349F3DBAFAF10BD9E44ADA4799E8B0C548D68FC2EEA248197263379924178D84FD8973C14BAE8B4C37911806E73EB0283DA3A59C29B31277AABB936E18281C1CDDC71DFE6C98B1A675C9CB6E9BEA4609400E93FCDDEA83F40ED91766B4065016E0317C3F0C8A6A3B2F9602EC9BABA3C2C5C2E2379A9A20591A7AA889F7C01FEB28C340A86951739AC208F8B4F06CE1B7D45C96C37A9DA33427E3B793690A59F6343FA0208C0816E439CDE738CCC5106DE2240B85830426D941314FB6DBF28E9353C89B5487F188229C6E42F1EC92499E8D7480CDB7BCDDAE419EC11DAEDAACC80C233DF818B82C1D7D745C0DC5326434470A8E22ADA6D104E710E6251CB1434DE71409CA7491E02825AE43713A33C90E5A59BC96293589B39931AC6DA7DF7515B27AB55E54E18F879913B2FC56C9ED89C648E571D2518A09312E3A0830138561C6A9B0C40016DB36D965D70C916A531D8EE6E2302FFDA7B99E35A90E6DC2F758B888A892EC69FC3D0901B5A94D75E3D079B20E6F43F1E099CF71E1140AF2F01E8B9CAA53A7390EBD0A3731A2134390F96DB2CBA9D06E97A4395EC3873240F6B8D754C50727497C1BA65B7154C53C17DD3FCBBE91FDC74F28BB13D57F36C7C9AA649F526993A3ED4E322D61B386BF5AB3A0A7E0285CC2E16CE85B42361244F6BE8FE99194405DCE7598DB49F06BB2CF8936525C22E58130C1E5EC0EB481368B790E7B9020C059F6814014AF4F927D2C5EF9CBD9F6B4E91A26AF056DEA6CF400D8757A20BDA08C51D55B395090194643A843098BE3E846A568B27CE7C0243BD2FA19457B8858953E577C29FDE2BDE0AB0C53D61B5F0A326AE9448A93B4FB702DAE034296C34A507DF30F2CEC3EB98CA1503C0FACA81C98BD4005722377470A4C65585142EB14A9D469B319CAC1C6AEFFB8B98D595F0B59EF1B9EECEA312B4EFB847631E96E58525ED64899DFD1F1071B3DC4174A99E891EE00D57D3C0C36A9D1669AD00377F138BF4D7751A66500D5694ED702C937F29F742B50A57EB757904A37715FE05405217547AA35A5816E1B3CDC0DF8BFB1F077DB209EB3B99EB1F93B3BFC8C5126AD09559A0B956C1FE52295326D36D3AF71DEF4B616C0CEAA360B81EACBA92F2A7490BDB87D17A6E2D12997E17250F7201ECF3D4C7928E7E390F42CCEF6298A034971E732E6331DDAE810DE26842A1486CD94507F3BD74931250827BCF5457E2F7C51C7BB5EE0BB8194115AD9973492958832D5E52232C232ECDA5437797C425DF321E78E2663786791E9346926168A0B1ACF32FAF7C5EDEF0C7A7443FEF7DDB4E736D6FD411D61CBA7D75318C99FE32C932E419BC4E966C9594654637194AA34172AE5F34B12A126D9AD45649B269D49B3E92EA7056BF1BA21919F852ABEEF39EFFB6D729BC95563E230A6E859F6F617F400825BC87203C03A4C71902BE84AD92EB47F0EF137055D2E0BA47992C4EB90F27751DC57F13C07A99E86F4D886E01691D19A31ECE687372DAF476672E7EDF9C6E35118FB528CFB6869BF1E4638F858373F277BF164A94A72D916DD034D6953DDCE9EB16870D124BA98096DF0452A2D714CB21B2DD9D7007E0676B299C0BC5CE46B3AD0F78EDCA701F8D530F0EF7F267A7D974ACA599D36AE2D2561DB063012D8B841D59712FCFE81864F939601267936C017E2D2F9023FFF4E97FB34307C3FCC84F0E918D57F7279357675BC46191A8C7C9042D515721D93DFF59AB8FE4E7D176C305BA0C118456C289ECE905967054C861CFCD02DD3820E8D533EF56BD538813B8E2D1443503A03000C7BDCC14BB4FED4D12502E0AF2666724716F3143D4040138FB963139D1BD56E88CEB24FFB287AB3BC455126ADA6FA8EF7460F181BB8C3A2557F6AE3850E8C87269A70C7F1E0297A808C263CF1AC2063EAB8193252E85BB148B3DE5529CDEF26F46D1576968B875BB08546B72DD891552170C538B46591E5A2B630AD371B47B4C0D1D5BFA232F04E5BE01CC5E12DCEF2EBE4571CBF59BE78F6FCC572F1360A51560628AE22ECBE169F23B70AB9FBFC250DB98BD7DB95F8B97BE05E4A25CBD6DC746034C6DAF6088A567BFC0F2C81A10649FB10BC26F6CFF14AA4702C2E8AECC7E513B2610CBDE27E16AFF1C39BE57F15DFBD5E9CFDE70DF3E90F8B62C3FB7AF16CF1DFCB05C528F5876870BAD236A1DABF9795C7F7280DEE50FABB2D7AF83D4BAA7838DE40A90D96E78358131AD71FB1173E89BDF449EC479FC45E7520C62ACBDA99A208346B3757BA4C116166144BDDDF30918FF496866C7B729CC6B4142E5AEA0CFFD675CEC30030316B3D516B43D67A20C804ADF5408D095BEB05BB75E45A0FC4E4A0B57E897A957442A85A0F14AB80B5C3090145CCD7A70573C205B33209F2019F3ACEAC0F70B3264FC3015217A0F509956E43C699F694F4E88FBC8833E2D82ACEE07EC8E15744503D58B584093DE06148D950ACDEC8B15158BD2CAF0F5DD6AC194C466B986A229F1E2C5081C8A94C6D532EAD65E8541F8A6E1141D503A11E7B0D0751A80B3C7AB030F3870C2980A99B88103E1F424CC8A7B7073B6C6D30520F23C78423F5A1E6F4524D00844A27C06EC012BF5721AB876CD0C4173D5884D5A14ABDEC559850A58E8A43FB692F2D9EB9C6776C40FD61AFEA8570A83ED6613E18AA078A7C2C541F82A08D86EA43376E02A2FAD889B7215187D318CC0EBD072B1C788F5EB719C57EDB6B52551ECA8EB5D38F7A55DB58CEB8555C7DD6ABEA224A6ACF930326466A4F4A4D8C54273A8E8BAA6CBF7DB093A6A360B597373AD39683E51A13359467DD72718E1E3EE27893DFBD593E7FF6ACC30D953B619BC5A50D0BE0636B5B1AC39694F2307EECB2FD6FC38AF69CF27C809D9EC4DA80A225A1AFA17BCFFC1EE731E6955E8E4AA428A2435D4770907DF1EA8F9D8832B12FBB0F081F49D4CFDD3B1B4774F2AB132D3D2F2C94038676A705440855CF5A2B79244406EDDE34201468F703CE3608A838314CAA59FD6591FCC3E22CFB1287FFDA938C6BC20DAAA3A9679683AACCDA3C765197DBEF0738BE3047023D58EDA1F6C876E379F9552F559D0942EAE562A88D423A9A020944ECB4C3812140277449AC0BC00994871DEDCD68135AA6D3FB5EFCC97DED637BE199F64840EE8A15D991C20E2AAA88094051381CA779CC2713017583DD2A2EBF1A78C8BA0ED70C25BCDF2D0913F0B3BB6623C5F8F4B00274536E684BFC2937F6B6AC8AB89B070B32367CA761302D755F2B60D8D16A02797647AC06AD1C465E994E59AC216215F0F260F132D1D1F42C8EE5273D1FF770C6E5F5F8AE0EEDE9855419DF7338FD1F8C9279B073D0DF3D261B72B3EFED0B0DBB39C3332C7F46CE5CF0CD01B10A87AF7C42EB5C90E174CF87BE93516C8354FA30C868E2547A12624D04BE9E42ACBB21BB8B7AA808DF75B0D898EC1CC2DB29A43F1BC126ACCECC905D0797EC7121D94695EC43A48D26D99D4A194BD2C792CE074B045B6447470A8ED883161710B1331D213A5FAF535B27373F30DCDDC10A377FA2A10AA0E7E5C8ECDE5FB39A387A3E54B436925EF71BCF3A8A9EDB72527E35C01DA214BAEE60A1ECE510A10E84E7DB02A81FA52A26DECC16702632DE70BB0C4D4CB98345EAC446ED5E268A6793ABB1CE1E3B5C8578B87EBB34048E93BF304773B370C2E66B75841AFB713F1F0AA02B6E6D912978187126FC14A32A14411C6E54315DDEC7EBE26A8E8DFA52F585C6783A6252CFF7511ED26693AA890E2A31A925D5C68E604931A93CA96747473235021C9C526984A8356096A72894C33F5EA6611C843B14497D104A5ACA51CADB86A698738A7738A60252EAA54D659AE003B4D686B830234C6CE0828EE9C1C0075018171142F006969E98F55D604317AC62C60069422C0C810EB14B1771793EB128AFA0C984425980E447278AC87D6A60B56121785431E97C4BFEE320F1A4887E315B3055E1F6C61533758C3F965093F65D0816308AE16C4120462AB8D185C76887912FC50EA69033928811C22DF07246CC1C44D868F8360CCEF4312614754A7117A6913C8031CF8DCE2FBE1D6ABE143BCE42CE28C003AD9238D106161804801AFE0D0340CBD78CE57A15AF054F0D3DE0FA50C41D7BF0C480AE4CFE8D224EF1E6D28CE0A67D517A1CD4F106F037858B8618B7911964C139971B5F316F1CD8415E3F9A66550506819D212AFF20D8333A3D29EA55BA2C4C81BAC2A1E5805157FA18699A5515F84E5107B858CD11759736EF9FB09BCBD6FE9FDB5D32C9A3804D7DF80E374B2A35CC1986C23B6218C4595E40282A37DD384C823EE89D0A58C448636D18E1DF140EBBE0615230DA3D4D34EE2A5C34840A67AB45782678849C37356BF0F78541A3E7AAA25AD8FF741ABDAF401D708BFC04BA27D00DB7D9285FD63BD8BDC63C1037D14EC31A71D36E6FA1A3BCF225BF0382DD8CCEF3A6005ED7433DE593A4A3404FE1907C9077182AE76AB65DCA32DFC74D86957FB9A2EA292F33F4303C88FB8CB9A26FAC5B8D5ED09BFE624385C0435B86E707C30916E33E589C763DE6E3DEC1A1099813B62A9F3B4FABD346815B470DC0D79932C49F6120E5BE94337E0A73809222720003A6A60407A736F5B70028984BB38114FBA4C40C40A55F1C3B0E25682DE965C93D54ADBECB0A6A7A747E3CB5AA89687003C4679FB92AD5466310F42726E33B529A14C12714F54D7A66C63893DF001EE5BC8350ED752EBA0835E94E1288F9B27C9BDE8EAA276428BDE8874185D8593BCD6733DDF13DFFF0157DE44B7D78CFBBC772B6D67C8E133E8A07D7586265C22068D038F80E8307F93539453DF203663380C3FC37541D2179781B2A77E44EBDA1E2A174680743D3026B027DC61D60631EFDBC2FDCAA0BBFDE30C62913BCA878FAE714E5E82BCA64B5867E758573DEF36DB978DF78698BAE6857C11DDE2236944BE9ECDD1490D631BE0AC6394EAA84C95355C3143154C4F86C4B153179AA8A9822868A442F60A936B180AA4AB19CB15EC64F14A894C955D7C814325427F8AF49150AF975954572D6D42894327651745103FA291651D42C1734545EAA59528565725DC9F9DBCF4D0D658E81AA7056219117F2A17A8422860AE1A379798283C5A0EAE19256DD2E77B88A3E9799EA0E97F9A6DE8A8BA1DC51B1445DE3FA6BD2F631DB7DC2796991E85865E5E161AAB72AA6AFBC7287716C4165ED6F6A41554CDF82CA35C2B105A51190A90165297DFDA5B59443F5E6AA4DD5DA55C99AE1CB0B19930955C4E61BEA515EAE49952A4B42534A59D8D4ED7AF722F7B9CE81AA6B324DE4DBEB01B982360FACA2CDB69045482186907AB1ACB2CDE3C51CE64183C464EBB1CF963503923B2A02359E2617AA962960AE8BC6A993EB28526BDAE447BBF61639A6B59EDF36C80B3D9F0F414028623D83CDE24353563FBF85E2326B197D1ED05D9918140BA6A4A8C6AA4255F08711A2E64DEAD328D4D21925A74C17DFAA75E415DF2D8B2E2B43FC00FDB60B07E4ADF3B0825F1030A8EC5DD80005B20179608C78E39101D24EA3EABD7AFBE0DE7539EC0AD06D436C166F5D1676C2C597AA2D6E9751D606170187DB3E1C09D71170DB567447BB1513C61FDE86552030ECAB3A20C16C420A41C3D1F05477B9CCF44FBBDBE231A3D1D34A00D9685C5ED955AA194EBC82EEEB14F6911297A02DDA3C5804C7198038631191407F34CBF646CCD3B146B38D84885505BCB3A6DEF1995903B9CD8FC11A6E7F0B11AB0AF4668DCA631BE08D957337BF3A491BC87279526E0D155F2B9457819854CA3F732A87621BE640BEC7AA11973A65E8CACCD8047BB9EA6797CA1D761016698E6EA0B9E59F2DBC2BA659EE28DC36BF5FE6542E83161219F02D1C43208FC516B541BDAD8A03DCB20EC3A089F41C3BFF2B805B1D1CB7BCEBCF86A3CE829AEDB9A56FD6A91469574F238FBAF43CD9A59C8F0E1E31834CC969D9053B62006CB2F0D8804D8C587D063E6DF73161FB77BD3DA637765E653D0F7B19B00C50DD05CC8205CA2962B486F77F64D17D7275931982F5362C277426DE43C906E9D2A616084C466F064856C68A437DACB444964EE5852B9FE65CBE49379CEA63D6F2D88E4697034FC08A163AE53419DBF2C792D08D517926A9BB08E268B0461EC5A7A01147DF0E6BE4BD8541A91779DF9159BDBBAE147646F3C74166BA7F36D44F9A34B6774DDEF1AABC1BAC12C8CF3C49C97C3A4FD638CA8AD4E3D5E77D4C9FFC297F9DE22CDCB4248E09CD1817469A2DD1BACC597C9BD43687428BEA22D27353395AA31CBD4D895043414EB2039C6561BC592E7E46D1BEB82DF88AD767F1C53EDFED73D265BCFD1A3DB2CCA0A68BBAFA8F57529B8F2F8A77A9321F5D20CD0CE92B4917F1BB7D18AD9B767F009E9A5190A03691D5F351742C73FA8CD4E6B1A1F42911F53D15A18A7D8D29677D11925DC457E81E77691B81EF47BC41C12349BF0F8BB7ED5444CC03C1B3FDF834449B146DB38A46FB3DF94930BCDE3EFCE5FF01069344803CDE0100, N'6.1.3-40302')
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'202106261426597_allowHtml2', N'MyHealthCare.Migrations.Configuration', 0x1F8B0800000000000400ED5D5B6FDC3A927E5F60FF43A39F661667DCB99C0C66026706899DCCF14C1C1BB17366DF0C464DB7758E5AEA91D48E8DC5FEB27DD89FB47F61495D7929DE24EAD2394680C04D5245B2F8B15824AB8AFFF73FFF7BFCD7876DB4B8C7691626F19BE5F3A367CB058E83641DC69B37CB7D7EFB873F2DFFFA977FFFB7E3F7EBEDC3E2E7BADC4B5A8E7C19676F967779BE7BBD5A65C11DDEA2EC681B06699225B7F951906C57689DAC5E3C7BF6E7D5F3E72B4C482C09ADC5E2F8F33ECEC32D2E7E909F27491CE05DBE47D179B2C65156A5939CAB82EAE213DAE26C8702FC6679FEF81346517E7782527C7416DFA628CBD37D90EF53BC5CBC8D42449A7485A3DBE502C57192A39C34F8F5970C5FE569126FAE76240145D78F3B4CCADDA228C355475EB7C56DFBF4EC05EDD3AAFDB02615ECB33CD93A127CFEB262D24AFCBC13AB970D13091BDF1376E78FB4D7052BDF2CDF7E4DF6F9976CB910EB7A7D12A5B49CC0E8725C8E0A3A21CE8EAAEF7F58B0A57E6800427044FFFDB038D9477464DEC4789FA728FA6171B9FF1A85C13FF0E375F22B8EDFC4FB28625B4ADA4AF2B804927499263B9CE68F9FF16DD5FECB24CD6F93284CCED6CBC58A27B0122934DF431F979D3D8BF3972F968B4FA439E86B841B68ACB484AEC33CC2350902303269968B73F4F011C79BFC8EB0103D2C171FC207BCAE532AB25FE290CC31F21181AEB196ABFDD77C9C8A704021F07CAC8A5E8C55D1CBB12AFA71AC8A5EF9AFE813BA0F37850C504D97E5E2338E8A12D95DB82BC56C2D096E98521FD264FB39895A31D366DE5C25FB34A0504E5425AE51BAC139DFBCE3552BC1B4728D694547C9D650984CB67511696649C630E22A4F52FC371CE314E5787D89F21CA731A5810B769A20F811C59B3DDA0C2F8F7E4AB6781C114B6B2262769CCAFE7917E6F863B24906AFE95D84825F47A9E90AA7F76180B3C12BBAC619D11C93982A71A38C1653E1680BF125193632C1B2717A5888E011D79346F7ECBF9AD46B857A35A9D71BDBC691AD488E0255F39A5CB88140B6D444A88C6B23AF71BACD2E6EAB4907B6942F02375755466AB3B2A07BC39BC904339829A06A3350006830540A6AADB566C100A3A366D15078DA357D4FBBA6F75B1446C30BE9F53AC5D9F0EBEBE55D12E34FFBED579CCE668BD141EA8ADB0C9D64EE240E4411DC5126F0649E04C308F3F5946C7ABEECD674EB53D74593AEC32D766EF129CE8234DC95877433992DBD567E71DE1855848E93A7599E5D670EF3E9D3065D55D7966C1EC8577783CFA59328244DA27F8F54D54510EC776898F926E9AA0F03EC8ABCC9CECED2A193822DCB059D1ADE4928147AD435DEEE489BBB2FA81C952709A1A88BE312ADF410166EA2D1FF8283E1E7E4BB64FD387825C31DA22A05C3CF280DE9A0AA76DE251AEA5237C27C642584AE24B017D716EFB5291769F7D0C379424F9263D2A9CE41C4DFD228407AC859202F985693A6D32CF85BE2A047F3261347F4DB27B02BEAA2CC1945B9A5158DB4FB1D6CC76A0DD773BC0E03147DC64192AEBBE29623F20460455D358F073F347CCCC2204471DF1320D241BACBEB4BE6ED7A1B661401A785D01E5A2FCD519A9381DA8D52DB0714841119FA51E4D2698836719285C39F3B9F24DB2D19F9E12B7A1B4538DD84435C55AB6F3C091EE330237317AF4BC155A81DF00DA858368CF18D2032992B516369F98ED4FC89EBB5DEA72487A8C21D541456F7D1EA03A99B765FB9F6B4125060C778CA4DC9B62360014953844B410AA2B6A1B548B6696A5B56D9D8BA88A9B94D39D70613297A7B6BD1D8AA9CAAA145B6A19165995E2A3704ADAEAA0C44EB49A351D4D58ACFBE4AC2394AFB922880D497C8296A4E9B3ADF43152A48F9654F4AEFE375373ACA892DC8F531963CC9C8D47EF970EB55B98D72EB52F98D557F685197CE14E5FD095EB02649FEAA4BD935DD83346619DB673B49CB3F495E455D036C38EC97DBDD2EAAC6E74B462D533AAEB43C99A7A156D4F5214C33D3ADEEF367CFACC6DB71FDF988BCD56CB8248FC3BC34431CFAA607DFE3C63EECDD63EECE93BF27217792D17971A7CC3D4FD6E16DE8C1F6E52C46411EDE37AD7A9710194FF710AE7446B356B80A37312A1D0507BFAADCED92944CBDD17C254C56882F5EFDD1572D27497C1BA6DB16425D47FE1265D937A27CFD84B211061F07FB94C83EA26E6C77876D46A9AECBDBD05C7F4B3E90E99DA4EF63FA556F7A1F93E0D7649F93DD45617E9707B2F8B124E0A5396F830067D9070266BC3E49F671DE6F0B479509C3A2653BFF3A6FB34E22146E15478ABCDA735317657478B084ACBFC3C55C771C1F934DA83AFD146AA88BAA9B5A963036B52AE6DA544ACCAEA5554975438B02C67696A5FA9D4DF1248B41F2A43117B49ED4668D18E87B1A547098B5C81AD0A092D4F4338AF673D9D51553D413500B5A9301B5A89D24DF876BBAFEAFCC5FD4850979ABF235D45CA783D032F51EEBC59F86D8DD71DD1CBB72F7E9D915C954887B02322535198E61948145693BBB00D287CCACEBF66324560E9E79C5A7E56ECAC2CA45BF29635AF7DB82BE967E4F189C147F735FF0FD9EA764578F597142DE777743C76C50CF24B793E1C1B73E9738ADEC7D6055BDCD97B574314FB223900AB89A0CD0E96DDC421453BF2A094A93B6804E9430A5FA8551693ADD5584B4149EA487A22EEA939A26D41CC9C30C753E00F124195CEB8DA2E41BF9AFAF88B3136FAFFC5C5174381D701239E28456CAA44E73596108D575622BC83DCD72455D1ECC4CFCD9BC783258F1701535DAF5DB678CB21174A0CF3823001FD1A6D46C563390A1A528ADDCCC333DD9D7E82B154D6CCCA51D7BE5D9D0465599646BA32D68DD070F16378D756B47EDB0FCFC69D150D4358E713F69DAC5EDBB306DAFDEBB1B20E287EFEA4E759CA03E6771B64F511C30A757639FC133B6DF1DA7724DE069324F39990F7D7238D97AA2CE7EDEC5D74F4855D45570E74B3ABCE0FB104678B435EE24C57E823D750E1CE5B2570F6F5D4D99458CB3449EA0AEA8CBC7BDD328D7F4E3B8859FE32C1BC34CD1E77C3CCBC8DEBEB729D859768A239CF7B729A3CD219B2DE65EBD2BA513C2CE114F124A8B7A785BDA08929BB214B715E533A1EDA750A2EF396643AE81AB071159D1F2232917EF5086AB911359B834C0E7ED2FE84198877DB0B80E531CE4DE08FE1CE26F9D883945D825C2FBB2CFC032349E963E455DE3AC289F93FD08D11088501BA73B15B086DFC711E45EA4CC22D23590C6463689B17772DFC01630CCECBA290BF15178D93C30042F57C0D9A59D86C4EFDF2E28203BD8F04E42EC63B2E92CBCC8B74F424B5197974BA7EBBB94D118C7F1F81AAE9664B319E1B067AC9DC1FB07FA049C7F7325FB5882745B4263D05C46DD4F4339224F93595197A7304F5E64C2884E813E2EDF0BD7DCABBBF036EFABD25FE12089D75E485DDF85A91F4A1F5080AFA9EB59EF1DCBC7A43E461B5A70DDDEE2C211361EE37D06821A9CDED3693642D79AD70D463B8BA0811015F16959C97A539563C271CAD9720C4EA08CBB12AA0E00C5D307024081050CCDEC1A004A6D6DC0D3976C0C806C4313DDED09DE6659128445C398FD95F8C607DFD3F7F17A61F1E0477BF6C2BCD8734E16DA905AC992B6BC593E3B3A7A2E31524FBED934B4E499E8E93C7999365999714AE72CA2CED3445B40619CCBCB781807E10E45E666089F5AEA0074389A4AC49C53BCC3315DBECD3CB6A95DF3A0086D46539BA0A4981875BC6290A30794F2190CD5B09BDFC468C75E7CFDC5095FE667B7C60399A92D2320CDC4F743811BF4AE821A02DA471658A0312FA5F008F80F2DC4B4AFA459E14BE4E2455C5E942C4ADB7122225016A0B5BCB81399BFF6024D4D1F46C1A5668C0E0394F26B8A2AC0681EEA6DC1D23CDCE824EE34AF368E27E7948D1801484ADE1E06880C21F1D522C82E3E3E2BEBC4C71C5C049EDD9B146D6D4260FFF9493F9B0E8D22066DC6D1A621D2A30ED3C844B349BC52923918C733521374BEB187B64BECE3B656C1C87F6EF0B6EFD41802DA7A5C6D1A5339FCCC0DDC80058215C678EF885160CD795748982E4FBE0E08D06C77A645333B965650E61CCFA641341CBB4A892A43202B06BF6248D10111656C1F0076388A93697E75C3AE9669634056CB159B062823954C81D12A68992D06C4086673C3A8103A4DDDBE2A80D32818E59936014679AECC1EA39243BA6AF4D5DEE9CC6E9D090F61BFE2AB436D80882A03D868C9779BA34CAC0D8B290005DEB06EEFF0331488F8A19EA0162CF5303F658E8D3B3D6596D8D40F07B09A660569434B59CA6820CE544F105854E53E7D67A0A61B3A33FE42220DDDA181D5B09E18C2A0CE4DD9B15999C613A532C726D0743896CC5ED1D10452703A8A100C1F063EF8E04D28269A15FE0E3EB8EE4C75E6C18DA04D231A03BD49806B17AE45852AC7D82D9C87525F443B3ED0773087D44EFD1A01E54E633CF7A36A8B083EDDF0A63AB01E1CE887786C6DDFA3C9F17D8087D7FAB84EAE28536A240322FB70F512AB1E4D08EA03D34EE0C76D557032BC746BA901E800AB7F25973DABACCDB0E706506D0F4600A6768C6CEA67BC78E600C92690952564E4178DFDC3527A0D9905661B796BE6D0147B313E38C5B1B28267FDD14C00AA5FF4B5AF585B02D36088A97B04DB7E65EF7E05238713D16823AAD8228AD01A6EAA8E222CC981A937702FC65169E0E199FDE1A01428400512753403DEBFA88957628F3F7540022BD2E024EFEC600435640404A9D86BA7766CA6BBFB80BC105503AD754964CC9E79BF733757228D47235305CDF027C7613747BB266AB6025A3E686DBFB5FE9287B015D0F66084E9A81DA343D80A402EAD7670516A5A9EE078B807289A7E8C0EC9591F96942ECE85C36C18E354BE253FFD5AAC770F50B87432F6556091ACF295177145895FE19C77E95A2E5AC76AD13B4B42264FA1F1288288307E5806328C77B54485C93350111D692552620123BDC6690F6A18E74E6920C5B9AB40C4040F2263CB783F1AB879A20794816815064122542EF8868FCF510A7C2AEC300D34A0A34D109CE0F9B4A981CD093E4492BD563110AA1ED6925B25CA60536F019B6C0BBA95EDB61BF1FAE56313F1CAE8D68D7869B263A45D1AB918485BD0B2A273C9BEE2260B26C6E4D4404871E20E5155DE9C98DA5AEA3B60436B25D344A23E9E0289B46783167304A9A607B2E155B3955730883964317265037299DBCD1A685C3D92A1D8125043848AE07A2639CB2A0EA090E5153B811CB3C6036B1DE349BD604A8ACB9ECAE15A3A07504531693AC5ADB3922E6317B38421C6AEFDA2D6C8F7DC822BCA081B006BECA271F07AB4291E07D32FBD966047767876411122405E194349083DD20593E0B8C42A475A1EE9C2470CC520395A01C01C434803AE1BEAA0064C17146AB381D0F060D13ADD83A8B177D31706DBCA519FC391A4CA6AC164E59ACFD01735EFFEC8B278060D809AA3351E0F197B633C168CB0DEA283A6BDE11D534FA1FA0FC9D6525F70E2A96CF265DB51CEE26B286E72D65D2C2BD94D4A7F96C2EEAE10272D1C63F9BEE95D63992E55DB251D9FF46EACEC18C05B26EF8CAAB74B664641DE99DACE09FE99BD1825F852AA1955F7A737A324C73F80457AE740AE434AF74076256477721AE6281D02195A559B7DE285F1FFD3C345E528A81A61C055D0D4130B5266AC0CC023DE0BCD3CAB141E6BBAB920FBAC39F6D08EF83898621CA12C44906992E97DA67A0920E5441B0A539A774D2DD503E03AC7BC68F3F73AFE9502FE5EC734241D1867F97AAFCCC30E7E245C77DD3C49989EABCFDD34CC75F31DF1AEC2DABC23ECCA628322EBE0BD302C73C7D1680D6F1BDB33D72406ECCCE68762E9E0F20036C006F86761A9CDF5486FABAD9F711684A09392E6F4DC3757DA6373235F6073615D872483E1EEBC91EC8259EE3017039EF9A39C73464B554D6794F3CB8D27632CA8E26B76A0F0D1D9A88AA24061A5CA0B19F682452F591476A90330437E3109BECEC04A6349E9FA0143E692DCACDF1864ABD232D244A5CB012BF49C0070AA6AB2F7D398FEF0167FECF9A97045A53B3CD518F83114ABF67BE68A6691B1B001D4F443B3C874E6CD38EB0DF87682893D2679AAB348F3C11A6FA2B57ECEA1B1756AF28E5757C11DDEA22AE178458AD0F79CF6282A5F39AB33CED16E17C69BACFDB24A595CED504085C01FAE968B876D14676F967779BE7BBD5A6505E9EC681B06699225B7F951906C57689DAC5E3C7BF6E7D5F3E7AB6D49631570B353B4CC6A6ACA9394881121B77C77B5785FE714E5E82BA2CF989CACB75231D0B24B71295D57C91B6FC90357DF51D7E5E9DFD50AAE796D4A41AF65EA07D24F0A83A2CB18B8F592BE24DF5E914519A5E2BB276C1CEA9324DA6F638B00D56A7AD5AB8D2CA52AC99EC6D5FE6B2E9369531D28E1C2A6F2B940A94975A6F402A424BDC16841E92548E965074A3F82947EEC40E91548E91544E978254051C4FE4A02BF208DC4B96435D398CB585F934D79E36C31DD34DFAA582DCE33B7E9F511C59B7DA1D7B134DA547B4A3F255B0C4C5626D98D16999E0A726D8E3DC57FDE8539FE986C129E1C936C4FEB5D84825F655A4CB2CB4429CC4B3271A2D4A90E82B2B5C58064A694DB89322C49C102F6F42F09DFA8B60E345BC8B2A759AC5B3CAD2A6936A2A735D8F2257994142D248FE6DBDFE6525F1897F064AA240714AED769F1D81F87C33AD16186DC2531FEB4DF7EA587111CA7D98CD9205BB0B2F3056F3D590B8C9B081C12D0E93BA65F766BFAAC2A4F89CB70A087B3200DAB8775397A6CC68C20C69828FA0358EBF5D1055D9AAF87D1DECEB66471BC44F99D40A44DB6A77512D1B30FFA374F8C4D77A5761104FB1D923125E7BA68230FB9A87E3C80EBBAEFE93C11D4052B475F60D79A7D5AC0DDF0FD3080E72AA5FD0416683E7B74F5E317B2C995B48F32D1618B91AC1F85DD459132E4C66E32492E1A09FB13E782975C17996E22310CCE7D60517A464B39536625EE547727DD30503838BA8F3BFCD930634DEB9297DD36D58D12801C26F9BBD507E91DB22FCC680DA02CC063F87E1814D5765E2C05D8375747858B85C56F343541B234F45013EF813FD651868150D3A2E6348511F069E1D9C26FA9B92C87F53A47694EC66F27D314B2EC697E404118112CC8739ACF71988B21DAC449160A07094CB283629E6CB7E51D27A79037A90EE3114538DD84E2D925933C1BE9009B6F79BB5D833C833B5CB5599119467AF03170593AFAE8B81A8A65C8688E141C455A4DA309CE21CC4B3862879ACE291294E922C1514A5C87E27466921DB4B2782D536A1267336358DB4EBFEB2A64F56ABDA8C21F0F332764F9AD92DB138D91CAE3A4A31413625C741060260AC38C536189012CB66DB2CBAE1922D5A63A1CCDC5615EFA4F733D6B521DDA84EFB170115125D9D3F87B12026A539BEAC6A1F3641DDE86E2C1339FE3C22914E4E13D163955A74E731C7A156E6244278620F3DB649753A1DD2E4973BC860F6580EC71AFA98A0F4E92F8364CB7E2A88A792EBA7F967D23FB8F9F507627AAFF6C8E9355C93EA5D22647DB9D645AC2660D7FB566414FC151B884C3D9D0B7846C2488EC7D1FD3232981BA9CEB30B793E0D7649F136DA4B844CA036182CBD91D68036D16F31CF6204180B3EC0381285E9F24FB58BCF297B3ED69D3354C5E0BDAD4D9E801B0EBF4407A4119A3AAB772A020338C8650871216C7D18D4AD164F9CE814976A4F5338AF610B12A7DAEF852FAC57BC15719A6AC37BE1464D4D289142769F7E15A5C07842C8795A0FAE61F58D87D721943A1781E585139307B810AE446EE8E1498CAB0A284D62952A9D3663394838D5DFF71731BB3BE16B2DE373CD9D563569CF609ED62D2DDB0A4BCAC9132BFA3E30F367A882F9432D123DD01AAFB78186C52A3CD34A107EEE2717E9BEEA24CCB00AAD39CAE05926FE43FE956A04AFD6EAF20956EE2BEC0A90A42EA8E546B4A03DD3678B81BF07F63E1EFB6413C67733D63F37776F819A34C5A13AA34172AD93ECA452A65DA6CA65FE3BCE96D2D809D556D1602D597535F54E8207B71FB2E4CC5A3532EC3E5A0EE413C9E7B98F250CEC721E9599CED53140792E2CE65CC673AB4D121BC4D0855280C9B29A1FE76AE93624A104E78EB8BFC5EF8A28E77BDC077032923B4B22F69242B1165AACB45648465D8B5A96EF2F884BAE643CE1D4DC6F0CE22D369D24C2C1417349E65F4EF8BDBDF19F4E886FCEFBB69CF6DACFB833AC2964FAFA730923FC759265D823689D3CD92B38CA8C6E22855692E54CAE79724424DB25B8BC8364D3A9366D35D4E0BD6E27543223F0B557CDF73DEF7DBE43693ABC6C4614CD1B3ECED2FE80104B790E506807598E22057D095B25D68FF1CE26F0ABA5C1648F32489D721E5EFA2B8AFE2790E523D0DE9B10DC12D22A33563D8CD0F6F5A5E8FCCE4CEDBF38DC7A330F6A518F7D1D27E3D8C70F0B16E7E4EF6E2C95295E4B22DBA079AD2A6BA9D3D63D1E0A249743113DAE08B545AE29864375AB2AF01FC0CEC64338179B9C8D774A0EF1DB94F03F0AB61E0DFFF4CF4FA2E9594B33A6D5C5B4AC2B60D6024B07183AA2F25F8FD030D9F262D034CF26C802FC4A5F3057EFE9D2EF76960F87E9809E1D331AAFFE4F26AECEAE91AA5B0DFBEBA0B6F8525864D77321D253A14408ECB701147610A9163D39D5CC6F035B5DB941DC69A7427534B40316C531D84CBED2D2EACB063298A8D90E5728E9EE3947C26B790CF7119DBEA35377E5C154FBC0D2FFEF8B0982AA385FA150857C384FA3BB5F581C1508686FF14A591E2B116997556A29021073FADCCB4A043E3948F4B5B354EE08E630BC5A0A7CE0000036D77F04BAE3F7574C201F8AB89D2DD91C53C450F10D04400EFD844E746B55BF0B3ECD33E8ADE2C6F519449FA9BBEE3BDD10346A3EEA026D59FDAC43D00C64313BFBAE378F0143D404613107B56903175DC0C1929D8B258A459EFAA94E677136CB90A74CC45602ED842E32917ECC8AAA0CB62E4E3B2C87251DB34D7DBDB235AE0E8EA5F5119EAA92D708EE2F01667F975F22B8EDF2C5F3C7BFE62B9781B85282B436257319D5F07FB2C4FB6288E93BC0A986D11E4F9F94B1AE419AFB72BF173F750D1944A96ADB9E9C0EC516A6B37283EF2F13FB004861A249FF16DBDAEA9A34D1DAF440AC7E2A2C87E5C3E5A1C52368BFD7E7D16AFF1C39BE57F15DFBD5E9CFDE70DF3E90F8BE288E5F5E2D9E2BF970B8A51EA81D3E074A56D42756254561EDFA334B843E9EFB6E8E1F72C29227F8C94DAF08C3E8835C198FD117BE193D84B9FC47EF449EC550762ACB2AC9D298AD0C67673A5CB14116646B1D4FD8D6C57527A2F4836DA64B311D352B868A933FC5B674D0F03C04449F644AD0D92EC81201326D903352650B217ECD6B1923D1093C324FB25EA55D209C1913D50AC42240F27041451869F16CC0917CCCA08CD077CEAC8C63EC0CD1AD90D07485D48E02754BA0D19674C56D2A33FF222B28D63AB38178F21875F11B3F760D51226D88587216583FF7A23C7C6FDF5B2BC3E7459B3663019AD61AA89B57BB0400562F532B54DB9B496C17A7D28BA45CC5E0F847AEC351C44A12ED4EDC1C2CC1F32A490B96E2242F87C0831219FDE1EECB0B5E16F3D8C1C1300D7879AD34B3501102A9D00BB014BFC5E85AC1EB24113D1F660115607C7F5B2576182E33A2A0EEDA7BDB478C670C4B101F587BDAA1702F0FA5887F9F0BB1E28F2D1777D088236FEAE0FDDB809C1EB6327DE06E11D4E6330BB901FAC70E07DC8DD6614FB6DAF4955F9C43BD64E3FEA556D63ABE55671F559AFAA8BB8BC3D4F0E98A8BC3D293551799DE8382EAAB2C7C0C14E9A8E82D55EDEE84C5B0E966B4C9C5A9E75CBC5397AF888E34D7EF766F9FCD9B30E3754EE846D16973610858FAD6D697E5D52CAC3F8B1CBF6BF0D64DB73CAF3219D7A126B43D89684BE86EE3DF37B9CC718F47A392A91E2D60E751DC141F6C5AB3F7622CA445BED3E207CEC5A3F77EF6CE4DAC9AF4EB4F4BCB0500E51DB9D161093563D6BADE491108BB67BD380E0B3DD0F38DBB0B3E2C430A966F59745F20F8BB3EC4B1CFE6B4F32AE0937A88EA69E590EAA326BF3D8455D6EBF1FE0F8C21C7BF660B5873A06801BCFCBAF7AA9EA4CD85B2F17436DDCDBD114482046AC1D0E0C2161A14B625DC857A03C1CDAC18C36A1653ABDEFC59FDCD73EB6179E698F04E4AE58911D29ECA0A28AD101148503C09AC77C32115037D8ADE2F2AB8187ACEB70CD50C2FBDD92302166BB6B365254590F2B4037E586B6C49F72636FCBAA88F47AB0206303C61A06D352F7B502861DAD26746C77C46AD0CA61E495E994C51A225621560F162F131D4DCFE2587ED2F3710F675C5E8FEFEA60B25E4895116587D3FFC1B8AC073B07FDDD63B2415EFBDEBED040AF333CC3F267E4CC857B1D10AB70C0D427B4CE05194EF77CE83B19C5362CAA0F838C2632AA2721D6C47CEC29C4BA1BB2BBA8878A8071078B8DC9CE21BC9D42FAB3116C0239CD0CD97538D31E17926D1CD33E44DAF8A5DDA994D14B7D2CE97C784EB0457674A4709C3D687121383BD311E241F63AB57572F303032C1EAC70F3271AAA908D5E8ECCEEFD35AB89DCE843456B633776BFF1ACE336BA2D27E55703DC214AC1120F16CA5E0E11EAD08BBE2D80FA51AAA230CE6C016762310EB7CBD044313C58A44E6CD4EE65A27836B99AEEEC918DBBD85D67E3C22DF6302162C22C76A7C28657EC6582E4CF995508ABE8E5BC8A8DAAE8C560AD8AAC38E0E1975D2C434B077D433442F90B7388400BCF7EBE5647F9C57EDCCF3107E88A5B5B640A1EEEEE9998668CFE594406B951050A7A1FAF8BFB5E369450D5171A38EC88493DDF4779489B4DAA261B1B89492DA93620094B8A49E5493D3B3A92A911E0E0944E30444D4CB33C45A11C53F4320DE320DCA148EA8350D27271A6BC6D688A39A7788763BAEA4ABDB4A94C13D182D6DA10176684890D5C243B3D18F8A81CE322428808C2D213B3BE0B6CE822A0CC18204DDC8E21D02176E9222E0FBD16A55D039950280B90FC764E110E520DAC36D6088F2A269D6FC97F1C249E142155660BA62A86E3B862A60E1CC9126AD2BE0BC10286C69C2D08C4F01737BA982BED30F2A5D8C11472461231420C0F5ECE889983081B0DDF86C1993E7089A24E2998C7349207B010BBD1055B68879A2FC58EB390330AF04053374EB481050601A0867FC300D0F25176B95EC5A3E753430FB8931671C71E2630A02B937FA388533C1D3723B871D693D3A08EF7AAB829FC7EC460A0CC200B1EDFDCF88A79E3C00E7225D334AB2A3008EC0C4F3D0C823DA3279DA25EA51FCC14A82BBCA40E1875A5E39AA6595581EF147580DFDE1C517769F3A80EBBB96C9D4AB8DD25933C0AD8D487EF70B3A452C39C61285C6E86419CE50584A272D38DC324E8831E3F81458C34D68611FE4DE1B00B1E2605A3DD7B57E3AEC24543A870B65A84678247C82358B3067F5F1834BA432BAA859D9AA7D1FB0AD401B7C84FA07B02DD709B8DF2B9C683DD6BCC037113ED34AC1137EDF6163ACA2B9F873C20D8CDE83C6F0AE0753DD453BEAC3C0AF4145EEE077987A1F2D867DBA52CF37DDC6458052D50543DE565861E8607719F3157F48D75ABD10B7AD35F6CA8107868CBF0FC6038C162DC078BD3AEC77C304538DE0573C256E573E76975DA2870EBA801F83A5386F8330CA4DC9772C6F9650E505284A360C0D494E0E0D4A6FE1600057369369062DF299901A8F48B63C7A104AD25BD2CB987AAD5775941E5A8BE53A9554D988C1B20E8FFCC55A936C487A03F3119DF91D2A48868A2A86FD233332642C10D10A6807710AA4319882E424DBA930462BEA4946CA97A42863234C330A8103B6BA7F96CA63BBEE75F53A32FC7A90FEF799F6BCED69ACF71C247F18A1F4BAC4C18040D1AAFF161F0203F51A8A8477E156F067098FF86AA23240F6F43E58EDCA937543C940EED60685A604DA0CFB8036CCCA39FF7855B75E1D71BC63865226215711A4E518EBEA24C566BE8575738E73DDF968BF78D97B6E88A7615DCE12D62E30395CEDE4D01691DE3AB609CE3A44A983C55354C1143458CCFB6541193A7AA882962A848F402966A130BA8AA14CB19EB65FC44814A995C758D4C21437582FF9A54A1905F575924674D8D42296317451735A09F621145CD724143E5A59A25555826D7959CBFFDDCD450E618A80A67151279211FAA472862A8103E9A972738580CAA1E2E69D5ED7287ABE87399A9EE70996FEAADB818CA1D154BD435AEBF266D1FB3DD279C9716898E55561E1EA67AAB62FACA2B7718C71654D6FEA61654C5F42DA85C231C5B501A01991A5096D2D75F5A4B39546FAEDA54AD5D95AC19BEBC90319950456CBEA11EE5E59A54A9B22434A594854DDDAE772F729FEB1CA8BA26D344BEBD1E902B68F3C02ADA6C0B5984146208A917CB2ADB3C5ECC611E34484CB61EFB6C593320B9A32250E36972A16A9902E6BA68F043B98E22B5A64D7EB46B6F91635AEBF96D83BCD0F3F910048422D633D82C3E3465F5F35B282EB396D1E701DD958941B1604A8A6AAC2A54057F18216ADEA43E8D422D9D5172CA74F1AD5A475EF1DDB2E8B232C40FD06FBB7040DE3A0F2BF8050183CADE850D50201B9007C688371E1920ED34AADEABB70FEE5D97C3AE00DD36C466F1D66561275C7CA9DAE27619656D701170B8EDC391701D01B76D4577B45B3161FCE16D580502C3BEAA0312CC26A410341C0D4F7597CB4CFFB4BB2D1E331A3DAD04908DC6E5955DA59AE1C42BE8BE4E611F297109DAA2CD8345709C018833161109F447B36C6FC43C1D6B34DB48885855C03B6BEA1D9F993590DBFC18ACE1F6B710B1AA406FD6A83CB601DE583977F3AB93B4812C9727E5D650F1B54279158849A5FC33A77228B6610EE47BAC1A71A95386AECC8C4DB097AB7E76A9DC61076191E6E8069A5BFED9C2BB629AE58EC26DF3FB654EE53268219101DFC23104F2586C511BD4DBAA38C02DEB300C9A48CFB1F3BF02B8D5C171CBBBFE6C38EA2CA8D99E5BFA669D4A9176F534F2A84BCF935DCAF9E8E01133C8949C965DB02306C0260B8F0DD8C488D567E0D3761F13B67FD7DB637A63E755D6F3B09701CB00D55DC02C58A09C22466B78FF4716DD2757379921586FC3724267E23D946C902E6D6A81C064F466806465AC38D4C74A4B64E9545EB8F269CEE59B74C3A93E662D8FED687439F004AC68A1534E93B12D7F2C09DD18956792BA8B208E066BE4517C0A1A71F4EDB046DE5B18947A91F71D99D5BBEB4A6167347F1C64A6FB6743FDA449637BD7E41DAFCABBC12A81FCCC9394CCA7F3648DA3AC483D5E7DDEC7F41DA9F2D729CEC24D4BE298D08C7161A4D912ADCB9CC5B7496D7328B4A82E22BD6196A335CAD1DB94083514E4243BC05916C69BE5E26714ED8BDB82AF787D165FECF3DD3E275DC6DBAFD123CB0C6ABAA8ABFF7825B5F9F8A278EC2CF3D105D2CC903EBD7511BFDB87D1BA69F707E0A91905096A1359BD4946C732A76F936D1E1B4A9F1251DF5311AAD8D79872D61721D9457C85EE7197B611F87EC41B143C92F4FBB078305145C43C103CDB8F4F43B449D136AB68B4DF939F04C3EBEDC35FFE1FFDF92C96D8E50100, N'6.1.3-40302')
GO
SET IDENTITY_INSERT [dbo].[AspNetRoles] ON 
GO
INSERT [dbo].[AspNetRoles] ([Id], [LastModified], [IsSysAdmin], [RoleDescription], [Name]) VALUES (1, CAST(N'2021-03-03T17:38:32.607' AS DateTime), 1, N'System Administrator', N'SuperAdmin')
GO
INSERT [dbo].[AspNetRoles] ([Id], [LastModified], [IsSysAdmin], [RoleDescription], [Name]) VALUES (2, CAST(N'2021-02-27T21:29:37.777' AS DateTime), 0, N'Administrator', N'Admin')
GO
INSERT [dbo].[AspNetRoles] ([Id], [LastModified], [IsSysAdmin], [RoleDescription], [Name]) VALUES (3, CAST(N'2021-02-27T21:29:37.780' AS DateTime), 0, N'User', N'User')
GO
INSERT [dbo].[AspNetRoles] ([Id], [LastModified], [IsSysAdmin], [RoleDescription], [Name]) VALUES (4, CAST(N'2021-06-20T23:41:09.950' AS DateTime), 0, N'Staff', N'Staff')
GO
SET IDENTITY_INSERT [dbo].[AspNetRoles] OFF
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (3, 1)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (4, 1)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (5, 4)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (6, 4)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (7, 4)
GO
SET IDENTITY_INSERT [dbo].[AspNetUsers] ON 
GO
INSERT [dbo].[AspNetUsers] ([Id], [FirstName], [LastName], [Level], [JoinDate], [LastModified], [Inactive], [ImagePath], [SupportedLanguage], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Initials], [Signature], [MedicalRecord_Id]) VALUES (3, N'Zawar', N'', 1, CAST(N'2018-03-01T20:24:09.570' AS DateTime), CAST(N'2021-03-01T20:24:09.570' AS DateTime), 0, NULL, NULL, N'zetawars@hotmail.com', 1, N'AI80cYItZ970QgBTYaBAcaJpcLNAh+svFRDfoWfJIlLEbTYjucsd8Qg/NB/UNBUJzA==', N'9a42f78f-95c9-49a1-85ab-9d78f9805cf4', NULL, 0, 0, NULL, 0, 0, N'zetawars', N'Z', NULL, NULL)
GO
INSERT [dbo].[AspNetUsers] ([Id], [FirstName], [LastName], [Level], [JoinDate], [LastModified], [Inactive], [ImagePath], [SupportedLanguage], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Initials], [Signature], [MedicalRecord_Id]) VALUES (4, N'Jacuquiline', N'Jacuquiline', 0, CAST(N'2021-03-06T17:52:11.837' AS DateTime), CAST(N'2021-03-06T17:52:12.157' AS DateTime), 0, NULL, N'en-GB', N'jacqui1718@yahoo.com', 1, N'APpnUPoksciaTSAJ64e674J7MkGVZGbWhDThsvQnShnHJ5LyMUYuFw7C5wba4AkSng==', N'f7551455-c13b-40af-8770-befaa7e2ce02', NULL, 0, 0, NULL, 0, 0, N'jacqui1718@yahoo.com', N'JJ', NULL, NULL)
GO
INSERT [dbo].[AspNetUsers] ([Id], [FirstName], [LastName], [Level], [JoinDate], [LastModified], [Inactive], [ImagePath], [SupportedLanguage], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Initials], [Signature], [MedicalRecord_Id]) VALUES (5, N'Staff', N'Staff', 0, CAST(N'2021-06-20T23:47:03.967' AS DateTime), CAST(N'2021-06-20T23:52:10.733' AS DateTime), 0, NULL, N'en-GB', N'staff3@staff.com', 1, N'ABtvJCxuOLOlOrhncp9UNyjJSzTH4uifhua2B4tZV2J3t+YNsxYXIeCrkn13v1EuEg==', N'15e53ea9-c80e-4efe-bd8b-ef3a6459020f', NULL, 0, 0, NULL, 0, 0, N'staff3', N'SS', NULL, NULL)
GO
INSERT [dbo].[AspNetUsers] ([Id], [FirstName], [LastName], [Level], [JoinDate], [LastModified], [Inactive], [ImagePath], [SupportedLanguage], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Initials], [Signature], [MedicalRecord_Id]) VALUES (6, N'Zawar', N'Mahmood', 0, CAST(N'2021-06-20T23:49:14.737' AS DateTime), CAST(N'2021-06-21T05:42:29.153' AS DateTime), 0, NULL, NULL, N'zetawars@hotmail.com', 1, N'ABtkuGSFNgh51vp+2x/bLzVbEL6cRs9zmfyDbL0i9+d1UkQn5Jt8YnjOClu3SaVKcg==', N'c2f31b98-3384-4ab5-8285-7bd87dea87fa', NULL, 0, 0, NULL, 0, 0, N'Zawar', N'ZM', NULL, NULL)
GO
INSERT [dbo].[AspNetUsers] ([Id], [FirstName], [LastName], [Level], [JoinDate], [LastModified], [Inactive], [ImagePath], [SupportedLanguage], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Initials], [Signature], [MedicalRecord_Id]) VALUES (7, N'Staff', N'Staff2', 0, CAST(N'2021-06-20T23:49:56.920' AS DateTime), CAST(N'2021-06-20T23:49:56.940' AS DateTime), 0, NULL, N'en-GB', N'staff2@staff.com', 1, N'AJecoLVpo6BycceEbN+N13vwzMFI0VMOgnyaTtH21nG/xLFGCWA3RcOUIWUdEu1nKw==', N'a0b6372c-e5e2-45b9-ae4e-7fe3f77e89a1', NULL, 0, 0, NULL, 0, 0, N'zetawars@hotmail.com', N'SS', NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[AspNetUsers] OFF
GO
SET IDENTITY_INSERT [dbo].[ContentPages] ON 
GO
INSERT [dbo].[ContentPages] ([Id], [NavTitle], [Content], [PageId], [Title], [Route], [PageOrder]) VALUES (2, N'Features', N'<div class="blog-single">
<div class="post-content">
<h3 class="post-title">Achieving Meaningful Use with ICAN</h3>
<div class="row">
<div class="col-md-8">According to the 2009 HITECH Act, physicians are eligible to receive up to $44,000 in total incentives per physician from Medicaid for "Meaningful Use" of a certified Electronic Health Record (EHR) starting this year (2011). (Note: Physicians reimbursed by Medicaid can receive up to approximately $63,750 starting in 2011 based on state-defined guidelines.) In July 2010, the Center for Medicare and Medicaid Services (CMS) released their rule for the Stage 1 Meaningful Use requirements that physicians need to meet in order to receive their Meaningful Use incentives. For our in-depth analysis of the rule, <a>click here</a>.</div>
<div class="col-md-4"><img style="margin-right: 5px;" src="https://via.placeholder.com/250x173.png?text=Visit+WhoIsHostingThis.com+Buyers+Guide" /></div>
</div>
<p><br />Medicaid payments have been coming in and beginning in late May our first physician clients began receiving their year one Medicare Meaningful Use checks for up to $18,000. You can read on our blog about the first ICAN client to get paid. These payments represent the first step in the validation and fulfillment of ICAN''s Federal Stimulus Bonus Payment Guarantee Program, unique in the industry for guaranteeing federal Meaningful Use incentive payments, not just Meaningful Use certification. To learn more about our Guarantee. <a href="guaranteedpayment.aspx">click here</a></p>
<h3 class="post-title">Guaranteed Incentives, Nimble Technology</h3>
<p>How can we be so confident in our ability to meet Meaningful Use that we are willing to put our own money on the line?* And why do 100% of our clients share that confidence, according to our surveys, "Ambulatory EMR: On Track for Meaningful Use?" <br />Unlike traditional software or ASP-based EHRs, where all the work involved in meeting and tracking Meaningful Use performance falls on the practice, HITS provides a full-service solution with no extra or hidden costs. Our service includes, at no extra cost: </p>
<ul>
<li>Administrative support that takes on cumbersome tasks of registration and attestation with government agencies</li>
<li>Fully certified clinical quality measures built into the workflow with our proprietary HITS&reg;</li>
<li>A Meaningful Use Resource Center website where clients have access to all the information they need&mdash;at their fingertips</li>
<li>Expert performance coaching to guide and support clients through every stage of the process</li>
</ul>
<p>Here is a more detailed breakdown of how ICAN is addressing key Meaningful Use measures:</p>
<h3 class="post-title">Improved outcomes</h3>
<ul>
<li>Care Coordination (Electronically exchange information): Unlike most EHR offerings, <a href="#">athenaCommunicator&reg;</a>, with its Patient Portal and automated patient messaging, is designed to enhance patient involvement in their health care, enabling practices to meet these Meaningful Use measures.</li>
</ul>
<h3 class="post-title">Advanced clinical processes</h3>
<ul>
<li><strong>Use of e-Prescribing:</strong> MyHealthcareCompany is Surescripts&reg; certified for Prescription Benefit Eligibility, Formulary, and Reporting; Medication History (payer); Prescription Renewals (retail); and Prescription Routing for New Prescriptions (retail and mail-order).</li>
<li><strong>Closed Order Management: </strong>Because our EHR includes document management services, we make it easy for providers to create and send electronic orders from the encounter. Users can also track and close orders within the application for better follow-up and quality reporting.</li>
</ul>
<h3 class="post-title">Data capture and sharing</h3>
<ul>
<li><strong>Quality care and population management: </strong>MyHealthcareCompany&rsquo;s rules database provides a set of payer-specific quality measures and also allows for comprehensive and automatic demographic reporting.</li>
<li>Meaningful use offers an important opportunity for physicians to be financially rewarded for adopting an EHR that can effectively achieve measures. We at ICAN are here to help you navigate through the complexities of Meaningful Use, help you get all the incentive dollars you deserve, and free you from administrative red tape so you can focus on quality patient care.</li>
</ul>
<h3 class="post-title">Your Partner Through Reform and Change</h3>
<p>The HITECH Act and Meaningful Use is just one of many huge changes impacting physician practices today. Last year''s historic passage of the Patient Protection and Affordable Care Act set the stage for what will be some of the most significant changes to the U.S. health care system in a generation. To read in more detail about our perspective on the health care reform bill and our response to the challenges it presents, <a>click here</a></p>
<p>One recent manifestation of the reform bill was the release in March of the proposed rules for Accountable Care Organizations, or ACOs. To learn more about ACOs, what they might mean for your practice or organization, and how ICAN can help you navigate any payment future, <a href="cmp/ACO/_doc/ACO_NPRM_Summary.pdf">click here</a></p>
</div>
</div>', NULL, N'Features', N'features', 1)
GO
INSERT [dbo].[ContentPages] ([Id], [NavTitle], [Content], [PageId], [Title], [Route], [PageOrder]) VALUES (3, N'Pricing', N'<div class="blog-single">
<div class="post-content">
<h3 class="post-title">Achieving Meaningful Use with ICAN</h3>
<div class="row">
<div class="col-md-8">According to the 2009 HITECH Act, physicians are eligible to receive up to $44,000 in total incentives per physician from Medicaid for "Meaningful Use" of a certified Electronic Health Record (EHR) starting this year (2011). (Note: Physicians reimbursed by Medicaid can receive up to approximately $63,750 starting in 2011 based on state-defined guidelines.) In July 2010, the Center for Medicare and Medicaid Services (CMS) released their rule for the Stage 1 Meaningful Use requirements that physicians need to meet in order to receive their Meaningful Use incentives. For our in-depth analysis of the rule, <a>click here</a>.</div>
<div class="col-md-4"><img style="margin-right: 5px;" src="https://via.placeholder.com/250x173.png?text=Visit+WhoIsHostingThis.com+Buyers+Guide" /></div>
</div>
<p><br />Medicaid payments have been coming in and beginning in late May our first physician clients began receiving their year one Medicare Meaningful Use checks for up to $18,000. You can read on our blog about the first ICAN client to get paid. These payments represent the first step in the validation and fulfillment of ICAN''s Federal Stimulus Bonus Payment Guarantee Program, unique in the industry for guaranteeing federal Meaningful Use incentive payments, not just Meaningful Use certification. To learn more about our Guarantee. <a href="guaranteedpayment.aspx">click here</a></p>
<h3 class="post-title">Guaranteed Incentives, Nimble Technology</h3>
<p>How can we be so confident in our ability to meet Meaningful Use that we are willing to put our own money on the line?* And why do 100% of our clients share that confidence, according to our surveys, "Ambulatory EMR: On Track for Meaningful Use?" <br />Unlike traditional software or ASP-based EHRs, where all the work involved in meeting and tracking Meaningful Use performance falls on the practice, HITS provides a full-service solution with no extra or hidden costs. Our service includes, at no extra cost: </p>
<ul>
<li>Administrative support that takes on cumbersome tasks of registration and attestation with government agencies</li>
<li>Fully certified clinical quality measures built into the workflow with our proprietary HITS&reg;</li>
<li>A Meaningful Use Resource Center website where clients have access to all the information they need&mdash;at their fingertips</li>
<li>Expert performance coaching to guide and support clients through every stage of the process</li>
</ul>
<p>Here is a more detailed breakdown of how ICAN is addressing key Meaningful Use measures:</p>
<h3 class="post-title">Improved outcomes</h3>
<ul>
<li>Care Coordination (Electronically exchange information): Unlike most EHR offerings, <a href="#">athenaCommunicator&reg;</a>, with its Patient Portal and automated patient messaging, is designed to enhance patient involvement in their health care, enabling practices to meet these Meaningful Use measures.</li>
</ul>
<h3 class="post-title">Advanced clinical processes</h3>
<ul>
<li><strong>Use of e-Prescribing:</strong> MyHealthcareCompany is Surescripts&reg; certified for Prescription Benefit Eligibility, Formulary, and Reporting; Medication History (payer); Prescription Renewals (retail); and Prescription Routing for New Prescriptions (retail and mail-order).</li>
<li><strong>Closed Order Management: </strong>Because our EHR includes document management services, we make it easy for providers to create and send electronic orders from the encounter. Users can also track and close orders within the application for better follow-up and quality reporting.</li>
</ul>
<h3 class="post-title">Data capture and sharing</h3>
<ul>
<li><strong>Quality care and population management: </strong>MyHealthcareCompany&rsquo;s rules database provides a set of payer-specific quality measures and also allows for comprehensive and automatic demographic reporting.</li>
<li>Meaningful use offers an important opportunity for physicians to be financially rewarded for adopting an EHR that can effectively achieve measures. We at ICAN are here to help you navigate through the complexities of Meaningful Use, help you get all the incentive dollars you deserve, and free you from administrative red tape so you can focus on quality patient care.</li>
</ul>
<h3 class="post-title">Your Partner Through Reform and Change</h3>
<p>The HITECH Act and Meaningful Use is just one of many huge changes impacting physician practices today. Last year''s historic passage of the Patient Protection and Affordable Care Act set the stage for what will be some of the most significant changes to the U.S. health care system in a generation. To read in more detail about our perspective on the health care reform bill and our response to the challenges it presents, <a>click here</a></p>
<p>One recent manifestation of the reform bill was the release in March of the proposed rules for Accountable Care Organizations, or ACOs. To learn more about ACOs, what they might mean for your practice or organization, and how ICAN can help you navigate any payment future, <a href="cmp/ACO/_doc/ACO_NPRM_Summary.pdf">click here</a></p>
</div>
</div>', NULL, N'Pricing', N'pricing', 2)
GO
INSERT [dbo].[ContentPages] ([Id], [NavTitle], [Content], [PageId], [Title], [Route], [PageOrder]) VALUES (4, N'FAQ', N'<div class="blog-single">
<div class="post-content">
<h3 class="post-title">Achieving Meaningful Use with ICAN</h3>
<div class="row">
<div class="col-md-8">According to the 2009 HITECH Act, physicians are eligible to receive up to $44,000 in total incentives per physician from Medicaid for "Meaningful Use" of a certified Electronic Health Record (EHR) starting this year (2011). (Note: Physicians reimbursed by Medicaid can receive up to approximately $63,750 starting in 2011 based on state-defined guidelines.) In July 2010, the Center for Medicare and Medicaid Services (CMS) released their rule for the Stage 1 Meaningful Use requirements that physicians need to meet in order to receive their Meaningful Use incentives. For our in-depth analysis of the rule, <a>click here</a>.</div>
<div class="col-md-4"><img style="margin-right: 5px;" src="https://via.placeholder.com/250x173.png?text=Visit+WhoIsHostingThis.com+Buyers+Guide" /></div>
</div>
<p><br />Medicaid payments have been coming in and beginning in late May our first physician clients began receiving their year one Medicare Meaningful Use checks for up to $18,000. You can read on our blog about the first ICAN client to get paid. These payments represent the first step in the validation and fulfillment of ICAN''s Federal Stimulus Bonus Payment Guarantee Program, unique in the industry for guaranteeing federal Meaningful Use incentive payments, not just Meaningful Use certification. To learn more about our Guarantee. <a href="guaranteedpayment.aspx">click here</a></p>
<h3 class="post-title">Guaranteed Incentives, Nimble Technology</h3>
<p>How can we be so confident in our ability to meet Meaningful Use that we are willing to put our own money on the line?* And why do 100% of our clients share that confidence, according to our surveys, "Ambulatory EMR: On Track for Meaningful Use?" <br />Unlike traditional software or ASP-based EHRs, where all the work involved in meeting and tracking Meaningful Use performance falls on the practice, HITS provides a full-service solution with no extra or hidden costs. Our service includes, at no extra cost: </p>
<ul>
<li>Administrative support that takes on cumbersome tasks of registration and attestation with government agencies</li>
<li>Fully certified clinical quality measures built into the workflow with our proprietary HITS&reg;</li>
<li>A Meaningful Use Resource Center website where clients have access to all the information they need&mdash;at their fingertips</li>
<li>Expert performance coaching to guide and support clients through every stage of the process</li>
</ul>
<p>Here is a more detailed breakdown of how ICAN is addressing key Meaningful Use measures:</p>
<h3 class="post-title">Improved outcomes</h3>
<ul>
<li>Care Coordination (Electronically exchange information): Unlike most EHR offerings, <a href="#">athenaCommunicator&reg;</a>, with its Patient Portal and automated patient messaging, is designed to enhance patient involvement in their health care, enabling practices to meet these Meaningful Use measures.</li>
</ul>
<h3 class="post-title">Advanced clinical processes</h3>
<ul>
<li><strong>Use of e-Prescribing:</strong> MyHealthcareCompany is Surescripts&reg; certified for Prescription Benefit Eligibility, Formulary, and Reporting; Medication History (payer); Prescription Renewals (retail); and Prescription Routing for New Prescriptions (retail and mail-order).</li>
<li><strong>Closed Order Management: </strong>Because our EHR includes document management services, we make it easy for providers to create and send electronic orders from the encounter. Users can also track and close orders within the application for better follow-up and quality reporting.</li>
</ul>
<h3 class="post-title">Data capture and sharing</h3>
<ul>
<li><strong>Quality care and population management: </strong>MyHealthcareCompany&rsquo;s rules database provides a set of payer-specific quality measures and also allows for comprehensive and automatic demographic reporting.</li>
<li>Meaningful use offers an important opportunity for physicians to be financially rewarded for adopting an EHR that can effectively achieve measures. We at ICAN are here to help you navigate through the complexities of Meaningful Use, help you get all the incentive dollars you deserve, and free you from administrative red tape so you can focus on quality patient care.</li>
</ul>
<h3 class="post-title">Your Partner Through Reform and Change</h3>
<p>The HITECH Act and Meaningful Use is just one of many huge changes impacting physician practices today. Last year''s historic passage of the Patient Protection and Affordable Care Act set the stage for what will be some of the most significant changes to the U.S. health care system in a generation. To read in more detail about our perspective on the health care reform bill and our response to the challenges it presents, <a>click here</a></p>
<p>One recent manifestation of the reform bill was the release in March of the proposed rules for Accountable Care Organizations, or ACOs. To learn more about ACOs, what they might mean for your practice or organization, and how ICAN can help you navigate any payment future, <a href="cmp/ACO/_doc/ACO_NPRM_Summary.pdf">click here</a></p>
</div>
</div>', NULL, N'FAQ', N'faq', 3)
GO
INSERT [dbo].[ContentPages] ([Id], [NavTitle], [Content], [PageId], [Title], [Route], [PageOrder]) VALUES (5, N'About Us', N'<div class="blog-single">
<div class="post-content">
<div class="row">
<div class="col-md-8"><a>click here</a>.</div>
<div class="col-md-4"><img style="margin-right: 5px;" src="https://via.placeholder.com/250x173.png?text=Visit+WhoIsHostingThis.com+Buyers+Guide" />. <a href="guaranteedpayment.aspx">click here</a></div>
</div>
<h3 class="post-title">Improved outcomes</h3>
<ul>
<li>&nbsp;</li>
</ul>
<h3 class="post-title">Advanced clinical processes</h3>
<h3 class="post-title">Data capture and sharing</h3>
<h3 class="post-title">Your Partner Through Reform and Change</h3>
<p><a href="cmp/ACO/_doc/ACO_NPRM_Summary.pdf">click here</a></p>
</div>
</div>', NULL, N'About Us', N'about', 4)
GO
INSERT [dbo].[ContentPages] ([Id], [NavTitle], [Content], [PageId], [Title], [Route], [PageOrder]) VALUES (6, N'Contact Us', N'<div class="blog-single">
<div class="post-content">
<h3 class="post-title">Achieving Meaningful Use with ICAN</h3>
<div class="row">
<div class="col-md-8">According to the 2009 HITECH Act, physicians are eligible to receive up to $44,000 in total incentives per physician from Medicaid for "Meaningful Use" of a certified Electronic Health Record (EHR) starting this year (2011). (Note: Physicians reimbursed by Medicaid can receive up to approximately $63,750 starting in 2011 based on state-defined guidelines.) In July 2010, the Center for Medicare and Medicaid Services (CMS) released their rule for the Stage 1 Meaningful Use requirements that physicians need to meet in order to receive their Meaningful Use incentives. For our in-depth analysis of the rule, <a>click here</a>.</div>
<div class="col-md-4"><img style="margin-right: 5px;" src="https://via.placeholder.com/250x173.png?text=Visit+WhoIsHostingThis.com+Buyers+Guide" /></div>
</div>
<p><br />Medicaid payments have been coming in and beginning in late May our first physician clients began receiving their year one Medicare Meaningful Use checks for up to $18,000. You can read on our blog about the first ICAN client to get paid. These payments represent the first step in the validation and fulfillment of ICAN''s Federal Stimulus Bonus Payment Guarantee Program, unique in the industry for guaranteeing federal Meaningful Use incentive payments, not just Meaningful Use certification. To learn more about our Guarantee. <a href="guaranteedpayment.aspx">click here</a></p>
<h3 class="post-title">Guaranteed Incentives, Nimble Technology</h3>
<p>How can we be so confident in our ability to meet Meaningful Use that we are willing to put our own money on the line?* And why do 100% of our clients share that confidence, according to our surveys, "Ambulatory EMR: On Track for Meaningful Use?" <br />Unlike traditional software or ASP-based EHRs, where all the work involved in meeting and tracking Meaningful Use performance falls on the practice, HITS provides a full-service solution with no extra or hidden costs. Our service includes, at no extra cost: </p>
<ul>
<li>Administrative support that takes on cumbersome tasks of registration and attestation with government agencies</li>
<li>Fully certified clinical quality measures built into the workflow with our proprietary HITS&reg;</li>
<li>A Meaningful Use Resource Center website where clients have access to all the information they need&mdash;at their fingertips</li>
<li>Expert performance coaching to guide and support clients through every stage of the process</li>
</ul>
<p>Here is a more detailed breakdown of how ICAN is addressing key Meaningful Use measures:</p>
<h3 class="post-title">Improved outcomes</h3>
<ul>
<li>Care Coordination (Electronically exchange information): Unlike most EHR offerings, <a href="#">athenaCommunicator&reg;</a>, with its Patient Portal and automated patient messaging, is designed to enhance patient involvement in their health care, enabling practices to meet these Meaningful Use measures.</li>
</ul>
<h3 class="post-title">Advanced clinical processes</h3>
<ul>
<li><strong>Use of e-Prescribing:</strong> MyHealthcareCompany is Surescripts&reg; certified for Prescription Benefit Eligibility, Formulary, and Reporting; Medication History (payer); Prescription Renewals (retail); and Prescription Routing for New Prescriptions (retail and mail-order).</li>
<li><strong>Closed Order Management: </strong>Because our EHR includes document management services, we make it easy for providers to create and send electronic orders from the encounter. Users can also track and close orders within the application for better follow-up and quality reporting.</li>
</ul>
<h3 class="post-title">Data capture and sharing</h3>
<ul>
<li><strong>Quality care and population management: </strong>MyHealthcareCompany&rsquo;s rules database provides a set of payer-specific quality measures and also allows for comprehensive and automatic demographic reporting.</li>
<li>Meaningful use offers an important opportunity for physicians to be financially rewarded for adopting an EHR that can effectively achieve measures. We at ICAN are here to help you navigate through the complexities of Meaningful Use, help you get all the incentive dollars you deserve, and free you from administrative red tape so you can focus on quality patient care.</li>
</ul>
<h3 class="post-title">Your Partner Through Reform and Change</h3>
<p>The HITECH Act and Meaningful Use is just one of many huge changes impacting physician practices today. Last year''s historic passage of the Patient Protection and Affordable Care Act set the stage for what will be some of the most significant changes to the U.S. health care system in a generation. To read in more detail about our perspective on the health care reform bill and our response to the challenges it presents, <a>click here</a></p>
<p>One recent manifestation of the reform bill was the release in March of the proposed rules for Accountable Care Organizations, or ACOs. To learn more about ACOs, what they might mean for your practice or organization, and how ICAN can help you navigate any payment future, <a href="cmp/ACO/_doc/ACO_NPRM_Summary.pdf">click here</a></p>
</div>
</div>', NULL, N'Contact Us', N'contact', 5)
GO
INSERT [dbo].[ContentPages] ([Id], [NavTitle], [Content], [PageId], [Title], [Route], [PageOrder]) VALUES (7, N'Home', N'<div class="container">
<div class="top-content">
<div class="slider-wrapper">
<div class="row">
<div class="col-md-3">
<div class="subscribe-form">
<h3 class="widget-title">Login</h3>
<form action="/Account/Login" method="post"><fieldset><input id="Email" class="form-control" name="Email" type="email" value="" data-val="true" data-val-email="The Email field is not a valid e-mail address." data-val-required="The Email field is required." /></fieldset><fieldset><input id="Password" class="form-control" name="Password" type="password" value="" data-val="true" data-val-required="The Password field is required." /></fieldset><fieldset><button id="send-button" class="btn main-btn" type="submit">Login</button></fieldset></form></div>
</div>
<div class="col-md-9">
<div id="owl-demo" class="owl-carousel owl-theme">
<div class="item">
<div class="row h-100">
<div class="col-md-5">
<p class="img"><img class="img-thumbnail" src="https://via.placeholder.com/335x213" alt="" /></p>
</div>
<div class="col-md-7">
<h4 class="owl-crousel-heading">Our System</h4>
<p class="owl-crousel-body">COFSMHR is a complete paperless option for patient documentation and employee management.</p>
</div>
</div>
</div>
<div class="item">
<div class="row">
<div class="col-md-5">
<p class="img"><img class="img-thumbnail" src="https://via.placeholder.com/335x213" alt="" /></p>
</div>
<div class="col-md-7">
<h4 class="owl-crousel-heading">Online Electronic Patient Records</h4>
<div class="owl-crousel-body">Our HIPPA complaint data storage is backed up daily and encrypted
<ul>
<li>Increase Productivity</li>
<li>Electronic Storage of Patient Documents</li>
<li>Easily Organize treatment plans and other patient documents, insurance cards and identification</li>
</ul>
</div>
</div>
</div>
</div>
<div class="item">
<div class="row">
<div class="col-md-5">
<p class="img"><img class="img-thumbnail" src="https://via.placeholder.com/335x213" alt="" /></p>
</div>
<div class="col-md-7">
<h4 class="owl-crousel-heading">E-prescription</h4>
<div class="owl-crousel-body">Prescription can be sent electronically to any pharmacy with one click.</div>
</div>
</div>
</div>
<div class="item">
<div class="row">
<div class="col-md-5">
<p class="img"><img class="img-thumbnail" src="https://via.placeholder.com/335x213" alt="" /></p>
</div>
<div class="col-md-7">
<h4 class="owl-crousel-heading">Employee Management</h4>
<div class="owl-crousel-body">
<ul>
<li>Organize employee files in one place, that is accessible with a click</li>
<li>Store training, certifications, degrees and create timesheets for payroll preparation</li>
</ul>
</div>
</div>
</div>
</div>
<div class="item">
<div class="row">
<div class="col-md-5">
<p class="img"><img class="img-thumbnail" src="https://via.placeholder.com/335x213" alt="" /></p>
</div>
<div class="col-md-7">
<h4 class="owl-crousel-heading">Treatment Planning</h4>
<div class="owl-crousel-body">Create treatment plans with our templates that cover a vast array of invention and objects.</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
<div class="row">
<div class="col-md-9">
<div class="box-content">
<div class="row">
<div class="col-md-12">
<h4 class="widget-title">Features</h4>
</div>
</div>
<div class="row">
<div class="col-md-6 col-sm-6 post-grid">
<div class="card mb-3" style="max-width: 540px;">
<div class="row no-gutters">
<div class="col-md-3"><img class="img-thumbnail" src="../../Public/Content/8124071a-22df-427e-9d11-910c3cd9df7d.jfif" alt="..." /></div>
<div class="col-md-9">
<div class="card-body">
<h3 class="card-title">Automated Billing</h3>
<p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt...<small class="text-muted float-right"><a class="btn btn-primary" href="../../automate-billing">View more</a></small></p>
</div>
</div>
</div>
</div>
</div>
<div class="col-md-6 col-sm-6 post-grid">
<div class="card mb-3" style="max-width: 540px;">
<div class="row no-gutters">
<div class="col-md-3"><img class="img-thumbnail" src="../../Public/Content/af56a97a-625a-457a-a494-51a76057eb8d.jfif" alt="..." /></div>
<div class="col-md-9">
<div class="card-body">
<h3 class="card-title">Client Note Entry &amp; Approval</h3>
<p class="card-text">ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nis...<small class="text-muted float-right"><a class="btn btn-primary" href="../../client-note-entry-and-approval">View more</a></small></p>
</div>
</div>
</div>
</div>
</div>
</div>
<div class="row mt-10">
<div class="col-md-6 col-sm-6 post-grid">
<div class="card mb-3" style="max-width: 540px;">
<div class="row no-gutters">
<div class="col-md-3"><img class="img-thumbnail" src="../../Public/Content/98ffdc9e-9fc9-4726-b05b-c0bd6e149b94.jfif" alt="..." /></div>
<div class="col-md-9">
<div class="card-body">
<h3 class="card-title">Data Backup</h3>
<p class="card-text">ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit ...<small class="text-muted float-right"><a class="btn btn-primary" href="../../data-backup">View more</a></small></p>
</div>
</div>
</div>
</div>
</div>
<div class="col-md-6 col-sm-6 post-grid">
<div class="card mb-3" style="max-width: 540px;">
<div class="row no-gutters">
<div class="col-md-3"><img class="img-thumbnail" src="../../Public/Content/f2df9583-3f8c-4a8e-8a61-d62efa33157d.jfif" alt="..." /></div>
<div class="col-md-9">
<div class="card-body">
<h3 class="card-title">24/7 Support</h3>
<p class="card-text">esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident ...<small class="text-muted float-right"><a class="btn btn-primary" href="../../24-7-support">View more</a></small></p>
</div>
</div>
</div>
</div>
</div>
</div>
<div class="row mt-10">
<div class="col-md-6 col-sm-6 post-grid">
<div class="card mb-3" style="max-width: 540px;">
<div class="row no-gutters">
<div class="col-md-3"><img class="img-thumbnail" src="https://via.placeholder.com/80" alt="..." /></div>
<div class="col-md-9">
<div class="card-body">
<h3 class="card-title">Security</h3>
<p class="card-text">Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium ...<small class="text-muted float-right"><a class="btn btn-primary" href="../../security">View more</a></small></p>
</div>
</div>
</div>
</div>
</div>
<div class="col-md-6 col-sm-6 post-grid">
<div class="card mb-3" style="max-width: 540px;">
<div class="row no-gutters">
<div class="col-md-3"><img class="img-thumbnail" src="https://via.placeholder.com/80" alt="..." /></div>
<div class="col-md-9">
<div class="card-body">
<h3 class="card-title">Employee Screening</h3>
<p class="card-text">totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.<small class="text-muted float-right"><a class="btn btn-primary" href="../../employee-screening">View more</a></small></p>
</div>
</div>
</div>
</div>
</div>
</div>
<div class="row mt-10">
<div class="col-md-6 col-sm-6 post-grid">
<div class="card mb-3" style="max-width: 540px;">
<div class="row no-gutters">
<div class="col-md-3"><img class="img-thumbnail" src="https://via.placeholder.com/80" alt="..." /></div>
<div class="col-md-9">
<div class="card-body">
<h3 class="card-title">Eligibility Checks</h3>
<p class="card-text">Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos ...<small class="text-muted float-right"><a class="btn btn-primary" href="../../eligibility-checks">View more</a></small></p>
</div>
</div>
</div>
</div>
</div>
<div class="col-md-6 col-sm-6 post-grid">
<div class="card mb-3" style="max-width: 540px;">
<div class="row no-gutters">
<div class="col-md-3"><img class="img-thumbnail" src="https://via.placeholder.com/80" alt="..." /></div>
<div class="col-md-9">
<div class="card-body">
<h3 class="card-title">Plagiarism Checks</h3>
<p class="card-text">qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit ...<small class="text-muted float-right"><a class="btn btn-primary" href="../../plagiarism-checks">View more</a></small></p>
</div>
</div>
</div>
</div>
</div>
</div>
<div class="row mt-10">
<div class="col-md-6 col-sm-6 post-grid">
<div class="card mb-3" style="max-width: 540px;">
<div class="row no-gutters">
<div class="col-md-3"><img class="img-thumbnail" src="https://via.placeholder.com/80" alt="..." /></div>
<div class="col-md-9">
<div class="card-body">
<h3 class="card-title">Real-Time Reporting</h3>
<p class="card-text">sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam ...</p>
</div>
</div>
</div>
</div>
</div>
<div class="col-md-6 col-sm-6 post-grid">
<div class="card mb-3" style="max-width: 540px;">
<div class="row no-gutters">
<div class="col-md-3"><img class="img-thumbnail" src="https://via.placeholder.com/80" alt="..." /></div>
<div class="col-md-9">
<div class="card-body">
<h3 class="card-title">Payroll Generation</h3>
<p class="card-text">quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur ...<small class="text-muted float-right"><a class="btn btn-primary" href="../../payroll-generation">View more</a></small></p>
</div>
</div>
</div>
</div>
</div>
</div>
<div class="row mt-10">
<div class="col-md-6 col-sm-6 post-grid">
<div class="card mb-3" style="max-width: 540px;">
<div class="row no-gutters">
<div class="col-md-3"><img class="img-thumbnail" src="https://via.placeholder.com/80" alt="..." /></div>
<div class="col-md-9">
<div class="card-body">
<h3 class="card-title">Multiple locations</h3>
<p class="card-text">Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur ...</p>
</div>
</div>
</div>
</div>
</div>
<div class="col-md-6 col-sm-6 post-grid">
<div class="card mb-3" style="max-width: 540px;">
<div class="row no-gutters">
<div class="col-md-3"><img class="img-thumbnail" src="https://via.placeholder.com/80" alt="..." /></div>
<div class="col-md-9">
<div class="card-body">
<h3 class="card-title">E-Prescribing</h3>
<p class="card-text">At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque ...<small class="text-muted float-right"><a class="btn btn-primary" href="../../e-prescribing">View more</a></small></p>
</div>
</div>
</div>
</div>
</div>
</div>
<div class="row mt-10">
<div class="col-md-6 col-sm-6 post-grid">
<div class="card mb-3" style="max-width: 540px;">
<div class="row no-gutters">
<div class="col-md-3"><img class="img-thumbnail" src="https://via.placeholder.com/80" alt="..." /></div>
<div class="col-md-9">
<div class="card-body">
<h3 class="card-title">Lab Results</h3>
<p class="card-text">Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id ...<small class="text-muted float-right"><a class="btn btn-primary" href="../../lab-results">View more</a></small></p>
</div>
</div>
</div>
</div>
</div>
<div class="col-md-6 col-sm-6 post-grid">
<div class="card mb-3" style="max-width: 540px;">
<div class="row no-gutters">
<div class="col-md-3"><img class="img-thumbnail" src="https://via.placeholder.com/80" alt="..." /></div>
<div class="col-md-9">
<div class="card-body">
<h3 class="card-title">Scheduling</h3>
<p class="card-text">quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis ...<small class="text-muted float-right"><a class="btn btn-primary" href="../../scheduling">View more</a></small></p>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
<div class="col-md-3">
<div class="box-content">
<div class="events-sidebar">
<ul>
<li class="event-item"><img class="img-thumbnail" src="https://via.placeholder.com/231x202.png?text=live+demo" alt="" /></li>
<li class="event-item">
<h3 class="text-purple" style="font-size: 2rem;">Testimonials</h3>
<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem.</p>
</li>
</ul>
<a class="read-more" href="events-list.html">More Events &rarr;</a></div>
</div>
</div>
</div>
</div>', NULL, N'Home', N'home', 0)
GO
INSERT [dbo].[ContentPages] ([Id], [NavTitle], [Content], [PageId], [Title], [Route], [PageOrder]) VALUES (11, N'Client Note Entry & Approval', N'<div class="blog-single">
<div class="post-content">
<h3 class="post-title">Achieving Meaningful Use with ICAN</h3>
<div class="row">
<div class="col-md-8">According to the 2009 HITECH Act, physicians are eligible to receive up to $44,000 in total incentives per physician from Medicaid for "Meaningful Use" of a certified Electronic Health Record (EHR) starting this year (2011). (Note: Physicians reimbursed by Medicaid can receive up to approximately $63,750 starting in 2011 based on state-defined guidelines.) In July 2010, the Center for Medicare and Medicaid Services (CMS) released their rule for the Stage 1 Meaningful Use requirements that physicians need to meet in order to receive their Meaningful Use incentives. For our in-depth analysis of the rule, <a>click here</a>.</div>
<div class="col-md-4"><img style="margin-right: 5px;" src="https://via.placeholder.com/250x173.png?text=Visit+WhoIsHostingThis.com+Buyers+Guide" /></div>
</div>
<p><br />Medicaid payments have been coming in and beginning in late May our first physician clients began receiving their year one Medicare Meaningful Use checks for up to $18,000. You can read on our blog about the first ICAN client to get paid. These payments represent the first step in the validation and fulfillment of ICAN''s Federal Stimulus Bonus Payment Guarantee Program, unique in the industry for guaranteeing federal Meaningful Use incentive payments, not just Meaningful Use certification. To learn more about our Guarantee. <a href="guaranteedpayment.aspx">click here</a></p>
<h3 class="post-title">Guaranteed Incentives, Nimble Technology</h3>
<p>How can we be so confident in our ability to meet Meaningful Use that we are willing to put our own money on the line?* And why do 100% of our clients share that confidence, according to our surveys, "Ambulatory EMR: On Track for Meaningful Use?" <br />Unlike traditional software or ASP-based EHRs, where all the work involved in meeting and tracking Meaningful Use performance falls on the practice, HITS provides a full-service solution with no extra or hidden costs. Our service includes, at no extra cost: </p>
<ul>
<li>Administrative support that takes on cumbersome tasks of registration and attestation with government agencies</li>
<li>Fully certified clinical quality measures built into the workflow with our proprietary HITS&reg;</li>
<li>A Meaningful Use Resource Center website where clients have access to all the information they need&mdash;at their fingertips</li>
<li>Expert performance coaching to guide and support clients through every stage of the process</li>
</ul>
<p>Here is a more detailed breakdown of how ICAN is addressing key Meaningful Use measures:</p>
<h3 class="post-title">Improved outcomes</h3>
<ul>
<li>Care Coordination (Electronically exchange information): Unlike most EHR offerings, <a href="#">athenaCommunicator&reg;</a>, with its Patient Portal and automated patient messaging, is designed to enhance patient involvement in their health care, enabling practices to meet these Meaningful Use measures.</li>
</ul>
<h3 class="post-title">Advanced clinical processes</h3>
<ul>
<li><strong>Use of e-Prescribing:</strong> MyHealthcareCompany is Surescripts&reg; certified for Prescription Benefit Eligibility, Formulary, and Reporting; Medication History (payer); Prescription Renewals (retail); and Prescription Routing for New Prescriptions (retail and mail-order).</li>
<li><strong>Closed Order Management: </strong>Because our EHR includes document management services, we make it easy for providers to create and send electronic orders from the encounter. Users can also track and close orders within the application for better follow-up and quality reporting.</li>
</ul>
<h3 class="post-title">Data capture and sharing</h3>
<ul>
<li><strong>Quality care and population management: </strong>MyHealthcareCompany&rsquo;s rules database provides a set of payer-specific quality measures and also allows for comprehensive and automatic demographic reporting.</li>
<li>Meaningful use offers an important opportunity for physicians to be financially rewarded for adopting an EHR that can effectively achieve measures. We at ICAN are here to help you navigate through the complexities of Meaningful Use, help you get all the incentive dollars you deserve, and free you from administrative red tape so you can focus on quality patient care.</li>
</ul>
<h3 class="post-title">Your Partner Through Reform and Change</h3>
<p>The HITECH Act and Meaningful Use is just one of many huge changes impacting physician practices today. Last year''s historic passage of the Patient Protection and Affordable Care Act set the stage for what will be some of the most significant changes to the U.S. health care system in a generation. To read in more detail about our perspective on the health care reform bill and our response to the challenges it presents, <a>click here</a></p>
<p>One recent manifestation of the reform bill was the release in March of the proposed rules for Accountable Care Organizations, or ACOs. To learn more about ACOs, what they might mean for your practice or organization, and how ICAN can help you navigate any payment future, <a href="cmp/ACO/_doc/ACO_NPRM_Summary.pdf">click here</a></p>
</div>
</div>', 2, N'Client Note Entry & Approval', N'client-note-entry-and-approval', 1)
GO
INSERT [dbo].[ContentPages] ([Id], [NavTitle], [Content], [PageId], [Title], [Route], [PageOrder]) VALUES (12, N'Automate Billing', N'<div class="blog-single">
<div class="post-content">
<h3 class="post-title">Achieving Meaningful Use with ICAN</h3>
<div class="row">
<div class="col-md-8">According to the 2009 HITECH Act, physicians are eligible to receive up to $44,000 in total incentives per physician from Medicaid for "Meaningful Use" of a certified Electronic Health Record (EHR) starting this year (2011). (Note: Physicians reimbursed by Medicaid can receive up to approximately $63,750 starting in 2011 based on state-defined guidelines.) In July 2010, the Center for Medicare and Medicaid Services (CMS) released their rule for the Stage 1 Meaningful Use requirements that physicians need to meet in order to receive their Meaningful Use incentives. For our in-depth analysis of the rule, <a>click here</a>.</div>
<div class="col-md-4"><img style="margin-right: 5px;" src="https://via.placeholder.com/250x173.png?text=Visit+WhoIsHostingThis.com+Buyers+Guide" /></div>
</div>
<p><br />Medicaid payments have been coming in and beginning in late May our first physician clients began receiving their year one Medicare Meaningful Use checks for up to $18,000. You can read on our blog about the first ICAN client to get paid. These payments represent the first step in the validation and fulfillment of ICAN''s Federal Stimulus Bonus Payment Guarantee Program, unique in the industry for guaranteeing federal Meaningful Use incentive payments, not just Meaningful Use certification. To learn more about our Guarantee. <a href="guaranteedpayment.aspx">click here</a></p>
<h3 class="post-title">Guaranteed Incentives, Nimble Technology</h3>
<p>How can we be so confident in our ability to meet Meaningful Use that we are willing to put our own money on the line?* And why do 100% of our clients share that confidence, according to our surveys, "Ambulatory EMR: On Track for Meaningful Use?" <br />Unlike traditional software or ASP-based EHRs, where all the work involved in meeting and tracking Meaningful Use performance falls on the practice, HITS provides a full-service solution with no extra or hidden costs. Our service includes, at no extra cost: </p>
<ul>
<li>Administrative support that takes on cumbersome tasks of registration and attestation with government agencies</li>
<li>Fully certified clinical quality measures built into the workflow with our proprietary HITS&reg;</li>
<li>A Meaningful Use Resource Center website where clients have access to all the information they need&mdash;at their fingertips</li>
<li>Expert performance coaching to guide and support clients through every stage of the process</li>
</ul>
<p>Here is a more detailed breakdown of how ICAN is addressing key Meaningful Use measures:</p>
<h3 class="post-title">Improved outcomes</h3>
<ul>
<li>Care Coordination (Electronically exchange information): Unlike most EHR offerings, <a href="#">athenaCommunicator&reg;</a>, with its Patient Portal and automated patient messaging, is designed to enhance patient involvement in their health care, enabling practices to meet these Meaningful Use measures.</li>
</ul>
<h3 class="post-title">Advanced clinical processes</h3>
<ul>
<li><strong>Use of e-Prescribing:</strong> MyHealthcareCompany is Surescripts&reg; certified for Prescription Benefit Eligibility, Formulary, and Reporting; Medication History (payer); Prescription Renewals (retail); and Prescription Routing for New Prescriptions (retail and mail-order).</li>
<li><strong>Closed Order Management: </strong>Because our EHR includes document management services, we make it easy for providers to create and send electronic orders from the encounter. Users can also track and close orders within the application for better follow-up and quality reporting.</li>
</ul>
<h3 class="post-title">Data capture and sharing</h3>
<ul>
<li><strong>Quality care and population management: </strong>MyHealthcareCompany&rsquo;s rules database provides a set of payer-specific quality measures and also allows for comprehensive and automatic demographic reporting.</li>
<li>Meaningful use offers an important opportunity for physicians to be financially rewarded for adopting an EHR that can effectively achieve measures. We at ICAN are here to help you navigate through the complexities of Meaningful Use, help you get all the incentive dollars you deserve, and free you from administrative red tape so you can focus on quality patient care.</li>
</ul>
<h3 class="post-title">Your Partner Through Reform and Change</h3>
<p>The HITECH Act and Meaningful Use is just one of many huge changes impacting physician practices today. Last year''s historic passage of the Patient Protection and Affordable Care Act set the stage for what will be some of the most significant changes to the U.S. health care system in a generation. To read in more detail about our perspective on the health care reform bill and our response to the challenges it presents, <a>click here</a></p>
<p>One recent manifestation of the reform bill was the release in March of the proposed rules for Accountable Care Organizations, or ACOs. To learn more about ACOs, what they might mean for your practice or organization, and how ICAN can help you navigate any payment future, <a href="cmp/ACO/_doc/ACO_NPRM_Summary.pdf">click here</a></p>
</div>
</div>', 2, N'Automate Billing', N'automate-billing', 2)
GO
INSERT [dbo].[ContentPages] ([Id], [NavTitle], [Content], [PageId], [Title], [Route], [PageOrder]) VALUES (13, N'Security', N'<div class="blog-single">
<div class="post-content">
<h3 class="post-title">Achieving Meaningful Use with ICAN</h3>
<div class="row">
<div class="col-md-8">According to the 2009 HITECH Act, physicians are eligible to receive up to $44,000 in total incentives per physician from Medicaid for "Meaningful Use" of a certified Electronic Health Record (EHR) starting this year (2011). (Note: Physicians reimbursed by Medicaid can receive up to approximately $63,750 starting in 2011 based on state-defined guidelines.) In July 2010, the Center for Medicare and Medicaid Services (CMS) released their rule for the Stage 1 Meaningful Use requirements that physicians need to meet in order to receive their Meaningful Use incentives. For our in-depth analysis of the rule, <a>click here</a>.</div>
<div class="col-md-4"><img style="margin-right: 5px;" src="https://via.placeholder.com/250x173.png?text=Visit+WhoIsHostingThis.com+Buyers+Guide" /></div>
</div>
<p><br />Medicaid payments have been coming in and beginning in late May our first physician clients began receiving their year one Medicare Meaningful Use checks for up to $18,000. You can read on our blog about the first ICAN client to get paid. These payments represent the first step in the validation and fulfillment of ICAN''s Federal Stimulus Bonus Payment Guarantee Program, unique in the industry for guaranteeing federal Meaningful Use incentive payments, not just Meaningful Use certification. To learn more about our Guarantee. <a href="guaranteedpayment.aspx">click here</a></p>
<h3 class="post-title">Guaranteed Incentives, Nimble Technology</h3>
<p>How can we be so confident in our ability to meet Meaningful Use that we are willing to put our own money on the line?* And why do 100% of our clients share that confidence, according to our surveys, "Ambulatory EMR: On Track for Meaningful Use?" <br />Unlike traditional software or ASP-based EHRs, where all the work involved in meeting and tracking Meaningful Use performance falls on the practice, HITS provides a full-service solution with no extra or hidden costs. Our service includes, at no extra cost: </p>
<ul>
<li>Administrative support that takes on cumbersome tasks of registration and attestation with government agencies</li>
<li>Fully certified clinical quality measures built into the workflow with our proprietary HITS&reg;</li>
<li>A Meaningful Use Resource Center website where clients have access to all the information they need&mdash;at their fingertips</li>
<li>Expert performance coaching to guide and support clients through every stage of the process</li>
</ul>
<p>Here is a more detailed breakdown of how ICAN is addressing key Meaningful Use measures:</p>
<h3 class="post-title">Improved outcomes</h3>
<ul>
<li>Care Coordination (Electronically exchange information): Unlike most EHR offerings, <a href="#">athenaCommunicator&reg;</a>, with its Patient Portal and automated patient messaging, is designed to enhance patient involvement in their health care, enabling practices to meet these Meaningful Use measures.</li>
</ul>
<h3 class="post-title">Advanced clinical processes</h3>
<ul>
<li><strong>Use of e-Prescribing:</strong> MyHealthcareCompany is Surescripts&reg; certified for Prescription Benefit Eligibility, Formulary, and Reporting; Medication History (payer); Prescription Renewals (retail); and Prescription Routing for New Prescriptions (retail and mail-order).</li>
<li><strong>Closed Order Management: </strong>Because our EHR includes document management services, we make it easy for providers to create and send electronic orders from the encounter. Users can also track and close orders within the application for better follow-up and quality reporting.</li>
</ul>
<h3 class="post-title">Data capture and sharing</h3>
<ul>
<li><strong>Quality care and population management: </strong>MyHealthcareCompany&rsquo;s rules database provides a set of payer-specific quality measures and also allows for comprehensive and automatic demographic reporting.</li>
<li>Meaningful use offers an important opportunity for physicians to be financially rewarded for adopting an EHR that can effectively achieve measures. We at ICAN are here to help you navigate through the complexities of Meaningful Use, help you get all the incentive dollars you deserve, and free you from administrative red tape so you can focus on quality patient care.</li>
</ul>
<h3 class="post-title">Your Partner Through Reform and Change</h3>
<p>The HITECH Act and Meaningful Use is just one of many huge changes impacting physician practices today. Last year''s historic passage of the Patient Protection and Affordable Care Act set the stage for what will be some of the most significant changes to the U.S. health care system in a generation. To read in more detail about our perspective on the health care reform bill and our response to the challenges it presents, <a>click here</a></p>
<p>One recent manifestation of the reform bill was the release in March of the proposed rules for Accountable Care Organizations, or ACOs. To learn more about ACOs, what they might mean for your practice or organization, and how ICAN can help you navigate any payment future, <a href="cmp/ACO/_doc/ACO_NPRM_Summary.pdf">click here</a></p>
</div>
</div>', 2, N'Security', N'security', 3)
GO
INSERT [dbo].[ContentPages] ([Id], [NavTitle], [Content], [PageId], [Title], [Route], [PageOrder]) VALUES (14, N'24/7 Support', N'<div class="blog-single">
<div class="post-content">
<h3 class="post-title">Achieving Meaningful Use with ICAN</h3>
<div class="row">
<div class="col-md-8">According to the 2009 HITECH Act, physicians are eligible to receive up to $44,000 in total incentives per physician from Medicaid for "Meaningful Use" of a certified Electronic Health Record (EHR) starting this year (2011). (Note: Physicians reimbursed by Medicaid can receive up to approximately $63,750 starting in 2011 based on state-defined guidelines.) In July 2010, the Center for Medicare and Medicaid Services (CMS) released their rule for the Stage 1 Meaningful Use requirements that physicians need to meet in order to receive their Meaningful Use incentives. For our in-depth analysis of the rule, <a>click here</a>.</div>
<div class="col-md-4"><img style="margin-right: 5px;" src="https://via.placeholder.com/250x173.png?text=Visit+WhoIsHostingThis.com+Buyers+Guide" /></div>
</div>
<p><br />Medicaid payments have been coming in and beginning in late May our first physician clients began receiving their year one Medicare Meaningful Use checks for up to $18,000. You can read on our blog about the first ICAN client to get paid. These payments represent the first step in the validation and fulfillment of ICAN''s Federal Stimulus Bonus Payment Guarantee Program, unique in the industry for guaranteeing federal Meaningful Use incentive payments, not just Meaningful Use certification. To learn more about our Guarantee. <a href="guaranteedpayment.aspx">click here</a></p>
<h3 class="post-title">Guaranteed Incentives, Nimble Technology</h3>
<p>How can we be so confident in our ability to meet Meaningful Use that we are willing to put our own money on the line?* And why do 100% of our clients share that confidence, according to our surveys, "Ambulatory EMR: On Track for Meaningful Use?" <br />Unlike traditional software or ASP-based EHRs, where all the work involved in meeting and tracking Meaningful Use performance falls on the practice, HITS provides a full-service solution with no extra or hidden costs. Our service includes, at no extra cost: </p>
<ul>
<li>Administrative support that takes on cumbersome tasks of registration and attestation with government agencies</li>
<li>Fully certified clinical quality measures built into the workflow with our proprietary HITS&reg;</li>
<li>A Meaningful Use Resource Center website where clients have access to all the information they need&mdash;at their fingertips</li>
<li>Expert performance coaching to guide and support clients through every stage of the process</li>
</ul>
<p>Here is a more detailed breakdown of how ICAN is addressing key Meaningful Use measures:</p>
<h3 class="post-title">Improved outcomes</h3>
<ul>
<li>Care Coordination (Electronically exchange information): Unlike most EHR offerings, <a href="#">athenaCommunicator&reg;</a>, with its Patient Portal and automated patient messaging, is designed to enhance patient involvement in their health care, enabling practices to meet these Meaningful Use measures.</li>
</ul>
<h3 class="post-title">Advanced clinical processes</h3>
<ul>
<li><strong>Use of e-Prescribing:</strong> MyHealthcareCompany is Surescripts&reg; certified for Prescription Benefit Eligibility, Formulary, and Reporting; Medication History (payer); Prescription Renewals (retail); and Prescription Routing for New Prescriptions (retail and mail-order).</li>
<li><strong>Closed Order Management: </strong>Because our EHR includes document management services, we make it easy for providers to create and send electronic orders from the encounter. Users can also track and close orders within the application for better follow-up and quality reporting.</li>
</ul>
<h3 class="post-title">Data capture and sharing</h3>
<ul>
<li><strong>Quality care and population management: </strong>MyHealthcareCompany&rsquo;s rules database provides a set of payer-specific quality measures and also allows for comprehensive and automatic demographic reporting.</li>
<li>Meaningful use offers an important opportunity for physicians to be financially rewarded for adopting an EHR that can effectively achieve measures. We at ICAN are here to help you navigate through the complexities of Meaningful Use, help you get all the incentive dollars you deserve, and free you from administrative red tape so you can focus on quality patient care.</li>
</ul>
<h3 class="post-title">Your Partner Through Reform and Change</h3>
<p>The HITECH Act and Meaningful Use is just one of many huge changes impacting physician practices today. Last year''s historic passage of the Patient Protection and Affordable Care Act set the stage for what will be some of the most significant changes to the U.S. health care system in a generation. To read in more detail about our perspective on the health care reform bill and our response to the challenges it presents, <a>click here</a></p>
<p>One recent manifestation of the reform bill was the release in March of the proposed rules for Accountable Care Organizations, or ACOs. To learn more about ACOs, what they might mean for your practice or organization, and how ICAN can help you navigate any payment future, <a href="cmp/ACO/_doc/ACO_NPRM_Summary.pdf">click here</a></p>
</div>
</div>', 2, N'24/7 Support', N'24-7-support', 4)
GO
INSERT [dbo].[ContentPages] ([Id], [NavTitle], [Content], [PageId], [Title], [Route], [PageOrder]) VALUES (15, N'Data Backup', N'<div class="blog-single">
<div class="post-content">
<div class="row">
<div class="col-md-8"><a>click here</a>.</div>
<div class="col-md-4"><img style="margin-right: 5px;" src="https://via.placeholder.com/250x173.png?text=Visit+WhoIsHostingThis.com+Buyers+Guide" /> <a href="guaranteedpayment.aspx">click here</a></div>
</div>
<p>&nbsp;</p>
<h3 class="post-title">Improved outcomes</h3>
<ul>
<li>&nbsp;</li>
</ul>
<h3 class="post-title">Advanced clinical processes</h3>
<h3 class="post-title">Data capture and sharing</h3>
<ul>
<li>&nbsp;</li>
</ul>
<h3 class="post-title">Your Partner Through Reform and Change</h3>
<p><a href="cmp/ACO/_doc/ACO_NPRM_Summary.pdf">click here</a></p>
</div>
</div>', 2, N'Data Backup', N'data-backup', 0)
GO
INSERT [dbo].[ContentPages] ([Id], [NavTitle], [Content], [PageId], [Title], [Route], [PageOrder]) VALUES (16, N'Employee Screening', N'<div class="blog-single">
<div class="post-content">
<h3 class="post-title">Achieving Meaningful Use with ICAN</h3>
<div class="row">
<div class="col-md-8">According to the 2009 HITECH Act, physicians are eligible to receive up to $44,000 in total incentives per physician from Medicaid for "Meaningful Use" of a certified Electronic Health Record (EHR) starting this year (2011). (Note: Physicians reimbursed by Medicaid can receive up to approximately $63,750 starting in 2011 based on state-defined guidelines.) In July 2010, the Center for Medicare and Medicaid Services (CMS) released their rule for the Stage 1 Meaningful Use requirements that physicians need to meet in order to receive their Meaningful Use incentives. For our in-depth analysis of the rule, <a>click here</a>.</div>
<div class="col-md-4"><img style="margin-right: 5px;" src="https://via.placeholder.com/250x173.png?text=Visit+WhoIsHostingThis.com+Buyers+Guide" /></div>
</div>
<p><br />Medicaid payments have been coming in and beginning in late May our first physician clients began receiving their year one Medicare Meaningful Use checks for up to $18,000. You can read on our blog about the first ICAN client to get paid. These payments represent the first step in the validation and fulfillment of ICAN''s Federal Stimulus Bonus Payment Guarantee Program, unique in the industry for guaranteeing federal Meaningful Use incentive payments, not just Meaningful Use certification. To learn more about our Guarantee. <a href="guaranteedpayment.aspx">click here</a></p>
<h3 class="post-title">Guaranteed Incentives, Nimble Technology</h3>
<p>How can we be so confident in our ability to meet Meaningful Use that we are willing to put our own money on the line?* And why do 100% of our clients share that confidence, according to our surveys, "Ambulatory EMR: On Track for Meaningful Use?" <br />Unlike traditional software or ASP-based EHRs, where all the work involved in meeting and tracking Meaningful Use performance falls on the practice, HITS provides a full-service solution with no extra or hidden costs. Our service includes, at no extra cost: </p>
<ul>
<li>Administrative support that takes on cumbersome tasks of registration and attestation with government agencies</li>
<li>Fully certified clinical quality measures built into the workflow with our proprietary HITS&reg;</li>
<li>A Meaningful Use Resource Center website where clients have access to all the information they need&mdash;at their fingertips</li>
<li>Expert performance coaching to guide and support clients through every stage of the process</li>
</ul>
<p>Here is a more detailed breakdown of how ICAN is addressing key Meaningful Use measures:</p>
<h3 class="post-title">Improved outcomes</h3>
<ul>
<li>Care Coordination (Electronically exchange information): Unlike most EHR offerings, <a href="#">athenaCommunicator&reg;</a>, with its Patient Portal and automated patient messaging, is designed to enhance patient involvement in their health care, enabling practices to meet these Meaningful Use measures.</li>
</ul>
<h3 class="post-title">Advanced clinical processes</h3>
<ul>
<li><strong>Use of e-Prescribing:</strong> MyHealthcareCompany is Surescripts&reg; certified for Prescription Benefit Eligibility, Formulary, and Reporting; Medication History (payer); Prescription Renewals (retail); and Prescription Routing for New Prescriptions (retail and mail-order).</li>
<li><strong>Closed Order Management: </strong>Because our EHR includes document management services, we make it easy for providers to create and send electronic orders from the encounter. Users can also track and close orders within the application for better follow-up and quality reporting.</li>
</ul>
<h3 class="post-title">Data capture and sharing</h3>
<ul>
<li><strong>Quality care and population management: </strong>MyHealthcareCompany&rsquo;s rules database provides a set of payer-specific quality measures and also allows for comprehensive and automatic demographic reporting.</li>
<li>Meaningful use offers an important opportunity for physicians to be financially rewarded for adopting an EHR that can effectively achieve measures. We at ICAN are here to help you navigate through the complexities of Meaningful Use, help you get all the incentive dollars you deserve, and free you from administrative red tape so you can focus on quality patient care.</li>
</ul>
<h3 class="post-title">Your Partner Through Reform and Change</h3>
<p>The HITECH Act and Meaningful Use is just one of many huge changes impacting physician practices today. Last year''s historic passage of the Patient Protection and Affordable Care Act set the stage for what will be some of the most significant changes to the U.S. health care system in a generation. To read in more detail about our perspective on the health care reform bill and our response to the challenges it presents, <a>click here</a></p>
<p>One recent manifestation of the reform bill was the release in March of the proposed rules for Accountable Care Organizations, or ACOs. To learn more about ACOs, what they might mean for your practice or organization, and how ICAN can help you navigate any payment future, <a href="cmp/ACO/_doc/ACO_NPRM_Summary.pdf">click here</a></p>
</div>
</div>', 2, N'Employee Screening', N'employee-screening', 6)
GO
INSERT [dbo].[ContentPages] ([Id], [NavTitle], [Content], [PageId], [Title], [Route], [PageOrder]) VALUES (17, N'Eligibility Checks', N'<div class="blog-single">
<div class="post-content">
<h3 class="post-title">Achieving Meaningful Use with ICAN</h3>
<div class="row">
<div class="col-md-8">According to the 2009 HITECH Act, physicians are eligible to receive up to $44,000 in total incentives per physician from Medicaid for "Meaningful Use" of a certified Electronic Health Record (EHR) starting this year (2011). (Note: Physicians reimbursed by Medicaid can receive up to approximately $63,750 starting in 2011 based on state-defined guidelines.) In July 2010, the Center for Medicare and Medicaid Services (CMS) released their rule for the Stage 1 Meaningful Use requirements that physicians need to meet in order to receive their Meaningful Use incentives. For our in-depth analysis of the rule, <a>click here</a>.</div>
<div class="col-md-4"><img style="margin-right: 5px;" src="https://via.placeholder.com/250x173.png?text=Visit+WhoIsHostingThis.com+Buyers+Guide" /></div>
</div>
<p><br />Medicaid payments have been coming in and beginning in late May our first physician clients began receiving their year one Medicare Meaningful Use checks for up to $18,000. You can read on our blog about the first ICAN client to get paid. These payments represent the first step in the validation and fulfillment of ICAN''s Federal Stimulus Bonus Payment Guarantee Program, unique in the industry for guaranteeing federal Meaningful Use incentive payments, not just Meaningful Use certification. To learn more about our Guarantee. <a href="guaranteedpayment.aspx">click here</a></p>
<h3 class="post-title">Guaranteed Incentives, Nimble Technology</h3>
<p>How can we be so confident in our ability to meet Meaningful Use that we are willing to put our own money on the line?* And why do 100% of our clients share that confidence, according to our surveys, "Ambulatory EMR: On Track for Meaningful Use?" <br />Unlike traditional software or ASP-based EHRs, where all the work involved in meeting and tracking Meaningful Use performance falls on the practice, HITS provides a full-service solution with no extra or hidden costs. Our service includes, at no extra cost: </p>
<ul>
<li>Administrative support that takes on cumbersome tasks of registration and attestation with government agencies</li>
<li>Fully certified clinical quality measures built into the workflow with our proprietary HITS&reg;</li>
<li>A Meaningful Use Resource Center website where clients have access to all the information they need&mdash;at their fingertips</li>
<li>Expert performance coaching to guide and support clients through every stage of the process</li>
</ul>
<p>Here is a more detailed breakdown of how ICAN is addressing key Meaningful Use measures:</p>
<h3 class="post-title">Improved outcomes</h3>
<ul>
<li>Care Coordination (Electronically exchange information): Unlike most EHR offerings, <a href="#">athenaCommunicator&reg;</a>, with its Patient Portal and automated patient messaging, is designed to enhance patient involvement in their health care, enabling practices to meet these Meaningful Use measures.</li>
</ul>
<h3 class="post-title">Advanced clinical processes</h3>
<ul>
<li><strong>Use of e-Prescribing:</strong> MyHealthcareCompany is Surescripts&reg; certified for Prescription Benefit Eligibility, Formulary, and Reporting; Medication History (payer); Prescription Renewals (retail); and Prescription Routing for New Prescriptions (retail and mail-order).</li>
<li><strong>Closed Order Management: </strong>Because our EHR includes document management services, we make it easy for providers to create and send electronic orders from the encounter. Users can also track and close orders within the application for better follow-up and quality reporting.</li>
</ul>
<h3 class="post-title">Data capture and sharing</h3>
<ul>
<li><strong>Quality care and population management: </strong>MyHealthcareCompany&rsquo;s rules database provides a set of payer-specific quality measures and also allows for comprehensive and automatic demographic reporting.</li>
<li>Meaningful use offers an important opportunity for physicians to be financially rewarded for adopting an EHR that can effectively achieve measures. We at ICAN are here to help you navigate through the complexities of Meaningful Use, help you get all the incentive dollars you deserve, and free you from administrative red tape so you can focus on quality patient care.</li>
</ul>
<h3 class="post-title">Your Partner Through Reform and Change</h3>
<p>The HITECH Act and Meaningful Use is just one of many huge changes impacting physician practices today. Last year''s historic passage of the Patient Protection and Affordable Care Act set the stage for what will be some of the most significant changes to the U.S. health care system in a generation. To read in more detail about our perspective on the health care reform bill and our response to the challenges it presents, <a>click here</a></p>
<p>One recent manifestation of the reform bill was the release in March of the proposed rules for Accountable Care Organizations, or ACOs. To learn more about ACOs, what they might mean for your practice or organization, and how ICAN can help you navigate any payment future, <a href="cmp/ACO/_doc/ACO_NPRM_Summary.pdf">click here</a></p>
</div>
</div>', 2, N'Eligibility Checks', N'eligibility-checks', 7)
GO
INSERT [dbo].[ContentPages] ([Id], [NavTitle], [Content], [PageId], [Title], [Route], [PageOrder]) VALUES (18, N'Plagiarism Checks', N'<div class="blog-single">
<div class="post-content">
<h3 class="post-title">Achieving Meaningful Use with ICAN</h3>
<div class="row">
<div class="col-md-8">According to the 2009 HITECH Act, physicians are eligible to receive up to $44,000 in total incentives per physician from Medicaid for "Meaningful Use" of a certified Electronic Health Record (EHR) starting this year (2011). (Note: Physicians reimbursed by Medicaid can receive up to approximately $63,750 starting in 2011 based on state-defined guidelines.) In July 2010, the Center for Medicare and Medicaid Services (CMS) released their rule for the Stage 1 Meaningful Use requirements that physicians need to meet in order to receive their Meaningful Use incentives. For our in-depth analysis of the rule, <a>click here</a>.</div>
<div class="col-md-4"><img style="margin-right: 5px;" src="https://via.placeholder.com/250x173.png?text=Visit+WhoIsHostingThis.com+Buyers+Guide" /></div>
</div>
<p><br />Medicaid payments have been coming in and beginning in late May our first physician clients began receiving their year one Medicare Meaningful Use checks for up to $18,000. You can read on our blog about the first ICAN client to get paid. These payments represent the first step in the validation and fulfillment of ICAN''s Federal Stimulus Bonus Payment Guarantee Program, unique in the industry for guaranteeing federal Meaningful Use incentive payments, not just Meaningful Use certification. To learn more about our Guarantee. <a href="guaranteedpayment.aspx">click here</a></p>
<h3 class="post-title">Guaranteed Incentives, Nimble Technology</h3>
<p>How can we be so confident in our ability to meet Meaningful Use that we are willing to put our own money on the line?* And why do 100% of our clients share that confidence, according to our surveys, "Ambulatory EMR: On Track for Meaningful Use?" <br />Unlike traditional software or ASP-based EHRs, where all the work involved in meeting and tracking Meaningful Use performance falls on the practice, HITS provides a full-service solution with no extra or hidden costs. Our service includes, at no extra cost: </p>
<ul>
<li>Administrative support that takes on cumbersome tasks of registration and attestation with government agencies</li>
<li>Fully certified clinical quality measures built into the workflow with our proprietary HITS&reg;</li>
<li>A Meaningful Use Resource Center website where clients have access to all the information they need&mdash;at their fingertips</li>
<li>Expert performance coaching to guide and support clients through every stage of the process</li>
</ul>
<p>Here is a more detailed breakdown of how ICAN is addressing key Meaningful Use measures:</p>
<h3 class="post-title">Improved outcomes</h3>
<ul>
<li>Care Coordination (Electronically exchange information): Unlike most EHR offerings, <a href="#">athenaCommunicator&reg;</a>, with its Patient Portal and automated patient messaging, is designed to enhance patient involvement in their health care, enabling practices to meet these Meaningful Use measures.</li>
</ul>
<h3 class="post-title">Advanced clinical processes</h3>
<ul>
<li><strong>Use of e-Prescribing:</strong> MyHealthcareCompany is Surescripts&reg; certified for Prescription Benefit Eligibility, Formulary, and Reporting; Medication History (payer); Prescription Renewals (retail); and Prescription Routing for New Prescriptions (retail and mail-order).</li>
<li><strong>Closed Order Management: </strong>Because our EHR includes document management services, we make it easy for providers to create and send electronic orders from the encounter. Users can also track and close orders within the application for better follow-up and quality reporting.</li>
</ul>
<h3 class="post-title">Data capture and sharing</h3>
<ul>
<li><strong>Quality care and population management: </strong>MyHealthcareCompany&rsquo;s rules database provides a set of payer-specific quality measures and also allows for comprehensive and automatic demographic reporting.</li>
<li>Meaningful use offers an important opportunity for physicians to be financially rewarded for adopting an EHR that can effectively achieve measures. We at ICAN are here to help you navigate through the complexities of Meaningful Use, help you get all the incentive dollars you deserve, and free you from administrative red tape so you can focus on quality patient care.</li>
</ul>
<h3 class="post-title">Your Partner Through Reform and Change</h3>
<p>The HITECH Act and Meaningful Use is just one of many huge changes impacting physician practices today. Last year''s historic passage of the Patient Protection and Affordable Care Act set the stage for what will be some of the most significant changes to the U.S. health care system in a generation. To read in more detail about our perspective on the health care reform bill and our response to the challenges it presents, <a>click here</a></p>
<p>One recent manifestation of the reform bill was the release in March of the proposed rules for Accountable Care Organizations, or ACOs. To learn more about ACOs, what they might mean for your practice or organization, and how ICAN can help you navigate any payment future, <a href="cmp/ACO/_doc/ACO_NPRM_Summary.pdf">click here</a></p>
</div>
</div>', 2, N'Plagiarism Checks', N'plagiarism-checks', 8)
GO
INSERT [dbo].[ContentPages] ([Id], [NavTitle], [Content], [PageId], [Title], [Route], [PageOrder]) VALUES (20, N'Payroll Generation', N'<div class="blog-single">
<div class="post-content">
<h3 class="post-title">Achieving Meaningful Use with ICAN</h3>
<div class="row">
<div class="col-md-8">According to the 2009 HITECH Act, physicians are eligible to receive up to $44,000 in total incentives per physician from Medicaid for "Meaningful Use" of a certified Electronic Health Record (EHR) starting this year (2011). (Note: Physicians reimbursed by Medicaid can receive up to approximately $63,750 starting in 2011 based on state-defined guidelines.) In July 2010, the Center for Medicare and Medicaid Services (CMS) released their rule for the Stage 1 Meaningful Use requirements that physicians need to meet in order to receive their Meaningful Use incentives. For our in-depth analysis of the rule, <a>click here</a>.</div>
<div class="col-md-4"><img style="margin-right: 5px;" src="https://via.placeholder.com/250x173.png?text=Visit+WhoIsHostingThis.com+Buyers+Guide" /></div>
</div>
<p><br />Medicaid payments have been coming in and beginning in late May our first physician clients began receiving their year one Medicare Meaningful Use checks for up to $18,000. You can read on our blog about the first ICAN client to get paid. These payments represent the first step in the validation and fulfillment of ICAN''s Federal Stimulus Bonus Payment Guarantee Program, unique in the industry for guaranteeing federal Meaningful Use incentive payments, not just Meaningful Use certification. To learn more about our Guarantee. <a href="guaranteedpayment.aspx">click here</a></p>
<h3 class="post-title">Guaranteed Incentives, Nimble Technology</h3>
<p>How can we be so confident in our ability to meet Meaningful Use that we are willing to put our own money on the line?* And why do 100% of our clients share that confidence, according to our surveys, "Ambulatory EMR: On Track for Meaningful Use?" <br />Unlike traditional software or ASP-based EHRs, where all the work involved in meeting and tracking Meaningful Use performance falls on the practice, HITS provides a full-service solution with no extra or hidden costs. Our service includes, at no extra cost: </p>
<ul>
<li>Administrative support that takes on cumbersome tasks of registration and attestation with government agencies</li>
<li>Fully certified clinical quality measures built into the workflow with our proprietary HITS&reg;</li>
<li>A Meaningful Use Resource Center website where clients have access to all the information they need&mdash;at their fingertips</li>
<li>Expert performance coaching to guide and support clients through every stage of the process</li>
</ul>
<p>Here is a more detailed breakdown of how ICAN is addressing key Meaningful Use measures:</p>
<h3 class="post-title">Improved outcomes</h3>
<ul>
<li>Care Coordination (Electronically exchange information): Unlike most EHR offerings, <a href="#">athenaCommunicator&reg;</a>, with its Patient Portal and automated patient messaging, is designed to enhance patient involvement in their health care, enabling practices to meet these Meaningful Use measures.</li>
</ul>
<h3 class="post-title">Advanced clinical processes</h3>
<ul>
<li><strong>Use of e-Prescribing:</strong> MyHealthcareCompany is Surescripts&reg; certified for Prescription Benefit Eligibility, Formulary, and Reporting; Medication History (payer); Prescription Renewals (retail); and Prescription Routing for New Prescriptions (retail and mail-order).</li>
<li><strong>Closed Order Management: </strong>Because our EHR includes document management services, we make it easy for providers to create and send electronic orders from the encounter. Users can also track and close orders within the application for better follow-up and quality reporting.</li>
</ul>
<h3 class="post-title">Data capture and sharing</h3>
<ul>
<li><strong>Quality care and population management: </strong>MyHealthcareCompany&rsquo;s rules database provides a set of payer-specific quality measures and also allows for comprehensive and automatic demographic reporting.</li>
<li>Meaningful use offers an important opportunity for physicians to be financially rewarded for adopting an EHR that can effectively achieve measures. We at ICAN are here to help you navigate through the complexities of Meaningful Use, help you get all the incentive dollars you deserve, and free you from administrative red tape so you can focus on quality patient care.</li>
</ul>
<h3 class="post-title">Your Partner Through Reform and Change</h3>
<p>The HITECH Act and Meaningful Use is just one of many huge changes impacting physician practices today. Last year''s historic passage of the Patient Protection and Affordable Care Act set the stage for what will be some of the most significant changes to the U.S. health care system in a generation. To read in more detail about our perspective on the health care reform bill and our response to the challenges it presents, <a>click here</a></p>
<p>One recent manifestation of the reform bill was the release in March of the proposed rules for Accountable Care Organizations, or ACOs. To learn more about ACOs, what they might mean for your practice or organization, and how ICAN can help you navigate any payment future, <a href="cmp/ACO/_doc/ACO_NPRM_Summary.pdf">click here</a></p>
</div>
</div>', 2, N'Payroll Generation', N'payroll-generation', 10)
GO
INSERT [dbo].[ContentPages] ([Id], [NavTitle], [Content], [PageId], [Title], [Route], [PageOrder]) VALUES (22, N'E-Prescribing', N'<div class="blog-single">
<div class="post-content">
<h3 class="post-title">Achieving Meaningful Use with ICAN</h3>
<div class="row">
<div class="col-md-8">According to the 2009 HITECH Act, physicians are eligible to receive up to $44,000 in total incentives per physician from Medicaid for "Meaningful Use" of a certified Electronic Health Record (EHR) starting this year (2011). (Note: Physicians reimbursed by Medicaid can receive up to approximately $63,750 starting in 2011 based on state-defined guidelines.) In July 2010, the Center for Medicare and Medicaid Services (CMS) released their rule for the Stage 1 Meaningful Use requirements that physicians need to meet in order to receive their Meaningful Use incentives. For our in-depth analysis of the rule, <a>click here</a>.</div>
<div class="col-md-4"><img style="margin-right: 5px;" src="https://via.placeholder.com/250x173.png?text=Visit+WhoIsHostingThis.com+Buyers+Guide" /></div>
</div>
<p><br />Medicaid payments have been coming in and beginning in late May our first physician clients began receiving their year one Medicare Meaningful Use checks for up to $18,000. You can read on our blog about the first ICAN client to get paid. These payments represent the first step in the validation and fulfillment of ICAN''s Federal Stimulus Bonus Payment Guarantee Program, unique in the industry for guaranteeing federal Meaningful Use incentive payments, not just Meaningful Use certification. To learn more about our Guarantee. <a href="guaranteedpayment.aspx">click here</a></p>
<h3 class="post-title">Guaranteed Incentives, Nimble Technology</h3>
<p>How can we be so confident in our ability to meet Meaningful Use that we are willing to put our own money on the line?* And why do 100% of our clients share that confidence, according to our surveys, "Ambulatory EMR: On Track for Meaningful Use?" <br />Unlike traditional software or ASP-based EHRs, where all the work involved in meeting and tracking Meaningful Use performance falls on the practice, HITS provides a full-service solution with no extra or hidden costs. Our service includes, at no extra cost: </p>
<ul>
<li>Administrative support that takes on cumbersome tasks of registration and attestation with government agencies</li>
<li>Fully certified clinical quality measures built into the workflow with our proprietary HITS&reg;</li>
<li>A Meaningful Use Resource Center website where clients have access to all the information they need&mdash;at their fingertips</li>
<li>Expert performance coaching to guide and support clients through every stage of the process</li>
</ul>
<p>Here is a more detailed breakdown of how ICAN is addressing key Meaningful Use measures:</p>
<h3 class="post-title">Improved outcomes</h3>
<ul>
<li>Care Coordination (Electronically exchange information): Unlike most EHR offerings, <a href="#">athenaCommunicator&reg;</a>, with its Patient Portal and automated patient messaging, is designed to enhance patient involvement in their health care, enabling practices to meet these Meaningful Use measures.</li>
</ul>
<h3 class="post-title">Advanced clinical processes</h3>
<ul>
<li><strong>Use of e-Prescribing:</strong> MyHealthcareCompany is Surescripts&reg; certified for Prescription Benefit Eligibility, Formulary, and Reporting; Medication History (payer); Prescription Renewals (retail); and Prescription Routing for New Prescriptions (retail and mail-order).</li>
<li><strong>Closed Order Management: </strong>Because our EHR includes document management services, we make it easy for providers to create and send electronic orders from the encounter. Users can also track and close orders within the application for better follow-up and quality reporting.</li>
</ul>
<h3 class="post-title">Data capture and sharing</h3>
<ul>
<li><strong>Quality care and population management: </strong>MyHealthcareCompany&rsquo;s rules database provides a set of payer-specific quality measures and also allows for comprehensive and automatic demographic reporting.</li>
<li>Meaningful use offers an important opportunity for physicians to be financially rewarded for adopting an EHR that can effectively achieve measures. We at ICAN are here to help you navigate through the complexities of Meaningful Use, help you get all the incentive dollars you deserve, and free you from administrative red tape so you can focus on quality patient care.</li>
</ul>
<h3 class="post-title">Your Partner Through Reform and Change</h3>
<p>The HITECH Act and Meaningful Use is just one of many huge changes impacting physician practices today. Last year''s historic passage of the Patient Protection and Affordable Care Act set the stage for what will be some of the most significant changes to the U.S. health care system in a generation. To read in more detail about our perspective on the health care reform bill and our response to the challenges it presents, <a>click here</a></p>
<p>One recent manifestation of the reform bill was the release in March of the proposed rules for Accountable Care Organizations, or ACOs. To learn more about ACOs, what they might mean for your practice or organization, and how ICAN can help you navigate any payment future, <a href="cmp/ACO/_doc/ACO_NPRM_Summary.pdf">click here</a></p>
</div>
</div>', 2, N'E-Prescribing', N'E-prescribing', 12)
GO
INSERT [dbo].[ContentPages] ([Id], [NavTitle], [Content], [PageId], [Title], [Route], [PageOrder]) VALUES (23, N'Lab Results', N'<div class="blog-single">
<div class="post-content">
<h3 class="post-title">Achieving Meaningful Use with ICAN</h3>
<div class="row">
<div class="col-md-8">According to the 2009 HITECH Act, physicians are eligible to receive up to $44,000 in total incentives per physician from Medicaid for "Meaningful Use" of a certified Electronic Health Record (EHR) starting this year (2011). (Note: Physicians reimbursed by Medicaid can receive up to approximately $63,750 starting in 2011 based on state-defined guidelines.) In July 2010, the Center for Medicare and Medicaid Services (CMS) released their rule for the Stage 1 Meaningful Use requirements that physicians need to meet in order to receive their Meaningful Use incentives. For our in-depth analysis of the rule, <a>click here</a>.</div>
<div class="col-md-4"><img style="margin-right: 5px;" src="https://via.placeholder.com/250x173.png?text=Visit+WhoIsHostingThis.com+Buyers+Guide" /></div>
</div>
<p><br />Medicaid payments have been coming in and beginning in late May our first physician clients began receiving their year one Medicare Meaningful Use checks for up to $18,000. You can read on our blog about the first ICAN client to get paid. These payments represent the first step in the validation and fulfillment of ICAN''s Federal Stimulus Bonus Payment Guarantee Program, unique in the industry for guaranteeing federal Meaningful Use incentive payments, not just Meaningful Use certification. To learn more about our Guarantee. <a href="guaranteedpayment.aspx">click here</a></p>
<h3 class="post-title">Guaranteed Incentives, Nimble Technology</h3>
<p>How can we be so confident in our ability to meet Meaningful Use that we are willing to put our own money on the line?* And why do 100% of our clients share that confidence, according to our surveys, "Ambulatory EMR: On Track for Meaningful Use?" <br />Unlike traditional software or ASP-based EHRs, where all the work involved in meeting and tracking Meaningful Use performance falls on the practice, HITS provides a full-service solution with no extra or hidden costs. Our service includes, at no extra cost: </p>
<ul>
<li>Administrative support that takes on cumbersome tasks of registration and attestation with government agencies</li>
<li>Fully certified clinical quality measures built into the workflow with our proprietary HITS&reg;</li>
<li>A Meaningful Use Resource Center website where clients have access to all the information they need&mdash;at their fingertips</li>
<li>Expert performance coaching to guide and support clients through every stage of the process</li>
</ul>
<p>Here is a more detailed breakdown of how ICAN is addressing key Meaningful Use measures:</p>
<h3 class="post-title">Improved outcomes</h3>
<ul>
<li>Care Coordination (Electronically exchange information): Unlike most EHR offerings, <a href="#">athenaCommunicator&reg;</a>, with its Patient Portal and automated patient messaging, is designed to enhance patient involvement in their health care, enabling practices to meet these Meaningful Use measures.</li>
</ul>
<h3 class="post-title">Advanced clinical processes</h3>
<ul>
<li><strong>Use of e-Prescribing:</strong> MyHealthcareCompany is Surescripts&reg; certified for Prescription Benefit Eligibility, Formulary, and Reporting; Medication History (payer); Prescription Renewals (retail); and Prescription Routing for New Prescriptions (retail and mail-order).</li>
<li><strong>Closed Order Management: </strong>Because our EHR includes document management services, we make it easy for providers to create and send electronic orders from the encounter. Users can also track and close orders within the application for better follow-up and quality reporting.</li>
</ul>
<h3 class="post-title">Data capture and sharing</h3>
<ul>
<li><strong>Quality care and population management: </strong>MyHealthcareCompany&rsquo;s rules database provides a set of payer-specific quality measures and also allows for comprehensive and automatic demographic reporting.</li>
<li>Meaningful use offers an important opportunity for physicians to be financially rewarded for adopting an EHR that can effectively achieve measures. We at ICAN are here to help you navigate through the complexities of Meaningful Use, help you get all the incentive dollars you deserve, and free you from administrative red tape so you can focus on quality patient care.</li>
</ul>
<h3 class="post-title">Your Partner Through Reform and Change</h3>
<p>The HITECH Act and Meaningful Use is just one of many huge changes impacting physician practices today. Last year''s historic passage of the Patient Protection and Affordable Care Act set the stage for what will be some of the most significant changes to the U.S. health care system in a generation. To read in more detail about our perspective on the health care reform bill and our response to the challenges it presents, <a>click here</a></p>
<p>One recent manifestation of the reform bill was the release in March of the proposed rules for Accountable Care Organizations, or ACOs. To learn more about ACOs, what they might mean for your practice or organization, and how ICAN can help you navigate any payment future, <a href="cmp/ACO/_doc/ACO_NPRM_Summary.pdf">click here</a></p>
</div>
</div>', 2, N'Lab Results', N'lab-results', 13)
GO
INSERT [dbo].[ContentPages] ([Id], [NavTitle], [Content], [PageId], [Title], [Route], [PageOrder]) VALUES (24, N'Scheduling', N'<div class="blog-single">
<div class="post-content">
<h3 class="post-title">Achieving Meaningful Use with ICAN</h3>
<div class="row">
<div class="col-md-8">According to the 2009 HITECH Act, physicians are eligible to receive up to $44,000 in total incentives per physician from Medicaid for "Meaningful Use" of a certified Electronic Health Record (EHR) starting this year (2011). (Note: Physicians reimbursed by Medicaid can receive up to approximately $63,750 starting in 2011 based on state-defined guidelines.) In July 2010, the Center for Medicare and Medicaid Services (CMS) released their rule for the Stage 1 Meaningful Use requirements that physicians need to meet in order to receive their Meaningful Use incentives. For our in-depth analysis of the rule, <a>click here</a>.</div>
<div class="col-md-4"><img style="margin-right: 5px;" src="https://via.placeholder.com/250x173.png?text=Visit+WhoIsHostingThis.com+Buyers+Guide" /></div>
</div>
<p><br />Medicaid payments have been coming in and beginning in late May our first physician clients began receiving their year one Medicare Meaningful Use checks for up to $18,000. You can read on our blog about the first ICAN client to get paid. These payments represent the first step in the validation and fulfillment of ICAN''s Federal Stimulus Bonus Payment Guarantee Program, unique in the industry for guaranteeing federal Meaningful Use incentive payments, not just Meaningful Use certification. To learn more about our Guarantee. <a href="guaranteedpayment.aspx">click here</a></p>
<h3 class="post-title">Guaranteed Incentives, Nimble Technology</h3>
<p>How can we be so confident in our ability to meet Meaningful Use that we are willing to put our own money on the line?* And why do 100% of our clients share that confidence, according to our surveys, "Ambulatory EMR: On Track for Meaningful Use?" <br />Unlike traditional software or ASP-based EHRs, where all the work involved in meeting and tracking Meaningful Use performance falls on the practice, HITS provides a full-service solution with no extra or hidden costs. Our service includes, at no extra cost: </p>
<ul>
<li>Administrative support that takes on cumbersome tasks of registration and attestation with government agencies</li>
<li>Fully certified clinical quality measures built into the workflow with our proprietary HITS&reg;</li>
<li>A Meaningful Use Resource Center website where clients have access to all the information they need&mdash;at their fingertips</li>
<li>Expert performance coaching to guide and support clients through every stage of the process</li>
</ul>
<p>Here is a more detailed breakdown of how ICAN is addressing key Meaningful Use measures:</p>
<h3 class="post-title">Improved outcomes</h3>
<ul>
<li>Care Coordination (Electronically exchange information): Unlike most EHR offerings, <a href="#">athenaCommunicator&reg;</a>, with its Patient Portal and automated patient messaging, is designed to enhance patient involvement in their health care, enabling practices to meet these Meaningful Use measures.</li>
</ul>
<h3 class="post-title">Advanced clinical processes</h3>
<ul>
<li><strong>Use of e-Prescribing:</strong> MyHealthcareCompany is Surescripts&reg; certified for Prescription Benefit Eligibility, Formulary, and Reporting; Medication History (payer); Prescription Renewals (retail); and Prescription Routing for New Prescriptions (retail and mail-order).</li>
<li><strong>Closed Order Management: </strong>Because our EHR includes document management services, we make it easy for providers to create and send electronic orders from the encounter. Users can also track and close orders within the application for better follow-up and quality reporting.</li>
</ul>
<h3 class="post-title">Data capture and sharing</h3>
<ul>
<li><strong>Quality care and population management: </strong>MyHealthcareCompany&rsquo;s rules database provides a set of payer-specific quality measures and also allows for comprehensive and automatic demographic reporting.</li>
<li>Meaningful use offers an important opportunity for physicians to be financially rewarded for adopting an EHR that can effectively achieve measures. We at ICAN are here to help you navigate through the complexities of Meaningful Use, help you get all the incentive dollars you deserve, and free you from administrative red tape so you can focus on quality patient care.</li>
</ul>
<h3 class="post-title">Your Partner Through Reform and Change</h3>
<p>The HITECH Act and Meaningful Use is just one of many huge changes impacting physician practices today. Last year''s historic passage of the Patient Protection and Affordable Care Act set the stage for what will be some of the most significant changes to the U.S. health care system in a generation. To read in more detail about our perspective on the health care reform bill and our response to the challenges it presents, <a>click here</a></p>
<p>One recent manifestation of the reform bill was the release in March of the proposed rules for Accountable Care Organizations, or ACOs. To learn more about ACOs, what they might mean for your practice or organization, and how ICAN can help you navigate any payment future, <a href="cmp/ACO/_doc/ACO_NPRM_Summary.pdf">click here</a></p>
</div>
</div>', 2, N'Scheduling', N'Scheduling', 14)
GO
INSERT [dbo].[ContentPages] ([Id], [NavTitle], [Content], [PageId], [Title], [Route], [PageOrder]) VALUES (26, N'Company Profile', N'<div class="blog-single">
<div class="post-content">
<h3 class="post-title">Achieving Meaningful Use with ICAN</h3>
<div class="row">
<div class="col-md-8">According to the 2009 HITECH Act, physicians are eligible to receive up to $44,000 in total incentives per physician from Medicaid for "Meaningful Use" of a certified Electronic Health Record (EHR) starting this year (2011). (Note: Physicians reimbursed by Medicaid can receive up to approximately $63,750 starting in 2011 based on state-defined guidelines.) In July 2010, the Center for Medicare and Medicaid Services (CMS) released their rule for the Stage 1 Meaningful Use requirements that physicians need to meet in order to receive their Meaningful Use incentives. For our in-depth analysis of the rule, <a>click here</a>.</div>
<div class="col-md-4"><img style="margin-right: 5px;" src="https://via.placeholder.com/250x173.png?text=Visit+WhoIsHostingThis.com+Buyers+Guide" /></div>
</div>
<p><br />Medicaid payments have been coming in and beginning in late May our first physician clients began receiving their year one Medicare Meaningful Use checks for up to $18,000. You can read on our blog about the first ICAN client to get paid. These payments represent the first step in the validation and fulfillment of ICAN''s Federal Stimulus Bonus Payment Guarantee Program, unique in the industry for guaranteeing federal Meaningful Use incentive payments, not just Meaningful Use certification. To learn more about our Guarantee. <a href="guaranteedpayment.aspx">click here</a></p>
<h3 class="post-title">Guaranteed Incentives, Nimble Technology</h3>
<p>How can we be so confident in our ability to meet Meaningful Use that we are willing to put our own money on the line?* And why do 100% of our clients share that confidence, according to our surveys, "Ambulatory EMR: On Track for Meaningful Use?" <br />Unlike traditional software or ASP-based EHRs, where all the work involved in meeting and tracking Meaningful Use performance falls on the practice, HITS provides a full-service solution with no extra or hidden costs. Our service includes, at no extra cost: </p>
<ul>
<li>Administrative support that takes on cumbersome tasks of registration and attestation with government agencies</li>
<li>Fully certified clinical quality measures built into the workflow with our proprietary HITS&reg;</li>
<li>A Meaningful Use Resource Center website where clients have access to all the information they need&mdash;at their fingertips</li>
<li>Expert performance coaching to guide and support clients through every stage of the process</li>
</ul>
<p>Here is a more detailed breakdown of how ICAN is addressing key Meaningful Use measures:</p>
<h3 class="post-title">Improved outcomes</h3>
<ul>
<li>Care Coordination (Electronically exchange information): Unlike most EHR offerings, <a href="#">athenaCommunicator&reg;</a>, with its Patient Portal and automated patient messaging, is designed to enhance patient involvement in their health care, enabling practices to meet these Meaningful Use measures.</li>
</ul>
<h3 class="post-title">Advanced clinical processes</h3>
<ul>
<li><strong>Use of e-Prescribing:</strong> MyHealthcareCompany is Surescripts&reg; certified for Prescription Benefit Eligibility, Formulary, and Reporting; Medication History (payer); Prescription Renewals (retail); and Prescription Routing for New Prescriptions (retail and mail-order).</li>
<li><strong>Closed Order Management: </strong>Because our EHR includes document management services, we make it easy for providers to create and send electronic orders from the encounter. Users can also track and close orders within the application for better follow-up and quality reporting.</li>
</ul>
<h3 class="post-title">Data capture and sharing</h3>
<ul>
<li><strong>Quality care and population management: </strong>MyHealthcareCompany&rsquo;s rules database provides a set of payer-specific quality measures and also allows for comprehensive and automatic demographic reporting.</li>
<li>Meaningful use offers an important opportunity for physicians to be financially rewarded for adopting an EHR that can effectively achieve measures. We at ICAN are here to help you navigate through the complexities of Meaningful Use, help you get all the incentive dollars you deserve, and free you from administrative red tape so you can focus on quality patient care.</li>
</ul>
<h3 class="post-title">Your Partner Through Reform and Change</h3>
<p>The HITECH Act and Meaningful Use is just one of many huge changes impacting physician practices today. Last year''s historic passage of the Patient Protection and Affordable Care Act set the stage for what will be some of the most significant changes to the U.S. health care system in a generation. To read in more detail about our perspective on the health care reform bill and our response to the challenges it presents, <a>click here</a></p>
<p>One recent manifestation of the reform bill was the release in March of the proposed rules for Accountable Care Organizations, or ACOs. To learn more about ACOs, what they might mean for your practice or organization, and how ICAN can help you navigate any payment future, <a href="cmp/ACO/_doc/ACO_NPRM_Summary.pdf">click here</a></p>
</div>
</div>', 5, N'Company Profile', N'Company Profile', 0)
GO
INSERT [dbo].[ContentPages] ([Id], [NavTitle], [Content], [PageId], [Title], [Route], [PageOrder]) VALUES (27, N'Company', N'<p>Your Content here</p>', NULL, N'Company', N'company', 0)
GO
SET IDENTITY_INSERT [dbo].[ContentPages] OFF
GO
SET IDENTITY_INSERT [dbo].[ContentPages2] ON 
GO
INSERT [dbo].[ContentPages2] ([Id], [NavTitle], [Content], [PageId], [Title], [Route], [PageOrder]) VALUES (26, N'Company Profile', N'<div class="blog-single">
<div class="post-content">
<h3 class="post-title">Achieving Meaningful Use with ICAN</h3>
<div class="row">
<div class="col-md-8">According to the 2009 HITECH Act, physicians are eligible to receive up to $44,000 in total incentives per physician from Medicaid for "Meaningful Use" of a certified Electronic Health Record (EHR) starting this year (2011). (Note: Physicians reimbursed by Medicaid can receive up to approximately $63,750 starting in 2011 based on state-defined guidelines.) In July 2010, the Center for Medicare and Medicaid Services (CMS) released their rule for the Stage 1 Meaningful Use requirements that physicians need to meet in order to receive their Meaningful Use incentives. For our in-depth analysis of the rule, <a>click here</a>.</div>
<div class="col-md-4"><img style="margin-right: 5px;" src="https://via.placeholder.com/250x173.png?text=Visit+WhoIsHostingThis.com+Buyers+Guide" /></div>
</div>
<p><br />Medicaid payments have been coming in and beginning in late May our first physician clients began receiving their year one Medicare Meaningful Use checks for up to $18,000. You can read on our blog about the first ICAN client to get paid. These payments represent the first step in the validation and fulfillment of ICAN''s Federal Stimulus Bonus Payment Guarantee Program, unique in the industry for guaranteeing federal Meaningful Use incentive payments, not just Meaningful Use certification. To learn more about our Guarantee. <a href="guaranteedpayment.aspx">click here</a></p>
<h3 class="post-title">Guaranteed Incentives, Nimble Technology</h3>
<p>How can we be so confident in our ability to meet Meaningful Use that we are willing to put our own money on the line?* And why do 100% of our clients share that confidence, according to our surveys, "Ambulatory EMR: On Track for Meaningful Use?" <br />Unlike traditional software or ASP-based EHRs, where all the work involved in meeting and tracking Meaningful Use performance falls on the practice, HITS provides a full-service solution with no extra or hidden costs. Our service includes, at no extra cost: </p>
<ul>
<li>Administrative support that takes on cumbersome tasks of registration and attestation with government agencies</li>
<li>Fully certified clinical quality measures built into the workflow with our proprietary HITS&reg;</li>
<li>A Meaningful Use Resource Center website where clients have access to all the information they need&mdash;at their fingertips</li>
<li>Expert performance coaching to guide and support clients through every stage of the process</li>
</ul>
<p>Here is a more detailed breakdown of how ICAN is addressing key Meaningful Use measures:</p>
<h3 class="post-title">Improved outcomes</h3>
<ul>
<li>Care Coordination (Electronically exchange information): Unlike most EHR offerings, <a href="#">athenaCommunicator&reg;</a>, with its Patient Portal and automated patient messaging, is designed to enhance patient involvement in their health care, enabling practices to meet these Meaningful Use measures.</li>
</ul>
<h3 class="post-title">Advanced clinical processes</h3>
<ul>
<li><strong>Use of e-Prescribing:</strong> MyHealthcareCompany is Surescripts&reg; certified for Prescription Benefit Eligibility, Formulary, and Reporting; Medication History (payer); Prescription Renewals (retail); and Prescription Routing for New Prescriptions (retail and mail-order).</li>
<li><strong>Closed Order Management: </strong>Because our EHR includes document management services, we make it easy for providers to create and send electronic orders from the encounter. Users can also track and close orders within the application for better follow-up and quality reporting.</li>
</ul>
<h3 class="post-title">Data capture and sharing</h3>
<ul>
<li><strong>Quality care and population management: </strong>MyHealthcareCompany&rsquo;s rules database provides a set of payer-specific quality measures and also allows for comprehensive and automatic demographic reporting.</li>
<li>Meaningful use offers an important opportunity for physicians to be financially rewarded for adopting an EHR that can effectively achieve measures. We at ICAN are here to help you navigate through the complexities of Meaningful Use, help you get all the incentive dollars you deserve, and free you from administrative red tape so you can focus on quality patient care.</li>
</ul>
<h3 class="post-title">Your Partner Through Reform and Change</h3>
<p>The HITECH Act and Meaningful Use is just one of many huge changes impacting physician practices today. Last year''s historic passage of the Patient Protection and Affordable Care Act set the stage for what will be some of the most significant changes to the U.S. health care system in a generation. To read in more detail about our perspective on the health care reform bill and our response to the challenges it presents, <a>click here</a></p>
<p>One recent manifestation of the reform bill was the release in March of the proposed rules for Accountable Care Organizations, or ACOs. To learn more about ACOs, what they might mean for your practice or organization, and how ICAN can help you navigate any payment future, <a href="cmp/ACO/_doc/ACO_NPRM_Summary.pdf">click here</a></p>
</div>
</div>', 5, N'Company Profile', N'Company Profile', 0)
GO
SET IDENTITY_INSERT [dbo].[ContentPages2] OFF
GO
SET IDENTITY_INSERT [dbo].[ContentPages3] ON 
GO
INSERT [dbo].[ContentPages3] ([Id], [NavTitle], [Content], [PageId], [Title], [Route], [PageOrder]) VALUES (1, N'Pocket $63K', N'<div class="blog-single">
<div class="post-content">
<h3 class="post-title">Achieving Meaningful Use with ICAN</h3>
<div class="row">
<div class="col-md-8">According to the 2009 HITECH Act, physicians are eligible to receive up to $44,000 in total incentives per physician from Medicaid for "Meaningful Use" of a certified Electronic Health Record (EHR) starting this year (2011). (Note: Physicians reimbursed by Medicaid can receive up to approximately $63,750 starting in 2011 based on state-defined guidelines.) In July 2010, the Center for Medicare and Medicaid Services (CMS) released their rule for the Stage 1 Meaningful Use requirements that physicians need to meet in order to receive their Meaningful Use incentives. For our in-depth analysis of the rule, <a>click here</a>.</div>
<div class="col-md-4"><img style="margin-right: 5px;" src="../../Public/Content/82c9f442-07e0-4119-a7b3-0b4732b11474.png" width="367" height="197" /></div>
</div>
<p><br />Medicaid payments have been coming in and beginning in late May our first physician clients began receiving their year one Medicare Meaningful Use checks for up to $18,000. You can read on our blog about the first ICAN client to get paid. These payments represent the first step in the validation and fulfillment of ICAN''s Federal Stimulus Bonus Payment Guarantee Program, unique in the industry for guaranteeing federal Meaningful Use incentive payments, not just Meaningful Use certification. To learn more about our Guarantee. <a href="guaranteedpayment.aspx">click here</a></p>
<h3 class="post-title">Guaranteed Incentives, Nimble Technology</h3>
<p>How can we be so confident in our ability to meet Meaningful Use that we are willing to put our own money on the line?* And why do 100% of our clients share that confidence, according to our surveys, "Ambulatory EMR: On Track for Meaningful Use?" <br />Unlike traditional software or ASP-based EHRs, where all the work involved in meeting and tracking Meaningful Use performance falls on the practice, HITS provides a full-service solution with no extra or hidden costs. Our service includes, at no extra cost:</p>
<ul>
<li>Administrative support that takes on cumbersome tasks of registration and attestation with government agencies</li>
<li>Fully certified clinical quality measures built into the workflow with our proprietary HITS&reg;</li>
<li>A Meaningful Use Resource Center website where clients have access to all the information they need&mdash;at their fingertips</li>
<li>Expert performance coaching to guide and support clients through every stage of the process</li>
</ul>
<p>Here is a more detailed breakdown of how ICAN is addressing key Meaningful Use measures:</p>
<h3 class="post-title">Improved outcomes</h3>
<ul>
<li>Care Coordination (Electronically exchange information): Unlike most EHR offerings, <a href="#">athenaCommunicator&reg;</a>, with its Patient Portal and automated patient messaging, is designed to enhance patient involvement in their health care, enabling practices to meet these Meaningful Use measures.</li>
</ul>
<h3 class="post-title">Advanced clinical processes</h3>
<ul>
<li><strong>Use of e-Prescribing:</strong> MyHealthcareCompany is Surescripts&reg; certified for Prescription Benefit Eligibility, Formulary, and Reporting; Medication History (payer); Prescription Renewals (retail); and Prescription Routing for New Prescriptions (retail and mail-order).</li>
<li><strong>Closed Order Management: </strong>Because our EHR includes document management services, we make it easy for providers to create and send electronic orders from the encounter. Users can also track and close orders within the application for better follow-up and quality reporting.</li>
</ul>
<h3 class="post-title">Data capture and sharing</h3>
<ul>
<li><strong>Quality care and population management: </strong>MyHealthcareCompany&rsquo;s rules database provides a set of payer-specific quality measures and also allows for comprehensive and automatic demographic reporting.</li>
<li>Meaningful use offers an important opportunity for physicians to be financially rewarded for adopting an EHR that can effectively achieve measures. We at ICAN are here to help you navigate through the complexities of Meaningful Use, help you get all the incentive dollars you deserve, and free you from administrative red tape so you can focus on quality patient care.</li>
</ul>
<h3 class="post-title">Your Partner Through Reform and Change</h3>
<p>The HITECH Act and Meaningful Use is just one of many huge changes impacting physician practices today. Last year''s historic passage of the Patient Protection and Affordable Care Act set the stage for what will be some of the most significant changes to the U.S. health care system in a generation. To read in more detail about our perspective on the health care reform bill and our response to the challenges it presents, <a>click here</a></p>
<p>One recent manifestation of the reform bill was the release in March of the proposed rules for Accountable Care Organizations, or ACOs. To learn more about ACOs, what they might mean for your practice or organization, and how ICAN can help you navigate any payment future, <a href="cmp/ACO/_doc/ACO_NPRM_Summary.pdf">click here</a></p>
</div>
</div>', NULL, N'Pocket 63K', N'pocket-63k', 2)
GO
INSERT [dbo].[ContentPages3] ([Id], [NavTitle], [Content], [PageId], [Title], [Route], [PageOrder]) VALUES (2, N'Features', N'<div class="blog-single">
<div class="post-content">
<h3 class="post-title">Achieving Meaningful Use with ICAN</h3>
<div class="row">
<div class="col-md-8">According to the 2009 HITECH Act, physicians are eligible to receive up to $44,000 in total incentives per physician from Medicaid for "Meaningful Use" of a certified Electronic Health Record (EHR) starting this year (2011). (Note: Physicians reimbursed by Medicaid can receive up to approximately $63,750 starting in 2011 based on state-defined guidelines.) In July 2010, the Center for Medicare and Medicaid Services (CMS) released their rule for the Stage 1 Meaningful Use requirements that physicians need to meet in order to receive their Meaningful Use incentives. For our in-depth analysis of the rule, <a>click here</a>.</div>
<div class="col-md-4"><img style="margin-right: 5px;" src="https://via.placeholder.com/250x173.png?text=Visit+WhoIsHostingThis.com+Buyers+Guide" /></div>
</div>
<p><br />Medicaid payments have been coming in and beginning in late May our first physician clients began receiving their year one Medicare Meaningful Use checks for up to $18,000. You can read on our blog about the first ICAN client to get paid. These payments represent the first step in the validation and fulfillment of ICAN''s Federal Stimulus Bonus Payment Guarantee Program, unique in the industry for guaranteeing federal Meaningful Use incentive payments, not just Meaningful Use certification. To learn more about our Guarantee. <a href="guaranteedpayment.aspx">click here</a></p>
<h3 class="post-title">Guaranteed Incentives, Nimble Technology</h3>
<p>How can we be so confident in our ability to meet Meaningful Use that we are willing to put our own money on the line?* And why do 100% of our clients share that confidence, according to our surveys, "Ambulatory EMR: On Track for Meaningful Use?" <br />Unlike traditional software or ASP-based EHRs, where all the work involved in meeting and tracking Meaningful Use performance falls on the practice, HITS provides a full-service solution with no extra or hidden costs. Our service includes, at no extra cost: </p>
<ul>
<li>Administrative support that takes on cumbersome tasks of registration and attestation with government agencies</li>
<li>Fully certified clinical quality measures built into the workflow with our proprietary HITS&reg;</li>
<li>A Meaningful Use Resource Center website where clients have access to all the information they need&mdash;at their fingertips</li>
<li>Expert performance coaching to guide and support clients through every stage of the process</li>
</ul>
<p>Here is a more detailed breakdown of how ICAN is addressing key Meaningful Use measures:</p>
<h3 class="post-title">Improved outcomes</h3>
<ul>
<li>Care Coordination (Electronically exchange information): Unlike most EHR offerings, <a href="#">athenaCommunicator&reg;</a>, with its Patient Portal and automated patient messaging, is designed to enhance patient involvement in their health care, enabling practices to meet these Meaningful Use measures.</li>
</ul>
<h3 class="post-title">Advanced clinical processes</h3>
<ul>
<li><strong>Use of e-Prescribing:</strong> MyHealthcareCompany is Surescripts&reg; certified for Prescription Benefit Eligibility, Formulary, and Reporting; Medication History (payer); Prescription Renewals (retail); and Prescription Routing for New Prescriptions (retail and mail-order).</li>
<li><strong>Closed Order Management: </strong>Because our EHR includes document management services, we make it easy for providers to create and send electronic orders from the encounter. Users can also track and close orders within the application for better follow-up and quality reporting.</li>
</ul>
<h3 class="post-title">Data capture and sharing</h3>
<ul>
<li><strong>Quality care and population management: </strong>MyHealthcareCompany&rsquo;s rules database provides a set of payer-specific quality measures and also allows for comprehensive and automatic demographic reporting.</li>
<li>Meaningful use offers an important opportunity for physicians to be financially rewarded for adopting an EHR that can effectively achieve measures. We at ICAN are here to help you navigate through the complexities of Meaningful Use, help you get all the incentive dollars you deserve, and free you from administrative red tape so you can focus on quality patient care.</li>
</ul>
<h3 class="post-title">Your Partner Through Reform and Change</h3>
<p>The HITECH Act and Meaningful Use is just one of many huge changes impacting physician practices today. Last year''s historic passage of the Patient Protection and Affordable Care Act set the stage for what will be some of the most significant changes to the U.S. health care system in a generation. To read in more detail about our perspective on the health care reform bill and our response to the challenges it presents, <a>click here</a></p>
<p>One recent manifestation of the reform bill was the release in March of the proposed rules for Accountable Care Organizations, or ACOs. To learn more about ACOs, what they might mean for your practice or organization, and how ICAN can help you navigate any payment future, <a href="cmp/ACO/_doc/ACO_NPRM_Summary.pdf">click here</a></p>
</div>
</div>', NULL, N'Features', N'features', 3)
GO
INSERT [dbo].[ContentPages3] ([Id], [NavTitle], [Content], [PageId], [Title], [Route], [PageOrder]) VALUES (3, N'Pricing', N'<div class="blog-single">
<div class="post-content">
<h3 class="post-title">Achieving Meaningful Use with ICAN</h3>
<div class="row">
<div class="col-md-8">According to the 2009 HITECH Act, physicians are eligible to receive up to $44,000 in total incentives per physician from Medicaid for "Meaningful Use" of a certified Electronic Health Record (EHR) starting this year (2011). (Note: Physicians reimbursed by Medicaid can receive up to approximately $63,750 starting in 2011 based on state-defined guidelines.) In July 2010, the Center for Medicare and Medicaid Services (CMS) released their rule for the Stage 1 Meaningful Use requirements that physicians need to meet in order to receive their Meaningful Use incentives. For our in-depth analysis of the rule, <a>click here</a>.</div>
<div class="col-md-4"><img style="margin-right: 5px;" src="https://via.placeholder.com/250x173.png?text=Visit+WhoIsHostingThis.com+Buyers+Guide" /></div>
</div>
<p><br />Medicaid payments have been coming in and beginning in late May our first physician clients began receiving their year one Medicare Meaningful Use checks for up to $18,000. You can read on our blog about the first ICAN client to get paid. These payments represent the first step in the validation and fulfillment of ICAN''s Federal Stimulus Bonus Payment Guarantee Program, unique in the industry for guaranteeing federal Meaningful Use incentive payments, not just Meaningful Use certification. To learn more about our Guarantee. <a href="guaranteedpayment.aspx">click here</a></p>
<h3 class="post-title">Guaranteed Incentives, Nimble Technology</h3>
<p>How can we be so confident in our ability to meet Meaningful Use that we are willing to put our own money on the line?* And why do 100% of our clients share that confidence, according to our surveys, "Ambulatory EMR: On Track for Meaningful Use?" <br />Unlike traditional software or ASP-based EHRs, where all the work involved in meeting and tracking Meaningful Use performance falls on the practice, HITS provides a full-service solution with no extra or hidden costs. Our service includes, at no extra cost: </p>
<ul>
<li>Administrative support that takes on cumbersome tasks of registration and attestation with government agencies</li>
<li>Fully certified clinical quality measures built into the workflow with our proprietary HITS&reg;</li>
<li>A Meaningful Use Resource Center website where clients have access to all the information they need&mdash;at their fingertips</li>
<li>Expert performance coaching to guide and support clients through every stage of the process</li>
</ul>
<p>Here is a more detailed breakdown of how ICAN is addressing key Meaningful Use measures:</p>
<h3 class="post-title">Improved outcomes</h3>
<ul>
<li>Care Coordination (Electronically exchange information): Unlike most EHR offerings, <a href="#">athenaCommunicator&reg;</a>, with its Patient Portal and automated patient messaging, is designed to enhance patient involvement in their health care, enabling practices to meet these Meaningful Use measures.</li>
</ul>
<h3 class="post-title">Advanced clinical processes</h3>
<ul>
<li><strong>Use of e-Prescribing:</strong> MyHealthcareCompany is Surescripts&reg; certified for Prescription Benefit Eligibility, Formulary, and Reporting; Medication History (payer); Prescription Renewals (retail); and Prescription Routing for New Prescriptions (retail and mail-order).</li>
<li><strong>Closed Order Management: </strong>Because our EHR includes document management services, we make it easy for providers to create and send electronic orders from the encounter. Users can also track and close orders within the application for better follow-up and quality reporting.</li>
</ul>
<h3 class="post-title">Data capture and sharing</h3>
<ul>
<li><strong>Quality care and population management: </strong>MyHealthcareCompany&rsquo;s rules database provides a set of payer-specific quality measures and also allows for comprehensive and automatic demographic reporting.</li>
<li>Meaningful use offers an important opportunity for physicians to be financially rewarded for adopting an EHR that can effectively achieve measures. We at ICAN are here to help you navigate through the complexities of Meaningful Use, help you get all the incentive dollars you deserve, and free you from administrative red tape so you can focus on quality patient care.</li>
</ul>
<h3 class="post-title">Your Partner Through Reform and Change</h3>
<p>The HITECH Act and Meaningful Use is just one of many huge changes impacting physician practices today. Last year''s historic passage of the Patient Protection and Affordable Care Act set the stage for what will be some of the most significant changes to the U.S. health care system in a generation. To read in more detail about our perspective on the health care reform bill and our response to the challenges it presents, <a>click here</a></p>
<p>One recent manifestation of the reform bill was the release in March of the proposed rules for Accountable Care Organizations, or ACOs. To learn more about ACOs, what they might mean for your practice or organization, and how ICAN can help you navigate any payment future, <a href="cmp/ACO/_doc/ACO_NPRM_Summary.pdf">click here</a></p>
</div>
</div>', NULL, N'Pricing', N'pricing', 4)
GO
INSERT [dbo].[ContentPages3] ([Id], [NavTitle], [Content], [PageId], [Title], [Route], [PageOrder]) VALUES (4, N'FAQ', N'<div class="blog-single">
<div class="post-content">
<h3 class="post-title">Achieving Meaningful Use with ICAN</h3>
<div class="row">
<div class="col-md-8">According to the 2009 HITECH Act, physicians are eligible to receive up to $44,000 in total incentives per physician from Medicaid for "Meaningful Use" of a certified Electronic Health Record (EHR) starting this year (2011). (Note: Physicians reimbursed by Medicaid can receive up to approximately $63,750 starting in 2011 based on state-defined guidelines.) In July 2010, the Center for Medicare and Medicaid Services (CMS) released their rule for the Stage 1 Meaningful Use requirements that physicians need to meet in order to receive their Meaningful Use incentives. For our in-depth analysis of the rule, <a>click here</a>.</div>
<div class="col-md-4"><img style="margin-right: 5px;" src="https://via.placeholder.com/250x173.png?text=Visit+WhoIsHostingThis.com+Buyers+Guide" /></div>
</div>
<p><br />Medicaid payments have been coming in and beginning in late May our first physician clients began receiving their year one Medicare Meaningful Use checks for up to $18,000. You can read on our blog about the first ICAN client to get paid. These payments represent the first step in the validation and fulfillment of ICAN''s Federal Stimulus Bonus Payment Guarantee Program, unique in the industry for guaranteeing federal Meaningful Use incentive payments, not just Meaningful Use certification. To learn more about our Guarantee. <a href="guaranteedpayment.aspx">click here</a></p>
<h3 class="post-title">Guaranteed Incentives, Nimble Technology</h3>
<p>How can we be so confident in our ability to meet Meaningful Use that we are willing to put our own money on the line?* And why do 100% of our clients share that confidence, according to our surveys, "Ambulatory EMR: On Track for Meaningful Use?" <br />Unlike traditional software or ASP-based EHRs, where all the work involved in meeting and tracking Meaningful Use performance falls on the practice, HITS provides a full-service solution with no extra or hidden costs. Our service includes, at no extra cost: </p>
<ul>
<li>Administrative support that takes on cumbersome tasks of registration and attestation with government agencies</li>
<li>Fully certified clinical quality measures built into the workflow with our proprietary HITS&reg;</li>
<li>A Meaningful Use Resource Center website where clients have access to all the information they need&mdash;at their fingertips</li>
<li>Expert performance coaching to guide and support clients through every stage of the process</li>
</ul>
<p>Here is a more detailed breakdown of how ICAN is addressing key Meaningful Use measures:</p>
<h3 class="post-title">Improved outcomes</h3>
<ul>
<li>Care Coordination (Electronically exchange information): Unlike most EHR offerings, <a href="#">athenaCommunicator&reg;</a>, with its Patient Portal and automated patient messaging, is designed to enhance patient involvement in their health care, enabling practices to meet these Meaningful Use measures.</li>
</ul>
<h3 class="post-title">Advanced clinical processes</h3>
<ul>
<li><strong>Use of e-Prescribing:</strong> MyHealthcareCompany is Surescripts&reg; certified for Prescription Benefit Eligibility, Formulary, and Reporting; Medication History (payer); Prescription Renewals (retail); and Prescription Routing for New Prescriptions (retail and mail-order).</li>
<li><strong>Closed Order Management: </strong>Because our EHR includes document management services, we make it easy for providers to create and send electronic orders from the encounter. Users can also track and close orders within the application for better follow-up and quality reporting.</li>
</ul>
<h3 class="post-title">Data capture and sharing</h3>
<ul>
<li><strong>Quality care and population management: </strong>MyHealthcareCompany&rsquo;s rules database provides a set of payer-specific quality measures and also allows for comprehensive and automatic demographic reporting.</li>
<li>Meaningful use offers an important opportunity for physicians to be financially rewarded for adopting an EHR that can effectively achieve measures. We at ICAN are here to help you navigate through the complexities of Meaningful Use, help you get all the incentive dollars you deserve, and free you from administrative red tape so you can focus on quality patient care.</li>
</ul>
<h3 class="post-title">Your Partner Through Reform and Change</h3>
<p>The HITECH Act and Meaningful Use is just one of many huge changes impacting physician practices today. Last year''s historic passage of the Patient Protection and Affordable Care Act set the stage for what will be some of the most significant changes to the U.S. health care system in a generation. To read in more detail about our perspective on the health care reform bill and our response to the challenges it presents, <a>click here</a></p>
<p>One recent manifestation of the reform bill was the release in March of the proposed rules for Accountable Care Organizations, or ACOs. To learn more about ACOs, what they might mean for your practice or organization, and how ICAN can help you navigate any payment future, <a href="cmp/ACO/_doc/ACO_NPRM_Summary.pdf">click here</a></p>
</div>
</div>', NULL, N'FAQ', N'faq', 5)
GO
INSERT [dbo].[ContentPages3] ([Id], [NavTitle], [Content], [PageId], [Title], [Route], [PageOrder]) VALUES (5, N'About Us', N'<div class="blog-single">
<div class="post-content">
<h3 class="post-title">Achieving Meaningful Use with ICAN</h3>
<div class="row">
<div class="col-md-8">According to the 2009 HITECH Act, physicians are eligible to receive up to $44,000 in total incentives per physician from Medicaid for "Meaningful Use" of a certified Electronic Health Record (EHR) starting this year (2011). (Note: Physicians reimbursed by Medicaid can receive up to approximately $63,750 starting in 2011 based on state-defined guidelines.) In July 2010, the Center for Medicare and Medicaid Services (CMS) released their rule for the Stage 1 Meaningful Use requirements that physicians need to meet in order to receive their Meaningful Use incentives. For our in-depth analysis of the rule, <a>click here</a>.</div>
<div class="col-md-4"><img style="margin-right: 5px;" src="https://via.placeholder.com/250x173.png?text=Visit+WhoIsHostingThis.com+Buyers+Guide" /></div>
</div>
<p><br />Medicaid payments have been coming in and beginning in late May our first physician clients began receiving their year one Medicare Meaningful Use checks for up to $18,000. You can read on our blog about the first ICAN client to get paid. These payments represent the first step in the validation and fulfillment of ICAN''s Federal Stimulus Bonus Payment Guarantee Program, unique in the industry for guaranteeing federal Meaningful Use incentive payments, not just Meaningful Use certification. To learn more about our Guarantee. <a href="guaranteedpayment.aspx">click here</a></p>
<h3 class="post-title">Guaranteed Incentives, Nimble Technology</h3>
<p>How can we be so confident in our ability to meet Meaningful Use that we are willing to put our own money on the line?* And why do 100% of our clients share that confidence, according to our surveys, "Ambulatory EMR: On Track for Meaningful Use?" <br />Unlike traditional software or ASP-based EHRs, where all the work involved in meeting and tracking Meaningful Use performance falls on the practice, HITS provides a full-service solution with no extra or hidden costs. Our service includes, at no extra cost: </p>
<ul>
<li>Administrative support that takes on cumbersome tasks of registration and attestation with government agencies</li>
<li>Fully certified clinical quality measures built into the workflow with our proprietary HITS&reg;</li>
<li>A Meaningful Use Resource Center website where clients have access to all the information they need&mdash;at their fingertips</li>
<li>Expert performance coaching to guide and support clients through every stage of the process</li>
</ul>
<p>Here is a more detailed breakdown of how ICAN is addressing key Meaningful Use measures:</p>
<h3 class="post-title">Improved outcomes</h3>
<ul>
<li>Care Coordination (Electronically exchange information): Unlike most EHR offerings, <a href="#">athenaCommunicator&reg;</a>, with its Patient Portal and automated patient messaging, is designed to enhance patient involvement in their health care, enabling practices to meet these Meaningful Use measures.</li>
</ul>
<h3 class="post-title">Advanced clinical processes</h3>
<ul>
<li><strong>Use of e-Prescribing:</strong> MyHealthcareCompany is Surescripts&reg; certified for Prescription Benefit Eligibility, Formulary, and Reporting; Medication History (payer); Prescription Renewals (retail); and Prescription Routing for New Prescriptions (retail and mail-order).</li>
<li><strong>Closed Order Management: </strong>Because our EHR includes document management services, we make it easy for providers to create and send electronic orders from the encounter. Users can also track and close orders within the application for better follow-up and quality reporting.</li>
</ul>
<h3 class="post-title">Data capture and sharing</h3>
<ul>
<li><strong>Quality care and population management: </strong>MyHealthcareCompany&rsquo;s rules database provides a set of payer-specific quality measures and also allows for comprehensive and automatic demographic reporting.</li>
<li>Meaningful use offers an important opportunity for physicians to be financially rewarded for adopting an EHR that can effectively achieve measures. We at ICAN are here to help you navigate through the complexities of Meaningful Use, help you get all the incentive dollars you deserve, and free you from administrative red tape so you can focus on quality patient care.</li>
</ul>
<h3 class="post-title">Your Partner Through Reform and Change</h3>
<p>The HITECH Act and Meaningful Use is just one of many huge changes impacting physician practices today. Last year''s historic passage of the Patient Protection and Affordable Care Act set the stage for what will be some of the most significant changes to the U.S. health care system in a generation. To read in more detail about our perspective on the health care reform bill and our response to the challenges it presents, <a>click here</a></p>
<p>One recent manifestation of the reform bill was the release in March of the proposed rules for Accountable Care Organizations, or ACOs. To learn more about ACOs, what they might mean for your practice or organization, and how ICAN can help you navigate any payment future, <a href="cmp/ACO/_doc/ACO_NPRM_Summary.pdf">click here</a></p>
</div>
</div>', NULL, N'About Us', N'about', 6)
GO
INSERT [dbo].[ContentPages3] ([Id], [NavTitle], [Content], [PageId], [Title], [Route], [PageOrder]) VALUES (6, N'Contact Us', N'<div class="blog-single">
<div class="post-content">
<h3 class="post-title">Achieving Meaningful Use with ICAN</h3>
<div class="row">
<div class="col-md-8">According to the 2009 HITECH Act, physicians are eligible to receive up to $44,000 in total incentives per physician from Medicaid for "Meaningful Use" of a certified Electronic Health Record (EHR) starting this year (2011). (Note: Physicians reimbursed by Medicaid can receive up to approximately $63,750 starting in 2011 based on state-defined guidelines.) In July 2010, the Center for Medicare and Medicaid Services (CMS) released their rule for the Stage 1 Meaningful Use requirements that physicians need to meet in order to receive their Meaningful Use incentives. For our in-depth analysis of the rule, <a>click here</a>.</div>
<div class="col-md-4"><img style="margin-right: 5px;" src="https://via.placeholder.com/250x173.png?text=Visit+WhoIsHostingThis.com+Buyers+Guide" /></div>
</div>
<p><br />Medicaid payments have been coming in and beginning in late May our first physician clients began receiving their year one Medicare Meaningful Use checks for up to $18,000. You can read on our blog about the first ICAN client to get paid. These payments represent the first step in the validation and fulfillment of ICAN''s Federal Stimulus Bonus Payment Guarantee Program, unique in the industry for guaranteeing federal Meaningful Use incentive payments, not just Meaningful Use certification. To learn more about our Guarantee. <a href="guaranteedpayment.aspx">click here</a></p>
<h3 class="post-title">Guaranteed Incentives, Nimble Technology</h3>
<p>How can we be so confident in our ability to meet Meaningful Use that we are willing to put our own money on the line?* And why do 100% of our clients share that confidence, according to our surveys, "Ambulatory EMR: On Track for Meaningful Use?" <br />Unlike traditional software or ASP-based EHRs, where all the work involved in meeting and tracking Meaningful Use performance falls on the practice, HITS provides a full-service solution with no extra or hidden costs. Our service includes, at no extra cost: </p>
<ul>
<li>Administrative support that takes on cumbersome tasks of registration and attestation with government agencies</li>
<li>Fully certified clinical quality measures built into the workflow with our proprietary HITS&reg;</li>
<li>A Meaningful Use Resource Center website where clients have access to all the information they need&mdash;at their fingertips</li>
<li>Expert performance coaching to guide and support clients through every stage of the process</li>
</ul>
<p>Here is a more detailed breakdown of how ICAN is addressing key Meaningful Use measures:</p>
<h3 class="post-title">Improved outcomes</h3>
<ul>
<li>Care Coordination (Electronically exchange information): Unlike most EHR offerings, <a href="#">athenaCommunicator&reg;</a>, with its Patient Portal and automated patient messaging, is designed to enhance patient involvement in their health care, enabling practices to meet these Meaningful Use measures.</li>
</ul>
<h3 class="post-title">Advanced clinical processes</h3>
<ul>
<li><strong>Use of e-Prescribing:</strong> MyHealthcareCompany is Surescripts&reg; certified for Prescription Benefit Eligibility, Formulary, and Reporting; Medication History (payer); Prescription Renewals (retail); and Prescription Routing for New Prescriptions (retail and mail-order).</li>
<li><strong>Closed Order Management: </strong>Because our EHR includes document management services, we make it easy for providers to create and send electronic orders from the encounter. Users can also track and close orders within the application for better follow-up and quality reporting.</li>
</ul>
<h3 class="post-title">Data capture and sharing</h3>
<ul>
<li><strong>Quality care and population management: </strong>MyHealthcareCompany&rsquo;s rules database provides a set of payer-specific quality measures and also allows for comprehensive and automatic demographic reporting.</li>
<li>Meaningful use offers an important opportunity for physicians to be financially rewarded for adopting an EHR that can effectively achieve measures. We at ICAN are here to help you navigate through the complexities of Meaningful Use, help you get all the incentive dollars you deserve, and free you from administrative red tape so you can focus on quality patient care.</li>
</ul>
<h3 class="post-title">Your Partner Through Reform and Change</h3>
<p>The HITECH Act and Meaningful Use is just one of many huge changes impacting physician practices today. Last year''s historic passage of the Patient Protection and Affordable Care Act set the stage for what will be some of the most significant changes to the U.S. health care system in a generation. To read in more detail about our perspective on the health care reform bill and our response to the challenges it presents, <a>click here</a></p>
<p>One recent manifestation of the reform bill was the release in March of the proposed rules for Accountable Care Organizations, or ACOs. To learn more about ACOs, what they might mean for your practice or organization, and how ICAN can help you navigate any payment future, <a href="cmp/ACO/_doc/ACO_NPRM_Summary.pdf">click here</a></p>
</div>
</div>', NULL, N'Contact Us', N'contact', 7)
GO
INSERT [dbo].[ContentPages3] ([Id], [NavTitle], [Content], [PageId], [Title], [Route], [PageOrder]) VALUES (7, N'Home', N'<div class="container">
<div class="top-content">
<div class="slider-wrapper">
<div class="row">
<div class="col-md-3">
<div class="subscribe-form">
<h3 class="widget-title">Login</h3>
<form action="/Account/Login" method="post"><fieldset><input id="Email" class="form-control" name="Email" type="email" value="" data-val="true" data-val-email="The Email field is not a valid e-mail address." data-val-required="The Email field is required." /></fieldset><fieldset><input id="Password" class="form-control" name="Password" type="password" value="" data-val="true" data-val-required="The Password field is required." /></fieldset><fieldset><button id="send-button" class="btn main-btn" type="submit">Login</button></fieldset></form></div>
</div>
<div class="col-md-9">
<div id="owl-demo" class="owl-carousel owl-theme">
<div class="item">
<div class="row h-100">
<div class="col-md-5">
<p class="img"><img class="img-thumbnail" src="../../Public/Content/82c9f442-07e0-4119-a7b3-0b4732b11474.png" alt="Worker.png" width="308" height="169" /></p>
</div>
<div class="col-md-7">
<h4 class="owl-crousel-heading">Our System</h4>
<p class="owl-crousel-body">My Healthcare Company is a 100% web-based solution designed to simplify and organize many of the processes required to operate a Behavioral or Home Healthcare Organization. Mental Health, Developmental Disabilities, and Substance Abuse services can be a daunting task full of documentation and state regulations. My Healthcare Company is designed to combine all of those processes into one intuitive user interface to afford its users on-demand, secure, and controlled access to critical company data, client data, and documentation.</p>
</div>
</div>
</div>
<div class="item">
<div class="row">
<div class="col-md-5">
<p class="img"><img class="img-thumbnail" src="../../Public/Content/27503658-02a3-4245-b864-50d463fabcb0.png" alt="" width="1600" height="860" /></p>
</div>
<div class="col-md-7">
<h4 class="owl-crousel-heading">Support and Training</h4>
<div class="owl-crousel-body">Customer Support is critical to the success of any company that provides software and/or services. Customer support is available 24/7 from trained staff that have background and experience in the healthcare industry.
<ul>
<li>FREE 24 / 7 support</li>
<li>$0 set Up and training</li>
<li>No contracts to sign</li>
</ul>
<a href="#">Read More</a></div>
</div>
</div>
</div>
<div class="item">
<div class="row">
<div class="col-md-5">
<p class="img"><img class="img-thumbnail" src="../../Public/Content/354d031b-3adb-4e0b-9979-17beadb85a7d.png" alt="" width="1920" height="1030" /></p>
</div>
<div class="col-md-7">
<h4 class="owl-crousel-heading">EHR Incentives</h4>
<div class="owl-crousel-body">Our staff will help to ensure that your company receives the maximum incentive dollars allowed for each eligible provider. You do not have to exclusively use our system to receive incentive dollars Summer 2012. Please contact us so you can register for your share of the stimulus dollars.</div>
</div>
</div>
</div>
<div class="item">
<div class="row">
<div class="col-md-5">
<p class="img"><img class="img-thumbnail" src="../../Public/Content/145f45f6-93d3-4e81-8324-b0c4353eb117.png" alt="" width="1920" height="1030" /></p>
</div>
<div class="col-md-7">
<h4 class="owl-crousel-heading">We Want To Hear Your Ideas</h4>
<div class="owl-crousel-body">Four times a year we have user group meetings, so be sure that you and your company are on our mailing list so that you can participate in these meetings. During these meetings we provide breakfast, lunch or dinner depending on the time and location, while our clients'' along with our staff and other consultants provide feedback on items that make the system better. Our focus is to continue making the system better for our clients and auditors as we comply with components of the Health Information Exchange.</div>
</div>
</div>
</div>
<div class="item">
<div class="row">
<div class="col-md-5">
<p class="img"><img class="img-thumbnail" src="../../Public/Content/3ae6b018-3c07-430c-a75f-2eec9bb19875.png" alt="" width="1920" height="1030" /></p>
</div>
<div class="col-md-7">
<h4 class="owl-crousel-heading">No 3rd Party Billers</h4>
<div class="owl-crousel-body">Our company is set up as a clearinghouse in every state that we provide notes, documentation, EHR Incentives and Automated Billing. Our billing is purely automated since we have been working with various state sources, consultants for over 9 years now.</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
<div class="row">
<div class="col-md-9">
<div class="box-content">
<div class="row">
<div class="col-md-12">
<h4 class="widget-title">&nbsp;</h4>
<h4 class="widget-title">Features</h4>
</div>
</div>
<div class="row">
<div class="col-md-6 col-sm-6 post-grid">
<div class="card mb-3" style="max-width: 540px;">
<div class="row no-gutters">
<div class="col-md-3"><img class="img-thumbnail" src="https://via.placeholder.com/80" alt="..." /></div>
<div class="col-md-9">
<div class="card-body">
<h3 class="card-title">Automated Billing</h3>
<p class="card-text">ICAN serves as a clearinghouse for our providers. Your billing is automatically sent to your payers.....<small class="text-muted float-right"><a class="btn btn-primary" href="#">View more</a></small></p>
</div>
</div>
</div>
</div>
</div>
<div class="col-md-6 col-sm-6 post-grid">
<div class="card mb-3" style="max-width: 540px;">
<div class="row no-gutters">
<div class="col-md-3"><img class="img-thumbnail" src="https://via.placeholder.com/80" alt="..." /></div>
<div class="col-md-9">
<div class="card-body">
<h3 class="card-title">Client Note Entry &amp; Approval</h3>
<p class="card-text">Our note entry and approval process supports standard formats (i.e. PIE, BIRP, GIRP, SOAP, State Specific) ...<small class="text-muted float-right"><a class="btn btn-primary" href="#">View more</a></small></p>
</div>
</div>
</div>
</div>
</div>
</div>
<div class="row mt-10">
<div class="col-md-6 col-sm-6 post-grid">
<div class="card mb-3" style="max-width: 540px;">
<div class="row no-gutters">
<div class="col-md-3"><img class="img-thumbnail" src="https://via.placeholder.com/80" alt="..." /></div>
<div class="col-md-9">
<div class="card-body">
<h3 class="card-title">Data Backup</h3>
<p class="card-text">Staff Certified Network Engineers ensure your data is backed up real-time by using SQL Server Clustering ...<small class="text-muted float-right"><a class="btn btn-primary" href="#">View more</a></small></p>
</div>
</div>
</div>
</div>
</div>
<div class="col-md-6 col-sm-6 post-grid">
<div class="card mb-3" style="max-width: 540px;">
<div class="row no-gutters">
<div class="col-md-3"><img class="img-thumbnail" src="https://via.placeholder.com/80" alt="..." /></div>
<div class="col-md-9">
<div class="card-body">
<h3 class="card-title">24/7 Support</h3>
<p class="card-text">Our customer service staff is available to answer questions and assist when needed ...<small class="text-muted float-right"><a class="btn btn-primary" href="#">View more</a></small></p>
</div>
</div>
</div>
</div>
</div>
</div>
<div class="row mt-10">
<div class="col-md-6 col-sm-6 post-grid">
<div class="card mb-3" style="max-width: 540px;">
<div class="row no-gutters">
<div class="col-md-3"><img class="img-thumbnail" src="https://via.placeholder.com/80" alt="..." /></div>
<div class="col-md-9">
<div class="card-body">
<h3 class="card-title">Security</h3>
<p class="card-text">Security isn&rsquo;t just important to your customers, it&rsquo;s the law. My Healthcare Company ensures ...<small class="text-muted float-right"><a class="btn btn-primary" href="#">View more</a></small></p>
</div>
</div>
</div>
</div>
</div>
<div class="col-md-6 col-sm-6 post-grid">
<div class="card mb-3" style="max-width: 540px;">
<div class="row no-gutters">
<div class="col-md-3"><img class="img-thumbnail" src="https://via.placeholder.com/80" alt="..." /></div>
<div class="col-md-9">
<div class="card-body">
<h3 class="card-title">Employee Screening</h3>
<p class="card-text">Create an applicant pool seperate from your employees to allow credentialing and verification<small class="text-muted float-right"><a class="btn btn-primary" href="#">View more</a></small></p>
</div>
</div>
</div>
</div>
</div>
</div>
<div class="row mt-10">
<div class="col-md-6 col-sm-6 post-grid">
<div class="card mb-3" style="max-width: 540px;">
<div class="row no-gutters">
<div class="col-md-3"><img class="img-thumbnail" src="https://via.placeholder.com/80" alt="..." /></div>
<div class="col-md-9">
<div class="card-body">
<h3 class="card-title">Eligibility Checks</h3>
<p class="card-text">When dealing with multiple payers, let our system perform automated eligibiity checks on your consumers ...<small class="text-muted float-right"><a class="btn btn-primary" href="#">View more</a></small></p>
</div>
</div>
</div>
</div>
</div>
<div class="col-md-6 col-sm-6 post-grid">
<div class="card mb-3" style="max-width: 540px;">
<div class="row no-gutters">
<div class="col-md-3"><img class="img-thumbnail" src="https://via.placeholder.com/80" alt="..." /></div>
<div class="col-md-9">
<div class="card-body">
<h3 class="card-title">Plagiarism Checks</h3>
<p class="card-text">If you think your staff is coping documentation, the plagiarism checker will let you know how close each note matches ...<small class="text-muted float-right"><a class="btn btn-primary" href="#">View more</a></small></p>
</div>
</div>
</div>
</div>
</div>
</div>
<div class="row mt-10">
<div class="col-md-6 col-sm-6 post-grid">
<div class="card mb-3" style="max-width: 540px;">
<div class="row no-gutters">
<div class="col-md-3"><img class="img-thumbnail" src="https://via.placeholder.com/80" alt="..." /></div>
<div class="col-md-9">
<div class="card-body">
<h3 class="card-title">Real-Time Reporting</h3>
<p class="card-text">Run real-time reports on financials, outcome measurements, labels, listings, EHR Meaningful Use ...<small class="text-muted float-right"><a class="btn btn-primary" href="#">View more</a></small></p>
</div>
</div>
</div>
</div>
</div>
<div class="col-md-6 col-sm-6 post-grid">
<div class="card mb-3" style="max-width: 540px;">
<div class="row no-gutters">
<div class="col-md-3"><img class="img-thumbnail" src="https://via.placeholder.com/80" alt="..." /></div>
<div class="col-md-9">
<div class="card-body">
<h3 class="card-title">Payroll Generation</h3>
<p class="card-text">Generate your payroll based on various combinations or customer defined queries ...<small class="text-muted float-right"><a class="btn btn-primary" href="#">View more</a></small></p>
</div>
</div>
</div>
</div>
</div>
</div>
<div class="row mt-10">
<div class="col-md-6 col-sm-6 post-grid">
<div class="card mb-3" style="max-width: 540px;">
<div class="row no-gutters">
<div class="col-md-3"><img class="img-thumbnail" src="https://via.placeholder.com/80" alt="..." /></div>
<div class="col-md-9">
<div class="card-body">
<h3 class="card-title">Multiple locations</h3>
<p class="card-text">Our system and staff service clients in over 6 states in the Mental and Home Health sectors ...<small class="text-muted float-right"><a class="btn btn-primary" href="#">View more</a></small></p>
</div>
</div>
</div>
</div>
</div>
<div class="col-md-6 col-sm-6 post-grid">
<div class="card mb-3" style="max-width: 540px;">
<div class="row no-gutters">
<div class="col-md-3"><img class="img-thumbnail" src="https://via.placeholder.com/80" alt="..." /></div>
<div class="col-md-9">
<div class="card-body">
<h3 class="card-title">E-Prescribing</h3>
<p class="card-text">Use this feature to create, monitor and send prescriptions to your pharmacist with a few clicks ...<small class="text-muted float-right"><a class="btn btn-primary" href="#">View more</a></small></p>
</div>
</div>
</div>
</div>
</div>
</div>
<div class="row mt-10">
<div class="col-md-6 col-sm-6 post-grid">
<div class="card mb-3" style="max-width: 540px;">
<div class="row no-gutters">
<div class="col-md-3"><img class="img-thumbnail" src="https://via.placeholder.com/80" alt="..." /></div>
<div class="col-md-9">
<div class="card-body">
<h3 class="card-title">Lab Results</h3>
<p class="card-text">Integrate with labs accross the country to submit and receive lab results on your consumers ...<small class="text-muted float-right"><a class="btn btn-primary" href="#">View more</a></small></p>
</div>
</div>
</div>
</div>
</div>
<div class="col-md-6 col-sm-6 post-grid">
<div class="card mb-3" style="max-width: 540px;">
<div class="row no-gutters">
<div class="col-md-3"><img class="img-thumbnail" src="https://via.placeholder.com/80" alt="..." /></div>
<div class="col-md-9">
<div class="card-body">
<h3 class="card-title">Scheduling</h3>
<p class="card-text">Schedule your case loads so you know which staff are responsible for each consumer ...<small class="text-muted float-right"><a class="btn btn-primary" href="#">View more</a></small></p>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
<div class="col-md-3">
<div class="box-content">
<div class="events-sidebar">
<ul>
<li class="event-item"><img class="img-thumbnail" src="https://via.placeholder.com/231x202.png?text=live+demo" alt="" /></li>
<li class="event-item">
<h3 class="text-purple" style="font-size: 2rem;">Testimonials</h3>
<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem.</p>
</li>
</ul>
<a class="read-more" href="events-list.html">More Events &rarr;</a></div>
</div>
</div>
</div>
</div>', NULL, N'Home', N'home', 1)
GO
INSERT [dbo].[ContentPages3] ([Id], [NavTitle], [Content], [PageId], [Title], [Route], [PageOrder]) VALUES (8, N'How it works', N'<div class="blog-single">
<div class="post-content">
<h3 class="post-title">Achieving Meaningful Use with ICAN</h3>
<div class="row">
<div class="col-md-8">According to the 2009 HITECH Act, physicians are eligible to receive up to $44,000 in total incentives per physician from Medicaid for "Meaningful Use" of a certified Electronic Health Record (EHR) starting this year (2011). (Note: Physicians reimbursed by Medicaid can receive up to approximately $63,750 starting in 2011 based on state-defined guidelines.) In July 2010, the Center for Medicare and Medicaid Services (CMS) released their rule for the Stage 1 Meaningful Use requirements that physicians need to meet in order to receive their Meaningful Use incentives. For our in-depth analysis of the rule, <a>click here</a>.</div>
<div class="col-md-4"><img style="margin-right: 5px;" src="https://via.placeholder.com/250x173.png?text=Visit+WhoIsHostingThis.com+Buyers+Guide" /></div>
</div>
<p><br />Medicaid payments have been coming in and beginning in late May our first physician clients began receiving their year one Medicare Meaningful Use checks for up to $18,000. You can read on our blog about the first ICAN client to get paid. These payments represent the first step in the validation and fulfillment of ICAN''s Federal Stimulus Bonus Payment Guarantee Program, unique in the industry for guaranteeing federal Meaningful Use incentive payments, not just Meaningful Use certification. To learn more about our Guarantee. <a href="guaranteedpayment.aspx">click here</a></p>
<h3 class="post-title">Guaranteed Incentives, Nimble Technology</h3>
<p>How can we be so confident in our ability to meet Meaningful Use that we are willing to put our own money on the line?* And why do 100% of our clients share that confidence, according to our surveys, "Ambulatory EMR: On Track for Meaningful Use?" <br />Unlike traditional software or ASP-based EHRs, where all the work involved in meeting and tracking Meaningful Use performance falls on the practice, HITS provides a full-service solution with no extra or hidden costs. Our service includes, at no extra cost: </p>
<ul>
<li>Administrative support that takes on cumbersome tasks of registration and attestation with government agencies</li>
<li>Fully certified clinical quality measures built into the workflow with our proprietary HITS&reg;</li>
<li>A Meaningful Use Resource Center website where clients have access to all the information they need&mdash;at their fingertips</li>
<li>Expert performance coaching to guide and support clients through every stage of the process</li>
</ul>
<p>Here is a more detailed breakdown of how ICAN is addressing key Meaningful Use measures:</p>
<h3 class="post-title">Improved outcomes</h3>
<ul>
<li>Care Coordination (Electronically exchange information): Unlike most EHR offerings, <a href="#">athenaCommunicator&reg;</a>, with its Patient Portal and automated patient messaging, is designed to enhance patient involvement in their health care, enabling practices to meet these Meaningful Use measures.</li>
</ul>
<h3 class="post-title">Advanced clinical processes</h3>
<ul>
<li><strong>Use of e-Prescribing:</strong> MyHealthcareCompany is Surescripts&reg; certified for Prescription Benefit Eligibility, Formulary, and Reporting; Medication History (payer); Prescription Renewals (retail); and Prescription Routing for New Prescriptions (retail and mail-order).</li>
<li><strong>Closed Order Management: </strong>Because our EHR includes document management services, we make it easy for providers to create and send electronic orders from the encounter. Users can also track and close orders within the application for better follow-up and quality reporting.</li>
</ul>
<h3 class="post-title">Data capture and sharing</h3>
<ul>
<li><strong>Quality care and population management: </strong>MyHealthcareCompany&rsquo;s rules database provides a set of payer-specific quality measures and also allows for comprehensive and automatic demographic reporting.</li>
<li>Meaningful use offers an important opportunity for physicians to be financially rewarded for adopting an EHR that can effectively achieve measures. We at ICAN are here to help you navigate through the complexities of Meaningful Use, help you get all the incentive dollars you deserve, and free you from administrative red tape so you can focus on quality patient care.</li>
</ul>
<h3 class="post-title">Your Partner Through Reform and Change</h3>
<p>The HITECH Act and Meaningful Use is just one of many huge changes impacting physician practices today. Last year''s historic passage of the Patient Protection and Affordable Care Act set the stage for what will be some of the most significant changes to the U.S. health care system in a generation. To read in more detail about our perspective on the health care reform bill and our response to the challenges it presents, <a>click here</a></p>
<p>One recent manifestation of the reform bill was the release in March of the proposed rules for Accountable Care Organizations, or ACOs. To learn more about ACOs, what they might mean for your practice or organization, and how ICAN can help you navigate any payment future, <a href="cmp/ACO/_doc/ACO_NPRM_Summary.pdf">click here</a></p>
</div>
</div>', 1, N'How It works', N'how-it-works', 1)
GO
INSERT [dbo].[ContentPages3] ([Id], [NavTitle], [Content], [PageId], [Title], [Route], [PageOrder]) VALUES (9, N'Guaranteed Payment', N'<div class="blog-single">
<div class="post-content">
<h3 class="post-title">Achieving Meaningful Use with ICAN</h3>
<div class="row">
<div class="col-md-8">According to the 2009 HITECH Act, physicians are eligible to receive up to $44,000 in total incentives per physician from Medicaid for "Meaningful Use" of a certified Electronic Health Record (EHR) starting this year (2011). (Note: Physicians reimbursed by Medicaid can receive up to approximately $63,750 starting in 2011 based on state-defined guidelines.) In July 2010, the Center for Medicare and Medicaid Services (CMS) released their rule for the Stage 1 Meaningful Use requirements that physicians need to meet in order to receive their Meaningful Use incentives. For our in-depth analysis of the rule, <a>click here</a>.</div>
<div class="col-md-4"><img style="margin-right: 5px;" src="https://via.placeholder.com/250x173.png?text=Visit+WhoIsHostingThis.com+Buyers+Guide" /></div>
</div>
<p><br />Medicaid payments have been coming in and beginning in late May our first physician clients began receiving their year one Medicare Meaningful Use checks for up to $18,000. You can read on our blog about the first ICAN client to get paid. These payments represent the first step in the validation and fulfillment of ICAN''s Federal Stimulus Bonus Payment Guarantee Program, unique in the industry for guaranteeing federal Meaningful Use incentive payments, not just Meaningful Use certification. To learn more about our Guarantee. <a href="guaranteedpayment.aspx">click here</a></p>
<h3 class="post-title">Guaranteed Incentives, Nimble Technology</h3>
<p>How can we be so confident in our ability to meet Meaningful Use that we are willing to put our own money on the line?* And why do 100% of our clients share that confidence, according to our surveys, "Ambulatory EMR: On Track for Meaningful Use?" <br />Unlike traditional software or ASP-based EHRs, where all the work involved in meeting and tracking Meaningful Use performance falls on the practice, HITS provides a full-service solution with no extra or hidden costs. Our service includes, at no extra cost: </p>
<ul>
<li>Administrative support that takes on cumbersome tasks of registration and attestation with government agencies</li>
<li>Fully certified clinical quality measures built into the workflow with our proprietary HITS&reg;</li>
<li>A Meaningful Use Resource Center website where clients have access to all the information they need&mdash;at their fingertips</li>
<li>Expert performance coaching to guide and support clients through every stage of the process</li>
</ul>
<p>Here is a more detailed breakdown of how ICAN is addressing key Meaningful Use measures:</p>
<h3 class="post-title">Improved outcomes</h3>
<ul>
<li>Care Coordination (Electronically exchange information): Unlike most EHR offerings, <a href="#">athenaCommunicator&reg;</a>, with its Patient Portal and automated patient messaging, is designed to enhance patient involvement in their health care, enabling practices to meet these Meaningful Use measures.</li>
</ul>
<h3 class="post-title">Advanced clinical processes</h3>
<ul>
<li><strong>Use of e-Prescribing:</strong> MyHealthcareCompany is Surescripts&reg; certified for Prescription Benefit Eligibility, Formulary, and Reporting; Medication History (payer); Prescription Renewals (retail); and Prescription Routing for New Prescriptions (retail and mail-order).</li>
<li><strong>Closed Order Management: </strong>Because our EHR includes document management services, we make it easy for providers to create and send electronic orders from the encounter. Users can also track and close orders within the application for better follow-up and quality reporting.</li>
</ul>
<h3 class="post-title">Data capture and sharing</h3>
<ul>
<li><strong>Quality care and population management: </strong>MyHealthcareCompany&rsquo;s rules database provides a set of payer-specific quality measures and also allows for comprehensive and automatic demographic reporting.</li>
<li>Meaningful use offers an important opportunity for physicians to be financially rewarded for adopting an EHR that can effectively achieve measures. We at ICAN are here to help you navigate through the complexities of Meaningful Use, help you get all the incentive dollars you deserve, and free you from administrative red tape so you can focus on quality patient care.</li>
</ul>
<h3 class="post-title">Your Partner Through Reform and Change</h3>
<p>The HITECH Act and Meaningful Use is just one of many huge changes impacting physician practices today. Last year''s historic passage of the Patient Protection and Affordable Care Act set the stage for what will be some of the most significant changes to the U.S. health care system in a generation. To read in more detail about our perspective on the health care reform bill and our response to the challenges it presents, <a>click here</a></p>
<p>One recent manifestation of the reform bill was the release in March of the proposed rules for Accountable Care Organizations, or ACOs. To learn more about ACOs, what they might mean for your practice or organization, and how ICAN can help you navigate any payment future, <a href="cmp/ACO/_doc/ACO_NPRM_Summary.pdf">click here</a></p>
</div>
</div>', 1, N'Guaranteed Payment', N'guaranteed-payment', 2)
GO
INSERT [dbo].[ContentPages3] ([Id], [NavTitle], [Content], [PageId], [Title], [Route], [PageOrder]) VALUES (10, N'HITECH Guarantee Q&A', N'<div class="blog-single">
<div class="post-content">
<h3 class="post-title">Achieving Meaningful Use with ICAN</h3>
<div class="row">
<div class="col-md-8">According to the 2009 HITECH Act, physicians are eligible to receive up to $44,000 in total incentives per physician from Medicaid for "Meaningful Use" of a certified Electronic Health Record (EHR) starting this year (2011). (Note: Physicians reimbursed by Medicaid can receive up to approximately $63,750 starting in 2011 based on state-defined guidelines.) In July 2010, the Center for Medicare and Medicaid Services (CMS) released their rule for the Stage 1 Meaningful Use requirements that physicians need to meet in order to receive their Meaningful Use incentives. For our in-depth analysis of the rule, <a>click here</a>.</div>
<div class="col-md-4"><img style="margin-right: 5px;" src="https://via.placeholder.com/250x173.png?text=Visit+WhoIsHostingThis.com+Buyers+Guide" /></div>
</div>
<p><br />Medicaid payments have been coming in and beginning in late May our first physician clients began receiving their year one Medicare Meaningful Use checks for up to $18,000. You can read on our blog about the first ICAN client to get paid. These payments represent the first step in the validation and fulfillment of ICAN''s Federal Stimulus Bonus Payment Guarantee Program, unique in the industry for guaranteeing federal Meaningful Use incentive payments, not just Meaningful Use certification. To learn more about our Guarantee. <a href="guaranteedpayment.aspx">click here</a></p>
<h3 class="post-title">Guaranteed Incentives, Nimble Technology</h3>
<p>How can we be so confident in our ability to meet Meaningful Use that we are willing to put our own money on the line?* And why do 100% of our clients share that confidence, according to our surveys, "Ambulatory EMR: On Track for Meaningful Use?" <br />Unlike traditional software or ASP-based EHRs, where all the work involved in meeting and tracking Meaningful Use performance falls on the practice, HITS provides a full-service solution with no extra or hidden costs. Our service includes, at no extra cost: </p>
<ul>
<li>Administrative support that takes on cumbersome tasks of registration and attestation with government agencies</li>
<li>Fully certified clinical quality measures built into the workflow with our proprietary HITS&reg;</li>
<li>A Meaningful Use Resource Center website where clients have access to all the information they need&mdash;at their fingertips</li>
<li>Expert performance coaching to guide and support clients through every stage of the process</li>
</ul>
<p>Here is a more detailed breakdown of how ICAN is addressing key Meaningful Use measures:</p>
<h3 class="post-title">Improved outcomes</h3>
<ul>
<li>Care Coordination (Electronically exchange information): Unlike most EHR offerings, <a href="#">athenaCommunicator&reg;</a>, with its Patient Portal and automated patient messaging, is designed to enhance patient involvement in their health care, enabling practices to meet these Meaningful Use measures.</li>
</ul>
<h3 class="post-title">Advanced clinical processes</h3>
<ul>
<li><strong>Use of e-Prescribing:</strong> MyHealthcareCompany is Surescripts&reg; certified for Prescription Benefit Eligibility, Formulary, and Reporting; Medication History (payer); Prescription Renewals (retail); and Prescription Routing for New Prescriptions (retail and mail-order).</li>
<li><strong>Closed Order Management: </strong>Because our EHR includes document management services, we make it easy for providers to create and send electronic orders from the encounter. Users can also track and close orders within the application for better follow-up and quality reporting.</li>
</ul>
<h3 class="post-title">Data capture and sharing</h3>
<ul>
<li><strong>Quality care and population management: </strong>MyHealthcareCompany&rsquo;s rules database provides a set of payer-specific quality measures and also allows for comprehensive and automatic demographic reporting.</li>
<li>Meaningful use offers an important opportunity for physicians to be financially rewarded for adopting an EHR that can effectively achieve measures. We at ICAN are here to help you navigate through the complexities of Meaningful Use, help you get all the incentive dollars you deserve, and free you from administrative red tape so you can focus on quality patient care.</li>
</ul>
<h3 class="post-title">Your Partner Through Reform and Change</h3>
<p>The HITECH Act and Meaningful Use is just one of many huge changes impacting physician practices today. Last year''s historic passage of the Patient Protection and Affordable Care Act set the stage for what will be some of the most significant changes to the U.S. health care system in a generation. To read in more detail about our perspective on the health care reform bill and our response to the challenges it presents, <a>click here</a></p>
<p>One recent manifestation of the reform bill was the release in March of the proposed rules for Accountable Care Organizations, or ACOs. To learn more about ACOs, what they might mean for your practice or organization, and how ICAN can help you navigate any payment future, <a href="cmp/ACO/_doc/ACO_NPRM_Summary.pdf">click here</a></p>
</div>
</div>', 1, N'HITECH Guarantee Q&A', N'hitech-guarantee-qa', 3)
GO
INSERT [dbo].[ContentPages3] ([Id], [NavTitle], [Content], [PageId], [Title], [Route], [PageOrder]) VALUES (11, N'Client Note Entry & Approval', N'<div class="blog-single">
<div class="post-content">
<h3 class="post-title">Achieving Meaningful Use with ICAN</h3>
<div class="row">
<div class="col-md-8">According to the 2009 HITECH Act, physicians are eligible to receive up to $44,000 in total incentives per physician from Medicaid for "Meaningful Use" of a certified Electronic Health Record (EHR) starting this year (2011). (Note: Physicians reimbursed by Medicaid can receive up to approximately $63,750 starting in 2011 based on state-defined guidelines.) In July 2010, the Center for Medicare and Medicaid Services (CMS) released their rule for the Stage 1 Meaningful Use requirements that physicians need to meet in order to receive their Meaningful Use incentives. For our in-depth analysis of the rule, <a>click here</a>.</div>
<div class="col-md-4"><img style="margin-right: 5px;" src="https://via.placeholder.com/250x173.png?text=Visit+WhoIsHostingThis.com+Buyers+Guide" /></div>
</div>
<p><br />Medicaid payments have been coming in and beginning in late May our first physician clients began receiving their year one Medicare Meaningful Use checks for up to $18,000. You can read on our blog about the first ICAN client to get paid. These payments represent the first step in the validation and fulfillment of ICAN''s Federal Stimulus Bonus Payment Guarantee Program, unique in the industry for guaranteeing federal Meaningful Use incentive payments, not just Meaningful Use certification. To learn more about our Guarantee. <a href="guaranteedpayment.aspx">click here</a></p>
<h3 class="post-title">Guaranteed Incentives, Nimble Technology</h3>
<p>How can we be so confident in our ability to meet Meaningful Use that we are willing to put our own money on the line?* And why do 100% of our clients share that confidence, according to our surveys, "Ambulatory EMR: On Track for Meaningful Use?" <br />Unlike traditional software or ASP-based EHRs, where all the work involved in meeting and tracking Meaningful Use performance falls on the practice, HITS provides a full-service solution with no extra or hidden costs. Our service includes, at no extra cost: </p>
<ul>
<li>Administrative support that takes on cumbersome tasks of registration and attestation with government agencies</li>
<li>Fully certified clinical quality measures built into the workflow with our proprietary HITS&reg;</li>
<li>A Meaningful Use Resource Center website where clients have access to all the information they need&mdash;at their fingertips</li>
<li>Expert performance coaching to guide and support clients through every stage of the process</li>
</ul>
<p>Here is a more detailed breakdown of how ICAN is addressing key Meaningful Use measures:</p>
<h3 class="post-title">Improved outcomes</h3>
<ul>
<li>Care Coordination (Electronically exchange information): Unlike most EHR offerings, <a href="#">athenaCommunicator&reg;</a>, with its Patient Portal and automated patient messaging, is designed to enhance patient involvement in their health care, enabling practices to meet these Meaningful Use measures.</li>
</ul>
<h3 class="post-title">Advanced clinical processes</h3>
<ul>
<li><strong>Use of e-Prescribing:</strong> MyHealthcareCompany is Surescripts&reg; certified for Prescription Benefit Eligibility, Formulary, and Reporting; Medication History (payer); Prescription Renewals (retail); and Prescription Routing for New Prescriptions (retail and mail-order).</li>
<li><strong>Closed Order Management: </strong>Because our EHR includes document management services, we make it easy for providers to create and send electronic orders from the encounter. Users can also track and close orders within the application for better follow-up and quality reporting.</li>
</ul>
<h3 class="post-title">Data capture and sharing</h3>
<ul>
<li><strong>Quality care and population management: </strong>MyHealthcareCompany&rsquo;s rules database provides a set of payer-specific quality measures and also allows for comprehensive and automatic demographic reporting.</li>
<li>Meaningful use offers an important opportunity for physicians to be financially rewarded for adopting an EHR that can effectively achieve measures. We at ICAN are here to help you navigate through the complexities of Meaningful Use, help you get all the incentive dollars you deserve, and free you from administrative red tape so you can focus on quality patient care.</li>
</ul>
<h3 class="post-title">Your Partner Through Reform and Change</h3>
<p>The HITECH Act and Meaningful Use is just one of many huge changes impacting physician practices today. Last year''s historic passage of the Patient Protection and Affordable Care Act set the stage for what will be some of the most significant changes to the U.S. health care system in a generation. To read in more detail about our perspective on the health care reform bill and our response to the challenges it presents, <a>click here</a></p>
<p>One recent manifestation of the reform bill was the release in March of the proposed rules for Accountable Care Organizations, or ACOs. To learn more about ACOs, what they might mean for your practice or organization, and how ICAN can help you navigate any payment future, <a href="cmp/ACO/_doc/ACO_NPRM_Summary.pdf">click here</a></p>
</div>
</div>', 2, N'Client Note Entry & Approval', N'client-note-entry-and-approval', 1)
GO
INSERT [dbo].[ContentPages3] ([Id], [NavTitle], [Content], [PageId], [Title], [Route], [PageOrder]) VALUES (12, N'Automate Billing', N'<div class="blog-single">
<div class="post-content">
<h3 class="post-title">Achieving Meaningful Use with ICAN</h3>
<div class="row">
<div class="col-md-8">According to the 2009 HITECH Act, physicians are eligible to receive up to $44,000 in total incentives per physician from Medicaid for "Meaningful Use" of a certified Electronic Health Record (EHR) starting this year (2011). (Note: Physicians reimbursed by Medicaid can receive up to approximately $63,750 starting in 2011 based on state-defined guidelines.) In July 2010, the Center for Medicare and Medicaid Services (CMS) released their rule for the Stage 1 Meaningful Use requirements that physicians need to meet in order to receive their Meaningful Use incentives. For our in-depth analysis of the rule, <a>click here</a>.</div>
<div class="col-md-4"><img style="margin-right: 5px;" src="https://via.placeholder.com/250x173.png?text=Visit+WhoIsHostingThis.com+Buyers+Guide" /></div>
</div>
<p><br />Medicaid payments have been coming in and beginning in late May our first physician clients began receiving their year one Medicare Meaningful Use checks for up to $18,000. You can read on our blog about the first ICAN client to get paid. These payments represent the first step in the validation and fulfillment of ICAN''s Federal Stimulus Bonus Payment Guarantee Program, unique in the industry for guaranteeing federal Meaningful Use incentive payments, not just Meaningful Use certification. To learn more about our Guarantee. <a href="guaranteedpayment.aspx">click here</a></p>
<h3 class="post-title">Guaranteed Incentives, Nimble Technology</h3>
<p>How can we be so confident in our ability to meet Meaningful Use that we are willing to put our own money on the line?* And why do 100% of our clients share that confidence, according to our surveys, "Ambulatory EMR: On Track for Meaningful Use?" <br />Unlike traditional software or ASP-based EHRs, where all the work involved in meeting and tracking Meaningful Use performance falls on the practice, HITS provides a full-service solution with no extra or hidden costs. Our service includes, at no extra cost: </p>
<ul>
<li>Administrative support that takes on cumbersome tasks of registration and attestation with government agencies</li>
<li>Fully certified clinical quality measures built into the workflow with our proprietary HITS&reg;</li>
<li>A Meaningful Use Resource Center website where clients have access to all the information they need&mdash;at their fingertips</li>
<li>Expert performance coaching to guide and support clients through every stage of the process</li>
</ul>
<p>Here is a more detailed breakdown of how ICAN is addressing key Meaningful Use measures:</p>
<h3 class="post-title">Improved outcomes</h3>
<ul>
<li>Care Coordination (Electronically exchange information): Unlike most EHR offerings, <a href="#">athenaCommunicator&reg;</a>, with its Patient Portal and automated patient messaging, is designed to enhance patient involvement in their health care, enabling practices to meet these Meaningful Use measures.</li>
</ul>
<h3 class="post-title">Advanced clinical processes</h3>
<ul>
<li><strong>Use of e-Prescribing:</strong> MyHealthcareCompany is Surescripts&reg; certified for Prescription Benefit Eligibility, Formulary, and Reporting; Medication History (payer); Prescription Renewals (retail); and Prescription Routing for New Prescriptions (retail and mail-order).</li>
<li><strong>Closed Order Management: </strong>Because our EHR includes document management services, we make it easy for providers to create and send electronic orders from the encounter. Users can also track and close orders within the application for better follow-up and quality reporting.</li>
</ul>
<h3 class="post-title">Data capture and sharing</h3>
<ul>
<li><strong>Quality care and population management: </strong>MyHealthcareCompany&rsquo;s rules database provides a set of payer-specific quality measures and also allows for comprehensive and automatic demographic reporting.</li>
<li>Meaningful use offers an important opportunity for physicians to be financially rewarded for adopting an EHR that can effectively achieve measures. We at ICAN are here to help you navigate through the complexities of Meaningful Use, help you get all the incentive dollars you deserve, and free you from administrative red tape so you can focus on quality patient care.</li>
</ul>
<h3 class="post-title">Your Partner Through Reform and Change</h3>
<p>The HITECH Act and Meaningful Use is just one of many huge changes impacting physician practices today. Last year''s historic passage of the Patient Protection and Affordable Care Act set the stage for what will be some of the most significant changes to the U.S. health care system in a generation. To read in more detail about our perspective on the health care reform bill and our response to the challenges it presents, <a>click here</a></p>
<p>One recent manifestation of the reform bill was the release in March of the proposed rules for Accountable Care Organizations, or ACOs. To learn more about ACOs, what they might mean for your practice or organization, and how ICAN can help you navigate any payment future, <a href="cmp/ACO/_doc/ACO_NPRM_Summary.pdf">click here</a></p>
</div>
</div>', 2, N'Automate Billing', N'automate-billing', 2)
GO
INSERT [dbo].[ContentPages3] ([Id], [NavTitle], [Content], [PageId], [Title], [Route], [PageOrder]) VALUES (13, N'Security', N'<div class="blog-single">
<div class="post-content">
<h3 class="post-title">Achieving Meaningful Use with ICAN</h3>
<div class="row">
<div class="col-md-8">According to the 2009 HITECH Act, physicians are eligible to receive up to $44,000 in total incentives per physician from Medicaid for "Meaningful Use" of a certified Electronic Health Record (EHR) starting this year (2011). (Note: Physicians reimbursed by Medicaid can receive up to approximately $63,750 starting in 2011 based on state-defined guidelines.) In July 2010, the Center for Medicare and Medicaid Services (CMS) released their rule for the Stage 1 Meaningful Use requirements that physicians need to meet in order to receive their Meaningful Use incentives. For our in-depth analysis of the rule, <a>click here</a>.</div>
<div class="col-md-4"><img style="margin-right: 5px;" src="https://via.placeholder.com/250x173.png?text=Visit+WhoIsHostingThis.com+Buyers+Guide" /></div>
</div>
<p><br />Medicaid payments have been coming in and beginning in late May our first physician clients began receiving their year one Medicare Meaningful Use checks for up to $18,000. You can read on our blog about the first ICAN client to get paid. These payments represent the first step in the validation and fulfillment of ICAN''s Federal Stimulus Bonus Payment Guarantee Program, unique in the industry for guaranteeing federal Meaningful Use incentive payments, not just Meaningful Use certification. To learn more about our Guarantee. <a href="guaranteedpayment.aspx">click here</a></p>
<h3 class="post-title">Guaranteed Incentives, Nimble Technology</h3>
<p>How can we be so confident in our ability to meet Meaningful Use that we are willing to put our own money on the line?* And why do 100% of our clients share that confidence, according to our surveys, "Ambulatory EMR: On Track for Meaningful Use?" <br />Unlike traditional software or ASP-based EHRs, where all the work involved in meeting and tracking Meaningful Use performance falls on the practice, HITS provides a full-service solution with no extra or hidden costs. Our service includes, at no extra cost: </p>
<ul>
<li>Administrative support that takes on cumbersome tasks of registration and attestation with government agencies</li>
<li>Fully certified clinical quality measures built into the workflow with our proprietary HITS&reg;</li>
<li>A Meaningful Use Resource Center website where clients have access to all the information they need&mdash;at their fingertips</li>
<li>Expert performance coaching to guide and support clients through every stage of the process</li>
</ul>
<p>Here is a more detailed breakdown of how ICAN is addressing key Meaningful Use measures:</p>
<h3 class="post-title">Improved outcomes</h3>
<ul>
<li>Care Coordination (Electronically exchange information): Unlike most EHR offerings, <a href="#">athenaCommunicator&reg;</a>, with its Patient Portal and automated patient messaging, is designed to enhance patient involvement in their health care, enabling practices to meet these Meaningful Use measures.</li>
</ul>
<h3 class="post-title">Advanced clinical processes</h3>
<ul>
<li><strong>Use of e-Prescribing:</strong> MyHealthcareCompany is Surescripts&reg; certified for Prescription Benefit Eligibility, Formulary, and Reporting; Medication History (payer); Prescription Renewals (retail); and Prescription Routing for New Prescriptions (retail and mail-order).</li>
<li><strong>Closed Order Management: </strong>Because our EHR includes document management services, we make it easy for providers to create and send electronic orders from the encounter. Users can also track and close orders within the application for better follow-up and quality reporting.</li>
</ul>
<h3 class="post-title">Data capture and sharing</h3>
<ul>
<li><strong>Quality care and population management: </strong>MyHealthcareCompany&rsquo;s rules database provides a set of payer-specific quality measures and also allows for comprehensive and automatic demographic reporting.</li>
<li>Meaningful use offers an important opportunity for physicians to be financially rewarded for adopting an EHR that can effectively achieve measures. We at ICAN are here to help you navigate through the complexities of Meaningful Use, help you get all the incentive dollars you deserve, and free you from administrative red tape so you can focus on quality patient care.</li>
</ul>
<h3 class="post-title">Your Partner Through Reform and Change</h3>
<p>The HITECH Act and Meaningful Use is just one of many huge changes impacting physician practices today. Last year''s historic passage of the Patient Protection and Affordable Care Act set the stage for what will be some of the most significant changes to the U.S. health care system in a generation. To read in more detail about our perspective on the health care reform bill and our response to the challenges it presents, <a>click here</a></p>
<p>One recent manifestation of the reform bill was the release in March of the proposed rules for Accountable Care Organizations, or ACOs. To learn more about ACOs, what they might mean for your practice or organization, and how ICAN can help you navigate any payment future, <a href="cmp/ACO/_doc/ACO_NPRM_Summary.pdf">click here</a></p>
</div>
</div>', 2, N'Security', N'security', 3)
GO
INSERT [dbo].[ContentPages3] ([Id], [NavTitle], [Content], [PageId], [Title], [Route], [PageOrder]) VALUES (14, N'24/7 Support', N'<div class="blog-single">
<div class="post-content">
<h3 class="post-title">Achieving Meaningful Use with ICAN</h3>
<div class="row">
<div class="col-md-8">According to the 2009 HITECH Act, physicians are eligible to receive up to $44,000 in total incentives per physician from Medicaid for "Meaningful Use" of a certified Electronic Health Record (EHR) starting this year (2011). (Note: Physicians reimbursed by Medicaid can receive up to approximately $63,750 starting in 2011 based on state-defined guidelines.) In July 2010, the Center for Medicare and Medicaid Services (CMS) released their rule for the Stage 1 Meaningful Use requirements that physicians need to meet in order to receive their Meaningful Use incentives. For our in-depth analysis of the rule, <a>click here</a>.</div>
<div class="col-md-4"><img style="margin-right: 5px;" src="https://via.placeholder.com/250x173.png?text=Visit+WhoIsHostingThis.com+Buyers+Guide" /></div>
</div>
<p><br />Medicaid payments have been coming in and beginning in late May our first physician clients began receiving their year one Medicare Meaningful Use checks for up to $18,000. You can read on our blog about the first ICAN client to get paid. These payments represent the first step in the validation and fulfillment of ICAN''s Federal Stimulus Bonus Payment Guarantee Program, unique in the industry for guaranteeing federal Meaningful Use incentive payments, not just Meaningful Use certification. To learn more about our Guarantee. <a href="guaranteedpayment.aspx">click here</a></p>
<h3 class="post-title">Guaranteed Incentives, Nimble Technology</h3>
<p>How can we be so confident in our ability to meet Meaningful Use that we are willing to put our own money on the line?* And why do 100% of our clients share that confidence, according to our surveys, "Ambulatory EMR: On Track for Meaningful Use?" <br />Unlike traditional software or ASP-based EHRs, where all the work involved in meeting and tracking Meaningful Use performance falls on the practice, HITS provides a full-service solution with no extra or hidden costs. Our service includes, at no extra cost: </p>
<ul>
<li>Administrative support that takes on cumbersome tasks of registration and attestation with government agencies</li>
<li>Fully certified clinical quality measures built into the workflow with our proprietary HITS&reg;</li>
<li>A Meaningful Use Resource Center website where clients have access to all the information they need&mdash;at their fingertips</li>
<li>Expert performance coaching to guide and support clients through every stage of the process</li>
</ul>
<p>Here is a more detailed breakdown of how ICAN is addressing key Meaningful Use measures:</p>
<h3 class="post-title">Improved outcomes</h3>
<ul>
<li>Care Coordination (Electronically exchange information): Unlike most EHR offerings, <a href="#">athenaCommunicator&reg;</a>, with its Patient Portal and automated patient messaging, is designed to enhance patient involvement in their health care, enabling practices to meet these Meaningful Use measures.</li>
</ul>
<h3 class="post-title">Advanced clinical processes</h3>
<ul>
<li><strong>Use of e-Prescribing:</strong> MyHealthcareCompany is Surescripts&reg; certified for Prescription Benefit Eligibility, Formulary, and Reporting; Medication History (payer); Prescription Renewals (retail); and Prescription Routing for New Prescriptions (retail and mail-order).</li>
<li><strong>Closed Order Management: </strong>Because our EHR includes document management services, we make it easy for providers to create and send electronic orders from the encounter. Users can also track and close orders within the application for better follow-up and quality reporting.</li>
</ul>
<h3 class="post-title">Data capture and sharing</h3>
<ul>
<li><strong>Quality care and population management: </strong>MyHealthcareCompany&rsquo;s rules database provides a set of payer-specific quality measures and also allows for comprehensive and automatic demographic reporting.</li>
<li>Meaningful use offers an important opportunity for physicians to be financially rewarded for adopting an EHR that can effectively achieve measures. We at ICAN are here to help you navigate through the complexities of Meaningful Use, help you get all the incentive dollars you deserve, and free you from administrative red tape so you can focus on quality patient care.</li>
</ul>
<h3 class="post-title">Your Partner Through Reform and Change</h3>
<p>The HITECH Act and Meaningful Use is just one of many huge changes impacting physician practices today. Last year''s historic passage of the Patient Protection and Affordable Care Act set the stage for what will be some of the most significant changes to the U.S. health care system in a generation. To read in more detail about our perspective on the health care reform bill and our response to the challenges it presents, <a>click here</a></p>
<p>One recent manifestation of the reform bill was the release in March of the proposed rules for Accountable Care Organizations, or ACOs. To learn more about ACOs, what they might mean for your practice or organization, and how ICAN can help you navigate any payment future, <a href="cmp/ACO/_doc/ACO_NPRM_Summary.pdf">click here</a></p>
</div>
</div>', 2, N'24/7 Support', N'24-7-support', 4)
GO
INSERT [dbo].[ContentPages3] ([Id], [NavTitle], [Content], [PageId], [Title], [Route], [PageOrder]) VALUES (15, N'Data Backup', N'<div class="blog-single">
<div class="post-content">
<h3 class="post-title">Achieving Meaningful Use with ICAN</h3>
<div class="row">
<div class="col-md-8">According to the 2009 HITECH Act, physicians are eligible to receive up to $44,000 in total incentives per physician from Medicaid for "Meaningful Use" of a certified Electronic Health Record (EHR) starting this year (2011). (Note: Physicians reimbursed by Medicaid can receive up to approximately $63,750 starting in 2011 based on state-defined guidelines.) In July 2010, the Center for Medicare and Medicaid Services (CMS) released their rule for the Stage 1 Meaningful Use requirements that physicians need to meet in order to receive their Meaningful Use incentives. For our in-depth analysis of the rule, <a>click here</a>.</div>
<div class="col-md-4"><img style="margin-right: 5px;" src="https://via.placeholder.com/250x173.png?text=Visit+WhoIsHostingThis.com+Buyers+Guide" /></div>
</div>
<p><br />Medicaid payments have been coming in and beginning in late May our first physician clients began receiving their year one Medicare Meaningful Use checks for up to $18,000. You can read on our blog about the first ICAN client to get paid. These payments represent the first step in the validation and fulfillment of ICAN''s Federal Stimulus Bonus Payment Guarantee Program, unique in the industry for guaranteeing federal Meaningful Use incentive payments, not just Meaningful Use certification. To learn more about our Guarantee. <a href="guaranteedpayment.aspx">click here</a></p>
<h3 class="post-title">Guaranteed Incentives, Nimble Technology</h3>
<p>How can we be so confident in our ability to meet Meaningful Use that we are willing to put our own money on the line?* And why do 100% of our clients share that confidence, according to our surveys, "Ambulatory EMR: On Track for Meaningful Use?" <br />Unlike traditional software or ASP-based EHRs, where all the work involved in meeting and tracking Meaningful Use performance falls on the practice, HITS provides a full-service solution with no extra or hidden costs. Our service includes, at no extra cost: </p>
<ul>
<li>Administrative support that takes on cumbersome tasks of registration and attestation with government agencies</li>
<li>Fully certified clinical quality measures built into the workflow with our proprietary HITS&reg;</li>
<li>A Meaningful Use Resource Center website where clients have access to all the information they need&mdash;at their fingertips</li>
<li>Expert performance coaching to guide and support clients through every stage of the process</li>
</ul>
<p>Here is a more detailed breakdown of how ICAN is addressing key Meaningful Use measures:</p>
<h3 class="post-title">Improved outcomes</h3>
<ul>
<li>Care Coordination (Electronically exchange information): Unlike most EHR offerings, <a href="#">athenaCommunicator&reg;</a>, with its Patient Portal and automated patient messaging, is designed to enhance patient involvement in their health care, enabling practices to meet these Meaningful Use measures.</li>
</ul>
<h3 class="post-title">Advanced clinical processes</h3>
<ul>
<li><strong>Use of e-Prescribing:</strong> MyHealthcareCompany is Surescripts&reg; certified for Prescription Benefit Eligibility, Formulary, and Reporting; Medication History (payer); Prescription Renewals (retail); and Prescription Routing for New Prescriptions (retail and mail-order).</li>
<li><strong>Closed Order Management: </strong>Because our EHR includes document management services, we make it easy for providers to create and send electronic orders from the encounter. Users can also track and close orders within the application for better follow-up and quality reporting.</li>
</ul>
<h3 class="post-title">Data capture and sharing</h3>
<ul>
<li><strong>Quality care and population management: </strong>MyHealthcareCompany&rsquo;s rules database provides a set of payer-specific quality measures and also allows for comprehensive and automatic demographic reporting.</li>
<li>Meaningful use offers an important opportunity for physicians to be financially rewarded for adopting an EHR that can effectively achieve measures. We at ICAN are here to help you navigate through the complexities of Meaningful Use, help you get all the incentive dollars you deserve, and free you from administrative red tape so you can focus on quality patient care.</li>
</ul>
<h3 class="post-title">Your Partner Through Reform and Change</h3>
<p>The HITECH Act and Meaningful Use is just one of many huge changes impacting physician practices today. Last year''s historic passage of the Patient Protection and Affordable Care Act set the stage for what will be some of the most significant changes to the U.S. health care system in a generation. To read in more detail about our perspective on the health care reform bill and our response to the challenges it presents, <a>click here</a></p>
<p>One recent manifestation of the reform bill was the release in March of the proposed rules for Accountable Care Organizations, or ACOs. To learn more about ACOs, what they might mean for your practice or organization, and how ICAN can help you navigate any payment future, <a href="cmp/ACO/_doc/ACO_NPRM_Summary.pdf">click here</a></p>
</div>
</div>', 2, N'Data Backup', N'data-backup', 5)
GO
INSERT [dbo].[ContentPages3] ([Id], [NavTitle], [Content], [PageId], [Title], [Route], [PageOrder]) VALUES (16, N'Employee Screening', N'<div class="blog-single">
<div class="post-content">
<h3 class="post-title">Achieving Meaningful Use with ICAN</h3>
<div class="row">
<div class="col-md-8">According to the 2009 HITECH Act, physicians are eligible to receive up to $44,000 in total incentives per physician from Medicaid for "Meaningful Use" of a certified Electronic Health Record (EHR) starting this year (2011). (Note: Physicians reimbursed by Medicaid can receive up to approximately $63,750 starting in 2011 based on state-defined guidelines.) In July 2010, the Center for Medicare and Medicaid Services (CMS) released their rule for the Stage 1 Meaningful Use requirements that physicians need to meet in order to receive their Meaningful Use incentives. For our in-depth analysis of the rule, <a>click here</a>.</div>
<div class="col-md-4"><img style="margin-right: 5px;" src="https://via.placeholder.com/250x173.png?text=Visit+WhoIsHostingThis.com+Buyers+Guide" /></div>
</div>
<p><br />Medicaid payments have been coming in and beginning in late May our first physician clients began receiving their year one Medicare Meaningful Use checks for up to $18,000. You can read on our blog about the first ICAN client to get paid. These payments represent the first step in the validation and fulfillment of ICAN''s Federal Stimulus Bonus Payment Guarantee Program, unique in the industry for guaranteeing federal Meaningful Use incentive payments, not just Meaningful Use certification. To learn more about our Guarantee. <a href="guaranteedpayment.aspx">click here</a></p>
<h3 class="post-title">Guaranteed Incentives, Nimble Technology</h3>
<p>How can we be so confident in our ability to meet Meaningful Use that we are willing to put our own money on the line?* And why do 100% of our clients share that confidence, according to our surveys, "Ambulatory EMR: On Track for Meaningful Use?" <br />Unlike traditional software or ASP-based EHRs, where all the work involved in meeting and tracking Meaningful Use performance falls on the practice, HITS provides a full-service solution with no extra or hidden costs. Our service includes, at no extra cost: </p>
<ul>
<li>Administrative support that takes on cumbersome tasks of registration and attestation with government agencies</li>
<li>Fully certified clinical quality measures built into the workflow with our proprietary HITS&reg;</li>
<li>A Meaningful Use Resource Center website where clients have access to all the information they need&mdash;at their fingertips</li>
<li>Expert performance coaching to guide and support clients through every stage of the process</li>
</ul>
<p>Here is a more detailed breakdown of how ICAN is addressing key Meaningful Use measures:</p>
<h3 class="post-title">Improved outcomes</h3>
<ul>
<li>Care Coordination (Electronically exchange information): Unlike most EHR offerings, <a href="#">athenaCommunicator&reg;</a>, with its Patient Portal and automated patient messaging, is designed to enhance patient involvement in their health care, enabling practices to meet these Meaningful Use measures.</li>
</ul>
<h3 class="post-title">Advanced clinical processes</h3>
<ul>
<li><strong>Use of e-Prescribing:</strong> MyHealthcareCompany is Surescripts&reg; certified for Prescription Benefit Eligibility, Formulary, and Reporting; Medication History (payer); Prescription Renewals (retail); and Prescription Routing for New Prescriptions (retail and mail-order).</li>
<li><strong>Closed Order Management: </strong>Because our EHR includes document management services, we make it easy for providers to create and send electronic orders from the encounter. Users can also track and close orders within the application for better follow-up and quality reporting.</li>
</ul>
<h3 class="post-title">Data capture and sharing</h3>
<ul>
<li><strong>Quality care and population management: </strong>MyHealthcareCompany&rsquo;s rules database provides a set of payer-specific quality measures and also allows for comprehensive and automatic demographic reporting.</li>
<li>Meaningful use offers an important opportunity for physicians to be financially rewarded for adopting an EHR that can effectively achieve measures. We at ICAN are here to help you navigate through the complexities of Meaningful Use, help you get all the incentive dollars you deserve, and free you from administrative red tape so you can focus on quality patient care.</li>
</ul>
<h3 class="post-title">Your Partner Through Reform and Change</h3>
<p>The HITECH Act and Meaningful Use is just one of many huge changes impacting physician practices today. Last year''s historic passage of the Patient Protection and Affordable Care Act set the stage for what will be some of the most significant changes to the U.S. health care system in a generation. To read in more detail about our perspective on the health care reform bill and our response to the challenges it presents, <a>click here</a></p>
<p>One recent manifestation of the reform bill was the release in March of the proposed rules for Accountable Care Organizations, or ACOs. To learn more about ACOs, what they might mean for your practice or organization, and how ICAN can help you navigate any payment future, <a href="cmp/ACO/_doc/ACO_NPRM_Summary.pdf">click here</a></p>
</div>
</div>', 2, N'Employee Screening', N'employee-screening', 6)
GO
INSERT [dbo].[ContentPages3] ([Id], [NavTitle], [Content], [PageId], [Title], [Route], [PageOrder]) VALUES (17, N'Eligibility Checks', N'<div class="blog-single">
<div class="post-content">
<h3 class="post-title">Achieving Meaningful Use with ICAN</h3>
<div class="row">
<div class="col-md-8">According to the 2009 HITECH Act, physicians are eligible to receive up to $44,000 in total incentives per physician from Medicaid for "Meaningful Use" of a certified Electronic Health Record (EHR) starting this year (2011). (Note: Physicians reimbursed by Medicaid can receive up to approximately $63,750 starting in 2011 based on state-defined guidelines.) In July 2010, the Center for Medicare and Medicaid Services (CMS) released their rule for the Stage 1 Meaningful Use requirements that physicians need to meet in order to receive their Meaningful Use incentives. For our in-depth analysis of the rule, <a>click here</a>.</div>
<div class="col-md-4"><img style="margin-right: 5px;" src="https://via.placeholder.com/250x173.png?text=Visit+WhoIsHostingThis.com+Buyers+Guide" /></div>
</div>
<p><br />Medicaid payments have been coming in and beginning in late May our first physician clients began receiving their year one Medicare Meaningful Use checks for up to $18,000. You can read on our blog about the first ICAN client to get paid. These payments represent the first step in the validation and fulfillment of ICAN''s Federal Stimulus Bonus Payment Guarantee Program, unique in the industry for guaranteeing federal Meaningful Use incentive payments, not just Meaningful Use certification. To learn more about our Guarantee. <a href="guaranteedpayment.aspx">click here</a></p>
<h3 class="post-title">Guaranteed Incentives, Nimble Technology</h3>
<p>How can we be so confident in our ability to meet Meaningful Use that we are willing to put our own money on the line?* And why do 100% of our clients share that confidence, according to our surveys, "Ambulatory EMR: On Track for Meaningful Use?" <br />Unlike traditional software or ASP-based EHRs, where all the work involved in meeting and tracking Meaningful Use performance falls on the practice, HITS provides a full-service solution with no extra or hidden costs. Our service includes, at no extra cost: </p>
<ul>
<li>Administrative support that takes on cumbersome tasks of registration and attestation with government agencies</li>
<li>Fully certified clinical quality measures built into the workflow with our proprietary HITS&reg;</li>
<li>A Meaningful Use Resource Center website where clients have access to all the information they need&mdash;at their fingertips</li>
<li>Expert performance coaching to guide and support clients through every stage of the process</li>
</ul>
<p>Here is a more detailed breakdown of how ICAN is addressing key Meaningful Use measures:</p>
<h3 class="post-title">Improved outcomes</h3>
<ul>
<li>Care Coordination (Electronically exchange information): Unlike most EHR offerings, <a href="#">athenaCommunicator&reg;</a>, with its Patient Portal and automated patient messaging, is designed to enhance patient involvement in their health care, enabling practices to meet these Meaningful Use measures.</li>
</ul>
<h3 class="post-title">Advanced clinical processes</h3>
<ul>
<li><strong>Use of e-Prescribing:</strong> MyHealthcareCompany is Surescripts&reg; certified for Prescription Benefit Eligibility, Formulary, and Reporting; Medication History (payer); Prescription Renewals (retail); and Prescription Routing for New Prescriptions (retail and mail-order).</li>
<li><strong>Closed Order Management: </strong>Because our EHR includes document management services, we make it easy for providers to create and send electronic orders from the encounter. Users can also track and close orders within the application for better follow-up and quality reporting.</li>
</ul>
<h3 class="post-title">Data capture and sharing</h3>
<ul>
<li><strong>Quality care and population management: </strong>MyHealthcareCompany&rsquo;s rules database provides a set of payer-specific quality measures and also allows for comprehensive and automatic demographic reporting.</li>
<li>Meaningful use offers an important opportunity for physicians to be financially rewarded for adopting an EHR that can effectively achieve measures. We at ICAN are here to help you navigate through the complexities of Meaningful Use, help you get all the incentive dollars you deserve, and free you from administrative red tape so you can focus on quality patient care.</li>
</ul>
<h3 class="post-title">Your Partner Through Reform and Change</h3>
<p>The HITECH Act and Meaningful Use is just one of many huge changes impacting physician practices today. Last year''s historic passage of the Patient Protection and Affordable Care Act set the stage for what will be some of the most significant changes to the U.S. health care system in a generation. To read in more detail about our perspective on the health care reform bill and our response to the challenges it presents, <a>click here</a></p>
<p>One recent manifestation of the reform bill was the release in March of the proposed rules for Accountable Care Organizations, or ACOs. To learn more about ACOs, what they might mean for your practice or organization, and how ICAN can help you navigate any payment future, <a href="cmp/ACO/_doc/ACO_NPRM_Summary.pdf">click here</a></p>
</div>
</div>', 2, N'Eligibility Checks', N'eligibility-checks', 7)
GO
INSERT [dbo].[ContentPages3] ([Id], [NavTitle], [Content], [PageId], [Title], [Route], [PageOrder]) VALUES (18, N'Plagiarism Checks', N'<div class="blog-single">
<div class="post-content">
<h3 class="post-title">Achieving Meaningful Use with ICAN</h3>
<div class="row">
<div class="col-md-8">According to the 2009 HITECH Act, physicians are eligible to receive up to $44,000 in total incentives per physician from Medicaid for "Meaningful Use" of a certified Electronic Health Record (EHR) starting this year (2011). (Note: Physicians reimbursed by Medicaid can receive up to approximately $63,750 starting in 2011 based on state-defined guidelines.) In July 2010, the Center for Medicare and Medicaid Services (CMS) released their rule for the Stage 1 Meaningful Use requirements that physicians need to meet in order to receive their Meaningful Use incentives. For our in-depth analysis of the rule, <a>click here</a>.</div>
<div class="col-md-4"><img style="margin-right: 5px;" src="https://via.placeholder.com/250x173.png?text=Visit+WhoIsHostingThis.com+Buyers+Guide" /></div>
</div>
<p><br />Medicaid payments have been coming in and beginning in late May our first physician clients began receiving their year one Medicare Meaningful Use checks for up to $18,000. You can read on our blog about the first ICAN client to get paid. These payments represent the first step in the validation and fulfillment of ICAN''s Federal Stimulus Bonus Payment Guarantee Program, unique in the industry for guaranteeing federal Meaningful Use incentive payments, not just Meaningful Use certification. To learn more about our Guarantee. <a href="guaranteedpayment.aspx">click here</a></p>
<h3 class="post-title">Guaranteed Incentives, Nimble Technology</h3>
<p>How can we be so confident in our ability to meet Meaningful Use that we are willing to put our own money on the line?* And why do 100% of our clients share that confidence, according to our surveys, "Ambulatory EMR: On Track for Meaningful Use?" <br />Unlike traditional software or ASP-based EHRs, where all the work involved in meeting and tracking Meaningful Use performance falls on the practice, HITS provides a full-service solution with no extra or hidden costs. Our service includes, at no extra cost: </p>
<ul>
<li>Administrative support that takes on cumbersome tasks of registration and attestation with government agencies</li>
<li>Fully certified clinical quality measures built into the workflow with our proprietary HITS&reg;</li>
<li>A Meaningful Use Resource Center website where clients have access to all the information they need&mdash;at their fingertips</li>
<li>Expert performance coaching to guide and support clients through every stage of the process</li>
</ul>
<p>Here is a more detailed breakdown of how ICAN is addressing key Meaningful Use measures:</p>
<h3 class="post-title">Improved outcomes</h3>
<ul>
<li>Care Coordination (Electronically exchange information): Unlike most EHR offerings, <a href="#">athenaCommunicator&reg;</a>, with its Patient Portal and automated patient messaging, is designed to enhance patient involvement in their health care, enabling practices to meet these Meaningful Use measures.</li>
</ul>
<h3 class="post-title">Advanced clinical processes</h3>
<ul>
<li><strong>Use of e-Prescribing:</strong> MyHealthcareCompany is Surescripts&reg; certified for Prescription Benefit Eligibility, Formulary, and Reporting; Medication History (payer); Prescription Renewals (retail); and Prescription Routing for New Prescriptions (retail and mail-order).</li>
<li><strong>Closed Order Management: </strong>Because our EHR includes document management services, we make it easy for providers to create and send electronic orders from the encounter. Users can also track and close orders within the application for better follow-up and quality reporting.</li>
</ul>
<h3 class="post-title">Data capture and sharing</h3>
<ul>
<li><strong>Quality care and population management: </strong>MyHealthcareCompany&rsquo;s rules database provides a set of payer-specific quality measures and also allows for comprehensive and automatic demographic reporting.</li>
<li>Meaningful use offers an important opportunity for physicians to be financially rewarded for adopting an EHR that can effectively achieve measures. We at ICAN are here to help you navigate through the complexities of Meaningful Use, help you get all the incentive dollars you deserve, and free you from administrative red tape so you can focus on quality patient care.</li>
</ul>
<h3 class="post-title">Your Partner Through Reform and Change</h3>
<p>The HITECH Act and Meaningful Use is just one of many huge changes impacting physician practices today. Last year''s historic passage of the Patient Protection and Affordable Care Act set the stage for what will be some of the most significant changes to the U.S. health care system in a generation. To read in more detail about our perspective on the health care reform bill and our response to the challenges it presents, <a>click here</a></p>
<p>One recent manifestation of the reform bill was the release in March of the proposed rules for Accountable Care Organizations, or ACOs. To learn more about ACOs, what they might mean for your practice or organization, and how ICAN can help you navigate any payment future, <a href="cmp/ACO/_doc/ACO_NPRM_Summary.pdf">click here</a></p>
</div>
</div>', 2, N'Plagiarism Checks', N'plagiarism-checks', 8)
GO
INSERT [dbo].[ContentPages3] ([Id], [NavTitle], [Content], [PageId], [Title], [Route], [PageOrder]) VALUES (19, N'Real-Time Reporting', N'<div class="blog-single">
<div class="post-content">
<h3 class="post-title">Achieving Meaningful Use with ICAN</h3>
<div class="row">
<div class="col-md-8">According to the 2009 HITECH Act, physicians are eligible to receive up to $44,000 in total incentives per physician from Medicaid for "Meaningful Use" of a certified Electronic Health Record (EHR) starting this year (2011). (Note: Physicians reimbursed by Medicaid can receive up to approximately $63,750 starting in 2011 based on state-defined guidelines.) In July 2010, the Center for Medicare and Medicaid Services (CMS) released their rule for the Stage 1 Meaningful Use requirements that physicians need to meet in order to receive their Meaningful Use incentives. For our in-depth analysis of the rule, <a>click here</a>.</div>
<div class="col-md-4"><img style="margin-right: 5px;" src="https://via.placeholder.com/250x173.png?text=Visit+WhoIsHostingThis.com+Buyers+Guide" /></div>
</div>
<p><br />Medicaid payments have been coming in and beginning in late May our first physician clients began receiving their year one Medicare Meaningful Use checks for up to $18,000. You can read on our blog about the first ICAN client to get paid. These payments represent the first step in the validation and fulfillment of ICAN''s Federal Stimulus Bonus Payment Guarantee Program, unique in the industry for guaranteeing federal Meaningful Use incentive payments, not just Meaningful Use certification. To learn more about our Guarantee. <a href="guaranteedpayment.aspx">click here</a></p>
<h3 class="post-title">Guaranteed Incentives, Nimble Technology</h3>
<p>How can we be so confident in our ability to meet Meaningful Use that we are willing to put our own money on the line?* And why do 100% of our clients share that confidence, according to our surveys, "Ambulatory EMR: On Track for Meaningful Use?" <br />Unlike traditional software or ASP-based EHRs, where all the work involved in meeting and tracking Meaningful Use performance falls on the practice, HITS provides a full-service solution with no extra or hidden costs. Our service includes, at no extra cost: </p>
<ul>
<li>Administrative support that takes on cumbersome tasks of registration and attestation with government agencies</li>
<li>Fully certified clinical quality measures built into the workflow with our proprietary HITS&reg;</li>
<li>A Meaningful Use Resource Center website where clients have access to all the information they need&mdash;at their fingertips</li>
<li>Expert performance coaching to guide and support clients through every stage of the process</li>
</ul>
<p>Here is a more detailed breakdown of how ICAN is addressing key Meaningful Use measures:</p>
<h3 class="post-title">Improved outcomes</h3>
<ul>
<li>Care Coordination (Electronically exchange information): Unlike most EHR offerings, <a href="#">athenaCommunicator&reg;</a>, with its Patient Portal and automated patient messaging, is designed to enhance patient involvement in their health care, enabling practices to meet these Meaningful Use measures.</li>
</ul>
<h3 class="post-title">Advanced clinical processes</h3>
<ul>
<li><strong>Use of e-Prescribing:</strong> MyHealthcareCompany is Surescripts&reg; certified for Prescription Benefit Eligibility, Formulary, and Reporting; Medication History (payer); Prescription Renewals (retail); and Prescription Routing for New Prescriptions (retail and mail-order).</li>
<li><strong>Closed Order Management: </strong>Because our EHR includes document management services, we make it easy for providers to create and send electronic orders from the encounter. Users can also track and close orders within the application for better follow-up and quality reporting.</li>
</ul>
<h3 class="post-title">Data capture and sharing</h3>
<ul>
<li><strong>Quality care and population management: </strong>MyHealthcareCompany&rsquo;s rules database provides a set of payer-specific quality measures and also allows for comprehensive and automatic demographic reporting.</li>
<li>Meaningful use offers an important opportunity for physicians to be financially rewarded for adopting an EHR that can effectively achieve measures. We at ICAN are here to help you navigate through the complexities of Meaningful Use, help you get all the incentive dollars you deserve, and free you from administrative red tape so you can focus on quality patient care.</li>
</ul>
<h3 class="post-title">Your Partner Through Reform and Change</h3>
<p>The HITECH Act and Meaningful Use is just one of many huge changes impacting physician practices today. Last year''s historic passage of the Patient Protection and Affordable Care Act set the stage for what will be some of the most significant changes to the U.S. health care system in a generation. To read in more detail about our perspective on the health care reform bill and our response to the challenges it presents, <a>click here</a></p>
<p>One recent manifestation of the reform bill was the release in March of the proposed rules for Accountable Care Organizations, or ACOs. To learn more about ACOs, what they might mean for your practice or organization, and how ICAN can help you navigate any payment future, <a href="cmp/ACO/_doc/ACO_NPRM_Summary.pdf">click here</a></p>
</div>
</div>', 2, N'Real-Time Reporting', N'real-time-reporting', 9)
GO
INSERT [dbo].[ContentPages3] ([Id], [NavTitle], [Content], [PageId], [Title], [Route], [PageOrder]) VALUES (20, N'Payroll Generation', N'<div class="blog-single">
<div class="post-content">
<h3 class="post-title">Achieving Meaningful Use with ICAN</h3>
<div class="row">
<div class="col-md-8">According to the 2009 HITECH Act, physicians are eligible to receive up to $44,000 in total incentives per physician from Medicaid for "Meaningful Use" of a certified Electronic Health Record (EHR) starting this year (2011). (Note: Physicians reimbursed by Medicaid can receive up to approximately $63,750 starting in 2011 based on state-defined guidelines.) In July 2010, the Center for Medicare and Medicaid Services (CMS) released their rule for the Stage 1 Meaningful Use requirements that physicians need to meet in order to receive their Meaningful Use incentives. For our in-depth analysis of the rule, <a>click here</a>.</div>
<div class="col-md-4"><img style="margin-right: 5px;" src="https://via.placeholder.com/250x173.png?text=Visit+WhoIsHostingThis.com+Buyers+Guide" /></div>
</div>
<p><br />Medicaid payments have been coming in and beginning in late May our first physician clients began receiving their year one Medicare Meaningful Use checks for up to $18,000. You can read on our blog about the first ICAN client to get paid. These payments represent the first step in the validation and fulfillment of ICAN''s Federal Stimulus Bonus Payment Guarantee Program, unique in the industry for guaranteeing federal Meaningful Use incentive payments, not just Meaningful Use certification. To learn more about our Guarantee. <a href="guaranteedpayment.aspx">click here</a></p>
<h3 class="post-title">Guaranteed Incentives, Nimble Technology</h3>
<p>How can we be so confident in our ability to meet Meaningful Use that we are willing to put our own money on the line?* And why do 100% of our clients share that confidence, according to our surveys, "Ambulatory EMR: On Track for Meaningful Use?" <br />Unlike traditional software or ASP-based EHRs, where all the work involved in meeting and tracking Meaningful Use performance falls on the practice, HITS provides a full-service solution with no extra or hidden costs. Our service includes, at no extra cost: </p>
<ul>
<li>Administrative support that takes on cumbersome tasks of registration and attestation with government agencies</li>
<li>Fully certified clinical quality measures built into the workflow with our proprietary HITS&reg;</li>
<li>A Meaningful Use Resource Center website where clients have access to all the information they need&mdash;at their fingertips</li>
<li>Expert performance coaching to guide and support clients through every stage of the process</li>
</ul>
<p>Here is a more detailed breakdown of how ICAN is addressing key Meaningful Use measures:</p>
<h3 class="post-title">Improved outcomes</h3>
<ul>
<li>Care Coordination (Electronically exchange information): Unlike most EHR offerings, <a href="#">athenaCommunicator&reg;</a>, with its Patient Portal and automated patient messaging, is designed to enhance patient involvement in their health care, enabling practices to meet these Meaningful Use measures.</li>
</ul>
<h3 class="post-title">Advanced clinical processes</h3>
<ul>
<li><strong>Use of e-Prescribing:</strong> MyHealthcareCompany is Surescripts&reg; certified for Prescription Benefit Eligibility, Formulary, and Reporting; Medication History (payer); Prescription Renewals (retail); and Prescription Routing for New Prescriptions (retail and mail-order).</li>
<li><strong>Closed Order Management: </strong>Because our EHR includes document management services, we make it easy for providers to create and send electronic orders from the encounter. Users can also track and close orders within the application for better follow-up and quality reporting.</li>
</ul>
<h3 class="post-title">Data capture and sharing</h3>
<ul>
<li><strong>Quality care and population management: </strong>MyHealthcareCompany&rsquo;s rules database provides a set of payer-specific quality measures and also allows for comprehensive and automatic demographic reporting.</li>
<li>Meaningful use offers an important opportunity for physicians to be financially rewarded for adopting an EHR that can effectively achieve measures. We at ICAN are here to help you navigate through the complexities of Meaningful Use, help you get all the incentive dollars you deserve, and free you from administrative red tape so you can focus on quality patient care.</li>
</ul>
<h3 class="post-title">Your Partner Through Reform and Change</h3>
<p>The HITECH Act and Meaningful Use is just one of many huge changes impacting physician practices today. Last year''s historic passage of the Patient Protection and Affordable Care Act set the stage for what will be some of the most significant changes to the U.S. health care system in a generation. To read in more detail about our perspective on the health care reform bill and our response to the challenges it presents, <a>click here</a></p>
<p>One recent manifestation of the reform bill was the release in March of the proposed rules for Accountable Care Organizations, or ACOs. To learn more about ACOs, what they might mean for your practice or organization, and how ICAN can help you navigate any payment future, <a href="cmp/ACO/_doc/ACO_NPRM_Summary.pdf">click here</a></p>
</div>
</div>', 2, N'Payroll Generation', N'payroll-generation', 10)
GO
INSERT [dbo].[ContentPages3] ([Id], [NavTitle], [Content], [PageId], [Title], [Route], [PageOrder]) VALUES (21, N'Multiple Locations', N'<div class="blog-single">
<div class="post-content">
<h3 class="post-title">Achieving Meaningful Use with ICAN</h3>
<div class="row">
<div class="col-md-8">According to the 2009 HITECH Act, physicians are eligible to receive up to $44,000 in total incentives per physician from Medicaid for "Meaningful Use" of a certified Electronic Health Record (EHR) starting this year (2011). (Note: Physicians reimbursed by Medicaid can receive up to approximately $63,750 starting in 2011 based on state-defined guidelines.) In July 2010, the Center for Medicare and Medicaid Services (CMS) released their rule for the Stage 1 Meaningful Use requirements that physicians need to meet in order to receive their Meaningful Use incentives. For our in-depth analysis of the rule, <a>click here</a>.</div>
<div class="col-md-4"><img style="margin-right: 5px;" src="https://via.placeholder.com/250x173.png?text=Visit+WhoIsHostingThis.com+Buyers+Guide" /></div>
</div>
<p><br />Medicaid payments have been coming in and beginning in late May our first physician clients began receiving their year one Medicare Meaningful Use checks for up to $18,000. You can read on our blog about the first ICAN client to get paid. These payments represent the first step in the validation and fulfillment of ICAN''s Federal Stimulus Bonus Payment Guarantee Program, unique in the industry for guaranteeing federal Meaningful Use incentive payments, not just Meaningful Use certification. To learn more about our Guarantee. <a href="guaranteedpayment.aspx">click here</a></p>
<h3 class="post-title">Guaranteed Incentives, Nimble Technology</h3>
<p>How can we be so confident in our ability to meet Meaningful Use that we are willing to put our own money on the line?* And why do 100% of our clients share that confidence, according to our surveys, "Ambulatory EMR: On Track for Meaningful Use?" <br />Unlike traditional software or ASP-based EHRs, where all the work involved in meeting and tracking Meaningful Use performance falls on the practice, HITS provides a full-service solution with no extra or hidden costs. Our service includes, at no extra cost: </p>
<ul>
<li>Administrative support that takes on cumbersome tasks of registration and attestation with government agencies</li>
<li>Fully certified clinical quality measures built into the workflow with our proprietary HITS&reg;</li>
<li>A Meaningful Use Resource Center website where clients have access to all the information they need&mdash;at their fingertips</li>
<li>Expert performance coaching to guide and support clients through every stage of the process</li>
</ul>
<p>Here is a more detailed breakdown of how ICAN is addressing key Meaningful Use measures:</p>
<h3 class="post-title">Improved outcomes</h3>
<ul>
<li>Care Coordination (Electronically exchange information): Unlike most EHR offerings, <a href="#">athenaCommunicator&reg;</a>, with its Patient Portal and automated patient messaging, is designed to enhance patient involvement in their health care, enabling practices to meet these Meaningful Use measures.</li>
</ul>
<h3 class="post-title">Advanced clinical processes</h3>
<ul>
<li><strong>Use of e-Prescribing:</strong> MyHealthcareCompany is Surescripts&reg; certified for Prescription Benefit Eligibility, Formulary, and Reporting; Medication History (payer); Prescription Renewals (retail); and Prescription Routing for New Prescriptions (retail and mail-order).</li>
<li><strong>Closed Order Management: </strong>Because our EHR includes document management services, we make it easy for providers to create and send electronic orders from the encounter. Users can also track and close orders within the application for better follow-up and quality reporting.</li>
</ul>
<h3 class="post-title">Data capture and sharing</h3>
<ul>
<li><strong>Quality care and population management: </strong>MyHealthcareCompany&rsquo;s rules database provides a set of payer-specific quality measures and also allows for comprehensive and automatic demographic reporting.</li>
<li>Meaningful use offers an important opportunity for physicians to be financially rewarded for adopting an EHR that can effectively achieve measures. We at ICAN are here to help you navigate through the complexities of Meaningful Use, help you get all the incentive dollars you deserve, and free you from administrative red tape so you can focus on quality patient care.</li>
</ul>
<h3 class="post-title">Your Partner Through Reform and Change</h3>
<p>The HITECH Act and Meaningful Use is just one of many huge changes impacting physician practices today. Last year''s historic passage of the Patient Protection and Affordable Care Act set the stage for what will be some of the most significant changes to the U.S. health care system in a generation. To read in more detail about our perspective on the health care reform bill and our response to the challenges it presents, <a>click here</a></p>
<p>One recent manifestation of the reform bill was the release in March of the proposed rules for Accountable Care Organizations, or ACOs. To learn more about ACOs, what they might mean for your practice or organization, and how ICAN can help you navigate any payment future, <a href="cmp/ACO/_doc/ACO_NPRM_Summary.pdf">click here</a></p>
</div>
</div>', 2, N'Multiple Locations', N'multiple-locations', 11)
GO
INSERT [dbo].[ContentPages3] ([Id], [NavTitle], [Content], [PageId], [Title], [Route], [PageOrder]) VALUES (22, N'E-Prescribing', N'<div class="blog-single">
<div class="post-content">
<h3 class="post-title">Achieving Meaningful Use with ICAN</h3>
<div class="row">
<div class="col-md-8">According to the 2009 HITECH Act, physicians are eligible to receive up to $44,000 in total incentives per physician from Medicaid for "Meaningful Use" of a certified Electronic Health Record (EHR) starting this year (2011). (Note: Physicians reimbursed by Medicaid can receive up to approximately $63,750 starting in 2011 based on state-defined guidelines.) In July 2010, the Center for Medicare and Medicaid Services (CMS) released their rule for the Stage 1 Meaningful Use requirements that physicians need to meet in order to receive their Meaningful Use incentives. For our in-depth analysis of the rule, <a>click here</a>.</div>
<div class="col-md-4"><img style="margin-right: 5px;" src="https://via.placeholder.com/250x173.png?text=Visit+WhoIsHostingThis.com+Buyers+Guide" /></div>
</div>
<p><br />Medicaid payments have been coming in and beginning in late May our first physician clients began receiving their year one Medicare Meaningful Use checks for up to $18,000. You can read on our blog about the first ICAN client to get paid. These payments represent the first step in the validation and fulfillment of ICAN''s Federal Stimulus Bonus Payment Guarantee Program, unique in the industry for guaranteeing federal Meaningful Use incentive payments, not just Meaningful Use certification. To learn more about our Guarantee. <a href="guaranteedpayment.aspx">click here</a></p>
<h3 class="post-title">Guaranteed Incentives, Nimble Technology</h3>
<p>How can we be so confident in our ability to meet Meaningful Use that we are willing to put our own money on the line?* And why do 100% of our clients share that confidence, according to our surveys, "Ambulatory EMR: On Track for Meaningful Use?" <br />Unlike traditional software or ASP-based EHRs, where all the work involved in meeting and tracking Meaningful Use performance falls on the practice, HITS provides a full-service solution with no extra or hidden costs. Our service includes, at no extra cost: </p>
<ul>
<li>Administrative support that takes on cumbersome tasks of registration and attestation with government agencies</li>
<li>Fully certified clinical quality measures built into the workflow with our proprietary HITS&reg;</li>
<li>A Meaningful Use Resource Center website where clients have access to all the information they need&mdash;at their fingertips</li>
<li>Expert performance coaching to guide and support clients through every stage of the process</li>
</ul>
<p>Here is a more detailed breakdown of how ICAN is addressing key Meaningful Use measures:</p>
<h3 class="post-title">Improved outcomes</h3>
<ul>
<li>Care Coordination (Electronically exchange information): Unlike most EHR offerings, <a href="#">athenaCommunicator&reg;</a>, with its Patient Portal and automated patient messaging, is designed to enhance patient involvement in their health care, enabling practices to meet these Meaningful Use measures.</li>
</ul>
<h3 class="post-title">Advanced clinical processes</h3>
<ul>
<li><strong>Use of e-Prescribing:</strong> MyHealthcareCompany is Surescripts&reg; certified for Prescription Benefit Eligibility, Formulary, and Reporting; Medication History (payer); Prescription Renewals (retail); and Prescription Routing for New Prescriptions (retail and mail-order).</li>
<li><strong>Closed Order Management: </strong>Because our EHR includes document management services, we make it easy for providers to create and send electronic orders from the encounter. Users can also track and close orders within the application for better follow-up and quality reporting.</li>
</ul>
<h3 class="post-title">Data capture and sharing</h3>
<ul>
<li><strong>Quality care and population management: </strong>MyHealthcareCompany&rsquo;s rules database provides a set of payer-specific quality measures and also allows for comprehensive and automatic demographic reporting.</li>
<li>Meaningful use offers an important opportunity for physicians to be financially rewarded for adopting an EHR that can effectively achieve measures. We at ICAN are here to help you navigate through the complexities of Meaningful Use, help you get all the incentive dollars you deserve, and free you from administrative red tape so you can focus on quality patient care.</li>
</ul>
<h3 class="post-title">Your Partner Through Reform and Change</h3>
<p>The HITECH Act and Meaningful Use is just one of many huge changes impacting physician practices today. Last year''s historic passage of the Patient Protection and Affordable Care Act set the stage for what will be some of the most significant changes to the U.S. health care system in a generation. To read in more detail about our perspective on the health care reform bill and our response to the challenges it presents, <a>click here</a></p>
<p>One recent manifestation of the reform bill was the release in March of the proposed rules for Accountable Care Organizations, or ACOs. To learn more about ACOs, what they might mean for your practice or organization, and how ICAN can help you navigate any payment future, <a href="cmp/ACO/_doc/ACO_NPRM_Summary.pdf">click here</a></p>
</div>
</div>', 2, N'E-Prescribing', N'E-prescribing', 12)
GO
INSERT [dbo].[ContentPages3] ([Id], [NavTitle], [Content], [PageId], [Title], [Route], [PageOrder]) VALUES (23, N'Lab Results', N'<div class="blog-single">
<div class="post-content">
<h3 class="post-title">Achieving Meaningful Use with ICAN</h3>
<div class="row">
<div class="col-md-8">According to the 2009 HITECH Act, physicians are eligible to receive up to $44,000 in total incentives per physician from Medicaid for "Meaningful Use" of a certified Electronic Health Record (EHR) starting this year (2011). (Note: Physicians reimbursed by Medicaid can receive up to approximately $63,750 starting in 2011 based on state-defined guidelines.) In July 2010, the Center for Medicare and Medicaid Services (CMS) released their rule for the Stage 1 Meaningful Use requirements that physicians need to meet in order to receive their Meaningful Use incentives. For our in-depth analysis of the rule, <a>click here</a>.</div>
<div class="col-md-4"><img style="margin-right: 5px;" src="https://via.placeholder.com/250x173.png?text=Visit+WhoIsHostingThis.com+Buyers+Guide" /></div>
</div>
<p><br />Medicaid payments have been coming in and beginning in late May our first physician clients began receiving their year one Medicare Meaningful Use checks for up to $18,000. You can read on our blog about the first ICAN client to get paid. These payments represent the first step in the validation and fulfillment of ICAN''s Federal Stimulus Bonus Payment Guarantee Program, unique in the industry for guaranteeing federal Meaningful Use incentive payments, not just Meaningful Use certification. To learn more about our Guarantee. <a href="guaranteedpayment.aspx">click here</a></p>
<h3 class="post-title">Guaranteed Incentives, Nimble Technology</h3>
<p>How can we be so confident in our ability to meet Meaningful Use that we are willing to put our own money on the line?* And why do 100% of our clients share that confidence, according to our surveys, "Ambulatory EMR: On Track for Meaningful Use?" <br />Unlike traditional software or ASP-based EHRs, where all the work involved in meeting and tracking Meaningful Use performance falls on the practice, HITS provides a full-service solution with no extra or hidden costs. Our service includes, at no extra cost: </p>
<ul>
<li>Administrative support that takes on cumbersome tasks of registration and attestation with government agencies</li>
<li>Fully certified clinical quality measures built into the workflow with our proprietary HITS&reg;</li>
<li>A Meaningful Use Resource Center website where clients have access to all the information they need&mdash;at their fingertips</li>
<li>Expert performance coaching to guide and support clients through every stage of the process</li>
</ul>
<p>Here is a more detailed breakdown of how ICAN is addressing key Meaningful Use measures:</p>
<h3 class="post-title">Improved outcomes</h3>
<ul>
<li>Care Coordination (Electronically exchange information): Unlike most EHR offerings, <a href="#">athenaCommunicator&reg;</a>, with its Patient Portal and automated patient messaging, is designed to enhance patient involvement in their health care, enabling practices to meet these Meaningful Use measures.</li>
</ul>
<h3 class="post-title">Advanced clinical processes</h3>
<ul>
<li><strong>Use of e-Prescribing:</strong> MyHealthcareCompany is Surescripts&reg; certified for Prescription Benefit Eligibility, Formulary, and Reporting; Medication History (payer); Prescription Renewals (retail); and Prescription Routing for New Prescriptions (retail and mail-order).</li>
<li><strong>Closed Order Management: </strong>Because our EHR includes document management services, we make it easy for providers to create and send electronic orders from the encounter. Users can also track and close orders within the application for better follow-up and quality reporting.</li>
</ul>
<h3 class="post-title">Data capture and sharing</h3>
<ul>
<li><strong>Quality care and population management: </strong>MyHealthcareCompany&rsquo;s rules database provides a set of payer-specific quality measures and also allows for comprehensive and automatic demographic reporting.</li>
<li>Meaningful use offers an important opportunity for physicians to be financially rewarded for adopting an EHR that can effectively achieve measures. We at ICAN are here to help you navigate through the complexities of Meaningful Use, help you get all the incentive dollars you deserve, and free you from administrative red tape so you can focus on quality patient care.</li>
</ul>
<h3 class="post-title">Your Partner Through Reform and Change</h3>
<p>The HITECH Act and Meaningful Use is just one of many huge changes impacting physician practices today. Last year''s historic passage of the Patient Protection and Affordable Care Act set the stage for what will be some of the most significant changes to the U.S. health care system in a generation. To read in more detail about our perspective on the health care reform bill and our response to the challenges it presents, <a>click here</a></p>
<p>One recent manifestation of the reform bill was the release in March of the proposed rules for Accountable Care Organizations, or ACOs. To learn more about ACOs, what they might mean for your practice or organization, and how ICAN can help you navigate any payment future, <a href="cmp/ACO/_doc/ACO_NPRM_Summary.pdf">click here</a></p>
</div>
</div>', 2, N'Lab Results', N'lab-results', 13)
GO
INSERT [dbo].[ContentPages3] ([Id], [NavTitle], [Content], [PageId], [Title], [Route], [PageOrder]) VALUES (24, N'Scheduling', N'<div class="blog-single">
<div class="post-content">
<h3 class="post-title">Achieving Meaningful Use with ICAN</h3>
<div class="row">
<div class="col-md-8">According to the 2009 HITECH Act, physicians are eligible to receive up to $44,000 in total incentives per physician from Medicaid for "Meaningful Use" of a certified Electronic Health Record (EHR) starting this year (2011). (Note: Physicians reimbursed by Medicaid can receive up to approximately $63,750 starting in 2011 based on state-defined guidelines.) In July 2010, the Center for Medicare and Medicaid Services (CMS) released their rule for the Stage 1 Meaningful Use requirements that physicians need to meet in order to receive their Meaningful Use incentives. For our in-depth analysis of the rule, <a>click here</a>.</div>
<div class="col-md-4"><img style="margin-right: 5px;" src="https://via.placeholder.com/250x173.png?text=Visit+WhoIsHostingThis.com+Buyers+Guide" /></div>
</div>
<p><br />Medicaid payments have been coming in and beginning in late May our first physician clients began receiving their year one Medicare Meaningful Use checks for up to $18,000. You can read on our blog about the first ICAN client to get paid. These payments represent the first step in the validation and fulfillment of ICAN''s Federal Stimulus Bonus Payment Guarantee Program, unique in the industry for guaranteeing federal Meaningful Use incentive payments, not just Meaningful Use certification. To learn more about our Guarantee. <a href="guaranteedpayment.aspx">click here</a></p>
<h3 class="post-title">Guaranteed Incentives, Nimble Technology</h3>
<p>How can we be so confident in our ability to meet Meaningful Use that we are willing to put our own money on the line?* And why do 100% of our clients share that confidence, according to our surveys, "Ambulatory EMR: On Track for Meaningful Use?" <br />Unlike traditional software or ASP-based EHRs, where all the work involved in meeting and tracking Meaningful Use performance falls on the practice, HITS provides a full-service solution with no extra or hidden costs. Our service includes, at no extra cost: </p>
<ul>
<li>Administrative support that takes on cumbersome tasks of registration and attestation with government agencies</li>
<li>Fully certified clinical quality measures built into the workflow with our proprietary HITS&reg;</li>
<li>A Meaningful Use Resource Center website where clients have access to all the information they need&mdash;at their fingertips</li>
<li>Expert performance coaching to guide and support clients through every stage of the process</li>
</ul>
<p>Here is a more detailed breakdown of how ICAN is addressing key Meaningful Use measures:</p>
<h3 class="post-title">Improved outcomes</h3>
<ul>
<li>Care Coordination (Electronically exchange information): Unlike most EHR offerings, <a href="#">athenaCommunicator&reg;</a>, with its Patient Portal and automated patient messaging, is designed to enhance patient involvement in their health care, enabling practices to meet these Meaningful Use measures.</li>
</ul>
<h3 class="post-title">Advanced clinical processes</h3>
<ul>
<li><strong>Use of e-Prescribing:</strong> MyHealthcareCompany is Surescripts&reg; certified for Prescription Benefit Eligibility, Formulary, and Reporting; Medication History (payer); Prescription Renewals (retail); and Prescription Routing for New Prescriptions (retail and mail-order).</li>
<li><strong>Closed Order Management: </strong>Because our EHR includes document management services, we make it easy for providers to create and send electronic orders from the encounter. Users can also track and close orders within the application for better follow-up and quality reporting.</li>
</ul>
<h3 class="post-title">Data capture and sharing</h3>
<ul>
<li><strong>Quality care and population management: </strong>MyHealthcareCompany&rsquo;s rules database provides a set of payer-specific quality measures and also allows for comprehensive and automatic demographic reporting.</li>
<li>Meaningful use offers an important opportunity for physicians to be financially rewarded for adopting an EHR that can effectively achieve measures. We at ICAN are here to help you navigate through the complexities of Meaningful Use, help you get all the incentive dollars you deserve, and free you from administrative red tape so you can focus on quality patient care.</li>
</ul>
<h3 class="post-title">Your Partner Through Reform and Change</h3>
<p>The HITECH Act and Meaningful Use is just one of many huge changes impacting physician practices today. Last year''s historic passage of the Patient Protection and Affordable Care Act set the stage for what will be some of the most significant changes to the U.S. health care system in a generation. To read in more detail about our perspective on the health care reform bill and our response to the challenges it presents, <a>click here</a></p>
<p>One recent manifestation of the reform bill was the release in March of the proposed rules for Accountable Care Organizations, or ACOs. To learn more about ACOs, what they might mean for your practice or organization, and how ICAN can help you navigate any payment future, <a href="cmp/ACO/_doc/ACO_NPRM_Summary.pdf">click here</a></p>
</div>
</div>', 2, N'Scheduling', N'Scheduling', 14)
GO
INSERT [dbo].[ContentPages3] ([Id], [NavTitle], [Content], [PageId], [Title], [Route], [PageOrder]) VALUES (26, N'Company Profile', N'<div class="blog-single">
<div class="post-content">
<h3 class="post-title">Achieving Meaningful Use with ICAN</h3>
<div class="row">
<div class="col-md-8">According to the 2009 HITECH Act, physicians are eligible to receive up to $44,000 in total incentives per physician from Medicaid for "Meaningful Use" of a certified Electronic Health Record (EHR) starting this year (2011). (Note: Physicians reimbursed by Medicaid can receive up to approximately $63,750 starting in 2011 based on state-defined guidelines.) In July 2010, the Center for Medicare and Medicaid Services (CMS) released their rule for the Stage 1 Meaningful Use requirements that physicians need to meet in order to receive their Meaningful Use incentives. For our in-depth analysis of the rule, <a>click here</a>.</div>
<div class="col-md-4"><img style="margin-right: 5px;" src="https://via.placeholder.com/250x173.png?text=Visit+WhoIsHostingThis.com+Buyers+Guide" /></div>
</div>
<p><br />Medicaid payments have been coming in and beginning in late May our first physician clients began receiving their year one Medicare Meaningful Use checks for up to $18,000. You can read on our blog about the first ICAN client to get paid. These payments represent the first step in the validation and fulfillment of ICAN''s Federal Stimulus Bonus Payment Guarantee Program, unique in the industry for guaranteeing federal Meaningful Use incentive payments, not just Meaningful Use certification. To learn more about our Guarantee. <a href="guaranteedpayment.aspx">click here</a></p>
<h3 class="post-title">Guaranteed Incentives, Nimble Technology</h3>
<p>How can we be so confident in our ability to meet Meaningful Use that we are willing to put our own money on the line?* And why do 100% of our clients share that confidence, according to our surveys, "Ambulatory EMR: On Track for Meaningful Use?" <br />Unlike traditional software or ASP-based EHRs, where all the work involved in meeting and tracking Meaningful Use performance falls on the practice, HITS provides a full-service solution with no extra or hidden costs. Our service includes, at no extra cost: </p>
<ul>
<li>Administrative support that takes on cumbersome tasks of registration and attestation with government agencies</li>
<li>Fully certified clinical quality measures built into the workflow with our proprietary HITS&reg;</li>
<li>A Meaningful Use Resource Center website where clients have access to all the information they need&mdash;at their fingertips</li>
<li>Expert performance coaching to guide and support clients through every stage of the process</li>
</ul>
<p>Here is a more detailed breakdown of how ICAN is addressing key Meaningful Use measures:</p>
<h3 class="post-title">Improved outcomes</h3>
<ul>
<li>Care Coordination (Electronically exchange information): Unlike most EHR offerings, <a href="#">athenaCommunicator&reg;</a>, with its Patient Portal and automated patient messaging, is designed to enhance patient involvement in their health care, enabling practices to meet these Meaningful Use measures.</li>
</ul>
<h3 class="post-title">Advanced clinical processes</h3>
<ul>
<li><strong>Use of e-Prescribing:</strong> MyHealthcareCompany is Surescripts&reg; certified for Prescription Benefit Eligibility, Formulary, and Reporting; Medication History (payer); Prescription Renewals (retail); and Prescription Routing for New Prescriptions (retail and mail-order).</li>
<li><strong>Closed Order Management: </strong>Because our EHR includes document management services, we make it easy for providers to create and send electronic orders from the encounter. Users can also track and close orders within the application for better follow-up and quality reporting.</li>
</ul>
<h3 class="post-title">Data capture and sharing</h3>
<ul>
<li><strong>Quality care and population management: </strong>MyHealthcareCompany&rsquo;s rules database provides a set of payer-specific quality measures and also allows for comprehensive and automatic demographic reporting.</li>
<li>Meaningful use offers an important opportunity for physicians to be financially rewarded for adopting an EHR that can effectively achieve measures. We at ICAN are here to help you navigate through the complexities of Meaningful Use, help you get all the incentive dollars you deserve, and free you from administrative red tape so you can focus on quality patient care.</li>
</ul>
<h3 class="post-title">Your Partner Through Reform and Change</h3>
<p>The HITECH Act and Meaningful Use is just one of many huge changes impacting physician practices today. Last year''s historic passage of the Patient Protection and Affordable Care Act set the stage for what will be some of the most significant changes to the U.S. health care system in a generation. To read in more detail about our perspective on the health care reform bill and our response to the challenges it presents, <a>click here</a></p>
<p>One recent manifestation of the reform bill was the release in March of the proposed rules for Accountable Care Organizations, or ACOs. To learn more about ACOs, what they might mean for your practice or organization, and how ICAN can help you navigate any payment future, <a href="cmp/ACO/_doc/ACO_NPRM_Summary.pdf">click here</a></p>
</div>
</div>', 5, N'Company Profile', N'Company Profile', 0)
GO
SET IDENTITY_INSERT [dbo].[ContentPages3] OFF
GO
SET IDENTITY_INSERT [dbo].[Permission] ON 
GO
INSERT [dbo].[Permission] ([Id], [Controller], [Action], [AllowAll], [Description]) VALUES (215, N'ContentPage', N'ContentPages', 1, N'ContentPage => ContentPage List')
GO
INSERT [dbo].[Permission] ([Id], [Controller], [Action], [AllowAll], [Description]) VALUES (216, N'ContentPage', N'AddContentPage', 1, N'ContentPage => Add/Edit ContentPage')
GO
INSERT [dbo].[Permission] ([Id], [Controller], [Action], [AllowAll], [Description]) VALUES (217, N'ContentPage', N'DeleteContentPage', 1, N'ContentPage => Delete ContentPage')
GO
INSERT [dbo].[Permission] ([Id], [Controller], [Action], [AllowAll], [Description]) VALUES (218, N'Dashboard', N'Index', 1, N'Dashboard => Index')
GO
INSERT [dbo].[Permission] ([Id], [Controller], [Action], [AllowAll], [Description]) VALUES (219, N'Document', N'DocumentList', 1, N'Document => Document list')
GO
INSERT [dbo].[Permission] ([Id], [Controller], [Action], [AllowAll], [Description]) VALUES (220, N'Document', N'AddDocument', 1, N'Document => Add document')
GO
INSERT [dbo].[Permission] ([Id], [Controller], [Action], [AllowAll], [Description]) VALUES (221, N'Medication', N'MedicationList', 1, N'Medications => MedicationList')
GO
INSERT [dbo].[Permission] ([Id], [Controller], [Action], [AllowAll], [Description]) VALUES (222, N'Medication', N'AddMedication', 1, N'Medications => Add/Edit Medication')
GO
INSERT [dbo].[Permission] ([Id], [Controller], [Action], [AllowAll], [Description]) VALUES (223, N'Medication', N'DeleteMedication', 1, N'Medications => Delete Medication')
GO
INSERT [dbo].[Permission] ([Id], [Controller], [Action], [AllowAll], [Description]) VALUES (224, N'Goal', N'GoalList', 1, N'Goal => Goal list')
GO
INSERT [dbo].[Permission] ([Id], [Controller], [Action], [AllowAll], [Description]) VALUES (225, N'Goal', N'AddGoal', 1, N'Goal => Add goal')
GO
INSERT [dbo].[Permission] ([Id], [Controller], [Action], [AllowAll], [Description]) VALUES (226, N'Goal', N'DeleteGoal', 1, N'Goal => Delete goal')
GO
INSERT [dbo].[Permission] ([Id], [Controller], [Action], [AllowAll], [Description]) VALUES (227, N'TreatmentPlan', N'TreatmentPlanList', 1, N'TreatmentPlan => Treatment plan list')
GO
INSERT [dbo].[Permission] ([Id], [Controller], [Action], [AllowAll], [Description]) VALUES (228, N'TreatmentPlan', N'AddTreatmentPlan', 1, N'TreatmentPlan => Add treatment plan')
GO
INSERT [dbo].[Permission] ([Id], [Controller], [Action], [AllowAll], [Description]) VALUES (229, N'TreatmentPlan', N'DeleteTreatmentPlan', 1, N'TreatmentPlan => Delete treatment plan')
GO
INSERT [dbo].[Permission] ([Id], [Controller], [Action], [AllowAll], [Description]) VALUES (230, N'Physician', N'PhysicianList', 1, N'Physician => Physician list')
GO
INSERT [dbo].[Permission] ([Id], [Controller], [Action], [AllowAll], [Description]) VALUES (231, N'Physician', N'AddPhysician', 1, N'Physician => Add physician')
GO
INSERT [dbo].[Permission] ([Id], [Controller], [Action], [AllowAll], [Description]) VALUES (232, N'Physician', N'DeletePhysician', 1, N'Physician => Delete physician')
GO
INSERT [dbo].[Permission] ([Id], [Controller], [Action], [AllowAll], [Description]) VALUES (233, N'Print', N'Index', 1, N'Print => Index')
GO
INSERT [dbo].[Permission] ([Id], [Controller], [Action], [AllowAll], [Description]) VALUES (234, N'Patient', N'PatientList', 1, N'Patients => PatientList')
GO
INSERT [dbo].[Permission] ([Id], [Controller], [Action], [AllowAll], [Description]) VALUES (235, N'Patient', N'AddPatient', 1, N'Patients => Add/Edit Patient')
GO
INSERT [dbo].[Permission] ([Id], [Controller], [Action], [AllowAll], [Description]) VALUES (236, N'Patient', N'DeletePatient', 1, N'Patients => Delete Patient')
GO
INSERT [dbo].[Permission] ([Id], [Controller], [Action], [AllowAll], [Description]) VALUES (237, N'Content', N'Portfolios', 1, N'Content => Company Portfolio')
GO
INSERT [dbo].[Permission] ([Id], [Controller], [Action], [AllowAll], [Description]) VALUES (238, N'Content', N'EmailTemplates', 1, N'Content => Email Templates')
GO
INSERT [dbo].[Permission] ([Id], [Controller], [Action], [AllowAll], [Description]) VALUES (239, N'Content', N'AddEmailTemplate', 1, N'Content => Edit Email Templates')
GO
INSERT [dbo].[Permission] ([Id], [Controller], [Action], [AllowAll], [Description]) VALUES (240, N'Permission', N'Index', 1, N'Permission => Permission List')
GO
INSERT [dbo].[Permission] ([Id], [Controller], [Action], [AllowAll], [Description]) VALUES (241, N'Permission', N'Create', 1, N'Permission => Permission Update')
GO
INSERT [dbo].[Permission] ([Id], [Controller], [Action], [AllowAll], [Description]) VALUES (242, N'Role', N'RoleIndex', 1, N'Roles => Role List')
GO
INSERT [dbo].[Permission] ([Id], [Controller], [Action], [AllowAll], [Description]) VALUES (243, N'Role', N'RoleCreate', 1, N'Roles => Create Role')
GO
INSERT [dbo].[Permission] ([Id], [Controller], [Action], [AllowAll], [Description]) VALUES (244, N'Role', N'RoleDelete', 1, N'Roles => Delete Role')
GO
INSERT [dbo].[Permission] ([Id], [Controller], [Action], [AllowAll], [Description]) VALUES (245, N'User', N'Users', 1, N'Users => User List')
GO
INSERT [dbo].[Permission] ([Id], [Controller], [Action], [AllowAll], [Description]) VALUES (246, N'User', N'AddUser', 1, N'Users => Add/Edit User')
GO
INSERT [dbo].[Permission] ([Id], [Controller], [Action], [AllowAll], [Description]) VALUES (247, N'User', N'ToggleUserActivation', 1, N'Users => Enable/Disable User')
GO
INSERT [dbo].[Permission] ([Id], [Controller], [Action], [AllowAll], [Description]) VALUES (248, N'User', N'DeleteUser', 1, N'Users => Delete User')
GO
SET IDENTITY_INSERT [dbo].[Permission] OFF
GO
SET IDENTITY_INSERT [Emails].[EmailTemplate] ON 
GO
INSERT [Emails].[EmailTemplate] ([Id], [EmailTemplateType], [Title], [Subject], [Body], [Language]) VALUES (1, 1, N'Email Confirmation', N'Confirm your Email', N'Please confirm your account by clicking <a href="{CallbackUrl}">here</a>', N'en-GB')
GO
INSERT [Emails].[EmailTemplate] ([Id], [EmailTemplateType], [Title], [Subject], [Body], [Language]) VALUES (2, 2, N'Reset Password', N'Reset Password', N'Please reset your password by clicking <a href="{CallbackUrl}">here</a>', N'en-GB')
GO
SET IDENTITY_INSERT [Emails].[EmailTemplate] OFF
GO
SET IDENTITY_INSERT [Emails].[TemplateVariable] ON 
GO
INSERT [Emails].[TemplateVariable] ([Id], [Title], [EmailTemplateId]) VALUES (1, N'CallbackUrl', 1)
GO
INSERT [Emails].[TemplateVariable] ([Id], [Title], [EmailTemplateId]) VALUES (2, N'CallbackUrl', 2)
GO
SET IDENTITY_INSERT [Emails].[TemplateVariable] OFF
GO
INSERT [HangFire].[Schema] ([Version]) VALUES (7)
GO
INSERT [HangFire].[Server] ([Id], [Data], [LastHeartbeat]) VALUES (N'desktop-p4lgcor:34652:5c4efc06-2c18-4215-901d-5fa5918b7464', N'{"WorkerCount":20,"Queues":["default"],"StartedAt":"2021-06-26T20:24:55.1656114Z"}', CAST(N'2021-06-26T20:36:43.417' AS DateTime))
GO
INSERT [HangFire].[Server] ([Id], [Data], [LastHeartbeat]) VALUES (N'desktop-p4lgcor:34652:c89377b7-656f-4d66-a7fa-e80518eadc0f', N'{"WorkerCount":20,"Queues":["default"],"StartedAt":"2021-06-26T20:24:56.701493Z"}', CAST(N'2021-06-26T20:36:45.343' AS DateTime))
GO
SET IDENTITY_INSERT [MAR].[Goal] ON 
GO
INSERT [MAR].[Goal] ([Id], [GoalName], [GoalTitle], [Description], [TreatmentPlan_Id]) VALUES (1, N'Abuse/Neglect', N'Explore and resolve issues relating to history of abuse/neglect victimization', N'<ul><li>Share details of the abuse/neglect with therapist as able to do so</li><li>Learn about typical long term/residual effects of traumatic life experiences</li><li>Develop two strategies to help cope with stressful reminders/memories</li></ul>', 6)
GO
INSERT [MAR].[Goal] ([Id], [GoalName], [GoalTitle], [Description], [TreatmentPlan_Id]) VALUES (2, N'Alcohol/Drugs and Other Addictions', N'Be free of drug/alcohol use/abuse', N'<ul><li>Avoid people, places and situations where temptation might be overwhelming</li><li>Explore dynamics relating to being the [child/husband/wife] of an [alcoholic/addict] and discuss them each week at support group meetings</li><li>Learn five triggers for alcohol &amp; drug use</li><li>Reach ____ days/months/years of clean/sober living</li></ul>', NULL)
GO
INSERT [MAR].[Goal] ([Id], [GoalName], [GoalTitle], [Description], [TreatmentPlan_Id]) VALUES (3, N'Adoption/Foster Care Placement', N'Explore and resolve issues related to adoption/out-of-home placement', N'<ul><li>Discuss ongoing concerns and issues related to adoptive and/or biological parents during weekly sessions</li><li>Talk about his/her wishes with regard to permanency planning</li></ul>', 6)
GO
INSERT [MAR].[Goal] ([Id], [GoalName], [GoalTitle], [Description], [TreatmentPlan_Id]) VALUES (4, N'Anger', N'Increase and practice ability to manage anger', N'<ul><li>Walk away from situations that trigger strong emotions (100%)</li><li>Be free of tantrums/explosive episodes</li><li>Learn two positive anger management skills</li><li>Learn three ways to communicate verbally when angry</li><li>Be able to express anger in a productive manner without destroying property or personal belongings</li><li>Be able to express anger without yelling and using foul language</li><li>Explore and resolve conflict with ____ (list triggers)</li><li>Get through an entire day without an angry mood swing (or breaking/punching&hellip;)</li><li>Get through a whole week without fighting with ____</li><li>Take a time-out when things get upsetting</li><li>Learn and practice anger management skills especially in situations where people are not treating him/her respectfully</li></ul>', 6)
GO
INSERT [MAR].[Goal] ([Id], [GoalName], [GoalTitle], [Description], [TreatmentPlan_Id]) VALUES (5, N'Anxiety', N'Develop strategies to reduce symptoms, or  Reduce anxiety and improve coping skills', N'<ul><li>Be free of panic episodes (100%)</li><li>Recognize and plan for top five anxiety-provoking situations</li><li>Learn two new ways of coping with routine stressors</li><li>Report feeling more positive about self and abilities during therapy sessions</li><li>Develop strategies for thought distraction when fixating on the future</li></ul>', 6)
GO
INSERT [MAR].[Goal] ([Id], [GoalName], [GoalTitle], [Description], [TreatmentPlan_Id]) VALUES (6, N'Behavior Problems', N'Improve overall behavior (and attitude/mood), or  Maintain positive behavior (and attitude/mood)', N'<ul><li>Be free of _____ behavior</li><li>Develop a reward system to address ___ (target problem)</li><li>Learn two ways to manage frustration in a positive manner</li><li>Share two positive experiences each week in which X is proud of how he/she has behaved</li><li>Stay free of fights</li><li>Stay free of drug &amp; alcohol use and abuse (100%)</li><li>Be free of violent behavior</li><li>Be able to keep hands and feet to self</li><li>Be able to express anger in a productive manner without destroying property or personal belongings</li><li>Be free of threats to self and others</li><li>Complete daily tasks (e.g. chores, pet care, self care, etc.)</li><li>Avoid leaving clothing/toys/personal stuff all around the house</li><li>Listen to parent and follow simple directions with one prompt</li><li>Put all dishes, glasses, cups, and food items back in the kitchen after meals/snacks</li><li>Clean up after himself/herself</li><li>Admit and accept personal responsibility for own actions/behavior</li><li>Be respectful of adults and avoid talking back</li><li>Get through a whole week without fighting with ____</li><li>Avoid behavior that would result in a loss of custody</li><li>Be able to play with others peacefully for ____ minutes</li><li>Come home each day by ______ (time)</li><li>Keep parents informed about where you are and when you will be home</li><li>Be in bed by _____ each night</li><li>Be free of bedwetting</li><li>Be free of wet/soiled underwear</li><li>If an accident happens, be responsible and clean it up</li><li>Be free of any behavior that could result in loss of job</li><li>Remain free of behaviors which would lead to arrest</li><li>Comply with all aspects of probation/parole and avoid behavior that could violate</li><li>Eat/swallow only items intended to be food</li></ul>', NULL)
GO
INSERT [MAR].[Goal] ([Id], [GoalName], [GoalTitle], [Description], [TreatmentPlan_Id]) VALUES (7, N'Communication Skills', N'Learn and use effective communication strategies', N'<ul><li>Talk nice or do not say anything at all</li><li>Learn three ways to communicate verbally when angry</li><li>Be able to express anger in a productive manner without destroying property or personal belongings</li><li>Be able to express anger without yelling and using foul language</li><li>Be able to express wants and needs through spoken language</li><li>Be able to ask questions and tell about instances</li><li>Be able to stick up for self assertively</li><li>Speak in a clear and concise manner so others fully understand him/her</li><li>Learn to express feelings verbally without acting out</li></ul>', NULL)
GO
INSERT [MAR].[Goal] ([Id], [GoalName], [GoalTitle], [Description], [TreatmentPlan_Id]) VALUES (8, N'Crime', N'Remain free of behaviors which would lead to arrest/violation', N'<ul><li>Keep working and comply with all aspects of probation</li><li>Be able to express anger in a productive manner without destroying property or personal belongings</li><li>Be free of threats to self and others</li><li>Comply with all aspects of probation/parole and avoid behavior that could violate</li><li>Be free of violent behavior</li><li>Stay free of drug &amp; alcohol use and abuse (100%)</li></ul>', NULL)
GO
SET IDENTITY_INSERT [MAR].[Goal] OFF
GO
SET IDENTITY_INSERT [MAR].[Medication] ON 
GO
INSERT [MAR].[Medication] ([Id], [Name]) VALUES (1, N'Med1')
GO
INSERT [MAR].[Medication] ([Id], [Name]) VALUES (2, N'Med2')
GO
INSERT [MAR].[Medication] ([Id], [Name]) VALUES (3, N'Med3')
GO
SET IDENTITY_INSERT [MAR].[Medication] OFF
GO
SET IDENTITY_INSERT [MAR].[Patient] ON 
GO
INSERT [MAR].[Patient] ([Id], [Name], [DateOfBirth], [Sex], [PhoneNumber], [Email], [InsuranceId]) VALUES (1, N'Zawar Mahmood', CAST(N'2021-06-15T00:00:00.000' AS DateTime), N'Male', N'+923074665233', N'zetawars@hotmail.com', NULL)
GO
INSERT [MAR].[Patient] ([Id], [Name], [DateOfBirth], [Sex], [PhoneNumber], [Email], [InsuranceId]) VALUES (3, N'Zawar Mahmood', CAST(N'2021-06-23T00:00:00.000' AS DateTime), NULL, N'+923074665233', N'zetawars@hotmail.com', NULL)
GO
SET IDENTITY_INSERT [MAR].[Patient] OFF
GO
SET IDENTITY_INSERT [MAR].[Physician] ON 
GO
INSERT [MAR].[Physician] ([Id], [PhoneNumber], [Name], [Email]) VALUES (1, N'+923074665233', N'Zawar Mahmood', N'zetawars@hotmail.com')
GO
INSERT [MAR].[Physician] ([Id], [PhoneNumber], [Name], [Email]) VALUES (2, N'3074665233', N'Abdul', N'andrew@monarchtesting.com')
GO
SET IDENTITY_INSERT [MAR].[Physician] OFF
GO
SET IDENTITY_INSERT [MAR].[TreatmentPlan] ON 
GO
INSERT [MAR].[TreatmentPlan] ([Id], [PatientId], [Date], [Signature], [StaffId], [FirstShift], [SecondShift], [ThirdShift], [FaceToFace], [Location], [Effectiveness], [Intervention], [Service]) VALUES (6, 1, CAST(N'2021-06-26T00:00:00.000' AS DateTime), NULL, 6, 0, 0, 0, 0, N'Office', N'<p>Lorem ipsum dollor</p>', N'<p>lorem ipsum dollor</p>', N'<ol><li>Date of Service</li><li>Identification of client</li><li>Purpose of Contact</li><li>Description of Intervention/Activity</li><li>Effectiveness of the intervention/Activity</li><li>Duration of Services</li><li>Signature and Credentials</li></ol>')
GO
SET IDENTITY_INSERT [MAR].[TreatmentPlan] OFF
GO
/****** Object:  Index [IX_PortfolioId]    Script Date: 2021-06-27 1:37:14 AM ******/
CREATE NONCLUSTERED INDEX [IX_PortfolioId] ON [Content].[AboutUs]
(
	[PortfolioId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PortfolioId]    Script Date: 2021-06-27 1:37:14 AM ******/
CREATE NONCLUSTERED INDEX [IX_PortfolioId] ON [Content].[ContactUs]
(
	[PortfolioId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PortfolioId]    Script Date: 2021-06-27 1:37:14 AM ******/
CREATE NONCLUSTERED INDEX [IX_PortfolioId] ON [Content].[TermsOfService]
(
	[PortfolioId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PortfolioId]    Script Date: 2021-06-27 1:37:14 AM ******/
CREATE NONCLUSTERED INDEX [IX_PortfolioId] ON [Content].[Testimonial]
(
	[PortfolioId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 2021-06-27 1:37:14 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserId]    Script Date: 2021-06-27 1:37:14 AM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserId]    Script Date: 2021-06-27 1:37:14 AM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserId]    Script Date: 2021-06-27 1:37:14 AM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserNotifications]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RoleId]    Script Date: 2021-06-27 1:37:14 AM ******/
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserId]    Script Date: 2021-06-27 1:37:14 AM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserRoles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_MedicalRecord_Id]    Script Date: 2021-06-27 1:37:14 AM ******/
CREATE NONCLUSTERED INDEX [IX_MedicalRecord_Id] ON [dbo].[AspNetUsers]
(
	[MedicalRecord_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 2021-06-27 1:37:14 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PageId]    Script Date: 2021-06-27 1:37:14 AM ******/
CREATE NONCLUSTERED INDEX [IX_PageId] ON [dbo].[ContentPages]
(
	[PageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ApplicationRole_Id]    Script Date: 2021-06-27 1:37:14 AM ******/
CREATE NONCLUSTERED INDEX [IX_ApplicationRole_Id] ON [dbo].[PermissionApplicationRoles]
(
	[ApplicationRole_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Permission_Id]    Script Date: 2021-06-27 1:37:14 AM ******/
CREATE NONCLUSTERED INDEX [IX_Permission_Id] ON [dbo].[PermissionApplicationRoles]
(
	[Permission_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_EmailTemplateId]    Script Date: 2021-06-27 1:37:14 AM ******/
CREATE NONCLUSTERED INDEX [IX_EmailTemplateId] ON [Emails].[TemplateVariable]
(
	[EmailTemplateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_AggregatedCounter_ExpireAt]    Script Date: 2021-06-27 1:37:14 AM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_AggregatedCounter_ExpireAt] ON [HangFire].[AggregatedCounter]
(
	[ExpireAt] ASC
)
WHERE ([ExpireAt] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_Hash_ExpireAt]    Script Date: 2021-06-27 1:37:14 AM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Hash_ExpireAt] ON [HangFire].[Hash]
(
	[ExpireAt] ASC
)
WHERE ([ExpireAt] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_Job_ExpireAt]    Script Date: 2021-06-27 1:37:14 AM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Job_ExpireAt] ON [HangFire].[Job]
(
	[ExpireAt] ASC
)
INCLUDE([StateName]) 
WHERE ([ExpireAt] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_HangFire_Job_StateName]    Script Date: 2021-06-27 1:37:14 AM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Job_StateName] ON [HangFire].[Job]
(
	[StateName] ASC
)
WHERE ([StateName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_List_ExpireAt]    Script Date: 2021-06-27 1:37:14 AM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_List_ExpireAt] ON [HangFire].[List]
(
	[ExpireAt] ASC
)
WHERE ([ExpireAt] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_Server_LastHeartbeat]    Script Date: 2021-06-27 1:37:14 AM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Server_LastHeartbeat] ON [HangFire].[Server]
(
	[LastHeartbeat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_Set_ExpireAt]    Script Date: 2021-06-27 1:37:14 AM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Set_ExpireAt] ON [HangFire].[Set]
(
	[ExpireAt] ASC
)
WHERE ([ExpireAt] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_HangFire_Set_Score]    Script Date: 2021-06-27 1:37:14 AM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Set_Score] ON [HangFire].[Set]
(
	[Key] ASC,
	[Score] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_MarId]    Script Date: 2021-06-27 1:37:14 AM ******/
CREATE NONCLUSTERED INDEX [IX_MarId] ON [MAR].[AdministeredMedicine]
(
	[MarId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_MedicationId]    Script Date: 2021-06-27 1:37:14 AM ******/
CREATE NONCLUSTERED INDEX [IX_MedicationId] ON [MAR].[AdministeredMedicine]
(
	[MedicationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_StaffId]    Script Date: 2021-06-27 1:37:14 AM ******/
CREATE NONCLUSTERED INDEX [IX_StaffId] ON [MAR].[AdministeredMedicine]
(
	[StaffId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_TreatmentPlan_Id]    Script Date: 2021-06-27 1:37:14 AM ******/
CREATE NONCLUSTERED INDEX [IX_TreatmentPlan_Id] ON [MAR].[Goal]
(
	[TreatmentPlan_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PatientId]    Script Date: 2021-06-27 1:37:14 AM ******/
CREATE NONCLUSTERED INDEX [IX_PatientId] ON [MAR].[MedicalRecord]
(
	[PatientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PhysicianId]    Script Date: 2021-06-27 1:37:14 AM ******/
CREATE NONCLUSTERED INDEX [IX_PhysicianId] ON [MAR].[MedicalRecord]
(
	[PhysicianId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_MarId]    Script Date: 2021-06-27 1:37:14 AM ******/
CREATE NONCLUSTERED INDEX [IX_MarId] ON [MAR].[NotAdministeredMedicine]
(
	[MarId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_MedicationId]    Script Date: 2021-06-27 1:37:14 AM ******/
CREATE NONCLUSTERED INDEX [IX_MedicationId] ON [MAR].[NotAdministeredMedicine]
(
	[MedicationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_StaffId]    Script Date: 2021-06-27 1:37:14 AM ******/
CREATE NONCLUSTERED INDEX [IX_StaffId] ON [MAR].[NotAdministeredMedicine]
(
	[StaffId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PatientId]    Script Date: 2021-06-27 1:37:14 AM ******/
CREATE NONCLUSTERED INDEX [IX_PatientId] ON [MAR].[TreatmentPlan]
(
	[PatientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_StaffId]    Script Date: 2021-06-27 1:37:14 AM ******/
CREATE NONCLUSTERED INDEX [IX_StaffId] ON [MAR].[TreatmentPlan]
(
	[StaffId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ContentPages] ADD  DEFAULT ((0)) FOR [PageOrder]
GO
ALTER TABLE [MAR].[TreatmentPlan] ADD  DEFAULT ((0)) FOR [FirstShift]
GO
ALTER TABLE [MAR].[TreatmentPlan] ADD  DEFAULT ((0)) FOR [SecondShift]
GO
ALTER TABLE [MAR].[TreatmentPlan] ADD  DEFAULT ((0)) FOR [ThirdShift]
GO
ALTER TABLE [MAR].[TreatmentPlan] ADD  DEFAULT ((0)) FOR [FaceToFace]
GO
ALTER TABLE [Content].[AboutUs]  WITH CHECK ADD  CONSTRAINT [FK_Content.AboutUs_Content.Portfolio_PortfolioId] FOREIGN KEY([PortfolioId])
REFERENCES [Content].[Portfolio] ([Id])
GO
ALTER TABLE [Content].[AboutUs] CHECK CONSTRAINT [FK_Content.AboutUs_Content.Portfolio_PortfolioId]
GO
ALTER TABLE [Content].[ContactUs]  WITH CHECK ADD  CONSTRAINT [FK_Content.ContactUs_Content.Portfolio_PortfolioId] FOREIGN KEY([PortfolioId])
REFERENCES [Content].[Portfolio] ([Id])
GO
ALTER TABLE [Content].[ContactUs] CHECK CONSTRAINT [FK_Content.ContactUs_Content.Portfolio_PortfolioId]
GO
ALTER TABLE [Content].[TermsOfService]  WITH CHECK ADD  CONSTRAINT [FK_Content.TermsOfService_Content.Portfolio_PortfolioId] FOREIGN KEY([PortfolioId])
REFERENCES [Content].[Portfolio] ([Id])
GO
ALTER TABLE [Content].[TermsOfService] CHECK CONSTRAINT [FK_Content.TermsOfService_Content.Portfolio_PortfolioId]
GO
ALTER TABLE [Content].[Testimonial]  WITH CHECK ADD  CONSTRAINT [FK_Content.Testimonial_Content.Portfolio_PortfolioId] FOREIGN KEY([PortfolioId])
REFERENCES [Content].[Portfolio] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [Content].[Testimonial] CHECK CONSTRAINT [FK_Content.Testimonial_Content.Portfolio_PortfolioId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserNotifications]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserNotifications_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserNotifications] CHECK CONSTRAINT [FK_dbo.AspNetUserNotifications_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUsers]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUsers_dbo.MedicalRecords_MedicalRecord_Id] FOREIGN KEY([MedicalRecord_Id])
REFERENCES [MAR].[MedicalRecord] ([Id])
GO
ALTER TABLE [dbo].[AspNetUsers] CHECK CONSTRAINT [FK_dbo.AspNetUsers_dbo.MedicalRecords_MedicalRecord_Id]
GO
ALTER TABLE [dbo].[ContentPages]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ContentPages_dbo.ContentPages_PageId] FOREIGN KEY([PageId])
REFERENCES [dbo].[ContentPages] ([Id])
GO
ALTER TABLE [dbo].[ContentPages] CHECK CONSTRAINT [FK_dbo.ContentPages_dbo.ContentPages_PageId]
GO
ALTER TABLE [dbo].[PermissionApplicationRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.PermissionApplicationRoles_dbo.AspNetRoles_ApplicationRole_Id] FOREIGN KEY([ApplicationRole_Id])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PermissionApplicationRoles] CHECK CONSTRAINT [FK_dbo.PermissionApplicationRoles_dbo.AspNetRoles_ApplicationRole_Id]
GO
ALTER TABLE [dbo].[PermissionApplicationRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.PermissionApplicationRoles_dbo.Permission_Permission_Id] FOREIGN KEY([Permission_Id])
REFERENCES [dbo].[Permission] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PermissionApplicationRoles] CHECK CONSTRAINT [FK_dbo.PermissionApplicationRoles_dbo.Permission_Permission_Id]
GO
ALTER TABLE [Emails].[TemplateVariable]  WITH CHECK ADD  CONSTRAINT [FK_Emails.TemplateVariable_Emails.EmailTemplate_EmailTemplateId] FOREIGN KEY([EmailTemplateId])
REFERENCES [Emails].[EmailTemplate] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [Emails].[TemplateVariable] CHECK CONSTRAINT [FK_Emails.TemplateVariable_Emails.EmailTemplate_EmailTemplateId]
GO
ALTER TABLE [HangFire].[JobParameter]  WITH CHECK ADD  CONSTRAINT [FK_HangFire_JobParameter_Job] FOREIGN KEY([JobId])
REFERENCES [HangFire].[Job] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [HangFire].[JobParameter] CHECK CONSTRAINT [FK_HangFire_JobParameter_Job]
GO
ALTER TABLE [HangFire].[State]  WITH CHECK ADD  CONSTRAINT [FK_HangFire_State_Job] FOREIGN KEY([JobId])
REFERENCES [HangFire].[Job] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [HangFire].[State] CHECK CONSTRAINT [FK_HangFire_State_Job]
GO
ALTER TABLE [MAR].[AdministeredMedicine]  WITH CHECK ADD  CONSTRAINT [FK_MAR.MedicalRecordMedication_dbo.AspNetUsers_StaffId] FOREIGN KEY([StaffId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [MAR].[AdministeredMedicine] CHECK CONSTRAINT [FK_MAR.MedicalRecordMedication_dbo.AspNetUsers_StaffId]
GO
ALTER TABLE [MAR].[AdministeredMedicine]  WITH CHECK ADD  CONSTRAINT [FK_MAR.MedicalRecordMedication_MAR.MedicalRecord_MarId] FOREIGN KEY([MarId])
REFERENCES [MAR].[MedicalRecord] ([Id])
GO
ALTER TABLE [MAR].[AdministeredMedicine] CHECK CONSTRAINT [FK_MAR.MedicalRecordMedication_MAR.MedicalRecord_MarId]
GO
ALTER TABLE [MAR].[AdministeredMedicine]  WITH CHECK ADD  CONSTRAINT [FK_MAR.MedicalRecordMedication_MAR.Medication_MedicationId] FOREIGN KEY([MedicationId])
REFERENCES [MAR].[Medication] ([Id])
GO
ALTER TABLE [MAR].[AdministeredMedicine] CHECK CONSTRAINT [FK_MAR.MedicalRecordMedication_MAR.Medication_MedicationId]
GO
ALTER TABLE [MAR].[Goal]  WITH CHECK ADD  CONSTRAINT [FK_MAR.Goal_MAR.TreatmentPlan_TreatmentPlan_Id] FOREIGN KEY([TreatmentPlan_Id])
REFERENCES [MAR].[TreatmentPlan] ([Id])
GO
ALTER TABLE [MAR].[Goal] CHECK CONSTRAINT [FK_MAR.Goal_MAR.TreatmentPlan_TreatmentPlan_Id]
GO
ALTER TABLE [MAR].[MedicalRecord]  WITH CHECK ADD  CONSTRAINT [FK_dbo.MedicalRecords_dbo.Patients_PatientId] FOREIGN KEY([PatientId])
REFERENCES [MAR].[Patient] ([Id])
GO
ALTER TABLE [MAR].[MedicalRecord] CHECK CONSTRAINT [FK_dbo.MedicalRecords_dbo.Patients_PatientId]
GO
ALTER TABLE [MAR].[MedicalRecord]  WITH CHECK ADD  CONSTRAINT [FK_dbo.MedicalRecords_dbo.Physicians_PhysicianId] FOREIGN KEY([PhysicianId])
REFERENCES [MAR].[Physician] ([Id])
GO
ALTER TABLE [MAR].[MedicalRecord] CHECK CONSTRAINT [FK_dbo.MedicalRecords_dbo.Physicians_PhysicianId]
GO
ALTER TABLE [MAR].[NotAdministeredMedicine]  WITH CHECK ADD  CONSTRAINT [FK_dbo.NotAdministeredMedicines_dbo.AspNetUsers_StaffId] FOREIGN KEY([StaffId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [MAR].[NotAdministeredMedicine] CHECK CONSTRAINT [FK_dbo.NotAdministeredMedicines_dbo.AspNetUsers_StaffId]
GO
ALTER TABLE [MAR].[NotAdministeredMedicine]  WITH CHECK ADD  CONSTRAINT [FK_dbo.NotAdministeredMedicines_dbo.MedicalRecords_MarId] FOREIGN KEY([MarId])
REFERENCES [MAR].[MedicalRecord] ([Id])
GO
ALTER TABLE [MAR].[NotAdministeredMedicine] CHECK CONSTRAINT [FK_dbo.NotAdministeredMedicines_dbo.MedicalRecords_MarId]
GO
ALTER TABLE [MAR].[NotAdministeredMedicine]  WITH CHECK ADD  CONSTRAINT [FK_dbo.NotAdministeredMedicines_dbo.Medications_MedicationId] FOREIGN KEY([MedicationId])
REFERENCES [MAR].[Medication] ([Id])
GO
ALTER TABLE [MAR].[NotAdministeredMedicine] CHECK CONSTRAINT [FK_dbo.NotAdministeredMedicines_dbo.Medications_MedicationId]
GO
ALTER TABLE [MAR].[TreatmentPlan]  WITH CHECK ADD  CONSTRAINT [FK_MAR.TreatmentPlan_dbo.AspNetUsers_StaffId] FOREIGN KEY([StaffId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [MAR].[TreatmentPlan] CHECK CONSTRAINT [FK_MAR.TreatmentPlan_dbo.AspNetUsers_StaffId]
GO
ALTER TABLE [MAR].[TreatmentPlan]  WITH CHECK ADD  CONSTRAINT [FK_MAR.TreatmentPlan_MAR.Patient_PatientId] FOREIGN KEY([PatientId])
REFERENCES [MAR].[Patient] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [MAR].[TreatmentPlan] CHECK CONSTRAINT [FK_MAR.TreatmentPlan_MAR.Patient_PatientId]
GO
USE [master]
GO
ALTER DATABASE [MyHealthCare] SET  READ_WRITE 
GO
