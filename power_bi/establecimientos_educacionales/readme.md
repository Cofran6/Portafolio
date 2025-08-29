# 📊 Proyecto Power BI: Establecimientos Educacionales Chile año 2014

## 📖 Introducción

Este proyecto utiliza **Power BI** para el análisis y visualización de datos, con el objetivo de explorar datasets reales o simulados, crear dashboards interactivos y aplicar buenas prácticas de modelado y visualización de información.

## 🌐 Fuente de datos

Portal de [Datos Abiertos del MINEDUC](https://datosabiertos.mineduc.cl/directorio-de-establecimientos-educacionales) — Directorio de Establecimientos Educacionales de Chile (2024).

## 🎯 Objetivos

- Resolución de problemas de análisis de datos mediante **Power BI**.
- Uso de **Power Query** para limpieza, transformación y preparación de datos.
- Creación de **tablas**, **medidas calculadas** y **componentes adicionales** para dashboards interactivos.
- Dominio en **modelado de datos**, incluyendo normalización, relaciones y optimización de modelos.
- Habilidad para documentar proyectos de manera clara, profesional y replicable.

## 🔄 Flujo de trabajo / Metodología

### 1️⃣ Obtención y comprensión de los datos

- Descarga de datos confiables desde fuentes oficiales y seguras.  
- Análisis de las columnas y comprensión de las relaciones dentro del dataset.  
- Investigación adicional de documentación oficial para entender nomenclatura y significado de los datos.  

### 2️⃣ Transformación y limpieza de datos

- Eliminación de columnas innecesarias y renombrado de las columnas restantes.  
- Ajuste de tipos de datos y filtrado de registros no relevantes.  
- Normalización de columnas (por ejemplo, conversión de texto a números y rangos) y generación de archivos de soporte para normalizaciones adicionales.  
- Manejo de columnas de relación muchos a muchos mediante técnicas específicas según corresponda.  
- Filtrado final de registros incompletos o irrelevantes para limpiar el dataset.  

### 3️⃣ Modelado de datos

- Creación de relaciones entre tablas en el modelador de Power BI, asegurando ambas direcciones de rutas para evitar conflictos.  
- Incorporación de los archivos de normalización generados en Python para completar el modelo.  
- Creación de **tabla de medidas** y **medidas calculadas** para KPIs, métricas y análisis específicos.  
- Implementación de medidas adicionales para mejorar la visualización y el aspecto de los gráficos en los dashboards.


### 4️⃣ Creación de visualizaciones

- Diseño de dashboards siguiendo un esquema de análisis de lo general a lo particular: regiones → provincias → comunas → detalle de establecimiento.  
- Creación de visualizaciones detalladas de establecimientos con información completa y contextual.  
- Desarrollo de una pantalla de introducción con navegación clara hacia todas las visualizaciones.  
- Incorporación de títulos, etiquetas y botones: navegación y control de filtros.  
- Optimización de gráficos mediante medidas calculadas y configuraciones avanzadas.  
- Integración de elementos visuales adicionales no nativos de Power BI para enriquecer los dashboards.  
- Inclusión de segmentaciones y listas detalladas para facilitar el filtrado y la exploración de datos.
- Uso de **tema oscuro** para mejorar la legibilidad, resaltar los datos clave y reducir la fatiga visual durante la exploración de dashboards.
- Uso de **iconos** relacionados a elementos visuales y páginas para reforzar la comprensión del dashboard.


### 5️⃣ Finalización y documentación

- Revisión del modelo, botones y visualizaciones para asegurar consistencia y correcta navegación.  
- Validación de los datos y medidas calculadas para garantizar la exactitud de los cálculos.  
- Organización de archivos y recursos utilizados para facilitar la replicación del proyecto.  
- Documentación del flujo de trabajo y hallazgos principales, incluyendo decisiones de modelado y transformaciones aplicadas.  
- Preparación del proyecto para compartir, asegurando compatibilidad y facilidad de uso por terceros.
- Publicación del modelo en **Power BI Service** para asegurar su visualización desde cualquier dispositivo.


## 🧰 Técnicas y herramientas usadas

- **Power BI Desktop**: diseño y creación de dashboards.
- **Power Query**: limpieza y transformación de datos.
- **DAX**: creación de medidas calculadas y KPIs.
- **Python 3**: extracción de datos.
- Visualizaciones interactivas: gráficos, tablas, mapas, tarjetas y segmentaciones.
- Buenas prácticas en modelado, normalización y relaciones entre tablas.
  

## 📊 Hallazgos

- Las regiones con mayor número de establecimientos no coinciden necesariamente con las que presentan mayor matrícula; este patrón se repite a nivel de provincias.  
- Más del 50% de los establecimientos en Chile no cuentan con convenio PIE, y casi el 95% no posee programa PACE.  
- Cerca del 90% de los colegios son gratuitos; de manera similar, alrededor del 90% no cobra matrícula.  
- Solo 620 establecimientos de un total de 11.041 se encuentran en el rango más alto de mensualidad, con un promedio de 6 por comuna; Las Condes lidera con aproximadamente un 40% más que otras comunas.  
- La mayoría de los establecimientos imparten en promedio 2 o 3 niveles educativos (básica y media, principalmente científico-humanista).  
- Predominan los establecimientos urbanos, con un 70% en promedio; sin embargo, en La Araucanía, Los Lagos y Los Ríos, la proporción de establecimientos rurales alcanza cerca del 60%, siendo La Araucanía la más significativa.  
- Los establecimientos se enfocan únicamente en determinados niveles educativos o especialidades; ninguno imparte la totalidad de las especialidades y todos los niveles de enseñanza a la vez.  
- Considerando la densidad de población, La Araucanía y Los Lagos presentan la mayor cantidad de establecimientos por cada 100.000 habitantes (según datos oficiales de población 2024).

## 📝 Conclusiones

- La disparidad entre número de establecimientos y matrícula por región/provincia sugiere la necesidad de **planificación estratégica y asignación de recursos educativos** más equitativa.  
- La baja cobertura de programas PIE y PACE evidencia áreas de mejora y oportunidades para políticas de inclusión educativa en los próximos años.  
- La elevada proporción de colegios gratuitos y sin cobro de matrícula refleja un sistema mayoritariamente accesible, aunque existe un pequeño grupo de establecimientos con altos costos concentrados en comunas específicas, lo que podría implicar desigualdad en el acceso.  
- La predominancia de 2–3 niveles educativos y la especialización parcial de los establecimientos indica que **no existen colegios que cubran todos los niveles y especialidades**, lo que puede condicionar la oferta educativa local.  
- La concentración de establecimientos rurales en ciertas regiones sugiere que las políticas deben adaptarse a las **necesidades geográficas y demográficas específicas**.  
- Los hallazgos sobre densidad de establecimientos por población sirven como base para análisis futuros más detallados, incluyendo: matrícula por nivel educativo, matrícula por especialidad, y número de establecimientos y matrículas ajustados por cada 100.000 habitantes o por km².


## 🚀 Cómo replicar este proyecto

### ⚠️ Requisitos y excepciones

- Contar con **Power BI Desktop** instalado.
- Tener acceso a los datasets utilizados en el proyecto.
- Seguir el orden de transformación, modelado y creación de visualizaciones para evitar errores.

### 📝 Pasos para replicar

1. Descargar el archivo **.pbix** incluido en este repositorio o acceder a la versión publicada en línea para exploración interactiva: [Establecimientos Educacionales Chile 2024](https://app.powerbi.com/view?r=eyJrIjoiN2JlMmUwNmUtOWM2NC00ZTM4LTlhNmMtMjNkMWJlOGMzMTgyIiwidCI6IjQ5ZWM5ZjUyLThlMjgtNGIyMC1hNDQxLTkyZWJmMjZjNTQ0YyIsImMiOjR9&pageName=36d08784d090d42275d4)
2. Abrir el archivo con **Power BI Desktop**.  
3. Explorar los dashboards, medidas calculadas y visualizaciones interactivas directamente.  
4. (Opcional) Modificar o ampliar los datos, medidas o visualizaciones según se desee.  
5. Publicar o exportar el proyecto para compartir resultados.

## 📌 Autor

Franco Díaz - [GitHub](https://github.com/fesdsm)
