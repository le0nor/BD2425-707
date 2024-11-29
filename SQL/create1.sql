DROP TABLE IF EXISTS Person;
DROP TABLE IF EXISTS Model;
DROP TABLE IF EXISTS Designer;
DROP TABLE IF EXISTS Spectator;
DROP TABLE IF EXISTS Influencer;
DROP TABLE IF EXISTS Media;
DROP TABLE IF EXISTS Technician;
DROP TABLE IF EXISTS LocalTechnician;
DROP TABLE IF EXISTS StylingTechnician;
DROP TABLE IF EXISTS Runway;
DROP TABLE IF EXISTS Model_Runway;
DROP TABLE IF EXISTS Event;
DROP TABLE IF EXISTS Sponsor;
DROP TABLE IF EXISTS Ticket;
DROP TABLE IF EXISTS Brand;
DROP TABLE IF EXISTS Collection;
DROP TABLE IF EXISTS FashionPiece;

CREATE TABLE Person (
    idPerson INTEGER PRIMARY KEY,
    Name TEXT NOT NULL,
    Email TEXT UNIQUE NOT NULL,
    Age INTEGER,
    CHECK (Age >= 10 AND Age <= 100)
);

CREATE TABLE Model (
    idPerson INTEGER REFERENCES Person(idPerson) NOT NULL,
    Nationality TEXT,
    Bust INTEGER NOT NULL CHECK (Bust > 10 AND Bust < 100),
    Waist INTEGER NOT NULL CHECK (Waist > 10 AND Waist < 100),
    Hips INTEGER NOT NULL CHECK (Hips > 10 AND Hips < 100),
    Height INTEGER NOT NULL CHECK (Height > 100 AND Height < 250),
    Weigth INTEGER NOT NULL CHECK (Bust > 10 AND Bust < 1000),
    Health Problems TEXT,

);

CREATE TABLE Designer (
    idPerson INTEGER REFERENCES Person(idPerson) NOT NULL,
    Nationality TEXT,
    Photography,   -- type???
    Biogrphy   -- type???
);

CREATE TABLE Spectator (
    idPerson INTEGER REFERENCES Person(idPerson) NOT NULL,
    Saet INTEGER NOT NULL   -- int ??
);

CREATE TABLE Influencer (
    idPerson INTEGER REFERENCES Spectator(idPerson) NOT NULL,
    NumFollowers INTEGER NOT NULL,
    IntagramHandle TEXT NOT NULL
);

CREATE TABLE Media (
    idPerson INTEGER REFERENCES Spectator(idPerson) NOT NULL,
    Occupation TEXT NOT NULL,
    MeansofCommunication TEXT NOT NULL
);

CREATE TABLE Technician (
    idPerson INTEGER REFERENCES Person(idPerson) NOT NULL,
    Function TEXT NOT NULL,
    Material TEXT NOT NULL
);

CREATE TABLE LocalTechnician (
    idPerson INTEGER REFERENCES Technician(idPerson) NOT NULL,
    Address TEXT REFERENCES Event(Address) NOT NULL,
);

CREATE TABLE StylingTechnician (
    idPerson INTEGER REFERENCES Technician(idPerson) NOT NULL,
    Model TEXT REFERENCES Model(idPerson) NOT NULL
);

CREATE TABLE Runway (
    idShow INTEGER PRIMARY KEY,
    Address TEXT REFERENCES Event(Address),
    BName TEXT REFERENCES Brand(BName) NOT NULL,
    Date DATE NOT NULL,
    Time TIME NOT NULL,
    Budget INTEGER
);

CREATE TABLE Model_Runway (
    idShow INTEGER PRIMARY KEY REFERENCES Runway(idShow),
    Name TEXT PRIMARY KEY REFERENCES Model(Name),
    Order INTEGER NOT NULL CHECK (Order > 0 AND Order < 100),
);

CREATE TABLE Event (
    Address TEXT PRIMARY KEY,
    Budget INTEGER NOT NULL,
    ResponsibleEntity TEXT NOT NULL
);

CREATE TABLE Sponsor (
    Company TEXT NOT NULL,
    Email TEXT NOT NULL,
    Value INTEGER NOT NULL,
    Resources TEXT NOT NULL,    -- text ???
    Agreements TEXT NOT NULL    -- text ??
);

CREATE TABLE Ticket (
    idShow INTEGER PRIMARY KEY REFERENCES Runway(idShow),
    Name TEXT PRIMARY KEY REFERENCES Spectator(Name),
    Type TEXT NOT NULL,
    Status TEXT NOT NULL
);

CREATE TABLE Brand (
    BName TEXT PRIMARY KEY,
    Representative TEXT NOT NULLL,
    CountryofOrigin TEXT,
    Logo   -- type??
);

CREATE TABLE Collection (
    CName TEXT PRIMARY KEY,
    BName TEXT REFERENCES Brand(BName) NOT NULL,
    Season TEXT NOT NULL
);

CREATE TABLE FashionPiece (
    idPiece INTEGER PRIMARY KEY,
    Collection TEXT REFERENCES Collection(CName) NOT NULL,
    Designer TEXT REFERENCES Designer(Name) NOT NULL,
    Material TEXT,     -- text??
    Color TEXT,
    Type TEXT
);