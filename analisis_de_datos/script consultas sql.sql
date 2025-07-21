use new_schema;

-- 1 Verificación datos nulos o blancos.

SELECT 
    COUNT(*) AS filas_invalidas
FROM
    tripdata
WHERE
    ride_id IS NULL OR ride_id = ''
        OR rideable_type IS NULL
        OR rideable_type = ''
        OR started_at IS NULL
        OR ended_at IS NULL
        OR start_station_name IS NULL
        OR start_station_name = ''
        OR start_station_id IS NULL
        OR start_station_id = ''
        OR end_station_name IS NULL
        OR end_station_name = ''
        OR end_station_id IS NULL
        OR end_station_id = ''
        OR start_lat IS NULL
        OR start_lat = ''
        OR start_lng IS NULL
        OR start_lng = ''
        OR end_lat IS NULL
        OR end_lat = ''
        OR end_lng IS NULL
        OR end_lng = ''
        OR member_casual IS NULL
        OR member_casual = ''
        OR day_of_week IS NULL
        OR day_of_week = '';

 -- No se encontraron nulos o blancos ya que al ingresar los datos desde los archivos csv a sql se tomó esa medida.
 
SELECT 
    started_at
FROM
    tripdata
LIMIT 3;
 

-- Cambio de tipo de dato desde texto a fecha, solo cambiaremos started_at y ride_length (duración del viaje) ya que no utilizaremos la fecha de término.

ALTER TABLE tripdata
	MODIFY COLUMN started_at DATETIME;
    


DESC tripdata;
-- La columna ha sido modificada exitosamente.

-- Filtrar los datos del tipo de ciclista, nos vamos a centrar especialmente en los miembros casuales.

SELECT DISTINCT
	member_casual
    FROM tripdata;

/* Solo tenemos dos tipos de miembros, por lo que filtraremos toda la base de datos con los miembros casuales hacia una nueva tabla para acceder más rápido.
Para el filtro solo tomaremos ciertas columnas para no sobrecargar la base, aspectos a tener en consideración:
- Los datos de ride_id son únicos.
- No se requieren los id de estaciones, solo los nombres.
- No se requiere la fecha de término de viaje.
- La duración de los viajes será convertida a segundos para realizar de mejor manera los cálculos matemáticos, en vez de usar fechas.
*/


CREATE TABLE IF NOT EXISTS miembros_casuales AS
	SELECT *
	FROM tripdata
		WHERE member_casual = 'casual';

-- Comprobación

SELECT DISTINCT member_casual
	FROM miembros_casuales;
    




-- Tabla para exportar la primera consulta; exportaremos como tablas y luego un archivo excel las consultas para luego realizar las visualizaciones.

CREATE TABLE inicios_populares (
    inicio VARCHAR(255),
    station_count INT
);



-- 30 inicios más comunes de miembros casuales

INSERT INTO inicios_populares (inicio, station_count)
WITH top_stations AS (
    SELECT start_station_name
    FROM miembros_casuales
    GROUP BY start_station_name
    ORDER BY COUNT(*) DESC
    LIMIT 30
)
SELECT 
    CASE 
        WHEN t.start_station_name IS NOT NULL THEN m.start_station_name
        ELSE 'Otros inicios' 
    END AS inicio, 
    COUNT(*) AS station_count
FROM miembros_casuales m
LEFT JOIN top_stations t ON m.start_station_name = t.start_station_name
GROUP BY inicio
ORDER BY 
    CASE WHEN inicio = 'Otros inicios' THEN 2 ELSE 1 END, 
    station_count DESC;

-- Comprobación

select * from inicios_populares;


-- Crear tabla para almacenar destinos comunes

CREATE TABLE destinos_populares (
    destino VARCHAR(255),
    station_count INT
);


-- 30 destinos más comunes de miembros casuales

INSERT INTO destinos_populares (destino, station_count)
WITH top_destinations AS (
    SELECT end_station_name
    FROM miembros_casuales
    GROUP BY end_station_name
    ORDER BY COUNT(*) DESC
    LIMIT 30
)
SELECT 
    CASE 
        WHEN t.end_station_name IS NOT NULL THEN m.end_station_name
        ELSE 'Otros destinos' 
    END AS destino, 
    COUNT(*) AS station_count
