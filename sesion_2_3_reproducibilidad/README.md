## Reproducibilidad en ciencia

En [esta](www.ajpelu.com) presentación de [Antonio J. Pérez-Luque](http://ajperezluque.com/) podrás ver buena parte de los contenidos que hemos visto durante la sesión en clase.

A modo de resumen, ahí va una cronología de lo que hemos hecho:

+ Todo se puede escribir en una archivo de texto: La idea es que todo el código que vayamos creando se puede escribir poner en el mismo archivo o en unos pocos documentos. Podemos usar un texto plano o bien un editor de [Markdown](https://es.wikipedia.org/wiki/Markdown) para formatear dicho texto.
+ Los archivos formateados con Markdown pueden ser leídos por [Rstudio](https://www.rstudio.com/), que es una estupenda interfaz para [R](https://www.r-project.org/). 
+ En Rstudio se pueden instalar dos paquetes ([Knitr](https://cran.r-project.org/web/packages/knitr/index.html) y [rmarkdown](https://cran.r-project.org/web/packages/rmarkdown/index.html)) que generan informes de manera automática con el código que tenemos en R. Así tenemos por un lado el código (en Markdown) y por otro un informe (en Rmarkdown, pdf, html o word).
+ Todo lo anterior está bien y nos permite documentar lo que hacemos, pero nos falta la capacidad de controlar las versiones de nuestro código (y datos).
+ Para resolver esto se inventó [Git](https://git-scm.com/), que es un sistema de control de versiones digital. Lo podemos instalar en nuestro ordenador y esto nos permite realizar un seguimiento de los cambios realizados en los documentos de trabajo.
+ Es posible utilizar Git con la consola o bien a través de Rstudio (este chico sirve para todo...). Además con Rstudio podemos conectar Git con repositorios de código de la red, como por ejemplo [Github](https://github.com/). Esto nos permite además compartir nuestro código con otros.
+ Todos tenéis vuestra cuenta en github. Para subir los retos de la asignatura deberéis hacer lo siguiente:
  + Crear un fork del repositorio "master" en vuestro perfil. Al hacer esto, el destino de vuestro repositorio estará eternamente ligado al del nuestro... Cada vez que nosotros hagamos un cambio en el nuestro se registrarán las diferencias con el vuestro.
  + Para actualizar vuestro repositorio con los contenidos nuevos que vayamos añadiendo tenéis dos opciones:
     + En la web de github tenéis que hacer un "pull request". Esto actualiza automáticamente vuestros contenidos con los nuestros. Y no al revés (para algo el master somos nosotros). [Aquí](http://www.hpique.com/2013/09/updating-a-fork-directly-from-github/) tenéis instrucciones para hacer esto.
     + En Rstudio abrís vuestro proyecto y hacéis un pull. Esto también actualizará el contenido de vuestro repositorio.
   + Una vez que vuestro repositorio esté actualizado en local(=vuestro ordenador) podéis proceder a subir los retos. 

+ También hemos creado para vosotros una cuenta en un laboratorio virtual. Se trata de un acceso a Rstudio (con todos los componentes instalados) a través de la web. En ese laboratorio podéis ver sincronizar el repositorio de Github de la asignatura y ejecutar la mayor parte de los retos. [Esta](http://vlab.iecolab.es:8787/auth-sign-in) es la dirección de acceso.

