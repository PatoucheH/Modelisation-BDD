-- CREATE ALL THE TABLE 

CREATE TABLE TravelCompany
(
  companyName VARCHAR(100) NOT NULL PRIMARY KEY,
  email       VARCHAR(255) NULL
);

CREATE TABLE TravelTransport 
(
  idTransport     INT     NOT NULL AUTO_INCREMENT PRIMARY KEY,
  nameOfCompany   VARCHAR(100) NULL,
  nameOfTransport VARCHAR(50) NULL,
  type            VARCHAR(50) NOT NULL,
  numberOfPlace   INT     NOT NULL
);

CREATE TABLE Trip
(
  idTrip               INT     NOT NULL AUTO_INCREMENT PRIMARY KEY ,
  destination          VARCHAR(50) NOT NULL,
  totalPrice           DECIMAL NOT NULL,
  maxPlace             INT     NOT NULL,
  companyName          VARCHAR(100) NOT NULL,
  idTransport          INT     NOT NULL,
  CONSTRAINT FK_TravelCompany_TO_Trip FOREIGN KEY (companyName) REFERENCES TravelCompany (companyName),
  CONSTRAINT FK_TravelTransport_TO_Trip FOREIGN KEY (idTransport) REFERENCES TravelTransport (idTransport)
  );

CREATE TABLE Clients
(
  idClient    INT     NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name        VARCHAR(50) NOT NULL,
  firstName   VARCHAR(100) NOT NULL,
  email       VARCHAR(255) NOT NULL UNIQUE,
  phoneNumber VARCHAR(20) NOT NULL
);



CREATE TABLE Host
(
  idHost        INT     NOT NULL AUTO_INCREMENT PRIMARY KEY,
  hostName      VARCHAR(100) NOT NULL,
  category      VARCHAR(255) NOT NULL,
  numberOfPlace INT     NOT NULL,
  idTrip        INT     NOT NULL,
  CONSTRAINT FK_Trip_TO_Host FOREIGN KEY (idTrip) REFERENCES Trip (idTrip)
);

CREATE TABLE GuidesContact
(
  name      VARCHAR(50) NOT NULL PRIMARY KEY,
  languages VARCHAR(255) NOT NULL,
  idHost    INT     NOT NULL,
  CONSTRAINT FK_Host_TO_GuidesContact FOREIGN KEY (idHost) REFERENCES Host (idHost)
);

CREATE TABLE HostAddress
(
  country      VARCHAR(50) NOT NULL,
  city         VARCHAR(100) NOT NULL,
  street       VARCHAR(255) NOT NULL,
  streetNumber INT     NOT NULL,
  idHost       INT     NOT NULL,
  CONSTRAINT FK_Host_TO_HostAddress FOREIGN KEY (idHost) REFERENCES Host (idHost)
);

CREATE TABLE Reservation
(
  idReservation      INT      NOT NULL AUTO_INCREMENT PRIMARY KEY,
  stateOfReservation VARCHAR(50)  NULL DEFAULT 'In Progress',
  dateOfReservation  DATETIME NOT NULL DEFAULT CURRENT_DATE,
  idClient           INT      NOT NULL,
  idTrip             INT      NOT NULL,
  CONSTRAINT FK_Clients_TO_Reservation FOREIGN KEY (idClient) REFERENCES Clients (idClient),
  CONSTRAINT FK_Trip_TO_Reservation FOREIGN KEY (idTrip) REFERENCES Trip (idTrip)
);

CREATE TABLE Payment
(
  idPayment       INT     NOT NULL AUTO_INCREMENT PRIMARY KEY,
  methodOfPayment VARCHAR(50) NOT NULL,
  price           DECIMAL NOT NULL,
  idReservation   INT     NOT NULL,
  CONSTRAINT FK_Reservation_TO_Payment FOREIGN KEY (idReservation) REFERENCES Reservation (idReservation)
);

-- ADD CRUD OPERATION

-- 3.1 CREATE

-- ADD 4 COMPANY 

