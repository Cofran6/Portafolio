USE sakila;

-- 1 Inspección y comprensión de la base de datos

-- 1.1 Listar las tablas

SHOW TABLES; -- revisar la cantidad de tablas.

-- 1.2 Revisar estructura de cada tabla y ver sus claves primarias

DESC actor; -- actor_id pk:  Datos de identificación del actor.

DESC address; -- address_id pk: Datos de dirección física.

DESC category; -- category_id pk: Datos de categoría de películas.

DESC city; -- city_id pk: Ciudades asociadas a un país.

DESC country; -- country_id pk: Datos de países.

DESC customer; -- customer_id pk: Datos clientes del videoclub.

DESC film; -- film_id pk: Datos de películas.

DESC film_actor; -- actor_id pk + film_id pk: Relación entre películas y actores.

DESC film_category; -- film_id pk + category_id pk: Relación entre películas y categorías.

DESC film_text; -- film_id pk: Datos de búsqueda de películas (título y descripción).

DESC inventory; -- inventory_id pk: Datos de copias de películas en tiendas.

DESC language; -- language_id pk: Datos de idiomas de películas.

DESC payment; -- payment_id pk: Datos de pagos de clientes.

DESC rental; -- rental_id pk: Datos de alquileres de películas.

DESC staff; -- staff_id pk: Datos de empleados de tiendas.

DESC store; -- store_id pk: Datos de tiendas.


-- 1.3 Entender las relaciones importantes entre tablas
/*
country - city - address
    Cada país tiene varias ciudades; cada ciudad tiene varias direcciones.

address - customer / staff / store
    Cada dirección puede pertenecer a varios clientes, empleados o sucursales.

film - film_actor - actor
    Cada película puede tener varios actores y cada actor puede estar en varias películas.

film - film_category - category
    Cada película puede pertenecer a varias categorías, y cada categoría tiene varias películas.

film - inventory - rental - payment
    Cada película tiene copias en inventario; cada copia puede ser alquilada (rental); cada alquiler genera pagos (payment).

store - inventory
    Cada sucursal tiene varias copias de películas en su inventario.

store - staff (manager)
    Cada sucursal tiene un empleado que es gerente.

staff - rental / payment
    Cada empleado puede registrar alquileres y pagos.

customer - rental / payment
    Cada cliente puede realizar varios alquileres y pagos.

*/

-- 2 Formulación y respuesta a preguntas de análisis, según nivel de complejidad

-- 2.1 Consultas simples

/*

1 ¿Cuántas películas hay en total?
R: Existen 1.000 películas en total.

2 ¿Cuántos actores existen?
R: Existen 200 actores en total.

3 ¿Cuántas categorías distintas de películas hay?
R: Existen 16 categorías distintas de películas.

4 ¿Duración promedio de todas las películas? (Se considera 1 decimal, sin redondear).
R: La duración promedio de las películas es de 115.2 minutos.

5 ¿Cuántos clientes distintos existen en total?
R: Existen 599 clientes distintos.

*/

-- 2.1.1 Solución consultas simples

-- 1 
SELECT 
    COUNT(*) AS total_peliculas
FROM film;

-- 2 
SELECT 
    COUNT(*) AS total_actores
FROM actor;

-- 3 
SELECT 
    COUNT(DISTINCT name) AS total_categorias
FROM category;

-- 4
SELECT 
    AVG(length) AS duracion_promedio
FROM film;

-- 5 
SELECT 
    COUNT(DISTINCT customer_id) AS total_clientes
FROM customer;


-- 2.2 Consultas intermedias

