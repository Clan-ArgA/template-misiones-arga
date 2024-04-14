# Indice

- [Sentencia](#sentencias)
- [Uso del comando "setVariable"](#uso-del-comando-"setVariable")
- [Sentencias ACE](#-Sentencias-ACE)
- [Sentencias de VCOM](#-Sentencias-de-VCOM)
- [Patrullas de VCOM](#-Patrullas-con-VCOM)
- [IA inmovil](#IA-inmovil)
- [Sentencias para Arsenales](#Sentencias-para-Arsenales)
- [Sentencia para Zeus](#Sentencia-para-Zeus)
- [Sentencias adicionales para Vehículos](#Sentencias-adicionales-para-Vehículos)
- [Sentencias de Ambiente](#Sentencias-de-Ambiente)
- [Roles permitidos](#Roles-permitidos)
- [Nombres alternativos permitidos y su conversión al rol correspondiente](#Nombres-alternativos-permitidos-y-su-conversión-al-rol-correspondiente)


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
**ace_medical_medicClass:** Setea el vehículo médico y Licencia Enfermero
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


## Roles permitidos
	Líder
	Sub Líder
	Líder Pelotón
	Ametrallador m240
	Ametrallador m249
	Granadero
	Granadero bengalas
	Lanzador AT
	Lanzador AA
	Tirador fal
	Tirador mk11
	Francotirador
	Ingeniero
	Observador
	Piloto
	Radio operador
	Médico
	Médico de combate
	Enfermero
	Fusilero
	Fusilero RA
	Entrenamiento
	Desconocido

## Nombres alternativos permitidos y su conversión al rol correspondiente
	Cacique			Líder
	Capitan			Líder
	Lider			Líder
	teniente		Sub Líder
	Teniente ¹		Sub Líder
	Teniente Primero	Sub Líder
	Sub Lider		Sub Líder
	Pampa			Sub Líder
	SubLider		Sub Líder
	Sub Comandante		Sub Líder
	Lider de Escuadra	Líder Pelotón
	Lider Sombra		Líder Pelotón
	Matrero			Líder Pelotón
	Lider-Tirador		Líder Pelotón
	Líder de Escuadra 1	Líder Pelotón
	Líder de Escuadra 2	Líder Pelotón
	Líder de Escuadra 3	Líder Pelotón
	Líder de Peloton	Líder Pelotón
	Ametrallador 762	Ametrallador m240
	Fusilero Automático	Ametrallador m240
	Ametrallador		Ametrallador m249
	Ametrallador 556	Ametrallador m249
	Granadero		Granadero
	Anti Tanque		Lanzador AT
	AT			Lanzador AT
	Fusilero AT		Lanzador AT
	AA			Lanzador AA
	Fusilero AA		Lanzador AA
	Tirador Designado CP	Tirador fal
	Tirador			Tirador mk11
	Tirador Designado	Tirador mk11
	Ingeniero		Ingeniero
	Sombra Especialista	Ingeniero
	Piloto			Piloto
	Radio operador		Radio operador
	Fusilero Ro		Radio operador
	Medico			Médico
	Sombra Medico		Médico
	Enfermero		Enfermero
	Fusilero		Fusilero
	Sombra			Fusilero
	Fusilero R/A		Fusilero RA
	Soldado			Entrenamiento
	Cabo Primero		Entrenamiento
	Instructor		Entrenamiento
	Soldado Primero		Entrenamiento
	Cabo			Entrenamiento
	Recluta			Entrenamiento
	Sargento Primero	Entrenamiento
	Aspirante		Entrenamiento
	Comandante		Entrenamiento
	Sargento		Entrenamiento
	PRUEBA 1		Entrenamiento
	PRUEBA 2		Entrenamiento
	Teniente¹		Entrenamiento
	Medico de Combate	Entrenamiento
	Aprendiz		Entrenamiento
	Sub Instructor		Entrenamiento
	Cabo Condor		Entrenamiento
	Cabo Yaguar		Entrenamiento
	Civil			Entrenamiento
	Supervisor		Entrenamiento
	Sargento Yaguar		Entrenamiento
	Sub Encargado		Entrenamiento
	PRUEBA 3		Desconocido
	any			Desconocido

