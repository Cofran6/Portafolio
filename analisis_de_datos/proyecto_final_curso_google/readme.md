# Proyecto Final: Caso Bicicletas 🚲

Este proyecto fue llevado a cabo como trabajo final del curso de **Análisis de Datos de Google**. Se utilizaron herramientas como **Python** (para visualización), **Excel** y **MySQL Workbench** (para limpieza y análisis de datos).

### 🎯 Objetivo

Entender cómo una empresa de bicicletas puede **convertir la mayor cantidad posible de usuarios casuales en usuarios de suscripción anual**.

---

## 📊 Herramientas Utilizadas

- Python (pandas, numpy, matplotlib, seaborn)
- Excel
- MySQL Workbench


En el momento de realizar este proyecto, mis conocimientos de Python y análisis de datos estaban en una etapa inicial.
El uso de Python fue una iniciativa personal para familiarizarme con la herramienta y prepararme para futuros desafíos, ya que no fue un requisito solicitado por el curso.
Este trabajo refleja tanto el análisis realizado como mi proceso de aprendizaje y evolución en el uso de esta tecnología.

---

## 🧭 Proceso seguido

### 1. Recolección de datos
- Dataset proporcionado por el curso: [Divvy Trip Data](https://divvy-tripdata.s3.amazonaws.com/index.html).
- Se utilizaron los últimos doce meses proporcionados.
- Se preparó una copia de los archivos a modo de respaldo.

### 2. Limpieza de datos
- Eliminar filas con valores nulos o blancos: el proceso fue llevado a cabo al momento de ingresar los archivos csv a tablas SQL.
- Corregir tipos de datos, cambiar tipos de datos de columnas para un análisis rápido y óptimo.
- Unificación de archivos en una sola tabla SQL.
- Filtrado de ciclistas casuales a una nueva tabla SQL para acceso rápido. (Se requería estudiar y detectar patrones de ciclistas no-miembros).
- Eliminación de columnas: id de estaciones, solo se utilizaron los nombres; fecha de término de viaje: no se requiere.
- Exportación de tabla de ciclistas casuales a .csv y lectura en Python.

### 3. Análisis exploratorio (EDA)

El análisis se centró exclusivamente en los **usuarios casuales**, con el objetivo de identificar sus patrones de comportamiento y detectar oportunidades para convertirlos en usuarios suscritos. A continuación, se detallan los análisis y visualizaciones realizadas:

1. **Días de la semana más demandados**: estudio de los días con mayor cantidad de viajes por parte de usuarios casuales.
2. **Meses con mayor uso**: análisis de tendencias estacionales en el volumen de viajes.
3. **Número de viajes por horario**: identificación de las horas del día con mayor actividad.
4. **Estaciones de inicio más frecuentes**: puntos más comunes donde comienzan los viajes.
5. **Estaciones de destino más frecuentes**: destinos más frecuentes de los recorridos.
6. **Rutas más comunes realizadas**: combinaciones origen-destino más utilizadas.
7. **Mapa de inicio de rutas**: visualización geográfica de los puntos de partida.
8. **Mapa de destino de rutas**: visualización geográfica de los puntos de llegada.
9. **Rutas recorridas**: representación de los trayectos más comunes entre estaciones.

Cada análisis se complementó con gráficos generados en Python, lo que permitió visualizar patrones claros en el comportamiento de los ciclistas casuales.


### 4. Insights clave
- Los fines de semana hay más viajes.
- Los meses de vacaciones de verano hay mayor cantidad de viajes.
- Septiembre, que no era esperado como un mes de alto volumen, aparece con gran cantidad de viajes, posiblemente debido al cambio de estación de verano a otoño y la reducción de temperaturas.
- La mayor cantidad de viajes se registran entre las 13 y 17 horas.
- Aproximadamente solo el 25% de los viajes comienzan o terminan en un grupo reducido de estaciones populares (con más de 7,500 viajes cada una), lo que indica que la demanda está concentrada en ciertos puntos estratégicos.
- Las rutas más comunes tienen orientación Norte-Sur.
- La gran mayoría de rutas se inician en la zona centro-este de la ciudad, en las cercanías de Millennium Park y "loop", el distrito central de negocios de Chicago.

### 5. Conclusiones y recomendaciones
- Ajustar estrategias de marketing enfocadas en patrones de uso y volumen de viajes.
- Optimizar distribución de bicicletas según demanda horaria y cantidad de viajes.
- Incluir recordatorios de suscripción, promotores o publicidad en las zonas de mayor tráfico.
- Realizar encuestas para conocer más en detalle las preferencias de los ciclistas y generar mejores ofertas.

---

## 🗒️ Notas finales

Este repositorio fue reconstruido después de la pérdida de parte de la información original debido al robo del dispositivo de almacenamiento donde se encontraba dicha información. La documentación original del proyecto también se perdió en ese incidente. Por ello, esta documentación fue reconstruida posteriormente con el objetivo de respetar y reflejar fielmente cada paso realizado durante el desarrollo original del proyecto.

Aunque no se cuenta con todos los archivos como fueron desarrollados originalmente, he incluido todos los elementos que aún conservo sin modificaciones (similares a la versión final pero no pulidos), respetando el trabajo realizado en su momento.

Actualmente, hay dos visualizaciones que no se cargan correctamente en el archivo .ipynb. Estos gráficos serán recuperados volviendo a ejecutar el código original, corrigiendo cualquier error producto del manejo de versiones para luego guardarlos en la carpeta visualizaciones/, sin alterar el análisis que fue desarrollado originalmente.

Este repositorio tiene como objetivo principal **documentar mi evolución como analista de datos**, es por esto que se ha mantenido en su mayor parte todo el trabajo que pudo ser recuperado.