INSERT INTO TravelCompany (companyName, email) VALUES ('Voyages Aventure', 'contact@voyagesaventure.com');
INSERT INTO TravelCompany (companyName, email) VALUES ('Explorez le Monde', 'info@explorezlemonde.fr');
INSERT INTO TravelCompany (companyName, email) VALUES ('Séjours Paradisiaques', 'reservation@sejourparisiaques.com');
INSERT INTO TravelCompany (companyName, email) VALUES ('Globe Trotter', 'service@globetrotter.fr');

-- create 5 travel transport 

INSERT INTO TravelTransport (idTransport, nameOfCompany, nameOfTransport, type, numberOfPlace)
VALUES (1, 'Air France', 'Airbus A320', 'Airplane', 180);

INSERT INTO TravelTransport (idTransport, nameOfCompany, nameOfTransport, type, numberOfPlace)
VALUES (2, 'SNCF', 'TGV Atlantique', 'Train', 300);

INSERT INTO TravelTransport (idTransport, nameOfCompany, nameOfTransport, type, numberOfPlace)
VALUES (3, 'Eurostar', 'Eurostar 3000', 'Train', 600);

INSERT INTO TravelTransport (idTransport, nameOfCompany, nameOfTransport, type, numberOfPlace)
VALUES (4, 'Lufthansa', 'Boeing 747', 'Airplane', 250);

INSERT INTO TravelTransport (idTransport, nameOfCompany, nameOfTransport, type, numberOfPlace)
VALUES (5, 'SNCF', 'TGV Duplex', 'Train', 500);

INSERT INTO TravelTransport (idTransport, nameOfCompany, nameOfTransport, type, numberOfPlace)
VALUES (6, "JetAir", 'Airbus A380', 'Airplane', 600);

-- create some trip 

INSERT INTO Trip (idTrip, destination, totalPrice, maxPlace , companyName, idTransport)
VALUES (1, 'Paris, France', 1500.00, 4, 'Voyages Aventure', 5);

INSERT INTO Trip (idTrip, destination, totalPrice, maxPlace, companyName, idTransport)
VALUES (2, 'New York, USA', 2500.00, 2, 'Explorez le Monde', 4);

INSERT INTO Trip (idTrip, destination, totalPrice, maxPlace, companyName, idTransport)
VALUES (3, 'Tokyo, Japan', 2000.00, 1, 'Séjours Paradisiaques', 1);

INSERT INTO Trip (idTrip, destination, totalPrice, maxPlace, companyName, idTransport)
VALUES (4, 'Barcelona, Spain', 1800.00, 10, 'Globe Trotter', 3);

INSERT INTO Trip (idTrip, destination, totalPrice, maxPlace, companyName, idTransport)
VALUES (5, 'Rome, Italy', 1700.00, 3, 'Voyages Aventure', 3);

INSERT INTO Trip (idTrip, destination, totalPrice, maxPlace, companyName, idTransport)
VALUES (6, 'London, UK', 1600.00, 1, 'Explorez le Monde', 1);

INSERT INTO Trip (idTrip, destination, totalPrice, maxPlace, companyName, idTransport)
VALUES (7, 'Sydney, Australia', 3500.00, 2, 'Séjours Paradisiaques', 1);

INSERT INTO Trip (idTrip, destination, totalPrice, maxPlace, companyName, idTransport)
VALUES (8, 'Marrakech, Morocco', 1300.00, 25, 'Globe Trotter', 4);

INSERT INTO Trip (idTrip, destination, totalPrice, maxPlace, companyName, idTransport)
VALUES (9, 'Cape Town, South Africa', 2800.00, 1, 'Voyages Aventure', 4);

INSERT INTO Trip (idTrip, destination, totalPrice, maxPlace, companyName, idTransport)
VALUES (10, 'Dubai, UAE', 3000.00, 100, 'Explorez le Monde', 1);

INSERT INTO Trip (idTrip, destination, totalPrice, maxPlace, companyName, idTransport)
VALUES (11, 'Bangkok, Thailand', 2200.00, 8, 'Séjours Paradisiaques', 1);

