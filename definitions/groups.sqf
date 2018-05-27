/*
	Author: Markus "Sazzay" Larsson
	
	Description: Array of group configs.
*/

I_DEF_GROUPS = [
["MSV-BMP3M-SQUAD", (configfile >> "CfgGroups" >> "East" >> "rhs_faction_msv" >> "rhs_group_rus_MSV_bmp3m" >> "rhs_group_rus_MSV_bmp3m_squad")],
["MSV-BTR80A-SQUAD", (configfile >> "CfgGroups" >> "East" >> "rhs_faction_msv" >> "rhs_group_rus_msv_BTR80a" >> "rhs_group_rus_msv_BTR80a_squad")],
["MSV-INFANTRY-SQUAD", (configfile >> "CfgGroups" >> "East" >> "rhs_faction_msv" >> "rhs_group_rus_msv_infantry" >> "rhs_group_rus_msv_infantry_squad")],
["MSV-INFANTRY-FIRETEAM", (configfile >> "CfgGroups" >> "East" >> "rhs_faction_msv" >> "rhs_group_rus_msv_infantry" >> "rhs_group_rus_msv_infantry_squad")],
["MSV-URAL-SQUAD", (configfile >> "CfgGroups" >> "East" >> "rhs_faction_msv" >> "rhs_group_rus_msv_Ural" >> "rhs_group_rus_msv_Ural_squad")],
["MSV-GAZ66-SQUAD", (configfile >> "CfgGroups" >> "East" >> "rhs_faction_msv" >> "rhs_group_rus_msv_gaz66" >> "rhs_group_rus_msv_gaz66_squad")],
["TV-T90A-PLATOON", (configfile >> "CfgGroups" >> "East" >> "rhs_faction_tv" >> "rhs_group_rus_tv_90" >> "RHS_t90aPlatoon")],
["TV-T72-PLATOON", (configfile >> "CfgGroups" >> "East" >> "rhs_faction_tv" >> "rhs_group_rus_tv_72" >> "RHS_T72BDPlatoon")],
["VDV-INFANTRY-SQUAD", (configfile >> "CfgGroups" >> "East" >> "rhs_faction_vdv" >> "rhs_group_rus_vdv_infantry_flora" >> "rhs_group_rus_vdv_infantry_flora_squad")],
["VDV-INFANTRY-FIRETEAM", (configfile >> "CfgGroups" >> "East" >> "rhs_faction_vdv" >> "rhs_group_rus_vdv_infantry_flora" >> "rhs_group_rus_vdv_infantry_flora_fireteam")],
["VDV-MI8-ASSAULT-SQUAD", (configfile >> "CfgGroups" >> "East" >> "rhs_faction_vdv" >> "rhs_group_rus_vdv_mi8" >> "rhs_group_rus_vdv_mi8_squad")],
["VDV-MI24-RECON-SQUAD", (configfile >> "CfgGroups" >> "East" >> "rhs_faction_vdv" >> "rhs_group_rus_vdv_mi24" >> "rhs_group_rus_vdv_mi24_squad")],
["VDV-BMD4M-SQUAD", (configfile >> "CfgGroups" >> "East" >> "rhs_faction_vdv" >> "rhs_group_rus_vdv_bmd4m" >> "rhs_group_rus_vdv_bmd4m_squad")],
["VDV-BMD4-SQUAD", (configfile >> "CfgGroups" >> "East" >> "rhs_faction_vdv" >> "rhs_group_rus_vdv_bmd4" >> "rhs_group_rus_vdv_bmd4_squad")],
["VDV-BMD2-SQUAD", (configfile >> "CfgGroups" >> "East" >> "rhs_faction_vdv" >> "rhs_group_rus_vdv_bmd2" >> "rhs_group_rus_vdv_bmd2_squad")],
["VDV-AA-SQUAD", (configfile >> "CfgGroups" >> "East" >> "rhs_faction_vdv" >> "rhs_group_rus_vdv_infantry_flora" >> "rhs_group_rus_vdv_infantry_flora_section_AA")],
["VDV-AA-SQUAD-2", (configfile >> "CfgGroups" >> "East" >> "rhs_faction_vdv" >> "rhs_group_rus_vdv_infantry" >> "rhs_group_rus_vdv_infantry_section_AA")],
["VDV-AA-URAL", (configfile >> "CfgGroups" >> "East" >> "rhs_faction_vdv" >> "rhs_group_rus_vdv_Ural" >> "rhs_group_rus_vdv_Ural_squad_aa")]
];

I_DEF_LAND_INF_GROUPS = [
"MSV-BMP3M-SQUAD", 
"MSV-BTR80A-SQUAD", 
"MSV-INFANTRY-SQUAD", 
"VDV-INFANTRY-SQUAD",
"VDV-BMD4M-SQUAD",
"VDV-BMD4-SQUAD",
"VDV-BMD2-SQUAD"
];

I_DEF_LAND_AMBUSH_GROUPS = [
"MSV-INFANTRY-SQUAD", 
"VDV-INFANTRY-SQUAD"
];