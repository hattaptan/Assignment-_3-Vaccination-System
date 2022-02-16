   CREATE DATABASE db_vaccine; 

    CREATE TABLE Citizen(
    Citizen_Id int NOT NULL,
    Name varchar(25) NOT NULL,
    Surname varchar(25) NOT NULL,
    Gender varchar(6) NULL,
    age int NOT NULL,  
    hes_code varchar(30) NOT NULL,
    city varchar(50) NOT NULL, 
    district varchar(50) NOT NULL, 
    address varchar(100) NOT NULL, 
     CONSTRAINT PK_Citizen PRIMARY KEY(Citizen_Id));

    CREATE TABLE Application(
    Application_Id int NOT NULL,
    Citizen_Id int NOT NULL,
    State_of_health varchar(20) NOT NULL DEFAULT 'Risk-Free',
    Phone_number varchar(30) NOT NULL,
    Vaccination_info varchar(30) NOT NULL DEFAULT 'Unvaccinated',
    CONSTRAINT PK_Application PRIMARY KEY(Application_Id),
    CONSTRAINT FK_Application FOREIGN KEY (Citizen_Id)
    REFERENCES Citizen (Citizen_Id));

    CREATE TABLE Health_Place(
    Place_id int NOT NULL,
    Place_Name varchar(50) NOT NULL,
    Place_City varchar(50) NOT NULL, 
    Place_District varchar(50) NOT NULL, 
    Place_Address varchar(100) NOT NULL, 
    CONSTRAINT PK_Health_Place PRIMARY KEY(Place_id));


    CREATE TABLE Health_Worker(
    Worker_Id int NOT NULL,
    Name varchar(25) NOT NULL,
    Surname varchar(25) NOT NULL,
    Place_id int NOT NULL,   
    CONSTRAINT PK_Health_Worker PRIMARY KEY(Worker_Id), 
    CONSTRAINT FK_Health_Worker FOREIGN KEY (Place_id)
    REFERENCES Health_Place (Place_id));

    CREATE TABLE Vaccine(
    Vaccine_Id int NOT NULL,
    Vaccine_Name varchar(25) NOT NULL,
    Produced_In varchar(25) NOT NULL, 
    CONSTRAINT PK_Vaccine PRIMARY KEY(Vaccine_Id));


    CREATE TABLE Operation(
    Action_Id int NOT NULL,
    Worker_Id int NOT NULL,
    Citizen_Id int NOT NULL,
    Vaccine_Id int NOT NULL,
    Vaccination_date date NOT NULL,
    CONSTRAINT PK_Operation PRIMARY KEY(Action_Id), 
    CONSTRAINT FK_Operation FOREIGN KEY (Worker_Id)
    REFERENCES Health_Worker (Worker_Id),
    CONSTRAINT FK_Operation2 FOREIGN KEY (Citizen_Id)
    REFERENCES Citizen (Citizen_Id),
    CONSTRAINT FK_Operation3 FOREIGN KEY (Vaccine_Id)
    REFERENCES Vaccine (Vaccine_Id)    );


INSERT INTO citizen VALUES (1, 'Mehmet', 'Kurt', 'Male', 70, 'X6B3-5434-76', 'Van', 'Edremit', '1939 Cad. No:12/5');
INSERT INTO citizen VALUES (2, 'Seda', 'Hak', 'Female', 45, 'Y6B3-5434-12', 'Gaziantep', 'Nizip', '1955 Sok. No:34-2');
INSERT INTO citizen VALUES (3, 'Ali', 'Aslan', 'Male', 67, 'R8B3-5434-55', 'Afyon', 'Sandýklý', '150 sok. No:2/5');

INSERT INTO application VALUES (1, 1, 'risk-free', '05534849876', 'vaccinated');
INSERT INTO application VALUES (2, 2, 'risky', '05443785858', 'vaccinated');

INSERT INTO health_place VALUES (1, '1 Nolu Saðlýk Ocaðý', 'Gaziantep', 'Nizip', 'Fazýl Cad. No:2');
INSERT INTO health_place VALUES (2, 'Dokuz Eylül University Hospital', 'Ýzmir', 'Alsancak', 'Demokrasi Cad. No:5');
INSERT INTO health_place VALUES (3, '2 Nolu Saðlýk Ocaðý', 'Van', 'Edremit', 'Cumhuriyet Cad. No:5');

INSERT INTO health_worker VALUES (1, 'Mert', 'Saraç', 1);
INSERT INTO health_worker VALUES (2, 'Cansu', 'Sakarcan', 2);
INSERT INTO health_worker VALUES (3, 'Serpil', 'Yandan', 3);

INSERT INTO vaccine VALUES (1, 'Biontech', 'Germany');
INSERT INTO vaccine VALUES (2, 'Sinovac', 'China');

INSERT INTO operation VALUES (3, 2, 3, 2, '2021-06-20');
INSERT INTO operation VALUES (2, 2, 2, 1, '2021-06-25');
INSERT INTO operation VALUES (1, 1, 1, 1, '2021-06-21');





