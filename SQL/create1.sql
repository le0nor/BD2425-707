DROP TABLE IF EXISTS Person;

CREATE TABLE Person (
    idPerson INTEGER PRIMARY KEY,
    Name TEXT NOT NULL,
    Email TEXT UNIQUE NOT NULL,
    Age INTEGER NOT NULL,
    Nationality TEXT,
    CHECK (Age >= 10 AND Age <= 200)
);


DROP TABLE IF EXISTS Model;

CREATE TABLE Model (
    idPerson INTEGER REFERENCES Person(idPerson) NOT NULL ON UPDATE CASCADE ON DELETE RESTRICT,
    Bust INTEGER NOT NULL CHECK (Bust > 10 AND Bust < 100),
    Waist INTEGER NOT NULL CHECK (Waist > 10 AND Waist < 100),
    Hips INTEGER NOT NULL CHECK (Hips > 10 AND Hips < 100),
    Height INTEGER NOT NULL CHECK (Height > 100 AND Height < 250),
    Weight INTEGER NOT NULL CHECK (Weight > 10 AND Weight < 1000),
    HealthIssues TEXT DEFAULT NULL,
);


DROP TABLE IF EXISTS Designer;

CREATE TABLE Designer (
    idPerson INTEGER REFERENCES Person(idPerson) NOT NULL ON UPDATE CASCADE ON DELETE RESTRICT,
    Photography TEXT DEFAULT NULL,   -- URL
    Biography TEXT DEFAULT NULL  
);


DROP TABLE IF EXISTS Spectator;

CREATE TABLE Spectator (
    idPerson INTEGER REFERENCES Person(idPerson) NOT NULL ON UPDATE CASCADE ON DELETE RESTRICT,
    Seat INTEGER NOT NULL   
);


DROP TABLE IF EXISTS Influencer;

CREATE TABLE Influencer (
    idPerson INTEGER REFERENCES Spectator(idPerson) NOT NULL ON UPDATE CASCADE ON DELETE RESTRICT,
    NumFollowers INTEGER NOT NULL,
    IntagramHandle TEXT NOT NULL
);


DROP TABLE IF EXISTS Media;

CREATE TABLE Media (
    idPerson INTEGER REFERENCES Spectator(idPerson) NOT NULL ON UPDATE CASCADE ON DELETE RESTRICT,
    Occupation TEXT NOT NULL,
    MeansofCommunication TEXT NOT NULL
);


DROP TABLE IF EXISTS Technician;

CREATE TABLE Technician (
    idPerson INTEGER REFERENCES Person(idPerson) NOT NULL ON UPDATE CASCADE ON DELETE RESTRICT,
    Function TEXT NOT NULL,
    Material TEXT NOT NULL
);


DROP TABLE IF EXISTS LocalTechnician;

CREATE TABLE LocalTechnician (
    idPerson INTEGER REFERENCES Technician(idPerson) NOT NULL ON UPDATE CASCADE ON DELETE RESTRICT,
    idEvent INTEGER REFERENCES Event(idEvent) NOT NULL,
);


DROP TABLE IF EXISTS StylingTechnician;

CREATE TABLE Stylist (
    idPerson INTEGER PRIMARY KEY REFERENCES Technician(idPerson) NOT NULL ON UPDATE CASCADE ON DELETE RESTRICT,
);

DROP TABLE IF EXISTS Model_Stylist;

CREATE TABLE Model_Stylist (
    idModel INTEGER REFERENCES Model(idPerson) NOT NULL ON UPDATE CASCADE ON DELETE RESTRICT,
    idStylist INTEGER REFERENCES Stylist(idPerson) NOT NULL ON UPDATE CASCADE ON DELETE RESTRICT,
    PRIMARY KEY (idModel, idStylist)
);

DROP TABLE IF EXISTS Runway;

CREATE TABLE Runway (
    idShow INTEGER PRIMARY KEY,
    idEvent TEXT REFERENCES Event(idEvent) NOT NULL ON UPDATE CASCADE ON DELETE RESTRICT,
    idBrand TEXT REFERENCES Brand(idBrand) NOT NULL ON UPDATE CASCADE ON DELETE RESTRICT,
    Date DATE NOT NULL,
    Time TIME NOT NULL,
    Budget INTEGER DEFAULT NULL
);


DROP TABLE IF EXISTS Model_Runway;

CREATE TABLE Model_Runway (
    idShow INTEGER REFERENCES Runway(idShow) ON UPDATE CASCADE ON DELETE RESTRICT,
    idModel TEXT REFERENCES Model(idPerson) ON UPDATE CASCADE ON DELETE RESTRICT,
    Order INTEGER NOT NULL CHECK (Order > 0 AND Order < 100),
    PRIMARY KEY (idShow, idPerson)
);


DROP TABLE IF EXISTS Event;

CREATE TABLE Event (
    idEvent INTEGER PRIMARY KEY,
    Address TEXT NOT NULL,
    Budget INTEGER NOT NULL,
    ResponsibleEntity TEXT NOT NULL
);


DROP TABLE IF EXISTS Sponsor;

CREATE TABLE Sponsor (
    idSponsor INTEGER PRIMARY KEY,
    Company TEXT NOT NULL,
    Email TEXT NOT NULL,
    Value INTEGER NOT NULL,
    Resources TEXT NOT NULL,    
    Agreements TEXT NOT NULL    
);


DROP TABLE IF EXISTS Ticket;

CREATE TABLE Ticket (
    idTicket INTEGER PRIMARY KEY,
    idShow INTEGER REFERENCES Runway(idShow) NOT NULL ON UPDATE CASCADE ON DELETE RESTRICT,
    idPerson TEXT REFERENCES Spectator(idPerson) NOT NULL ON UPDATE CASCADE ON DELETE RESTRICT,
    Type TEXT NOT NULL,
    Status TEXT NOT NULL
);


DROP TABLE IF EXISTS Brand;

CREATE TABLE Brand (
    idBrand INTEGER PRIMARY KEY,
    BName TEXT NOT NULL,
    Representative TEXT NOT NULL,
    CountryofOrigin TEXT,
    LogoURL TEXT   -- URL
);


DROP TABLE IF EXISTS Collection;

CREATE TABLE Collection (
    idCollection INTEGER PRIMARY KEY,
    CName TEXT NOT NULL,
    idBrand TEXT REFERENCES Brand(idBrand) NOT NULL ON UPDATE CASCADE ON DELETE RESTRICT,
    Season TEXT NOT NULL
);


DROP TABLE IF EXISTS FashionPiece;

CREATE TABLE FashionPiece (
    idPiece INTEGER PRIMARY KEY,
    idCollectionCollection TEXT REFERENCES Collection(idCollection) NOT NULL ON UPDATE CASCADE ON DELETE RESTRICT,
    idPerson TEXT REFERENCES Designer(idPerson) NOT NULL ON UPDATE CASCADE ON DELETE RESTRICT,
    Material TEXT,     
    Color TEXT,
    Type TEXT
);