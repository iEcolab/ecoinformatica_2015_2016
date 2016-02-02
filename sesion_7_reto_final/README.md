## Reto final



* Queremos contribuir a una acción preparatoria del proyecto life ADAPTAMED. En [este](https://github.com/iEcolab/ecoinformatica_2015_2016/blob/master/sesion_7_reto_final/LIFE14-CCA_ES_000612.pdf) texto se describe la acción A5 que pretende mejorar el estado de conservación de los enebrales de Sierra Nevada. Concretamente debemos de generar un mapa que indique a los gestores en qué lugares es más adecuado reintroducir enebros en función de las preferencias de hábitat que tiene esta especie. Deberemos tener en cuenta las previsiones de cambio climático que hay disponibles para el siglo XXI. 
 
* Información necesaria.
  * Información de presencia y ausencias. Suministrada en formato texto UTM en [esta](https://github.com/iEcolab/ecoinformatica_2015_2016/tree/master/sesion_7_reto_final/enebral) carpeta.
  * Variables a tener en cuenta:
    * Tendencia de la nieve con ManKendall:
      * Datos de MOD10A2 en una base de datos de access. Los datos en bruto están [aquí](https://github.com/iEcolab/ecoinformatica_2015_2016/tree/master/sesion_7_reto_final/nieve_MODIS).
      * Calcular la duración por año hidrológico y píxel.
      * Importar los datos a Rstudio y computan la tendencia con ManKendall. Aquí hay truco.
      * Generar una capa raster con la tendencia en la duración de la nieve para cada píxel. Esta capa será utilizada en el modelo de distribución junto con las siguientes.
    * NDVI promedio de 2014. Extraer imagen de Google Earth Engine. Aquí también hay truco.
    * Capas de variables climáticas (presente y futuro) suministradas en [esta](https://github.com/iEcolab/ecoinformatica_2015_2016/tree/master/sesion_7_reto_final/variables) carpeta. Tened en cuenta la extensión de estas capas y la extensión de nuestro análisis...

* Qué tienes que entregar:

>
  * Una descripción del flujo de trabajo ideal a realizar. Debe de ser un texto de no más de 2 folios acompañado de un diagrama.
  * Código necesario para ejecutar los distintos pasos del flujo de trabajo. Debe de mostrarse en un archivo markdown (encapsulando las líneas de código de distintos lenguajes como corresponda) adecuadamente documentado siguiendo la estructura del informe anterior.
  * Un póster mostrando lo que has hecho y los resultados que has obtenido. Para ello imagina que vas a presentarlo a un congreso. Debe de tener tamaño A0 y estar en formato ppt o similar. 
  



