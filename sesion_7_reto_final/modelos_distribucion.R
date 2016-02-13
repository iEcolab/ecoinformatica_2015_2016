
###################################
#ESTABLECE EL DIRECTORIO DE TRABAJO
###################################
#DIRECTORIO DE TRABAJO
dir_trabajo<-'/Users/fjbonet/Documents/owncloud/4_docencia/master_ugr_cons_bio/2015_2016/git/ecoinformatica_2015_2016/sesion_6_simulaciones/modelos_distribucion_especies/ejemplo/'
#ESTABLECE EL DIRECTORIO DE TRABAJO
setwd(dir_trabajo)

getwd()


################################
#INSTALACION Y CARGA DE PAQUETES
################################
#NOTA: SOLO ES NECESARIO INSTALARLOS UNA VEZ. DESACTIVA ESTAS LÍNEAS PARA LA PRÓXIMA SESIÓN
#INSTALA PAQUETE DISMO Y TODAS SUS DEPENDENCIAS (EJECUTAR UNA SOLA VEZ)
install.packages("dismo", dep=TRUE) #SDMs con R
install.packages("plotmo", dep=TRUE) #curvas de respuesta
install.packages("randomForest", dep=TRUE) #random forest
install.packages("party", dep=TRUE) #árboles de inferencia condicional
install.packages("HH", dep=TRUE) #VIF
install.packages("tree", dep=TRUE) #árboles de regresión

#CARGA LAS LIBRERIAS NECESARIAS (EJECUTAR SIEMPRE QUE TRABAJES CON EL SCRIPT)
library(dismo)
library(plotmo)
library(randomForest)
library(party)
library(HH)
library(tree)
library(rgdal)


##################################
#IMPORTA LAS VARIABLES PREDICTORAS
##################################
#LISTADO DE VARIABLES
lista_variables <- list.files(path="variables/presente/",pattern='*.asc', full.names=TRUE)

#stack Y brick PREPARAN LAS VARIABLES EN UN UNICO OBJETO ESPACIAL
help(brick) #mapas en memoria, más rápido (pero usa mucha RAM)
help(stack) #mapas en disco, más lento (pero usa menos RAM)
variables <- brick(stack(lista_variables))

r<-raster("mascara_raster.asc")

variables2<-crop(variables, r)

plot(variables2)

r <- raster(nrow=3, ncol=3)
r <- 1:ncell(r)
s <- raster(nrow=10, ncol=10)
s <- resample(r, s, method='bilinear')

#DIBUJA LAS VARIABLES PREDICTORAS
png("resultados/variables.png", width=2000, height=2000, pointsize=20)
plot(variables)
dev.off()



#####################################################
#ANÁLISIS DE CORRELACIÓN DE LAS VARIABLES PREDICTORAS
#####################################################

#TRANSFORMA LOS MAPAS EN UNA TABLA
variables_tabla<-as.data.frame(variables)

#ELIMINA LOS VALORES NULOS
variables_tabla<-na.omit(variables_tabla)

#MATRIZ DE CORRELACIÓN
help(cor)
variables_correlacion<-cor(variables_tabla)

#MATRIZ DE DISTANCIAS ('ABS' = VALOR ABSOLUTO, PARA ELIMINAR CORRELACIONES NEGATIVAS)
help(as.dist)
help(abs)
variables_dist<-abs(as.dist(variables_correlacion))

#CLUSTER DE VARIABLES SEGÚN LA DISTANCIA (MENOR DISTANCIA = MAYOR CORRELACIÓN)
help(hclust)
variables_cluster<-hclust(1-variables_dist)

#GRAFICO DEL CLUSTER DE CORRELACIONES 
plot(variables_cluster)

#GRÁFICO DEL CLUSTER DE CORRELACIONES EXPORTADO A PDF
pdf("correlacion.pdf", width=8, height=11.5, pointsize=20)
plot(variables_cluster)
dev.off()

