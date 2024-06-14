# Morteros

Script para disparar morteros automaticamente

Copiar a la carpeta scripts el archivo **mortar_fire.sqf** y la carpeta **ArgA_Mortars**

## Instrucciones

Existen 2 tipos de uno de este scrip:
* Mortero Fuera de Mapa: Dispara una ronda de munición sobre un objetivo marcado por un activador, hasta que se agote la munición.
* Mortero en Mapa: Hay que poner un mortero cin operador con un nombre en la casilla varariable, por ejemplo mortero_1

Se coloca un disparador en la zona que se quiere que el mortero haga fuego. Se coloca una sentencia como las del ejemplo en el mismo.

El fuego de mortero se hace hacia el grupo de jugadores que entraron dentro del activador. Se puede elegir si se dispara un disparo de advertencia previo. De día es un humo, de noche una bengala.

## Parametros
params["_Mortar","_playerGroup","_Ammo",["_FireMode", "safe"],["_MinimalSafeDistance",100],["_typeRound", "light"],["_Is_warning_shot_fired", true]];
[nombre_mortero, thisList, cantidad_de_disparos, modo_de_disparo, distancia_de_seguridad, tipo_ronda, disparo_de_advertencia] execVM "scripts\mortero.sqf";

* nombre_mortero: Nombre de la variable del mortero. Se coloca en el editor. Si se usa `"offmap"` se activa el mortero fuera del mapa.
* thisList: se deja así
* cantidad_de_disparos: Total de rondas a disparar. Si de coloca `"infinite"` en el caso de un mortero en mapa, sigue disparando hasta que es destruido o se sale de la zona del activador.
* modo_de_disparo: En un mortero en mapa puede ser `"safe"` o `"unsafe"`. En un mortero fuera de mapa, siempre el modo es `"safe"`. El valor por defecto es `"safe"`.
* distancia_de_seguridad: Es la distancia mínima en metros, entre el punto de impacto y los jugadores. Esta distancia se calcula al momento del disparo por lo cual puede variar al momento del impacto. Esto puede ser más notorio en el caso del mortero en mapa. El valor por defecto es de `100`m.
* tipo_ronda: Los valores son `"light"`, `"medium"`, `"heavy"`, `"smoke"`, `"flare"`. Ver la tabla de equivalencias. El valor por defecto es `"light"`.
* disparo_de_advertencia: `true` o `false`. Indica si se hace un disparo de advertencia cuando el mortero es `"offmap"`. De día cae un humo rojo, de noche una bengala roja.  El valor por defecto es `true`.

## Ejemplos llamadas en el activador
    
    ["offmap", thisList, 2, "safe", 100, "light", true] execVM "scripts\mortar_fire.sqf";
    [mortar_1, thisList, 2, "safe", 100] execVM "scripts\mortar_fire.sqf";
    [mortar_1, thisList, 2, "unsafe"] execVM "scripts\mortar_fire.sqf";


## tipo_ronda

Tipo | Munición
--- | ---
light | Sh_82mm_AMOS
medium | Sh_120mm_HE
heavy | Sh_155mm_AMOS
smoke | Smoke_120mm_AMOS_White
flare | F_40mm_White

## mortar_setting.sqf

En este archivo se encuantran parámetros que pueden ser cambiados a gusto del editor.

Se recomienda aumentar el valor de la distancia de `_SpreadDistance` cuando se usa mortero en mapa en modo `"unsafe"`.
