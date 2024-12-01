PRAGMA foreign_keys = ON;
BEGIN TRANSACTION;


-- Table: Person

INSERT INTO Person (idPerson, Name, Email, Age, Nationality) VALUES (1, 'Alice Smith', 'alice.smith@yahoo.com', 25, 'USA'); -- media (spectator)
INSERT INTO Person (idPerson, Name, Email, Age, Nationality) VALUES (2, 'Bob Johnson', 'bob.johnson@gmail.com', 30, NULL);  -- spectator (normal)
INSERT INTO Person (idPerson, Name, Email, Age, Nationality) VALUES (3, 'Charlie Lee', 'charlie.lee@gmail.com', 28, 'UK');  -- influ (spectator)
INSERT INTO Person (idPerson, Name, Email, Age, Nationality) VALUES (4, 'Élodie Laurent', 'laurent.elodie@yahoo.com', 88, 'France');    -- designer
INSERT INTO Person (idPerson, Name, Email, Age, Nationality) VALUES (5, 'Anastasia Ivanoa', 'anastasiaiva@hotmail.com', 57, 'Russia');  -- designer
INSERT INTO Person (idPerson, Name, Email, Age, Nationality) VALUES (6, 'Wei Zhang','weizhang@icloud.com', 25, 'China'); -- model //
INSERT INTO Person (idPerson, Name, Email, Age, Nationality) VALUES (7, 'Valentina González', 'valen_gonzalez@gmail.com', 22, 'Argentina');  -- model //
INSERT INTO Person (idPerson, Name, Email, Age, Nationality) VALUES (8, 'Linnea Andersson', 'linnea.andersson@yahoo.com', 27, 'Sweden'); -- influ (spectator)
INSERT INTO Person (idPerson, Name, Email, Age, Nationality) VALUES (9, 'Charlotte Spencer', 'charspencer@hotmail.com', 23, 'UK');  -- model //
INSERT INTO Person (idPerson, Name, Email, Age, Nationality) VALUES (10, 'Alessandra Bianchi', 'alessandra.bianchi@gmail.com', 62, 'Italy'); -- designer
INSERT INTO Person (idPerson, Name, Email, Age, Nationality) VALUES (11, 'Mariana Santos', 'mari_santos@gmail.com', 34, NULL);   -- spectator (normal)
INSERT INTO Person (idPerson, Name, Email, Age, Nationality) VALUES (12, 'Benjamin Carter', 'benja.carter@yahoo.com', 31, 'USA');    -- stylist (technician)
INSERT INTO Person (idPerson, Name, Email, Age, Nationality) VALUES (13, 'Inês Ferreira', 'inesferr@hotmail.com', 27, 'Portugal');  -- influ (spectator)
INSERT INTO Person (idPerson, Name, Email, Age, Nationality) VALUES (14, 'Petra Novaková', 'petranova@yahoo.com', 32, NULL);  -- spectator (normal)
INSERT INTO Person (idPerson, Name, Email, Age, Nationality) VALUES (15, 'Simon De Clercq', 'simondeclercq@gmail.com', 27, 'Belgium');  -- local (technician)
INSERT INTO Person (idPerson, Name, Email, Age, Nationality) VALUES (16, 'Wei Ling Tan', 'wei.ling.tan@hotmail.com', 35, 'Singapore');  -- stylist (technician)
INSERT INTO Person (idPerson, Name, Email, Age, Nationality) VALUES (17, 'Daniela Meier', 'dani_meier@yahoo.com', 27, NULL);   -- spectator (normal)
INSERT INTO Person (idPerson, Name, Email, Age, Nationality) VALUES (18, 'Pierre Dupont', 'duppont.pierre@gmail.com', 42, 'France');    -- media (spectator)
INSERT INTO Person (idPerson, Name, Email, Age, Nationality) VALUES (19, 'Clara Martinez', 'matinezcla@hotmail.com', 21, NULL);  -- spectator (normal)
INSERT INTO Person (idPerson, Name, Email, Age, Nationality) VALUES (20, 'Elise Van Damme', 'elise.vandamme@icloud.com', 25, 'Belgium');    -- influ (spectator)
INSERT INTO Person (idPerson, Name, Email, Age, Nationality) VALUES (21, 'Camile Moreau', 'cami_moreau@hotmail.com', 23, 'France'); -- influ (spectator)
INSERT INTO Person (idPerson, Name, Email, Age, Nationality) VALUES (22, 'Giulia Romano', 'giuromano@yahoo.com', 29, 'Italy');  --  model //
INSERT INTO Person (idPerson, Name, Email, Age, Nationality) VALUES (23, 'Mikko Nieminen', 'mikkom@gmail.com', 37, 'Finland');  -- local (technician)
INSERT INTO Person (idPerson, Name, Email, Age, Nationality) VALUES (24, 'Anna Wagner', 'wagner_anna@yahoo.com', 19, 'Austria');    -- model //
INSERT INTO Person (idPerson, Name, Email, Age, Nationality) VALUES (25, 'Isabel Fuentes', 'belfuentes@gmail.com', 26, 'Chile');    -- stylist (technician)
INSERT INTO Person (idPerson, Name, Email, Age, Nationality) VALUES (26, 'Martina Aguilar', 'aguilar.martina', 32, 'Argentina');    -- stylist (technician)
INSERT INTO Person (idPerson, Name, Email, Age, Nationality) VALUES (27, 'Rafael Lima', 'rafa.lima@gmail.com', 43, 'Brazil');   -- local (technician)
INSERT INTO Person (idPerson, Name, Email, Age, Nationality) VALUES (28, 'Lili Huang', 'lilhuang@hotmail.com', 24, 'South Corea');  -- model //
INSERT INTO Person (idPerson, Name, Email, Age, Nationality) VALUES (29, 'Olivia Bennet', 'bennetoliv@yahoo.com', 20, 'UK');    -- influ (spectator)
INSERT INTO Person (idPerson, Name, Email, Age, Nationality) VALUES (30, 'Camila Ramos', 'camila_ramos@gmail.com', 34, 'Mexico');   -- media (spectator)


