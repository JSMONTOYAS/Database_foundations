-- Insertar datos en la tabla Type_User
INSERT INTO Type_User (ID, Name, Description) VALUES
(1, 'Admin', 'Administrator with full access'),
(2, 'Regular', 'Regular user with limited access');

-- Insertar datos en la tabla Region
INSERT INTO Region (ID, Name, Description) VALUES
(1, 'North America', 'Region covering North America'),
(2, 'Europe', 'Region covering Europe');

-- Insertar datos en la tabla Payment_Method
INSERT INTO Payment_Method (ID, Card_number, CVV, expiration_date) VALUES
(1, '1234567890123456', 123, '2025-12-31'),
(2, '6543210987654321', 456, '2026-11-30');

-- Insertar datos en la tabla Device
INSERT INTO Device (ID, Name, Brand, Model, Ram, GPU, Resolution, OS_version) VALUES
(1, 'iPhone 12', 'Apple', 'A2403', '4GB', 'Apple GPU', '1170 x 2532', 'iOS 14'),
(2, 'Galaxy S21', 'Samsung', 'SM-G991B', '8GB', 'Mali-G78 MP14', '1080 x 2400', 'Android 11');

-- Insertar datos en la tabla Category
INSERT INTO Category (ID, Name, Description) VALUES
(1, 'Games', 'All kinds of games'),
(2, 'Productivity', 'Productivity and office apps');

-- Insertar datos en la tabla User
INSERT INTO User (ID, Name, Email, Password, Birth_date, User_type, RegisterDate, App_library, Reviews, Devices, Payment_method, Region_ID) VALUES
(1, 'John Doe', 'john.doe@example.com', 'password123', '1990-01-01', 2, '2022-01-15', 1, 1, 1, 1, 1),
(2, 'Jane Smith', 'jane.smith@example.com', 'password456', '1985-05-05', 1, '2022-02-20', 2, 2, 2, 2, 2);

-- Insertar datos en la tabla App
INSERT INTO App (ID, Name, Description, Price, App_Category, User_ID, release_date, Version, Downloads, Evnts, Reviews, rating, Sponsor_ads, Region_ID, Device_ID, Size) VALUES
(1, 'Angry Birds', 'Popular game', 0.99, 1, 1, '2021-01-01', '1.0', 1000000, 'Event1', 'Great game!', 4.5, 1, 1, 1, '50MB'),
(2, 'Microsoft Word', 'Productivity app', 9.99, 2, 2, '2020-01-01', '2.0', 500000, 'Event2', 'Very useful!', 4.7, 2, 2, 2, '200MB');

-- Insertar datos en la tabla Review
INSERT INTO Review (ID, User_ID, App_ID, Text, Rate, Review_date) VALUES
(1, 1, 1, 'Love this game!', 5, '2022-03-01'),
(2, 2, 2, 'Essential for work', 5, '2022-03-02');

-- Insertar datos en la tabla App_library
INSERT INTO App_library (ID, User_id, Description) VALUES
(1, 1, 'John\'s app library'),
(2, 2, 'Jane\'s app library');

-- Insertar datos en la tabla User_App_library
INSERT INTO User_App_library (id_user, id_app_library) VALUES
(1, 1),
(2, 2);

-- Insertar datos en la tabla Device_App
INSERT INTO Device_App (id_app, id_Device) VALUES
(1, 1),
(2, 2);

-- Insertar datos en la tabla Device_User
INSERT INTO Device_User (id_user, id_Device) VALUES
(1, 1),
(2, 2);

-- Insertar datos en la tabla Sponsor_Ads
INSERT INTO Sponsor_Ads (ID, Name, Extra, Video, Category_ID, Region_ID) VALUES
(1, 'Ad1', 'Extra info', 'video1.mp4', 1, 1),
(2, 'Ad2', 'Extra info', 'video2.mp4', 2, 2);

-- Insertar datos en la tabla Sponsor_ads_app
INSERT INTO Sponsor_ads_app (id_app, id_Sponsor_ads) VALUES
(1, 1),
(2, 2);

-- Insertar datos en la tabla User_App
INSERT INTO User_App (id_user, id_app) VALUES
(1, 1),
(2, 2);