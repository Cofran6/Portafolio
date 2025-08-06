
## 📌 Descripción

Este proyecto realiza un análisis exploratorio de datos (EDA) sobre el dataset **Supermarket Sales**, que contiene información de ventas de un supermercado en tres ciudades. El objetivo es identificar patrones, relaciones entre variables, posibles insights de negocio y recomendaciones para un posible modelo predictivo.


## 📊 Dataset

- **Nombre:** `supermarketsales.csv`
- **Tamaño:** 1000 registros
- **Variables principales:** fecha de venta, producto, ingresos, método de pago, género del cliente, etc.
- **Fuente:** [Kaggle - Supermarket Sales]([https://www.kaggle.com/datasets/aungpyaeap/supermarket-sales](https://www.kaggle.com/datasets/faresashraf1001/supermarket-sales)


## 📌 Herramientas utilizadas

- Python 3
- Pandas
- Matplotlib / Seaborn
- Jupyter Notebook


## 🧪 Estructura del análisis


## 1. Exploración inicial del dataset

### 1.1 Carga

- Carga de datos desde archivo CSV.

### 1.2 Dimensiones y tipos de variables

- Inspección primeras filas.
- Forma del DataFrame.
- Inspección tipos de variables.

### 1.3 Revisión de valores nulos y duplicados

- Verificación de valores y porcentaje de nulos.
- Revisión y porcentaje de duplicados.

### 1.4 Estadísticas descriptivas generales y visualización básica

- Definición de columnas categóricas y numéricas.
- Estadísticas descriptivas generales para variables numéricas.
- Distribuciones de variables categóricas.
- Distribuciones de variables numéricas.

## 2. Limpieza y preparación de los datos

### 2.1 Tratamiento de valores faltantes

- No se registran valores faltantes.

### 2.2 Correción de tipos de datos

- Correción de variables tipo Object a categóricas.
- Conversión columna Date a fecha.
- Comprobación.

## 3. Análisis univariado

### 3.1 Variables numéricas

- Revisión de Asimetría y Curtosis para variables numéricas.

### 3.2 Detección de outliers

- Identificación de outliers.
- Ajuste de límites.

### 3.3 Distribución y visualización de variables numéricas

- Histogramas variables numéricas.
- Boxplots variables numéricas.

### 3.4 Análisis de variables categóricas

- Frecuencias absolutas y relativas.

## 4. Análisis bivariado

### 4.1 Correlaciones

- Matriz de correlación.
- Mapa de calor.
- Pairplots.

### 4.2 Comparación de variables numéricas según categorías

- Distribución del total según género.
- Ingreso bruto según tipo de cliente.
- Distribución del total línea de producto.
- Ingreso bruto según método de pago.

### 4.3 Relación entre variables categóricas

- Tabla de contingencia: género vs línea de producto.
- Distribución de género vs línea de producto.
- Tabla de contingencia: medio de pago vs tipo de cliente.
- Distribución medio de pago según tipo de cliente.
- Tabla de contingencia: medio de pago vs sucursal.
- Distribución medio de pago según sucursal.


## 5. Análisis multivariado

- Total vs cantidad según género.
- Unidad vs precio total, según línea de producto.
- Ingreso bruto vs rating, según tipo de cliente.
- 

## 6. Análisis temporal

- Total diario de ventas.
- Total diario de ventas, según género.
- Total diario de ventas, según ciudad.
- Total diario de ventas, según método de pago.

## 7. Hallazgos clave

- Integridad y estructura de los datos.
- Insights claves.
- Relaciones entre variables.
- Segmentaciones y tipos de clientes.
- Tendencias temporales.

## 8. Conclusiones y recomendaciones

- El dataset está bien estructurado y limpio, ideal para aplicar técnicas de modelado predictivo.
- Las diferencias entre género y métodos de pago podrían aprovecharse para estrategias de marketing segmentado.
- Si bien el análisis permite identificar patrones y tendencias, el tamaño reducido del conjunto de datos (1000 registros) limita la generalización de los hallazgos.
- Se sugiere utilizar conjuntos de datos más amplios o complementarios para validar las conclusiones obtenidas.


## 💡 Principales hallazgos



## 🚀 Cómo usar este análisis

1. Clona el repositorio.
2. Abre `eda.ipynb` en Jupyter o Visual Studio Code.
3. Ejecuta las celdas para reproducir el análisis.

## 📌 Autor

Franco Díaz - [GitHub](https://github.com/cofran6)
