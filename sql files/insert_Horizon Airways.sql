use Horizon_Airways

/* This are the data in the Users table... They are used for the login validation process... */
select * from Users;

insert into Users (UserName, Password, Role) values
('CAdummy', 'CAdummy123', 'Counter Assistant'),
('BMdummy', 'BMdummy123', 'Business Manager');

select UserName, Password from Users where Role='Business Manager';

/**/
select * from Sector;

insert into Sector (SectorID, Description, WeekDay1, WeekDay2, FirstClassFare, BusinessClassFare, EconomyClassFare) values
('NY-CH', 'New-York to Chicago', 'Wed', 'Sat', 400, 330, 250),
('NY-NO', 'New-York to New-Orleans', 'Mon', 'Thu', 450, 380, 330),
('NY-MI', 'New-York to Miami', 'Tue', 'Fri', 380, 310, 260),
('NY-PI', 'New-York to Pittsburgh', 'Mon', 'Thu', 200, 150, 120),
('NY-ME', 'New-York to Memphis', 'Tue', 'Sun', 430, 330, 240),
('CH-NY', 'Chicago to New-York', 'Wed', 'Sat', 400, 330, 250),
('NO-NY', 'New-Orleans to New-York', 'Mon', 'Thu', 450, 380, 330),
('MI-NY', 'Miami to New-York', 'Tue', 'Fri', 410, 310, 260),
('PI-NY', 'Pittsburgh to New-York', 'Mon', 'Thu', 200, 150, 100),
('ME-NY', 'Memphis to New-York', 'Tue', 'Fri', 430, 330, 240);


/**/
select * from Aircraft;

insert into Aircraft(AircraftTypeID, Description, FirstClassSeats, BusinessClassSeats, EconomyClassSeats) values
('A330', 'Airbus 330 a.k.a "A330"', 18, 42, 280),
('B747', 'Boeing 747 a.k.a "B747"', 12, 28, 300);


/**/
select * from Flights;

insert into Flights(FlightNo, FlightDate, DepTime, ArrTime, AircraftTypeID, SectorID) values
('HA101', '2020-03-11', '08:55', '12:00', 'A330', 'NY-CH'),
('HA222', '2020-03-02', '11:30', '18:17', 'A330', 'NY-NO'),
('HA141', '2020-03-10', '06:30', '11:45', 'B747', 'NY-MI'),
('HA901', '2020-03-09', '08:55', '10:40', 'A330', 'NY-PI'),
('HA875', '2020-03-10', '06:30', '10:10', 'B747', 'NY-ME'),
('HA102', '2020-03-04', '06:25', '12:31', 'A330', 'CH-NY'),
('HA223', '2020-03-02', '06:20', '12:31', 'A330', 'NO-NY'),
('HA142', '2020-03-03', '12:20', '05:50', 'B747', 'ME-NY'),
('HA902', '2020-03-09', '07:00', '08:30', 'A330', 'PI-NY'),
('HA876', '2020-03-13', '06:20', '12:10', 'B747', 'MI-NY'),
('HA101', '2020-03-14', '08:55', '12:00', 'A330', 'NY-CH'),
('HA222', '2020-03-05', '11:30', '18:17', 'A330', 'NY-NO'),
('HA141', '2020-03-13', '06:30', '11:45', 'B747', 'NY-MI'),
('HA901', '2020-03-12', '08:55', '10:40', 'A330', 'NY-PI'),
('HA875', '2020-03-01', '06:30', '10:10', 'B747', 'NY-ME'),
('HA102', '2020-03-07', '06:25', '12:31', 'A330', 'CH-NY'),
('HA223', '2020-03-05', '06:20', '12:31', 'A330', 'NO-NY'),
('HA142', '2020-03-06', '12:20', '05:50', 'B747', 'ME-NY'),
('HA902', '2020-03-12', '07:00', '08:30', 'A330', 'PI-NY'),
('HA876', '2020-03-03', '06:20', '12:10', 'B747', 'MI-NY');


/**/
select * from ScheduledFlights;

/* flight date is giving issue... try making them diffrent columns */
insert into ScheduledFlights(FlightNo, FlightDate, FlightTime, FirstClassSeatsAvailable, BusinessClassSeatsAvailable, EconomyClassSeatsAvailable) values
('HA101', '2020-03-11', '08:55', 18, 42, 280),
('HA222', '2020-03-02', '11:30', 18, 42, 280),
('HA141', '2020-03-10', '06:30', 12, 28, 300),
('HA901', '2020-03-09', '08:55', 18, 42, 280),
('HA875', '2020-03-10', '06:30', 12, 28, 300),
('HA102', '2020-03-04', '06:25', 18, 42, 280),
('HA223', '2020-03-02', '06:20', 18, 42, 280),
('HA142', '2020-03-03', '12:20', 12, 28, 300),
('HA902', '2020-03-09', '07:00', 18, 42, 280),
('HA876', '2020-03-13', '06:20', 12, 28, 300),
('HA101', '2020-03-14', '08:55', 18, 42, 280),
('HA222', '2020-03-05', '11:30', 18, 42, 280),
('HA141', '2020-03-13', '06:30', 12, 28, 300),
('HA901', '2020-03-12', '08:55', 18, 42, 280),
('HA875', '2020-03-01', '06:30', 12, 28, 300),
('HA102', '2020-03-07', '06:25', 18, 42, 280),
('HA223', '2020-03-05', '06:20', 18, 42, 280),
('HA142', '2020-03-06', '12:20', 12, 28, 300),
('HA902', '2020-03-12', '07:00', 18, 42, 280),
('HA876', '2020-03-03', '06:20', 12, 28, 300);


/*
select * from DailyCollection;
select * from Passenger;
select * from ScheduledFlights;
delete from Passenger;
delete from DailyCollection;
update ScheduledFlights set FirstClassSeatsAvailable = 18 where FlightNo = 'HA101' AND FlightDate = '2020-03-11';
*/
