USE [AirLineManagementSystem_db]
GO
/****** Object:  Table [dbo].[Airport]    Script Date: 28-08-2024 16:21:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Airport](
	[AirportId] [int] IDENTITY(200,1) NOT NULL,
	[AirportName] [varchar](100) NOT NULL,
	[City] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AirportId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Arrival]    Script Date: 28-08-2024 16:21:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Arrival](
	[ArrivalId] [int] IDENTITY(300,1) NOT NULL,
	[FlightId] [int] NOT NULL,
	[AirportId] [int] NOT NULL,
	[ArrivalDate] [date] NOT NULL,
	[ArrivalTime] [time](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ArrivalId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Departure]    Script Date: 28-08-2024 16:21:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departure](
	[DepartureId] [int] IDENTITY(400,1) NOT NULL,
	[FlightId] [int] NOT NULL,
	[AirportId] [int] NOT NULL,
	[DepartureDate] [date] NOT NULL,
	[DepartureTime] [time](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DepartureId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Flight]    Script Date: 28-08-2024 16:21:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Flight](
	[FlightId] [int] IDENTITY(100,1) NOT NULL,
	[FlightName] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[FlightId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FlightDetails]    Script Date: 28-08-2024 16:21:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FlightDetails](
	[FlightDetailId] [int] IDENTITY(500,1) NOT NULL,
	[DepartureId] [int] NOT NULL,
	[ArrivalId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[FlightDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 28-08-2024 16:21:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleId] [int] NOT NULL,
	[RoleName] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StoredFlightDetails]    Script Date: 28-08-2024 16:21:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StoredFlightDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FlightId] [int] NULL,
	[DepAirport] [int] NULL,
	[DepDate] [datetime] NULL,
	[DepTime] [time](7) NULL,
	[ArrAirport] [int] NULL,
	[ArrDate] [datetime] NULL,
	[ArrTime] [time](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 28-08-2024 16:21:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[Password] [varchar](255) NOT NULL,
	[RoleId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Airport] ON 

INSERT [dbo].[Airport] ([AirportId], [AirportName], [City]) VALUES (200, N'Heathrow Airport', N'London')
INSERT [dbo].[Airport] ([AirportId], [AirportName], [City]) VALUES (201, N'John F. Kennedy International Airport', N'New York')
INSERT [dbo].[Airport] ([AirportId], [AirportName], [City]) VALUES (202, N'Tokyo Haneda Airport', N'Tokyo')
INSERT [dbo].[Airport] ([AirportId], [AirportName], [City]) VALUES (203, N'Dubai International Airport', N'Dubai')
INSERT [dbo].[Airport] ([AirportId], [AirportName], [City]) VALUES (204, N'Hartsfield-Jackson Atlanta International Airport', N'Atlanta')
INSERT [dbo].[Airport] ([AirportId], [AirportName], [City]) VALUES (205, N'Sydney Kingsford Smith Airport', N'Sydney')
INSERT [dbo].[Airport] ([AirportId], [AirportName], [City]) VALUES (206, N'Changi Airport', N'Singapore')
INSERT [dbo].[Airport] ([AirportId], [AirportName], [City]) VALUES (207, N'Paris Charles de Gaulle Airport', N'Paris')
INSERT [dbo].[Airport] ([AirportId], [AirportName], [City]) VALUES (208, N'Amsterdam Schiphol Airport', N'Amsterdam')
INSERT [dbo].[Airport] ([AirportId], [AirportName], [City]) VALUES (209, N'Hong Kong International Airport', N'Hong Kong')
SET IDENTITY_INSERT [dbo].[Airport] OFF
GO
SET IDENTITY_INSERT [dbo].[Arrival] ON 

INSERT [dbo].[Arrival] ([ArrivalId], [FlightId], [AirportId], [ArrivalDate], [ArrivalTime]) VALUES (300, 100, 200, CAST(N'2024-08-30' AS Date), CAST(N'08:15:00' AS Time))
INSERT [dbo].[Arrival] ([ArrivalId], [FlightId], [AirportId], [ArrivalDate], [ArrivalTime]) VALUES (301, 101, 201, CAST(N'2024-08-31' AS Date), CAST(N'09:45:00' AS Time))
INSERT [dbo].[Arrival] ([ArrivalId], [FlightId], [AirportId], [ArrivalDate], [ArrivalTime]) VALUES (302, 102, 202, CAST(N'2024-09-01' AS Date), CAST(N'11:30:00' AS Time))
INSERT [dbo].[Arrival] ([ArrivalId], [FlightId], [AirportId], [ArrivalDate], [ArrivalTime]) VALUES (303, 103, 203, CAST(N'2024-09-02' AS Date), CAST(N'13:00:00' AS Time))
INSERT [dbo].[Arrival] ([ArrivalId], [FlightId], [AirportId], [ArrivalDate], [ArrivalTime]) VALUES (304, 104, 204, CAST(N'2024-09-03' AS Date), CAST(N'15:15:00' AS Time))
INSERT [dbo].[Arrival] ([ArrivalId], [FlightId], [AirportId], [ArrivalDate], [ArrivalTime]) VALUES (305, 105, 205, CAST(N'2024-09-04' AS Date), CAST(N'17:00:00' AS Time))
INSERT [dbo].[Arrival] ([ArrivalId], [FlightId], [AirportId], [ArrivalDate], [ArrivalTime]) VALUES (306, 106, 206, CAST(N'2024-09-05' AS Date), CAST(N'18:45:00' AS Time))
INSERT [dbo].[Arrival] ([ArrivalId], [FlightId], [AirportId], [ArrivalDate], [ArrivalTime]) VALUES (307, 107, 207, CAST(N'2024-09-06' AS Date), CAST(N'20:30:00' AS Time))
INSERT [dbo].[Arrival] ([ArrivalId], [FlightId], [AirportId], [ArrivalDate], [ArrivalTime]) VALUES (308, 108, 208, CAST(N'2024-09-07' AS Date), CAST(N'22:00:00' AS Time))
INSERT [dbo].[Arrival] ([ArrivalId], [FlightId], [AirportId], [ArrivalDate], [ArrivalTime]) VALUES (309, 109, 209, CAST(N'2024-09-08' AS Date), CAST(N'23:30:00' AS Time))
SET IDENTITY_INSERT [dbo].[Arrival] OFF
GO
SET IDENTITY_INSERT [dbo].[Departure] ON 

INSERT [dbo].[Departure] ([DepartureId], [FlightId], [AirportId], [DepartureDate], [DepartureTime]) VALUES (400, 100, 200, CAST(N'2024-08-30' AS Date), CAST(N'06:15:00' AS Time))
INSERT [dbo].[Departure] ([DepartureId], [FlightId], [AirportId], [DepartureDate], [DepartureTime]) VALUES (401, 101, 201, CAST(N'2024-08-31' AS Date), CAST(N'07:45:00' AS Time))
INSERT [dbo].[Departure] ([DepartureId], [FlightId], [AirportId], [DepartureDate], [DepartureTime]) VALUES (402, 102, 202, CAST(N'2024-09-01' AS Date), CAST(N'09:30:00' AS Time))
INSERT [dbo].[Departure] ([DepartureId], [FlightId], [AirportId], [DepartureDate], [DepartureTime]) VALUES (403, 103, 203, CAST(N'2024-09-02' AS Date), CAST(N'11:00:00' AS Time))
INSERT [dbo].[Departure] ([DepartureId], [FlightId], [AirportId], [DepartureDate], [DepartureTime]) VALUES (404, 104, 204, CAST(N'2024-09-03' AS Date), CAST(N'12:15:00' AS Time))
INSERT [dbo].[Departure] ([DepartureId], [FlightId], [AirportId], [DepartureDate], [DepartureTime]) VALUES (405, 105, 205, CAST(N'2024-09-04' AS Date), CAST(N'14:00:00' AS Time))
INSERT [dbo].[Departure] ([DepartureId], [FlightId], [AirportId], [DepartureDate], [DepartureTime]) VALUES (406, 106, 206, CAST(N'2024-09-05' AS Date), CAST(N'15:45:00' AS Time))
INSERT [dbo].[Departure] ([DepartureId], [FlightId], [AirportId], [DepartureDate], [DepartureTime]) VALUES (407, 107, 207, CAST(N'2024-09-06' AS Date), CAST(N'17:30:00' AS Time))
INSERT [dbo].[Departure] ([DepartureId], [FlightId], [AirportId], [DepartureDate], [DepartureTime]) VALUES (408, 108, 208, CAST(N'2024-09-07' AS Date), CAST(N'19:00:00' AS Time))
INSERT [dbo].[Departure] ([DepartureId], [FlightId], [AirportId], [DepartureDate], [DepartureTime]) VALUES (409, 109, 209, CAST(N'2024-09-08' AS Date), CAST(N'20:30:00' AS Time))
SET IDENTITY_INSERT [dbo].[Departure] OFF
GO
SET IDENTITY_INSERT [dbo].[Flight] ON 

INSERT [dbo].[Flight] ([FlightId], [FlightName]) VALUES (100, N'Indigo')
INSERT [dbo].[Flight] ([FlightId], [FlightName]) VALUES (101, N'Alliance Air')
INSERT [dbo].[Flight] ([FlightId], [FlightName]) VALUES (102, N'Air India')
INSERT [dbo].[Flight] ([FlightId], [FlightName]) VALUES (103, N'SpiceJet')
INSERT [dbo].[Flight] ([FlightId], [FlightName]) VALUES (104, N'GoAir')
INSERT [dbo].[Flight] ([FlightId], [FlightName]) VALUES (105, N'Vistara')
INSERT [dbo].[Flight] ([FlightId], [FlightName]) VALUES (106, N'Jet Airways')
INSERT [dbo].[Flight] ([FlightId], [FlightName]) VALUES (107, N'AirAsia')
INSERT [dbo].[Flight] ([FlightId], [FlightName]) VALUES (108, N'British Airways')
INSERT [dbo].[Flight] ([FlightId], [FlightName]) VALUES (109, N'Emirates')
SET IDENTITY_INSERT [dbo].[Flight] OFF
GO
INSERT [dbo].[Role] ([RoleId], [RoleName]) VALUES (1, N'Admin')
GO
SET IDENTITY_INSERT [dbo].[StoredFlightDetails] ON 

INSERT [dbo].[StoredFlightDetails] ([Id], [FlightId], [DepAirport], [DepDate], [DepTime], [ArrAirport], [ArrDate], [ArrTime]) VALUES (1, 100, 200, CAST(N'2024-08-30T00:00:00.000' AS DateTime), CAST(N'06:15:00' AS Time), 200, CAST(N'2024-08-30T00:00:00.000' AS DateTime), CAST(N'08:15:00' AS Time))
INSERT [dbo].[StoredFlightDetails] ([Id], [FlightId], [DepAirport], [DepDate], [DepTime], [ArrAirport], [ArrDate], [ArrTime]) VALUES (2, 100, 200, CAST(N'2024-08-30T00:00:00.000' AS DateTime), CAST(N'06:15:00' AS Time), 200, CAST(N'2024-08-30T00:00:00.000' AS DateTime), CAST(N'08:15:00' AS Time))
INSERT [dbo].[StoredFlightDetails] ([Id], [FlightId], [DepAirport], [DepDate], [DepTime], [ArrAirport], [ArrDate], [ArrTime]) VALUES (3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[StoredFlightDetails] ([Id], [FlightId], [DepAirport], [DepDate], [DepTime], [ArrAirport], [ArrDate], [ArrTime]) VALUES (4, 103, 203, CAST(N'2024-09-02T00:00:00.000' AS DateTime), CAST(N'11:00:00' AS Time), 203, CAST(N'2024-09-02T00:00:00.000' AS DateTime), CAST(N'13:00:00' AS Time))
SET IDENTITY_INSERT [dbo].[StoredFlightDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserId], [Username], [Password], [RoleId], [IsActive]) VALUES (1, N'Merin', N'Merin@123', 1, 1)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__User__536C85E44FFC653E]    Script Date: 28-08-2024 16:21:35 ******/
ALTER TABLE [dbo].[User] ADD UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Arrival]  WITH CHECK ADD  CONSTRAINT [FK_Arrival_Airport] FOREIGN KEY([AirportId])
REFERENCES [dbo].[Airport] ([AirportId])
GO
ALTER TABLE [dbo].[Arrival] CHECK CONSTRAINT [FK_Arrival_Airport]
GO
ALTER TABLE [dbo].[Arrival]  WITH CHECK ADD  CONSTRAINT [FK_Arrival_Flight] FOREIGN KEY([FlightId])
REFERENCES [dbo].[Flight] ([FlightId])
GO
ALTER TABLE [dbo].[Arrival] CHECK CONSTRAINT [FK_Arrival_Flight]
GO
ALTER TABLE [dbo].[Departure]  WITH CHECK ADD  CONSTRAINT [FK_Departure_Airport] FOREIGN KEY([AirportId])
REFERENCES [dbo].[Airport] ([AirportId])
GO
ALTER TABLE [dbo].[Departure] CHECK CONSTRAINT [FK_Departure_Airport]
GO
ALTER TABLE [dbo].[Departure]  WITH CHECK ADD  CONSTRAINT [FK_Departure_Flight] FOREIGN KEY([FlightId])
REFERENCES [dbo].[Flight] ([FlightId])
GO
ALTER TABLE [dbo].[Departure] CHECK CONSTRAINT [FK_Departure_Flight]
GO
ALTER TABLE [dbo].[FlightDetails]  WITH CHECK ADD  CONSTRAINT [FK_FlightDetails_Arrival] FOREIGN KEY([ArrivalId])
REFERENCES [dbo].[Arrival] ([ArrivalId])
GO
ALTER TABLE [dbo].[FlightDetails] CHECK CONSTRAINT [FK_FlightDetails_Arrival]
GO
ALTER TABLE [dbo].[FlightDetails]  WITH CHECK ADD  CONSTRAINT [FK_FlightDetails_Departure] FOREIGN KEY([DepartureId])
REFERENCES [dbo].[Departure] ([DepartureId])
GO
ALTER TABLE [dbo].[FlightDetails] CHECK CONSTRAINT [FK_FlightDetails_Departure]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([RoleId])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
/****** Object:  StoredProcedure [dbo].[sp_AddFlightDetail]    Script Date: 28-08-2024 16:21:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_AddFlightDetail]
    @DepartureId INT,
    @ArrivalId INT
AS
BEGIN
    INSERT INTO FlightDetails (DepartureId, ArrivalId)
    VALUES (@DepartureId, @ArrivalId);
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllArrivals]    Script Date: 28-08-2024 16:21:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetAllArrivals]
AS
BEGIN
    SELECT * FROM Arrival;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllDepartures]    Script Date: 28-08-2024 16:21:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetAllDepartures]
AS
BEGIN
    SELECT * FROM Departure;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAndStoreFlightDetails]    Script Date: 28-08-2024 16:21:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

  CREATE PROCEDURE [dbo].[sp_GetAndStoreFlightDetails]
    @DepartureId INT,
    @ArrivalId INT
AS
BEGIN
    -- Declare variables for holding the details temporarily
    DECLARE @FlightId INT, @DepAirport INT, @DepDate DATETIME, @DepTime TIME,
            @ArrAirport INT, @ArrDate DATETIME, @ArrTime TIME;

    -- Select flight details
    SELECT 
        @FlightId = d.FlightId,
        @DepAirport = d.AirportId, 
        @DepDate = d.DepartureDate, 
        @DepTime = d.DepartureTime,
        @ArrAirport = a.AirportId, 
        @ArrDate = a.ArrivalDate, 
        @ArrTime = a.ArrivalTime
    FROM Departure d
    INNER JOIN Arrival a ON d.FlightId = a.FlightId
    WHERE d.DepartureId = @DepartureId 
    AND a.ArrivalId = @ArrivalId;

    -- Insert flight details into the new table
    INSERT INTO StoredFlightDetails (FlightId, DepAirport, DepDate, DepTime, ArrAirport, ArrDate, ArrTime)
    VALUES (@FlightId, @DepAirport, @DepDate, @DepTime, @ArrAirport, @ArrDate, @ArrTime);
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetFlightDetailById]    Script Date: 28-08-2024 16:21:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_GetFlightDetailById]
    @Id INT
AS
BEGIN
    SELECT FlightDetailId, DepartureId, ArrivalId
    FROM FlightDetails
    WHERE FlightDetailId = @Id;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetFlightDetails]    Script Date: 28-08-2024 16:21:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_GetFlightDetails]
    @DepartureId INT,
    @ArrivalId INT
AS
BEGIN
    SELECT 
        d.FlightId,                                    -- FlightId from the Departure table
        d.AirportId AS DepAirport,                     -- Departure Airport ID
        da.AirportName AS DepAirportName,              -- Departure Airport Name from Airport table
        d.DepartureDate AS DepDate, 
        d.DepartureTime AS DepTime,
        a.AirportId AS ArrAirport,                     -- Arrival Airport ID
        aa.AirportName AS ArrAirportName,              -- Arrival Airport Name from Airport table
        a.ArrivalDate AS ArrDate, 
        a.ArrivalTime AS ArrTime
    FROM Departure d
    INNER JOIN Arrival a ON d.FlightId = a.FlightId   -- Joining based on FlightId
    INNER JOIN Airport da ON d.AirportId = da.AirportId  -- Joining to get Departure Airport Name
    INNER JOIN Airport aa ON a.AirportId = aa.AirportId  -- Joining to get Arrival Airport Name
    WHERE d.DepartureId = @DepartureId 
    AND a.ArrivalId = @ArrivalId;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetUserNamePassword]    Script Date: 28-08-2024 16:21:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_GetUserNamePassword]
				@UserName NVARCHAR(50),
				@Password NVARCHAR(50),
				@RoleId INT OUTPUT
			AS
			BEGIN
				SELECT @RoleId = RoleId
				FROM [User]
				WHERE UserName = @UserName
					AND Password = @Password;
			END;
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateFlightDetail]    Script Date: 28-08-2024 16:21:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_UpdateFlightDetail]
    @FlightDetailId INT,
    @DepartureId INT,
    @ArrivalId INT
AS
BEGIN
    UPDATE FlightDetails
    SET DepartureId = @DepartureId,
        ArrivalId = @ArrivalId
    WHERE FlightDetailId = @FlightDetailId;
END
GO
