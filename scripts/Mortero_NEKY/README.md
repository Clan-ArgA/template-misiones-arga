# Morteros

Script para disparar morteros automaticamente

Copiar a la carpeta scripts el archivo **settings_mortero.sqf** y la carpeta **NEKY_Mortars**

## Instrucciones

* Hay que poner un mortero sin operador con un nombre en la casilla varariable, por ejemplo mortero_1
* Se coloca un disparador en la zona que se quiere que el mortero haga fuego. Se coloca una sentencia como las del ejemplo en el mismo

El fuego de mortero se hace hacia el grupo de jugadores que entraron dentro del activador. Previamente se dispara un humo rojo

## Video
https://www.youtube.com/watch?v=lC_Re0DEJFI

## Parametros

[nombre_mortero, thisList, "Tipo_ronda", "densidad_de_disparo", es_auto, distancia_minima, distancia_maxima] execVM "scripts\mortero.sqf";

* nombre_mortero: Nombre de la variable del mortero. Se coloca en el editor
* thisList: se deja así
* Tipo_ronda: "Sh_82mm_AMOS", "Sh_120mm_HE", "Sh_155mm_AMOS", "Smoke_120mm_AMOS_White", "F_40mm_White"
* densidad_de_disparo: "sporadic", "precise", "barrage", "guided","screen","safe"
* es_auto: true o false
* distancia_minima: mínimo rango donde dispara el mortero
* distancia_maxima: máximo rango donde dispara el mortero


## Ejemplos llamadas
    
    [mortero_1, thisList, "guided", "Medium", true, 100, 250] execVM "scripts\settings_mortero.sqf";
    [mortero_2, thisList, "safe", "light", false, 200, 380] execVM "scripts\settings_mortero.sqf";


## densidad_de_disparo

Tipo | Descripción
--- | ---
sporadic | Disparos esporadicos con poca preción
precise | Disparos precisos hacia la posición de los jugadores
barrage | Fuego de barrera
guided | Comienza con disparos poco precisos que se van acercando a la posición de los jugadores
screen | Fuego de pantalla
safe | Dispara hacia los jugadores pero los proyectiles caen a un mínimo de 60 m de los mismos


## es_auto

Tipo | Descripción
--- | ---
true | Modo de disparo automático
false | Modo de disparo manual