INSERT INTO Trip (idTrip, destination, totalPrice, maxPlace, companyName, idTransport)
VALUES (12, 'Lisbon, Portugal', 1400.00, 6, 'Globe Trotter', 5);

INSERT INTO Trip (idTrip, destination, totalPrice, maxPlace, companyName, idTransport)
VALUES (13, 'Reykjavik, Iceland', 2600.00, 3, 'Voyages Aventure', 4);

INSERT INTO Trip (idTrip, destination, totalPrice, maxPlace, companyName, idTransport)
VALUES (14, 'San Francisco, USA', 2700.00, 4, 'Explorez le Monde', 1);

INSERT INTO Trip (idTrip, destination, totalPrice, maxPlace, companyName, idTransport)
VALUES (15, 'Bali, Indonesia', 3200.00, 2, 'Séjours Paradisiaques', 1);

INSERT INTO Trip (idTrip, destination, totalPrice, maxPlace, companyName, idTransport)
VALUES (16, 'Berlin, Germany', 1500.00, 10, 'Globe Trotter', 5);

INSERT INTO Trip (idTrip, destination, totalPrice, maxPlace, companyName, idTransport)
VALUES (17, 'Havana, Cuba', 2400.00, 5, 'Voyages Aventure', 4);

INSERT INTO Trip (idTrip, destination, totalPrice, maxPlace, companyName, idTransport)
VALUES (18, 'Montreal, Canada', 2300.00, 3, 'Explorez le Monde', 1);

INSERT INTO Trip (idTrip, destination, totalPrice, maxPlace, companyName, idTransport)
VALUES (19, 'Maldives', 4000.00, 2, 'Séjours Paradisiaques', 1);

INSERT INTO Trip (idTrip, destination, totalPrice, maxPlace, companyName, idTransport)
VALUES (20, 'Amsterdam, Netherlands', 1600.00, 8, 'Globe Trotter', 2);

-- ADD 20 FAKE CLIENTS IN THE TABLE CLIENTS 