/*

1 ¿Qué actor aparece en más películas?
R: Gina Degeneres, con 42 películas.

2 ¿Cuál es la duración promedio de películas por género? (Se considera 1 decimal, sin redondear).
R: Género | Duración en minutos
- Acción: 111.6 minutos.
- Animación: 111 minutos.
- Niños: 109.8 minutos.
- Clásicos: 111.6 minutos.
- Comedia: 115.8 minutos.
- Documental: 108.7 minutos.
- Drama: 120.8 minutos.
- Familia: 114.7 minutos.
- Extranjero: 121.6 minutos.
- Juegos: 127.8 minutos.
- Terror: 112.4 minutos.
- Música: 113.6 minutos.
- Nuevo: 111.1 minutos.
- Ciencia Ficción: 108.1 minutos.
- Deportes: 128.2 minutos.
- Viajes: 113.3 minutos.

3 ¿Cuáles son los tres clientes que más rentas han hecho?
R: Nombre | Cantidad de rentas 
- Eleanor Hunt: 46 rentas.
- Karl Seal: 45 rentas.
- Clara Shaw: 42 rentas.

4 ¿Cuál es el cliente que genera más ingresos? (Ingreso en dólares, 1 decimal sin redondear).
R: Karl Seal: $221.5.

5 ¿Cuáles son las tres ciudades con más ingresos? (Ingreso en dólares, 1 decimal sin redondear).
R: Ciudad | Ingreso
- Cape Coral: $221.5.
- Saint-Denis: $216.5.
- Aurora: $198.5.

*/

-- 2.2.1 Solución consultas intermedias

-- 1

SELECT 
    a.first_name AS nombre, 
    a.last_name AS apellido,
    fa.actor_id,
    COUNT(fa.film_id) AS cantidad_peliculas
FROM actor a
INNER JOIN film_actor fa 
    ON a.actor_id = fa.actor_id
GROUP BY 
    a.first_name, 
    a.last_name, 
    fa.actor_id
ORDER BY 
    cantidad_peliculas DESC
LIMIT 1;

-- 2

SELECT
    c.name AS categoria,
    fc.category_id,
    AVG(f.length) AS duracion_promedio
FROM film f
INNER JOIN film_category fc
    ON f.film_id = fc.film_id
INNER JOIN category c
    ON fc.category_id = c.category_id
GROUP BY 
    c.name, 
    fc.category_id;
    
    
-- 3

SELECT COUNT(r.rental_id) AS cantidad_rentas, c.customer_id, c.first_name, c.last_name
FROM rental r
INNER JOIN customer c
	ON c.customer_id = r.customer_id
GROUP BY 
	c.customer_id, 
    c.first_name, 
    c.last_name
ORDER BY
	cantidad_rentas DESC
LIMIT 3;

-- 4

SELECT 
    c.customer_id,
    c.first_name AS nombre,
    c.last_name AS apellido,
    SUM(p.amount) AS ingresos_totales
FROM payment p
INNER JOIN customer c
    ON p.customer_id = c.customer_id
GROUP BY 
    c.customer_id, 
    c.first_name, 
    c.last_name
ORDER BY ingresos_totales DESC
LIMIT 1;

-- 5

SELECT 
    ci.city AS ciudad,
    SUM(p.amount) AS ingresos_totales
FROM payment p
INNER JOIN customer c
    ON p.customer_id = c.customer_id
INNER JOIN address a
    ON c.address_id = a.address_id
INNER JOIN city ci
    ON a.city_id = ci.city_id
GROUP BY ci.city
ORDER BY ingresos_totales DESC
LIMIT 3;


-- 2.3 Consultas avanzadas

/*

1 ¿Cuáles son los 3 actores mejor pagados? (pago en dólares, 1 decimal sin redondear).
R: Nombre | Apellido | Ingresos
- Gina Degeneres: $3442.4.
- Matther Carrey: $2742.1.
- Mary Keitel: $2689.2.

2 ¿Cuáles son las 3 categorías que generan mayores ingresos? (ingreso en dólares, 1 decimal sin redondear).
R: Categoría | Ingresos 
- Deportes: $5314.2.
- Ciencia ficción: $4756.9.
- Animación: $4656.3.

3 ¿Cuál es la películas más alquiladas en cada categoría? (1 resultado por categoría).
R: Nombre película | Categoría | Cantidad de alquileres
- Rugrats Shakespeare: Acción, 30.
- Juggler Hardly: Animación, 32.
- Robbers Joon: Infantil, 31.
- Timberland Sky: Clásicos, 31.
- Zorro Ark: Comedia, 31.
- Wife Turn: Documental, 31.
- Hobbit Alien: Drama, 31.
- Apache Divine: Familiar, 31.
- Rocketeer Mother: Extranjera, 33.
- Forward Temple: Juegos, 32.
- Pulp Beverly: Terror, 30.
- Scalawag Duck: Música, 32
- Ridgemont Submarine: Nuevo, 32.
- Goodfellas Salute: Ciencia Ficción, 31.
- Gleaming Jawbreaker: Deportes, 29.
- Bucket Brotherhood: Viajes, 34.

4 ¿Cuál es el promedio de duración de películas por actor, dentro de aquellos 3 que han aparecido en más películas? (1 decimal sin redondear).
R: Nombre | Apellido | Total películas | Duración promedio en minutos
- Gina Degeneres: 42, 106.3 minutos.
- Walter Torn: 41, 110.1 minutos.
- Mary Keitel: 40, 124 minutos.

5 ¿Cuáles son los 3 clientes que han alquilado películas de más categorías distintas y cuál fue el pago promedio del alquiler? (Se ordena por mayor promedio de alquiler en dólares, 1 decimal sin redondear).
R: Nombre | Apellido | Categorías distintas | Pago promedio
- Arnold Havens: 16 categorías, $5.0.
- Alvin  Deloach: 16 categorías, $4.8.
- Clara Shaw: 16 categorías, $4.6.

*/

