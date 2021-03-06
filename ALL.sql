USE [master]
GO
/****** Object:  Database [Foofle]    Script Date: 6/25/20 9:05:23 ******/
CREATE DATABASE [Foofle]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Foofle', FILENAME = N'C:\Users\Black\Foofle.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Foofle_log', FILENAME = N'C:\Users\Black\Foofle_log.ldf' , SIZE = 401408KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Foofle] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Foofle].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Foofle] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Foofle] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Foofle] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Foofle] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Foofle] SET ARITHABORT OFF 
GO
ALTER DATABASE [Foofle] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Foofle] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Foofle] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Foofle] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Foofle] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Foofle] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Foofle] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Foofle] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Foofle] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Foofle] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Foofle] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Foofle] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Foofle] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Foofle] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Foofle] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Foofle] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [Foofle] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Foofle] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Foofle] SET  MULTI_USER 
GO
ALTER DATABASE [Foofle] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Foofle] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Foofle] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Foofle] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Foofle] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Foofle] SET QUERY_STORE = OFF
GO
USE [Foofle]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [Foofle]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 6/25/20 9:05:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Emails]    Script Date: 6/25/20 9:05:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Emails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Sender] [int] NOT NULL,
	[Receivers] [nvarchar](max) NOT NULL,
	[CCReceivers] [nvarchar](max) NULL,
	[Subject] [nvarchar](max) NOT NULL,
	[Time] [datetime2](7) NOT NULL,
	[Text] [nvarchar](max) NULL,
 CONSTRAINT [PK_Emails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Entrances]    Script Date: 6/25/20 9:05:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Entrances](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[Time] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Entrances] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notifications]    Script Date: 6/25/20 9:05:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notifications](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[Text] [nvarchar](max) NOT NULL,
	[Time] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Notifications] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 6/25/20 9:05:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](max) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[Date] [datetime2](7) NOT NULL,
	[PrimaryPhone] [nvarchar](max) NOT NULL,
	[FirstName] [nvarchar](max) NOT NULL,
	[LastName] [nvarchar](max) NOT NULL,
	[Phone] [nvarchar](max) NOT NULL,
	[BirthDate] [datetime2](7) NOT NULL,
	[Nickname] [nvarchar](max) NOT NULL,
	[IDNumber] [nvarchar](max) NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
	[DoNotShare] [nvarchar](max) NULL,
	[SentEmails] [nvarchar](max) NULL,
	[ReceivedEmailsU] [nvarchar](max) NULL,
	[ReceivedEmailsR] [nvarchar](max) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[DeleteEmail]    Script Date: 6/25/20 9:05:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Delete Email method
-- =============================================
CREATE PROCEDURE [dbo].[DeleteEmail] (
	@EmailId	INT,
	@MSG		NVARCHAR(MAX) OUTPUT)
	
