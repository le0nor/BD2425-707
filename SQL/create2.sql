DROP TABLE IF EXISTS Person;

CREATE TABLE Person (
    idPerson INTEGER CONSTRAINT pk_idperson_person PRIMARY KEY,
    Name TEXT CONSTRAINT nn_name_person NOT NULL,
    Email TEXT  CONSTRAINT uq_email_person UNIQUE 
                CONSTRAINT nn_email_person NOT NULL,
    Age INTEGER CONSTRAINT nn_age_person NOT NULL 
                CONSTRAINT chk_age_person CHECK (Age >= 10 AND Age <= 200),
    Nationality TEXT
);

DROP TABLE IF EXISTS Model;

CREATE TABLE Model (
    idPerson INTEGER    CONSTRAINT pk_idperson_model PRIMARY KEY,
                        CONSTRAINT fk_idperson_model REFERENCES Person(idPerson)    ON UPDATE CASCADE 
                                                                                    ON DELETE RESTRICT,
    Bust INTEGER    CONSTRAINT nn_bust NOT NULL 
                    CONSTRAINT chk_bust CHECK (Bust > 10 AND Bust < 100),
    Waist INTEGER   CONSTRAINT nn_waist NOT NULL 
                    CONSTRAINT chk_waist CHECK (Waist > 10 AND Waist < 100),
    Hips INTEGER    CONSTRAINT nn_hips NOT NULL 
                    CONSTRAINT chk_hips CHECK (Hips > 10 AND Hips < 100),
    Height INTEGER  CONSTRAINT nn_height NOT NULL 
                    CONSTRAINT chk_height CHECK (Height > 100 AND Height < 250),
    Weight INTEGER  CONSTRAINT nn_weight NOT NULL 
                    CONSTRAINT chk_weight CHECK (Weight > 10 AND Weight < 1000),
    HealthIssues TEXT
);


DROP TABLE IF EXISTS Designer;

CREATE TABLE Designer (
    idPerson INTEGER    CONSTRAINT pk_idperson_designer PRIMARY KEY
                        CONSTRAINT fk_idperson_designer REFERENCES Person(idPerson) ON UPDATE CASCADE 
                                                                                    ON DELETE RESTRICT,
    PhotographyURL TEXT,  
    BiographyURL TEXT 
);


DROP TABLE IF EXISTS Spectator;

CREATE TABLE Spectator (
    idPerson INTEGER    CONSTRAINT pk_idperson_spectator PRIMARY KEY
                        CONSTRAINT fk_idperson_spectator REFERENCES Person(idPerson)    ON UPDATE CASCADE 
                                                                                        ON DELETE RESTRICT,                        
    Seat INTEGER    CONSTRAINT uq_seat UNIQUE 
                    CONSTRAINT nn_seat NOT NULL   
);


DROP TABLE IF EXISTS Influencer;

CREATE TABLE Influencer (
    idPerson INTEGER    CONSTRAINT pk_idperson_influencer PRIMARY KEY
                        CONSTRAINT fk_idperson_influencer REFERENCES Spectator(idPerson)    ON UPDATE CASCADE 
                                                                                            ON DELETE RESTRICT,                        
    NumFollowers INTEGER CONSTRAINT nn_numfollowers NOT NULL,
    IntagramHandle TEXT CONSTRAINT uq_insta UNIQUE  
                        CONSTRAINT nn_insta NOT NULL
);


DROP TABLE IF EXISTS Media;

CREATE TABLE Media (
    idPerson INTEGER    CONSTRAINT pk_idperson_media PRIMARY KEY
                        CONSTRAINT fk_idperson_media REFERENCES Spectator(idPerson) ON UPDATE CASCADE 
                                                                                    ON DELETE RESTRICT,                        
    Occupation TEXT CONSTRAINT nn_occupation_media NOT NULL,
    MeansofCommunication TEXT CONSTRAINT nn_communication_media NOT NULL
);


DROP TABLE IF EXISTS Technician;