INSERT INTO Clients (idClient, name, firstName, email, phoneNumber, companyName) VALUES (1, 'Mallet', 'Sébastien', 'vpinto@lebon.fr', '+33 4 61 16 85 03', 'Voyages Aventure');
INSERT INTO Clients (idClient, name, firstName, email, phoneNumber, companyName) VALUES (2, 'Normand', 'Michel', 'ericlevy@blanchard.com', '+33 (0)1 78 97 92 73', 'Explorez le Monde');
INSERT INTO Clients (idClient, name, firstName, email, phoneNumber, companyName) VALUES (3, 'Chartier', 'Adélaïde', 'renaudalfred@bonnin.com', '+33 (0)8 07 31 56 15', 'Séjours Paradisiaques');
INSERT INTO Clients (idClient, name, firstName, email, phoneNumber, companyName) VALUES (4, 'Leclercq', 'Maryse', 'lecoqantoinette@remy.com', '+33 1 80 48 84 24', 'Globe Trotter');
INSERT INTO Clients (idClient, name, firstName, email, phoneNumber, companyName) VALUES (5, 'Blanchet', 'Honoré', 'alexandriepruvost@dbmail.com', '+33 (0)4 14 48 24 91', 'Voyages Aventure');
INSERT INTO Clients (idClient, name, firstName, email, phoneNumber, companyName) VALUES (6, 'Cordier', 'Françoise', 'henri39@live.com', '02 32 93 54 27', 'Explorez le Monde');
INSERT INTO Clients (idClient, name, firstName, email, phoneNumber, companyName) VALUES (7, 'Gay', 'Pénélope', 'marie.lamy@laposte.net', '06 49 20 79 91', 'Séjours Paradisiaques');
INSERT INTO Clients (idClient, name, firstName, email, phoneNumber, companyName) VALUES (8, 'Dupont', 'Jean', 'jeandupont@example.com', '+33 1 45 67 89 10', 'Globe Trotter');
INSERT INTO Clients (idClient, name, firstName, email, phoneNumber, companyName) VALUES (9, 'Lemoine', 'Claire', 'clairelemoine@aol.com', '+33 2 34 56 78 90', 'Voyages Aventure');
INSERT INTO Clients (idClient, name, firstName, email, phoneNumber, companyName) VALUES (10, 'Bertrand', 'Pierre', 'pierrebertrand@outlook.fr', '+33 (0)6 12 34 56 78', 'Explorez le Monde');
INSERT INTO Clients (idClient, name, firstName, email, phoneNumber, companyName) VALUES (11, 'Faure', 'Julien', 'julienfaure@orange.fr', '+33 3 56 78 90 12', 'Séjours Paradisiaques');
INSERT INTO Clients (idClient, name, firstName, email, phoneNumber, companyName) VALUES (12, 'Michel', 'Lucie', 'luciemichel@free.fr', '+33 1 23 45 67 89', 'Globe Trotter');
INSERT INTO Clients (idClient, name, firstName, email, phoneNumber, companyName) VALUES (13, 'Roux', 'Franck', 'franckroux@laposte.net', '+33 6 78 90 12 34', 'Voyages Aventure');
INSERT INTO Clients (idClient, name, firstName, email, phoneNumber, companyName) VALUES (14, 'Dumas', 'Sophie', 'sophiedumas@icloud.com', '+33 2 67 89 01 23', 'Explorez le Monde');
INSERT INTO Clients (idClient, name, firstName, email, phoneNumber, companyName) VALUES (15, 'Lemoine', 'André', 'andrelemoine@protonmail.com', '+33 (0)1 56 23 45 67', 'Séjours Paradisiaques');
INSERT INTO Clients (idClient, name, firstName, email, phoneNumber, companyName) VALUES (16, 'Giraud', 'Mélanie', 'melaniegiraud@gnail.com', '+33 4 56 78 90 12', 'Globe Trotter');
INSERT INTO Clients (idClient, name, firstName, email, phoneNumber, companyName) VALUES (17, 'Lemoine', 'David', 'davidlemoine@yahoo.fr', '+33 1 78 90 12 34', 'Voyages Aventure');
INSERT INTO Clients (idClient, name, firstName, email, phoneNumber, companyName) VALUES (18, 'Boucher', 'Valérie', 'valerieboucher@outlook.com', '+33 2 45 67 89 01', 'Explorez le Monde');
INSERT INTO Clients (idClient, name, firstName, email, phoneNumber, companyName) VALUES (19, 'Sauvage', 'Martine', 'martinesauvage@orange.fr', '+33 3 34 56 78 90', 'Séjours Paradisiaques');
INSERT INTO Clients (idClient, name, firstName, email, phoneNumber, companyName) VALUES (20, 'Legrand', 'Bernard', 'bernardlegrand@live.fr', '+33 6 12 45 67 89', 'Globe Trotter');

-- ADD 5 HOSTS