-- Table: Model

INSERT INTO Model (idPerson, Bust, Waist, Hips, Height, Weight, HealthIssues) VALUES (6, 85, 60, 90, 175, 60, NULL);
INSERT INTO Model (idPerson, Bust, Waist, Hips, Height, Weight, HealthIssues) VALUES (7, 88, 62, 92, 180, 58, 'Asthma');
INSERT INTO Model (idPerson, Bust, Waist, Hips, Height, Weight, HealthIssues) VALUES (9, 83, 58, 88, 178, 55, NULL);
INSERT INTO Model (idPerson, Bust, Waist, Hips, Height, Weight, HealthIssues) VALUES (22, 87, 63, 91, 176, 59, NULL);
INSERT INTO Model (idPerson, Bust, Waist, Hips, Height, Weight, HealthIssues) VALUES (24, 84, 62, 91, 193, 56, NULL);
INSERT INTO Model (idPerson, Bust, Waist, Hips, Height, Weight, HealthIssues) VALUES (28, 90, 64, 94, 182, 63, NULL);


-- Table: Designer

INSERT INTO Designer (idPerson, PhotographyURL, BiographyURL) VALUES (4, 'www.elodielaurentdesigns.com/bio', 'www.elodielaurentdesigns.com/gallery');
INSERT INTO Designer (idPerson, PhotographyURL, BiographyURL) VALUES (5, 'www.anastasiaivanoadesigns.com', 'www.ivanoacouture.com/about');
INSERT INTO Designer (idPerson, PhotographyURL, BiographyURL) VALUES (10, 'www.alessandrabianchidesign.com/about', 'www.alessandrabianchidesign.com/gallery');


-- Table: Spectator

