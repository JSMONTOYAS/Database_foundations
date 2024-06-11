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
INSERT INTO "User" (ID, Name, Email, Password, Birth_date, User_type, RegisterDate, App_library, Reviews, Devices, Payment_method, Region_ID) VALUES
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

-- Insertar datos en la tabla Category
INSERT INTO Category (ID, Name, Description) VALUES
(1, 'Games', 'All kinds of games'),
(2, 'Productivity', 'Productivity and office apps');

-- Insertar datos en la tabla Region
INSERT INTO Region (ID, Name, Description) VALUES
(1, 'North America', 'Region covering North America'),
(2, 'Europe', 'Region covering Europe');

-- Insertar 100 usuarios ficticios
INSERT INTO "User" (ID, Name, Email, Password, Birth_date, User_type, RegisterDate, App_library, Reviews, Devices, Payment_method, Region_ID)
SELECT
    generate_series(3, 102), -- IDs de usuario (3 a 102)
    'Usuario ' || generate_series(3, 102), -- Nombres de usuario (Usuario 3, Usuario 4, ...)
    'usuario' || generate_series(3, 102) || '@example.com', -- Correos electrónicos
    'password', -- Contraseña genérica
    '1990-01-01', -- Fecha de nacimiento genérica
    2, -- Tipo de usuario regular
    NOW(), -- Fecha de registro actual
    NULL, NULL, NULL, NULL, -- Otros campos en NULL por ahora
    (ARRAY[1, 2])[floor(random() * 2 + 1)] -- Región aleatoria
FROM generate_series(3, 102);

-- Insertar datos de dispositivos
INSERT INTO Device (ID, Name, Brand, Model, Ram, GPU, Resolution, OS_version)
VALUES
    (3, 'Google Pixel 6', 'Google', 'GLU0G', '6GB', 'Google GPU', '1080 x 2400', 'Android 12');

-- Insertar relaciones dispositivo-usuario
INSERT INTO Device_User (id_user, id_Device)
SELECT
    generate_series(3, 102), -- ID de usuario (3 a 102)
    floor(random() * 3 + 1) -- ID de dispositivo aleatorio (1, 2 o 3)
FROM generate_series(3, 102);

-- Insertar categorías adicionales
INSERT INTO Category (ID, Name, Description)
VALUES
    (3, 'Redes Sociales', 'Social networking apps'),
    (4, 'Fotografía', 'Photography apps'),
    (5, 'Música', 'Music apps');

-- Insertar 50 aplicaciones ficticias
INSERT INTO App (ID, Name, Description, Price, App_Category, User_ID, release_date, Version, Downloads, Evnts, Reviews, rating, Sponsor_ads, Region_ID, Device_ID, Size)
SELECT
    generate_series(3, 52), -- IDs de aplicaciones (3 a 52)
    'App ' || generate_series(3, 52), -- Nombres de aplicaciones (App 3, App 4, ...)
    'Descripción de la app ' || generate_series(3, 52), -- Descripciones de aplicaciones
    (random() * 10)::numeric(10, 2), -- Precio aleatorio
    floor(random() * 5 + 1), -- Categoría aleatoria (1 a 5)
    floor(random() * 100 + 1), -- ID de usuario aleatorio (1 a 100)
    NOW() - (random() * INTERVAL '1 year'), -- Fecha de lanzamiento aleatoria en el último año
    '1.0', -- Versión genérica
    floor(random() * 100000 + 1), -- Descargas aleatorias (1 a 100,000)
    'Event ' || generate_series(3, 52), -- Eventos ficticios
    'Review ' || generate_series(3, 52), -- Reseñas ficticias
    (random() * 5)::numeric(3, 2), -- Calificación aleatoria
    floor(random() * 2 + 1), -- ID de anuncio patrocinado aleatorio (1 o 2)
    floor(random() * 2 + 1), -- Región aleatoria (1 o 2)
    floor(random() * 3 + 1), -- ID de dispositivo aleatorio (1, 2 o 3)
    '100MB' -- Tamaño genérico
FROM generate_series(3, 52);

