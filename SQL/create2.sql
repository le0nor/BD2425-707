
DROP TABLE IF EXISTS Person;

CREATE TABLE Person (
    idPerson INTEGER CONSTRAINT pk_idperson_person PRIMARY KEY,
    Name TEXT CONSTRAINT nn_name NOT NULL,
    Email TEXT  CONSTRAINT unique_email UNIQUE 
                CONSTRAINT nn_email NOT NULL,
    Age INTEGER CONSTRAINT nn_age NOT NULL 
                CONSTRAINT check_age CHECK (Age >= 10 AND Age <= 200),
    Nationality TEXT CONSTRAINT default_null_nationality DEFAULT NULL
);

DROP TABLE IF EXISTS Model;

CREATE TABLE Model (
    idPerson INTEGER    CONSTRAINT pk_idperson_model PRIMARY KEY,
                        CONSTRAINT fk_idperson_model REFERENCES Person(idPerson) ON UPDATE CASCADE ON DELETE RESTRICT,
    Bust INTEGER    CONSTRAINT nn_bust NOT NULL 
                    CONSTRAINT check_bust CHECK (Bust > 10 AND Bust < 100),
    Waist INTEGER   CONSTRAINT nn_waist NOT NULL 
                    CONSTRAINT check_waist CHECK (Waist > 10 AND Waist < 100),
    Hips INTEGER    CONSTRAINT nn_hips NOT NULL 
                    CONSTRAINT check_hips CHECK (Hips > 10 AND Hips < 100),
    Height INTEGER  CONSTRAINT nn_height NOT NULL 
                    CONSTRAINT check_height CHECK (Height > 100 AND Height < 250),
    Weight INTEGER  CONSTRAINT nn_ weight NOT NULL 
                    CONSTRAINT check_weight CHECK (Weight > 10 AND Weight < 1000),
    HealthIssues TEXT CONSTRAINT default_null_healthissues DEFAULT NULL,
);


DROP TABLE IF EXISTS Designer;

CREATE TABLE Designer (
    idPerson INTEGER    CONSTRAINT pk_idperson_designer PRIMARY KEY
                        CONSTRAINT fk_idperson_designer REFERENCES Person(idPerson) ON UPDATE CASCADE ON DELETE RESTRICT,
    PhotographyURL TEXT CONSTRAINT default_null_photo DEFAULT NULL,  
    BiographyURL TEXT CONSTRAINT default_null_bio DEFAULT NULL  
);


DROP TABLE IF EXISTS Spectator;

CREATE TABLE Spectator (
    idPerson INTEGER    CONSTRAINT pk_idperson_spectator PRIMARY KEY
                        CONSTRAINT fk_idperson_spectator REFERENCES Person(idPerson) ON UPDATE CASCADE ON DELETE RESTRICT,                        
    Seat INTEGER    CONSTRAINT unique_seat UNIQUE 
                    CONSTRAINT nn_seat NOT NULL   
);


DROP TABLE IF EXISTS Influencer;

CREATE TABLE Influencer (
    idPerson INTEGER    CONSTRAINT pk_idperson_influencer PRIMARY KEY
                        CONSTRAINT fk_idperson_influencer REFERENCES Spectator(idPerson) ON UPDATE CASCADE ON DELETE RESTRICT,                        
    NumFollowers INTEGER CONSTRAINT nn_numfollowers NOT NULL,
    IntagramHandle TEXT CONSTRAINT unique_insta UNIQUE  
                        CONSTRAINT nn_insta NOT NULL
);


DROP TABLE IF EXISTS Media;

CREATE TABLE Media (
    idPerson INTEGER    CONSTRAINT pk_idperson_media PRIMARY KEY
                        CONSTRAINT fk_idperson_media REFERENCES Spectator(idPerson) ON UPDATE CASCADE ON DELETE RESTRICT,                        
    Occupation TEXT CONSTRAINT nn_occupation NOT NULL,
    MeansofCommunication TEXT CONSTRAINT nn_communication NOT NULL
);


DROP TABLE IF EXISTS Technician;

CREATE TABLE Technician (
    idPerson INTEGER    CONSTRAINT pk_idperson_technician PRIMARY KEY
                        CONSTRAINT fk_idperson_technician REFERENCES Person(idPerson) ON UPDATE CASCADE ON DELETE RESTRICT,                        
    Function TEXT CONSTRAINT nn_function NOT NULL,
    Material TEXT CONSTRAINT nn_material NOT NULL
);


DROP TABLE IF EXISTS LocalTechnician;

CREATE TABLE LocalTechnician (
    idPerson INTEGER    CONSTRAINT pk_idperson_localtechnician PRIMARY KEY
                        CONSTRAINT fk_idperson_localtechnician REFERENCES Technician(idPerson) ON UPDATE CASCADE ON DELETE RESTRICT,
    Address TEXT    CONSTRAINT fk_address_localtechnician REFERENCES Event(Address)
                    CONSTRAINT nn_address_localtechnician NOT NULL,
);


DROP TABLE IF EXISTS StylingTechnician;

CREATE TABLE StylingTechnician (
    idPerson INTEGER    CONSTRAINT pk_idperson_stylist PRIMARY KEY    
                        CONSTRAINT fk_idperson_stylist REFERENCES Technician(idPerson) ON UPDATE CASCADE ON DELETE RESTRICT,
);

DROP TABLE IF EXISTS Model_Stylist;

CREATE TABLE Model_Stylist (
    idModel INTEGER CONSTRAINT fk_idmodel_modelstylist REFERENCES Model(idPerson) ON UPDATE CASCADE ON DELETE RESTRICT,
    idStylist INTEGER CONSTRAINT fk_idstylist_modelstylist REFERENCES StylingTechnician(idPerson) ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT pks_modelstylist PRIMARY KEY (idModel, idStylist)
);

