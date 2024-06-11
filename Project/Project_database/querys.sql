SELECT 
    App.ID,
    App.Name,
    App.Description,
    App.Price,
    App.rating
FROM 
    App
JOIN 
    Category ON App.App_Category = Category.ID
WHERE 
    Category.Name = 'Games' AND  -- Reemplaza 'Games' por la categoría deseada
    App.Price <= 10.00 AND       -- Reemplaza 10.00 por el precio máximo deseado
    App.rating >= 4.0;           -- Reemplaza 4.0 por la calificación mínima deseada

SELECT 
    Review.ID,
    Review.User_ID,
    User.Name AS User_Name,
    Review.Text,
    Review.Rate,
    Review.Review_date
FROM 
    Review
JOIN 
    App ON Review.App_ID = App.ID
JOIN
    "User" ON Review.User_ID = "User".ID
WHERE 
    App.Name = 'Angry Birds';  -- Reemplaza 'Angry Birds' por el nombre de la aplicación deseada

SELECT 
    App.ID,
    App.Name,
    App.Description,
    App.Price,
    App.rating
FROM 
    App
JOIN 
    Category ON App.App_Category = Category.ID
JOIN 
    User_App_library ON App.ID = User_App_library.id_app_library
JOIN 
    App_library ON User_App_library.id_app_library = App_library.ID
JOIN
    "User" ON App_library.User_id = "User".ID
WHERE 
    "User".Name = 'John Doe' AND  -- Reemplaza 'John Doe' por el nombre del usuario deseado
    Category.Name = 'Games';     -- Reemplaza 'Games' por la categoría deseada

SELECT 
    App.ID,
    App.Name,
    App.Description,
    App.Price,
    App.rating,
    App.Downloads
FROM 
    App
JOIN 
    Category ON App.App_Category = Category.ID
WHERE 
    Category.Name = 'Games'  -- Reemplaza 'Games' por la categoría deseada
    AND App.Downloads >= 1000000;  -- Reemplaza 1000000 por el número mínimo de descargas deseado

SELECT 
    DISTINCT "User".ID,
    "User".Name,
    "User".Email
FROM 
    "User"
JOIN 
    App_library ON "User".ID = App_library.User_id
JOIN 
    User_App_library ON App_library.ID = User_App_library.id_app_library
JOIN 
    App ON User_App_library.id_app_library = App.ID
JOIN 
    Category ON App.App_Category = Category.ID
WHERE 
    Category.Name = 'Games';  -- Reemplaza 'Games' por la categoría deseada

SELECT 
    App.ID,
    App.Name,
    App.Description,
    App.Price,
    App.rating
FROM 
    App
JOIN 
    ESRB ON App.ESRB_ID = ESRB.ID
WHERE 
    ESRB.Name = 'Mature';  -- Reemplaza 'Mature' por la clasificación ESRB deseada

SELECT 
    "User".ID,
    "User".Name,
    "User".Email
FROM 
    "User"
JOIN 
    Payment_Method ON "User".Payment_method = Payment_Method.ID
WHERE 
    Payment_Method.Card_number LIKE '1234%'; -- Reemplaza '1234%' por los primeros dígitos del número de tarjeta deseado

SELECT 
    App.ID,
    App.Name,
    App.Description,
    App.Price,
    App.rating
FROM 
    App
JOIN 
    Category ON App.App_Category = Category.ID
WHERE 
    Category.Name = 'Games' AND  -- Reemplaza 'Games' por la categoría deseada
    App.Price <= 10.00 AND       -- Reemplaza 10.00 por el precio máximo deseado
    App.rating >= 4.0;           -- Reemplaza 4.0 por la calificación mínima deseada

SELECT 
    Review.ID,
    Review.User_ID,
    "User".Name AS User_Name,
    Review.Text,
    Review.Rate,
    Review.Review_date
FROM 
    Review
JOIN 
    App ON Review.App_ID = App.ID
JOIN
    "User" ON Review.User_ID = "User".ID
WHERE 
    App.Name = 'Angry Birds';  -- Reemplaza 'Angry Birds' por el nombre de la aplicación deseada

SELECT 
    App.ID,
    App.Name,
    App.Description,
    App.Price,
    App.rating
FROM 
    App
JOIN 
    Category ON App.App_Category = Category.ID
JOIN 
    User_App_library ON App.ID = User_App_library.id_app_library
JOIN 
    App_library ON User_App_library.id_app_library = App_library.ID
JOIN
    "User" ON App_library.User_id = "User".ID
WHERE 
    "User".Name = 'John Doe' AND  -- Reemplaza 'John Doe' por el nombre del usuario deseado
    Category.Name = 'Games';     -- Reemplaza 'Games' por la categoría deseada

SELECT 
    App.ID,
    App.Name,
    App.Description,
    App.Price,
    App.rating,
    App.Downloads
FROM 
    App
JOIN 
    Category ON App.App_Category = Category.ID
WHERE 
    Category.Name = 'Games'  -- Reemplaza 'Games' por la categoría deseada
    AND App.Downloads >= 1000000;  -- Reemplaza 1000000 por el número mínimo de descargas deseado

SELECT 
    App.ID,
    App.Name,
    App.Description,
    App.Price,
    App.rating
FROM 
    App
LEFT JOIN 
    Review ON App.ID = Review.App_ID
WHERE 
    Review.ID IS NULL;

SELECT 
    App.ID,
    App.Name,
    App.Description,
    App.Price,
    App.rating
FROM 
    App
WHERE 
    App.rating > (
        SELECT 
            AVG(rating) 
        FROM 
            App
    );

SELECT 
    "User".ID,
    "User".Name,
    "User".Email
FROM 
    "User"
JOIN (
    SELECT 
        "User".ID AS user_id,
        COUNT(DISTINCT Category.ID) AS num_categories
    FROM 
        "User"
    CROSS JOIN 
        Category
    LEFT JOIN 
        (
            SELECT DISTINCT 
                User_ID,
                App_Category
            FROM 
                User_App
            JOIN 
                App ON User_App.id_app = App.ID
        ) AS user_categories ON "User".ID = user_categories.User_ID
                          AND Category.ID = user_categories.App_Category
    GROUP BY 
        "User".ID
) AS user_categories_count ON "User".ID = user_categories_count.user_id
WHERE 
    user_categories_count.num_categories = (SELECT COUNT(*) FROM Category);