#SELECCIONAMOS LAS VARIABLES CON LAS QUE QUEREMOS TRABAJAR
variables_tabla2<-data.frame(variables_tabla$PA,variables_tabla$topo_posic,variables_tabla$sol_rad_sum,variables_tabla$huella_humana,variables_tabla$PV,variables_tabla$topo_pend)

names(variables_tabla2)<-c("PA","topo_posic","sol_rad_sum","huella_humana","PV","topo_pend")



##########################################################
#PREPARACION DE LAS TABLAS DE DATOS PARA HACER LOS MODELOS
##########################################################
#UNA TABLA DE DATOS REQUIERE:
#una columna llamada presencia, con 1 en las presencias y 0 en las ausencias
#tantas columnas como variables predictivas se van a usar, y en cada registro, el valor de la variable para cada uno de los puntos de presencia
#las columnas con las coordenadas (no son necesarias para ajustar los modelos, pero sí lo son para evaluarlos)



#IMPORTA REGISTROS DE PRESENCIA
#------------------------------
#importa la tabla
presencia_utm<-read.table("presencia/presencia_q_pyrenaica.csv",header=T, sep=';')

## Convertir coordenadas UTM a Geográficas

presencia_utm_f <- SpatialPoints(cbind(presencia_utm$x,presencia_utm$y), 
                             proj4string=CRS("+proj=utm +zone=30"))

# Convierto objeto a longitud+latitud 
presencia_geo <- as.data.frame(spTransform(presencia_utm_f, CRS("+proj=longlat")))


#IMPORTA REGISTROS DE AUSENCIA
#-----------------------------

ausencia_utm<-read.table("presencia/ausencia_q_pyrenaica.csv",header=T, sep=';')

## Convertir coordenadas UTM a Geográficas

ausencia_utm_f <- SpatialPoints(cbind(ausencia_utm$x,ausencia_utm$y), 
                              proj4string=CRS("+proj=utm +zone=30"))

# Convierto objeto a longitud+latitud 
ausencia_geo <- as.data.frame(spTransform(ausencia_utm_f, CRS("+proj=longlat")))



#EXTRAE VALORES DE LAS VARIABLES EN LOS PUNTOS DE PRESENCIA A UNA TABLA
help(extract)
presencia_variables<-data.frame(extract(variables, presencia_geo))
str(presencia_variables)
presencia_variables$respuesta <- rep(1, nrow(presencia_variables))

#EXTRAE LOS VALORES DE LAS VARIABLES EN LAS AUSENCIAS
ausencia_variables<-data.frame(extract(variables, ausencia_geo))
ausencia_variables$respuesta <- rep(0, nrow(ausencia_variables))


#UNE LA RESPUESTA, LAS VARIABLES Y LAS COORDENADAS EN UN SOLO DATAFRAME
tabla_completa<-rbind(ausencia_variables, presencia_variables)



#QUITAMOS LOS REGISTROS CON VALORES NULOS (QUE NO TIENEN DATOS PARA TODAS LAS VARIABLES)
tabla_completa<-na.omit(tabla_completa)

#VEMOS EL RESULTADO

head(tabla_completa)


# Computamos una regresión logística con todos nuestras variables y con los datos de presencia/ausencia

m1<-glm(respuesta ~.,data=tabla_completa)
summary(m1)

# seleccionamos las variables que son significativas. Los "estimate" nos dan idea de la ganancia de cada variable.
tabla_modelo <-tabla_completa[,c('huella_humana','PA','PV','topo_posic','respuesta')]

m2<-glm(respuesta~., data=tabla_modelo)
summary(m2)

# valores predichos. Ya tenemos nuestro modelo matemático, ahora vamos a aplicarlo a las variables (mapas) que teníamos al principio.


p<-predict(variables, m2)
plot(p)


# Generar mapa en formato .asc
p_raster<-raster(p)
writeRaster(p, "modelo_Q_pyrenaica.asc")
            
            
# ¿Está bien modelado? A pensar 
points(presencia_geo, pch=19)


