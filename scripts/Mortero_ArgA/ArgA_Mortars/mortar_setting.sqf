//	Settings for NEKY_Mortars
//	
//	(https://community.bistudio.com/wiki/Arma_3_CfgMagazines#8Rnd_82mm_Mo_shells)   Mortar class names
//	
//	Made by NeKo-ArroW

/*******************************************************************************
                          	Modify by |ArgA|Vultur|Tte
*******************************************************************************/

// General Settings
_IntervalFire = 3;											// Time between mortar shots.																						Number (Seconds)
_Ammo = 20;													// Total ammo the mortar can spend. Once empty, unit will dismount.													Number (Mortars)
_SpreadDistance = 50;										// Shot dispersion distance from the original impact position.														Number (Meters)

//Class round: light           medium         heavy             smoke                    flare 
_round = ["Sh_82mm_AMOS", "Sh_120mm_HE", "Sh_155mm_AMOS", "Smoke_120mm_AMOS_White", "F_40mm_White"];
_MortarTypeArray = [ "light", "medium", "heavy", "smoke", "flare"];
_MarkSmoke  = "SmokeShellRed";								// Class name of smoke that marks target area.																		String
_MarkFlare  = "F_40mm_Red";									// Class name of flare that marks target area.																		String

/*******************************************************************************
                          	Modify by |ArgA|Vultur|Tte
*******************************************************************************/
