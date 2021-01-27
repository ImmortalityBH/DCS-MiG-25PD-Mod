dofile(LockOn_Options.script_path.."HUD/Indicator/definitions.lua")

local sensor_data = get_base_data()
PitchLineClipRadius = 163

function AddElement(object)
    object.use_mipfilter    = true
	object.additive_alpha   = true
	object.h_clip_relation  = h_clip_relations.COMPARE
	object.level			= HUD_DEFAULT_LEVEL
    Add(object)
end

local BASE_COLOR  = {255,0  ,0,60}
local GUNSIGHT_COLOR = {255,128,0,192}
local GunsightTexture   = MakeMaterial("recticuleHD.dds",GUNSIGHT_COLOR)
local BASE_COLOR_MAT    = MakeMaterial(nil,BASE_COLOR)

local shape_rotation = (sensor_data.getRoll()) * 57.3
-- shape_rotation = math.tan(shape_rotation/57.3) * 1000 -- to mils -- NOTE: this does nothing currently, returns 0

local full_radius = 400 -- is this the radius of "HUD/net view field"? Units 108 (pixels or angular units)? no effect!
local grid_shift  = (sensor_data.getPitch() / 57.3) * 1000 -- explain shift?-35
local grid_radius =  full_radius + grid_shift

local grid_origin	         = CreateElement "ceSimple"
grid_origin.name 		     = create_guid_string() -- no such function in this script. Not in definitions.lua either. Could be in elements_defs.lua
grid_origin.collimated 		 = true
AddElement(grid_origin)

local PitchScaleParam	    = CreateElement "ceTexPoly" --this could be the text area on HUD
PitchScaleParam.name 		= create_guid_string() -- this must be external function call.
PitchScaleParam.vertices   = {{-grid_radius, grid_radius},
			   { grid_radius, grid_radius},
			   { grid_radius,-grid_radius},
			   {-grid_radius,-grid_radius}}
PitchScaleParam.indices	= {0,1,2,2,3,0}
PitchScaleParam.tex_coords = {{0,0},{1,0},{1,1},{0,1}}
PitchScaleParam.material   = PitchScale
PitchScaleParam.element_params  = {"D_PITCH","D_ROLL","D_ENABLE"}  -- Global Variable to test
PitchScaleParam.controllers     = {{"move_up_down_using_parameter",0,1},{"rotate_using_parameter",1,1},{"opacity_using_parameter",2}}
PitchScaleParam.collimated = true
PitchScaleParam.parent_element = grid_origin.name
AddElement(PitchScaleParam)

-------------------------------
function AddPitchLine(name, tex_params, parent, index)

	local Line = AddHUDTexElement(name, 
					{{-37, -2.5}, {-37, 2.5}, 
					{37, 2.5}, {37, -2.5}},
					tex_params, 
					{{"D_PITCH", index, 348, PitchLineClipRadius}},
					{0.0, index * five_degrees, 0.0},
					{0.0, 0.0, 0.0},
					parent,
					HUD_DEFAULT_LEVEL)

	textpos = -1.2
	if index < 0 then
		textpos = 0.8
	end
				
	local Text1 = AddHUDTextElement(("txt_" .. name), 
				  {{"txt_pitch", index}}, 
				  {-41, textpos, 0.0}, 
				  name,
				  HUD_DEFAULT_LEVEL)
	
	local Text2 = AddHUDTextElement(("txt_" .. name .. string.format("%i", 2)), 
				  {{"txt_pitch", index}}, 
				  {41, textpos, 0.0}, 
				  name,
				  HUD_DEFAULT_LEVEL)
end
-------------------------------------------
arc_radius  	  = 160  -- 105 taille de l'arc exterieur!
half_width		  = arc_radius * 0.7 - 5
half_height		  = arc_radius * 0.7 - 5

local HUD_MATERIAL = MakeMaterial(nil,{0,255,0,255})
local W_width   = half_width/16
tex_scale = 0.22868

