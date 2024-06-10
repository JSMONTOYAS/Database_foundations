-- Insertar datos en la tabla User
INSERT INTO "User" (Name, Country, Email, Password)
SELECT
    'Usuario ' || generate_series(1, 100), -- Nombres de usuario (Usuario 1, Usuario 2, ...)
    (ARRAY['Colombia', 'México', 'Argentina', 'España', 'Estados Unidos'])[floor(random() * 5 + 1)], -- Países aleatorios
    'usuario' || generate_series(1, 100) || '@example.com', -- Correos electrónicos
    'password' -- Contraseña genérica (puedes cambiarla por una más segura)
FROM generate_series(1, 100);

-- Insertar datos en la tabla Device
INSERT INTO Device (Name, Model, OS)
VALUES
    ('iPhone 13', 'A2633', 'iOS 15'),
    ('Samsung Galaxy S21', 'SM-G991B', 'Android 11'),
    ('Google Pixel 6', 'GLU0G', 'Android 12');

-- Insertar datos en la tabla Device_User
INSERT INTO Device_User (PK_FK1_Id_Device, FK2_Id_User)
SELECT
    floor(random() * 3 + 1), -- ID de dispositivo aleatorio (1, 2 o 3)
    generate_series(1, 100) -- ID de usuario (1 a 100)
FROM generate_series(1, 100);

-- Insertar datos en la tabla Category
INSERT INTO Category (Name)
VALUES
    ('Juegos'),
    ('Productividad'),
    ('Redes Sociales'),
    ('Fotografía'),
    ('Música');

-- Insertar datos en la tabla App
INSERT INTO App (Name, FK_ID_Category, Downloads)
SELECT
    'App ' || generate_series(1, 50), -- Nombres de aplicaciones (App 1, App 2, ...)
    floor(random() * 5 + 1), -- Categoría aleatoria (1 a 5)
    floor(random() * 100000 + 1) -- Descargas aleatorias (1 a 100.000)
FROM generate_series(1, 50);

-- Insertar datos en la tabla User_App
INSERT INTO User_App (PK_FK1_Id_User, FK_Device)
SELECT
    generate_series(1, 100), -- ID de usuario (1 a 100)
    floor(random() * 50 + 1) -- ID de aplicación aleatoria (1 a 50)
FROM generate_series(1, 100);

-- Insertar datos en la tabla Payment
INSERT INTO Payment (Type)
VALUES
    ('Tarjeta de crédito'),
    ('PayPal'),
    ('Transferencia bancaria');

-- Insertar datos en la tabla User_Payment
INSERT INTO User_Payment (PK_FK1_Id_User, FK2_Id_Payment)
SELECT
    generate_series(1, 100), -- ID de usuario (1 a 100)
    floor(random() * 3 + 1) -- ID de método de pago aleatorio (1 a 3)
FROM generate_series(1, 100);

-- Insertar datos en la tabla Earn
INSERT INTO Earn (Sale, FK_ID_App)
SELECT
    (random() * 100 + 1)::numeric(10,2), -- Venta aleatoria (1.00 a 100.00)
    floor(random() * 50 + 1) -- ID de aplicación aleatoria (1 a 50)
FROM generate_series(1, 200); -- 200 registros de ventas

-- Insertar datos en la tabla Download
INSERT INTO Download (Date, FK_ID_User, FK_ID_App)
SELECT
    NOW() - (random() * INTERVAL '1 year'), -- Fecha aleatoria en el último año
    generate_series(1, 100), -- ID de usuario (1 a 100)
    floor(random() * 50 + 1) -- ID de aplicación aleatoria (1 a 50)
FROM generate_series(1, 300); -- 300 registros de descargas

-- Insertar datos en la tabla Review
INSERT INTO Review (Rating, Comment, FK_ID_User, FK_ID_App)
SELECT
    floor(random() * 5 + 1), -- Calificación aleatoria (1 a 5)
    'Esta es una reseña de ejemplo.', -- Comentario
    generate_series(1, 100), -- ID de usuario (1 a 100)
    floor(random() * 50 + 1) -- ID de aplicación aleatoria (1 a 50)
FROM generate_series(1, 100); -- 100 registros de reseñas

-- Insertar datos en la tabla Dev
INSERT INTO Dev (Name, Company)
VALUES
    ('John Doe', 'Acme Corp'),
    ('Jane Smith', 'Beta Inc'),
    ('Mike Johnson', 'Gamma Ltd');

-- Insertar datos en la tabla App_Dev
INSERT INTO App_Dev (PK_FK1_Id_App, FK2_Id_Dev)
SELECT
    generate_series(1, 50), -- ID de aplicación (1 a 50)
    floor(random() * 3 + 1) -- ID de desarrollador aleatorio (1 a 3)
FROM generate_series(1, 50); -- 50 registros de relaciones app-dev

-- Insertar datos en la tabla Subscription
INSERT INTO Subscription (Type, StartDate, EndDate, FK_ID_User)
SELECT
    (ARRAY['Básico', 'Premium', 'Familiar'])[floor(random() * 3 + 1)], -- Tipo de suscripción aleatorio
    NOW() - (random() * INTERVAL '1 year'), -- Fecha de inicio aleatoria en el último año
    CASE WHEN random() < 0.5 THEN NOW() + (random() * INTERVAL '1 year') ELSE NULL END, -- Fecha de fin aleatoria o NULL (si está activa)
    generate_series(1, 100) -- ID de usuario (1 a 100)
FROM generate_series(1, 100); -- 100 registros de suscripciones

-- Insertar datos en la tabla Invoice
INSERT INTO Invoice (Date, Amount, FK_ID_Subscription)
SELECT
    NOW() - (random() * INTERVAL '1 year'), -- Fecha aleatoria en el último año
    (random() * 50 + 1)::numeric(10,2), -- Monto aleatorio (1.00 a 50.00)
    generate_series(1, 100) -- ID de suscripción (1 a 100)
FROM generate_series(1, 200); -- 200 registros de facturas
