mount_vfs_texture_archives("Bazar/Textures/AvionicsCommon")

attributes = {
	"support_for_cws",
}

creators = {
{"avKneeboard",LockOn_Options.common_script_path.."KNEEBOARD/device/init.lua"}
}

indicators = { 
{"ccKneeboard",LockOn_Options.common_script_path.."KNEEBOARD/indicator/init.lua",1,{{},{sx_l = -0.65,sz_l =  0.15,sy_l = -0.5,ry_l =  10, rz_l = 85 ,sw = 0.142 * 0.5 - 0.1,sh = 0.214 * 0.5 - 0.1},nil}}
}