CREATE TABLE Technician (
    idPerson INTEGER    CONSTRAINT pk_idperson_technician PRIMARY KEY
                        CONSTRAINT fk_idperson_technician REFERENCES Person(idPerson)   ON UPDATE CASCADE 
                                                                                        ON DELETE RESTRICT,                        
    Function TEXT CONSTRAINT nn_function_tech NOT NULL,
    Material TEXT CONSTRAINT nn_material_tech NOT NULL
);


DROP TABLE IF EXISTS LocalTechnician;

CREATE TABLE LocalTechnician (
    idPerson INTEGER    CONSTRAINT pk_idperson_localtechnician PRIMARY KEY
                        CONSTRAINT fk_idperson_localtechnician REFERENCES Technician(idPerson)  ON UPDATE CASCADE 
                                                                                                ON DELETE RESTRICT,
    idEvent INTEGER CONSTRAINT fk_idevent_localtechnician REFERENCES Event(idEvent)
                    CONSTRAINT nn_idevent_localtechnician NOT NULL
);


DROP TABLE IF EXISTS Stylist;

CREATE TABLE Stylist (
    idPerson INTEGER    CONSTRAINT pk_idperson_stylist PRIMARY KEY    
                        CONSTRAINT fk_idperson_stylist REFERENCES Technician(idPerson)  ON UPDATE CASCADE 
                                                                                        ON DELETE RESTRICT
);

DROP TABLE IF EXISTS Model_Stylist;

CREATE TABLE Model_Stylist (
    idModel INTEGER CONSTRAINT fk_idmodel_modelstylist REFERENCES Model(idPerson)   ON UPDATE CASCADE 
                                                                                    ON DELETE RESTRICT,
    idStylist INTEGER CONSTRAINT fk_idstylist_modelstylist REFERENCES Stylist(idPerson) ON UPDATE CASCADE 
                                                                                        ON DELETE RESTRICT,
    CONSTRAINT pks_modelstylist PRIMARY KEY (idModel, idStylist)
);

DROP TABLE IF EXISTS Runway;

CREATE TABLE Runway (
    idShow INTEGER CONSTRAINT pk_idshow_runway PRIMARY KEY,
    idEvent INTEGER     CONSTRAINT fk_idevent_runway REFERENCES Event(idEvent)  ON UPDATE CASCADE 
                                                                                ON DELETE RESTRICT
                        CONSTRAINT nn_idevent_runway NOT NULL,
    idBrand INTEGER  CONSTRAINT fk_idbrand_runway REFERENCES Brand(idBrand) ON UPDATE CASCADE 
                                                                            ON DELETE RESTRICT
                     CONSTRAINT nn_idbrand_runway NOT NULL,
    Date DATE CONSTRAINT nn_date_runway NOT NULL,
    Time TIME CONSTRAINT nn_time_runway NOT NULL,
    Budget NUMERIC       
);


DROP TABLE IF EXISTS Model_Runway;

CREATE TABLE Model_Runway (
    idShow INTEGER  CONSTRAINT fk_idshow_modelrunway REFERENCES Runway(idShow)  ON UPDATE CASCADE 
                                                                                ON DELETE RESTRICT,
    idModel INTEGER CONSTRAINT fk_idmodel_modelrunway REFERENCES Model(idPerson)    ON UPDATE CASCADE 
                                                                                    ON DELETE RESTRICT,
    Order INTEGER   CONSTRAINT nn_order NOT NULL 
                    CONSTRAINT chk_order CHECK (Order > 0 AND Order < 100),
    CONSTRAINT pks_modelrunway PRIMARY KEY (idShow, idModel)
);


DROP TABLE IF EXISTS Event;

CREATE TABLE Event (
    idEvent INTEGER CONSTRAINT pk_idevent PRIMARY KEY,
    Address TEXT CONSTRAINT nn_address_event NOT NULL,
    Budget NUMERIC  CONSTRAINT nn_budget_event NOT NULL 
                    CONSTRAINT chk_budget_event CHECK (Budget > 0),
    OrganizingCompany TEXT CONSTRAINT nn_organizingcompany_event NOT NULL
);


