USE [master]
GO
/****** Object:  Database [HOSPITAL]    Script Date: 28-Sep-17 11:31:15 ******/
CREATE DATABASE [HOSPITAL]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HOSPITAL', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\HOSPITAL.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'HOSPITAL_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\HOSPITAL_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [HOSPITAL] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HOSPITAL].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HOSPITAL] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HOSPITAL] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HOSPITAL] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HOSPITAL] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HOSPITAL] SET ARITHABORT OFF 
GO
ALTER DATABASE [HOSPITAL] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HOSPITAL] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [HOSPITAL] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HOSPITAL] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HOSPITAL] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HOSPITAL] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HOSPITAL] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HOSPITAL] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HOSPITAL] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HOSPITAL] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HOSPITAL] SET  ENABLE_BROKER 
GO
ALTER DATABASE [HOSPITAL] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HOSPITAL] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HOSPITAL] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HOSPITAL] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HOSPITAL] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HOSPITAL] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HOSPITAL] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HOSPITAL] SET RECOVERY FULL 
GO
ALTER DATABASE [HOSPITAL] SET  MULTI_USER 
GO
ALTER DATABASE [HOSPITAL] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HOSPITAL] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HOSPITAL] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HOSPITAL] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [HOSPITAL]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 28-Sep-17 11:31:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Address](
	[idAddress] [int] NOT NULL,
	[contact] [varchar](13) NULL,
	[Address1] [varchar](45) NULL,
	[Address2] [varchar](45) NULL,
	[patientID] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idAddress] ASC,
	[patientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Appointment]    Script Date: 28-Sep-17 11:31:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Appointment](
	[idAppointment] [int] NOT NULL,
	[patientID] [varchar](20) NULL,
	[status] [int] NULL,
	[date] [date] NULL,
	[time] [time](7) NULL,
	[reason_for_missing_appointment] [varchar](45) NULL,
	[Visit_idVisit] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idAppointment] ASC,
	[Visit_idVisit] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Bed]    Script Date: 28-Sep-17 11:31:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bed](
	[idBed] [int] NOT NULL,
	[id_department] [int] NULL,
	[id_ward] [int] NULL,
	[bed_status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idBed] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Department]    Script Date: 28-Sep-17 11:31:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Department](
	[idDepartment] [int] NOT NULL,
	[department_description] [varchar](45) NULL,
PRIMARY KEY CLUSTERED 
(
	[idDepartment] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Diagnosis]    Script Date: 28-Sep-17 11:31:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Diagnosis](
	[idDiagnosis] [int] NOT NULL,
	[diagnosis_description] [varchar](100) NULL,
	[doctorID] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idDiagnosis] ASC,
	[doctorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Diagnosis_has_Visit]    Script Date: 28-Sep-17 11:31:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Diagnosis_has_Visit](
	[Diagnosis_idDiagnosis] [int] NOT NULL,
	[Diagnosis_doctorID] [varchar](20) NOT NULL,
	[Visit_idVisit] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Diagnosis_idDiagnosis] ASC,
	[Diagnosis_doctorID] ASC,
	[Visit_idVisit] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Doctor]    Script Date: 28-Sep-17 11:31:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Doctor](
	[idDoctor] [varchar](20) NOT NULL,
	[doctor_name] [varchar](50) NULL,
	[specialisation] [varchar](45) NULL,
	[doctor_contact] [varchar](13) NULL,
	[doctor_email] [varchar](45) NULL,
	[departmentID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idDoctor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Doctor_has_Prescription]    Script Date: 28-Sep-17 11:31:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Doctor_has_Prescription](
	[Doctor_idDoctor] [varchar](20) NOT NULL,
	[Prescription_idPrescription] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Doctor_idDoctor] ASC,
	[Prescription_idPrescription] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Follow_up]    Script Date: 28-Sep-17 11:31:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Follow_up](
	[idFollow_up] [int] NOT NULL,
	[description] [varchar](100) NULL,
	[follow_up_date] [date] NULL,
	[Follow_up_time] [time](7) NULL,
	[Visit_idVisit] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idFollow_up] ASC,
	[Visit_idVisit] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[History]    Script Date: 28-Sep-17 11:31:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[History](
	[idFamily_history] [int] NOT NULL,
	[Patient_idPatient] [varchar](20) NOT NULL,
	[hist_type] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idFamily_history] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Lab_header]    Script Date: 28-Sep-17 11:31:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Lab_header](
	[idLab_header] [int] NOT NULL,
	[userID] [varchar](20) NULL,
	[visitID] [int] NULL,
	[lab_test_date] [date] NULL,
	[lab_test_time] [time](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[idLab_header] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Lab_test_lines]    Script Date: 28-Sep-17 11:31:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Lab_test_lines](
	[idLab_test_lines] [int] NOT NULL,
	[Lab_test_reagentID] [int] NULL,
	[Lab_test_time] [time](7) NULL,
	[Lab_test_drug_quantity] [decimal](18, 0) NULL,
	[Lab_test_UOM] [varchar](20) NULL,
	[Lab_test_cost] [decimal](18, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[idLab_test_lines] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Lab_test_results]    Script Date: 28-Sep-17 11:31:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Lab_test_results](
	[idLab_test] [int] NOT NULL,
	[Lab_test_description] [varchar](255) NULL,
	[Lab_headerID] [int] NULL,
	[Lab_test_linesID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idLab_test] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Operation]    Script Date: 28-Sep-17 11:31:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Operation](
	[idprocedure] [int] NOT NULL,
	[procedure_description] [varchar](100) NULL,
	[procedure_cost] [decimal](18, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[idprocedure] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Operation_has_Doctor]    Script Date: 28-Sep-17 11:31:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Operation_has_Doctor](
	[procedure_idprocedure] [int] NOT NULL,
	[Doctor_idDoctor] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[procedure_idprocedure] ASC,
	[Doctor_idDoctor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Patient]    Script Date: 28-Sep-17 11:31:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Patient](
	[idPatient] [varchar](20) NOT NULL,
	[Name] [varchar](50) NULL,
	[File_No] [int] NULL,
	[Phone_No] [varchar](13) NULL,
	[Address] [varchar](45) NULL,
	[Sex] [int] NULL,
	[DOB] [date] NULL,
	[Name_NOK] [varchar](50) NULL,
	[Contact_NOK] [varchar](13) NULL,
	[NOK_Relationship] [varchar](45) NULL,
	[Email] [varchar](45) NULL,
PRIMARY KEY CLUSTERED 
(
	[idPatient] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Pharmacy]    Script Date: 28-Sep-17 11:31:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Pharmacy](
	[idDrug] [int] NOT NULL,
	[drug_description] [varchar](45) NULL,
	[quantity] [decimal](18, 0) NULL,
	[userID] [varchar](20) NULL,
	[drug_cost] [decimal](18, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[idDrug] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Prescription]    Script Date: 28-Sep-17 11:31:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Prescription](
	[idPrescription] [int] NOT NULL,
	[quantity] [decimal](18, 0) NULL,
	[prescription_description] [varchar](45) NULL,
	[patientID] [varchar](20) NULL,
	[userID] [varchar](20) NULL,
	[visitID] [int] NULL,
	[Prescriptioncol] [varchar](45) NULL,
PRIMARY KEY CLUSTERED 
(
	[idPrescription] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Prescription_has_Pharmacy]    Script Date: 28-Sep-17 11:31:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prescription_has_Pharmacy](
	[Prescription_idPrescription] [int] NOT NULL,
	[Pharmacy_idDrug] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Prescription_idPrescription] ASC,
	[Pharmacy_idDrug] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Radio_Image]    Script Date: 28-Sep-17 11:31:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Radio_Image](
	[idRadio_Image] [int] NOT NULL,
	[visitID] [int] NULL,
	[imageObservation] [varchar](200) NOT NULL,
	[userID] [varchar](20) NULL,
	[image_date] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[idRadio_Image] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Sales_header]    Script Date: 28-Sep-17 11:31:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sales_header](
	[idSales_header] [int] NOT NULL,
	[customerID] [varchar](20) NULL,
	[customer_name] [varchar](50) NULL,
	[posting_date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[idSales_header] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Sales_line]    Script Date: 28-Sep-17 11:31:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sales_line](
	[idSales_line] [int] NOT NULL,
	[type] [int] NULL,
	[no] [varchar](20) NULL,
	[description] [varchar](100) NULL,
	[quantity] [decimal](18, 0) NULL,
	[amount] [decimal](18, 0) NULL,
	[Sales_header_idSales_header] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idSales_line] ASC,
	[Sales_header_idSales_header] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Triage]    Script Date: 28-Sep-17 11:31:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Triage](
	[idTriage] [int] NOT NULL,
	[height] [decimal](18, 0) NULL,
	[mass] [decimal](18, 0) NULL,
	[blood_pressure] [decimal](18, 0) NULL,
	[Triagecol] [varchar](45) NULL,
	[Visit_idVisit] [int] NOT NULL,
	[checkup_cost] [decimal](18, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[idTriage] ASC,
	[Visit_idVisit] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UOM]    Script Date: 28-Sep-17 11:31:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UOM](
	[idUOM] [varchar](20) NOT NULL,
	[UOM_description] [varchar](45) NULL,
	[quantity_per_UOM] [decimal](18, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[idUOM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UOM_has_Pharmacy]    Script Date: 28-Sep-17 11:31:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UOM_has_Pharmacy](
	[UOM_idUOM] [varchar](20) NOT NULL,
	[Pharmacy_idDrug] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UOM_idUOM] ASC,
	[Pharmacy_idDrug] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Users]    Script Date: 28-Sep-17 11:31:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[idUser] [varchar](20) NOT NULL,
	[name] [varchar](50) NULL,
	[departmentID] [int] NULL,
	[email] [varchar](45) NULL,
	[user_contact] [varchar](13) NULL,