FROM miembros_casuales m
LEFT JOIN top_destinations t ON m.end_station_name = t.end_station_name
GROUP BY destino
ORDER BY 
    CASE WHEN destino = 'Otros destinos' THEN 2 ELSE 1 END, 
    station_count DESC;

-- Comprobación

select * from destinos_populares;


-- Crear tabla para las rutas más comunes


CREATE TABLE rutas_populares (
    ruta VARCHAR(255),
    ruta_count INT
);


-- 30 rutas más comunes de miembros casuales


INSERT INTO rutas_populares (ruta, ruta_count)
WITH top_routes AS (
    SELECT 
        start_station_name, 
        end_station_name
    FROM miembros_casuales
    GROUP BY start_station_name, end_station_name
    ORDER BY COUNT(*) DESC
    LIMIT 30
)
SELECT 
    CASE 
        WHEN t.start_station_name IS NOT NULL 
             AND t.end_station_name IS NOT NULL 
        THEN CONCAT(m.start_station_name, ' - ', m.end_station_name)
        ELSE 'Otras rutas' 
    END AS ruta, 
    COUNT(*) AS ruta_count
FROM miembros_casuales m
LEFT JOIN top_routes t 
    ON m.start_station_name = t.start_station_name 
    AND m.end_station_name = t.end_station_name
GROUP BY ruta
ORDER BY 
    CASE WHEN ruta = 'Otras rutas' THEN 2 ELSE 1 END, 
    ruta_count DESC;


-- Comprobación

SELECT * FROM rutas_populares;


-- Promedio duración de viajes

SELECT 
    SEC_TO_TIME(AVG(TIMESTAMPDIFF(SECOND,
                started_at,
                ended_at))) AS avg_duration
FROM
    miembros_casuales;


-- Tabla para las horas populares

CREATE TABLE horas_populares (
    start_hour INT NOT NULL,
    trip_count INT NOT NULL,
    PRIMARY KEY (start_hour)
);
    
-- Horas más comunes de viajes
    
INSERT INTO horas_populares (start_hour, trip_count)
SELECT 
    HOUR(started_at) AS start_hour, 
    COUNT(*) AS trip_count
FROM 
    miembros_casuales
GROUP BY 
    start_hour
ORDER BY 
    trip_count DESC
LIMIT 12;

-- Comprobación

SELECT * FROM horas_populares;


-- Tabla para los días de la semana más comunes
 
CREATE TABLE dias_populares (
    day_of_week varchar(10),
    trip_count INT NOT NULL
);


-- Días de la semana más comunes (los días han sido establecidos numéricamente, por lo que se deben convertir)

INSERT INTO dias_populares (day_of_week, trip_count)
SELECT 
    CASE day_of_week
        WHEN 1 THEN 'Domingo'
        WHEN 2 THEN 'Lunes'
        WHEN 3 THEN 'Martes'
        WHEN 4 THEN 'Miércoles'
        WHEN 5 THEN 'Jueves'
        WHEN 6 THEN 'Viernes'
        WHEN 7 THEN 'Sábado'
    END AS day_of_week_name,
    COUNT(*) AS trip_count
FROM 
    miembros_casuales
GROUP BY 
    day_of_week
ORDER BY 
    trip_count DESC;


-- Comprobación 

select * from dias_populares;

-- Tabla para los meses más comunes

CREATE TABLE meses_populares (
	mes varchar (10),
    trip_count INT NOT NULL
);

-- Meses con más viajes

INSERT INTO meses_populares (mes, trip_count)
SELECT 
    CASE MONTH(started_at)
        WHEN 1 THEN 'Enero'
        WHEN 2 THEN 'Febrero'
        WHEN 3 THEN 'Marzo'
        WHEN 4 THEN 'Abril'
        WHEN 5 THEN 'Mayo'
        WHEN 6 THEN 'Junio'
        WHEN 7 THEN 'Julio'
        WHEN 8 THEN 'Agosto'
        WHEN 9 THEN 'Septiembre'
        WHEN 10 THEN 'Octubre'
        WHEN 11 THEN 'Noviembre'
        WHEN 12 THEN 'Diciembre'
    END AS mes,
    COUNT(*) AS trip_count