DROP TABLE IF EXISTS Sponsor;

CREATE TABLE Sponsor (
    idSponsor INTEGER CONSTRAINT pk_idsponsor PRIMARY KEY,
    Company TEXT    CONSTRAINT uq_company_sponsor UNIQUE 
                    CONSTRAINT nn_company_sponsor NOT NULL,
    Email TEXT  CONSTRAINT uq_email_sponsor UNIQUE 
                CONSTRAINT nn_email_sponsor NOT NULL,
    Value NUMERIC CONSTRAINT nn_value_sponsor NOT NULL,
    Resources TEXT CONSTRAINT nn_resources_sponsor NOT NULL,    
    Agreements TEXT CONSTRAINT nn_agreements_sponsor NOT NULL    
);


DROP TABLE IF EXISTS Ticket;

CREATE TABLE Ticket (
    idTicket INTEGER CONSTRAINT pk_idticket PRIMARY KEY,
    idShow INTEGER  CONSTRAINT fk_idshow_ticket REFERENCES Runway(idShow)   ON UPDATE CASCADE 
                                                                            ON DELETE RESTRICT
                    CONSTRAINT nn_idshow_ticket NOT NULL,
    idPerson INTEGER    CONSTRAINT fk_idperson_ticket REFERENCES Spectator(idPerson)    ON UPDATE CASCADE 
                                                                                        ON DELETE RESTRICT
                        CONSTRAINT nn_idperson_ticket NOT NULL,
    Type TEXT   CONSTRAINT nn_type_ticket NOT NULL 
                CONSTRAINT chk_type_ticket CHECK (Type IN ('VIP', 'Regular', 'Media')),
    Status TEXT CONSTRAINT nn_status_ticket NOT NULL 
                CONSTRAINT default_status_ticket DEFAULT 'Valid' 
                CONSTRAINT chk_status_ticket CHECK (Status IN ('Valid', 'Used', 'Expired')),
);


DROP TABLE IF EXISTS Brand;

CREATE TABLE Brand (
    idBrand INTEGER CONSTRAINT pk_idbrand PRIMARY KEY,
    BName TEXT  CONSTRAINT uq_bname UNIQUE 
                CONSTRAINT nn_bname NOT NULL,
    Representative TEXT CONSTRAINT nn_representative_brand NOT NULL,
    CountryofOrigin TEXT,
    LogoURL TEXT
);


DROP TABLE IF EXISTS Collection;

CREATE TABLE Collection (
    idCollection INTEGER CONSTRAINT pk_idcollection PRIMARY KEY,
    CName TEXT  CONSTRAINT uq_cname UNIQUE 
                CONSTRAINT nn_cname NOT NULL,
    idBrand INTEGER CONSTRAINT fk_idbrand_collection REFERENCES Brand(idBrand)  ON UPDATE CASCADE 
                                                                                ON DELETE RESTRICT
                    CONSTRAINT nn_idbrand_collection NOT NULL,
    Season TEXT CONSTRAINT nn_season_collection NOT NULL
);

DROP TABLE IF EXISTS FashionPiece;

CREATE TABLE FashionPiece (
    idPiece INTEGER CONSTRAINT pk_idpiece_fashionpiece PRIMARY KEY,
    idCollection INTEGER    CONSTRAINT fk_idcollection_fashionpiece REFERENCES Collection(idCollection) ON UPDATE CASCADE 
                                                                                                        ON DELETE RESTRICT
                            CONSTRAINT nn_collection_fashionpiece NOT NULL,
    idPerson INTEGER    CONSTRAINT fk_idperson_fashionpiece REFERENCES Designer(idPerson)   ON UPDATE CASCADE 
                                                                                            ON DELETE RESTRICT
                        CONSTRAINT nn_idperson_fashionpiece NOT NULL,
    Material TEXT,     
    Color TEXT,
    Type TEXT
);