INSERT INTO Spectator (idPerson, Seat) VALUES (1, 24);
INSERT INTO Spectator (idPerson, Seat) VALUES (2, 38);
INSERT INTO Spectator (idPerson, Seat) VALUES (3, 14);
INSERT INTO Spectator (idPerson, Seat) VALUES (8, 40);
INSERT INTO Spectator (idPerson, Seat) VALUES (11, 16);
INSERT INTO Spectator (idPerson, Seat) VALUES (13, 17);
INSERT INTO Spectator (idPerson, Seat) VALUES (14, 19);
INSERT INTO Spectator (idPerson, Seat) VALUES (17, 13);
INSERT INTO Spectator (idPerson, Seat) VALUES (18, 25);
INSERT INTO Spectator (idPerson, Seat) VALUES (19, 33);
INSERT INTO Spectator (idPerson, Seat) VALUES (20, 18);
INSERT INTO Spectator (idPerson, Seat) VALUES (21, 30);
INSERT INTO Spectator (idPerson, Seat) VALUES (29, 34);
INSERT INTO Spectator (idPerson, Seat) VALUES (30, 7);


-- Table: Influencer

INSERT INTO Influencer (idPerson, NumFollowers, InstagramHandle) VALUES (3, 50000, '@charlielee');
INSERT INTO Influencer (idPerson, NumFollowers, InstagramHandle) VALUES (8, 423000, '@linnea.andersson');
INSERT INTO Influencer (idPerson, NumFollowers, InstagramHandle) VALUES (13, 58700, '@ferrines');
INSERT INTO Influencer (idPerson, NumFollowers, InstagramHandle) VALUES (20, 341000, '@vandamme');
INSERT INTO Influencer (idPerson, NumFollowers, InstagramHandle) VALUES (21, 1950000, '@camilemoreau');
INSERT INTO Influencer (idPerson, NumFollowers, InstagramHandle) VALUES (29, 72900, '@bennet.oliv');


-- Table: Media

INSERT INTO Media (idPerson, Occupation, MeansofCommunication) VALUES (1, 'Media Personality', 'Social Media');
INSERT INTO Media (idPerson, Occupation, MeansofCommunication) VALUES (18, 'Fashion Editor', 'Online Blog');
INSERT INTO Media (idPerson, Occupation, MeansofCommunication) VALUES (30, 'Journalist', 'Magazine');


-- Table: Technician

INSERT INTO Technician (idPerson, Function, Material) VALUES (12, 'Makeup', 'Cosmetics'); 
INSERT INTO Technician (idPerson, Function, Material) VALUES (15, 'Lighting', 'LED');
INSERT INTO Technician (idPerson, Function, Material) VALUES (16, 'Hair', 'Hair Products');
INSERT INTO Technician (idPerson, Function, Material) VALUES (23, 'Video', 'Camera');
INSERT INTO Technician (idPerson, Function, Material) VALUES (25, 'Clothing', 'Fabrics');
INSERT INTO Technician (idPerson, Function, Material) VALUES (26, 'Makeup', 'Cosmetics');
INSERT INTO Technician (idPerson, Function, Material) VALUES (27, 'Sound', 'Speakers'); 


-- Table: Event

INSERT INTO Event (idEvent, Address, Budget, OrganizingCompany) VALUES (1, '99 Rue de Rivoli, 75001 Paris, France', 2000000, 'French Federation of Fashion'); -- spring/summer
INSERT INTO Event (idEvent, Address, Budget, OrganizingCompany) VALUES (2, 'Viale Puglie, 10, 20131 Milano MI, Italy', 2000500, 'Camera Nazionale della Moda Italiana'); -- spring/summer
INSERT INTO Event (idEvent, Address, Budget, OrganizingCompany) VALUES (3, 'Via Bergognone, 40, 20144 Milano MI, Italy', 1000000, 'Camera Nazionale della Moda Italiana'); -- fall/winter


-- Table: Brand

INSERT INTO Brand (idBrand, BName, Representative, CountryofOrigin, LogoURL) VALUES (1, 'Gucci', 'Marco Bizzarri', 'Italy', 'gucci_logo.png');
INSERT INTO Brand (idBrand, BName, Representative, CountryofOrigin, LogoURL) VALUES (2, 'Louis Vuitton', 'Michael Burke', 'USA', 'logo.louisvuitt.png');
INSERT INTO Brand (idBrand, BName, Representative, CountryofOrigin, LogoURL) VALUES (3, 'Prada', 'Patrizio Bertelli', 'Italy', 'pradalogo.png');