FROM 
    miembros_casuales
GROUP BY 
    mes
ORDER BY 
    trip_count DESC;

-- Comprobación

select * from meses_populares;




-- Cambiar los datos de tipo texto a float para manejar más fácilmente

ALTER TABLE miembros_casuales
MODIFY COLUMN end_lat FLOAT,
MODIFY COLUMN end_lng FLOAT,
MODIFY COLUMN start_lat FLOAT,
MODIFY COLUMN start_lng FLOAT;

-- Extra, obtener latitudes y longitudes de inicios y destinos para generar un mapa:


/* Tablas para almacenar las ubicaciones exactas tanto de inicios como destinos, además de sus respectivas cantidades, cabe destacar que se ingresarán todos los valores
   tanto de inicios como destinos, no solamente los más comunes, lo que permitirá generar un mapa total o parcial de los lugares.
*/
CREATE TABLE mapa_inicios (
    inicio VARCHAR(255),
    trip_count_in INT,
      start_lat FLOAT,
  start_lng FLOAT
);

CREATE TABLE mapa_destinos (
    destino VARCHAR(255),
    trip_count_des INT,
      end_lat FLOAT,
  end_lng FLOAT
);


-- Para simplificar las tareas y evitar errores, los datos se dividieron en dos tablas.

INSERT INTO mapa_inicios (inicio, trip_count_in, start_lat, start_lng)
SELECT 
    start_station_name AS inicio,           -- Nombre de la estación de inicio
    COUNT(*) AS trip_count_in,              -- Cantidad de viajes que comienzan aquí
    MAX(start_lat) AS start_lat,            -- Latitud de la estación de inicio
    MAX(start_lng) AS start_lng             -- Longitud de la estación de inicio
FROM miembros_casuales
GROUP BY start_station_name;

INSERT INTO mapa_destinos (destino, trip_count_des, end_lat, end_lng)
SELECT 
    end_station_name AS destino,           -- Nombre de la estación de destino
    COUNT(*) AS trip_count_des,           -- Cantidad de viajes que terminan aquí
    AVG(end_lat) AS end_lat,              -- Latitud promedio de la estación de destino
    AVG(end_lng) AS end_lng               -- Longitud promedio de la estación de destino
FROM miembros_casuales
WHERE end_station_name IS NOT NULL        -- Ignorar filas con nombre de estación nulo
  AND end_lat IS NOT NULL                 -- Ignorar filas con latitud nula
  AND end_lng IS NOT NULL                 -- Ignorar filas con longitud nula
GROUP BY end_station_name;



-- Todas las rutas existentes para generar un mapa:



-- Crear la tabla mapa_rutas
CREATE TABLE mapa_rutas (
    ruta TEXT,  -- ruta única
    trip_count INT,
    start_lat FLOAT,  -- coordenadas para ubicar en el mapa
    start_lng FLOAT,
    end_lat FLOAT,
    end_lng FLOAT
);


-- Insertar las rutas únicas, el conteo de viajes y las coordenadas exactas
INSERT INTO mapa_rutas (ruta, trip_count, start_lat, start_lng, end_lat, end_lng)
SELECT 
    CONCAT(start_station_name, '-', end_station_name) AS ruta,  -- Concatenación de la ruta
    COUNT(*) AS trip_count,                                     -- Conteo de viajes
    MIN(start_lat) AS start_lat,                                -- Latitud de inicio (tomar cualquier valor, ya que son iguales)
    MIN(start_lng) AS start_lng,                                -- Longitud de inicio (tomar cualquier valor, ya que son iguales)
    MIN(end_lat) AS end_lat,                                    -- Latitud de fin (tomar cualquier valor, ya que son iguales)
    MIN(end_lng) AS end_lng                                     -- Longitud de fin (tomar cualquier valor, ya que son iguales)
FROM miembros_casuales
GROUP BY start_station_name, end_station_name
ORDER BY trip_count DESC;



-- Comprobación

SELECT * from mapa_rutas;