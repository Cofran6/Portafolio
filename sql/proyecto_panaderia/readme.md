# 🗄️ Proyecto SQL: Panadería “Pantástica”

## 📖 Introducción

Este proyecto consiste en la creación de un **modelo de base de datos relacional** para una panadería-pastelería en crecimiento, denominada de manera ficticia **Pantástica**, con el objetivo de registrar productos, proveedores, compras, ventas y usuarios internos.  

⚠️ **Nota:** La información utilizada para el diseño de este modelo fue proporcionada parcialmente por la panadería real con fines de orientación. Todos los nombres de productos, clientes y la estructura de la base de datos han sido modificados para garantizar la **confidencialidad y anonimato** del negocio. Los proveedores, así como los rangos de precios y volúmenes de venta, fueron estimados con base en observaciones generales del crecimiento reciente de la panadería y representan **valores aproximados**, consistentes con la información disponible públicamente o proporcionada de manera no confidencial.

---

## 🎯 Objetivos

- Diseñar un **modelo relacional completo** para la gestión de productos, compras y ventas.  
- Implementar relaciones **1:M y M:M** entre tablas.  
- Crear **usuarios, roles y procedimientos almacenados** para automatizar tareas.  
- Mantener la **confidencialidad** de datos sensibles, usando información simulada o aproximada cuando corresponde.
- Diseñar un modelo relacional que permita futuras ampliaciones sin reestructurar la base de datos.

---

## 🛠️ Motor usado

- **Motor:** MySQL Workbench 8.0 CE  
- **Cliente:** MySQL Workbench  

---

## 🗂️ Esquema de la base de datos


<img width="952" height="820" alt="esquema pantastica" src="https://github.com/user-attachments/assets/7cdcdc0d-6b4c-4cf7-94ca-31c9ee0f06d9" />

*Fuente: Elaboración propia.*


La base de datos contiene **10 tablas**  
1. `categorias`  
2. `productos`  
3. `proveedores`  
4. `clientes` (para pedidos especiales/masivos)  
5. `ventas`  
6. `detalle_ventas`  
7. `compras`  
8. `detalle_compras`  
9. `roles`  
10. `usuarios`  

Cada tabla incluye sus claves primarias y relaciones con otras tablas según la metodología de diseño relacional.

---

## 🔄 Flujo de trabajo / Metodología

1.**Creación de modelo** → creación del modelo principal para la base de datos.
2. **Definición de tablas** → creación de cada entidad con sus atributos y tipos de datos.  
3. **Relaciones entre tablas** → 1:M y M:M entre productos, compras, ventas y proveedores.  
4. **Usuarios y roles** → creación de permisos para administrar la base de datos.  
5. **Procedimientos almacenados** → para operaciones frecuentes como `cambiar_precio` y `buscar_producto`.  
6. **Carga de datos simulados** → se ingresaron aproximadamente 200 productos, con rangos de precios y volúmenes estimados según observación.

---

## 🧰 Técnicas y herramientas usadas

- Diseño de **modelo relacional**.  
- Creación de **procedimientos almacenados** y claves foráneas.  
- Uso de **MySQL Workbench** para desarrollo y pruebas.
- Uso de **Reverse engineer** para generar el esquema. 
- Aplicación de **tipos de datos, constraints y ENUMs** para control de valores válidos.  

---

## 💻 Consultas realizadas
-
-
-
-

---

## 📊 Hallazgos
-
-
-
-

---

## 📝 Conclusiones
-
-
-
-

---

## 🚀 Cómo replicar este proyecto

### ⚠️ Requisitos y excepciones

- Tener instalado **MySQL Workbench 8.0 CE**.
- La base de datos **Pantástica** fue diseñada con datos simulados; no refleja cifras reales exactas.  
- Para replicar con datos propios, reemplazar los registros de productos, proveedores y clientes por información válida.

### 📝 Pasos para replicar
1. paso 1
2. paso 2

---

## 📌 Autor
**Franco Díaz**  
- GitHub: [https://github.com/fesdsm](https://github.com/fesdsm)