-- Table: LocalTechnician

INSERT INTO LocalTechnician (idPerson, idEvent) VALUES (15, 1);
INSERT INTO LocalTechnician (idPerson, idEvent) VALUES (23, 1);
INSERT INTO LocalTechnician (idPerson, idEvent) VALUES (27, 1);   


-- Table: Stylist

INSERT INTO Stylist (idPerson) VALUES (12);
INSERT INTO Stylist (idPerson) VALUES (16);
INSERT INTO Stylist (idPerson) VALUES (25);
INSERT INTO Stylist (idPerson) VALUES (26);


-- Table:  Model_Stylist

INSERT INTO Model_Stylist (idModel, idStylist) VALUES (6, 12);
INSERT INTO Model_Stylist (idModel, idStylist) VALUES (7, 16);
INSERT INTO Model_Stylist (idModel, idStylist) VALUES (9, 25);
INSERT INTO Model_Stylist (idModel, idStylist) VALUES (22, 26);
INSERT INTO Model_Stylist (idModel, idStylist) VALUES (24, 16);
INSERT INTO Model_Stylist (idModel, idStylist) VALUES (28, 12);


-- Table: Runway

INSERT INTO Runway (idShow, idEvent, idBrand, Date, Time, Budget) VALUES (1, 1, 2, '2025-02-25', '10:00:00', 150000);
INSERT INTO Runway (idShow, idEvent, idBrand, Date, Time, Budget) VALUES (2, 3, 1, '2025-09-27', '14:00:00', 500000);
INSERT INTO Runway (idShow, idEvent, idBrand, Date, Time, Budget) VALUES (3, 2, 1, '2024-02-08', '18:00:00', 700000);
INSERT INTO Runway (idShow, idEvent, idBrand, Date, Time, Budget) VALUES (4, 2, 3, '2024-03-02', '10:00:00', 400000);
INSERT INTO Runway (idShow, idEvent, idBrand, Date, Time, Budget) VALUES (5, 1, 2, '2024-02-07', '21:00:00', 1000000);


-- Table: Model_Runway

INSERT INTO Model_Runway (idShow, idModel, "Order") VALUES (1, 22, 1);
INSERT INTO Model_Runway (idShow, idModel, "Order") VALUES (1, 9, 2);
INSERT INTO Model_Runway (idShow, idModel, "Order") VALUES (1, 6, 3);
INSERT INTO Model_Runway (idShow, idModel, "Order") VALUES (1, 28, 4);
INSERT INTO Model_Runway (idShow, idModel, "Order") VALUES (2, 9, 1);
INSERT INTO Model_Runway (idShow, idModel, "Order") VALUES (2, 28, 2);
INSERT INTO Model_Runway (idShow, idModel, "Order") VALUES (2, 24, 3);
INSERT INTO Model_Runway (idShow, idModel, "Order") VALUES (2, 6, 4);
INSERT INTO Model_Runway (idShow, idModel, "Order") VALUES (2, 7, 5);
INSERT INTO Model_Runway (idShow, idModel, "Order") VALUES (3, 22, 1);
INSERT INTO Model_Runway (idShow, idModel, "Order") VALUES (3, 9, 2);
INSERT INTO Model_Runway (idShow, idModel, "Order") VALUES (3, 7, 3);
INSERT INTO Model_Runway (idShow, idModel, "Order") VALUES (4, 24, 1);
INSERT INTO Model_Runway (idShow, idModel, "Order") VALUES (4, 9, 2);
INSERT INTO Model_Runway (idShow, idModel, "Order") VALUES (4, 22, 3);
INSERT INTO Model_Runway (idShow, idModel, "Order") VALUES (4, 6, 4);
INSERT INTO Model_Runway (idShow, idModel, "Order") VALUES (5, 6, 1);
INSERT INTO Model_Runway (idShow, idModel, "Order") VALUES (5, 28, 2);
INSERT INTO Model_Runway (idShow, idModel, "Order") VALUES (5, 9, 3);
INSERT INTO Model_Runway (idShow, idModel, "Order") VALUES (5, 22, 4);


