CREATE TABLE Device (
    ID INT PRIMARY KEY,
    Name VARCHAR(100),
    Brand VARCHAR(100),
    Model VARCHAR(100),
    Ram VARCHAR(50),
    GPU VARCHAR(50),
    Resolution VARCHAR(50),
    OS_version VARCHAR(50)
);

CREATE TABLE App (
    ID INT PRIMARY KEY,
    Name VARCHAR(100),
    Description TEXT,
    Price DECIMAL(10, 2),
    App_Category INT,
    User_ID INT,
    release_date DATE,
    Version VARCHAR(50),
    Downloads INT,
    Evnts VARCHAR(100),
    Reviews TEXT,
    rating DECIMAL(3, 2),
    Sponsor_ads INT,
    Region_ID INT,
    Device_ID INT,
    Size VARCHAR(50),
    FOREIGN KEY (App_Category) REFERENCES Category(ID),
    FOREIGN KEY (User_ID) REFERENCES User(ID),
    FOREIGN KEY (Sponsor_ads) REFERENCES Sponsor_Ads(ID),
    FOREIGN KEY (Region_ID) REFERENCES Region(ID),
    FOREIGN KEY (Device_ID) REFERENCES Device(ID)
);

CREATE TABLE User (
    ID INT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Password VARCHAR(100),
    Birth_date DATE,
    User_type INT,
    RegisterDate DATE,
    App_library INT,
    Reviews INT,
    Devices INT,
    Payment_method INT,
    Region_ID INT,
    FOREIGN KEY (User_type) REFERENCES Type_User(ID),
    FOREIGN KEY (App_library) REFERENCES App_library(ID),
    FOREIGN KEY (Reviews) REFERENCES Review(ID),
    FOREIGN KEY (Devices) REFERENCES Device(ID),
    FOREIGN KEY (Payment_method) REFERENCES Payment_Method(ID),
    FOREIGN KEY (Region_ID) REFERENCES Region(ID)
);

CREATE TABLE Review (
    ID INT PRIMARY KEY,
    User_ID INT,
    App_ID INT,
    Text TEXT,
    Rate INT,
    Review_date DATE,
    FOREIGN KEY (User_ID) REFERENCES User(ID),
    FOREIGN KEY (App_ID) REFERENCES App(ID)
);

CREATE TABLE Payment_Method (
    ID INT PRIMARY KEY,
    Card_number VARCHAR(20),
    CVV INT,
    expiration_date DATE
);

CREATE TABLE Type_User (
    ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Description TEXT
);

CREATE TABLE App_library (
    ID INT PRIMARY KEY,
    User_id INT,
    Description TEXT,
    FOREIGN KEY (User_id) REFERENCES User(ID)
);

CREATE TABLE User_App_library (
    id_user INT,
    id_app_library INT,
    PRIMARY KEY (id_user, id_app_library),
    FOREIGN KEY (id_user) REFERENCES User(ID),
    FOREIGN KEY (id_app_library) REFERENCES App_library(ID)
);

CREATE TABLE Device_App (
    id_app INT,
    id_Device INT,
    PRIMARY KEY (id_app, id_Device),
    FOREIGN KEY (id_app) REFERENCES App(ID),
    FOREIGN KEY (id_Device) REFERENCES Device(ID)
);

CREATE TABLE Device_User (
    id_user INT,
    id_Device INT,
    PRIMARY KEY (id_user, id_Device),
    FOREIGN KEY (id_user) REFERENCES User(ID),
    FOREIGN KEY (id_Device) REFERENCES Device(ID)
);

CREATE TABLE Sponsor_Ads (
    ID INT PRIMARY KEY,
    Name VARCHAR(100),
    Extra VARCHAR(100),
    Video VARCHAR(100),
    Category_ID INT,
    Region_ID INT,
    FOREIGN KEY (Category_ID) REFERENCES Category(ID),
    FOREIGN KEY (Region_ID) REFERENCES Region(ID)
);

CREATE TABLE Sponsor_ads_app (
    id_app INT,
    id_Sponsor_ads INT,
    PRIMARY KEY (id_app, id_Sponsor_ads),
    FOREIGN KEY (id_app) REFERENCES App(ID),
    FOREIGN KEY (id_Sponsor_ads) REFERENCES Sponsor_Ads(ID)
);

CREATE TABLE User_App (
    id_user INT,
    id_app INT,
    PRIMARY KEY (id_user, id_app),
    FOREIGN KEY (id_user) REFERENCES User(ID),
    FOREIGN KEY (id_app) REFERENCES App(ID)
);

CREATE TABLE Category (
    ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Description TEXT
);

CREATE TABLE Region (
    ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Description TEXT
);
