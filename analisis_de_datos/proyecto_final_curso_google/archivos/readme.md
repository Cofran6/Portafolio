# 📁 Archivos CSV Exportados

Esta carpeta contiene los archivos CSV filtrados utilizados en la etapa de análisis y visualización del proyecto. Debido al tamaño original de la base de datos (aproximadamente 5 millones de registros), no fue posible incluir todos los datos crudos aquí. Sin embargo, el enlace a los datos completos se encuentra disponible en el `README.md` principal del proyecto.

Algunos archivos fueron separados o resumidos para facilitar su manejo en herramientas como Python, Excel y Jupyter.

---

## 🗄️ Consultas SQL

Durante la etapa inicial de limpieza y transformación de datos se utilizó **MySQL Workbench**. El objetivo fue preparar subconjuntos de datos relevantes para el análisis posterior. A continuación se resumen los principales pasos:

### 🧹 Limpieza y preparación

- Se descartaron registros con valores nulos o en blanco.
- Se filtraron los datos para incluir solo a usuarios casuales, generando la tabla `miembros_casuales`.
- Se eliminaron columnas irrelevantes para el análisis, como identificadores internos o fechas de término.

---

## 📋 Contenido de los CSV

Los siguientes archivos fueron generados mediante consultas SQL para su posterior análisis visual:

### 🚍 `rutas_populares.csv`  
Combinaciones de estaciones de inicio y destino más frecuentes.

### 🏁 `inicios_populares.csv`  
30 estaciones de inicio más comunes, con una categoría adicional para "Otros inicios".

### 🎯 `destinos_populares.csv`  
30 estaciones de destino más frecuentes, con una categoría adicional para "Otros destinos".

### 🕒 `horas_populares.csv`  
Rangos horarios con mayor cantidad de inicios de viaje.

### 📅 `dias_populares.csv`  
Frecuencia de viajes según el día de la semana, transformando números en nombres de día.

### 📆 `meses_populares.csv`  
Tendencias mensuales de uso a lo largo del período analizado.

---

## 🗺️ Geolocalización

Para construir mapas interactivos, se generaron tablas con coordenadas y conteos:

### 📍 `mapa_inicios.csv`  
Latitud, longitud y cantidad de inicios por estación.

### 🎯 `mapa_destinos.csv`  
Latitud, longitud y cantidad de destinos por estación.

### 🔁 `mapa_rutas.csv`  
Coordenadas de origen y destino para las rutas más frecuentes, junto al número de veces recorridas.