AS
BEGIN
	SET NOCOUNT ON

	-- getting last entered UserID
	DECLARE @Id INT -- ID of current user entrance
	DECLARE @CurrentId INT -- ID of current user
	SELECT DISTINCT TOP 1 @Id = Id FROM Entrances ORDER BY Id DESC
	SELECT DISTINCT @CurrentId = UserId FROM Entrances WHERE @Id LIKE Id

	DECLARE @RecU NVARCHAR(MAX)
	DECLARE @RecR NVARCHAR(MAX)
	DECLARE @Sent NVARCHAR(MAX)
	SELECT DISTINCT @RecU = ReceivedEmailsU FROM Users WHERE @CurrentId LIKE Id
	SELECT DISTINCT @RecR = ReceivedEmailsR FROM Users WHERE @CurrentId LIKE Id
	SELECT DISTINCT @Sent = SentEmails FROM Users WHERE @CurrentId LIKE Id

	DECLARE @List NVARCHAR(MAX)
	IF @EmailId IN (SELECT value FROM STRING_SPLIT(@RecU, ','))
		SET @List = @RecU
	ELSE IF @EmailId IN (SELECT value FROM STRING_SPLIT(@RecR, ','))
		SET @List = @RecR
	ELSE IF @EmailId IN (SELECT value FROM STRING_SPLIT(@Sent, ','))
		SET @List = @Sent
	ELSE
		BEGIN
			SET @MSG = 'Email ID is not in your list'
			RETURN -1
		END

	-- removing from emails list
	IF CHARINDEX(CONVERT(NVARCHAR(MAX), @EmailId), @List) = 1
		SET @List = SUBSTRING(@List, CHARINDEX(CONVERT(NVARCHAR(MAX), @EmailId), @List) + LEN(@EmailId) + 1, LEN(@List))
	ELSE
		SET @List = SUBSTRING(@List, 1, CHARINDEX(CONVERT(NVARCHAR(MAX), @EmailId), @List) - 2) + 
			SUBSTRING(@List, CHARINDEX(CONVERT(NVARCHAR(MAX), @EmailId), @List) + LEN(@EmailId), LEN(@List))

	PRINT @List

	IF LEN(@List) = 0
		SET @List = NULL

	IF @EmailId IN (SELECT value FROM STRING_SPLIT(@RecU, ','))
		BEGIN
			UPDATE Users
				SET		ReceivedEmailsU = @List
				WHERE	Id LIKE @CurrentId
		END
	ELSE IF @EmailId IN (SELECT value FROM STRING_SPLIT(@RecR, ','))
		BEGIN
			UPDATE Users
				SET		ReceivedEmailsR = @List
				WHERE	Id LIKE @CurrentId
		END
	ELSE
		BEGIN
			UPDATE Users
				SET		SentEmails = @List
				WHERE	Id LIKE @CurrentId
		END
	
	SET @MSG = 'Emails deleted successfully'
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteUser]    Script Date: 6/25/20 9:05:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Read Email method
-- =============================================
CREATE PROCEDURE [dbo].[DeleteUser] (
	@MSG		NVARCHAR(MAX) OUTPUT)
	
AS
BEGIN
	SET NOCOUNT ON

	-- getting last entered UserID
	DECLARE @Id INT -- ID of current user entrance
	DECLARE @CurrentId INT -- ID of current user
	SELECT DISTINCT TOP 1 @Id = Id FROM Entrances ORDER BY Id DESC
	SELECT DISTINCT @CurrentId = UserId FROM Entrances WHERE @Id LIKE Id

	DELETE FROM Users WHERE Id LIKE @CurrentId

	DELETE FROM Entrances WHERE UserId LIKE @CurrentId

	SET @MSG = 'User deleted successfully'