INSERT INTO Host (idHost, hostName, category, numberOfPlace, idTrip) VALUES (1, 'Le Grand Hôtel', 'Luxury', 150, 1);
INSERT INTO Host (idHost, hostName, category, numberOfPlace, idTrip) VALUES (2, 'Camping Le Soleil', 'Budget', 50, 2);
INSERT INTO Host (idHost, hostName, category, numberOfPlace, idTrip) VALUES (3, 'Auberge de la Montagne', 'Mid-Range', 80, 3);
INSERT INTO Host (idHost, hostName, category, numberOfPlace, idTrip) VALUES (4, 'Château de Luxe', 'Luxury', 30, 4);
INSERT INTO Host (idHost, hostName, category, numberOfPlace, idTrip) VALUES (5, 'Hôtel Bon Séjour', 'Mid-Range', 120, 5);
INSERT INTO Host (idHost, hostName, category, numberOfPlace, idTrip) VALUES (6, 'Resort de la Mer', 'Luxury', 100, 6);
INSERT INTO Host (idHost, hostName, category, numberOfPlace, idTrip) VALUES (7, 'Auberge du Routard', 'Budget', 40, 7);
INSERT INTO Host (idHost, hostName, category, numberOfPlace, idTrip) VALUES (8, 'Villa Soleil', 'Mid-Range', 70, 8);
INSERT INTO Host (idHost, hostName, category, numberOfPlace, idTrip) VALUES (9, 'Palace des Sables', 'Luxury', 200, 9);
INSERT INTO Host (idHost, hostName, category, numberOfPlace, idTrip) VALUES (10, 'Hostel City Center', 'Budget', 60, 10);
INSERT INTO Host (idHost, hostName, category, numberOfPlace, idTrip) VALUES (11, 'Maison Tropicale', 'Mid-Range', 90, 11);
INSERT INTO Host (idHost, hostName, category, numberOfPlace, idTrip) VALUES (12, 'Hôtel Atlantique', 'Luxury', 110, 12);
INSERT INTO Host (idHost, hostName, category, numberOfPlace, idTrip) VALUES (13, 'Camping des Neiges', 'Budget', 35, 13);
INSERT INTO Host (idHost, hostName, category, numberOfPlace, idTrip) VALUES (14, 'Riad du Désert', 'Mid-Range', 85, 14);
INSERT INTO Host (idHost, hostName, category, numberOfPlace, idTrip) VALUES (15, 'Villa Paradis', 'Luxury', 60, 15);
INSERT INTO Host (idHost, hostName, category, numberOfPlace, idTrip) VALUES (16, 'Auberge Berlinoise', 'Mid-Range', 75, 16);
INSERT INTO Host (idHost, hostName, category, numberOfPlace, idTrip) VALUES (17, 'Casa Cubana', 'Budget', 45, 17);
INSERT INTO Host (idHost, hostName, category, numberOfPlace, idTrip) VALUES (18, 'Hôtel Saint-Laurent', 'Luxury', 130, 18);
INSERT INTO Host (idHost, hostName, category, numberOfPlace, idTrip) VALUES (19, 'Bungalow Océan', 'Mid-Range', 50, 19);
INSERT INTO Host (idHost, hostName, category, numberOfPlace, idTrip) VALUES (20, 'Hôtel des Canaux', 'Mid-Range', 95, 20);

-- ADD 5 guides/contacts to each host 

INSERT INTO GuidesContact (name, languages, idHost) VALUES ('John Doe', 'English, Spanish', 1);
INSERT INTO GuidesContact (name, languages, idHost) VALUES ('Jane Smith', 'French, German', 2);
INSERT INTO GuidesContact (name, languages, idHost) VALUES ('Mark Thompson', 'Italian, English', 3);
INSERT INTO GuidesContact (name, languages, idHost) VALUES ('Elena Rodriguez', 'Spanish, Portuguese', 4);
INSERT INTO GuidesContact (name, languages, idHost) VALUES ('Lucie Dupont', 'French, English', 5);
INSERT INTO GuidesContact (name, languages, idHost) VALUES ('Carlos Mendes', 'Portuguese, English', 6);
INSERT INTO GuidesContact (name, languages, idHost) VALUES ('Emily Johnson', 'English, German', 7);
INSERT INTO GuidesContact (name, languages, idHost) VALUES ('Nadia Karim', 'Arabic, French', 8);
INSERT INTO GuidesContact (name, languages, idHost) VALUES ('Kenji Sato', 'Japanese, English', 9);
INSERT INTO GuidesContact (name, languages, idHost) VALUES ('Sophie Müller', 'German, English', 10);
INSERT INTO GuidesContact (name, languages, idHost) VALUES ('Ahmed El-Fassi', 'Arabic, French', 11);
INSERT INTO GuidesContact (name, languages, idHost) VALUES ('Isabelle Laurent', 'French, Spanish', 12);
INSERT INTO GuidesContact (name, languages, idHost) VALUES ('Hiro Tanaka', 'Japanese, English', 13);
INSERT INTO GuidesContact (name, languages, idHost) VALUES ('Pablo García', 'Spanish, English', 14);
INSERT INTO GuidesContact (name, languages, idHost) VALUES ('Anna Kowalska', 'Polish, English', 15);
INSERT INTO GuidesContact (name, languages, idHost) VALUES ('Jürgen Schmidt', 'German, French', 16);
INSERT INTO GuidesContact (name, languages, idHost) VALUES ('Maria Gonzalez', 'Spanish, Portuguese', 17);
INSERT INTO GuidesContact (name, languages, idHost) VALUES ('Luca Bianchi', 'Italian, English', 18);
INSERT INTO GuidesContact (name, languages, idHost) VALUES ('Chloe Martin', 'French, English', 19);
INSERT INTO GuidesContact (name, languages, idHost) VALUES ('Theo Janssen', 'Dutch, English', 20);

