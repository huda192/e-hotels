set search_path = 'projectGroup100';

create table HotelChain (
ChainName VARCHAR(50) NOT NULL,
CentralAddress VARCHAR(50) NOT NULL,
EmailAddress VARCHAR(50) NOT NULL,
PhoneNumber VARCHAR(50) NOT NULL,
NumHotels INT,
CONSTRAINT unique_chain_address UNIQUE (ChainName, CentralAddress),
CONSTRAINT unique_chain_contact UNIQUE (EmailAddress, PhoneNumber), 
PRIMARY KEY (ChainName, CentralAddress)
);

create table Hotel(
HotelAddress varchar(50) not null,
HotelName varchar(50) not null,
Category int,
NumRooms int,
ContactEmail varchar(50),
ChainName varchar(50) not null,
CentralAddress varchar(50) not null,
PhoneNumber varchar(10),
CONSTRAINT hotel_unique_constraint UNIQUE (HotelAddress, HotelName),
primary key(HotelAddress, HotelName, ChainName, CentralAddress),
foreign key (ChainName, CentralAddress) references HotelChain(ChainName, CentralAddress)
);

create table Room(
RoomID int,
Price int, 
Capacity int, 
ViewType varchar(50),
IsExtendable varchar(50) not null,
HotelAddress varchar(50) not null,
HotelName varchar(50) not null,
CONSTRAINT room_unique_constraint UNIQUE (RoomID),
primary key(RoomID, HotelAddress, HotelName),
foreign key (HotelAddress, HotelName) references Hotel(HotelAddress, HotelName)
);

create table Customer(
CustID int,
CustAddress varchar(50),
CustFirstName varchar(50),
CustLastName varchar(50),
primary key(CustID)
);

create table Booking(
RoomID int,
isArchived varchar(50) not null,
isRenting varchar(50) not null,
custid INT,
CONSTRAINT fk_booking_custid FOREIGN KEY (custid) REFERENCES customer(custid),
primary key(RoomID),
foreign key(RoomID) references Room(RoomID) on delete cascade
);

create table Employee(
EmpID int,
EmpAddress varchar(50),
EmpFirstName varchar(50),
EmpLastName varchar(50),
primary key (EmpID)
);

create table Manager(
HotelAddress varchar(50),
HotelName varchar(50),
primary key (HotelAddress, HotelName),
foreign key (HotelAddress, HotelName) references Hotel(HotelAddress, HotelName),
empid INT,
CONSTRAINT fk_manager_empid FOREIGN KEY (empid) REFERENCES employee(empid)
);

create table room_amenities(
RoomID int,
Amenities varchar(50),
primary key(RoomID),
foreign key(RoomID) references Room(RoomID) on delete cascade
);

create table room_issues(
RoomID int,
AnyIssue varchar(50),
primary key (RoomID),
foreign key (RoomID) references Room(RoomID) on delete cascade
);

create table WorksFor(
EmpID int,
HotelAddress varchar(50),
HotelName varchar(50),
primary key (EmpID, HotelAddress, HotelName),
foreign key (EmpID) references Employee(EmpID),
foreign key (HotelAddress, HotelName) references Hotel(HotelAddress, HotelName) on delete cascade
);

create table Set_Renting(
EmpID int,
primary key (EmpID),
foreign key (EmpID) references Employee(EmpID) on delete cascade
);
