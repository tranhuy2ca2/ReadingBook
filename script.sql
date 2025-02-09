USE [master]
GO
/****** Object:  Database [SWP391_G2_Project]    Script Date: 3/20/2024 1:12:28 PM ******/
CREATE DATABASE [SWP391_G2_Project]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SWP391_G2_Project', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\SWP391_G2_Project.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SWP391_G2_Project_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\SWP391_G2_Project_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [SWP391_G2_Project] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SWP391_G2_Project].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SWP391_G2_Project] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SWP391_G2_Project] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SWP391_G2_Project] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SWP391_G2_Project] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SWP391_G2_Project] SET ARITHABORT OFF 
GO
ALTER DATABASE [SWP391_G2_Project] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SWP391_G2_Project] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SWP391_G2_Project] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SWP391_G2_Project] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SWP391_G2_Project] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SWP391_G2_Project] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SWP391_G2_Project] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SWP391_G2_Project] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SWP391_G2_Project] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SWP391_G2_Project] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SWP391_G2_Project] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SWP391_G2_Project] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SWP391_G2_Project] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SWP391_G2_Project] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SWP391_G2_Project] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SWP391_G2_Project] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SWP391_G2_Project] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SWP391_G2_Project] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SWP391_G2_Project] SET  MULTI_USER 
GO
ALTER DATABASE [SWP391_G2_Project] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SWP391_G2_Project] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SWP391_G2_Project] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SWP391_G2_Project] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SWP391_G2_Project] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SWP391_G2_Project] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [SWP391_G2_Project] SET QUERY_STORE = ON
GO
ALTER DATABASE [SWP391_G2_Project] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [SWP391_G2_Project]
GO
/****** Object:  Table [dbo].[BanComment]    Script Date: 3/20/2024 1:12:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BanComment](
	[userID] [int] NOT NULL,
	[problem] [int] NOT NULL,
	[detail] [nvarchar](max) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BanCommentType]    Script Date: 3/20/2024 1:12:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BanCommentType](
	[banId] [int] NOT NULL,
	[banType] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_BanCommentType] PRIMARY KEY CLUSTERED 
(
	[banId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Book]    Script Date: 3/20/2024 1:12:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book](
	[bookID] [int] IDENTITY(1,1) NOT NULL,
	[userID] [int] NULL,
	[authorName] [nvarchar](max) NOT NULL,
	[title] [nvarchar](50) NOT NULL,
	[views] [int] NULL,
	[detail] [nvarchar](max) NOT NULL,
	[img] [nvarchar](max) NOT NULL,
	[publishDate] [date] NOT NULL,
	[status] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Book] PRIMARY KEY CLUSTERED 
(
	[bookID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 3/20/2024 1:12:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CateID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[describe] [nvarchar](500) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category_in_book]    Script Date: 3/20/2024 1:12:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category_in_book](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[BookID] [int] NOT NULL,
	[CateID] [int] NOT NULL,
 CONSTRAINT [PK_Category_in_book] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Chapter]    Script Date: 3/20/2024 1:12:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Chapter](
	[ChapterID] [int] NOT NULL,
	[BookID] [int] NOT NULL,
	[NumberChapter] [int] NULL,
	[ChapterName] [nvarchar](50) NULL,
	[Contents_1] [nvarchar](max) NULL,
	[Contents_2] [nvarchar](max) NULL,
	[status] [nvarchar](50) NULL,
 CONSTRAINT [PK_Chapter] PRIMARY KEY CLUSTERED 
(
	[ChapterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 3/20/2024 1:12:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[cmtID] [int] NOT NULL,
	[bookID] [int] NOT NULL,
	[userID] [int] NOT NULL,
	[cmt] [nvarchar](500) NOT NULL,
	[publishDate] [date] NOT NULL,
	[like] [int] NULL,
	[reply] [int] NULL,
 CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED 
(
	[cmtID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contact]    Script Date: 3/20/2024 1:12:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact](
	[contactID] [int] NOT NULL,
	[userID] [int] NOT NULL,
	[content] [nvarchar](500) NOT NULL,
	[ans] [nchar](500) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DeletedUser]    Script Date: 3/20/2024 1:12:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeletedUser](
	[userID] [int] NOT NULL,
	[fromDate] [datetime] NOT NULL,
	[toDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 3/20/2024 1:12:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[feedbackID] [int] IDENTITY(1,1) NOT NULL,
	[userID] [int] NULL,
	[title] [int] NOT NULL,
	[description] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Feedback] PRIMARY KEY CLUSTERED 
(
	[feedbackID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PayChapter]    Script Date: 3/20/2024 1:12:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PayChapter](
	[payId] [int] IDENTITY(1,1) NOT NULL,
	[userID] [int] NOT NULL,
	[chapterId] [int] NOT NULL,
	[payDate] [datetime] NOT NULL,
 CONSTRAINT [PK_PayChapter] PRIMARY KEY CLUSTERED 
(
	[payId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rate]    Script Date: 3/20/2024 1:12:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rate](
	[rateID] [int] NOT NULL,
	[bookID] [int] NOT NULL,
	[userID] [int] NOT NULL,
	[rateContent] [nvarchar](50) NULL,
 CONSTRAINT [PK_Rate] PRIMARY KEY CLUSTERED 
(
	[rateID] ASC,
	[bookID] ASC,
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reading]    Script Date: 3/20/2024 1:12:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reading](
	[userID] [int] NOT NULL,
	[bookid] [int] NOT NULL,
	[chapterid] [int] NOT NULL,
	[readingDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Report]    Script Date: 3/20/2024 1:12:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Report](
	[userID] [int] NOT NULL,
	[bookId] [int] NOT NULL,
	[problem] [int] NOT NULL,
	[chapter] [nvarchar](50) NULL,
	[detail] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReportType]    Script Date: 3/20/2024 1:12:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReportType](
	[reportId] [int] NOT NULL,
	[reportType] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ReportType] PRIMARY KEY CLUSTERED 
(
	[reportId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Response]    Script Date: 3/20/2024 1:12:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Response](
	[responseId] [int] IDENTITY(1,1) NOT NULL,
	[userID] [int] NOT NULL,
	[title] [nvarchar](50) NOT NULL,
	[detail] [nvarchar](max) NOT NULL,
	[responseTime] [datetime] NOT NULL,
 CONSTRAINT [PK_Response] PRIMARY KEY CLUSTERED 
(
	[responseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 3/20/2024 1:12:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[roleID] [int] NOT NULL,
	[roleName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[roleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SavedBook]    Script Date: 3/20/2024 1:12:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SavedBook](
	[userID] [int] NOT NULL,
	[bookID] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tag]    Script Date: 3/20/2024 1:12:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tag](
	[TagID] [int] NOT NULL,
	[Tagname] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Tag] PRIMARY KEY CLUSTERED 
(
	[TagID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tag_in_book]    Script Date: 3/20/2024 1:12:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tag_in_book](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[TagID] [int] NOT NULL,
	[BookID] [int] NOT NULL,
 CONSTRAINT [PK_Tag_in_book] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TransactionHistory]    Script Date: 3/20/2024 1:12:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransactionHistory](
	[TransactionID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[Amount] [decimal](10, 2) NOT NULL,
	[TransactionType] [int] NOT NULL,
	[TransactionDate] [datetime] NOT NULL,
 CONSTRAINT [PK__Transact__55433A4B23195677] PRIMARY KEY CLUSTERED 
(
	[TransactionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TransactionType]    Script Date: 3/20/2024 1:12:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransactionType](
	[TransactionTypeID] [int] NOT NULL,
	[TransactionTypeName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TransactionType] PRIMARY KEY CLUSTERED 
(
	[TransactionTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 3/20/2024 1:12:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[userID] [int] IDENTITY(1,1) NOT NULL,
	[userName] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[address] [nvarchar](50) NULL,
	[phone] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
	[transaction] [int] NULL,
	[avatar] [nvarchar](max) NULL,
	[roleID] [int] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[view_logs]    Script Date: 3/20/2024 1:12:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[view_logs](
	[account_id] [int] NOT NULL,
	[book_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[account_id] ASC,
	[book_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VipTime]    Script Date: 3/20/2024 1:12:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VipTime](
	[userID] [int] NOT NULL,
	[startDate] [datetime] NOT NULL,
	[endDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
INSERT [dbo].[BanCommentType] ([banId], [banType]) VALUES (1, N'Xúc phạm nhân phẩm')
INSERT [dbo].[BanCommentType] ([banId], [banType]) VALUES (2, N'Phân biệt vùng miền')
INSERT [dbo].[BanCommentType] ([banId], [banType]) VALUES (3, N'Lời nói thô tục, vi phạm thuần phong mỹ tục')
INSERT [dbo].[BanCommentType] ([banId], [banType]) VALUES (4, N'Spam nhiều lần')
INSERT [dbo].[BanCommentType] ([banId], [banType]) VALUES (5, N'Khác')
GO
SET IDENTITY_INSERT [dbo].[Book] ON 

INSERT [dbo].[Book] ([bookID], [userID], [authorName], [title], [views], [detail], [img], [publishDate], [status]) VALUES (1, 3, N'Nhi can', N'Cầu Ma', 115, N'Nếu như các bạn đã từng đọc qua bộ Tiên Nghịch thì chắc các bạn không thể nào quên được tác giả Nhĩ Căn, một tác giả tuy mới nhưng bút lực có thể nói là vô cùng vững chắc.

Qua nhiều ngày mong đợi, cuối cùng Nhĩ Căn đã cho ra tác phẩm mới toanh: Cầu Ma. Như thế nào là ma? Là người táng tận lương tâm, vì thành công mà không từ thủ đoạn, thậm chí tu hành ma công để thành ma đầu sao? Nhĩ Căn không nghĩ thế, Nhĩ Căn muốn viết về một MA thật sự, chứ không phải là một ma đầu thô tục âm u.

Với tác phẩm này, Nhĩ Căn mong muốn truyền đạt đến cho người đọc cuộc sống đầy nhân sinh, một nội dung động lòng người. Với tác phẩm này, Nhĩ Căn muốn xây dựng một Tô Minh đứng trên đỉnh núi nhìn xuống trời đất, mang theo ý vị tang thương và bi thương. "Nếu như thế nhân đã gọi ta là ma, vậy thì dứt khoát, Tô Minh ta từ nay về sau...chính là Ma!"', N'./images/cauma.jpg', CAST(N'2024-10-10' AS Date), N'Full')
INSERT [dbo].[Book] ([bookID], [userID], [authorName], [title], [views], [detail], [img], [publishDate], [status]) VALUES (2, 3, N'Nhĩ Căn', N'Tiên Nhịch', 122, N'Tiên Nghịch là câu chuyện Tiên Hiệp kể về Vương Lâm - một thiếu niên bình thường, may mắn được gia nhập vào một môn phái tu tiên xuống dốc của nước Triệu, vì thiếu linh căn, vì một hiểu nhầm tai hại, vì một khối thiết tinh và nhờ có được một "Thần Bí Hạt Châu". Vương Lâm đã bước lên con đường tu tiên và trên con đường này, hắn sẽ đối mặt với chuyện gì?

- Tu tiên là nghịch thiên hay thuận thiên, là vô tình hay hữu tình? Hãy cùng dõi theo bước chân của Vương Lâm qua 1976 chương Truyện Tiên Nghịch> để biết rõ những điều này bạn nhé!', N'./images/tiennghich.jpg', CAST(N'2024-01-01' AS Date), N'Full')
INSERT [dbo].[Book] ([bookID], [userID], [authorName], [title], [views], [detail], [img], [publishDate], [status]) VALUES (3, 11, N'Nhĩ Căn', N'Nhất Niệm Vĩnh Hằng', 113, N'Nhất niệm thành biển cả, nhất niệm hóa nương dâu.
Nhất niệm trảm nghìn Ma, nhất niệm giết vạn Tiên.

Chỉ có niệm của ta... là Vĩnh hằng.', N'./images/nhatniemvinhhang.jpg', CAST(N'2024-01-01' AS Date), N'Full')
INSERT [dbo].[Book] ([bookID], [userID], [authorName], [title], [views], [detail], [img], [publishDate], [status]) VALUES (4, 13, N'Thiên Tằm Thổ Đậu', N'Đấu Phá Thương Khung', 3, N'Nơi này là thế giới thuộc về đấu khí, không có ma pháp hoa tiếu diễm lệ, thứ có, chỉ là đấu khí đã phồn diễn đến đỉnh cao!

Muốn biết đấu khí tại dị giới phát triển đến cuối cùng sẽ thế nào không?

Cấp bậc chế độ: Đấu giả, đấu sư, đại đấu sư, đấu linh, đấu vương, đấu hoàng, đấu tông, đấu tôn, đấu thánh, đấu đế.

Các bạn nào mới lần đầu đọc truyện về thể loại dị thế, tiên hiệp hay huyễn huyễn sẽ thường xuyên gặp về ma pháp, vũ kỹ, đấu khí, đấu hồn, đấu ma. Nhưng trong truyện này chỉ nói về đấu khí.

Nhân vật chính tên là tiêu viêm. Từ một thiên tài trong tu luyện bỗng dưng trở thành phế vật, là sự xỉ nhục của cả gia tộc. Vì lí do gì mà nhân vật chính từng bước, từng bước khẳng định bản thân.', N'./images/dptk.jpg', CAST(N'2024-01-01' AS Date), N'Updating')
INSERT [dbo].[Book] ([bookID], [userID], [authorName], [title], [views], [detail], [img], [publishDate], [status]) VALUES (5, 11, N'Thiên Tằm Thổ Đậu', N'Vũ Động Càn Khôn', 8, N'Tu luyện một đường, là trộm âm dương, đoạt tạo hóa, chuyển niết bàn, nắm sinh tử, chưởng Luân Hồi.Võ chi cực, phá trời cao, động Càn Khôn!. ', N'./images/vdck.jpg', CAST(N'2024-01-01' AS Date), N'Full')
INSERT [dbo].[Book] ([bookID], [userID], [authorName], [title], [views], [detail], [img], [publishDate], [status]) VALUES (7, 12, N'Ngô Biển Quân', N'Thần Mộ', 3, N'Xuyên suốt vũ trụ hồng hoang, bền vững như thiên địa cao xanh... dẫu thoát được sáu kiếp luân hồi, cũng khó bề chạy khỏi Thần ma vi giới. Thần Ma Lăng Viên ở ngay chính giữa Thiên Nguyên đại lục, đây cũng là nơi an táng những nhân vật mạnh nhất trong lịch sử loài người, khu mộ phần được phân loại theo cấp độ mạnh yếu, càng vào sâu càng mạnh. Trong mỗi ngôi mộ nếu không phải thần linh thì cũng là yêu ma thượng cổ, đây cũng chính là nơi thần thánh và ma quỷ yên nghỉ ngàn thu.

- Thần Nam, nhân vật chính của truyện, từ một thiên tài võ thuật đã trở thành phế nhân chỉ sau một đêm. Người con gái mà Thần Nam yêu quý nhất - Vũ Hinh chết thay cho mình... Sau 1 vạn năm, hắn bỗng sống lại từ Thần Ma Lăng Viên, nơi an táng của thần - ma, chỉ duy nhất hắn là phế nhân. Tại sao hắn lại sống lại? Những bí ẩn cất giấu từ 1 vạn năm trước liệu có bị hắn khám phá ra? Liệu Thần Nam có tìm lại được Vũ Hinh của ngày xưa? Cùng theo dõi bộ truyện Thần Mộ của tác giả Ngô Biển Quân để biết rõ bạn nhé! Cam đoan đây sẽ là một trong những bộ truyện hay nhất mà bạn đã từng đọc! :)
', N'./images/tm.jpg', CAST(N'2024-01-01' AS Date), N'Full')
INSERT [dbo].[Book] ([bookID], [userID], [authorName], [title], [views], [detail], [img], [publishDate], [status]) VALUES (8, 12, N'Vong Ngữ', N'Phàm Nhân Tu Tiên', 9, N'Phàm Nhân Tu Tiên là một câu chuyện Tiên Hiệp kể về Hàn Lập - Một người bình thường nhưng lại gặp vô vàn cơ duyên để bước đi trên con đường tu tiên, không phải anh hùng - cũng chẳng phải tiểu nhân, Hàn Lập từng bước khẳng định mình... Liệu Hàn Lập và người yêu có thể cùng bước trên con đường tu tiên và có một cái kết hoàn mỹ? Những thử thách nào đang chờ đợi bọn họ?

- Truyện kết cấu khá hợp lý, tình tiết không quá chậm, không quá nhanh, diễn tả khá đặc biệt, lời văn trôi chảy, nhân vật tính cách đặc thù. Nhân vật chính, Hàn Lập, mang hơi hướng khá cô độc. Bạn nào thích đọc Tru Tiên hoặc Thương Thiên chắc sẽ thích Phàm Nhân Tu Tiên Truyện. Mời bạn đọc cùng thưởng thức và dõi theo bước chân của Hàn Lập!
', N'./images/pntt.jpg', CAST(N'2024-01-01' AS Date), N'Full')
INSERT [dbo].[Book] ([bookID], [userID], [authorName], [title], [views], [detail], [img], [publishDate], [status]) VALUES (9, 12, N'Tiêu Đỉnh', N'Tru Tiên', 3, N'ru Tiên là tiểu thuyết giả tưởng thần tiên kiếm hiệp do ngòi bút sắc bén mới nổi là Tiêu Đỉnh trứ tác. Từ khi xuất hiện vào năm 2003, Tru Tiên đã gây một làn sóng lớn trong văn học Trung Quốc, cùng với "Phiêu Diểu Chi Lữ", "Tiểu Binh Truyền Kỳ" tề danh "Tam đại kỳ thư Internet", thậm chí được xếp vào hàng những tác phẩm kinh điển, sánh ngang với các tiểu thuyết của Kim Dung, Cổ Long, và Hoàn Châu Lâu Chủ.', N'./images/trutien.jpg', CAST(N'2024-01-01' AS Date), N'Full')
INSERT [dbo].[Book] ([bookID], [userID], [authorName], [title], [views], [detail], [img], [publishDate], [status]) VALUES (10, 11, N'Tran Huy', N'Hanh Tau Am Duong', 4, N'Truyen Hay', N'https://307a0e78.vws.vegacdn.vn/view/v2/image/img.media/hanh-tau-am-duong.jpg', CAST(N'2024-02-13' AS Date), N'Full')
SET IDENTITY_INSERT [dbo].[Book] OFF
GO
INSERT [dbo].[Category] ([CateID], [Name], [describe]) VALUES (0, N'Tiên Hiệp', N'Tiên Hiệp là những tiểu thuyết lấy bối cảnh chính ở thời Trung Quốc cổ đại, nội dung truyện thường miêu tả con đường cầu tiên tu đạo, đấu tranh sinh tồn trong thế giới tu tiên của nhân vật chính.')
INSERT [dbo].[Category] ([CateID], [Name], [describe]) VALUES (1, N'Kiếm Hiệp', N'Kiếm Hiệp là những truyện có bối cảnh cổ trang, nhân vật chính là người trong các môn phái võ lâm, tu luyện võ công tâm pháp. Thông thường kết thúc truyện, võ công của nhân vật chính sẽ đạt đến mức thượng thừa, thống nhất hoặc quy ẩn giang hồ.')
INSERT [dbo].[Category] ([CateID], [Name], [describe]) VALUES (2, N'Xuyên Không', N'Xuyên Không là cụm từ viết tắt của "xuyên qua thời không" hoặc "xuyên việt giá không", là loại truyện mà nhân vật chính đang ở thời hiện đại bỗng gặp phải bất trắc chẳng hạn như bệnh tật, tai nạn... và bị một thế lực bí ẩn nào đó khiến bản thân xuyên qua thế giới khác.')
INSERT [dbo].[Category] ([CateID], [Name], [describe]) VALUES (3, N'Ngôn Tình', N'Ngôn Tình là tiểu thuyết viết về tình yêu giữa các đôi nam nữ, có thể là những câu chuyện tình cảm ngọt ngào lãng mạn, cũng có thể là những mối tình ngược tâm ngược thân lâm li bi đát. Bối cảnh của truyện ngôn tình khá phong phú như: cổ trang, hiện đại, võng phối, mạt thế, xuyên không,...')
INSERT [dbo].[Category] ([CateID], [Name], [describe]) VALUES (4, N'Trọng Sinh', N'Trọng sinh có nghĩa là "sống lại". Những truyện này thường có nhân vật chính do gây ra một lỗi lầm gì đó, hoặc bởi cuộc sống bị hãm hại thê thảm mà chết đi, sau đấy may mắn được sống lại và vẫn giữ được kí ức của mình ở kiếp trước.')
INSERT [dbo].[Category] ([CateID], [Name], [describe]) VALUES (5, N'Dị Giới', N'Dị Giới là những truyện mà nhân vật chính sẽ xuyên không đến một không gian hoặc một thế giới có nền văn minh hoàn toàn khác Trái Đất.')
INSERT [dbo].[Category] ([CateID], [Name], [describe]) VALUES (6, N'Đô Thị', N'Đô thị là những truyện lấy bối cảnh ở thời hiện đại, chủ yếu viết về cuộc sống sinh hoạt thường ngày ở thành phố, nông thôn, miền núi, vùng biển... xung quanh chúng ta.')
INSERT [dbo].[Category] ([CateID], [Name], [describe]) VALUES (7, N'Mạt Thế', N'Lấy bối cảnh diễn ra ở thời đại tận thế. Bởi vì chiến tranh hoặc khoa học kỹ thuật mất kiểm soát, hay vì lý do nào đó ngoài ý muốn mà xảy ra tai nạn (phát tán virus, bùng nổ dịch bệnh...) làm xuất hiện tang thi (zombie) hoặc động vật/thực vật biến dị... tấn công con người.')
INSERT [dbo].[Category] ([CateID], [Name], [describe]) VALUES (8, N'Hệ Thống', N'Nội dung phần lớn tập trung vào việc nhân vật chính bị thế lực thần bí (tác giả) tích hợp một cái hệ thống như trong game vào người. Mỗi khi hoàn thành nhiệm vụ hay giết người/quái....sẽ được tăng năng lực hay mua thần khí... ')
INSERT [dbo].[Category] ([CateID], [Name], [describe]) VALUES (9, N'Linh Dị', N'Nội dung chủ yếu tập trung vào đề tài kinh dị, thần bí, ma quỷ...Nhân vật chính có thể có những khả năng đặc biệt.')
GO
SET IDENTITY_INSERT [dbo].[Category_in_book] ON 

INSERT [dbo].[Category_in_book] ([id], [BookID], [CateID]) VALUES (0, 1, 0)
INSERT [dbo].[Category_in_book] ([id], [BookID], [CateID]) VALUES (1, 1, 1)
INSERT [dbo].[Category_in_book] ([id], [BookID], [CateID]) VALUES (2, 2, 0)
INSERT [dbo].[Category_in_book] ([id], [BookID], [CateID]) VALUES (3, 2, 1)
INSERT [dbo].[Category_in_book] ([id], [BookID], [CateID]) VALUES (4, 3, 0)
INSERT [dbo].[Category_in_book] ([id], [BookID], [CateID]) VALUES (5, 3, 1)
INSERT [dbo].[Category_in_book] ([id], [BookID], [CateID]) VALUES (9, 5, 0)
INSERT [dbo].[Category_in_book] ([id], [BookID], [CateID]) VALUES (10, 5, 1)
INSERT [dbo].[Category_in_book] ([id], [BookID], [CateID]) VALUES (11, 5, 5)
INSERT [dbo].[Category_in_book] ([id], [BookID], [CateID]) VALUES (15, 7, 0)
INSERT [dbo].[Category_in_book] ([id], [BookID], [CateID]) VALUES (16, 7, 4)
INSERT [dbo].[Category_in_book] ([id], [BookID], [CateID]) VALUES (17, 8, 0)
INSERT [dbo].[Category_in_book] ([id], [BookID], [CateID]) VALUES (18, 9, 1)
INSERT [dbo].[Category_in_book] ([id], [BookID], [CateID]) VALUES (32, 4, 0)
INSERT [dbo].[Category_in_book] ([id], [BookID], [CateID]) VALUES (33, 4, 1)
INSERT [dbo].[Category_in_book] ([id], [BookID], [CateID]) VALUES (34, 4, 5)
SET IDENTITY_INSERT [dbo].[Category_in_book] OFF
GO
INSERT [dbo].[Chapter] ([ChapterID], [BookID], [NumberChapter], [ChapterName], [Contents_1], [Contents_2], [status]) VALUES (0, 1, 1, N'Tô Minh', N'Núi! Thanh sơn!

Đây là một dãy núi lớn liên miên không dứt, như một con rồng còn sống kéo dài cả vùng đất mênh mông này, ở đấy có cỏ cây rậm rạp, còn có tiếng chim thú không ngừng vang lên.

Xa xa nhìn lại, có thể thấy trên núi có một phần giống như được năm ngọn núi hợp lại, trông như năm ngón tay người giơ lên trời cao. Trong đó có một ngọn núi trung đoạn(1), một người thiếu niên đang tựa vào một khối đá lớn hơi bị lõm sâu vào để tránh nắng. Bên cạnh hắn có một cái sọt mây, trong đó có dựng một chút dược thảo, mùi thuốc tản phát ra lượn lờ khắp bốn phía.

Thiếu niên này mi thanh mục tú, nhưng thân thể lại hơi ốm yếu, thoạt nhìn có chút suy nhược. Hắn mặc một cái áo được làm bằng da thú, cổ đeo một vòng thú cốt màu trắng hình trăng lưỡi liềm, đầu tóc rối bù được hắn dùng một sợi dây cây buộc lại.

Hắn ngồi ở chỗ đó, tay cầm một quyển sách da do mười tấm da thú dính lại, chăm chú đọc lấy.

- Tổ tông Man tộc, khai thiên tạo người, di lưu muôn đời đến nay...Vài người có sức mạnh lớn lao được gọi là Man Sĩ (2), họ có thể bay lên trời chui xuống đất, dời núi lấp biển...có Man Văn (3) thông thiên, hái được ngôi sao và nhật nguyệt...

Thiếu niên đọc lấy, khẽ thở dài.

- Không có Man thể, làm sao trở thành Man...Man Sĩ...Man Sĩ...Tô Minh, ngươi chỉ có thể hái được chút thảo dược, trở thành một y phu tầm thường mà thôi. Muốn trở thành Man sĩ ư? Thật xa xôi.

Thiếu niên tự chế giễu chính mình, buông cuốn da thú trong tay xuống, nhìn về phương trời xa mà ngơ ngẩn.Hắn đã đọc qua cuốn da thú này rất nhiều lần rồi, nói hắn thuộc nằm lòng cũng không sai chút nào.

- Trời là hình tròn, đất là hình vuông, như vô biên, phảng phất vô tận...

Trong lúc lẩm bẩm, đầu hắn lại ảo tưởng đến thế giới trong cuốn sách. Bất chợt trời đã tối dần mà hắn không hề hay biết, mây đen bắt đầu xuất hiện từ chân trời xa xôi.

Gió núi thổi qua mang theo hơi ẩm rơi xuống lá cây các cây cỏ trên núi, phát ra tiếng vang rắc..rắc..Khi nhìn thấy đám mây đen từ chân trời kéo đến đó, bỗng nhiên tinh thần Tô Minh rung lên.

- A Công suy tính quả nhiên chính xác, quả thật hôm nay có Ô Long Tiên!

Hai mắt Tô Minh phát sáng, hắn nhanh chóng đứng lên, lấy cuốn da thú nhét vào trong ngực, tay trái nhấc cái sọt mây vác lên lưng, thân thể thoáng một cái đã nắm lấy sợi dây leo bên cạnh một cách linh xảo, bắt đầu trèo lên đỉnh núi.

Tuy thân thể người thiếu niên này suy nhược, nhưng lại có lực lượng vô cùng bền bỉ, trông như một con khỉ vậy. Mới chỉ nhảy lên mấy cái, hắn đã trèo lên được hơn mười trượng.

Mây đen từ phương xa cuồn cuộn kéo đến, bên trong còn có tiếng sấm nổ vang lên, phảng phất như trời đất đang giận dữ với dãy núi này. Đám mây đen đó kéo dài khắp trời đất, càng ngày càng đến gần.

Tô Minh vội vã leo nhanh hơn, hầu như ngay khi đám mây đen vừa kéo đến, hắn đã trèo đến một vị trí còn cách đỉnh núi khoảng mười trượng nữa.

Ở ngay nơi đó có một khối đá kỳ lạ nhô ra, dường như được thiên nhiên tạo thành, ngay trên bề mặt khối đá đó có rất nhiều lỗ thủng lớn khoảng một nắm đấm. Khối đá kỳ lạ này được đặt ở ngay vị trí đó, nếu kết hợp với cả ngọn núi thì trông nó giống như đầu một con rắn khổng lồ vậy.

Dưới khối đá kỳ lạ này có một mảnh đá nhô ra trông như một cái răng nanh, làm người nhìn thấy phải kinh hãi, cảm thấy có chút kỳ dị. Mà bởi vì khối đá này nhô ra khỏi ngọn núi như thế, nên rất khó leo qua để đi lên đỉnh núi, trừ khi ngươi có thể phi hành trong không trung.

Tay trái Tô Minh nắm lấy dây leo, tay phải đưa vào trong cái sọt mây vác ở sau lưng lấy ra một cái bình nhỏ. Hắn đưa cái bình lên rồi dùng miệng cắn chặt giữ lấy, sau đó từ từ nhích người hướng về một phương hướng ngược chiều với khối đá kỳ lạ đó. Khi đã di chuyển được mấy trượng, cánh tay trái của hắn đã phải cố hết sức kéo nghiêng sợi dây leo qua một bên, năm ngón tay phải cũng mở rộng ra để đầu các ngón tay chạm bám vào vách núi, thân thể dán chặt vào. Hắn ngẩng đầu nhìn lên đám mây đen trên bầu trời, ánh mắt lấp lánh, không nhúc nhích.

Một lát sau, mây đen đã kéo tới trên đỉnh, tiếng sấm ầm ầm vang lên làm đinh tai nhức óc, một cỗ cuồng phong cuồn cuộn kéo tới khiến ngọn núi phải lung lay, phảng phất như ngọn núi này đột ngột từ dưới mặt đất mọc lên vậy. Dưới cơn cuồng phong này, năm ngón tay phải bám vào vách núi của Cơ Minh đã trắng bệch, nhưng hắn vẫn không động đậy, mắt nhìn về bầu trời, kiên nhẫn bền bỉ chờ đợi.

Cỗ cuồng phong càng lúc càng lớn, lay động cỏ cây ở vùng núi này, làm cho mấy con thú lớn phải rống gào liên tục. Gió mạnh đến nỗi thổi tung vô số lá vụn cành khô ở mặt đất lên, làm cho cả không trung tràn ngập trong cảnh lá cây bay lượn khắp trời.

Thậm chí còn có những cây khô hơi lớn một chút và các thú con cũng bị cuốn lên, xoay quanh một hồi rồi bị ném ra xa, tiếng kêu thê lương thảm thiết do chúng phát ra còn chưa kịp truyền đi thì đã bị gió mạnh cuốn lấy.

Dưới sức gió mạnh như vậy, Tô Minh không thể kiên trì lâu hơn được nữa. Cả bầu trời đã bị mây đen che đậy hoàn toàn, sấm sét nổi lên, những giọt mưa to như hạt đậu rơi xuống tầm rã. Chỉ trong nháy mắt, dường như cả thế giới đã bị nước bao phủ.

Nước mưa ào ào không ngừng rơi xuống, càng lúc càng lớn, nhưng Tô Minh vẫn kiên trì nắm lấy sợi dây leo đã bị nước mưa thấm ướt, thân thể dán chặt vào vách núi, để mặc nước mưa xối mạnh vào thân. Hắn vẫn không nhúc nhích, mắt nhìn chằm chằm vào bộ phận như cái răng nanh của khối đá kỳ lạ có hình dạng đầu rắn kia.

Cũng không biết đã qua bao nhiêu lâu, nước mưa càng lúc càng mạnh, trời đất bị bao phủ bởi những bụi mưa lất phất. Được nước mưa trùng tẩy, cái răng nanh bằng đá được Tô Minh nhìn nãy giờ kia bắt đầu tiết ra một chất lỏng màu đen.

Chất lỏng màu đen đó hòa với nước mưa, tạo thành một làn nước chảy xuôi xuống phía dưới.

Nhìn thấy cảnh này, hai mắt Tô Minh hiện ra thần thái vui mừng, nhưng hắn vẫn không di chuyển. Cho đến khi chất lỏng màu đen kia ít dần đi rồi hóa thành màu vàng thì hai mắt Tô Minh bỗng nhiên mở to ra, không chần chờ thêm nữa, tay phải đang ôm lấy vách đá lập tức buông ra, rồi lập tức cầm cái bình nhỏ đang được miệng cắn lấy.

Vốn tay trái đang cố níu cái dây leo đã nghiêng qua một bên, nhưng ngay lúc tay phải buông ra, cả người hắn liền hơi đung đưa một chút, rồi theo sợi dây leo đó phóng thẳng tới cái răng nanh bằng đá nhô ra kia.

Bởi vì trước đó hắn đã kéo sợi dây leo theo một độ cong rất lớn, mà hắn lại canh vị trí rất chính xác. Nên ngay khi tiếng sấm vang lên, hầu như Tô Minh đã theo sợi dây leo bám vào ngay bên dưới cái răng nanh bằng đá. Tay trái nắm lấy dây leo, tay phải cầm lấy cái bình bằng đá rồi đặt ngay dưới răng nanh bằng đá. Chỉ qua một lúc sau, chất lỏng màu vàng đã rót vào được nửa bình.

Nhưng ngay lúc này lại có những tiếng kêu bén nhọn bỗng nhiên vang lên, bốn năm con rết màu đen dài nửa trượng, lớn bằng một cánh tay từ bên trong những cái động to như quả đấm trên khối đá kỳ lạ chui ra. Bọn chúng hung hăng chạy tới tấn công Tô Minh đang treo lơ lửng giữa không trung.Tô Minh không có chút do dự nào, ngay khi mấy con rết to lớn đó vừa xuất hiện, hắn lập tức buông lỏng cánh tay trái đang nắm sợi dây leo ra, thân thể rớt xuống dưới với tốc độ cực nhanh, tránh được bọn rết kia tấn công.

- Tiểu Hồng!

Vào lúc thân thể Tô Minh cấp tốc rơi xuống giữa không trung thì cơn cuồng phong kia như những con dao găm phóng tới, làm cho thân thể hắn trở nên cứng ngắc. Mặc dù tránh được mấy con rết kia, nhưng với tốc độ rơi xuống nhanh như hiện nay, một khi chạm đất là hắn sẽ bị biến thành thịt nhão ngay.

Nhưng hắn lại không kinh hoảng, vì ngay khi ấy có một bóng ảnh màu hồng nắm lấy sợi dây leo từ trên vách núi bên cạnh xông ra, nhắm ngay hướng thân thể Tô Minh rơi xuống. Ngay khi tới gần, thân ảnh này dùng một tay ôm lấy Tô Minh. Đây là một con khỉ màu đỏ, lúc này nó đang nhe răng nhếch miệng cười cười, đôi mắt vô cùng linh động.

Một người một khỉ theo sợi dây leo đó rơi xuống một khối đá dựng đứng trên núi, chính là khối đá Tô Minh ngồi khi nãy. Lúc này Tô Minh hơi khẩn trương, lập tức cất cái bình đá vẫn cầm nãy giờ đi.

- Tiểu Hồng, chúng ta phải đi nhanh, lần này ta lấy được nhiều Ô Long Tiên lắm! Ủa, ngươi cầm cái gì đó?

Tô Minh nói, bỗng nhiên thấy được trong tay con khỉ nhỏ có một mảnh đá màu đen nhánh.

Con khỉ nhỏ này lập tức cảnh giác, móng vuốt hơi đưa ra một chút, liên tục gào thét mấy tiếng. Tô Minh thấy thời gian cấp bách nên không nói thêm gì, lập tức đi về phía trước vài bước. Hắn nắm lấy sợi dây leo rồi cùng với con khỉ nhỏ đó phóng xuống dưới.

Ngay lúc đó có mấy tiếng kêu dữ tợn từ sau lưng họ truyền lại, mấy con rết màu den đang theo vách núi đuổi theo, nhiều như những dòng nước màu đen chảy xuống, không ngừng truy đuổi hai người.

Con khỉ nhỏ màu đỏ đó liên tục nhe răng, không ngừng mở miệng kêu lên với Tô Minh ở bên cạnh. Thỉnh thoảng nó còn quay đầu lại nhìn mấy con rết ở phía sau, mắt lộ vẻ sợ hãi và tức giận.', N'- Đây không phải là lần đầu chạy trốn như vậy, mấy con rết đó không dám xuống núi. Ngươi đừng có giả bộ nữa, cứ theo luật cũ, lát nữa sẽ cho ngươi một phần Ô Long Tiên này.

Trong lúc cấp tốc bỏ chạy, Tô Minh nói ra mấy câu. Quả nhiên, lời này vừa nói xong thì mặt mày con khỉ nhỏ kia liền hớn hở, hiển nhiên thái độ ban nãy chỉ là giả bộ.

Một người một khỉ này rất thông thạo địa hình núi non ở đây, hơn nữa, không biết tại sao mấy con rết kia lại không dám trực tiếp xông qua chỗ này, mà phải vòng qua mà đi. Cứ như vậy, tuy tốc độ bỏ chạy của Tô Minh và con khỉ nhỏ không nhanh bằng mấy con rết, nhưng bọn hắn lại thỉnh thoảng trực tiếp nhảy xuống dưới, rồi dùng tay nắm lấy mấy sợi dây leo để trườn xuống. Làm vậy được mấy lần, cả người lẫn khỉ đã xuống núi, chui vào trong rừng, không còn thấy bóng dáng nữa.

Quả nhiên mấy con rết đó không dám xuống núi, gào thét một hồi rồi mới không cam lòng bò lên đỉnh núi lại.

Mây đen đến nhanh mà đi cũng vội vã. Qua mấy canh giờ, dãy núi này đã trở lại bình thường, mây đen cuồn cuộn đã đi xa.

Qua một lúc sau, Tô Minh và con khỉ nhỏ đã ra khỏi rừng rậm. Lúc này trời bắt đầu tối dần, có thể thấy ở phía chân trời xa có ánh lửa yếu ớt bùng lên, đó chính là chỗ ở bộ lạc của Tô Minh.

- Ngươi đã uống hết một nửa rồi mà còn muốn uống nữa ư?

Sau khi đi ra khỏi rừng rậm, toàn thân Tô Minh ướt nhẹp, chậm rãi bước đi. Nhưng hắn lại hơi liếc mắt nhìn con khỉ nhỏ đang đi ở phía sau, con khỉ này dùng ánh mắt mong chờ nhìn lại hắn, ánh mắt Tô Minh lúc nhìn có phần muốn chọc tức nó.

Con khỉ nhỏ này rất khôn, Tô Minh vô tình phát hiện được nó khi đi vào rừng ba năm trước. Lúc đầu giữa hai bên còn có chút mâu thuẫn, nhưng cuối cùng lại trở thành bạn tốt.

Con khỉ nhỏ trừng mắt nhìn hắn, gãi gãi mặt, hơi do dự một chút rồi cầm lấy mảnh đá đen nhánh trong tay đưa cho Tô Minh. Nó liên tục gào thét, ý nói muốn dùng mảnh đá này để đổi lấy Ô Long Tiên!

- Được rồi, cho ngươi thêm một chút. Nhưng mà ta không cần mảnh đá này, ngươi giữ đi!

Tô Minh cười cười, lấy cái bình đá nhỏ trong sọt mây ra, đưa cho con khỉ nhỏ.

Con khỉ nhỏ này vội vàng cầm lấy, uống một hớp, trên mặt lộ ra vẻ say mê. Sau khi lắc lư một hồi, nó nấc rượu một cái rồi ném cái bình đá cùng với mảnh đá đen kia cho Tô Minh. Thân thể nhảy lên mấy lần thì đã biến mất trong rừng.

Tô Minh nhìn thấy nước trong bình nhỏ chỉ còn một nửa thì khẽ mỉm cười, không để ý đến nữa. Lúc trở về, hắn lấy mảnh đá đen nhánh mà con khỉ ném cho hắn ra, bắt đầu quan sát.', NULL)
INSERT [dbo].[Chapter] ([ChapterID], [BookID], [NumberChapter], [ChapterName], [Contents_1], [Contents_2], [status]) VALUES (1, 1, 2, N'Man Khải', N'Đây là một mảnh đá bình thường, có kích thước như lòng bàn tay con nít, không thể nhận ra được nó có hình dạng nào. Ngoại trừ trên bề mặt có vài hoa văn do thiên nhiên tạo thành ra, nó chỉ có thêm vài cái lỗ nhỏ sáng sáng, giống như một đồ trang sức.

Ngoài những điều trên, nó không còn điểm gì đặc biệt nữa, rất là bình thường.

Điều kỳ lạ duy nhất là khi Tô Minh cầm lấy mảnh đá này, hắn cảm thấy ấm áp, giống như có một dòng khí ấm áp chảy vào cơ thể, làm cho cả người rất thoải mái.

- Ủa?

Tô Minh nhìn kỹ lại, nhưng qua một lúc sau hắn vẫn không cảm nhận được gì.

- Hồi trước có nghe A Công nói rằng vùng đất này trước đây là đất Hỏa Man, nếu vậy, nói không chừng trong mảnh đá này có chút Hỏa Man lực, cho nên mới làm tay ta ấm áp như thế, chắc không sai đâu.

Tô Minh tháo cái vòng cốt thú hình lưỡi liềm trên cổ ra, sau khi gắn mảnh đá nhỏ này vào trong đó thì hắn lại đeo vòng cốt thú vào cổ lại. Lúc đeo vào, vị trí mảnh đá nhỏ đó nằm ở ngay ngực hắn, cảm giác ấp áp càng rõ hơn.- Về nhà!

Tô Minh sải bước đi về khu vực có ánh lửa chớp lên kia, nhanh chóng chạy tới. Lúc này hắn không chú ý tới một việc, mảnh đá nhỏ ở ngay ngực hắn bỗng nhiên tản phát ánh sáng yếu ớt một chút, rồi đạo ánh sáng đó biến mất đi chỉ trong chớp mắt.

Càng đi tới gần, ánh lửa trong mắt Tô Minh càng rõ ràng hơn, có thể thấy ở đó là một bộ lạc, xung quanh có một hàng rào được tạo thành bởi những cái cây to lớn.

Kích thước bộ lạc này không lớn, khoảng chừng có trăm người ở đây, nhưng trong mắt Tô Minh, đây lại là nơi làm hắn cảm thấy ấp ám.

Hình như bên trong có những tiếng hoan hô náo nhiệt truyền ra, hắn nhìn qua những cái khe trên hàng rào do cây to tạo thành, có thể thấy được ở ngay giữa bộ lạc có một đống lửa khổng lồ, rất nhiều tộc nhân đang ở chung quanh. Một vài thiếu nữ trong tộc đang nhảy múa xung quanh đống lửa.Cổng vào bộ lạc cũng được làm bằng mấy cây to, lúc bình thường thì cổng luôn được treo lên cao bởi những gốc rễ dây leo to lớn, nhưng hôm nay lại đóng chặt xuống. Trên cổng có mấy đại hán rất khôi ngô, làn da họ thô ráp, trên cổ có đeo nhiều chuỗi bạch cốt, ở lỗ tai còn có mấy cái vòng bằng xương thú, thân hình vạm vỡ, ánh mắt luôn nhìn chung quanh.

Khi nhìn thấy Tô Minh từ xa chạy tới, mấy đại hán này nhếch miệng cười một cái:

- Lạp Tô, A Công tìm ngươi cả ngày rồi, sao giờ mới trở về?

- Khi nãy có trời mưa, có phải lại đi lấy Ô Long Tiên không?

- A Công tìm ta hả? Mau ném dây leo xuống, lần này thu hoạch không tệ lắm.Tô Minh chạy nhanh tới trước, khi đi tới trước cổng thì hắn đắc ý vỗ vỗ vào cái sọt mây sau lưng, lớn tiếng hô lên.

Một sợi dây leo được bện chặt lại thả xuống, Tô Minh dùng tay bắt lấy rồi linh hoạt leo lên. Chỉ qua một lúc, hắn đã leo lên tới đỉnh cánh cổng. Sau khi cười nói với mấy đại hán gác đêm này, hắn liền theo cái thang bên cạnh đi xuống dưới.

- Thân thể tiểu tử này nhanh nhẹn, lá gan lại không nhỏ. Nhiều năm trước đã dám một mình đi lên núi lấy Ô Long Tiên, ta nghĩ phàm y (1) sau này trong bộ lạc nhất định là hắn.

- Đáng tiếc là hắn không có Man thể...nếu không, có khi hắn lại trở thành Man Y (2) giống như A Công.

Mấy người đại hắn nhìn Tô Minh đi xa, khẽ than nhẹ.

Sau khi vào trong bộ lạc, Tô Minh liền chạy thắng tới trước. Khi đi qua mấy nhà ở được làm bằng cây cỏ xung quanh, những người thấy hắn đều hô to vui vẻ nói một tiếng "Lạp Tô".

Thật ra cái tên "Lạp Tô" này không chỉ gọi riêng hắn, mà đây là cách gọi để chỉ những hài đồng sắp tiến hành Man Khải lần thứ hai trong bộ lạc. Nguồn truyện: Truyện FULL

Tô Minh chạy rất nhanh, không lâu sau đã đến được trung tâm bộ lạc. Ở đây có rất nhiều tộc nhân đang vờn quanh đống lửa, ca hát nhảy múa.Bên ngoài đống lửa có để mấy cái bệ nướng thịt bằng gỗ mộc lan, phía trên có rất nhiều khối thịt lớn đang được nướng, tản phát mùi thịt nướng thơm phức.

Khi nhìn thấy Tô Minh chạy tới, mấy thiếu nữ trong bộ lạc chỉ nhìn lướt qua, không để ý là mấy.

Trong bộ lạc này, có thể nói vóc dáng mi thanh mục tú của Tô Minh rất khác với những tộc nhân khác, hầu như ai cũng khôi ngô hơn hắn cả.', N'Vất cả lắm hắn mới chen được vào bên trong, tiện tay cầm lấy một miếng thịt nướng thơm phức rồi cắn một phát, sau đó lại chạy nhanh tới phía trước.

Trong đám người này, có một người duy nhất không mặc da thú, mà lại mặc một bộ y phục thô kệch sẫm màu, đây là một lão giả. Đầu tóc lão giả này được bện lại thành rất nhiều bím tóc nhỏ, thoạt nhìn rất già nua, nhưng đôi mắt lại rất có thần. Lúc nhìn thẳng vào bên trong, người khác có cảm giác cả người mình hình như bị thu vào trong đó vậy.

Thân phận của lão vô cùng tôn quý, mỗi lúc thấp giọng nói gì đó là mấy người tộc nhân bên cạnh lại vừa nghe vừa gật đầu, thần thái rất tôn kính.

Thấy Tô Minh từ xa chạy tới, lão giả này mỉm cười một chút, gật đầu, ý bảo Tô Minh ngồi xuống một bên. Sau đó, lão lại tiếp tục nói chuyện với các tộc nhân.

Mấy người khác nhìn thấy Tộc Minh, khuôn mặt cũng vui mừng cười cười.

- Tuy bộ lạc Ô Sơn ta chỉ là một bộ lạc nhỏ, nhưng dù sao cũng là truyền thừa chính thống của Ô Sơn. Lần này là đại thọ Man Công của bộ lạc Phong Quyến, mà ta lại người đó năm xưa có giao tình với nhau, không thể thất lễ được.

Lão giả kia chậm rãi mở miệng.

- Đáng tiếc là bộ lạc Ô Sơn chúng ta mấy trăm năm trước lại phân chia tách ra, hôm nay chỉ còn là một bộ lạc nhỏ. Nếu không, bộ lạc Ô Sơn chúng ta cũng là bộ lạc bậc trung rồi, lúc đó sẽ thống lĩnh bát phương gần kề, bộ lạc Phong Quyến kia cũng phải phụ thuộc vào. Nhưng bây giờ....ài...

Người nói chuyện là một nam tử khoảng bốn mươi tuổi, hắn là tộc trưởng bộ lạc Ô Sơn. Thân thể người này khôi ngô, tản phát ra sức mạnh kinh người, có thể nhìn thấy trên vòng cốt thú tại cổ hắn có chín hàm răng to bằng ngón tay.

Nhất là trên mặt hắn lại có một hoa văn như ẩn như hiện, hình dáng hoa văn này rất dữ tợn, trông như quỷ thần vậy. Nhưng mà đường nét lại rất mơ hồ, không thể nào đọng lại hoàn toàn được.

Tô Minh nhìn những hoa văn trên mặt người đó mà hâm mộ. Nhờ đọc cuốn da thú kia, Tô Minh biết đó là Man Văn chưa thành hình, mà trong bộ lạc hắn hiện giờ vẫn không có ai đủ khả năng để Man Văn đọng lại được cả.

Ngay cả A Công cũng mới chỉ ngưng tụ Man Huyết đến tầng thứ chín mà thôi.

Nhưng chỉ như vậy đã đủ để A Công trở thành một người cực mạnh trong các bộ lạc gần Ô Sơn. Nếu tính ra thì chỉ có hai bộ lạc đồng tộc nhưng đã bị phân chia ra là có người có thể so sánh với hắn, đó là bộ lạc Hắc Sơn và bộ lạc Ô Long.

- Chuyện đã qua thì nhắc lại làm gì? Không có cường giả Khai Trần cảnh thủ hộ thì không thể nào trở thành bộ lạc bậc trung. Năm xưa cũng vậy, hai vị tổ tiên Khai Trần cảnh chết đi mới là nguyên nhân làm cho bộ lạc bị phân chia. Lão phu tu hành nhiều năm như vậy nhưng vẫn không thể nào đột phá được tầng thứ chín Man Huyết này để đạt đến tầng thứ mười, càng không thể đạt tới tầng mười một cực hạn, không thể nào cô đọng Man Văn hoàn toàn được, khó đạt tới Khai Trần...

Lão giả mặc y phục thô ráp sẫm màu than nhẹ, chậm rãi nói.

- Thôi, các ngươi về đi, chuẩn bị lễ vật ngày mai còn đi...Sơn Ngân, ngươi là đội trưởng đội săn Ô Sơn, mai ngươi sẽ dẫn đầu đi tới đó.

Lão giả đứng lên, rồi phân phó việc cho một hán tử trung niên đứng bên cạnh tộc trưởng bộ lạc Ô Sơn. Sau đó xoay người rời đi về phía xa.

Hán tử trung niên kia bình tĩnh, nghe nói vậy, lập tức khom người nhận lệnh.

Tô Minh vội vàng theo sau A Công, cùng nhau rời khỏi chỗ nhộn nhịp này.


Trên đường đi lão giả không nói gì cả, chỉ yên lặng đi tới. Cho tới khi tiếng ca hát náo nhiệt đằng xa nhỏ dần đi, hắn mới bước vào trong một căn phòng được làm bằng cỏ cây gần đó.

Căn phòng này không lớn lắm, bày biện cũng rất đơn giản. Sau khi vào phòng, lão giả này khoanh chân ngồi xuống, nhìn Tô Minh vừa tiến vào một lúc.

- Lấy được Ô Long Tiên chứ?

Lúc ngồi cùng một chỗ với lão giả, Tô Minh tỏ ra rất tôn kính với A Công đã nhìn mình lớn lên từ nhỏ này. Hắn để sọt mây sau lưng xuống, rồi cầm lấy cái bình đá nhỏ đưa cho lão giả.

- Ngươi là người nhanh nhẹn, mấy con rết màu đen kia không thể nào đả thương ngươi được, nhưng đi ít thì vẫn tốt hơn...Dù sao đó cũng là lãnh thổ của bộ lạc Hắc Sơn và bộ lạc Ô Long...Ô Long Tiên không có tác dụng với ta, ngươi giữ lại để tẩm bổ thân thể đi.

Tô Minh gật đầu, thu bình đá nhỏ lại. Những năm gần đây hắn đã uống rất nhiều Ô Long Tiên, cũng nhờ thế mà thân thể hắn mới nhanh nhẹn như hôm nay.

Thật ra cũng nhờ A Công thường xuyên nấu cho hắn một vài loại nước thuốc, qua nhiều năm uống vào, mặc dù hắn không có Man thể nhưng lại mạnh hơn không ít tộc nhân tầm thường.

- Ba ngày nữa chính là ngày mấy tên Lạp Tô trong tộc các ngươi tiến hành Man Khải, ta nhớ ngươi cũng mười sáu tuổi rồi...cần đi tham bái Man Tượng.

Lão giả nhìn Tô Minh, chậm rãi nói.

- Man Tượng bộ lạc Ô Sơn ta năm đó được truyền thừa chân chính của bộ lạc Ô Sơn, mặc dù không phải là chủ tượng, càng không thể so sánh với Man Tượng mấy bộ lạc bậc trung, nhưng trong các bộ lạc gần đây thì vẫn rất mạnh mẽ.Tô Minh trầm mặc trong chốc lát, rồi gật đầu.

- Mấy ngày nữa không nên ra ngoài, nghỉ ngơi cho tốt đi. Ba ngày sau, cùng bọn họ đi Man Khải.

Lão giả nói xong câu này liền nhắm hai mắt lại.

Tô Minh đứng đó một hồi lâu rồi yên lặng cầm sọt mây ra ngoài. Căn phòng của hắn cách nơi này không xa lắm.

Hắn vĩnh viễn không thể nào quên được việc đã xảy ra vào năm bảy tuổi. Khi đó hắn cũng giống như những hài đồng năm tuổi khác trong bộ lạc, đi tới tham bái Man Tượng để tiến hành Man Khải lần đầu tiên.

Thân là người Man tộc, cả đời cần tiến hành một loại nghi thức quen thuộc hai lần. Đây chính là Man Khải, một lần bảy tuổi và một lần mười sáu tuổi.

Đồng thời, A Công trong bộ lạc vào lúc này sẽ mượn lực lượng Man Tượng để lựa chọn những người có Man thể.

Than nhẹ một tiếng, nội tâm Tô Minh rất khổ sở, hắn rất khát vọng muốn tu được thành Man Sĩ. Những điều ghi chép về Man Sĩ trong cuốn da thú kia đã làm si mê Tô Minh từ nhỏ, nhưng thực tế lại vô cùng tàn khốc. Vào lần đầu tiên hắn tham bái Man Tượng lúc bảy tuổi ấy, hắn đã phải chấp nhận sự thật là hắn không có Man thể, không có tư cách để tu Man.

Man, chính là gốc rễ của thế giới. Chỉ khi trở thành Man Sĩ thì mới có thể tiếu ngạo trên chín tầng trời, mới có thể trở thành cường giả chân chính.

Qua cuốn da thú kia, từ nhỏ Tô Minh đã biết trên thế giới này có rất nhiều bộ lạc. Dù là lớn hay nhỏ, từng bộ lạc đều có Man Tượng riêng của mình. Đây là ngọn nguồn căn bản của một bộ lạc, cũng là vật cần phải có để đời sau có thể tu Man.

Vào lúc tham bái Man Tượng, nếu như có thể cảm ứng thì ngươi sẽ được truyền thừa cách tu Man một cách tự nhiên, không cần người chỉ dạy nhưng vẫn tự tu luyện được.

Chỉ khi nào ngươi thất bại cả lúc bảy tuổi và mười bảy tuổi thì mới chứng tỏ ngươi vĩnh viễn không tu Man được. Nội tâm Tô Minh từ trước tới nay vẫn luôn mong chờ, hắn vẫn luôn chờ đợi trước khi hi vọng mất hết hoàn toàn. Nhưng khi chỉ còn ba ngày nữa là sẽ đến lần tìm hiểu cuối cùng, hắn lại sợ.

- Lần này...có thể thành sao...

Tô Minh yên lặng trở lại căn phòng của mình, ngồi xuống một bên mà thẫn thờ.', NULL)
INSERT [dbo].[Chapter] ([ChapterID], [BookID], [NumberChapter], [ChapterName], [Contents_1], [Contents_2], [status]) VALUES (2, 1, 3, N'U thứ', N'Đêm đã khuya, Tô Minh nằm trong ốc xá của mình, nhìn bốn phía màn đêm. Đêm khuya lắm rồi nhưng hắn không sao ngủ được. Lời nói của a công cứ mãi văng vẳng bên tai, làm trong đầu hắn không thể không hiện ra cảnh tượng của chín năm về trước.

Thở dài một tiếng, Tô Minh ngồi dậy, trầm mặc đẩy cánh cửa gỗ ra. Một làn gió mát mẻ thổi lên mái tóc bù xù của hắn, gió kia lạnh thật, cứ như là theo ánh trăng đến, thổi tràn cả vùng đất.

Bốn phía đều an tĩnh, chỉ có trên núi xa xa vẳng lại một hai tiếng tê minh yếu ớt. Trong bộ lạc phần lớn tối đen, chỉ có một đống lửa tàn còn một vài đốm lửa, bốn phía là tường làm bằng các cây gỗ lớn, có một vài cây đuốc. Trong đêm khuya tại đây, chỉ có vài tiếng lửa đuốc kêu mơ hồ.

Tô Minh ngẩng đầu nhìn bầu trời, trên không có trăng và các ngôi sao, hết sức rực rõ, dải ngân hà tựa như vĩnh hằng. Trong mắt Tô Minh từ từ lộ ra vẻ mê man.

" Mọi người trong tộc đối xử với ta rất tốt... Nhưng bộ dạng của ta lại không giống bọn họ... Có lẽ điều này có liên quan tới việc tham bái Man tượng chăng...

Không có Man thể, không cách nào tu Man, chỉ có thể cả đời lưu lại nơi này, không cách nào đi ra ngoài, không thể nhìn thấy thế giới như sách da thú miêu tả..." Tô Minh yên lặng ngồi xuống, dựa vào ốc xá, mắt nhìn bầu trời, vẻ mê man trong mắt càng đậm.

" Man tộc có tổ, khai thiên tạo nhân, lưu truyền muôn đời... cầm Man giả, phi thiên nhập địa, di sơn đảo hải... có Man Văn thông thiên, có thể hái Nhật Nguyệt tinh thần..." Trong đêm khuya, ở bộ lạc Ô sơn, một thiếu niên nhìn bầu trời, lầm bẩm...

Giờ phút này hắn, không chú ý tới, mảnh nhỏ màu đen đang đeo trên cổ, thêm một lần nữa có quang mang chợt lóe rồi biến mất...

Thời gian thoáng qua, nhanh chóng tới ngày thứ ba

Vào ngày Lạp Tô Man Khải của Ô sơn bộ lạc, vào lúc sáng sớm bắt đầu một ngày mới, cả bộ lạc sôi sùng sục, hầu như tất cả tộc nhân đều toàn bộ đi ra, mang theo lạp tô của nhà mình, tập trung ở quảng trường của bộ lạc.

Nghi thức Man Khải thường phải mất cả ngày, đặc biệt, các Man Khải mười sáu tuổi phải mang lạp tô thực hiện lễ thành niên, thậm chí vào lúc này hôm nay, hoàn thành lạp tô Man Khải xong còn có thể tuyển chọn bạn lữ.

Túi xách đeo chéo 2 ngăn cực xinh, giá sốc không thể tin cho dịp cuối năm!


Top sản phẩm Shopee bán chạy: Nồi chiên không dầu siêu đỉnh, mẫu mã đẹp - Giảm đến 40%


Khung trang trí phòng ngủ, phòng tắm cực xinh yêu, style Hàn Quốc - Giá chỉ từ 9K!


Giấy thấm dầu RẺ NHẤT SHOPEE - Vật bất ly thân cho các cô nàng trong mùa hè để có 1 làn da không bóng nhờn!


Từng tràng từng tràng tiếng trống mang theo tiết tấu kỳ dị từ trong bộ lạc vọng lại, tiếng trống suất hiện, mọi người lạp tô từ trong đám đông đi ra, đứng ở vị trí trung tâm.

Lần này hoàn thành Man Khải lạp tô có chừng hơn ba mươi người, trong đó phần lớn đều là thiếu niên, bọn họ mặc dù tuổi không lớn lắm nhưng thân thể cực kỳ thô tráng, lộ ra vẻ vạm vỡ.

Cho dù là những thiếu nữ, cũng là như thế. Cứ như vậy, Tô Minh trong đám người lộ ra vẻ rất khôi ngô. Hắn mi thanh tú mục, không giống mọi người chút nào.

Tuy nói là thế, nhưng mọi người nơi này đã sớm quen với sự tồn tại của Tô Minh, mạc dù bộ dáng của hắn trông có chút bất đồng, nhưng mọi người đều không bài dích mà là hòa nhập hắn vào, hắn trở thành một thành viên trong bộ lạc.Sau khi đem những thứ chuẩn bị cho lạp tô Man Khải đật chung quanh, tất cả tộc nhân bộ lạc Ô sơn đầu nhảy múa một điệu múa nguyên thủy, điệu múa tế thiên, dùng thân thể để diễn tả sự kính sợ đối với thiên địa và tế tự.

" Tô Minh, nghe mọi người trong tộc nói, mấy ngày hôm trước ngươi đi Ô long sơn, đã lấy nước Ô long quay về" Bên ngoài tộc nhân hoan hô ca múa, Tô Lạp ở bên cạnh truyền đến một thanh âm chất phác mộc mạc.

Đó cũng là một người cũng trong độ thiếu niên, da thô ráp, thân thể có chút cường tráng, lớn hơn Tô Minh một cái đầu, hai mắt sáng ngời, đang vừa nhìn Tô Minh vừa cười ngây ngô.

Nói chuyện với thiếu niên, Tô Minh lộ ra nụ cười. Thiếu niên này gọi là lôi thần, hắn có ít bạn tốt trong bộ tộc.

" Đã lấy được một ít, hôm qua ta đi tìm ngươi. Bố ngươi nói ngươi cùng đội săn lên núi. Chờ lúc Man Khải kết thúc, ta đi lấy chia cho ngươi "

Thiếu niên được gọi là Lôi thần hai mắt sáng ngời, vội vàng tiến lên mấy bước, cười ngây ngô.

" Vốn là có thể về nhà sớm, nhưng trên đường gặp phải một con điêu lộc. Lần trước ngươi nói cần máu điêu lộc làm thuốc, ta liền bám theo nó đến tận đêm hôm qua mới trở về."

Tô Minh biết, đối phương nói hời hợt, nhưng trên thực tế giết con điêu lộc kia cực kỳ khó khăn, hơn nữa còn có chút nguy hiểm. Lúc này nội tâm hắn ấm áp.

Hai người đang nói, tiếng hoan ca bốn phía dần dần lắng xuống, đám người tản ra, chỉ thấy a công bộ lạc Ô sơn, mặc thô ma y sam, trong tay cầm một cây cốt trượng toàn thân đen nhánh, lão đi tới trước mặt thiếu niên này, các tộc nhân khác làm thành một vòng vây xung quanh.

Khi a công xuất hiện, bốn phía lập tức hoàn toàn an tĩnh. Trong mắt những thiếu niên này lộ ra vẻ kính sợ, hiển nhiên đối với a công này rất là sợ.

"Tế tự Man tổ!" A công ánh mắt lấp lánh, quét qua mọi người, đến trên người Tô Minh có hơi dừng lại. Vừa nói, tay phải lão giơ cốt trượng kia lên, lập tức từ trong trong đám người, hơn mười người đại hán vội vã đi tới, trên tay bê một con dã thú bị trói.

Con dã thú này còn sống, giờ phút này phát ra tiếng gào thét thê lương, không ngừng giãy dụa, nhưng lại không có tác dụng gì.

Tổng cộng có bốn mươi chín con dã thú khác nhau, không lâu sau bị mang tới toàn bộ, xung quanh là những thiếu niên. Từng cơn gào thét nối tiếp nhau thanh âm quanh quẩn, ngưng tụ chung một chỗ, mơ hồ có một cổ xuyên thấu trùng kích linh hồn. Những tộc nhân Ô sơn bộ lạc ở xung quanh, gắt gao đè dã thú lại, không để cho bọn nó trốn mất.

Những đại hán đứng bên cạnh dã thú, không chút nào chần chờ, toàn bộ đồng thời cúi đầu, tay trái cầm một thanh thạch nhận sắc bén, đâm thẳng vào cổ dã thú, rồi cắt lấy cái đầu.

Tiếng gào thét càng lúc càng to, đến lúc chém rụng đầu thì đạt đến cực hạn. Trong chớp mắt ấy những con dã thú gào lên kinh thiên động địa. Hơn ba mươi cái lạp tô chuẩn bị sẵn cho lễ Man Khải được lấy ra, người người lộ ra vẻ sợ hãi.

Tô Minh sắc mặt tái nhợt, nhưng hắn cắn răng chịu đựng, mắt nhìn qua Lôi thần bên cạnh, lại thấy trong mắt đối phương dày đặc quang mang, tựa hồ thèm muốn, dường như những nghi lễ như vậy đã thói quen, mơ hồ có chút hưởng thụ, hiện rõ vẻ chất phác. Đúng là hai người hoàn toàn khác biệt.

Từng vòi máu tươi phun trào, tuôn ra như suốt, tản mát ra mùi tanh tưởi, hướng về hơn ba mươi cái lạp tô đã chuẩn bị sẵn, rơi vào trên tóc của bọn hắn, trên thân thể, cả khoảnh đất dưới chân.

"Các ngươi là may mắn, bởi vì hôm nay không có bộ lạc giao chiến, nhưng như vậy, các ngươi cũng là bất hạnh..." A công nhìn những thiếu niên trước mặt, nhẹ giọng nói.

"Lúc ta còn trẻ, nghi lễ Man Khải lúc mười sáu tuổi, là phải đi chặt một cái đầu của bộ lạc đối địch, uống máu tươi của địch nhân để hoàn thành lễ Man khải.

So với bây giờ, các ngươi may mắn... Cũng không may mắn chính là, các ngươi chỉ nhìn thấy thú huyết, mà chưa cầm đầu lâu của địch nhân..." A công lẩm bẩm, nhìn thật sâu vào một cái lạp tô trước mặt, tay phải cầm lấy cốt trượng giơ lên, một ngón tay hướng về phía trước.Cùng lúc đó, tay trái lão giơ lên năm ngón tay nắm chặt mạnh mẽ sau đó buông ra, lập tức một cổ hơi thở cường đại từ bên trong thân thể của lão bỗng nhiên tản ra, cổ hơi thở này cuốn động bốn phía, tạo thành một cổ cuồng phong gào thét, tràn ngập cả ô sơn bộ lạc.

Chỉ thấy ở trên mặt a công, có một đạo hoa văn biến ảo, đạo văn lạc kia lần lượt thay đổi, tạo thành một cái mãng thủ Đồ Đằng.

Mãng thủ rất sống động, giống như tồn tại chân thật, biến ảo ở trước mặt a công, tựa như ngửa mặt lên trời rít gào, nhưng không phát ra tiếng động, mặc dù hai lỗ tai không nghe thấy gì, nhưng tất cả tộc nhân bộ lạc Ô sơn nơi đây, bao gồm tộc trưởng cường tráng, thân thể cũng run rẩy, lui về phía sau mấy bước.

"Ô mãng văn... Đây là Man văn a công..." Tô Minh ngơ ngác nhìn a công, nhìn bề mặt văn lạc, nội tâm bị rung động cực lớn, lần trước hắn cũng thấy một màn như vậy. Đó là chín năm trước, hôm nay thấy lần nữa. Cảm xúc mạnh hơn đến mấy lần nếu so với năm đó.', N'"Bằng lực lượng chính mình, A công có thể đồ diệt cả bộ lạc, cường đại như thế, chỉ có thể là ngưng huyết cảnh đệ cửu tầng... Không biết khi đến Khai trần cảnh, lực lượng sẽ cường đại đạt đến mức độ nào đây...

Lại càng không cần phải nói đến Tế cốt cảnh tiếp sau của Khai trần cảnh... The cuốn sách da thú nói, cường giả tu vi Tế cốt cảnh, là dạng tồn tại cực kỳ hiếm thấy ở những bộ lạc bậc trung. Chỉ những bộ lạc lớn đến mức không thể tưởng được may ra mới xuất hiện một vài Man tu vi Tế cốt cảnh." Tô Minh tâm thần chấn động, khát vọng trở thành man sĩ lại cháy lên. Text được lấy tại http://truyenfull.vn

"Dùng máu tươi, thân thú, thỉnh ô sơn man tượng!" A công hét to như sấm, cắt đứt suy nghĩ Tô Minh, lại thấy theo lời nói truyền ra a công, thân thể của dã thú ở bốn phía lập tức phát mở, lập tức bốn phía cái kia những dã thú thi thể, toàn bộ phát mở, huyết nhục cùng huyết dịch tràn đầy mặt đất, Huyết dịch trên người những thiếu niên kia toàn bộ như bị một cổ vô hình lực hút lấy, ngưng tụ chung một chỗ ở giữa không trung, tạo thành một đoàn huyết nhục khổng lồ.

"Man khải!" Đại hán tráng kiện bên cạnh A công, chính là tộc trưởng bộ lạc Ô sơn giờ phút này quát to một tiếng.

Nhóm lạp tô này có cả Tô Minh, tất cả đều cắn chót lưỡi không chút do dự, phun ra một ngụm tiên huyết, máu tươi của bọn hắn cấp tốc bay lên không trung. Sau khi đoàn huyết nhục kia hấp thu toàn bộ, một tiếng nổ vang kinh thiên. Huyết nhục đoàn thình lình hóa thành một cái pho tượng màu đen.

Đó là pho tượng nửa người nửa thú dữ tợn, tràn đầy một cổ hơi thở dã man nguyên thủy, một tay nắm trường long, tay kia cầm một thanh trường thương khổng lồ, hai mắt lộ ra vẻ ham muốn điên cuồng.

Vì sự xuất hiện của nó, ngay cả bầu trời cũng ảm đạm vài phần, phảng phất vẻ uy nghiêm lẫm lẫm của nó đè nén.

"Ô sơn man tượng..." Trái tim Tô Minh đập thình thịch, nhảy nhảy lên, thật giống như muốn phát mở, nhưng vào lúc này, mảnh nhỏ đeo trên cổ hắn, dường như ẩn ước có dòng nước ấm tràn ra, dung nhập vào bên trong thân thể hắn, khiến cho cái cảm giác khó chịu loại nầy, tan thành mây khói.

Cảm giác như vậy làm cho Tô Minh ngẩn ra, cúi đầu nhìn một cách vô thức. Lúc này, thanh âm a công vang đến.

"Theo thứ tự tiến tới, đến gần Man tượng tham bái!"

Tiếng nói vừa dứt, tức thì một thiếu niên bước vội đến, sau khi bước đến phía dưới Man tượng, trong nháy mắt cả người biến mất. Một lúc sau, tại nơi biến mất, thiếu niên này huyễn hóa ra, vẻ mặt hắn ảm đạm, lui về phía sau đứng một bên, không nói một lời.

"Người tiếp theo!" Người nó, chính là tộc trưởng bộ lạc Ô sơn. Vẻ mặt đại hán nghiêm trang, ánh mắt quét qua chỗ những lạp tô.
TRUYỆN TRANH ĐANG HOT

Bụng bầu vượt mặt còn phát hiện chồng và em gái cắm sừng mình, cô bị hại chết trùng sinh trở về bắt đầu cuộc đời mới và cái kết hả hê!


Nhà văn trẻ xuyên vào thân xác của Hoàng hậu thất sủng, ngỡ là bất hạnh ngờ đâu lại bắt đầu được mối nhân duyên thú vị với Hoàng đế


Sập bẫy mẹ ruột, cô có thai người đàn ông lạ, mang trăm đắng ngàn cay biến mất nào hay đối phương là Tổng tài hô mưa gọi gió!


Cưới Tổng tài đáng ghét vì bị ràng buộc bởi 1 bản HĐ hôn nhân phát sinh sau 1 đêm ân ái ép buộc, cô đâu ngờ cuộc đời mình sang trang mới!


Từng người ở nghi lễ Man khải lạp tô, lục tục tiến lên, sau khi biến mất không lâu, liền lần nữa xuất hiện, cho đến khi một nữ tử bước vào Man tượng, Man tượng chợt loé ra quang mang màu đỏ.

Nhất thời tộc nhân cả bộ lạc xôn xao tinh thần rung lên. Ngay cả a công cũng là ngưng thần nhìn lại. Sau khi quang mang màu đỏ kia liên tục lóe ra chín lần, thân ảnh cô gái kia biến ảo ra.

"Có được Man thể!!"

"Man tượng loé lên chín lần, điều này đại biểu cho Man thể!"

Sau khi cô gái kia hiện thân, vẻ mặt hiện nét vui mừng.

"Ngươi gọi là Ô lạp thị ba, rất tốt, đến bên cạnh ta." Trên mặt A công lộ ra nụ cười, nhìn cô gái kia, khẽ gật đầu tán thưởng.

Nhìn cô gái kia đi đến bên a công, Tô Minh trầm mặc, cắn răng buớc ra, hướng Man tượng đi tới. Khi hắn bước ra, lập tức khiến cho tộc nhân bốn phía chú ý.

Hắn rõ ràng khác với những thiếu niên khác, tộc nhân ô sơn, phần lớn mang theo thiện ý thương hại, ánh mắt của bọn họ ngưng tụ trên người Tô Minh, cho đến lúc hắn đứng dưới Man tượng.

Tô Minh hít sâu một cái, nhìn thoáng qua a công cách đó không xa, thấy lão cũng đang nhìn mình. Hắn nhắm hai mắt lại, trong khoảnh khắc hai mắt khép kín, hắn cảm nhận được một cổ lực lượng nói không ra lời bao phủ toàn thân, giống như dung nhập vào bên trong bùn nước. Khi hai mắt mở ra, bốn phía hết thảy đều hoàn toàn đại biến.

Nơi này không phải là bộ lạc ô sơn, mà là một phiến không gian không lớn, bốn phía đen như mực, chỉ có một cái pho tượng màu đen đang nổi lơ lửng phía trước, tản mát ra quang mang màu đỏ.

Bộ dạng pho tượng, giống hệt Man tượng ở ngoài, tản mát ra hơi thở dã man nguyên thủy.

Nhìn Man tượng kia, Tô Minh trầm mặc một chốc, hướng về Man tượng cúi lạy một cái.

Sau một lạy, trên mặt Tô Minh lộ ra vẻ khổ sở, hắn biết, nếu như có Man thể, chỉ cần một xá Man tượng sẽ hiện ra quang mang màu đỏ. Thế mà hiện giờ trong mắt, giống hệt chín năm trước, cũng không sai một một chút nào.

"Cả đời này ta không thể thành Man sĩ..." Tô Minh cắn môi dưới, thở dài một tiếng, xoay người liền muốn nơi này.

Trong nháy mắt khi hắn xoay người, toàn thân hắn bỗng nhiên chấn động, mạnh mẽ quay đầu lại nhìn về phía Man tượng, một chút ngây ngốc!

Cùng lúc đó, hắn thấy chỗ ngực chính mình, mảnh nhỏ bị hắn bỏ qua lúc trước, tản mát ra u quang chói mắt...', NULL)
INSERT [dbo].[Chapter] ([ChapterID], [BookID], [NumberChapter], [ChapterName], [Contents_1], [Contents_2], [status]) VALUES (3, 2, 1, N'Ly hương', N'Thiết Trụ ngồi ở bên con đường nhỏ trong thôn, vẻ mặt ngẩn ngơ nhìn bầu trời xanh thẳm, Thiết Trụ vốn không phải là tên thật của hắn, mà là từ bé bởi vì thân thể gầy yếu, phụ thân sợ nuôi không được, vì thế dựa theo tập tục mà gọi tên mụ.
 
Hắn vốn tên là Vương Lâm, họ Vương ở trong vài cái thôn xóm xung quanh xem như danh gia, tổ tiên xuất thân thợ mộc, nhất là ở thị trấn, gia tộc họ Vương cũng coi như rất có danh tiếng, có được mấy cửa hiệu chuyên môn bán sản phẩm gỗ.
 
Phụ thân Thiết Trụ là con thứ vợ lẻ bên trong gia tộc, không được phép tiếp quản việc quan trọng của gia tộc, mà là ở sau khi thành hôn rời đi thị trấn, định cư tại thôn trang này.
 
Bởi vì có một tay thợ mộc tinh sảo, gia cảnh Thiết Trụ cũng coi như bậc trung, ăn mặc không lo, cho dù là ở trong thôn, cũng được nhiều người tôn kính.
 
Thiết Trụ từ nhỏ đã cực kỳ thông minh, yêu thích đọc sách, có rất nhiều ý nghĩ, hầu như được trong toàn thôn công nhận là thần đồng, phụ thân mỗi lần nghe được người ta khen ngợi, nếp nhăn trên mặt phụ than đều hiện ra, lộ ra nụ cười thoải mái.
 
Mẫu thân càng hay quan tâm đối với hắn hắn, có thể nói từ nhỏ đến lớn, Thiết Trụ đều là sinh hoạt trong sự yệu thương của cha mẹ, hắn biết cha mẹ đối hắn kỳ vọng rất cao, đứa trẻ nhà khác ở hắn tuổi đều đã ra đồng làm nông kiếm sống rồi, nhưng hắn lại ở nhà đọc sách.
 
Đọc sách nhiều, ý nghĩ tự nhiên cũng sẽ theo đó mà đến, đối với thế giới bên ngoài sơn thôn, hắn tràn ngập hướng tới. Ngẩng đầu nhìn phía cuối con đường nhỏ, Thiết Trụ thở dài một tiếng, khép lại sách trong tay, đứng dậy đi về nhà.
 
Phụ thân ngồi ở trong sân, trong tay cầm tẩu thuốc, sau khi hút thật sâu một ngụm, nói với Thiết Trụ vừa đẩy cửa vào:
 
- Thiết Trụ, đọc sách thế nào?
 
Thiết Trụ ứng phó vài câu, phụ thân gõ gõ tẩu thuốc, đứng dậy nói:
 
- Thiết Trụ a, ngươi phải đọc sách cho thật tốt, sang năm chính là kỳ thi lớn trong huyện, ngươi về sau có tiền đồ hay không, thì phải xem lần này rồi, nhưng đừng giống ta, cả đời này vẫn ở lại trong thôn, ôi.
 
- Được rồi, ông mỗi ngày cằn nhằn, phải để ta nói, Thiết Trụ nhà chúng ta nhất định có thể thi đỗ." Mẫu thân Thiết Trụ, bưng đồ ăn đặt ở trên bàn trong sân, gọi cha con hai người bọn họ lại ăn cơm.
 
Thiết Trụ ôi một tiếng, sau khi ngồi xuống tùy tiện ăn vài miếng, mẫu thân từ ái nhìn con trai, đem vài miếng thịt, gắp qua cho hắn.
 
- Cha, tứ thúc sắp tới chưa vậy?
 
Thiết Trụ ngẩng đầu nói.
 
- Tính toán thời gian, không sai biệt lắm đúng là mấy ngày này rồi, tứ thúc ngươi so với cha có tiền đồ, ai, mẹ nó ơi, gói kỹ đồ ăn chuẩn bị cho lão Tứ nhé?
 
Phụ thân một khi nhắc tới lão Tứ, trên mặt lộ ra vẻ thổn thức.
 
Mẫu thân gật đầu, cảm động nói:
 
- Thiết Trụ a, tứ thúc ngươi là người tốt, vài năm này, may mắn hắn giúp đỡ, cha ngươi làm điêu khắc mới có thể bán ra tiền, ngươi về sau nếu như có tiền đồ rồi, đừng quên báo đáp tứ thúc ngươi.
 
Đang nói, bỗng nhiên ngoài cửa truyền đến tiếng ngựa, tiếp theo tiếng bánh xe ngựa lại gần ào ào theo đó mà đến, một cái âm thanh sang sảng vang lên ở bên ngoài.
 
- Nhị ca, mở cửa đi.
 
Thiết Trụ kinh hỉ, lập tức chạy tới sân nhỏ đem cửa sân đẩy ra, chỉ thấy một người trung niên hán tử cường tráng, ánh mắt sáng ngời đứng ở ngoài cửa, sau khi hắn nhìn đến Thiết Trụ ha ha cười, sờ sờ đầu hắn, cười nói:
 
- Thiết Trụ, lúc này mới nửa năm không thấy, thân hình lại cao lên rồi.Cha mẹ Thiết Trụ vội vàng đứng lên, phụ thân hắn cười nói:
 
- Lão Tứ, ta ước chừng thời gian, ngươi cũng tới nhanh thật, mau vào, Thiết Trụ, còn không đi lấy ghế cho tứ thúc ngươi đi.
 
Thiết Trụ cao hứng lên tiếng, vội vàng chạy về phòng ở, xuất ra một cái ghế đẩu đặt ở cạnh bàn ăn, dùng tay áo xoa xoa hẳn hoi, mong mỏi nhìn trung niên hán tử.
 
Trung niên hán tử hướng về hắn nháy nháy con mắt, trêu ghẹo nói:
 
- Thiết Trụ, lần này như thế nào chịu khó như vậy a, ta nhớ rõ thời điểm lần trước ta đến, ngươi cũng không như vậy a.
 
Thiết Tụ phụ thân trừng mắt nhìn Thiết Trụ liếc mắt một cái, cười mắng:
 
- Thằng nhóc con này, ngay vừa rồi còn cằn nhằn ngươi là còn không đến nhanh lên.
 
Trung niên hán tử nhìn thấy khuôn mặt ửng đỏ của Thiết Trụ, cười nói:
 
- "Thiết Trụ, tứ thúc ngươi cũng không quên thứ đã đáp ứng ngươi." Nói xong, từ trong ngực lấy ra hai quyển sách, đặt ở trên bàn.
 
Thiết Trụ hưng phấn hoan hô một tiếng, cầm lấy sách lật xem một chút, vui mừng không kìm chế được.Mẹ Thiết Trụ đôi mắt hiền hậu nhìn nhi tử mình, nới với trung niên hán tử:"Lão Tứ, ca ngươi bình thường vẫn nhắc tới ngươi, lần này ở thêm vài ngày đi." Trung niên hán tử lắc đầu nói:
 
- "Nhị tẩu, mấy ngày này gia tộc nhiều việc, ta sáng sớm ngày mai sẽ chạy trở về, chờ trong khoảng thời gian này mọi việc xong xuôi, ta lại đến gặp mọi người." Nói xong, hắn xin lỗi mà nhìn qua nhị ca mình.
 
Cha Thiết Trụ thở dài, nói:
 
- Lão Tứ đừng nghe chị dâu ngươi, sáng mai đem hàng hóa đóng gói xong, chuyện gia tộc là quan trọng nhất, sau này chúng ta lại tụ họp cũng thế thôi.
 
Trung niên hán tử nhìn cha Thiết Trụ, nói:
 
- Nhị ca, Thiết Trụ năm nay mười lăm tuổi phải không?
 
Thiết Trụ phụ thân gật đầu, xúc động nói:
 
- Sang năm, thằng nhãi con này liền mười sáu, ô, nhoáng một cái hơn chục năm đi qua, thực mau.
 
Nói xong, mắt hắn lộ ra vẻ cưng chiều, nhìn chính nhi tử mình.
 
Trung niên hán tử trầm ngâm một chút, sắc mặt nghiêm túc, nói:
 
- Nhị ca, nhị tẩu, cùng các ngươi một việc, Hằng Nhạc Phái năm nay thu đệ tử, gia tộc có ba cái đề cử danh ngạch, phân đến chỗ này của ta có một cái.
 
Thiết Trụ phụ thân ngẩn ra, biến sắc nói:
 
- Hằng Nhạc Phái? Nhưng là cái Hằng Nhạc Phái kia, nơi tất cả đều là tiên nhân?
 
Trung niên hán tử cười, gật đầu nói:
 
- Nhị ca, chính là cái tiên nhân môn phái kia, gia tộc chúng ta ở phụ cận cũng coi như vọng tộc, có tư cách tiến cử, nhà của ta tiểu tử huynh cũng biết, đọc sách không xong, múa đao lộng kiếm lại không am hiểu, ta cân nhắc tiên nhân sẽ không thu nhận tiểu tử nhà ta, cái danh ngạch trân quý, ta xem Thiết Trụ từ nhỏ đã thông minh, yêu thích đọc sách, nói không chừng có thể được.
 
Mẹ Thiết Trụ cực kỳ vui mừng, vội vàng nói:
 
- Lão Tứ, này.này.
 
Trung niên hán tử sờ sờ đầu Thiết Trụ, nói:
 
- Nhị ca, nhị tẩu, ta xem việc này liền như vậy quyết định đi, để cho Thiết Trụ đi thử xem, nếu thực sự được thu nhận, đó chính là phúc phần của ta.
 
Thiết Trụ mê hoặc nhìn cha mẹ cùng Tứ thúc, hắn có chút nghe không hiểu bọn họ nói cái gì đó, tiên nhân?
 
- "Cái gì tên là tiên nhân?" Thiết Trụ do dự một chút, nhẹ giọng dò hỏi.
 
Trung niên hán tử sắc mặt nghiêm túc, nhìn Thiết Trụ, nói:
 
- Thiết Trụ a, tiên nhân chính là có thể ở trên trời bay tới bay lui, bọn họ mỗi người đều thần thông quảng đại, không phải chúng ta phàm nhân có thể suy xét.
 
Thiết Trụ ở trong mơ hồ, đối với tiên nhân có một tia hiếu kỳ.
 
Phụ thân Thiết Trụ kích động đứng dậy, lôi kéo mẹ Thiết Trụ hướng về trung niên hán tử quỳ xuống, trung niên hán tử vội vàng đem bọn họ nâng dậy, thành khẩn nói:"Nhị ca, ngươi làm cái gì vậy. Mẹ ta chết sớm, nếu không phải Nhị nương khi còn bé chiếu cố ta, ta cũng không khả năng có hôm nay, Thiết Trụ là điệt nhi ta, ta hẳn là phải làm như vậy." Phụ thân Thiết Trụ cảm động rơi lệ, vỗ thật mạnh vai trung niên hán tử, gật gật đầu, sau đó thần sắc nghiêm nghị đối với Thiết Trụ nói:
 
"Vương Lâm ngươi nhớ kỹ, về sau vô luận như thế nào, cũng không được quên tứ thúc ngươi có ân huệ đối với nhà chúng ta, nếu không ta sẽ không có đứa con như ngươi!" Thiết Trụ nội tâm run lên, hắn mặc dù đối với tiên nhân vẫn còn là mơ hồ, nhưng từ trong biểu tình của cha mẹ có thể nhìn thấy bọn họ đối việc này cực kỳ xem trọng, vì thế quỳ gối trước mặt tứ thúc, dập đầu vài cái thật mạnh.
 
Trung niên hán tử kéo Thiết Trụ, tán thưởng mà nói:
 
- Hảo hài tử, ngươi mấy ngày nay thu thập một chút, ta cuối tháng sẽ tới đón ngươi!
 
Buổi tối, Thiết Trụ sớm đã đi ngủ, bên tai còn có thể nghe được thanh âm phụ thân cùng tứ thúc trong sân, phụ thân hôm nay thật cao hứng, người ít khi uống rượu, nói cái gì cũng phải cùng tứ thúc uống mấy chén.
 
Tiên nhân? Rốt cuộc là cái gì?
 
Thiết Trụ nội tâm thực hưng phấn, hắn tâm linh trẻ thơ mơ hồ biết rằng, này chính là một cái cơ hội của mình, một cái cơ hội có thể đi đến thế giới bên ngoài!
 
Sáng sớm hôm sau, tứ thúc ly khai, phụ mẫu Thiết Trụ lôi kéo hắn một mạch đến cửa thôn đưa tiễn, ở trên đường trở về, Thiết Trụ nhìn thấy rất rõ, phụ thân tựa hồ thoáng cái trẻ đi rất nhiều, ánh mắt nhìn về phía hắn, cũng tràn ngập kỳ vọng.
 
Loại ánh mắt kỳ vọng này, phải so với trước kia khi bảo hắn đi thi kỳ thi huyện, ngưng trọng rất nhiều.
 
Bên trong tiểu sơn thôn căn bản không có bí mật có thể giấu, ngay cả một con chó sinh ra vài con chó con cũng có thể ở trong nháy mắt truyền khắp toàn thôn, rất nhanh mọi người toàn thôn từ trong miệng mẫu thân Thiết Trụ đã biết tin tức này, sôi nổi thăm hỏi, ánh mắt mỗi người nhìn về phía Thiết Trụ cũng đều bất đồng, có hâm mộ, có ghen tị.
 
- Vương gia sinh đứa con tốt, người ta được Hằng Nhạc Phái thu làm đệ tử.
 
- Thiết Trụ đứa nhỏ này ta nhìn hắn từ nhỏ đến lớn lên, đứa nhỏ này còn nhỏ đã thông minh, lần này lại trở thành đệ tử Hằng Nhạc Phái, về sau chắc chắn tiền đồ rộng mở.
 
- Thiết Trụ có bản lĩnh, về sau có tiền đồ rồi cũng đừng quên thôn chúng ta, nhiều hơn trở về hỏi thăm a.
 
Những lời nói như thế này, dồn dập rơi vào trong tai Thiết Trụ, dần dần nói hắn đã muốn trở thành Hằng Nhạc Phái đệ tử bình thường, cha mẹ mỗi lần nghe được, đều cười không khép miệng được, nếp nhăn trên mặt tựa hồ đã mất đi rất nhiều.', N'Mỗi khi Thiết Trụ một mình đi ở trong thôn, tất cả thôn dân nhìn thây hắn, đều nhiệt tình lôi kéo hắn hỏi tới hỏi lui, cũng có lắm người thậm chí đem hắn đến trước mặt đứa nhỏ, đem Thiết Trụ trở thành tấm gương, dạy bảo một phen.
 
Nửa tháng thời gian rất nhanh đi qua, tin tức Thiết Trụ trở thành đệ tử Hằng Nhạc Phái nhanh chóng truyền khai, thôn dân tám thôn xung quanh mười dặm, đều lục tục đến đây chúc mừng, bọn họ mục đích chủ yếu là nhìn Thiết Trụ một lần.
 
Mỗi người khi đến, cũng đều chuẩn bị lễ vật, phụ mẫu Thiết Trụ từ chối không xong, cũng đành nhận lấy. Bất quá khi những người này rời đi, bọn họ đều đã chuẩn bị một phần đáp lễ thật lớn, dựa theo lời cha Thiết Trụ nói, oa nhi chúng ta về sau đã là tiên nhân cao cao tại thượng, không thể làm cho hắn khiếm hạ thiệt nhiều khoản nhân tình như vậy, tất cả thôn dân tới chơi, ta đều thay hắn đáp lễ.
 
Lúc này, tộc nhân Vương thị gia tộc, cũng dần dần biết chuyện lão Tứ đem danh ngạch của con mình tặng cho Thiết Trụ, đều lục tục đến đây chúc mừng.
 
Đối với tộc nhân gia tộc của mình, phụ thân Thiết Trụ cực kỳ chú trọng, trong những người này có rất nhiều là trước đây xem thường hắn, hơn nửa nhiều năm trước đem hắn bức ra gia tộc, hiện tại một đám người này tiến đến nhà hắn, làm cho hắn lập tức cảm giác nghẹn khuất nhiều năm biến mất hoàn toàn.
 
Hắn cùng mẹ Thiết Trụ thương lượng một chút, chuẩn bị một phen chiêu đãi thật tốt, vì thế tiêu một cái giá tiền cao, thỉnh tiên sinh dạy học trong thôn viết thiệp mời, đưa đến trong tộc.
 
Tiên sinh dạy học nói kiểu gì cũng không lấy tiền, nhưng là yêu cầu Thiết Trụ phải thừa nhận, hắn theo từ nhỏ đã tại nơi này của hắn đọc sách, với việc này Thiết Trụ cũng không nói gì, đây vốn là là sự thật thôi.
 
Thiệp mời sau khi đưa đến, phần lớn thân thích trong Vương thị gia tộc đều đến chúc mừng, bởi vì người đến nhiều lắm, cha Thiết Trụ đem địa điểm chiêu đãi tuyển chọn ở quảng trường trung tâm thôn làng, bày ra mấy trăm bàn tiệc rượu.
 
Cư dân thôn làng tự động giúp đỡ chiêu đãi, nói chuyện với nhau là lúc Thiết Trụ bị tán thưởng có chuyện tốt, khích lệ không ngừng.
 
Về phần cha Thiết Trụ, lại mang theo lão bà cùng đứa con tự mình ở cửa thôn nghênh đón, vì Thiết Trụ giới thiệu từng cái thân phận của thân thích.
 
- Đây là Tam tổ phụ của ngươi, lúc trước cha rời đi gia tộc, Tam tổ phụ ngươi âm thầm giúp đỡ không ít, Thiết Trụ, ngươi về sau phải nhớ báo đáp.
 
Thiết Trụ phụ thân đang dìu một cái lão nhân tóc bạc trắng, nói với Vương Lâm.
 
Thiết Trụ vội vàng nhu thuận đồng ý, lão nhân nhìn Thiết Trụ, cảm khái nói:
 
- Lão Nhị a, thời gian thực mau, oa nhi nhà ngươi đều lớn như vậy rồi, ngươi oa nhi này tốt lắm, so với ngươi thật có tiền đồ.
 
Cha Thiết Trụ vẻ mặt ửng hồng, cười nói:
 
- Tam tổ phụ, Thiết Trụ đứa nhỏ này từ nhỏ đã thông minh, xác định là so với ta cường a. Ngài đi chậm một chút, mẹ nó à, qua dìu tam tổ phụ đi.
 
Mẹ Thiết Trụ vội vàng tiến lên, nâng lão nhân đi về phía yến hội.
 
Nhìn đến lão nhân đi rồi sau, Thiết Trụ cha hắn hừ một tiếng, đối Thiết Trụ nói:"Lão gia hỏa này, lúc trước nhìn thấy cha ngươi là chướng mắt, không phải muốn đem ta bức đi sao, hiện tại Thiết Trụ ngươi có tiền đồ rồi, lại đến đây chúc mừng, cái thân thích này à, chính là như vậy." Thiết Trụ ngây thơ gật gật đầu, hỏi:
 
- Cha, tứ thúc hôm nay đến không?
 
Thiết Trụ phụ thân lắc đầu nói:
 
- Tứ thúc ngươi truyền đến tin tức, hắn ở bên ngoài cũng chưa về, chờ cận cuối tháng khi đó hắn mới có thể chạy về." Lúc này, lại có xe ngựa đi vội đến, ở cửa thôn dừng lại sau, đi ra một cái hơn lão giả năm mươi tuổi, hắn nhìn phụ thân Thiết Trụ, than nhẹ một tiếng, nói:
 
- Lão Nhị, chúc mừng.
 
Cha Thiết Trụ sắc mặt phức tạp, sau một hồi nói:
 
- Đại ca.
 
Lão giả ánh mắt đảo qua, nhìn Thiết Trụ, mỉm cười nói:
 
- Lão Nhị, đây là tiểu tử nhà ngươi đi, không sai, lần này nói không chừng thật có thể bị tuyển trúng.
 
Thiết Trụ phụ thân nhướng mày, theo sau đó giãn ra, nói:
 
- Thiết Trụ đứa nhỏ này không gì ưu điểm, chính là có một ít thông minh, nguyện ý đọc sách, lần này xác định là sẽ bị tuyển trúng.
 
- Kia cũng không nhất định, tiên nhân môn phái thu đệ tử, yêu cầu phi thường nghiêm khắc, coi trọng có hay không tiên duyên, ta xem tiểu tử này ngu dốt si đần, đi cũng là phí công thôi.
 
Một cái âm thanh kiêu căng ngạo mạn từ từ truyền đến, theo trên xe ngựa đi xuống một cái thiếu niên mười sáu mười bảy tuổi.
 
Thiếu niên tướng mạo tuấn tú, mày kiếm mắt sáng, mặt như quan ngọc, ánh mắt lộ ra vẻ khinh miệt.
 
Phụ thân Thiết Trụ trợn mắt nhìn, Vương Lâm lại liếc mắt nhìn đối phương một cái thật sâu, không nói gì.
 
Lão giả sắc mặt nghiêm túc, quát lên:
 
- Vương Trác, như thế nào lại không có lễ phép như vậy, đây là Nhị thúc ngươi, đây là đệ đệ ngươi Vương Lâm, còn không chào.
 
Nói xong, hắn liền hướng phụ thân Thiết Trụ nói:
 
- Khuyển tử nói chuyện khó nghe, lão Nhị ngươi đừng để ý, bất quá.
 
Nói đến đây, hắn chuyển đề tài, lại nói:
 
- Bất quá lão Nhị, tiên nhân thu đồ đệ, cũng không phải là chuyện đơn giản như vậy, cần chú ý duyên phận, lần này là Hằng Nhạc Phái Đạo Hư thượng tiên coi trọng khuyển tử, thế nên mới đối với Vương thị gia tộc chúng ta cảm thấy hứng thú, cấp cho ba cái danh ngạch bao gồm khuyển tử ở bên trong.
 
Thiết Trụ phụ thân hừ một tiếng, nói:
 
- Oa nhi nhà ngươi nếu có thể được, oa nhi nhà ta, nhất định cũng sẽ được tuyển chọn!Thiếu niên nhạo báng, căn bản là không để ý lão giả khiển trách, miệt thị nói:
 
- Ngươi chính là Nhị thúc đi, ta khuyên ngươi vẫn là đừng nghĩ ông trời phù hộ, này tu tiên cơ chế nói trong vạn người có một cũng không sai biệt lắm, ngốc tiểu tử này không có khả năng so với bổn thiếu gia, bản thiếu gia là được nội bộ chỉ định đệ tử tiên sư, hắn có thể so sánh sao?
 
Trên mặt lão giả vẻ đắc ý chỉ chợt lóe lên rồi mất, lại quở trách vài câu, hướng phụ thân Thiết Trụ liền ôm quyền, mang theo thiếu niên đi về phía yến hội.
 
- Thiết Trụ, không nên tạo áp lực, nếu thực sự không được tuyển chọn cũng không có gì, sang năm tham gia kỳ thi huyện cũng giống nhau thôi.
 
Cha Thiết Trụ nghẹn khí nửa ngày trời, sau một hồi mới chậm rãi thở ra, lời nói ra thật thành khẩn.
 
Vương Lâm ánh mắt kiên định, thấp giọng nói:
 
- Cha, ngươi yên tâm, ta nhất định có thể được tuyển chọn!
 
Cha Thiết Trụ hắn ôn hòa vỗ vỗ bả vai nhi tử, trong ánh mắt lộ ra vẻ kỳ vọng.
 
Lại tiếp tục nghênh đón không ít thân thích, cha Thiết Trụ cuối cùng mang theo hắn trở lại yến hội, lúc này khách đến rất đông, không khí phi thường náo nhiệt, mọi người chúc mừng lẫn nhau, rộn ràng nhốn nháo.
 
- Các thân thích trong tộc, các hương thân phụ lão, ta Vương Thiên Thủy không có học vấn, sẽ không biết nói lời gì, nhưng là ta hôm nay thật cao hứng, oa nhi nhà ta lần này có cơ hội được Hằng Nhạc Phái tuyển chọn làm đệ tử, là chyện cả đời này ta cao hứng nhất, ta cũng không nói nhiều nữa, cảm tạ các vị đến nơi này của ta chúc mừng, cám ơn!
 
Cha Thiết Trụ lớn tiếng nói xong, bưng chén rượu lên uống không còn một giọt.
 
- Lão Nhị, oa nhi nhà ngươi từ nhỏ đã thông minh lanh lợi, nhất định có thể tuyển chọn, cùng Vương Trác đứa nhỏ kia giống nhau, trở thành tiên nhân.
 
- Nhị ca, ngươi có Thiết Trụ đứa nhỏ này, đời này xem như sống không uổng phí, về sau chờ hưởng phúc là được rồi.
 
- Thiết Trụ, phải tranh phần hơn cho ngươi cha, lần này vô luận như thế nào cũng phải tiến vào Hằng Nhạc Phái.
 
Không khí trong nhất thời rất là sôi nổi, tiếng chúc mừng nổi lên bốn phía, bất quá trong lòng, cũng có rất nhiều người ôm tâm tư xem náo nhiệt, tỷ như phụ thân Vương Trác, chính là như vậy, hắn ở ngoài mặt chúc mừng, nhưng trong lòng từ trước đến nay đều xem thường Nhị đệ này, với nhi tử của hắn lại càng như vậy, hắn nhìn tiểu tử nhà mình, lại nhìn nhìn Thiết Trụ, trong lòng rất không đồng ý, thầm nghĩ lão Tứ lần này đem danh ngạch cho đi, mặc dù ra ngoài dự đoán của mình, nhưng chỉ cần những tiên nhân kia không phải người mù, liền không thể tuyển chọn Thiết Trụ.
 
Nhân sinh trăm cảnh, nơi đây mọi người có thể thấy được từng cái, phụ thân Thiết Trụ lôi kéo Thiết Trụ, lần lượt đến từng cái bàn kính rượu, vì hắn giới thiệu một cái lại một cái thân thích xa lạ.
 
Một ngày này, phụ thân Thiết Trụ uống rất nhiều rượu, hắn chưa từng có nở mày nở mặt như vậy, mãi cho đến đã khuya, thân thích lần lượt ly khai. Lúc gần đi, thiếu niên Vương Trác vẫn như cũ vẫn là bộ biểu tình xem thường kia, thừa dịp mọi người không chú ý ở Thiết Trụ bên tai nhẹ giọng nói:
 
- Ngốc tiểu tử, ngươi sẽ không được tuyển chọn , ngươi không bằng miếng thức ăn gia súc.
 
Nói xong, hắn cười khinh miệt, theo phụ thân ly khai.
 
Về đến trong nhà, Thiết Trụ nằm ở trên giường, trong lòng âm thầm quyết định, vô luận như thế nào, cũng phải được tuyển chọn!
 
Nửa tháng vội vàng qua đi, một ngày này, tứ thúc Thiết Trụ vội vàng đi xe ngựa đến đây.
 
Cha mẹ Thiết Trụ vội vàng nghênh đón hắn vào trong phòng, trung niên hán tử rửa mặt, vội vàng nói:
 
- Nhị ca, nhị tẩu, lần này không thể ở lại thời gian dài, ta đến đón Thiết Trụ lập tức rời đi, sáng sớm ngày mai Hằng Nhạc Phái sẽ tới đón người.
 
Thiết Trụ phụ thân ngẩn ra, trên mặt lộ ra một tia không muốn, quyết đoán nói:
 
- Đi, Thiết Trụ, đi theo tứ thúc ngươi đi thôi, ngươi. ngươi nếu là được tuyển chọn, ở Hằng Nhạc Phái không được kiêu căng, nếu như. nếu như không được tuyển chọn, không cần phải mang bất kỳ trách nhiệm nào, trở về nhà là được.
 
Thiết Trụ không nỡ nhìn cha mẹ, gật đầu thật mạnh, mẹ hắn từ phòng đem ra một cái bọc, yêu thương nói:
 
- Thiết Trụ, đi ra ngoài phải nghe lời tứ thúc nói, không được gây chuyện, bên ngoài không thể so với trong nhà, gặp chuyện nhẫn nhịn một chút, mẹ chuẩn bị cho ngươi vài bộ quần áo mới, còn có khoai lang nướng ngươi thích ăn nhất, mẹ sẽ nhớ ngươi, nếu không được tuyển chọn, lại trở về.
 
Mẹ Thiết Trụ nói xong nói xong, nước mắt liền chảy xuống.
 
Thiết Trụ từ nhỏ đến lớn, đều chưa từng đi ra thôn làng, lần này, là lần đầu tiên hắn ly khai.
 
Tứ thúc ở một bên cảm động, nói:
 
- Thiết Trụ, phải tranh phần hơn cho cha mẹ ngươi, nhất định phải được tuyển chọn. Nhị ca, nhị tẩu, gia tộc vài ngày sau sẽ có bữa tiệc lớn chúc mừng, hôm nay vội quá, ta sáng mai tới đón các ngươi cùng nhau đi qua, gia tộc ba cái oa nhi bị đề cử đi lên, khi đó sẽ kết quả rồi.
 
Nói xong, hắn vội vàng lôi kéo Thiết Trụ lên xe ngựa, đánh lên ngựa một roi, nghênh ngang mà đi.
 
Cha mẹ Thiết Trụ, vẫn nhìn xe ngựa nhanh chóng biến mất, rơi lệ không ngừng.
 
- Cha nó, Thiết Trụ cho tới bây giờ chưa từng rời đi bên cạnh chúng ta, lần này hắn đi ra ngoài có thể hay không chịu khi dễ.
 
Mẹ Thiết Trụ cắn môi dưới, ánh mắt lộ ra không muốn.
 
- Oa nhi trưởng thành rồi, tự có phúc khí của nó.
 
Cha Thiết Trụ cầm lấy tẩu hút thuốc, hút một ngụm thật sâu, trên mặt nếp nhăn, lập tức lại nhiều lên không ít.', NULL)
INSERT [dbo].[Chapter] ([ChapterID], [BookID], [NumberChapter], [ChapterName], [Contents_1], [Contents_2], [status]) VALUES (4, 2, 2, N'Tiên Nhân', N'Xe ngựa rong ruổi rất nhanh ở trên con đường nhỏ, Vương Lâm thân mình lắc lư lên xuống theo cái hố trên mặt đất, hắn ôm cái bọc trong ngực, trong lòng thoải mái, mang theo kỳ vọng của cha mẹ đối với hắn, ly khai sơn thôn sinh sống suốt mười lăm năm.
 
Nơi đây cách thị trấn một khoản lộ trình không ngắn, Vương Lâm dần dần thiếp đi, cũng không biết trải qua bao lâu, hắn bị người ta nhẹ nhàng thúc đẩy, vừa mở mắt thấy, khuôn mặt tứ thúc mang theo mỉm cười nhìn hắn, trêu ghẹo nói:
 
- Thiết trụ, lần đầu tiên rời đi gia đình, có cái gì cảm tưởng a.
 
Vương Lâm nhận thấy xe ngựa đã dừng lại rồi, cười ngây ngô nói:
 
- Cũng không cảm tưởng gì, chỉ là có một chút sợ hãi, không biết có thể hay không được tiên nhân thu nhận.
 
Tứ thúc ha ha cười, vỗ vỗ bả vai Thiết Trụ, nói:
 
- Được rồi, đừng nghĩ nhiều như vậy, đã đến nơi rồi, đây là nhà tứ thúc, ngươi trước tiên đi nghỉ ngơi, chờ buổi sáng ta mang đi gia tộc chúng ta.
 
Sau khi xuống xe ngựa, hiện ra ở trước mặt Vương Lâm là một phiến nhà ngói, đi theo tứ thúc đi vào một gian phòng, Vương Lâm ngồi ở trên giường làm như thế nào cũng không có buồn ngủ, hắn trong đầu hiện lên hình ảnh lời nói của cha mẹ, hương thân, thân thích, trong lòng than nhẹ, đối với ý niệm được tiên nhân thu làm đệ tử, thật quá nặng.
 
Thời gian từng giờ qua đi, chừng một hồi sắc trời dần sáng, mặt trời từ từ mọc lên, Vương Lâm mặc dù một đêm không thể nào nghỉ ngơi, nhưng tinh thần lại rất sung mãn, mang theo một chút thấp thỏm, hắn theo tứ thúc đi tới tòa nhà lớn của Vương thị gia tộc.Đây là Vương Lâm lần đầu tiên nhìn thấy cái nhà lớn như vậy, nhìn hoa cả mắt, tứ thúc vừa đi vừa thở thở:
 
- Thiết Trụ, lần này nhất định phải tranh phần hơn cho ngươi cha, nhưng đừng để bọn thân thích chê cười.
 
Vương Lâm trong lòng càng thêm khẩn trương, cắn chặt môi dưới, gật gật đầu.
 
Chừng một lúc sau, tứ thúc đem hắn đi đến chính giữa sân rộng trong tòa nhà, đại ca cha Thiết Trụ, cái lão giả kia đứng ở trong sân, sau khi nhìn thấy Thiết Trụ gật nhẹ đầu, nói:- Thiết Trụ, một lát tiên nhân sẽ đến đây, nhưng đừng ngạc nhiên, hết thảy mọi việc liền đi theo ca ca ngươi Vương Trác học tập, hắn làm thế nào, ngươi liền làm như vậy, hiểu rõ chưa!
 
Mấy chữ cuối cùng, ngữ khí lão giả thật nghiêm khắc.
 
Vương Lâm trầm mặc không nói, vừa thấy mọi nơi, phát hiện trừ bỏ Vương Trác ở ngoài, còn có một thiếu niên, thiếu niên làn da hơi đen, khoẻ mạnh kháu khỉnh, trong mắt lại lộ ra một tia lanh lợi, nội y hắn căng phồng, hình như đang thăm dò cái gì đó.
 
Hắn nhìn thấy Thiết Trụ nhìn phía mình, hướng về hắn làm cái mặt quỷ, đã chạy tới hỏi:
 
- Ngươi chính là Thiết Trụ ca nhà Nhị thúc sao, ta gọi là Vương Hạo.
 
Vương Lâm cười khẽ, gật gật đầu.
 
Lão giả nhìn thấy Thiết Trụ cư nhiên không để ý tới mình, đáy lòng buồn bực, đang muốn khiển trách.
 
Đúng lúc này, bỗng nhiên đám mây trên bầu trời lay động, một đạo kiếm quang thiểm điện phá không mà đến, sau khi kiếm quang tiêu tán, trên mặt đất một bạch y thanh niên đang đứng thẳng, thanh niên có ánh mắt lấp lánh hữu thần, tản mát ra khí chất phiêu dật bất phàm, thần thái của hắn băng lãnh, ánh mắt dừng ở trên người Thiết Trụ ba tên thiếu niên quét qua, nhất là ở trên người thiếu niên lanh lợi trên người có chỗ căng phồng liếc mắt, âm thanh lạnh lùng nói:
 
- Vương gia ba cái danh ngạch, là bọn họ sao?
 
- Đây là tiên nhân sao?
 
Dưới một cái liếc mắt của đối phương, Vương Lâm chỉ cảm thấy cơ thể chợt lạnh, trái tim chỉ không ngửng kinh hoàng, khuôn mặt nhỏ nhắn không còn chút máu, ngơ ngác nhìn đối phương.
 
Lại nhìn cái thiếu niên có vẻ mặt lanh lợi kia, hai tay vẫn la đặt ở bên quần, cung kinh lễ phép, ánh mắt lộ ra vẻ cuồng nhiệt.
 
Chỉ có Vương Trác, thờ ơ liếc mắt nhìn đối phương một cái, trong lỗ mũi hừ nhẹ một tiếng.
 
Cha Vương Trác vội vàng tiến lên, vẻ mặt cực kỳ cung kính, sợ hãi liền cả kinh nói:
 
- Thượng tiên, ba người này đúng là tộc nhân Vương gia đề cử .', N'Thanh niên gật đầu, không kiên nhẫn nói:
 
- Ai là Vương Trác?
 
Lão giả trên mặt vui vẻ, vội vàng lôi kéo Vương Trác nói:
 
- Thượng tiên, đây là khuyển tử Vương Trác.
 
Thanh niên liếc mắt nhìn Vương Trác một cái thật sâu, sắc mặt dần bình thường, gật đầu nói:
 
- Vương sư đệ quả nhiên là một cái nhân tài, khó trách có thể được Đạo Hư sư thúc nhìn trúng.
 
Vương Trác đắc ý nhìn nhìn Thiết Trụ cùng cái thiếu niên lanh lợi kia, kiêu ngạo nói:
 
- Đó là tự nhiên, bản thiếu gia có tu tiên linh căn, Đạo Hư tiên nhân đúng là khen ngợi không ngừng.
 
Thanh niên nhướng mày, nhưng rất nhanh liền giãn ra, cười như không cười nhìn Vương Trác một cái, vung tay áo một vòng, mang theo ba cái thiếu niên đằng vân giá vũ hóa thành cầu vồng, trong nháy mắt biến mất tại chỗ.
 
Tứ thúc ngẩng đầu nhìn bầu trời, thì thào lẩm bẩm:
 
- Thiết trụ, nhất định phải được tuyển chọn a!
 
Vương Lâm cảm giác thân mình nhẹ đi, trận gió kịch liệt thổi trên mặt làm hắn đau nhức, nhìn kỹ, lập tức khiếp sợ phát hiện chính mình cư nhiên bị kẹp ở dưới bên nách thanh niên, đang ở không trung phi nhanh về phía trước, trên mặt đất thôn trang biến thành một đám điểm đen như một bàn tay lớn, hướng về phía sau di động rất nhanh.
 
Liền như vậy được một lát, con mắt hắn cũng đã bị gió thổi làm đỏ bừng, nước mắt ào ào chảy xuống.
 
- Các ngươi ba cái không muốn con mắt bị mù đi, thì nhắm mắt lại. Thanh âm niên thanh lạnh như băng truyền đến. Vương Lâm trong lòng run lên, vội vàng nhắm hai mắt lại, không dám tiếp tục nhìn, trong lòng đối với tu tiên, càng thêm mong đợi.
 
Không lâu sau, Vương Lâm có thể cảm giác được thanh niên có chút thở dốc, tốc độ cũng rõ ràng chậm xuống, tiếp theo liền thấy hoa mắt, thanh niên cấp tốc hạ xuống, ở khoảng khắc rơi xuống đất, thanh niên buông cánh tay ra, ba cái thiếu niên té trên mặt đất.
 
Cũng may lực đạo té xuống không lớn, ba người vội vàng bò lên, hiện ra ở Vương Lâm trước mặt, là một chỗ tựa như tiên cảnh thế ngoại đào nguyên, non xanh nước biếc, điểu ngữ hoa hương(1).Ngay phía trước, một tòa sơn phong cao vút trong mây, thiên nham cạnh tú(2), mây mù lượn lờ, nhìn không rõ diện mạo, khi thì truyền đến một hai tiếng thú kêu. Một cái thềm đá đường mòn vặn vẹo, do ngọn núi uốn lượn mà thành, giống như đứng giữa bức tranh phong cảnh, sơn minh thủy tú(3). Một loại cảm giác cách thế khoan thai mà sống.
 
Xa xa hướng về phía trước nhìn lại, trên đỉnh sơn phong có tòa đại điện, tuy nói bị mây mù che lấp, nhưng từng trận thất thải quang mang lóe ra, làm cho người ta vừa thấy không khỏi mọc lên ý niệm cúng bái.
 
Bên cạnh đại điện, một cái cầu đá dài liên tục xuất hiện mà ra phảng phất như trăng rằm, kéo dài tới bên trong mây mù hư ảo, cùng một tòa sơn phong khác tương liên.
 
Danh lam thắng cảnh như vậy, tự nhiên chính là nơi tọa lạc của Hằng Nhạc Phái, Hằng Nhạc Phái là một trong số không nhiều lắm tu chân môn phái của Triệu quốc, 500 năm trước từng một lần thống lĩnh toàn bộ Tu Chân Giới Triệu quốc, có được mấy vị Nguyên Anh kỳ lão quái, phong quang vô hạn, đáng tiếc lả theo thời gian trôi qua, trung gian trải qua vô số tràng biến cố, cho đến ngày nay, thương thiên đại phái ngày trước, đã muốn suy thoái đến mức chỉ có thể miễn cưỡng ở Tu Chân Giới đứng vững gót chân.
 
Nhưng mà mặc dù như vậy, Hằng Nhạc Phái đối với phàm nhân trong vòng vạn dặm xung quanh mà nói, như cũ vẫn là mong muốn mà không thể thành.
 
- Trương sư đệ, ba cái thiếu niên này chính là Vương gia đề cử? Một cái trung niên nhân mặc hắc y, mang theo một tia khí tiên phong đạo cốt, từ sơn phong hạ xuống nhẹ nhàng ma tới.
 
Thanh niên trên mặt lộ ra vẻ cung kính, nói:
 
- Tam sư huynh, ba người này đúng là Vương gia đề cử.
 
Trung niên nhân ánh mắt đảo qua, ở trên người Vương Trác nhìn đi nhìn lại vài lần, lại cười nói:
 
- Chưởng môn biết ngươi tu luyện đến chỗ then chốt, để cho ta tới tiến hành trắc thí lần này, ngươi đi tu luyện đi.
 
Thanh niên đồng ý, thân thể vừa động, theo đường mòn sơn phong, trong chớp mắt liền biến mất vô ảnh.
 
Vương Lâm ngơ ngác nhìn trước mắt một màn, cảm xúc sôi trào, bỗng cảm thấy có nhân kéo y phục mình, quay đầu vừa nhìn, đúng là cái thiếu niên có vẻ mặt lanh lợi kia, thiếu niên trong mắt vẻ cuồng nhiệt càng đậm, thấp giọng nói:
 
- Đây là địa phương tiên nhân cư trú, mụ nội nó, Vương Hạo hắn nói cái gì đã được lựa chọn! Nói xong, hắn sờ sờ nội y căng phồng của mình.
 
(1) điểu ngữ hoa hương: chim kêu thật êm tai, hoa nở thật thơm nức (2) thiên nham cạnh tú: ngàn vách núi thi nhau mà mọc lên (3) sơn minh thủy tú: cảnh núi tươi đẹp, cảnh sông tú lệ.', NULL)
INSERT [dbo].[Chapter] ([ChapterID], [BookID], [NumberChapter], [ChapterName], [Contents_1], [Contents_2], [status]) VALUES (5, 2, 3, N'Trắc thí', N'Vương Trác đối với cảnh tượng trước mắt, cũng là ngay tại chỗ giật mình, sau một hồi tinh thần mới thả lỏng, trong lòng ngạo khí bất giác thu liễm đi rất nhiều.
 
Lúc này, lại có vài đạo trường hồng kiếm quang tới gần, sau khi từng đạo kiếm quang tiêu tán, đệ tử Hằng Nhạc Phái đều đã xuất hiện, ở bên người bọn họ, cũng không ngoại lệ mang theo vài cái thiếu niên mười lăm mười sáu tuổi .
 
Những người này có nam có nữ, ở khoảng khắc hạ xuống cũng đều là như Vương Lâm ba người, ngơ ngác nhìn cảnh vật trước mắt, trên mặt biểu tình không giống nhau.
 
Đệ tử Hằng Nhạc Phái mang mọi người tới này đứng rải rác ở cách đó không xa, lẫn nhau nói chuyện với nhau đánh giá những thiếu niên này. Lại đợi một hồi, cuối cùng tất cả thiếu niên được đề cử đều tề tựu ở đây, lúc này trung niên nhân hắc y nhìn lướt qua mọi người, thanh âm không chứa bất cứ cảm tình nào, nói:
 
- Bên trong các ngươi, chỉ có cực ít vài cái sẽ được tuyển chọn trở thành đệ tử Hằng Nhạc Phái chúng ta.
 
Chúng thiếu niên sợ hãi kinh sợ, trong lòng Vương Lâm lại thấp thỏm, hắn đã đếm được, trắc thí tổng cộng 48 người.
 
- Tu tiên, trọng nhất thiên tư, tiếp đến là hạng trắc thí thứ nhất, chính là xem các ngươi linh căn có đầy đủ không. Hiện tại ta điểm đến ai, người đó đi ra đến trước mặt ta. Trung niên nhân mặt không chút thay đổi, tùy ý gọi một cái thiếu niên.
 
Thiếu niên hai chân khẽ run, thật cẩn thận tiến đến, tay trung niên nhân đặt trên đỉnh đầu thiếu niên, thản nhiên nói:
 
- Không hợp cách, đến bên trái đứng.
 
Thiếu niên hình như lập tức mất đi tất cả khí lực, vẻ mặt ảm đạm, trên mắt mang theo vẻ mờ mịt đi đến bên trái, trầm mặc không nói.Tiếp theo lại một cái thiếu niên bị điểm trúng, thấp thỏm lo lắng tiến lên.
 
- Không hợp cách.
 
- Không hợp cách.
 
- Không hợp cách.Liên tục hơn mười cái nhân, cũng đều không hợp cách, bên phải trung niên nhân, đến bây giờ đến một người cũng không có.
 
Vương Trác bị điểm trúng, trên mặt hắn ngạo khí thu hết, sắc mặt có chút tái nhợt, đi lên trước.
 
Trung niên nhân sau khi tay đặt ở Vương Trác trên đầu, bỗng nhiên sắc mặt lộ vẻ vui mừng, ngữ khí ôn hòa, nói:
 
- Ngươi tên là gì?
 
Vương Trác vội vàng cung kính nói:
 
- Hồi bẩm thượng tiên, tiểu tử Vương Trác.
 
Trung niên nhân gật đầu, cười nói:
 
- Nguyên lai ngươi chính là Vương Trác Đạo Hư sư thúc từng nhắc đến, ân, đến bên phải đứng đi.
 
Vương Trác mừng rỡ, ở trong ánh mắt hâm mộ của mọi người, đi về bên phải, trong mắt ngạo khí lại hiện ra, khinh miệt nhìn mọi người, vẻ mặt ngông cuồn tự đại.
 
- Mẹ nó, hắn đúng là chó ngáp phải ruồi. Vương Hạo bĩu môi, hướng Vương Lâm thấp giọng nói.
 
Vương Lâm trong lòng càng thêm khẩn trương, trước mắt hắn hiện lên ánh mắt kỳ vọng của phụ mẫu, nắm chặt nắm tay.
 
- Không sai, ngươi cũng đi qua bên phải đứng. Thanh âm kinh hỉ của trung niên nhân truyền đến, ở trước mặt hắn là một cái cô gái.
 
Thời gian trôi qua không lâu, đại bộ phận thiếu niên đều được trắc thí hết, có thể đứng ở bên phải trung niên nhân, chỉ có hai người. Kế tiếp, Vương Hạo bị điểm trúng.
 
Vương Hạo một mạch chạy chậm, đứng ở trước mặt trung niên nhân, không đợi đối phương trắc nghiệm, lập tức quỳ trên mặt đất dập đầu vài cái thật mạnh, lớn tiếng nói:
 
- Thượng tiên tiên phúc vĩnh hưởng, thọ cùng trời đất, tiểu tử Vương Hạo, ngài trắc thí nhiều người như vậy, nhất định rất vất vả, nếu không ngài nghỉ ngơi một hồi? Ta không nóng vội, không có việc gì.
 
Trung niên nhân không nhịn được cưởi, trắc thí nhiều người như vậy, cũng đều là vẻ mặt khẩn trương, chỉ riêng thiếu niên khoẻ mạnh kháu khỉnh trước mắt này, lanh lợi nhất, cư nhiên còn tâng bốc nịnh nọt có mục đích. Tay đặt ở trên đầu Vương Hạo, hắn lắc đầu nói:- Tư chất kém chút, không.
 
Vương Hạo vừa nghe nói tư chất mình không được, trong lòng lập tức như ngã xuống sơn cốc, không đợi đối phương nói xong, lập tức từ trong ngực lấy ra một cái hộp ngọc, hai tay nâng lên, lanh lợi nói:
 
- Thượng tiên, đây là gia phụ ngẫu nhiên ở trong núi được đến, thử đập nhiều lần đều không vỡ, tiểu tử đặc biệt từ trong nhà mang đến, hiến cho thượng tiên ngài.
 
Trung niên nhân lắc đầu cười khẽ, đang muốn cự tuyệt, nhưng đảo qua hộp ngọc, bỗng nhiên đồng tử một trận co rút lại, nắm lên nhìn kỹ, nhất thời mặt lộ mặt lộ hẻ sắc, nói:
 
- Không sai, cư nhiên là một gốc cây linh chi có 300 năm, xem hộp ngọc này bộ dáng, đúng là bị người tu chân phong ấn ở bên trong, khó trách phụ thân ngươi đập không vỡ.
 
Hắn ngữ khí ngừng một chút, thoáng trầm ngâm, lại cười nói:
 
- Ta bên người thiếu cái tiểu đồng luyện đan, ta xem ngươi có vẻ thông minh, có đồng ý làm tiểu đồng của ta không?', N'Vương Hạo lập tức kinh hỉ đứng lên, thiếu chút nữa nhảy cẩng lên, làm cho hắn kích động không thôi, lớn tiếng nói:
 
- Nguyện ý, Thượng tiên, ta nguyện ý.
 
Trung niên nhân gật đầu mỉm cười, nói:
 
- Làm dược đồng của ta, cũng sẽ không bạc đãi ngươi, có thể cùng với đám đệ tử nội môn tu luyện một loại tiên thuật, ngươi đứng ở bên phải đi.
 
Vương hạo trong lòng hưng phấn, chạy đến bên phải, dương dương đắc ý trừng mắt nhìn Vương Trác một cái.
 
Tất cả người thất bại, cũng đều mặt lộ ra vẻ tỉnh táo, một đám ôm đầu thất vọng, thậm chí có người, đã rơi lệ đầy mặt, khóc không ngừng.
 
Trung niên nhân nhướng mày, quát:
 
- Kẻ khóc, trực tiếp đưa đi!
 
Đứng ở cách đó không xa đệ tử Hằng Nhạc Phái, lập tức đi ra mấy người, nắm lên vài kẻ khóc lóc, thờ ơ đạp kiếm quang nhanh chóng biến mất.
 
Trung niên nhân tùy tay chỉ một cái, điểm trúng Vương Lâm.
 
Vương Lâm thở sâu, vạn phần khẩn trương đi đến bên người trung niên nhân, trong đầu hắn trống rỗng, trong lòng lặng lẽ cầu nguyện, trước mắt không nhịn được hồi tưởng lại ánh mắt kỳ vọng của cha mẹ.Ta nhất định có thể được tuyển chọn! Vương Lâm kiên định nghĩ đến.
 
Tay đối phương nhấn một cái, mặt không chút thay đổi phun ra ba chữ làm cho Vương Lâm rơi xuống hầm băng.
 
- Không hợp cách!
 
Vương Lâm không biết chính mình là đi như thế nào đến trong đội ngũ bên phải, hắn chỉ cảm thấy giống như sấm sét ầm ầm vang lên bên tai, ba chữ kia vẫn cứ lượn lờ quanh quẩn lên xuống.
 
Chừng một hồi, tất cả mọi người được trắc thí hết, đứng ở bên phải, chỉ có ba người, này ba người, ở trong mắt người thất bại, giống như một loại thiên chi kiêu tử, cao lớn vô cùng.
 
Vương Trác lại khinh miệt nhìn Vương Lâm, trong mắt biểu lộ ý mỉa mai không thể nghi ngờ.
 
- Tu tiên, tư chất tuy rằng trọng yếu, nhưng nghị lực lại càng quan trọng, những thiếu niên như các ngươi tư chất bình thường, nhưng nếu có đủ nghị lực, cũng đều có thể trở thành ký danh đệ tử! Này hạng trắc thí thứ hai, chính là nghị lực!
 
Trung niên nhân mặt không chút thay đổi, ngừng một chút, lại nói:
 
- Theo cầu thang nơi này đi lên, người đi tới đỉnh, tính là đủ tư cách, nếu ngày thứ ba vẫn vẫn chưa hoàn thành, chính là thất bại, kẻ thất bại từng người sẽ bị đuổi về gia tộc các ngươi. Nếu nửa đường kiên trì không được hoặc là gặp phải nguy hiểm, liền lớn tiếng la lên bỏ cuộc, tự động có người đem ngươi mang đi.
 
Nói xong, trung niên nhân mỉm cười nhìn ba người bên phải, nói:
 
- Các ngươi theo ta đi gặp chưởng môn, đến lúc đó sẽ theo an bài của sư phụ, Vương Hạo, ngươi không được đi, theo ta đi đan phòng, làm quen một chút thao tác.
 
Trung niên nhân phân phó xong, liền mang theo ba cái thiên chi kiêu tử bước lên sơn phong, tiêu thất biệt tích.
 
Vương Lâm thở sâu, ánh mắt kiên định, không chút do dự giẫm chân hướng thềm đá đi đến, tiến hành hạng trắc thí thứ hai, nghị lực.
 
Trừ bỏ ba cái thiên chi kiêu tử cùng với sáu cái cái khóc lóc thiếu niên bị đưa đi ra, còn còn lại 39 người.
 
Trong 39 người này có người ôm đầu thất vọng, cũng có kẻ thần sắc kiên nghị, cũng có kẻ do dự sợ hãi, trước sau không giống nhau, dần dần bước lên cầu thang, thời gian đi lên của từng người cũng khác nhau.', NULL)
INSERT [dbo].[Chapter] ([ChapterID], [BookID], [NumberChapter], [ChapterName], [Contents_1], [Contents_2], [status]) VALUES (6, 2, NULL, N'3', N'3', N'3', NULL)
GO
SET IDENTITY_INSERT [dbo].[Feedback] ON 

INSERT [dbo].[Feedback] ([feedbackID], [userID], [title], [description]) VALUES (13, 13, 3, N'Thiếu Thông Tin Chapter rồi')
INSERT [dbo].[Feedback] ([feedbackID], [userID], [title], [description]) VALUES (15, NULL, 3, N'hay')
INSERT [dbo].[Feedback] ([feedbackID], [userID], [title], [description]) VALUES (16, NULL, 5, N'Khong dang ky tai khoan duoc')
INSERT [dbo].[Feedback] ([feedbackID], [userID], [title], [description]) VALUES (17, 13, 3, N'Thieu thong tin Truyen Cau Ma')
SET IDENTITY_INSERT [dbo].[Feedback] OFF
GO
SET IDENTITY_INSERT [dbo].[PayChapter] ON 

INSERT [dbo].[PayChapter] ([payId], [userID], [chapterId], [payDate]) VALUES (3, 3, 0, CAST(N'2024-03-11T11:55:02.860' AS DateTime))
INSERT [dbo].[PayChapter] ([payId], [userID], [chapterId], [payDate]) VALUES (4, 13, 6, CAST(N'2024-03-17T23:01:52.387' AS DateTime))
SET IDENTITY_INSERT [dbo].[PayChapter] OFF
GO
INSERT [dbo].[Reading] ([userID], [bookid], [chapterid], [readingDate]) VALUES (3, 1, 0, CAST(N'2024-03-08T07:59:45.747' AS DateTime))
INSERT [dbo].[Reading] ([userID], [bookid], [chapterid], [readingDate]) VALUES (3, 2, 1, CAST(N'2024-03-08T08:00:33.743' AS DateTime))
INSERT [dbo].[Reading] ([userID], [bookid], [chapterid], [readingDate]) VALUES (13, 2, 6, CAST(N'2024-03-17T23:01:57.180' AS DateTime))
INSERT [dbo].[Reading] ([userID], [bookid], [chapterid], [readingDate]) VALUES (13, 1, 0, CAST(N'2024-03-09T00:00:00.000' AS DateTime))
INSERT [dbo].[Reading] ([userID], [bookid], [chapterid], [readingDate]) VALUES (11, 1, 0, CAST(N'2024-03-11T14:13:40.980' AS DateTime))
INSERT [dbo].[Reading] ([userID], [bookid], [chapterid], [readingDate]) VALUES (3, 1, 2, CAST(N'2024-03-11T15:14:41.430' AS DateTime))
INSERT [dbo].[Reading] ([userID], [bookid], [chapterid], [readingDate]) VALUES (3, 2, 3, CAST(N'2024-03-11T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Report] ([userID], [bookId], [problem], [chapter], [detail]) VALUES (3, 1, 1, N'3', NULL)
INSERT [dbo].[Report] ([userID], [bookId], [problem], [chapter], [detail]) VALUES (3, 2, 1, N'2', NULL)
INSERT [dbo].[Report] ([userID], [bookId], [problem], [chapter], [detail]) VALUES (3, 3, 2, N'2', NULL)
INSERT [dbo].[Report] ([userID], [bookId], [problem], [chapter], [detail]) VALUES (3, 2, 2, N'3', NULL)
INSERT [dbo].[Report] ([userID], [bookId], [problem], [chapter], [detail]) VALUES (13, 9, 1, N'1', NULL)
GO
INSERT [dbo].[ReportType] ([reportId], [reportType]) VALUES (1, N'Ko đọc được nội dung')
INSERT [dbo].[ReportType] ([reportId], [reportType]) VALUES (2, N'Sai chính tả')
INSERT [dbo].[ReportType] ([reportId], [reportType]) VALUES (3, N'Thiếu thông tin')
INSERT [dbo].[ReportType] ([reportId], [reportType]) VALUES (4, N'Nội dung có vấn đề')
INSERT [dbo].[ReportType] ([reportId], [reportType]) VALUES (5, N'Không đăng ký tài khoản được')
INSERT [dbo].[ReportType] ([reportId], [reportType]) VALUES (6, N'Không mua được truyện')
INSERT [dbo].[ReportType] ([reportId], [reportType]) VALUES (7, N'Khác')
INSERT [dbo].[ReportType] ([reportId], [reportType]) VALUES (8, N'Khôi phục tài khoản')
GO
SET IDENTITY_INSERT [dbo].[Response] ON 

INSERT [dbo].[Response] ([responseId], [userID], [title], [detail], [responseTime]) VALUES (1, 16, N'Yêu cầu sửa lỗi', N'Chương 16 sai chính tả', CAST(N'2024-03-11T18:18:26.577' AS DateTime))
INSERT [dbo].[Response] ([responseId], [userID], [title], [detail], [responseTime]) VALUES (7, 3, N'Yêu cầu sửa lỗi', N'Admin đã thông báo đến người đăng truyện', CAST(N'2024-03-11T18:29:29.683' AS DateTime))
INSERT [dbo].[Response] ([responseId], [userID], [title], [detail], [responseTime]) VALUES (8, 3, N'asd', N'123', CAST(N'2024-03-11T18:30:29.093' AS DateTime))
INSERT [dbo].[Response] ([responseId], [userID], [title], [detail], [responseTime]) VALUES (9, 3, N'asd', N'123', CAST(N'2024-03-11T18:30:39.270' AS DateTime))
INSERT [dbo].[Response] ([responseId], [userID], [title], [detail], [responseTime]) VALUES (10, 3, N'Yêu cầu sửa lỗi', N'Admin đã thông báo đến người đăng truyện', CAST(N'2024-03-11T18:35:03.593' AS DateTime))
SET IDENTITY_INSERT [dbo].[Response] OFF
GO
INSERT [dbo].[Role] ([roleID], [roleName]) VALUES (0, N'Admin')
INSERT [dbo].[Role] ([roleID], [roleName]) VALUES (1, N'User')
INSERT [dbo].[Role] ([roleID], [roleName]) VALUES (2, N'VIP')
INSERT [dbo].[Role] ([roleID], [roleName]) VALUES (3, N'BAN')
INSERT [dbo].[Role] ([roleID], [roleName]) VALUES (4, N'Wait for delete')
GO
INSERT [dbo].[SavedBook] ([userID], [bookID]) VALUES (11, 2)
INSERT [dbo].[SavedBook] ([userID], [bookID]) VALUES (3, 1)
GO
INSERT [dbo].[Tag] ([TagID], [Tagname]) VALUES (1, N'Hài Hước')
INSERT [dbo].[Tag] ([TagID], [Tagname]) VALUES (2, N'Drama')
INSERT [dbo].[Tag] ([TagID], [Tagname]) VALUES (3, N'Đam mỹ')
INSERT [dbo].[Tag] ([TagID], [Tagname]) VALUES (4, N'Bách hợp')
GO
SET IDENTITY_INSERT [dbo].[Tag_in_book] ON 

INSERT [dbo].[Tag_in_book] ([id], [TagID], [BookID]) VALUES (1, 1, 1)
INSERT [dbo].[Tag_in_book] ([id], [TagID], [BookID]) VALUES (2, 2, 1)
INSERT [dbo].[Tag_in_book] ([id], [TagID], [BookID]) VALUES (3, 3, 1)
INSERT [dbo].[Tag_in_book] ([id], [TagID], [BookID]) VALUES (4, 1, 2)
INSERT [dbo].[Tag_in_book] ([id], [TagID], [BookID]) VALUES (5, 2, 2)
INSERT [dbo].[Tag_in_book] ([id], [TagID], [BookID]) VALUES (6, 3, 2)
INSERT [dbo].[Tag_in_book] ([id], [TagID], [BookID]) VALUES (7, 4, 3)
INSERT [dbo].[Tag_in_book] ([id], [TagID], [BookID]) VALUES (8, 3, 3)
SET IDENTITY_INSERT [dbo].[Tag_in_book] OFF
GO
SET IDENTITY_INSERT [dbo].[TransactionHistory] ON 

INSERT [dbo].[TransactionHistory] ([TransactionID], [UserID], [Amount], [TransactionType], [TransactionDate]) VALUES (1, 13, CAST(10000.00 AS Decimal(10, 2)), 2, CAST(N'2024-03-15T05:40:35.000' AS DateTime))
INSERT [dbo].[TransactionHistory] ([TransactionID], [UserID], [Amount], [TransactionType], [TransactionDate]) VALUES (3, 3, CAST(20000.00 AS Decimal(10, 2)), 1, CAST(N'2024-03-15T05:40:35.000' AS DateTime))
INSERT [dbo].[TransactionHistory] ([TransactionID], [UserID], [Amount], [TransactionType], [TransactionDate]) VALUES (6, 13, CAST(130000.00 AS Decimal(10, 2)), 1, CAST(N'2024-03-15T05:40:35.000' AS DateTime))
INSERT [dbo].[TransactionHistory] ([TransactionID], [UserID], [Amount], [TransactionType], [TransactionDate]) VALUES (8, 13, CAST(10000.00 AS Decimal(10, 2)), 2, CAST(N'2024-03-15T08:34:19.000' AS DateTime))
INSERT [dbo].[TransactionHistory] ([TransactionID], [UserID], [Amount], [TransactionType], [TransactionDate]) VALUES (12, 13, CAST(10000.00 AS Decimal(10, 2)), 2, CAST(N'2024-03-15T08:45:38.000' AS DateTime))
INSERT [dbo].[TransactionHistory] ([TransactionID], [UserID], [Amount], [TransactionType], [TransactionDate]) VALUES (13, 13, CAST(10000.00 AS Decimal(10, 2)), 2, CAST(N'2024-03-15T08:56:09.000' AS DateTime))
INSERT [dbo].[TransactionHistory] ([TransactionID], [UserID], [Amount], [TransactionType], [TransactionDate]) VALUES (14, 13, CAST(70000.00 AS Decimal(10, 2)), 2, CAST(N'2024-03-15T08:59:04.000' AS DateTime))
INSERT [dbo].[TransactionHistory] ([TransactionID], [UserID], [Amount], [TransactionType], [TransactionDate]) VALUES (16, 13, CAST(100000.00 AS Decimal(10, 2)), 1, CAST(N'2024-03-15T09:03:42.000' AS DateTime))
INSERT [dbo].[TransactionHistory] ([TransactionID], [UserID], [Amount], [TransactionType], [TransactionDate]) VALUES (17, 13, CAST(2000000.00 AS Decimal(10, 2)), 2, CAST(N'2024-03-15T09:45:49.000' AS DateTime))
INSERT [dbo].[TransactionHistory] ([TransactionID], [UserID], [Amount], [TransactionType], [TransactionDate]) VALUES (1013, 13, CAST(10000.00 AS Decimal(10, 2)), 2, CAST(N'2024-03-20T03:36:57.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[TransactionHistory] OFF
GO
INSERT [dbo].[TransactionType] ([TransactionTypeID], [TransactionTypeName]) VALUES (1, N'Nạp Tiền')
INSERT [dbo].[TransactionType] ([TransactionTypeID], [TransactionTypeName]) VALUES (2, N'Rút Tiền')
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([userID], [userName], [password], [address], [phone], [email], [transaction], [avatar], [roleID]) VALUES (1, N'Admin1', N'6NWFIsI1V5KNFeeazNcq35qxRUE=', NULL, NULL, NULL, 0, NULL, 0)
INSERT [dbo].[User] ([userID], [userName], [password], [address], [phone], [email], [transaction], [avatar], [roleID]) VALUES (2, N'Admin2', N'6NWFIsI1V5KNFeeazNcq35qxRUE=', NULL, NULL, NULL, 0, NULL, 0)
INSERT [dbo].[User] ([userID], [userName], [password], [address], [phone], [email], [transaction], [avatar], [roleID]) VALUES (3, N'User1', N'6NWFIsI1V5KNFeeazNcq35qxRUE=', N'Hà Nội', N'01234567893', N'nqs190503@gmail.com', 232000, N'images\99780b92d94b3ae73f35e1e034866420.jpg', 1)
INSERT [dbo].[User] ([userID], [userName], [password], [address], [phone], [email], [transaction], [avatar], [roleID]) VALUES (11, N'su', N'6NWFIsI1V5KNFeeazNcq35qxRUE=', NULL, NULL, NULL, 0, NULL, 4)
INSERT [dbo].[User] ([userID], [userName], [password], [address], [phone], [email], [transaction], [avatar], [roleID]) VALUES (12, N'mra', N'6NWFIsI1V5KNFeeazNcq35qxRUE=', NULL, NULL, NULL, 0, NULL, 3)
INSERT [dbo].[User] ([userID], [userName], [password], [address], [phone], [email], [transaction], [avatar], [roleID]) VALUES (13, N'user2', N'6NWFIsI1V5KNFeeazNcq35qxRUE=', N'Thanh Hóa', N'0346842666', N'user2@gmail.com', 158000, N'images\911401.jpg', 1)
INSERT [dbo].[User] ([userID], [userName], [password], [address], [phone], [email], [transaction], [avatar], [roleID]) VALUES (16, N'mra', N'6NWFIsI1V5KNFeeazNcq35qxRUE=', N'Thanh Hoa', N'03462771234', N'mra@gmail.com', 2000, N'images\anh-man-hinh-desktop.jpg', 1)
INSERT [dbo].[User] ([userID], [userName], [password], [address], [phone], [email], [transaction], [avatar], [roleID]) VALUES (17, N'admin', N'6NWFIsI1V5KNFeeazNcq35qxRUE=', NULL, NULL, NULL, 0, NULL, 0)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
INSERT [dbo].[view_logs] ([account_id], [book_id]) VALUES (3, 3)
INSERT [dbo].[view_logs] ([account_id], [book_id]) VALUES (3, 4)
INSERT [dbo].[view_logs] ([account_id], [book_id]) VALUES (3, 5)
INSERT [dbo].[view_logs] ([account_id], [book_id]) VALUES (3, 6)
INSERT [dbo].[view_logs] ([account_id], [book_id]) VALUES (3, 7)
INSERT [dbo].[view_logs] ([account_id], [book_id]) VALUES (3, 8)
INSERT [dbo].[view_logs] ([account_id], [book_id]) VALUES (3, 9)
INSERT [dbo].[view_logs] ([account_id], [book_id]) VALUES (3, 10)
INSERT [dbo].[view_logs] ([account_id], [book_id]) VALUES (13, 1)
INSERT [dbo].[view_logs] ([account_id], [book_id]) VALUES (13, 2)
INSERT [dbo].[view_logs] ([account_id], [book_id]) VALUES (13, 3)
INSERT [dbo].[view_logs] ([account_id], [book_id]) VALUES (13, 4)
INSERT [dbo].[view_logs] ([account_id], [book_id]) VALUES (13, 5)
INSERT [dbo].[view_logs] ([account_id], [book_id]) VALUES (13, 6)
INSERT [dbo].[view_logs] ([account_id], [book_id]) VALUES (13, 7)
INSERT [dbo].[view_logs] ([account_id], [book_id]) VALUES (13, 8)
INSERT [dbo].[view_logs] ([account_id], [book_id]) VALUES (13, 9)
INSERT [dbo].[view_logs] ([account_id], [book_id]) VALUES (13, 19)
INSERT [dbo].[view_logs] ([account_id], [book_id]) VALUES (16, 2)
INSERT [dbo].[view_logs] ([account_id], [book_id]) VALUES (16, 3)
INSERT [dbo].[view_logs] ([account_id], [book_id]) VALUES (16, 7)
INSERT [dbo].[view_logs] ([account_id], [book_id]) VALUES (16, 8)
INSERT [dbo].[view_logs] ([account_id], [book_id]) VALUES (16, 9)
GO
INSERT [dbo].[VipTime] ([userID], [startDate], [endDate]) VALUES (13, CAST(N'2024-03-20T03:43:52.733' AS DateTime), CAST(N'2024-03-20T06:43:52.733' AS DateTime))
GO
ALTER TABLE [dbo].[BanComment]  WITH CHECK ADD  CONSTRAINT [FK_BanComment_BanCommentType] FOREIGN KEY([problem])
REFERENCES [dbo].[BanCommentType] ([banId])
GO
ALTER TABLE [dbo].[BanComment] CHECK CONSTRAINT [FK_BanComment_BanCommentType]
GO
ALTER TABLE [dbo].[BanComment]  WITH CHECK ADD  CONSTRAINT [FK_BanComment_Response] FOREIGN KEY([userID])
REFERENCES [dbo].[Response] ([responseId])
GO
ALTER TABLE [dbo].[BanComment] CHECK CONSTRAINT [FK_BanComment_Response]
GO
ALTER TABLE [dbo].[Book]  WITH CHECK ADD  CONSTRAINT [FK_Book_User] FOREIGN KEY([userID])
REFERENCES [dbo].[User] ([userID])
GO
ALTER TABLE [dbo].[Book] CHECK CONSTRAINT [FK_Book_User]
GO
ALTER TABLE [dbo].[Category_in_book]  WITH CHECK ADD  CONSTRAINT [FK_Category_in_book_Book] FOREIGN KEY([BookID])
REFERENCES [dbo].[Book] ([bookID])
GO
ALTER TABLE [dbo].[Category_in_book] CHECK CONSTRAINT [FK_Category_in_book_Book]
GO
ALTER TABLE [dbo].[Category_in_book]  WITH CHECK ADD  CONSTRAINT [FK_Category_in_book_Category] FOREIGN KEY([CateID])
REFERENCES [dbo].[Category] ([CateID])
GO
ALTER TABLE [dbo].[Category_in_book] CHECK CONSTRAINT [FK_Category_in_book_Category]
GO
ALTER TABLE [dbo].[Chapter]  WITH CHECK ADD  CONSTRAINT [FK_Chapter_Book] FOREIGN KEY([BookID])
REFERENCES [dbo].[Book] ([bookID])
GO
ALTER TABLE [dbo].[Chapter] CHECK CONSTRAINT [FK_Chapter_Book]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Book] FOREIGN KEY([bookID])
REFERENCES [dbo].[Book] ([bookID])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_Book]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_User1] FOREIGN KEY([userID])
REFERENCES [dbo].[User] ([userID])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_User1]
GO
ALTER TABLE [dbo].[Contact]  WITH CHECK ADD  CONSTRAINT [FK_Contact_User] FOREIGN KEY([userID])
REFERENCES [dbo].[User] ([userID])
GO
ALTER TABLE [dbo].[Contact] CHECK CONSTRAINT [FK_Contact_User]
GO
ALTER TABLE [dbo].[DeletedUser]  WITH CHECK ADD  CONSTRAINT [FK_DeletedUser_User] FOREIGN KEY([userID])
REFERENCES [dbo].[User] ([userID])
GO
ALTER TABLE [dbo].[DeletedUser] CHECK CONSTRAINT [FK_DeletedUser_User]
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [FK_Feedback_ReportType] FOREIGN KEY([title])
REFERENCES [dbo].[ReportType] ([reportId])
GO
ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [FK_Feedback_ReportType]
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [FK_Feedback_User] FOREIGN KEY([userID])
REFERENCES [dbo].[User] ([userID])
GO
ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [FK_Feedback_User]
GO
ALTER TABLE [dbo].[PayChapter]  WITH CHECK ADD  CONSTRAINT [FK_PayChapter_Chapter] FOREIGN KEY([chapterId])
REFERENCES [dbo].[Chapter] ([ChapterID])
GO
ALTER TABLE [dbo].[PayChapter] CHECK CONSTRAINT [FK_PayChapter_Chapter]
GO
ALTER TABLE [dbo].[PayChapter]  WITH CHECK ADD  CONSTRAINT [FK_PayChapter_User] FOREIGN KEY([userID])
REFERENCES [dbo].[User] ([userID])
GO
ALTER TABLE [dbo].[PayChapter] CHECK CONSTRAINT [FK_PayChapter_User]
GO
ALTER TABLE [dbo].[Reading]  WITH CHECK ADD  CONSTRAINT [FK_Reading_Book] FOREIGN KEY([bookid])
REFERENCES [dbo].[Book] ([bookID])
GO
ALTER TABLE [dbo].[Reading] CHECK CONSTRAINT [FK_Reading_Book]
GO
ALTER TABLE [dbo].[Reading]  WITH CHECK ADD  CONSTRAINT [FK_Reading_Chapter] FOREIGN KEY([chapterid])
REFERENCES [dbo].[Chapter] ([ChapterID])
GO
ALTER TABLE [dbo].[Reading] CHECK CONSTRAINT [FK_Reading_Chapter]
GO
ALTER TABLE [dbo].[Reading]  WITH CHECK ADD  CONSTRAINT [FK_Reading_User] FOREIGN KEY([userID])
REFERENCES [dbo].[User] ([userID])
GO
ALTER TABLE [dbo].[Reading] CHECK CONSTRAINT [FK_Reading_User]
GO
ALTER TABLE [dbo].[Report]  WITH CHECK ADD  CONSTRAINT [FK_Report_Book] FOREIGN KEY([bookId])
REFERENCES [dbo].[Book] ([bookID])
GO
ALTER TABLE [dbo].[Report] CHECK CONSTRAINT [FK_Report_Book]
GO
ALTER TABLE [dbo].[Report]  WITH CHECK ADD  CONSTRAINT [FK_Report_ReportType] FOREIGN KEY([problem])
REFERENCES [dbo].[ReportType] ([reportId])
GO
ALTER TABLE [dbo].[Report] CHECK CONSTRAINT [FK_Report_ReportType]
GO
ALTER TABLE [dbo].[Report]  WITH CHECK ADD  CONSTRAINT [FK_Report_User] FOREIGN KEY([userID])
REFERENCES [dbo].[User] ([userID])
GO
ALTER TABLE [dbo].[Report] CHECK CONSTRAINT [FK_Report_User]
GO
ALTER TABLE [dbo].[Response]  WITH CHECK ADD  CONSTRAINT [FK_Response_User] FOREIGN KEY([userID])
REFERENCES [dbo].[User] ([userID])
GO
ALTER TABLE [dbo].[Response] CHECK CONSTRAINT [FK_Response_User]
GO
ALTER TABLE [dbo].[SavedBook]  WITH CHECK ADD  CONSTRAINT [FK_SavedBook_Book] FOREIGN KEY([bookID])
REFERENCES [dbo].[Book] ([bookID])
GO
ALTER TABLE [dbo].[SavedBook] CHECK CONSTRAINT [FK_SavedBook_Book]
GO
ALTER TABLE [dbo].[SavedBook]  WITH CHECK ADD  CONSTRAINT [FK_SavedBook_User] FOREIGN KEY([userID])
REFERENCES [dbo].[User] ([userID])
GO
ALTER TABLE [dbo].[SavedBook] CHECK CONSTRAINT [FK_SavedBook_User]
GO
ALTER TABLE [dbo].[Tag_in_book]  WITH CHECK ADD  CONSTRAINT [FK_Tag_in_book_Book] FOREIGN KEY([BookID])
REFERENCES [dbo].[Book] ([bookID])
GO
ALTER TABLE [dbo].[Tag_in_book] CHECK CONSTRAINT [FK_Tag_in_book_Book]
GO
ALTER TABLE [dbo].[Tag_in_book]  WITH CHECK ADD  CONSTRAINT [FK_Tag_in_book_Tag] FOREIGN KEY([TagID])
REFERENCES [dbo].[Tag] ([TagID])
GO
ALTER TABLE [dbo].[Tag_in_book] CHECK CONSTRAINT [FK_Tag_in_book_Tag]
GO
ALTER TABLE [dbo].[TransactionHistory]  WITH CHECK ADD  CONSTRAINT [FK__Transacti__UserI__0A688BB1] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([userID])
GO
ALTER TABLE [dbo].[TransactionHistory] CHECK CONSTRAINT [FK__Transacti__UserI__0A688BB1]
GO
ALTER TABLE [dbo].[TransactionHistory]  WITH CHECK ADD  CONSTRAINT [FK_TransactionHistory_TransactionType] FOREIGN KEY([TransactionType])
REFERENCES [dbo].[TransactionType] ([TransactionTypeID])
GO
ALTER TABLE [dbo].[TransactionHistory] CHECK CONSTRAINT [FK_TransactionHistory_TransactionType]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([roleID])
REFERENCES [dbo].[Role] ([roleID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
ALTER TABLE [dbo].[VipTime]  WITH CHECK ADD  CONSTRAINT [FK_VipTime_User] FOREIGN KEY([userID])
REFERENCES [dbo].[User] ([userID])
GO
ALTER TABLE [dbo].[VipTime] CHECK CONSTRAINT [FK_VipTime_User]
GO
USE [master]
GO
ALTER DATABASE [SWP391_G2_Project] SET  READ_WRITE 
GO