-- 2.3.1 Solución consultas avanzadas


-- 1

SELECT 
    a.actor_id,
    a.first_name,
    a.last_name,
    SUM(p.amount) AS total_pagado
FROM actor a
INNER JOIN film_actor fa ON a.actor_id = fa.actor_id
INNER JOIN film f ON fa.film_id = f.film_id
INNER JOIN inventory i ON f.film_id = i.film_id
INNER JOIN rental r ON i.inventory_id = r.inventory_id
INNER JOIN payment p ON r.rental_id = p.rental_id
GROUP BY a.actor_id
ORDER BY total_pagado DESC
LIMIT 3;

-- 2

SELECT 
    c.name AS categoria,
    SUM(p.amount) AS ingresos_totales
FROM category c
INNER JOIN film_category fc ON c.category_id = fc.category_id
INNER JOIN film f ON fc.film_id = f.film_id
INNER JOIN inventory i ON f.film_id = i.film_id
INNER JOIN rental r ON i.inventory_id = r.inventory_id
INNER JOIN payment p ON r.rental_id = p.rental_id
GROUP BY c.category_id
ORDER BY ingresos_totales DESC
LIMIT 3;

-- 3

WITH peliculas_rentas AS (
    SELECT 
        c.category_id,
        c.name AS categoria,
        f.film_id,
        f.title AS pelicula,
        COUNT(r.rental_id) AS veces_alquilada,
        ROW_NUMBER() OVER (PARTITION BY c.category_id ORDER BY COUNT(r.rental_id) DESC) AS rn
    FROM category c
    INNER JOIN film_category fc ON c.category_id = fc.category_id
    INNER JOIN film f ON fc.film_id = f.film_id
    INNER JOIN inventory i ON f.film_id = i.film_id
    INNER JOIN rental r ON i.inventory_id = r.inventory_id
    GROUP BY c.category_id, f.film_id
)
SELECT categoria, pelicula, veces_alquilada
FROM peliculas_rentas
WHERE rn = 1
ORDER BY categoria;

-- 4

SELECT 
    a.actor_id,
    CONCAT(a.first_name, ' ', a.last_name) AS nombre_completo,
    COUNT(f.film_id) AS total_peliculas,
    AVG(f.length) AS duracion_promedio
FROM actor a
INNER JOIN film_actor fa ON a.actor_id = fa.actor_id
INNER JOIN film f ON fa.film_id = f.film_id
GROUP BY a.actor_id
ORDER BY total_peliculas DESC
LIMIT 3;

-- 5

SELECT 
    c.customer_id,
    c.first_name,
    c.last_name,
    COUNT(DISTINCT fc.category_id) AS categorias_distintas,
    AVG(p.amount) AS pago_promedio
FROM customer c
INNER JOIN rental r ON c.customer_id = r.customer_id
INNER JOIN inventory i ON r.inventory_id = i.inventory_id
INNER JOIN film f ON i.film_id = f.film_id
INNER JOIN film_category fc ON f.film_id = fc.film_id
INNER JOIN payment p ON r.rental_id = p.rental_id
GROUP BY c.customer_id
ORDER BY categorias_distintas DESC, pago_promedio DESC
LIMIT 3;


-- 3 Manejo de usuarios

-- 3.1 Revisión de usuarios existentes

SELECT user, host, plugin, account_locked
FROM mysql.user;


-- 3.2 Revisión de permisos de usuarios

