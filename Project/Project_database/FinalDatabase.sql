-- Tabla User
CREATE TABLE "User" (
    PKID SERIAL PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Country VARCHAR(255),
    Email VARCHAR(255) UNIQUE NOT NULL,
    Password VARCHAR(255) NOT NULL
);

-- Tabla Device
CREATE TABLE Device (
    PKID SERIAL PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Model VARCHAR(255) NOT NULL,
    OS VARCHAR(255) NOT NULL
);

-- Tabla Device_User
CREATE TABLE Device_User (
    PK_FK1_Id_Device INT,
    FK2_Id_User INT,
    PRIMARY KEY (PK_FK1_Id_Device, FK2_Id_User),
    FOREIGN KEY (PK_FK1_Id_Device) REFERENCES Device(PKID),
    FOREIGN KEY (FK2_Id_User) REFERENCES "User"(PKID)
);

-- Tabla Category
CREATE TABLE Category (
    PKID SERIAL PRIMARY KEY,
    Name VARCHAR(255) NOT NULL
);

-- Tabla App
CREATE TABLE App (
    PKID SERIAL PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    FK_ID_Category INT,
    Downloads INT DEFAULT 0,
    FOREIGN KEY (FK_ID_Category) REFERENCES Category(PKID)
);

-- Tabla User_App
CREATE TABLE User_App (
    PK_FK1_Id_User INT,
    FK_Device INT,
    PRIMARY KEY (PK_FK1_Id_User, FK_Device),
    FOREIGN KEY (PK_FK1_Id_User) REFERENCES "User"(PKID),
    FOREIGN KEY (FK_Device) REFERENCES App(PKID)
);

-- Tabla Payment
CREATE TABLE Payment (
    PKID SERIAL PRIMARY KEY,
    Type VARCHAR(255) NOT NULL
);

-- Tabla User_Payment
CREATE TABLE User_Payment (
    PK_FK1_Id_User INT,
    FK2_Id_Payment INT,
    PRIMARY KEY (PK_FK1_Id_User, FK2_Id_Payment),
    FOREIGN KEY (PK_FK1_Id_User) REFERENCES "User"(PKID),
    FOREIGN KEY (FK2_Id_Payment) REFERENCES Payment(PKID)
);

-- Tabla Earn
CREATE TABLE Earn (
    PKID SERIAL PRIMARY KEY,
    Sale DECIMAL(10, 2) NOT NULL,
    FK_ID_App INT,
    FOREIGN KEY (FK_ID_App) REFERENCES App(PKID)
);

-- Tabla Download
CREATE TABLE Download (
    PKID SERIAL PRIMARY KEY,
    Date TIMESTAMP NOT NULL,
    FK_ID_User INT,
    FK_ID_App INT,
    FOREIGN KEY (FK_ID_User) REFERENCES "User"(PKID),
    FOREIGN KEY (FK_ID_App) REFERENCES App(PKID)
);

-- Tabla Review
CREATE TABLE Review (
    PKID SERIAL PRIMARY KEY,
    Rating INT NOT NULL,
    Comment TEXT,
    FK_ID_User INT,
    FK_ID_App INT,
    FOREIGN KEY (FK_ID_User) REFERENCES "User"(PKID),
    FOREIGN KEY (FK_ID_App) REFERENCES App(PKID)
);

-- Tabla Dev
CREATE TABLE Dev (
    PKID SERIAL PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Company VARCHAR(255)
);

-- Tabla App_Dev
CREATE TABLE App_Dev (
    PK_FK1_Id_App INT,
    FK2_Id_Dev INT,
    PRIMARY KEY (PK_FK1_Id_App, FK2_Id_Dev),
    FOREIGN KEY (PK_FK1_Id_App) REFERENCES App(PKID),
    FOREIGN KEY (FK2_Id_Dev) REFERENCES Dev(PKID)
);

-- Tabla Subscription
CREATE TABLE Subscription (
    PKID SERIAL PRIMARY KEY,
    Type VARCHAR(255) NOT NULL,
    StartDate DATE NOT NULL,
    EndDate DATE,
    FK_ID_User INT,
    FOREIGN KEY (FK_ID_User) REFERENCES "User"(PKID)
);

-- Tabla Invoice
CREATE TABLE Invoice (
    PKID SERIAL PRIMARY KEY,
    Date DATE NOT NULL,
    Amount DECIMAL(10, 2) NOT NULL,
    FK_ID_Subscription INT,
    FOREIGN KEY (FK_ID_Subscription) REFERENCES Subscription(PKID)
);
