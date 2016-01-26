## Introducción a la teledetección

**Contenido de la sesión**

+ Introducción a la teledetección.
  + El espectro electromagnético.
  + Relación entre la radiación y la materia.
  + Caracterización de la superficie de la tierra mediante índices.
+ [Introducción a la herramienta](https://developers.google.com/earth-engine/) y [aquí](https://earthengine.google.com/faq/) unas preguntas básicas.
  + Componentes de la [plataforma](https://earthengine.google.com/platform/)
     + [Google Earth Explorer](https://earthengine.google.com/datasets/): catálogo de información, procesamiento básico.
     + [Google Earth Engine Code Editor](https://code.earthengine.google.com/): procesamiento masivo de imágenes.
+ Práctica: **Queremos calcular un mapa de la tendencia lineal de la frecuencia de cobertura de nieve desde 2000 hasta 2014. Usaremos datos de la plataforma MODIS de la NASA**
 
 1. [Plataforma MODIS de la NASA](http://modis.gsfc.nasa.gov/). Producto [MOD10A1](http://nsidc.org/data/docs/daac/modis_v5/mod10a1_modis_terra_snow_daily_global_500m_grid.gd.html)
 2. Cargar imágenes en GEE:
 
Buscamos "MOD10A1" en la parte superior de la pantalla. Incluimos el código en el cuerpo del script. Creamos una colección de imágenes.

```javascript
var MOD10A1 = ee.ImageCollection("MODIS/MOD10A1");
```
Ahora seleccionamos la banda que queremos (Snow_Cover_Daily_Tile) y el rango temporal (por ahora el año 2015)

```javascript
var MOD10A1 = ee.ImageCollection("MODIS/MOD10A1").select('Snow_Cover_Daily_Tile')
.filterDate('2014-10-01', '2015-09-30');
```
Tenemos "controladas" todas las imágenes de nieve del año seleccionado. Cada píxel tiene un valor numérico en función del tipo de superficie que detecta el sensor. En concreto, en el producto que nos ocupa los valores son:

| Value | Description |
|-------|-------------|
|   0   | Data missing|
|   1   | No decision |
|  11   | Night       |
|  25   | No snow     |
|  37   | Lake        |
|  39   | Ocean       |
|  50   | Cloud       |
| 100   | Lake ice    |
| 200   | Snow        |
| 254   | Detector saturated|
| 255   | Fill         |

Con objeto de simplificar esta leyenda vamos a realizar una **reclasificación**. Esto consiste en reducir la cantidad de clases de la leyenda en función de nuestras necesidades. Para reclasificar en GEE usamos también código en javascript. No detallaremos el funcionamiento de este código:

```javascript
var reclasificar = function(imagen) {
	var imagenclasificada = imagen.remap([100, 200,  25,  37,  39],
	[1, 1, 0, 0, 0], null, 'Snow_Cover_Daily_Tile');
 return imagenclasificada;
};
```






     












+ [Cargar imágenes al mapa, seleccionar y operar bandas](https://developers.google.com/earth-engine/getstarted)
+ Subir capas raster o vectoriales a Google Earth Engine.
+ [Exportar resultados ](https://developers.google.com/earth-engine/exporting)
+ Ejecutar código en otras plataformas.
+ [Ejemplo de procesamiento de nieve](https://sites.google.com/site/globalsnowobservatory/home/simple-tutorial/short-tutorial/introduction)
   + 
  

  