-- ADD the 5 adress for each host

INSERT INTO HostAddress (country, city, street, streetNumber, idHost) VALUES ('France', 'Paris', 'Rue de Rivoli', 12, 1);
INSERT INTO HostAddress (country, city, street, streetNumber, idHost) VALUES ('USA', 'New York', 'Verdun street', 45, 2);
INSERT INTO HostAddress (country, city, street, streetNumber, idHost) VALUES ('Japan', 'Tokyo', 'Takeshita Street', 3, 3);
INSERT INTO HostAddress (country, city, street, streetNumber, idHost) VALUES ('Spain', 'Barcelona', 'La Rambla', 22, 4);
INSERT INTO HostAddress (country, city, street, streetNumber, idHost) VALUES ('Italy', 'Rome', 'Piazza Novana', 99, 5);
INSERT INTO HostAddress (country, city, street, streetNumber, idHost) VALUES ('UK', 'London', 'Baker Street', 221, 6);
INSERT INTO HostAddress (country, city, street, streetNumber, idHost) VALUES ('Australia', 'Sydney', 'George Street', 87, 7);
INSERT INTO HostAddress (country, city, street, streetNumber, idHost) VALUES ('Morocco', 'Marrakech', 'Rue Yves Saint Laurent', 15, 8);
INSERT INTO HostAddress (country, city, street, streetNumber, idHost) VALUES ('South Africa', 'Cape Town', 'Long Street', 34, 9);
INSERT INTO HostAddress (country, city, street, streetNumber, idHost) VALUES ('UAE', 'Dubai', 'Sheikh Zayed Road', 10, 10);
INSERT INTO HostAddress (country, city, street, streetNumber, idHost) VALUES ('France', 'Bordeaux', 'Cours de l’Intendance', 25, 11);
INSERT INTO HostAddress (country, city, street, streetNumber, idHost) VALUES ('Germany', 'Berlin', 'Unter den Linden', 5, 12);
INSERT INTO HostAddress (country, city, street, streetNumber, idHost) VALUES ('France', 'Chamonix', 'Avenue Michel Croz', 8, 13);
INSERT INTO HostAddress (country, city, street, streetNumber, idHost) VALUES ('Morocco', 'Fès', 'Rue Talaa Kebira', 42, 14);
INSERT INTO HostAddress (country, city, street, streetNumber, idHost) VALUES ('Italy', 'Florence', 'Via de’ Tornabuoni', 18, 15);
INSERT INTO HostAddress (country, city, street, streetNumber, idHost) VALUES ('Germany', 'Munich', 'Maximilianstrasse', 9, 16);
INSERT INTO HostAddress (country, city, street, streetNumber, idHost) VALUES ('Cuba', 'Havana', 'Calle Obispo', 56, 17);
INSERT INTO HostAddress (country, city, street, streetNumber, idHost) VALUES ('Canada', 'Montreal', 'Rue Sainte-Catherine', 101, 18);
INSERT INTO HostAddress (country, city, street, streetNumber, idHost) VALUES ('Thailand', 'Bangkok', 'Sukhumvit Road', 77, 19);
INSERT INTO HostAddress (country, city, street, streetNumber, idHost) VALUES ('Netherlands', 'Amsterdam', 'Prinsengracht', 104, 20);

