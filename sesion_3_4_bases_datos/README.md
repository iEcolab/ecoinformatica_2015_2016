## Bases de datos

Durante esta sesión hemos aprendido qué son y cómo se elaboran bases de datos relacionales. Ahí va un pequeño resumen:

+ La primera parte de la sesión gira en torno al concepto de base de datos desde sus orígenes hasta la actualidad. Igual ha quedado un poco larga (prometo acortarla para el año que viene). [Aquí](http://prezi.com/vfd14shu1-kc/?utm_campaign=share&utm_medium=copy&rc=ex0share) está la presentación que hemos seguido. 
+ La sesión práctica comienza con la elaboración de un modelo entidad-relación para una metodología de seguimiento de aves dispersantes. Discutimos sobre las **entidades**, sus **atributos** y sus **relaciones**. 
+ Luego implementamos un modelo de datos algo más sencillo (una base de datos meteorológica) usando Microsoft Access. Usamos este programa porque es fácil de manejar y porque no tenemos tiempo para más. Pero lo recomendable es que aprendáis a usar [PostgreSQL](https://es.wikipedia.org/wiki/PostgreSQL) o [MySQL](https://es.wikipedia.org/wiki/MySQL), que son dos sistemas de gestión de bases de datos abiertos y muy potentes. En Access aprendemos a crear tablas, a relacionarlas entre sí y a importar datos a la base de datos.
+ El siguiente paso es una introducción al lenguaje SQL. Para ello usamos [esta](https://github.com/iEcolab/ecoinformatica_2015_2016/blob/master/sesion_3_bases_datos/taller_SQL.ppt?raw=true) presentación. Realizamos varias consultas con y sin el asistente de Access sobre la base de datos que hemos creado.
+ Por último, en [esta](https://github.com/iEcolab/ecoinformatica_2015_2016/tree/master/sesion_3_bases_datos/material_adicional) carpeta tienes material adicional que puede ser de interés.


El reto de esta sesión se basa en la siguiente descripción de una estructura de datos:
    
> Nos encargan realizar un inventario florístico en Sierra Nevada. La metodología de captura de información se basa en visitar periodicamente una serie de parcelas de inventario. Cada parcela se caracteriza por su nombre, altitud, ubicación, pendiente y orientación. En cada visita almacenamos la fecha, hora de inicio y hora de fin. Además, se anota la cobertura del suelo (en porcentaje) y el tipo de suelo predominante (arenoso, arcilloso, rocoso). En cada parcela se identifican todas las especies presentes y se le asigna a cada una su abundancia (según el código de Braun-Blanquet). 

Deberás de hacer lo siguiente:

+ Crea la estructura de la base de datos en Microsoft Access. Debes de crear las tablas y las relaciones.
+ Rellena cada tabla de la base de datos con unos 5 registros.
+ Crea formularios para cargar datos. Esto último no es imprescindible (a no ser que quieras optar a la matrícula de honor).
+ Y ya...