SHOW GRANTS FOR 'root'@'localhost'; -- Los usuarios mysql.'nombre'(mysql.sys, mysql.session, mysql.infoschema) son creados automáticamente por el sistema.


-- 3.3 Creación de usuarios


-- Creación usuarios para sakila

CREATE USER 'analista'@'localhost' IDENTIFIED BY 'An4l1$ta@3#2025'; -- Clave provisoria.

CREATE USER 'editor'@'localhost' IDENTIFIED BY '3D1T0R@3#2025'; -- Clave provisoria.

CREATE USER 'dba_sakila'@'localhost' IDENTIFIED BY 'db4Sup3Rs3Cur&pA$$W0rd2025'; -- Clave provisoria.


-- 3.4 Otorgar o revocar permisos


-- 3.4.1 Otorgar permisos 

GRANT SELECT ON sakila.* TO 'analista'@'localhost'; -- Solo permisos sobre sakila (select).

GRANT SELECT, INSERT, UPDATE, DELETE ON sakila.* TO 'editor'@'localhost'; -- Solo permisos sobre sakila (select, insert, update, delete).

GRANT ALL PRIVILEGES ON sakila.* TO 'dba_sakila'@'localhost'; -- Solo permisos sobre sakila (todos).


-- 3.4.2 Revocar permisos

REVOKE DELETE ON sakila.* FROM 'editor'@'localhost';


-- Aplicar cambios

FLUSH PRIVILEGES;

-- 3.5 Comprobar cambios

-- 3.5.1 Listar usuarios

SELECT user, host, plugin, account_locked
FROM mysql.user;

-- 3.5.2 Comprobar privilegios

SHOW GRANTS FOR 'analista'@'localhost';
SHOW GRANTS FOR 'editor'@'localhost';
SHOW GRANTS FOR 'dba_sakila'@'localhost';

-- 3.6 Políticas de contraseñas y seguridad

-- 3.6.1 Obligar cambio de contraseña en el primer login

ALTER USER 'analista'@'localhost' PASSWORD EXPIRE; -- Contraseñas expiradas.
ALTER USER 'editor'@'localhost' PASSWORD EXPIRE; 
ALTER USER 'dba_sakila'@'localhost' PASSWORD EXPIRE; 

-- 3.6.2 Caducidad de contraseñas

ALTER USER 'analista'@'localhost' PASSWORD EXPIRE INTERVAL 90 DAY; -- Caducidad de contraseñas luego de 90 días.
ALTER USER 'editor'@'localhost' PASSWORD EXPIRE INTERVAL 90 DAY;
ALTER USER 'dba_sakila'@'localhost' PASSWORD EXPIRE INTERVAL 90 DAY; 

-- 3.6.3 Bloqueo y desbloqueo manual de cuentas (opcional)

-- Bloquear un usuario

ALTER USER 'analista'@'localhost' ACCOUNT LOCK;
ALTER USER 'editor'@'localhost' ACCOUNT LOCK;
ALTER USER 'dba_sakila'@'localhost' ACCOUNT LOCK;

-- Desbloquear un usuario

ALTER USER 'analista'@'localhost' ACCOUNT UNLOCK;
ALTER USER 'editor'@'localhost' ACCOUNT UNLOCK;
ALTER USER 'dba_sakila'@'localhost' ACCOUNT UNLOCK;

-- Aplicar cambios

FLUSH PRIVILEGES;


-- 4 Uso de tablas temporales

-- 4.1 Creación de tablas temporales
-- Tablas disponibles únicamente durante la sesión actual y serán eliminadas al cerrar sesión


-- Tabla clientes activos

CREATE TEMPORARY TABLE temp_clientes AS
SELECT
	customer_id, 
    first_name, 
    last_name, 
    email, 
    store_id
FROM customer
WHERE active = 1;


-- Tabla temporal películas populares

CREATE TEMPORARY TABLE temp_peliculas_populares AS
SELECT 
	film.film_id, 
    film.title, 
    COUNT(rental.rental_id) AS veces_alquilada
FROM film
INNER JOIN inventory ON film.film_id = inventory.film_id
INNER JOIN rental ON inventory.inventory_id = rental.inventory_id
GROUP BY film.film_id, film.title
ORDER BY veces_alquilada DESC
LIMIT 10;
 
 
-- 4.2 Inserción de datos de ejemplo
-- Inserción de cliente