-- Insertar relaciones usuario-aplicación
INSERT INTO User_App (id_user, id_app)
SELECT
    floor(random() * 100 + 1), -- ID de usuario aleatorio (1 a 100)
    floor(random() * 50 + 1) -- ID de aplicación aleatoria (1 a 50)
FROM generate_series(1, 100);

-- Insertar métodos de pago adicionales
INSERT INTO Payment_Method (ID, Card_number, CVV, expiration_date)
VALUES
    (3, '9876543210987654', 789, '2027-10-30');

-- Insertar datos en la tabla Earn
INSERT INTO Earn (ID, App_ID, Date, Amount)
SELECT
    generate_series(1, 200), -- ID de ganancia (1 a 200)
    floor(random() * 50 + 1), -- ID de aplicación aleatoria (1 a 50)
    NOW() - (random() * INTERVAL '1 year'), -- Fecha aleatoria en el último año
    (random() * 100 + 1)::numeric(10, 2) -- Monto aleatorio (1.00 a 100.00)
FROM generate_series(1, 200);

-- Insertar datos en la tabla Download
INSERT INTO Download (ID, User_ID, App_ID, Date)
SELECT
    generate_series(1, 300), -- ID de descarga (1 a 300)
    floor(random() * 100 + 1), -- ID de usuario aleatorio (1 a 100)
    floor(random() * 50 + 1), -- ID de aplicación aleatoria (1 a 50)
    NOW() - (random() * INTERVAL '1 year') -- Fecha aleatoria en el último año
FROM generate_series(1, 300);

-- Insertar datos en la tabla Review
INSERT INTO Review (ID, User_ID, App_ID, Text, Rate, Review_date)
SELECT
    generate_series(3, 102), -- ID de reseña (3 a 102)
    floor(random() * 100 + 1), -- ID de usuario aleatorio (1 a 100)
    floor(random() * 50 + 1), -- ID de aplicación aleatoria (1 a 50)
    'Esta es una reseña de ejemplo.', -- Comentario
    floor(random() * 5 + 1), -- Calificación aleatoria (1 a 5)
    NOW() - (random() * INTERVAL '1 year') -- Fecha aleatoria en el último año
FROM generate_series(3, 102);

-- Insertar datos en la tabla Dev
INSERT INTO Dev (ID, Name, Company)
VALUES
    (1, 'John Doe', 'Acme Corp'),
    (2, 'Jane Smith', 'Beta Inc'),
    (3, 'Mike Johnson', 'Gamma Ltd');

-- Insertar relaciones aplicación-desarrollador
INSERT INTO App_Dev (id_app, id_dev)
SELECT
    floor(random() * 50 + 1), -- ID de aplicación aleatoria (1 a 50)
    floor(random() * 3 + 1) -- ID de desarrollador aleatorio (1 a 3)
FROM generate_series(1, 50);

-- Insertar datos en la tabla Subscription
INSERT INTO Subscription (ID, Type, Start_date, End_date, User_ID)
SELECT
    generate_series(1, 100), -- ID de suscripción (1 a 100)
    (ARRAY['Básico', 'Premium', 'Familiar'])[floor(random() * 3 + 1)], -- Tipo de suscripción aleatorio
    NOW() - (random() * INTERVAL '1 year'), -- Fecha de inicio aleatoria en el último año
    CASE WHEN random() < 0.5 THEN NOW() + (random() * INTERVAL '1 year') ELSE NULL END, -- Fecha de fin aleatoria o NULL (si está activa)
    generate_series(1, 100) -- ID de usuario (1 a 100)
FROM generate_series(1, 100);

-- Insertar datos en la tabla Invoice
INSERT INTO Invoice (ID, Date, Amount, Subscription_ID)
SELECT
    generate_series(1, 200), -- ID de factura (1 a 200)
    NOW() - (random() * INTERVAL '1 year'), -- Fecha aleatoria en el último año
    (random() * 50 + 1)::numeric(10, 2), -- Monto aleatorio (1.00 a 50.00)
    floor(random() * 100 + 1) -- ID de suscripción aleatoria (1 a 100)
FROM generate_series(1, 200);