-- Create a reservation for each clients

INSERT INTO Reservation (idReservation, stateOfReservation, dateOfReservation, idClient, idTrip)
VALUES (1, 'Confirmed', '2025-02-28', 1, 1),
       (2, 'In Progress', '2025-03-15', 2, 2),
       (3, 'Cancelled', '2025-04-01', 3, 1),
       (4, 'Confirmed', '2025-01-20', 4, 4),
       (5, 'Confirmed', '2025-03-10', 5, 5),
       (6, 'In Progress', '2025-02-05', 6, 10),
       (7, 'Cancelled', '2025-04-12', 7, 7),
       (8, 'Confirmed', '2025-01-30', 8, 8),
       (9, 'Confirmed', '2025-04-10', 9, 1),
       (10, 'In Progress', '2025-02-18', 10, 10),
       (11, 'In Progress', '2025-03-01', 11, 1),
       (12, 'Cancelled', '2025-02-25', 12, 2),
       (13, 'Confirmed', '2025-03-20', 13, 3),
       (14, 'Confirmed', '2025-01-28', 14, 4),
       (15, 'In Progress', '2025-04-05', 15, 5),
       (16, 'Cancelled', '2025-02-13', 16, 8),
       (17, 'Confirmed', '2025-03-08', 17, 7),
       (18, 'In Progress', '2025-03-22', 18, 8),
       (19, 'Cancelled', '2025-02-10', 19, 8),
       (20, 'Confirmed', '2025-04-04', 20, 10);

-- Create payment for each reservation

INSERT INTO Payment (idPayment, methodOfPayment, price, idReservation)
VALUES (1, 'Credit Card', 1500.00, 1),
       (2, 'PayPal', 2500.00, 2),
       (3, 'Bank Transfer', 1500.00, 3),
       (4, 'Credit Card', 1800.00, 4),
       (5, 'PayPal', 1700.00, 5),
       (6, 'Bank Transfer', 3000.00, 6),
       (7, 'Credit Card', 3500.00, 7),
       (8, 'PayPal', 1300.00, 8),
       (9, 'Bank Transfer', 1500.00, 9),
       (10, 'Credit Card', 3000.00, 10),
        (11, 'Bank Transfer', 1500.00, 11),
       (12, 'PayPal', 2500.00, 12),
       (13, 'Credit Card', 2000.00, 13),
       (14, 'Bank Transfer', 1800.00, 14),
       (15, 'PayPal', 1700.00, 15),
       (16, 'Credit Card', 1300.00, 16),
       (17, 'Bank Transfer', 3500.00, 17),
       (18, 'PayPal', 1300.00, 18),
       (19, 'Credit Card', 1300.00, 19),
       (20, 'Bank Transfer', 3000.00, 20);


-- 3.2 READ

-- select all the trip and their informations

SELECT Trip.idTrip, Trip.destination, trip.totalPrice, 
host.hostName, host.category, 
transport.nameOfTransport, transport.type
FROM trip
LEFT JOIN host ON trip.idTrip = host.idTrip
LEFT JOIN traveltransport AS transport ON Trip.idTrip = transport.idTRIP;

-- display the reservations of one client with his payment states

SELECT Reservation.idReservation, Reservation.stateOfReservation, Reservation.dateOfReservation,
Payment.methodOfPayment, Payment.price
FROM reservation
INNER JOIN Payment ON Reservation.idReservation = Payment.idReservation 
WHERE reservation.idClient = 2;

-- select all the transport for a trip

SELECT transport.nameOfTransport, transport.type, transport.numberOfPlace,
trip.destination
FROM traveltransport AS transport
INNER JOIN trip
	ON trip.idTrip = transport.idTrip
WHERE trip.destination = "Paris, France";

-- Consult the information about a company and his trip

SELECT travelcompany.companyName, travelcompany.email,
trip.destination, trip.totalPrice, trip.maxPlace
FROM travelcompany
INNER JOIN trip
	ON trip.companyName = travelCompany.companyName