-- Table: Sponsor

INSERT INTO Sponsor (idSponsor, Company, Email, Value, Resources, Agreements) VALUES (1, 'Mercedes-Benz', 'info@mercedes-benz.com', 100000, 'Marketing platforms', 'Long-term partnership');
INSERT INTO Sponsor (idSponsor, Company, Email, Value, Resources, Agreements) VALUES (2, 'LOréal Paris', 'contact@lorealparis.com', 50000, 'Beauty product lines', 'Official beauty partner');
INSERT INTO Sponsor (idSponsor, Company, Email, Value, Resources, Agreements) VALUES (3, 'Vogue Magazine', 'editor@vogue.com', 400000, 'Brand visibility', 'Exclusive media coverage');
INSERT INTO Sponsor (idSponsor, Company, Email, Value, Resources, Agreements) VALUES (4, 'Coca-Cola', 'contactus@cokecorp.com', 50000, 'Access to wide-reaching marketing platforms', 'Sponsorship');
INSERT INTO Sponsor (idSponsor, Company, Email, Value, Resources, Agreements) VALUES (5, 'Moët & Chandon', 'info@moet-hennessy.com', 30000, 'After-parties and VIP events', 'Showcasing their champagne at exclusive locations');


-- Table: Ticket

INSERT INTO Ticket (idTicket, idShow, idPerson, Type, Status) VALUES (1, 1, 1, 'Media', 'Valid');
INSERT INTO Ticket (idTicket, idShow, idPerson, Type) VALUES (2, 3, 2, 'Regular');
INSERT INTO Ticket (idTicket, idShow, idPerson, Type, Status) VALUES (3, 2, 3, 'VIP', 'Valid');
INSERT INTO Ticket (idTicket, idShow, idPerson, Type, Status) VALUES (4, 5, 8, 'VIP', 'Used');
INSERT INTO Ticket (idTicket, idShow, idPerson, Type, Status) VALUES (5, 2, 11, 'Regular', 'Expired');
INSERT INTO Ticket (idTicket, idShow, idPerson, Type) VALUES (6, 3, 13, 'VIP');
INSERT INTO Ticket (idTicket, idShow, idPerson, Type, Status) VALUES (7, 4, 14, 'Regular', 'Valid');
INSERT INTO Ticket (idTicket, idShow, idPerson, Type, Status) VALUES (8, 1, 17, 'Regular', 'Used');
INSERT INTO Ticket (idTicket, idShow, idPerson, Type, Status) VALUES (9, 1, 18, 'Media', 'Valid');
INSERT INTO Ticket (idTicket, idShow, idPerson, Type, Status) VALUES (10, 4, 19, 'Regular', 'Valid');
INSERT INTO Ticket (idTicket, idShow, idPerson, Type) VALUES (11, 5, 20, 'VIP');
INSERT INTO Ticket (idTicket, idShow, idPerson, Type, Status) VALUES (12, 2, 21, 'VIP', 'Valid');
INSERT INTO Ticket (idTicket, idShow, idPerson, Type, Status) VALUES (13, 3, 29, 'VIP', 'Valid');
INSERT INTO Ticket (idTicket, idShow, idPerson, Type, Status) VALUES (14, 1, 30, 'Media', 'Valid');


-- Table: Collection

INSERT INTO Collection (idCollection, CName, idBrand, Season) VALUES (1, 'Dawn of Summer', 2, 'Spring/Summer');
INSERT INTO Collection (idCollection, CName, idBrand, Season) VALUES (2, 'Midnight Bloom', 1, 'Fall/Winter');
INSERT INTO Collection (idCollection, CName, idBrand, Season) VALUES (3, 'Electric Breeze', 1, 'Spring/Summer');
INSERT INTO Collection (idCollection, CName, idBrand, Season) VALUES (4, 'Sunkissed Horizon', 3, 'Spring/Summer');
INSERT INTO Collection (idCollection, CName, idBrand, Season) VALUES (5, 'Gothic Garden', 3, 'Fall/Winter');