INSERT INTO temp_clientes (customer_id, first_name, last_name, email, store_id)
VALUES (1001, 'Juan', 'Pérez', 'juan.perez@email.com', 1);

-- SELECT 
-- 	* 
-- FROM temp_clientes 
-- WHERE customer_id = 1001;


-- 4.3 Consultas sobre tablas temporales
-- Listar clientes activos de la tienda 1

SELECT 
	* 
FROM temp_clientes
WHERE store_id = 1
LIMIT 5;


-- Contar clientes de la tienda 2

SELECT 
	COUNT(customer_id) AS total_clientes_tienda_2
FROM temp_clientes
WHERE store_id = 2;


-- 4.4 Eliminación de tablas temporales (opcional)

DROP TEMPORARY TABLE IF EXISTS temp_clientes;

DROP TEMPORARY TABLE IF EXISTS temp_peliculas_populares;

-- SELECT * FROM temp_clientes;
-- SELECT * FROM temp_peliculas_populares;


-- 5 Procedimientos almacenados

-- 5.1 Procedimiento simple (clientes activos por tienda)

DELIMITER //
CREATE PROCEDURE contar_clientes_activos(IN tienda INT)
BEGIN
    SELECT COUNT(*) AS total_clientes_activos
    FROM customer
    WHERE store_id = tienda AND active = 1;
END //
DELIMITER ;

-- Llamar al procedimiento (Reemplazar contar_clientes_activos(1) con el número de tienda, ej. (2))
CALL contar_clientes_activos(1);


-- 5.2 Procedimiento compuesto (Ingresos totales por categoría de películas)


DELIMITER //
CREATE PROCEDURE ingresos_por_categoria()
BEGIN
    SELECT c.name AS categoría,
           SUM(p.amount) AS ingresos_totales
    FROM payment p
    INNER JOIN rental r ON p.rental_id = r.rental_id
    INNER JOIN inventory i ON r.inventory_id = i.inventory_id
    INNER JOIN film f ON i.film_id = f.film_id
    INNER JOIN film_category fc ON f.film_id = fc.film_id
    INNER JOIN category c ON fc.category_id = c.category_id
    GROUP BY c.name
    ORDER BY ingresos_totales DESC;
END //
DELIMITER ;


-- Llamar al procedimiento (No reemplazar con parámetros, el procedimiento devuelve todas las categorías)

CALL ingresos_por_categoria();


-- 5.3 Procedimientos con parámetros de entrada y salida

-- 5.3.1 Promedio de duración de películas por actor


DELIMITER //
CREATE PROCEDURE promedio_duracion_actor_nombre(IN actor_id INT)
BEGIN
    SELECT CONCAT(a.first_name, ' ', a.last_name) AS actor,
           COALESCE(AVG(f.length), 0) AS duracion_promedio
    FROM actor a
    INNER JOIN film_actor fa ON a.actor_id = fa.actor_id
    INNER JOIN film f ON fa.film_id = f.film_id
    WHERE a.actor_id = actor_id
    GROUP BY a.actor_id;
END //
DELIMITER ;

-- Llamar al procedimiento (Reemplazar (1) con el id del actor buscado)

CALL promedio_duracion_actor_nombre(1);

-- Opcional (Listar actores por id + nombre, para conocer todos los id de actor)

SELECT 
    actor_id AS id_actor,
    CONCAT(first_name, ' ', last_name) AS nombre_completo
FROM actor;


-- 5.3.2 Películas alquiladas por cliente

DELIMITER //

CREATE PROCEDURE total_rentas_cliente_nombre(IN p_customer_id INT)
BEGIN
    SELECT CONCAT(c.first_name, ' ', c.last_name) AS cliente,
           COUNT(r.rental_id) AS total_rentas
    FROM customer c
    LEFT JOIN rental r ON c.customer_id = r.customer_id
    WHERE c.customer_id = p_customer_id
    GROUP BY c.customer_id;
END //

DELIMITER ;

-- Llamar al procedimiento (Reemplazar (1) con el id del cliente buscado)

CALL total_rentas_cliente_nombre(1);

-- Opcional (Listar clientes por id + nombre, para conocer todos los id de cliente)

SELECT 
    customer_id AS id_cliente,
    CONCAT(first_name, ' ', last_name) AS nombre_completo
FROM customer; 