WHERE travelcompany.companyName = "Globe Trotter";
 


-- 3.3 UPDATE 

-- update the informations about a clients 

UPDATE clients
SET NAME = "Patou",
	firstName = "Hugo",
	email = "hugo@hotmail.com",
	phoneNumber = "04.98/58.55.44"
WHERE idClient = 1;
	

-- update a states of a reservation

UPDATE reservation
SET stateOfReservation = "Canceled"
WHERE idReservation = 2;
	
-- change the informations about a trip

UPDATE trip
SET Destination = "Bruxelles, Belgique",
	totalPrice = 50, 
	MaxPlace = 10, 
	CompanyName = "Globe Trotter"
WHERE idTrip = 1;




-- DELETE 

-- delete a reservation with DELETE ON CASCADE if needed

ALTER TABLE Payment
DROP FOREIGN KEY FK_Reservation_TO_Payment;


ALTER TABLE Payment
ADD CONSTRAINT FK_Reservation_TO_Payment
FOREIGN KEY (idReservation) REFERENCES Reservation(idReservation)
ON DELETE CASCADE;


DELETE FROM reservation WHERE idReservation = 3;

-- delete a method of payment no use 

DELETE FROM payment 
WHERE methodOfPayment = "Cash"
AND idReservation IS NULL;

-- delete a transport which is no longer available

-- To keep the trip and remplace the mode of transport
UPDate Trip 
SET idTransport = 6
WHERE idTransport = 1;

DELETE FROM TravelTransport
WHERE idTransport =1;

-- OR if you wante delete the trip associate

ALTER TABLE Trip
DROP FOREIGN KEY FK_Trip_TO_travelTransport;

ALTER TABLE Trip
ADD CONSTRAINT FK_Trip_TO_travelTransport FOREIGN KEY (idTransport) REFERENCES Traveltransport (idTransport)
ON DELETE CASCADE;

DELETE FROM TravelTransport 
WHERE idTransport = 1;



-- 4. SOME BONUS QUESTIONS

-- 1  find all company which gets at least 1 aiplane

SELECT nameOfCompany
FROM traveltransport
WHERE TYPE = "Airplane"
GROUP BY nameOfCompany;


-- 2 select all the transport with their company name

SELECT nameOfTransport, nameOfCompany
FROM traveltransport; 	


-- 3 display all the transport with more than 200 places

SELECT nameOfTransport, nameOfCompany
FROM traveltransport
WHERE numberOfPlace > 200; 	

-- 4 select the host and the main contact

SELECT hostName, category, guidescontact.name
FROM host
INNER JOIN guidescontact
	ON Host.idHost = guidescontact.idHost;

-- 5 select the contact of the hosting in Switzerland

SELECT host.hostName, guidesContact.name, HostAddress.country
FROM host
INNER JOIN guidescontact
    ON host.idHost = guidescontact.idHost
INNER JOIN HostAddress
    ON host.idHost = HostAddress.idHost
WHERE HostAddress.country = 'Suisse';


-- 6 create a belgium trip ( 3 days to Plopsaland) with max 50 places

INSERT INTO trip (destination, totalPrice, maxPlace, companyName, idTransport)
VALUES ( 'Belgium, De Panne', 100, 50, 'Globe Trotter', 2);

-- 7 add some client payments etc...

INSERT INTO clients (NAME, firstName, email, phoneNumber)
VALUES ('Martin', 'Thomas', 'thomas.martin@email.com', '+33623456789'),
		('Leroy', 'Sophie', 'sophie.leroy@email.com', '+33634567890'),
('Dupont', 'Marie', 'marie.dupont@email.com', '+33612345678');

INSERT INTO REservation (StateOfReservation, idClient, idTrip)
VALUES ('In Progress', 21 ,24),
			('In Progress', 22 ,24),
			('In Progress', 23 ,24);

INSERT INTO Payment (methodOfPayment, price, idReservation)
VALUES ('Cash', 100 ,21),
			('Credit Card', 100 ,22),
			('Credit Card', 100 ,23);