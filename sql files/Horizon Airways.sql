create database Horizon_Airways;

use Horizon_Airways

create table Sector(
SectorID Char(5) PRIMARY KEY NOT NULL, /* NY-CH */
Description Varchar(50) NOT NULL, /* New-York to Chicago */
WeekDay1 Char(3) NOT NULL, /* Wed */
WeekDay2 Char(3) NOT NULL, /* Thu */
FirstClassFare Money NOT NULL, /* 400 #Particular Sector */
BusinessClassFare Money NOT NULL, /* 340 #Particular Sector */
EconomyClassFare Money NOT NULL /* 240 #Particular Sector */
);

create table Aircraft(
AircraftTypeID Char(4) PRIMARY KEY NOT NULL, /* Airbus 330:"A330", Boeing 747:"B747" */
Description Char(30) NOT NULL, /* Airbus 330 a.k.a "A330", Boeing 747 a.k.a "B747" */
FirstClassSeats Int NOT NULL, /* A330:"18", B747:"12" #Total seats #Particular type of an aircraft */
BusinessClassSeats Int NOT NULL, /* A330:"42", B747:"28" #Total seats #Particular type of an aircraft */
EconomyClassSeats Int NOT NULL /* A330:"280", B747:"300" #Total seats #Particular type of an aircraft */
);

create table Flights(
FlightNo Char(5) NOT NULL, /* HA101 */
FlightDate Date NOT NULL, /* Date of Flight/Travel */
DepTime Char(5) NOT NULL, /* 08:55 */
ArrTime Char(5) NOT NULL, /* 12:00 */
AircraftTypeID Char(4) FOREIGN KEY REFERENCES Aircraft(AircraftTypeID) NOT NULL,
SectorID Char(5) FOREIGN KEY REFERENCES Sector(SectorID) NOT NULL,
	CONSTRAINT FlightT_Keys PRIMARY KEY (FlightNo, FlightDate)
);

/* This would hold details about the flight leaving and when its leaving */
create table ScheduledFlights(
FlightNo Char(5) NOT NULL, /* This would hold the FlightNo of the particular plane leaving first... FIXED */
FlightDate Date NOT NULL, /* Similar to above but this would hold a specific date that flight would be leaving... FIXED */
FlightTime Time NOT NULL,
FirstClassSeatsAvailable Int NOT NULL, /* Similar to above but this would have been FIXED... Then later it would increment or decrement based on amount of passengers that have booked or cancelled and stuff*/
BusinessClassSeatsAvailable Int NOT NULL, /* Above explanation... */
EconomyClassSeatsAvailable Int NOT NULL, /* Above explanation... */
	CONSTRAINT SchFlightT_Keys PRIMARY KEY (FlightNo, FlightDate, FlightTime)
);

/*?*/
create table Passenger( 
PnrNo Char(8) PRIMARY KEY NOT NULL, /* Passenger Name Request:[Ibrahim:"IBIM", 2020-03-12:"12", 01:24:56:"56"]; 'IBIM1256' */
FlightNo Char(5) NOT NULL, /* The flight number of the person */
TravelDate Date NOT NULL, /* The flight date of the person */
FName Char(20) NOT NULL, /* FirstName */
LName Char(20) NOT NULL, /* LastName */
Age Int NOT NULL, /* Age */
Gender Char(1) NOT NULL, /* Male "M" or Female "F"*/
Class Char(15) NOT NULL, /* First or Business or Economy */
SeatPref Char(6) NOT NULL, /* Aisle or Window */
SeatZone Char(11) NOT NULL, /* Smoking or Non-Smoking */
MealPref Char(15) NOT NULL, /* Vegetarian or Non-Vegetarian */
SSR Varchar(100) NOT NULL, /* Special Service Request */
Status Char(15) NULL, /* Confirmed or OverBooked or Wait-Listed */
CancelFlag Char(1) NOT NULL, /* Y: Yes If Cancelled & N: No If not Cancelled */
	CONSTRAINT PassT_Keys FOREIGN KEY (FlightNo, TravelDate) REFERENCES Flights(FlightNo, FlightDate)
);

/*?*/
create table DailyCollection(
PnrNo Char(8) FOREIGN KEY REFERENCES Passenger(PnrNo) NOT NULL,
TransDate DateTime NOT NULL, /* The date for a certain transaction for either Collection or Refund */
TransType Char(1) NOT NULL, /* Collection "C" or Refund "R" */
Amount Float NOT NULL /* Amount Collected or Refunded... Remember the refunded amount works in two ways... Before a day of Cancellation, equal amount would be given back. But less than a day 10% would be deducted */ 
);

create table Users(
UserName Char(15) NOT NULL, /* Username of person login into the Interface */
Password Char(15) NOT NULL, /* Password of person login into the Interface */
Role Char(25) NOT NULL /* Counter Assistant or Business Manager */
);