# 🗄️ Proyecto SQL: Sakila

## 📖 Introducción
Este proyecto utiliza la base de datos **Sakila**, un ejemplo relacional proporcionado por MySQL para la práctica de análisis y administración de bases de datos. El objetivo es explorar la base, realizar consultas de distintos niveles de complejidad y aplicar buenas prácticas de gestión de usuarios, tablas temporales y procedimientos almacenados.

## 🎯 Objetivos
- Comprender y analizar una base de datos relacional real.  
- Practicar consultas SQL desde básicas hasta avanzadas.  
- Aplicar técnicas de administración de usuarios y seguridad.  
- Automatizar consultas mediante procedimientos almacenados y tablas temporales.  

## 🛠️ Motor usado
- **MySQL** (versión XX)  
- Cliente: MySQL Workbench / otro cliente SQL compatible  

## 🗂️ Esquema de la base de datos
La base de datos Sakila contiene tablas relacionadas con un sistema de alquiler de películas, incluyendo actores, clientes, inventario, pagos y categorías.  
Fuente: [Documentación oficial MySQL](https://dev.mysql.com/doc/sakila/en/)

*Ejemplo de tablas principales:*  
- actor  
- film  
- customer  
- rental  
- payment  
- category  

## 🔄 Flujo de trabajo / Metodología
### 1️⃣ Inspección y comprensión de la base de datos
- Exploración de tablas, tipos de datos y relaciones.  

### 2️⃣ Formulación y respuesta a preguntas de análisis según complejidad
- Consultas básicas, intermedias y avanzadas.  

### 3️⃣ Manejo y revisión de usuarios y permisos
- Creación de usuarios, asignación y revocación de privilegios.  

### 4️⃣ Uso de tablas temporales
- Análisis transitorio de datos para consultas complejas.  

### 5️⃣ Uso de procedimientos almacenados
- Automatización de cálculos y reportes.  

## 🧰 Técnicas y herramientas usadas
- Consultas SQL: básicas, intermedias y avanzadas  
- DML (INSERT, UPDATE, DELETE) y DDL (CREATE, ALTER, DROP)  
- Tablas temporales y procedimientos almacenados  
- Manejo de usuarios y contraseñas  
- Revisión y optimización de consultas  

## 💻 Consultas realizadas
Organizadas por tipo:  
- **Básicas:** SELECT, WHERE, ORDER BY, LIMIT  
- **Intermedias:** JOIN, GROUP BY, agregaciones, HAVING  
- **Avanzadas:** subconsultas, CTEs, funciones agregadas complejas  
- **DML / DDL:** creación y modificación de tablas, inserción y actualización de datos  

> Cada consulta está documentada con su objetivo y resultado esperado.

## 📊 Hallazgos
- Identificación de patrones en alquileres y pagos.  
- Clientes con mayor número de rentas y tendencias de consumo.  
- Relación entre categorías de películas y frecuencia de alquiler.  
- Descubrimiento de casos de datos faltantes o inconsistencias en ciertas tablas.  

## 📝 Conclusiones
- Las consultas SQL permiten extraer información valiosa de bases de datos relacionales complejas.  
- La gestión de usuarios y permisos es clave para la seguridad y administración.  
- Las técnicas avanzadas (CTEs, procedimientos, tablas temporales) facilitan el análisis y automatización de tareas.  
- Documentar el flujo de trabajo y las consultas mejora la replicabilidad y comprensión del proyecto.

## 🚀 Cómo replicar este proyecto

### ⚠️ Requisitos y excepciones
- Ejecutar **`USE sakila;`** antes de cualquier consulta, de lo contrario se producirán errores al acceder a las tablas.  
- Algunas consultas dependen de resultados previos, como tablas temporales o procedimientos almacenados.  
- Verificar que los usuarios tengan los permisos necesarios según la sección de manejo de usuarios.  

### 📝 Pasos para replicar
1. Descargar e instalar la base de datos Sakila desde la [documentación oficial](https://dev.mysql.com/doc/sakila/en/).  
2. Abrir MySQL Workbench (u otro cliente SQL) y conectar al servidor.  
3. Ejecutar `USE sakila;` para seleccionar la base de datos.  
4. Ejecutar las consultas en el orden indicado en cada sección del proyecto.  
5. Revisar y ajustar permisos de usuarios si se desea probar la sección de gestión de usuarios.  
6. Ejecutar procedimientos almacenados y tablas temporales según las instrucciones del proyecto.  

---

Este README proporciona un marco completo para entender, ejecutar y replicar el proyecto Sakila, mostrando buenas prácticas en análisis de datos y administración de bases de datos relacionales.