END
GO
/****** Object:  StoredProcedure [dbo].[Edit]    Script Date: 6/25/20 9:05:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Edit method
-- =============================================
CREATE PROCEDURE [dbo].[Edit] (
    @Password		NVARCHAR(MAX),
    @PrimaryPhone	NVARCHAR(MAX),
    @FirstName		NVARCHAR(MAX),
    @LastName		NVARCHAR(MAX),
    @Phone			NVARCHAR(MAX),
    @BirthDate		DATETIME2(7),
    @Nickname		NVARCHAR(MAX),
    @IDNumber		NVARCHAR(MAX),
    @Address		NVARCHAR(MAX),
	@DoNotShare		NVARCHAR(MAX),
	@MSG			NVARCHAR(MAX) OUTPUT)
	
AS
BEGIN
	SET NOCOUNT ON

	-- getting last entered UserID
	DECLARE @Id INT -- ID of current user entrance
	DECLARE @CurrentId INT -- ID of current user
	SELECT DISTINCT TOP 1 @Id = Id FROM Entrances ORDER BY Id DESC
	SELECT DISTINCT @CurrentId = UserId FROM Entrances WHERE @Id LIKE Id

	-- updating
	IF @Password IS NOT NULL
		IF (LEN(@Password) < 6 OR @Password NOT LIKE '%[0-9]%' OR @Password NOT LIKE '%[a-zA-Z]%')
			BEGIN
				SET @MSG = 'Password is not sufficient'
				RETURN -1
			END
		ELSE
			BEGIN
				UPDATE Users
				SET		Password = ENCRYPTBYPASSPHRASE('password', @Password)
				WHERE	Id LIKE @CurrentId
			END

	IF @PrimaryPhone IS NOT NULL
		BEGIN
			UPDATE Users
			SET		PrimaryPhone = @PrimaryPhone
			WHERE	Id LIKE @CurrentId
		END

	IF @FirstName IS NOT NULL
		BEGIN
			UPDATE Users
			SET		FirstName = @FirstName
			WHERE	Id LIKE @CurrentId
		END

	IF @LastName IS NOT NULL
		BEGIN
			UPDATE Users
			SET		LastName = @LastName
			WHERE	Id LIKE @CurrentId
		END

	IF @Phone IS NOT NULL
		BEGIN
			UPDATE Users
			SET		Phone = @Phone
			WHERE	Id LIKE @CurrentId
		END

	IF @BirthDate IS NOT NULL
		BEGIN
			UPDATE Users
			SET		BirthDate = @BirthDate
			WHERE	Id LIKE @CurrentId
		END

	IF @Nickname IS NOT NULL
		BEGIN
			UPDATE Users
			SET		Nickname = @Nickname
			WHERE	Id LIKE @CurrentId
		END

	IF @IDNumber IS NOT NULL
		BEGIN
			UPDATE Users
			SET		IDNumber = @IDNumber
			WHERE	Id LIKE @CurrentId
		END

	IF @Address IS NOT NULL
		BEGIN
			UPDATE Users
			SET		Address = @Address
			WHERE	Id LIKE @CurrentId
		END

	SET @MSG = 'User edited successfully'

	IF @DoNotShare IS NOT NULL
		BEGIN
			UPDATE Users
			SET		DoNotShare = @DoNotShare
			WHERE	Id LIKE @CurrentId
		
			SET @MSG = 'User blocked successfully'
		END
END
GO
/****** Object:  StoredProcedure [dbo].[GetEmails]    Script Date: 6/25/20 9:05:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Get Emails method
-- =============================================
CREATE PROCEDURE [dbo].[GetEmails] (
	@IsSent		INT,
	@PageNumber	INT,
	@MSG		NVARCHAR(MAX) OUTPUT)
	
AS
BEGIN
	SET NOCOUNT ON

		-- getting last entered UserID
	DECLARE @Id INT -- ID of current user entrance
	DECLARE @CurrentId INT -- ID of current user
	SELECT DISTINCT TOP 1 @Id = Id FROM Entrances ORDER BY Id DESC
	SELECT DISTINCT @CurrentId = UserId FROM Entrances WHERE @Id LIKE Id

	DECLARE @Emails NVARCHAR(MAX) -- emails we want to see

	IF @IsSent = 1
		BEGIN
			SELECT DISTINCT @Emails = SentEmails FROM Users WHERE @CurrentId LIKE Id

			SELECT DISTINCT Id, Subject, Time FROM Emails 
				WHERE Id IN (SELECT value FROM STRING_SPLIT(@Emails, ',')) ORDER BY Id DESC
				OFFSET (@PageNumber - 1) * 10 ROWS   -- Skip this number of rows
				FETCH NEXT 10 ROWS ONLY;  -- Return 10 number of rows
		END
	ELSE
		BEGIN
			DECLARE @Rec TABLE(Id INT, Subject NVARCHAR(MAX), Time DATETIME2(7), IsRead INT)

			SELECT DISTINCT @Emails = ReceivedEmailsU FROM Users WHERE @CurrentId LIKE Id
			INSERT @Rec (Id, Subject, Time, IsRead)
				SELECT DISTINCT Id, Subject, Time, '0' AS IsRead FROM Emails 
					WHERE Id IN (SELECT value FROM STRING_SPLIT(@Emails, ','))

			SELECT DISTINCT @Emails = ReceivedEmailsR FROM Users WHERE @CurrentId LIKE Id
			INSERT @Rec (Id, Subject, Time, IsRead)
				SELECT DISTINCT Id, Subject, Time, '1' AS IsRead FROM Emails
					WHERE Id IN (SELECT value FROM STRING_SPLIT(@Emails, ','))

			SELECT DISTINCT Id, Subject, Time, IsRead FROM @Rec ORDER BY Id DESC
				OFFSET (@PageNumber - 1) * 10 ROWS   -- Skip this number of rows
				FETCH NEXT 10 ROWS ONLY;  -- Return 10 number of rows
		END

	SET @MSG = 'Here is your emails'
END
GO
/****** Object:  StoredProcedure [dbo].[GetInfo]    Script Date: 6/25/20 9:05:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- GetInfo method
-- =============================================
CREATE PROCEDURE [dbo].[GetInfo] (
	@Username	NVARCHAR(MAX),
	@MSG		NVARCHAR(MAX) OUTPUT)
	
AS
BEGIN
	SET NOCOUNT ON

	-- getting last entered UserID
	DECLARE @Id INT -- ID of current user entrance
	DECLARE @CurrentId INT -- ID of current user
	SELECT DISTINCT TOP 1 @Id = Id FROM Entrances ORDER BY Id DESC
	SELECT DISTINCT @CurrentId = UserId FROM Entrances WHERE @Id LIKE Id

	-- for the own user info
	IF @Username IS NULL
		BEGIN
			SELECT DISTINCT Username, Date, PrimaryPhone,
			FirstName, LastName, Phone, BirthDate, Nickname, IDNumber, Address, DoNotShare
			FROM Users WHERE Id LIKE @CurrentId
			SET @MSG = 'Here is your info'
		END

	-- for the other user info
	ELSE
		BEGIN
			DECLARE @UserId INT -- ID of the user we want to see his/her info
			SELECT DISTINCT @UserId = Id FROM Users WHERE UPPER(Username) LIKE UPPER(@Username)
			IF @@ROWCOUNT = 0
				BEGIN
					SET @MSG = 'Username does not exist'
					RETURN -1
				END
			ELSE
				BEGIN
					DECLARE @Dont NVARCHAR(MAX)
					DECLARE @CurrentUser NVARCHAR(MAX) -- username of user we want too see his/her info
					SELECT DISTINCT @Dont = DoNotShare FROM Users WHERE Id LIKE @UserId
					SELECT DISTINCT @CurrentUser = Username FROM Users WHERE Id LIKE @CurrentId

					IF CHARINDEX(CONVERT(NVARCHAR(MAX), @CurrentId), @Dont) > 0
						BEGIN
							SELECT DISTINCT '*' AS FirstName, '*' AS LastName, '*' AS Phone, '*' AS BirthDate,
							'*' AS Nickname, '*' AS IDNumber, '*' AS Address
							FROM Users

							-- adding notification
							INSERT INTO Notifications(UserId, Text, Time)
								VALUES (@UserId, @CurrentUser + ' saw your personal info. He/She does NOT have access to your info.',
									GETDATE())
						END
					ELSE
						BEGIN
							SELECT DISTINCT FirstName, LastName, Phone, BirthDate, Nickname, IDNumber, Address
							FROM Users WHERE Id LIKE @UserId

							-- adding notification
							INSERT INTO Notifications(UserId, Text, Time)
								VALUES (@UserId, @CurrentUser + ' saw your personal info. He/She has access to your info.',
									GETDATE())
						END

					SET @MSG = 'Here is info'
				END
		END
END
GO
/****** Object:  StoredProcedure [dbo].[GetNotifcations]    Script Date: 6/25/20 9:05:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Get Notifications method
-- =============================================
CREATE PROCEDURE [dbo].[GetNotifcations] (
	@MSG		NVARCHAR(MAX) OUTPUT)
	
AS
BEGIN
	SET NOCOUNT ON

	-- getting last entered UserID
	DECLARE @Id INT -- ID of current user entrance
	DECLARE @CurrentId INT -- ID of current user
	SELECT DISTINCT TOP 1 @Id = Id FROM Entrances ORDER BY Id DESC
	SELECT DISTINCT @CurrentId = UserId FROM Entrances WHERE @Id LIKE Id

	-- displaying notifications
	SELECT Text, Time FROM Notifications WHERE UserId LIKE @CurrentId ORDER BY Id DESC

	SET @MSG = 'Here is your notifications'

END
GO
/****** Object:  StoredProcedure [dbo].[GetUsers]    Script Date: 6/25/20 9:05:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Get DoNotShare method
-- =============================================
CREATE PROCEDURE [dbo].[GetUsers] (
	@MSG		NVARCHAR(MAX) OUTPUT)
	
AS
BEGIN
	SET NOCOUNT ON

	-- getting last entered UserID
	DECLARE @Id INT -- ID of current user entrance
	DECLARE @CurrentId INT -- ID of current user
	SELECT DISTINCT TOP 1 @Id = Id FROM Entrances ORDER BY Id DESC
	SELECT DISTINCT @CurrentId = UserId FROM Entrances WHERE @Id LIKE Id

	SELECT Id, Username FROM Users WHERE Id NOT LIKE @CurrentId

	SET @MSG = 'Here is users list'
END
GO
/****** Object:  StoredProcedure [dbo].[Login]    Script Date: 6/25/20 9:05:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Login method
-- =============================================
CREATE PROCEDURE [dbo].[Login] (
	@Username		NVARCHAR(MAX),
    @Password		NVARCHAR(MAX),
	@MSG			NVARCHAR(MAX) OUTPUT)
	
AS
BEGIN
	SET NOCOUNT ON

	IF NOT EXISTS (Select DISTINCT Username, Password FROM Users 
					WHERE UPPER(Username) LIKE UPPER(@Username) AND
					CONVERT(NVARCHAR(MAX), DECRYPTBYPASSPHRASE('password', Password)) LIKE @Password COLLATE Latin1_General_CS_AS)
		BEGIN
			SET @MSG = 'Username or password is not correct'
			RETURN -1
		END
	ELSE
		BEGIN
			-- inserting into entrances table
			DECLARE @Id INT
			Select DISTINCT @Id = Id FROM Users WHERE UPPER(Username) LIKE UPPER(@Username)

			INSERT INTO Entrances(UserId, Time)
					VALUES (@Id, GETDATE())

			SET @MSG = 'User logged in successfully'
		END
END
GO
/****** Object:  StoredProcedure [dbo].[ReadEmail]    Script Date: 6/25/20 9:05:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Read Email method
-- =============================================
CREATE PROCEDURE [dbo].[ReadEmail] (
	@EmailId	INT,
	@IsSent		INT,
	@MSG		NVARCHAR(MAX) OUTPUT)
	
AS
BEGIN
	SET NOCOUNT ON

	-- getting last entered UserID
	DECLARE @Id INT -- ID of current user entrance
	DECLARE @CurrentId INT -- ID of current user
	SELECT DISTINCT TOP 1 @Id = Id FROM Entrances ORDER BY Id DESC
	SELECT DISTINCT @CurrentId = UserId FROM Entrances WHERE @Id LIKE Id

	-- specifying sender username
	DECLARE @Sender NVARCHAR(MAX)
	SELECT DISTINCT @Sender = Sender FROM Emails WHERE Id LIKE @EmailId
	SELECT DISTINCT @Sender = Username FROM Users WHERE Id LIKE @Sender

	-- adding to read emails for unread received emails
	IF @IsSent = 0
		BEGIN
			DECLARE @RecU NVARCHAR(MAX)
			DECLARE @RecR NVARCHAR(MAX)
			SELECT DISTINCT @RecU = ReceivedEmailsU FROM Users WHERE @CurrentId LIKE Id
			SELECT DISTINCT @RecR = ReceivedEmailsR FROM Users WHERE @CurrentId LIKE Id

			-- check if email is in read emails list
			IF @EmailId IN (SELECT value FROM STRING_SPLIT(@RecR, ','))
				-- displaying email
				SELECT DISTINCT @Sender AS Sender, Time, Subject, Text FROM Emails WHERE Id LIKE @EmailId
			ELSE
				BEGIN
					-- check if the user recieved the email
					IF @EmailId NOT IN (SELECT value FROM STRING_SPLIT(@RecU, ','))
						BEGIN
							SET @MSG = 'Email ID is not in your list'
							RETURN -1
						END

					-- displaying email
					SELECT DISTINCT @Sender AS Sender, Time, Subject, Text FROM Emails WHERE Id LIKE @EmailId
	
					IF CHARINDEX(CONVERT(NVARCHAR(MAX), @EmailId), @RecU) = 1
						SET @RecU = SUBSTRING(@RecU, CHARINDEX(CONVERT(NVARCHAR(MAX), @EmailId), @RecU) + LEN(@EmailId) + 1, LEN(@RecU))
					ELSE
						SET @RecU = SUBSTRING(@RecU, 1, CHARINDEX(CONVERT(NVARCHAR(MAX), @EmailId), @RecU) - 2) + 
							SUBSTRING(@RecU, CHARINDEX(CONVERT(NVARCHAR(MAX), @EmailId), @RecU) + LEN(@EmailId), LEN(@RecU))
					-- PRINT @RecU

					IF LEN(@RecU) = 0
						SET @RecU = NULL

					IF @RecR IS NULL
						SET @RecR = @EmailId
					ELSE
						SET @RecR = CONCAT(@RecR, ',', @EmailId)
					-- PRINT @RecR

					UPDATE Users
						SET		ReceivedEmailsU = @RecU,
								ReceivedEmailsR = @RecR
						WHERE	Id LIKE @CurrentId
				END
		END
	ELSE -- for sent emails
		BEGIN
			DECLARE @Sent NVARCHAR(MAX)
			SELECT DISTINCT @Sent = SentEmails FROM Users WHERE @CurrentId LIKE Id

			-- check if the user recieved the email
			IF @EmailId NOT IN (SELECT value FROM STRING_SPLIT(@Sent, ','))
				BEGIN
					SET @MSG = 'Email ID is not in your list'
					RETURN -1
				END

			-- displaying email
			SELECT DISTINCT @Sender AS Sender, Time, Subject, Text FROM Emails WHERE Id LIKE @EmailId
		END

	SET @MSG = 'Here is your email'
END
GO
/****** Object:  StoredProcedure [dbo].[Register]    Script Date: 6/25/20 9:05:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Register method
-- =============================================
CREATE PROCEDURE [dbo].[Register] (
	@Username		NVARCHAR(MAX),
    @Password		NVARCHAR(MAX),
    @PrimaryPhone	NVARCHAR(MAX),
    @FirstName		NVARCHAR(MAX),
    @LastName		NVARCHAR(MAX),
    @Phone			NVARCHAR(MAX),
    @BirthDate		DATETIME2(7),
    @Nickname		NVARCHAR(MAX),
    @IDNumber		NVARCHAR(MAX),
    @Address		NVARCHAR(MAX),
	@MSG			NVARCHAR(MAX) OUTPUT)
	
AS
BEGIN
	SET NOCOUNT ON

	IF EXISTS (SELECT DISTINCT Username FROM Users WHERE UPPER(Username) LIKE UPPER(@Username))
		BEGIN
			SET @MSG = 'Username exists already'
			RETURN -1
		END
	ELSE IF (LEN(@Username) < 6 OR LEN(@Password) < 6 OR 
	@Username NOT LIKE '%[0-9]%' OR @Username NOT LIKE '%[a-zA-Z]%' OR 
	@Password NOT LIKE '%[0-9]%' OR @Password NOT LIKE '%[a-zA-Z]%')
		BEGIN
			SET @MSG = 'Username or password is not sufficient'
			RETURN -1
		END
	ELSE
		BEGIN
			INSERT INTO Users(Username,
							Password,
							Date,
							PrimaryPhone,
							FirstName,
							LastName,
							Phone,
							BirthDate,
							Nickname,
							IDNumber,
							Address)
					VALUES     ( @Username,
							ENCRYPTBYPASSPHRASE('password', @Password),
							GETDATE(),
							@PrimaryPhone,
							@FirstName,
							@LastName,
							@Phone,
							@BirthDate,
							@Nickname,
							@IDNumber,
							@Address)

			SET @MSG = 'User registered successfully'
		END
END
GO
/****** Object:  StoredProcedure [dbo].[Send]    Script Date: 6/25/20 9:05:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Send Email method
-- =============================================
CREATE PROCEDURE [dbo].[Send] (
	@Receivers		NVARCHAR(MAX),
    @CCReceivers	NVARCHAR(MAX),
    @Subject		NVARCHAR(MAX),
    @Text			NVARCHAR(MAX),
	@MSG			NVARCHAR(MAX) OUTPUT)
	
AS
BEGIN
	SET NOCOUNT ON

	DECLARE @Rec TABLE(value NVARCHAR(MAX))
	INSERT @Rec (value)
		SELECT value FROM STRING_SPLIT(@Receivers, ',')

	DECLARE @CCRec TABLE(value NVARCHAR(MAX))
	INSERT @CCRec (value)
		SELECT value FROM STRING_SPLIT(@CCReceivers, ',')

	-- SELECT value FROM @Rec
	-- SELECT value FROM @CCRec

	DECLARE @Receiver NVARCHAR(MAX)
	DECLARE @ReceiverUser NVARCHAR(MAX)
	DECLARE @EmailPostfix NVARCHAR(MAX)
	DECLARE @RecId NVARCHAR(MAX)
	DECLARE @RecIds TABLE(value INT) -- table fo receiver IDs
	DECLARE @RecIdsString NVARCHAR(MAX)
	SET @RecIdsString = ''
	DECLARE @CCRecIdsString NVARCHAR(MAX)
	SET @CCRecIdsString = ''
	
	-- checking validation of email addresses in Receivers
	WHILE EXISTS (SELECT TOP 1 * FROM @Rec)
		BEGIN
			SELECT TOP 1 @Receiver = value FROM @Rec
			
			IF CHARINDEX('@', @Receiver) <= 0
				BEGIN
					SET @MSG = 'One of the email addresses is invalid'
					RETURN -1
				END

			SET @ReceiverUser = SUBSTRING(@Receiver, 1, CHARINDEX('@', @Receiver) - 1)
			SET @EmailPostfix = SUBSTRING(@Receiver, CHARINDEX('@', @Receiver) + 1, 10)

			-- check if email address is valid
			IF NOT EXISTS (SELECT DISTINCT Username FROM Users WHERE UPPER(Username) LIKE UPPER(@ReceiverUser)) OR
				NOT @EmailPostfix = 'foofle.com'
				BEGIN
					SET @MSG = 'One of the email addresses is invalid'
					RETURN -1
				END

			INSERT @RecIds (value)
				SELECT DISTINCT Id FROM Users WHERE UPPER(Username) LIKE UPPER(@ReceiverUser)

			-- concating to receivers IDs
			SELECT DISTINCT @RecId = Id FROM Users WHERE UPPER(Username) LIKE UPPER(@ReceiverUser)

			IF @RecIdsString = ''
				SET @RecIdsString = @RecId
			ELSE
				SET @RecIdsString = CONCAT(@RecIdsString, ',', @RecId)

			DELETE TOP (1) FROM @Rec
		END

	-- checking validation of email addresses in CC Receivers
	WHILE EXISTS (SELECT TOP 1 * FROM @CCRec)
		BEGIN
			SELECT TOP 1 @Receiver = value FROM @CCRec
			
			IF CHARINDEX('@', @Receiver) <= 0
				BEGIN
					SET @MSG = 'One of the email addresses is invalid'
					RETURN -1
				END

			SET @ReceiverUser = SUBSTRING(@Receiver, 1, CHARINDEX('@', @Receiver) - 1)
			SET @EmailPostfix = SUBSTRING(@Receiver, CHARINDEX('@', @Receiver) + 1, 10)

			-- check if email address is valid
			IF NOT EXISTS (SELECT DISTINCT Username FROM Users WHERE UPPER(Username) LIKE UPPER(@ReceiverUser)) OR
				NOT @EmailPostfix = 'foofle.com'
				BEGIN
					SET @MSG = 'One of the email addresses is invalid'
					RETURN -1
				END

			INSERT @RecIds (value)
				SELECT DISTINCT Id FROM Users WHERE UPPER(Username) LIKE UPPER(@ReceiverUser)

			-- concating to receivers IDs
			SELECT DISTINCT @RecId = Id FROM Users WHERE UPPER(Username) LIKE UPPER(@ReceiverUser)

			IF @CCRecIdsString = ''
				SET @CCRecIdsString = @RecId
			ELSE
				SET @CCRecIdsString = CONCAT(@CCRecIdsString, ',', @RecId)

			DELETE TOP (1) FROM @CCRec
		END
		
		
	-- SELECT value FROM @RecIds
	-- PRINT @RecIdsString
	-- PRINT @CCRecIdsString

	-- sending email
	-- getting last entered UserID
	DECLARE @Id INT -- ID of current user entrance
	DECLARE @CurrentId INT -- ID of current user
	SELECT DISTINCT TOP 1 @Id = Id FROM Entrances ORDER BY Id DESC
	SELECT DISTINCT @CurrentId = UserId FROM Entrances WHERE @Id LIKE Id

	INSERT INTO Emails(Sender,
					Receivers,
					CCReceivers,
					Subject,
					Time,
					Text)
		VALUES     (@CurrentId,
					@RecIdsString,
					@CCRecIdsString,
					@Subject,
					GETDATE(),
					@Text)

	-- adding email to lists
	DECLARE @EmailId INT -- ID of sent email
	SELECT DISTINCT TOP 1 @EmailId = Id FROM Emails ORDER BY Id DESC
	-- PRINT @EmailId

	-- adding to sent emails
	DECLARE @SentEmails NVARCHAR(MAX)
	SELECT DISTINCT @SentEmails = SentEmails FROM Users WHERE @CurrentId LIKE Id
	IF @SentEmails IS NULL
		SET @SentEmails = @EmailId
	ELSE
		SET @SentEmails = CONCAT(@SentEmails, ',', @EmailId)

	UPDATE Users
		SET		SentEmails = @SentEmails
		WHERE	Id LIKE @CurrentId

	-- adding to received emails
	DECLARE @RecEmails NVARCHAR(MAX)
	WHILE EXISTS (SELECT TOP 1 * FROM @RecIds)
	BEGIN
		SELECT TOP 1 @Receiver = value FROM @RecIds

		SELECT DISTINCT @RecEmails = ReceivedEmailsU FROM Users WHERE @Receiver LIKE Id
		IF @RecEmails IS NULL
			SET @RecEmails = @EmailId
		ELSE
			SET @RecEmails = CONCAT(@RecEmails, ',', @EmailId)

		UPDATE Users
			SET		ReceivedEmailsU = @RecEmails
			WHERE	Id LIKE @Receiver

		DELETE TOP (1) FROM @RecIds
	END
	
	SET @MSG = 'Email sent successfully'
END
GO
USE [master]
GO
ALTER DATABASE [Foofle] SET  READ_WRITE 
GO