-- Table: FashionPiece

INSERT INTO FashionPiece (idPiece, idCollection, idPerson, Material, Color, Type) VALUES (1, 1, 4, 'Silk', 'Golden Yellow', 'Blouse');
INSERT INTO FashionPiece (idPiece, idCollection, idPerson, Material, Color, Type) VALUES (2, 1, 4, 'Silk', 'Charcoal Grey','Tailored Suit');
INSERT INTO FashionPiece (idPiece, idCollection, idPerson, Material, Color, Type) VALUES (3, 1, 5, 'Cotton', 'Blush Pink', 'Cocktail Dress');
INSERT INTO FashionPiece (idPiece, idCollection, idPerson, Material, Color, Type) VALUES (4, 2, 10, 'Leather', 'Camel', 'Trench Coat');
INSERT INTO FashionPiece (idPiece, idCollection, idPerson, Material, Color, Type) VALUES (5, 2, 10, 'Tulle', 'Navy','Maxi Skirt');
INSERT INTO FashionPiece (idPiece, idCollection, idPerson, Material, Color, Type) VALUES (6, 2, 10, 'Velvet', 'Coral', 'Ball Gown');
INSERT INTO FashionPiece (idPiece, idCollection, idPerson, Material, Color, Type) VALUES (7, 2, 5, 'Silk', 'Ivory', 'Cargo Pants');
INSERT INTO FashionPiece (idPiece, idCollection, idPerson, Material, Color, Type) VALUES (8, 3, 4, 'Tulle', 'Olive Graden', 'Trench Coat');
INSERT INTO FashionPiece (idPiece, idCollection, idPerson, Material, Color, Type) VALUES (9, 3, 5, 'Cotton', 'Lavender', 'Blouse');
INSERT INTO FashionPiece (idPiece, idCollection, idPerson, Material, Color, Type) VALUES (10, 3, 5, 'Silk', 'Midnight Blue', 'Evening Gown');
INSERT INTO FashionPiece (idPiece, idCollection, idPerson, Material, Color, Type) VALUES (11, 3, 10, 'Velvet', 'Dark Indigo', 'Denim Jacket');
INSERT INTO FashionPiece (idPiece, idCollection, idPerson, Material, Color, Type) VALUES (12, 4, 10, 'Cotton', 'Champagne', 'Ball Gown');
INSERT INTO FashionPiece (idPiece, idCollection, idPerson, Material, Color, Type) VALUES (13, 4, 10, 'Cotton', 'Floral Prints', 'Kimono');
INSERT INTO FashionPiece (idPiece, idCollection, idPerson, Material, Color, Type) VALUES (14, 4, 10, 'Leather', 'Brown', 'Boots');
INSERT INTO FashionPiece (idPiece, idCollection, idPerson, Material, Color, Type) VALUES (15, 5, 4, 'Tulle', 'White', 'Tuxedo');
INSERT INTO FashionPiece (idPiece, idCollection, idPerson, Material, Color, Type) VALUES (16, 5, 4, 'Velvet', 'Cream', 'Slip Dress');
INSERT INTO FashionPiece (idPiece, idCollection, idPerson, Material, Color, Type) VALUES (17, 5, 4, 'Silk', 'Coral', 'Romper');
INSERT INTO FashionPiece (idPiece, idCollection, idPerson, Material, Color, Type) VALUES (18, 5, 4, 'Cotton', 'Black', 'Blazer');
INSERT INTO FashionPiece (idPiece, idCollection, idPerson, Material, Color, Type) VALUES (19, 5, 5, 'Velvet', 'Charcoal Grey', 'Sweater');


COMMIT TRANSACTION;
PRAGMA foreign_keys = ON;