DROP TABLE IF EXISTS Runway;

CREATE TABLE Runway (
    idShow INTEGER CONSTRAINT pk_idshow_runway PRIMARY KEY,
    Address TEXT    CONSTRAINT fk_address_runway REFERENCES Event(Address) ON UPDATE CASCADE ON DELETE RESTRICT
                    CONSTRAINT nn_address_runway NOT NULL,
    BName TEXT  CONSTRAINT fk_bname_runway REFERENCES Brand(BName) ON UPDATE CASCADE ON DELETE RESTRICT
                CONSTRAINT nn_bname_runway NOT NULL,
    Date DATE CONSTRAINT nn_date_runway NOT NULL,
    Time TIME CONSTRAINT nn_time_runway NOT NULL,
    Budget NUMERIC CONSTRAINT default_null_budget DEFAULT NULL          -- null????
);


DROP TABLE IF EXISTS Model_Runway;

CREATE TABLE Model_Runway (
    idShow INTEGER  CONSTRAINT fk_idshow_modelrunway REFERENCES Runway(idShow) ON UPDATE CASCADE ON DELETE RESTRICT
                    CONSTRAINT nn_idshow_modelrunway NOT NULL,
    idModel TEXT    CONSTRAINT fk_idmodel_modelrunway REFERENCES Model(idPerson) ON UPDATE CASCADE ON DELETE RESTRICT
                    CONSTRAINT nn_idmodel_modelrunway NOT NULL,
    Order INTEGER   CONSTRAINT nn_order NOT NULL 
                    CONSTRAINT check_order CHECK (Order > 0 AND Order < 100),
    CONSTRAINT pks_modelrunway KEY (idShow, idModel)
);


DROP TABLE IF EXISTS Event;

CREATE TABLE Event (
    Address TEXT CONSTRAINT pk_address_event PRIMARY KEY,
    Budget INTEGER  CONSTRAINT nn_budget_event NOT NULL 
                    CONSTRAINT check_budget_event CHECK (Budget > 0),
    ResponsibleEntity TEXT CONSTRAINT nn_responsibleentity NOT NULL
);


DROP TABLE IF EXISTS Sponsor;

CREATE TABLE Sponsor (
    Company TEXT CONSTRAINT pk_company_sponsor PRIMARY KEY,
    Email TEXT  CONSTRAINT unique_email_sponsor UNIQUE 
                CONSTRAINT nn_email_sponsor NOT NULL,
    Value NUMERIC CONSTRAINT nn_value_sponsor NOT NULL,
    Resources TEXT CONSTRAINT nn_resources_sponsor NOT NULL,    
    Agreements TEXT CONSTRAINT nn_agreements_sponsor NOT NULL    
);


DROP TABLE IF EXISTS Ticket;

CREATE TABLE Ticket (
    idShow INTEGER CONSTRAINT fk_idshow_ticket REFERENCES Runway(idShow) ON UPDATE CASCADE ON DELETE RESTRICT,
    idPerson INTEGER CONSTRAINT fk_idperson_ticket REFERENCES Spectator(idPerson) ON UPDATE CASCADE ON DELETE RESTRICT,
    Type TEXT   CONSTRAINT nn_type_ticket NOT NULL 
                CONSTRAINT check_type_ticket CHECK (Type IN ('VIP', 'Regular', 'Media')),
    Status TEXT CONSTRAINT nn_status_ticket NOT NULL 
                CONSTRAINT default_status_ticket DEFAULT 'Valid' 
                CONSTRAINT check_status_ticket CHECK (Status IN ('Valid', 'Used', 'Expired')),
    CONSTRAINT pks_ticket PRIMARY KEY (idShow, idPerson)
);


DROP TABLE IF EXISTS Brand;

CREATE TABLE Brand (
    BName TEXT CONSTRAINT pk_bname_brand PRIMARY KEY,
    Representative TEXT CONSTRAINT nn_representative_brand NOT NULL,
    CountryofOrigin TEXT CONSTRAINT default_null_country_brand DEFAULT NULL,
    LogoURL TEXT CONSTRAINT default_null_logo_brand DEFAULT NULL
);


DROP TABLE IF EXISTS Collection;

CREATE TABLE Collection (
    CName TEXT CONSTRAINT pk_cname_collection PRIMARY KEY,
    BName TEXT CONSTRAINT fk_bname_collection REFERENCES Brand(BName) ON UPDATE CASCADE ON DELETE RESTRICT,
    Season TEXT CONSTRAINT nn_season_collection NOT NULL
);

DROP TABLE IF EXISTS FashionPiece;

CREATE TABLE FashionPiece (
    idPiece INTEGER CONSTRAINT pk_idpiece_fashionpiece PRIMARY KEY,
    Collection TEXT CONSTRAINT fk_collection_fashionpiece REFERENCES Collection(CName) ON UPDATE CASCADE ON DELETE RESTRICT
                    CONSTRAINT nn_collection_fashionpiece NOT NULL,
    idPerson INTEGER    CONSTRAINT fk_idperson_fashionpiece REFERENCES Designer(idPerson) ON UPDATE CASCADE ON DELETE RESTRICT
                        CONSTRAINT nn_idperson_fashionpiece NOT NULL,
    Material TEXT CONSTRAINT default_null_material DEFAULT NULL,     
    Color TEXT CONSTRAINT DEFAULT default_null_color NULL,
    Type TEXT CONSTRAINT DEFAULT default_null_type_fashionpiece NULL
);