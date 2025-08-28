# 🗄️ Proyecto SQL: Sakila

## 📖 Introducción
Este proyecto utiliza la base de datos **Sakila**, un ejemplo relacional proporcionado por MySQL para la práctica de análisis y administración de bases de datos. El objetivo es explorar la base, realizar consultas de distintos niveles de complejidad y aplicar buenas prácticas de gestión de usuarios, tablas temporales y procedimientos almacenados.

## 🎯 Objetivos
- Comprender y analizar una base de datos relacional real.  
- Practicar consultas SQL desde básicas hasta avanzadas.  
- Aplicar técnicas de administración de usuarios y seguridad.  
- Automatizar consultas mediante procedimientos almacenados y tablas temporales.  

## 🛠️ Motor usado
- **MySQL Workbench** (versión 8.0 CE)  
- Cliente: MySQL Workbench

## 🗂️ Esquema de la base de datos
La base de datos Sakila contiene tablas relacionadas con un sistema de alquiler de películas, incluyendo actores, clientes, inventario, pagos y categorías.  

<img width="800" height="774" alt="esquema_sakila" src="https://github.com/user-attachments/assets/a4ff1fa0-faca-4bb3-b0f3-cd647d214fae" />


*Fuente: [MySQL Workbench – Documenting Sakila](https://dev.mysql.com/doc/workbench/en/wb-documenting-sakila.html)*

Tablas principales (la base cuenta con 16 tablas):

- **actor**: contiene la información de los actores, incluyendo su `actor_id`, nombre y apellido, y la fecha de última actualización. Esta tabla se relaciona con `film_actor` para conocer en qué películas participó cada actor.  

- **film**: almacena los datos de las películas disponibles en la base de datos, como título, descripción, año de lanzamiento, duración, clasificación, tarifa de alquiler, duración de alquiler y fecha de última actualización. Se conecta con categorías y actores a través de tablas intermedias.  

- **customer**: registra la información de los clientes, incluyendo nombre, correo electrónico, dirección y si tienen activo el plan de tienda (`active`). Se vincula con la tabla `rental` para registrar los alquileres realizados por cada cliente.  

- **store**: representa las tiendas físicas que poseen inventario de películas. Cada tienda está asociada a un empleado como gerente (`manager_staff_id`) y a una dirección específica. Se conecta con inventario y clientes para el registro de operaciones de alquiler y ventas.

- **rental**: contiene el historial de alquileres realizados por los clientes. Cada registro incluye `rental_id`, `rental_date`, `inventory_id`, `customer_id`, `return_date` y `staff_id`. Esta tabla es central para analizar patrones de alquiler, frecuencia de clientes y relación entre inventario, clientes y empleados.
  
## 🔄 Flujo de trabajo / Metodología
### 1️⃣ Inspección y comprensión de la base de datos

En esta fase inicial se realiza un análisis detallado de la estructura de la base de datos para comprender su organización y contenido:

- Exploración y listado de todas las tablas presentes en la base de datos.  
- Identificación de las claves primarias y atributos principales de cada tabla.  
- Determinación de las relaciones entre tablas, incluyendo claves foráneas y dependencias, para entender cómo se conectan los distintos conjuntos de datos.

Este análisis proporciona un **mapa completo de la base de datos**, fundamental para formular consultas precisas y analizar los datos de manera estructurada.
  
### 2️⃣ Formulación y resolución de preguntas de análisis según complejidad

En esta etapa se desarrollan preguntas de análisis de datos, estructuradas según su nivel de dificultad, con el objetivo de extraer información relevante y patrones de comportamiento dentro de la base Sakila.

- **Consultas básicas**: permiten obtener información general y agregada, como:  
  - Total de películas.
  - Total de actores.
  - Número de categorías distintas.
  - Duración promedio de películas.
  - Total de clientes. 

- **Consultas intermedias**: incluyen análisis más complejos mediante `JOIN`, agregaciones y `GROUP BY`, por ejemplo:  
  - Actor con más películas.
  - Duración promedio de películas por género. 
  - Top 3 clientes con más rentas.  
  - Cliente que genera mayores ingresos.  
  - Top 3 ciudades con más ingresos.  

- **Consultas avanzadas**: utilizan subconsultas, CTEs, funciones agregadas y ranking para obtener insights profundos:  
  - Actores mejor pagados.  
  - Categorías que generan mayores ingresos.  
  - Películas más alquiladas por categoría.  
  - Promedio de duración de películas por actor (para actores con mayor cantidad de películas).  
  - Clientes que han alquilado películas de más categorías distintas y su pago promedio.  

Cada consulta está documentada con **pregunta, solución SQL y resultado**, facilitando la comprensión y replicación del análisis. Esta estructura asegura un **análisis progresivo**, desde información general hasta patrones complejos y hallazgos relevantes.


### 3️⃣ Manejo y revisión de usuarios y permisos

En esta fase se gestionan los usuarios y sus privilegios para garantizar la seguridad y el control de acceso a la base de datos Sakila. Se abarcan las siguientes actividades:

- **Revisión de usuarios existentes**: se inspecciona la base de datos de MySQL para identificar los usuarios y su estado, incluyendo si la cuenta está bloqueada o el plugin de autenticación utilizado.

- **Revisión de permisos de usuarios**: se consultan los privilegios otorgados a cada usuario, asegurando que solo tengan acceso a las operaciones permitidas según su rol.

- **Creación de usuarios**: se crean usuarios específicos para distintos roles:
  - `analista`: permisos de solo lectura (`SELECT`) sobre Sakila.
  - `editor`: permisos de lectura y escritura (`SELECT`, `INSERT`, `UPDATE`, `DELETE`) sobre Sakila.
  - `dba_sakila`: todos los privilegios sobre Sakila para administración completa.

- **Otorgar y revocar permisos**: se asignan los privilegios correspondientes a cada usuario y se revocan cuando es necesario, aplicando los cambios con `FLUSH PRIVILEGES`.

- **Comprobación de cambios**: se verifica la creación de usuarios y los privilegios asignados mediante consultas `SELECT` y `SHOW GRANTS`.

- **Políticas de contraseñas y seguridad**: se aplican buenas prácticas de seguridad, incluyendo:
  - Obligación de cambio de contraseña en el primer login.
  - Caducidad de contraseñas cada 90 días.
  - Bloqueo y desbloqueo manual de cuentas según sea necesario.

Esta estructura permite un control detallado sobre los accesos, asegurando que cada usuario tenga solo los privilegios requeridos y que se cumplan las políticas de seguridad establecidas.


### 4️⃣ Uso de tablas temporales

En esta etapa se utilizan tablas temporales para realizar análisis transitorios de datos y consultas complejas sin afectar las tablas originales de la base Sakila. Las tablas temporales existen únicamente durante la sesión actual y se eliminan automáticamente al finalizarla, aunque también pueden eliminarse manualmente si es necesario.

Las actividades principales incluyen:

- **Creación de tablas temporales**:  
  - `temp_clientes`: lista de clientes activos con información básica (`customer_id`, nombre, apellido, email y tienda asociada).  
  - `temp_peliculas_populares`: ranking de las 10 películas más alquiladas, calculando la cantidad de veces que cada película fue alquilada.  

- **Inserción de datos de ejemplo**: se pueden añadir registros manualmente a las tablas temporales para pruebas o simulaciones, como insertar un cliente específico en `temp_clientes`.

- **Consultas sobre tablas temporales**: se realizan operaciones de análisis sobre las tablas temporales, por ejemplo:  
  - Listar clientes activos por tienda.  
  - Contar la cantidad de clientes de una tienda específica.  
  - Consultas de ranking o agregación sobre películas populares.  

- **Eliminación de tablas temporales**: las tablas pueden ser eliminadas de manera explícita mediante `DROP TEMPORARY TABLE` cuando ya no son necesarias, garantizando que la sesión quede limpia y sin afectar los datos originales.

El uso de tablas temporales permite **simplificar consultas complejas**, **probar análisis de manera aislada** y **mantener la integridad de los datos originales** durante el desarrollo de consultas SQL avanzadas.


### 5️⃣ Uso de procedimientos almacenados

En esta fase se implementan procedimientos almacenados para **automatizar cálculos, consultas y reportes**, facilitando el análisis de datos repetitivos y complejos sin modificar las tablas originales.

- **Procedimientos simples**:  
  - Ejemplo: `contar_clientes_activos(tienda)` calcula el número de clientes activos por tienda, permitiendo obtener rápidamente esta información sin escribir consultas repetitivas.

- **Procedimientos compuestos**:  
  - Ejemplo: `ingresos_por_categoria()` devuelve los ingresos totales generados por cada categoría de películas, utilizando múltiples `JOIN` y agregaciones. Este procedimiento permite generar reportes de manera automatizada y ordenada.

- **Procedimientos con parámetros de entrada y salida**:  
  - `promedio_duracion_actor_nombre(actor_id)`: calcula la duración promedio de películas de un actor específico, utilizando el parámetro de entrada `actor_id`.  
  - `total_rentas_cliente_nombre(p_customer_id)`: devuelve el total de películas alquiladas por un cliente específico, utilizando el parámetro de entrada `p_customer_id`.  
  Estos procedimientos permiten realizar consultas dinámicas y reutilizables, adaptándose a distintos escenarios y usuarios.

El uso de procedimientos almacenados en Sakila permite **optimizar la gestión de consultas avanzadas**, automatizar reportes críticos y simplificar el análisis de información relacionada con clientes, películas y categorías.


## 🧰 Técnicas y herramientas usadas
- Consultas SQL: básicas, intermedias y avanzadas.  
- **DML:** INSERT, UPDATE, DELETE (manipulación de datos en tablas).  
- **DDL:** CREATE, ALTER, DROP (definición y modificación de la estructura de la base de datos).  
- **DCL:** GRANT, REVOKE (gestión de usuarios y permisos).  
- Tablas temporales y procedimientos almacenados.  
- Manejo de usuarios y contraseñas, incluyendo políticas de seguridad.  
- Revisión y optimización de consultas.  

## 💻 Consultas realizadas
Organizadas por tipo:  
- **Básicas:** SELECT, WHERE, ORDER BY, LIMIT.  
- **Intermedias:** JOIN, GROUP BY, agregaciones, HAVING.  
- **Avanzadas:** subconsultas, CTEs, funciones agregadas complejas.  
- **DML:** INSERT, UPDATE, DELETE.  
- **DDL:** CREATE, ALTER, DROP.  
- **DCL:** GRANT, REVOKE.


> Cada consulta está documentada con una breve descripción en un comentario, además de especificar los criterios usados según el contexto.

## 📊 Hallazgos
- Identificación de patrones en alquileres y pagos.  
- Clientes con mayor número de rentas y tendencias de consumo.  
- Relación entre categorías de películas y frecuencia de alquiler.  
- Actores más populares.
- Actores mejores pagados.
- Patrones de diversidad de alquileres según cliente.

## 📝 Conclusiones
- Las consultas SQL permiten extraer información valiosa de bases de datos relacionales complejas.  
- La gestión de usuarios y permisos es clave para la seguridad, administración y control, ya que permite definir quién puede acceder a la base de datos, qué operaciones puede realizar, y protege la integridad y confidencialidad de los datos frente a accesos no autorizados.
- Las técnicas avanzadas (CTEs, procedimientos, tablas temporales) facilitan el análisis y automatización de tareas.  
- Documentar el flujo de trabajo y las consultas facilita la replicabilidad y comprensión del proyecto, especialmente para usuarios que no están familiarizados con la base de datos o con SQL.

## 🚀 Cómo replicar este proyecto

### ⚠️ Requisitos y excepciones
- Ejecutar **`USE sakila;`** antes de cualquier consulta, de lo contrario se producirán errores al acceder a las tablas.  
- Algunas consultas dependen de resultados previos, como tablas temporales o procedimientos almacenados.  
- Verificar que los usuarios tengan los permisos necesarios según la sección de manejo de usuarios.  

### 📝 Pasos para replicar
1. Descargar e instalar la base de datos Sakila desde la documentación oficial.
2. Abrir MySQL Workbench 8.0 CE (recomendado) u otro cliente SQL y conectarse al servidor. Ten en cuenta que el uso de otros motores puede generar errores debido a diferencias en la sintaxis de SQL.
3. Abrir y ejecutar el script `script_sakila.sql` incluido en este repositorio. Esto permitirá ejecutar las consultas que fueron llevadas a cabo en este proyecto.
4. Ejecutar `USE sakila;` para seleccionar la base de datos.
5. Seguir las instrucciones del proyecto para ejecutar consultas, procedimientos almacenados y tablas temporales en el orden indicado.
6. Revisar y ajustar permisos de usuarios si se desea probar la sección de gestión de usuarios.

---

Este README proporciona un marco completo para entender, ejecutar y replicar el proyecto Sakila, mostrando buenas prácticas en análisis de datos y administración de bases de datos relacionales.

---

📌 Autor

Franco Díaz - [GitHub](https://github.com/fesdsm)
