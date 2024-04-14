# Indice

- [Sentencia](#sentencias)
- [Uso del comando "setVariable"](##uso-del-comando-"setVariable")
- [Sentencias ACE](##-Sentencias-ACE)
- [Sentencias de VCOM](##-Sentencias-de-VCOM)
- [Patrullas de VCOM](##-Patrullas-con-VCOM)
- [IA inmovil](##IA-inmovil)
- [Sentencias para Arsenales](##Sentencias-para-Arsenales)
- [Sentencia para Zeus](##Sentencia-para-Zeus)
- [Sentencias adicionales para Vehículos](##Sentencias-adicionales-para-Vehículos)
- [Sentencias de Ambiente](##Sentencias-de-Ambiente)

# Sentencias

(en general se ubican en el Init de objeto/personaje)

## Uso del comando "setVariable"
(#TODO: escribir explicación)
> [Documentación oficial](https://community.bistudio.com/wiki/setVariable)

## Sentencias ACE
Configuración de roles

**ACE_IsEngineer:** Setea el rol de Ingeniero   
**ACE_isEOD:** Setea el rol de Experto en Explosivos    
**ace_medical_medicClass:** Setea el rol de Médico  
**ACE_isRepairVehicle:** Setea el vehículo de reparación   
**ace_medical_medicClass:** Setea el vehículo médico y licencia Enfermero
**ACE_isRepairFacility:** Setea un objeto de reparación   
**ACE_GForceCoef:** Setea la reducción de la fuerza G  

	this setVariable ["ACE_IsEngineer",1,true];
	this setVariable ["ACE_isEOD",true,true];
	this setVariable ["ace_medical_medicClass", 2, true];
	this setVariable ["ACE_isRepairVehicle", 1, true];
	this setVariable ["ace_medical_medicClass",1, true];
	this setVariable ["ACE_isRepairFacility", 1, true];
	this setVariable ["ACE_GForceCoef",0.4]; 

## Sentencias de VCOM
Todos estos parámetros son booleanos, es decir toman valores de **true** o **false**.
	
  **VCM_NOFLANK**: Impide a la IA de realizar movimientos avanzados, como el flanqueo.  
  **VCM_NORESCUE**: Evita que la IA acuda a los pedidos de refuerzo.  
  **VCM_TOUGHSQUAD**: Evita que la IA pida refuerzos.  
  **Vcm_Disable**: Desactiva la VCOM completamente en el grupo.  
  **VCM_DisableForm**: Impide a VCOM cambiar la formación del grupo.  
  **VCM_Skilldisable**: Evita que VCOM cambie la skills de las unidades.   
	
	(group this) setVariable ["VCM_NOFLANK",true];
	(group this) setVariable ["VCM_NORESCUE",true];
	(group this) setVariable ["VCM_TOUGHSQUAD",true];
	(group this) setVariable ["Vcm_Disable",true];
	(group this) setVariable ["VCM_DisableForm",true];
	(group this) setVariable ["VCM_Skilldisable",true];
	
## Patrullas con VCOM
Colocar 1 waypoint para la patrulla, configurar el estado de modo de fuego y movimiento y colocar las siguientes sentencias en "Al Activarse" del waypoint:

  **CBA_fnc_taskDefend**: La IA se repartira en edificios cercanos ocupandolos y manteniendo la posición.
  
  **BIS_fnc_taskPatrol**: La IA creara automaticamente waypoint generando una patrulla dentro del radio proporcionado, en ejemplo es 500 mts
  
	[this] call CBA_fnc_taskDefend;
 	[group this, getPos this, 500] call BIS_fnc_taskPatrol;

### IA inmovil

**Move:** La ai no se mueva ni gire regularmente.
**Path:** La ai no se mueva pero gira para apuntarte.

	this disableAI "move";
	this disableAI "path";

## Sentencias para Arsenales

 **Sentencia Arsenal Virtual**

	0=["AmmoboxInit",[this,true]] spawn BIS_fnc_arsenal;

**Sentencia Arsenal ACE**

	[_box, true] call ace_arsenal_fnc_initBox;

## Sentencia para Zeus

	_unit assignCurator _curatorModule;

assignCurator Debe ser ejecutada en el servidor para hacer efecto. 
Si la misión esta corriendo en un servidor dedicado:

	[_unit, _curatorModule] remoteExec ["assignCurator",2];

## Sentencias adicionales para Vehículos

**Velocidad Máxima de Vehículo por IA**

	this limitspeed "Numero";


**Banderas sobre vehículo.**

	this forceFlagTexture "\A3\Data_F\Flags\Flag_uno_CO.paa"; 

[Mas texturas de banderas](https://community.bistudio.com/wiki/Flag_Textures)


**Vehículo sin transmisión de daño para ocupantes:**

	this addEventHandler ["GetIn", {_unit = _this select 2; _unit allowDamage false;}]; 
	this addEventHandler ["GetOut", {_unit = _this select 2; _unit allowDamage true;}];



## Sentencias de Ambiente

**Imágenes en carteles**

Debe estar en carpeta de misión o subcarpeta imgs siendo "imgs/Escudo1.jpg"

 
	this setObjectTextureGlobal [0,"Escudo1.jpg"];	
    
   >No funciona en objetos simples
Tamaño recomendados 1024x512, 512x256 o cualquiera que respete el 2:1

**Animación Ambiental Fija** 
(Ojo, en servidor puede transportarse al spawnear de su posicion original la IA).

	[this, "LISTEN_BRIEFING"] call BIS_fnc_ambientAnim;	

[Mas opciones](https://community.bistudio.com/wiki/BIS_fnc_ambientAnim)