-- These vertices draw out the pitch line on the dummy HUD, looks like a "W" with wings.
self_W_ind 				= CreateElement "ceMeshPoly"
--self_W_ind.vertices   	= {rad2xy(4*W_width, math.pi), rad2xy(2*W_width, math.pi), rad2xy(math.sqrt(2)*W_width, -math.pi*0.75), {0,0}, rad2xy(math.sqrt(2)*W_width, -math.pi*0.25), rad2xy(2*W_width, 0), rad2xy(4*W_width, 0)}
self_W_ind.vertices   	= {{-4*W_width, 0}, {-2*W_width, 0}, {-W_width, -W_width}, {0,0},{W_width, -W_width},{2*W_width, 0},{4*W_width, 0}}
self_W_ind.indices    	= {0,1,1,2,2,3,3,4,4,5,5,6}
self_W_ind.primitivetype= "lines"
self_W_ind.material		= HUD_MATERIAL
self_W_ind.tex_params 	= {0.52658, 0.22868, tex_scale, tex_scale}
self_W_ind.element_params = {"D_ROLL","D_ENABLE"}
self_W_ind.controllers	= {{"rotate_using_parameter",0,1},{"opacity_using_parameter",1}}
AddElement(self_W_ind)

local FONT_         = MakeFont({used_DXUnicodeFontData = "font_cockpit_usa"},GUNSIGHT_COLOR,50,"test_font") --this is font object declaration. Mig-21 does not have fonts, therefore disabled.


function texture_box (UL_X,UL_Y,W,H) --this is texture box function. Receives some coordinates and dimensions, returns 4 pairs of values. Nothing is calling this function inside script.
    local texture_size_x = 128
    local texture_size_y = 128
    local ux = UL_X / texture_size_x
    local uy = UL_Y / texture_size_y
    local w  = W / texture_size_x
    local h  = W / texture_size_y

    return {{ux	    ,uy},
    		{ux + w ,uy},
    		{ux + w ,uy + h},
    		{ux	 	,uy + h}}
end

function create_textured_box(UL_X,UL_Y,DR_X,DR_Y) -- function that creates textured square. This function is called 2 times in below code.
    local size_per_pixel = 4/6
    local texture_size_x = 200
    local texture_size_y = 200
    local W = DR_X - UL_X
    local H = DR_Y - UL_Y

    local half_x = 0.5 * W * size_per_pixel
    local half_y = 0.5 * H * size_per_pixel
    local ux 	 = UL_X / texture_size_x
    local uy 	 = UL_Y / texture_size_y
    local w  	 = W / texture_size_x
    local h 	 = H / texture_size_y

    local object = CreateElement "ceTexPoly"
    object.vertices =  {{-half_x, half_y},
    				    { half_x, half_y},
    				    { half_x,-half_y},
    				    {-half_x,-half_y}}
    object.indices	  = {0,1,2,2,3,0}
    object.tex_coords = {{ux -w/2    ,uy-h/2},
    					 {ux + w/2 ,uy-h/2},
    					 {ux + w/2 ,uy + h/2},
    				     {ux-w/2 	 ,uy + h/2}}

    return object
end

--gun_sight_mark 					= create_textured_box(7,7,25,25) -- this is create_textured_box function call with parameters
gun_sight_mark 					= create_textured_box(-100,-100,100,100) -- this is create_textured_box function call with parameters
gun_sight_mark.material       	= GunsightTexture
--gun_sight_mark.material       	= BASE_COLOR_MAT
gun_sight_mark.name 			= create_guid_string()
gun_sight_mark.init_pos         = {0, -450, 0}
gun_sight_mark.init_rot		= {0, 0, 25}
gun_sight_mark.collimated	  	= true
--gun_sight_mark.element_params   = {"WS_GUN_PIPER_AVAILABLE",
--								   "WS_GUN_PIPER_AZIMUTH",
--								   "WS_GUN_PIPER_ELEVATION"}
								   
--gun_sight_mark.controllers 	   = {{"parameter_in_range"				,0,0.9,1.1},--check that piper available using WS_GUN_PIPER_AVAILABLE
--								  {"move_left_right_using_parameter",1, 0.73 },	--azimuth move by WS_GUN_PIPER_AZIMUTH , 0.73 is default collimator distance (from eye to HUD plane)
--								  {"move_up_down_using_parameter"   ,2, 0.73 }, --elevation move by WS_GUN_PIPER_ELEVATION
--								 }
gun_sight_mark.element_params = {"D_GUNSIGHT_VISIBILITY"}
gun_sight_mark.controllers = {
    {"opacity_using_parameter",0},
}
AddElement(gun_sight_mark)
