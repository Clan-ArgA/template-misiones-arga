/*******************************************************************************
                          Realizado por |ArgA|Vultur|Sgt
*******************************************************************************/

// [
//     [
//         [Activador de origen, Marcador de destino],
//         [Activador de origen 2, Marcador de destino 2],
//         ...
//     ],
//     objeto al que se agrega el addAction
// ];

							// Camello              Ignacio              Jhon               Shaggy				  Vultur
private _authorizedUID = ["76561198197706543", "76561198026915573","76561198192306746","76561198030188168","76561198010777357"];

private _teleport_data = [
    _authorizedUID,
    [
        [teleport_a_delta_alfa,"delta_alfa"],
        [teleport_a_charlie_alfa,"charlie_alfa"]
    ],
    VUL_MASTIL,
    [2021,8,22,18,48],
    "scripts\delayTime.sqf"
];

_teleport_data execVM "scripts\teleport\teleport.sqf";

/*******************************************************************************
                          Realizado por |ArgA|Vultur|Sgt
*******************************************************************************/