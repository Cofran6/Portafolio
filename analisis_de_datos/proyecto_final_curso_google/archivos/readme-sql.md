En la carpeta se encuentran los archivos filtrados sobre los cuales se desarrollaron los gráficos; no pudo ser posible adjuntar los archivos originales para el análisis, debido a la gran cantidad de datos y peso de los mismos, sin embargo en el archivo readme.md principal, se encuentra el link con los archivos originales, algunos de ellos debieron ser separados para poder trabajarlos.

Consultas SQL 🗄️

Para la etapa de limpieza y análisis inicial, se utilizó MySQL Workbench con el objetivo de transformar, depurar y organizar los datos antes de su análisis visual. A continuación, se resumen los principales pasos:

Limpieza y preparación de datos 🧹

- Durante la carga de datos en la base SQL, se identificaron y descartaron filas con valores nulos o en blanco. Dado el volumen total de registros y la baja proporción de datos faltantes, esta depuración no afectó significativamente el análisis posterior.

- Se filtraron los registros para conservar solo aquellos pertenecientes a usuarios casuales, generando una nueva tabla: miembros_casuales.

- Se eliminó información innecesaria para optimizar el rendimiento (por ejemplo, ID de estaciones o fechas de término de viaje).

Consultas analíticas

- Se crearon tablas específicas para exportar datos clave y facilitar su visualización en Python o Excel:

- inicios_populares: Estaciones de inicio más comunes (30 principales + agrupación como "Otros inicios").

- destinos_populares: Estaciones de destino más frecuentes (30 principales + agrupación como "Otros destinos").

- rutas_populares: Combinaciones de inicio–destino más habituales.

- horas_populares: Horarios más comunes de inicio de viaje.

- dias_populares: Días de la semana con mayor actividad (convertidos de número a nombre).

- meses_populares: Tendencias mensuales de uso.

Geolocalización 🗺️ 

Para generar visualizaciones espaciales, se construyeron tablas con latitudes y longitudes:

- mapa_inicios: Coordenadas y conteo de inicios de viaje.

- mapa_destinos: Coordenadas y conteo de destinos.

- mapa_rutas: Coordenadas de origen y destino por ruta, junto al número de veces recorrida.