PRIMARY KEY CLUSTERED 
(
	[idUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Visit]    Script Date: 28-Sep-17 11:31:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Visit](
	[idVisit] [int] NOT NULL,
	[patientID] [varchar](20) NULL,
	[visit_date] [date] NULL,
	[doctorID] [varchar](20) NULL,
	[procedureID] [int] NULL,
	[visit_type] [int] NULL,
	[time] [time](7) NULL,
	[Bed_idBed] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idVisit] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Visit_has_Doctor]    Script Date: 28-Sep-17 11:31:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Visit_has_Doctor](
	[Visit_idVisit] [int] NOT NULL,
	[Doctor_idDoctor] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Visit_idVisit] ASC,
	[Doctor_idDoctor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Visit_has_Operation]    Script Date: 28-Sep-17 11:31:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Visit_has_Operation](
	[Visit_idVisit] [int] NOT NULL,
	[procedure_idprocedure] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Visit_idVisit] ASC,
	[procedure_idprocedure] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Ward]    Script Date: 28-Sep-17 11:31:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Ward](
	[idWard] [int] NOT NULL,
	[ward_description] [varchar](45) NULL,
	[id_department] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idWard] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [fk_Address_Patient1_idx]    Script Date: 28-Sep-17 11:31:15 ******/
CREATE NONCLUSTERED INDEX [fk_Address_Patient1_idx] ON [dbo].[Address]
(
	[patientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [fk_Appointment_Visit1_idx]    Script Date: 28-Sep-17 11:31:15 ******/
CREATE NONCLUSTERED INDEX [fk_Appointment_Visit1_idx] ON [dbo].[Appointment]
(
	[Visit_idVisit] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [PatientID_idx]    Script Date: 28-Sep-17 11:31:15 ******/
CREATE NONCLUSTERED INDEX [PatientID_idx] ON [dbo].[Appointment]
(
	[patientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [id_department_idx]    Script Date: 28-Sep-17 11:31:15 ******/
CREATE NONCLUSTERED INDEX [id_department_idx] ON [dbo].[Bed]
(
	[id_department] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [id_ward_idx]    Script Date: 28-Sep-17 11:31:15 ******/
CREATE NONCLUSTERED INDEX [id_ward_idx] ON [dbo].[Bed]
(
	[id_ward] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [fk_Diagnosis_Doctor1_idx]    Script Date: 28-Sep-17 11:31:15 ******/
CREATE NONCLUSTERED INDEX [fk_Diagnosis_Doctor1_idx] ON [dbo].[Diagnosis]
(
	[doctorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [fk_Diagnosis_has_Visit_Diagnosis1_idx]    Script Date: 28-Sep-17 11:31:15 ******/
CREATE NONCLUSTERED INDEX [fk_Diagnosis_has_Visit_Diagnosis1_idx] ON [dbo].[Diagnosis_has_Visit]
(
	[Diagnosis_idDiagnosis] ASC,
	[Diagnosis_doctorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [fk_Diagnosis_has_Visit_Visit1_idx]    Script Date: 28-Sep-17 11:31:15 ******/
CREATE NONCLUSTERED INDEX [fk_Diagnosis_has_Visit_Visit1_idx] ON [dbo].[Diagnosis_has_Visit]
(
	[Visit_idVisit] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [departmentID_idx]    Script Date: 28-Sep-17 11:31:15 ******/
CREATE NONCLUSTERED INDEX [departmentID_idx] ON [dbo].[Doctor]
(
	[departmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [fk_Follow_up_Visit1_idx]    Script Date: 28-Sep-17 11:31:15 ******/
CREATE NONCLUSTERED INDEX [fk_Follow_up_Visit1_idx] ON [dbo].[Follow_up]
(
	[Visit_idVisit] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [fk_Family_history_Patient1_idx]    Script Date: 28-Sep-17 11:31:15 ******/
CREATE NONCLUSTERED INDEX [fk_Family_history_Patient1_idx] ON [dbo].[History]
(
	[Patient_idPatient] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [userID_idx]    Script Date: 28-Sep-17 11:31:15 ******/
CREATE NONCLUSTERED INDEX [userID_idx] ON [dbo].[Lab_header]
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [visitID_idx]    Script Date: 28-Sep-17 11:31:15 ******/
CREATE NONCLUSTERED INDEX [visitID_idx] ON [dbo].[Lab_header]
(
	[visitID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Lab_test_reagentID_idx]    Script Date: 28-Sep-17 11:31:15 ******/
CREATE NONCLUSTERED INDEX [Lab_test_reagentID_idx] ON [dbo].[Lab_test_lines]
(
	[Lab_test_reagentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [Lab_test_UOM_idx]    Script Date: 28-Sep-17 11:31:15 ******/
CREATE NONCLUSTERED INDEX [Lab_test_UOM_idx] ON [dbo].[Lab_test_lines]
(
	[Lab_test_UOM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Lab_headerID_idx]    Script Date: 28-Sep-17 11:31:15 ******/
CREATE NONCLUSTERED INDEX [Lab_headerID_idx] ON [dbo].[Lab_test_results]
(
	[Lab_headerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Lab_test_linesID_idx]    Script Date: 28-Sep-17 11:31:15 ******/
CREATE NONCLUSTERED INDEX [Lab_test_linesID_idx] ON [dbo].[Lab_test_results]
(
	[Lab_test_linesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [fk_procedure_has_Doctor_Doctor1_idx]    Script Date: 28-Sep-17 11:31:15 ******/
CREATE NONCLUSTERED INDEX [fk_procedure_has_Doctor_Doctor1_idx] ON [dbo].[Operation_has_Doctor]
(
	[Doctor_idDoctor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [fk_procedure_has_Doctor_procedure1_idx]    Script Date: 28-Sep-17 11:31:15 ******/
CREATE NONCLUSTERED INDEX [fk_procedure_has_Doctor_procedure1_idx] ON [dbo].[Operation_has_Doctor]
(
	[procedure_idprocedure] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [userID_idx]    Script Date: 28-Sep-17 11:31:15 ******/
CREATE NONCLUSTERED INDEX [userID_idx] ON [dbo].[Pharmacy]
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [patientID_idx]    Script Date: 28-Sep-17 11:31:15 ******/
CREATE NONCLUSTERED INDEX [patientID_idx] ON [dbo].[Prescription]
(
	[patientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [userID_idx]    Script Date: 28-Sep-17 11:31:15 ******/
CREATE NONCLUSTERED INDEX [userID_idx] ON [dbo].[Prescription]
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [visitID_idx]    Script Date: 28-Sep-17 11:31:15 ******/
CREATE NONCLUSTERED INDEX [visitID_idx] ON [dbo].[Prescription]
(
	[visitID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [fk_Prescription_has_Pharmacy_Pharmacy1_idx]    Script Date: 28-Sep-17 11:31:15 ******/
CREATE NONCLUSTERED INDEX [fk_Prescription_has_Pharmacy_Pharmacy1_idx] ON [dbo].[Prescription_has_Pharmacy]
(
	[Pharmacy_idDrug] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [fk_Prescription_has_Pharmacy_Prescription1_idx]    Script Date: 28-Sep-17 11:31:15 ******/
CREATE NONCLUSTERED INDEX [fk_Prescription_has_Pharmacy_Prescription1_idx] ON [dbo].[Prescription_has_Pharmacy]
(
	[Prescription_idPrescription] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [userID_idx]    Script Date: 28-Sep-17 11:31:15 ******/
CREATE NONCLUSTERED INDEX [userID_idx] ON [dbo].[Radio_Image]
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [visitID_idx]    Script Date: 28-Sep-17 11:31:15 ******/
CREATE NONCLUSTERED INDEX [visitID_idx] ON [dbo].[Radio_Image]
(
	[visitID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [fk_Sales_line_Sales_header1_idx]    Script Date: 28-Sep-17 11:31:15 ******/
CREATE NONCLUSTERED INDEX [fk_Sales_line_Sales_header1_idx] ON [dbo].[Sales_line]
(
	[Sales_header_idSales_header] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [fk_Triage_Visit1_idx]    Script Date: 28-Sep-17 11:31:15 ******/
CREATE NONCLUSTERED INDEX [fk_Triage_Visit1_idx] ON [dbo].[Triage]
(
	[Visit_idVisit] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [fk_UOM_has_Pharmacy_Pharmacy1_idx]    Script Date: 28-Sep-17 11:31:15 ******/
CREATE NONCLUSTERED INDEX [fk_UOM_has_Pharmacy_Pharmacy1_idx] ON [dbo].[UOM_has_Pharmacy]
(
	[Pharmacy_idDrug] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [fk_UOM_has_Pharmacy_UOM1_idx]    Script Date: 28-Sep-17 11:31:15 ******/
CREATE NONCLUSTERED INDEX [fk_UOM_has_Pharmacy_UOM1_idx] ON [dbo].[UOM_has_Pharmacy]
(
	[UOM_idUOM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [departmentID_idx]    Script Date: 28-Sep-17 11:31:15 ******/
CREATE NONCLUSTERED INDEX [departmentID_idx] ON [dbo].[Users]
(
	[departmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [fk_Visit_Bed1_idx]    Script Date: 28-Sep-17 11:31:15 ******/
CREATE NONCLUSTERED INDEX [fk_Visit_Bed1_idx] ON [dbo].[Visit]
(
	[Bed_idBed] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [patientID_idx]    Script Date: 28-Sep-17 11:31:15 ******/
CREATE NONCLUSTERED INDEX [patientID_idx] ON [dbo].[Visit]
(
	[patientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [fk_Visit_has_procedure_procedure1_idx]    Script Date: 28-Sep-17 11:31:15 ******/
CREATE NONCLUSTERED INDEX [fk_Visit_has_procedure_procedure1_idx] ON [dbo].[Visit_has_Operation]
(
	[procedure_idprocedure] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [fk_Visit_has_procedure_Visit1_idx]    Script Date: 28-Sep-17 11:31:15 ******/
CREATE NONCLUSTERED INDEX [fk_Visit_has_procedure_Visit1_idx] ON [dbo].[Visit_has_Operation]
(
	[Visit_idVisit] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [id_department_idx]    Script Date: 28-Sep-17 11:31:15 ******/
CREATE NONCLUSTERED INDEX [id_department_idx] ON [dbo].[Ward]
(
	[id_department] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Address]  WITH CHECK ADD  CONSTRAINT [fk_Address_Patient1] FOREIGN KEY([patientID])
REFERENCES [dbo].[Patient] ([idPatient])
GO
ALTER TABLE [dbo].[Address] CHECK CONSTRAINT [fk_Address_Patient1]
GO
ALTER TABLE [dbo].[Appointment]  WITH CHECK ADD  CONSTRAINT [fk_Appointment_Visit1] FOREIGN KEY([Visit_idVisit])
REFERENCES [dbo].[Visit] ([idVisit])
GO
ALTER TABLE [dbo].[Appointment] CHECK CONSTRAINT [fk_Appointment_Visit1]
GO
ALTER TABLE [dbo].[Appointment]  WITH CHECK ADD  CONSTRAINT [fk2_PatientID] FOREIGN KEY([patientID])
REFERENCES [dbo].[Patient] ([idPatient])
GO
ALTER TABLE [dbo].[Appointment] CHECK CONSTRAINT [fk2_PatientID]
GO
ALTER TABLE [dbo].[Bed]  WITH CHECK ADD  CONSTRAINT [fk_id_department] FOREIGN KEY([id_department])
REFERENCES [dbo].[Department] ([idDepartment])
GO
ALTER TABLE [dbo].[Bed] CHECK CONSTRAINT [fk_id_department]
GO
ALTER TABLE [dbo].[Bed]  WITH CHECK ADD  CONSTRAINT [id_ward] FOREIGN KEY([id_ward])
REFERENCES [dbo].[Ward] ([idWard])
GO
ALTER TABLE [dbo].[Bed] CHECK CONSTRAINT [id_ward]
GO
ALTER TABLE [dbo].[Diagnosis]  WITH CHECK ADD  CONSTRAINT [fk_Diagnosis_Doctor1] FOREIGN KEY([doctorID])
REFERENCES [dbo].[Doctor] ([idDoctor])
GO
ALTER TABLE [dbo].[Diagnosis] CHECK CONSTRAINT [fk_Diagnosis_Doctor1]
GO
ALTER TABLE [dbo].[Diagnosis_has_Visit]  WITH CHECK ADD  CONSTRAINT [fk_Diagnosis_has_Visit_Diagnosis1] FOREIGN KEY([Diagnosis_idDiagnosis], [Diagnosis_doctorID])
REFERENCES [dbo].[Diagnosis] ([idDiagnosis], [doctorID])
GO
ALTER TABLE [dbo].[Diagnosis_has_Visit] CHECK CONSTRAINT [fk_Diagnosis_has_Visit_Diagnosis1]
GO
ALTER TABLE [dbo].[Diagnosis_has_Visit]  WITH CHECK ADD  CONSTRAINT [fk_Diagnosis_has_Visit_Visit1] FOREIGN KEY([Visit_idVisit])
REFERENCES [dbo].[Visit] ([idVisit])
GO
ALTER TABLE [dbo].[Diagnosis_has_Visit] CHECK CONSTRAINT [fk_Diagnosis_has_Visit_Visit1]
GO
ALTER TABLE [dbo].[Doctor]  WITH CHECK ADD  CONSTRAINT [departmentID] FOREIGN KEY([departmentID])
REFERENCES [dbo].[Department] ([idDepartment])
GO
ALTER TABLE [dbo].[Doctor] CHECK CONSTRAINT [departmentID]
GO
ALTER TABLE [dbo].[Doctor_has_Prescription]  WITH CHECK ADD  CONSTRAINT [fk_Doctor_has_Prescription_Doctor1] FOREIGN KEY([Doctor_idDoctor])
REFERENCES [dbo].[Doctor] ([idDoctor])
GO
ALTER TABLE [dbo].[Doctor_has_Prescription] CHECK CONSTRAINT [fk_Doctor_has_Prescription_Doctor1]
GO
ALTER TABLE [dbo].[Doctor_has_Prescription]  WITH CHECK ADD  CONSTRAINT [fk_Doctor_has_Prescription_Prescription1] FOREIGN KEY([Prescription_idPrescription])
REFERENCES [dbo].[Prescription] ([idPrescription])
GO
ALTER TABLE [dbo].[Doctor_has_Prescription] CHECK CONSTRAINT [fk_Doctor_has_Prescription_Prescription1]
GO
ALTER TABLE [dbo].[Follow_up]  WITH CHECK ADD  CONSTRAINT [fk_Follow_up_Visit1] FOREIGN KEY([Visit_idVisit])
REFERENCES [dbo].[Visit] ([idVisit])
GO
ALTER TABLE [dbo].[Follow_up] CHECK CONSTRAINT [fk_Follow_up_Visit1]
GO
ALTER TABLE [dbo].[History]  WITH CHECK ADD  CONSTRAINT [fk_Family_history_Patient1] FOREIGN KEY([Patient_idPatient])
REFERENCES [dbo].[Patient] ([idPatient])
GO
ALTER TABLE [dbo].[History] CHECK CONSTRAINT [fk_Family_history_Patient1]
GO
ALTER TABLE [dbo].[Lab_header]  WITH CHECK ADD  CONSTRAINT [fk_visitID] FOREIGN KEY([visitID])
REFERENCES [dbo].[Visit] ([idVisit])
GO
ALTER TABLE [dbo].[Lab_header] CHECK CONSTRAINT [fk_visitID]
GO
ALTER TABLE [dbo].[Lab_header]  WITH CHECK ADD  CONSTRAINT [fk2_userID] FOREIGN KEY([userID])
REFERENCES [dbo].[Users] ([idUser])
GO
ALTER TABLE [dbo].[Lab_header] CHECK CONSTRAINT [fk2_userID]
GO
ALTER TABLE [dbo].[Lab_test_lines]  WITH CHECK ADD  CONSTRAINT [Lab_test_reagentID] FOREIGN KEY([Lab_test_reagentID])
REFERENCES [dbo].[Pharmacy] ([idDrug])
GO
ALTER TABLE [dbo].[Lab_test_lines] CHECK CONSTRAINT [Lab_test_reagentID]
GO
ALTER TABLE [dbo].[Lab_test_results]  WITH CHECK ADD  CONSTRAINT [Lab_headerID] FOREIGN KEY([Lab_headerID])
REFERENCES [dbo].[Lab_header] ([idLab_header])
GO
ALTER TABLE [dbo].[Lab_test_results] CHECK CONSTRAINT [Lab_headerID]
GO
ALTER TABLE [dbo].[Lab_test_results]  WITH CHECK ADD  CONSTRAINT [Lab_test_linesID] FOREIGN KEY([Lab_test_linesID])
REFERENCES [dbo].[Lab_test_lines] ([idLab_test_lines])
GO
ALTER TABLE [dbo].[Lab_test_results] CHECK CONSTRAINT [Lab_test_linesID]
GO
ALTER TABLE [dbo].[Operation_has_Doctor]  WITH CHECK ADD  CONSTRAINT [fk_procedure_has_Doctor_Doctor1] FOREIGN KEY([Doctor_idDoctor])
REFERENCES [dbo].[Doctor] ([idDoctor])
GO
ALTER TABLE [dbo].[Operation_has_Doctor] CHECK CONSTRAINT [fk_procedure_has_Doctor_Doctor1]
GO
ALTER TABLE [dbo].[Operation_has_Doctor]  WITH CHECK ADD  CONSTRAINT [fk_procedure_has_Doctor_procedure1] FOREIGN KEY([procedure_idprocedure])
REFERENCES [dbo].[Operation] ([idprocedure])
GO
ALTER TABLE [dbo].[Operation_has_Doctor] CHECK CONSTRAINT [fk_procedure_has_Doctor_procedure1]
GO
ALTER TABLE [dbo].[Pharmacy]  WITH CHECK ADD  CONSTRAINT [userID] FOREIGN KEY([userID])
REFERENCES [dbo].[Users] ([idUser])
GO
ALTER TABLE [dbo].[Pharmacy] CHECK CONSTRAINT [userID]
GO
ALTER TABLE [dbo].[Prescription]  WITH CHECK ADD  CONSTRAINT [fk_patientID] FOREIGN KEY([patientID])
REFERENCES [dbo].[Patient] ([idPatient])
GO
ALTER TABLE [dbo].[Prescription] CHECK CONSTRAINT [fk_patientID]
GO
ALTER TABLE [dbo].[Prescription]  WITH CHECK ADD  CONSTRAINT [fk_userID] FOREIGN KEY([userID])
REFERENCES [dbo].[Users] ([idUser])
GO
ALTER TABLE [dbo].[Prescription] CHECK CONSTRAINT [fk_userID]
GO
ALTER TABLE [dbo].[Prescription]  WITH CHECK ADD  CONSTRAINT [visitID] FOREIGN KEY([visitID])
REFERENCES [dbo].[Visit] ([idVisit])
GO
ALTER TABLE [dbo].[Prescription] CHECK CONSTRAINT [visitID]
GO
ALTER TABLE [dbo].[Prescription_has_Pharmacy]  WITH CHECK ADD  CONSTRAINT [fk_Prescription_has_Pharmacy_Pharmacy1] FOREIGN KEY([Pharmacy_idDrug])
REFERENCES [dbo].[Pharmacy] ([idDrug])
GO
ALTER TABLE [dbo].[Prescription_has_Pharmacy] CHECK CONSTRAINT [fk_Prescription_has_Pharmacy_Pharmacy1]
GO
ALTER TABLE [dbo].[Prescription_has_Pharmacy]  WITH CHECK ADD  CONSTRAINT [fk_Prescription_has_Pharmacy_Prescription1] FOREIGN KEY([Prescription_idPrescription])
REFERENCES [dbo].[Prescription] ([idPrescription])
GO
ALTER TABLE [dbo].[Prescription_has_Pharmacy] CHECK CONSTRAINT [fk_Prescription_has_Pharmacy_Prescription1]
GO
ALTER TABLE [dbo].[Radio_Image]  WITH CHECK ADD  CONSTRAINT [fk2_visitID] FOREIGN KEY([visitID])
REFERENCES [dbo].[Visit] ([idVisit])
GO
ALTER TABLE [dbo].[Radio_Image] CHECK CONSTRAINT [fk2_visitID]
GO
ALTER TABLE [dbo].[Radio_Image]  WITH CHECK ADD  CONSTRAINT [fk3_userID] FOREIGN KEY([userID])
REFERENCES [dbo].[Users] ([idUser])
GO
ALTER TABLE [dbo].[Radio_Image] CHECK CONSTRAINT [fk3_userID]
GO
ALTER TABLE [dbo].[Sales_line]  WITH CHECK ADD  CONSTRAINT [fk_Sales_line_Sales_header1] FOREIGN KEY([Sales_header_idSales_header])
REFERENCES [dbo].[Sales_header] ([idSales_header])
GO
ALTER TABLE [dbo].[Sales_line] CHECK CONSTRAINT [fk_Sales_line_Sales_header1]
GO
ALTER TABLE [dbo].[Triage]  WITH CHECK ADD  CONSTRAINT [fk_Triage_Visit1] FOREIGN KEY([Visit_idVisit])
REFERENCES [dbo].[Visit] ([idVisit])
GO
ALTER TABLE [dbo].[Triage] CHECK CONSTRAINT [fk_Triage_Visit1]
GO
ALTER TABLE [dbo].[UOM_has_Pharmacy]  WITH CHECK ADD  CONSTRAINT [fk_UOM_has_Pharmacy_Pharmacy1] FOREIGN KEY([Pharmacy_idDrug])
REFERENCES [dbo].[Pharmacy] ([idDrug])
GO
ALTER TABLE [dbo].[UOM_has_Pharmacy] CHECK CONSTRAINT [fk_UOM_has_Pharmacy_Pharmacy1]
GO
ALTER TABLE [dbo].[UOM_has_Pharmacy]  WITH CHECK ADD  CONSTRAINT [fk_UOM_has_Pharmacy_UOM1] FOREIGN KEY([UOM_idUOM])
REFERENCES [dbo].[UOM] ([idUOM])
GO
ALTER TABLE [dbo].[UOM_has_Pharmacy] CHECK CONSTRAINT [fk_UOM_has_Pharmacy_UOM1]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [fk_departmentID] FOREIGN KEY([departmentID])
REFERENCES [dbo].[Department] ([idDepartment])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [fk_departmentID]
GO
ALTER TABLE [dbo].[Visit]  WITH CHECK ADD  CONSTRAINT [fk_Visit_Bed1] FOREIGN KEY([Bed_idBed])
REFERENCES [dbo].[Bed] ([idBed])
GO
ALTER TABLE [dbo].[Visit] CHECK CONSTRAINT [fk_Visit_Bed1]
GO
ALTER TABLE [dbo].[Visit]  WITH CHECK ADD  CONSTRAINT [patientID] FOREIGN KEY([patientID])
REFERENCES [dbo].[Patient] ([idPatient])
GO
ALTER TABLE [dbo].[Visit] CHECK CONSTRAINT [patientID]
GO
ALTER TABLE [dbo].[Visit_has_Doctor]  WITH CHECK ADD  CONSTRAINT [fk_Visit_has_Doctor_Doctor1] FOREIGN KEY([Doctor_idDoctor])
REFERENCES [dbo].[Doctor] ([idDoctor])
GO
ALTER TABLE [dbo].[Visit_has_Doctor] CHECK CONSTRAINT [fk_Visit_has_Doctor_Doctor1]
GO
ALTER TABLE [dbo].[Visit_has_Doctor]  WITH CHECK ADD  CONSTRAINT [fk_Visit_has_Doctor_Visit1] FOREIGN KEY([Visit_idVisit])
REFERENCES [dbo].[Visit] ([idVisit])
GO
ALTER TABLE [dbo].[Visit_has_Doctor] CHECK CONSTRAINT [fk_Visit_has_Doctor_Visit1]
GO
ALTER TABLE [dbo].[Visit_has_Operation]  WITH CHECK ADD  CONSTRAINT [fk_Visit_has_procedure_procedure1] FOREIGN KEY([procedure_idprocedure])
REFERENCES [dbo].[Operation] ([idprocedure])
GO
ALTER TABLE [dbo].[Visit_has_Operation] CHECK CONSTRAINT [fk_Visit_has_procedure_procedure1]
GO
ALTER TABLE [dbo].[Visit_has_Operation]  WITH CHECK ADD  CONSTRAINT [fk_Visit_has_procedure_Visit1] FOREIGN KEY([Visit_idVisit])
REFERENCES [dbo].[Visit] ([idVisit])
GO
ALTER TABLE [dbo].[Visit_has_Operation] CHECK CONSTRAINT [fk_Visit_has_procedure_Visit1]
GO
ALTER TABLE [dbo].[Ward]  WITH CHECK ADD  CONSTRAINT [id_department] FOREIGN KEY([id_department])
REFERENCES [dbo].[Department] ([idDepartment])
GO
ALTER TABLE [dbo].[Ward] CHECK CONSTRAINT [id_department]
GO
USE [master]
GO
ALTER DATABASE [HOSPITAL] SET  READ_WRITE 
GO
