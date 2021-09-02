# Teleport

Script para teletranportar tropa de un lugar a otro en misiones que se quiere comenzar en un lugar determinado y se quiere planificar en misión, permititiendo la entrada de jugadores en un período anterior al comienzo de la misión.

Copiar a la carpeta scripts la carpeta **teleport**

## Instrucciones
* Colocar:
  ~~~
  execVM "scripts\teleport\teleport_inicio.sqf";
  ~~~
  en el archivo **initPlayerLocal.sqf**.
* Colocar dentro de la clase **CfgSounds**:
  ~~~
  #include "scripts\teleport\sounds.hpp"
  ~~~
  en el archivo **description.ext**.
  Ejemplo:
    ~~~
    class CfgSounds {
        sounds[] = {};
    #include "core\sounds.hpp"
    #include "scripts\teleport\sounds.hpp"
    };
    ~~~

* Poner un objeto desde donde se disparará la acción con un addAction y colocarle un nombre de variable.
* Poner un **activador** (o varios) que delimiten una zona donde todas las unidades que esten dentro del mismo se transportaran a un destino determinado. Se le debe colocar al nombre de la variable un valor como por ejemplo **teleport_a_alfa**
* Poner en el lugar de destino tantos **marcadores** como activadores se pusieron. Deben tener un nombre de variable. Ej.: **alfa**
* En el archivo **teleport_inicio.sqf** dentro de la carpeta **teleport** se ve lo siguiente:

  ~~~
    private _authorizedUID = ["numero_1,"numero_2"];

    private _teleport_data = [
      _authorizedUID,
      [
        [Nombre_Activador_1,"Nombre_Marcador_1"],
        [Nombre_Activador_2,"Nombre_Marcador_2"]
      ],
      NOMBRE_OBJETO,
      [año,mes,dia,hora,minuto],
      "scripts\directorio\nombre_script.sqf"
    ];
  ~~~
  donde:
  ~~~
    private _authorizedUID = ["numero_1,"numero_2"];
  ~~~
  es el número UID del jugador autorizado para activar la teletransportación. Siempre debe estar entre comillas.
  Si se coloca:
  ~~~
    private _authorizedUID = [];
  ~~~
  cualquier jugador podrá activar la teletransportación.
  ~~~
    [
      [Nombre_Activador_1,"Nombre_Marcador_1"],
      [Nombre_Activador_2,"Nombre_Marcador_2"]
    ],
  ~~~
  **Nombre_Activador_1** es el activador que indica origen, **"Nombre_Marcador_1"** es el nombre del marcador el de destino. Este último va entre comillas siempre. Cada renglón es un par origen, destino. Todas las lineas deben terminar con coma, excepto la última. 
  ~~~
    NOMBRE_OBJETO,
  ~~~
  **NOMBRE_OBJETO** se debe cambiar por el que se puso en el objeto al cual se le agregará un addAction.
  ~~~
    [año,mes,día,hora,minuto]
  ~~~
  Indica la fecha y hora de misión cuando se termina de ejecutar la teletransportación.
  ~~~
    Año: 4 números (2020, 2021, etc)
    Mes: [1..12]
    Día: [1..31]
    Hora: [0..23]
    Minuto: [0..59]
  ~~~
  Si se coloca **[]** no se cambiara la fecha y hora de la misión luego de ejecutado el teletransporte.
  ~~~
  "scripts\directorio\nombre_script.sqf"
  ~~~
  Cambiar esto por la ruta al script que se ejecutará despues de la teletransportación. Colocando **""** no se ejecutará ningún script.


  
