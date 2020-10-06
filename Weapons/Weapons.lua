-----------------------------------------
-- DECLARING CENTERLINE FUEL TANK TYPE --
-----------------------------------------
-- alternatively:
-- declare_loadout( {} )
local centerline_ft = 
{
	category        = CAT_FUEL_TANKS,
	CLSID           = "{Centerline_FT_5300L}",
	attribute       =  {wsType_Air,wsType_Free_Fall,wsType_FuelTank,WSTYPEPLACEHOLDER},
	Picture         = "fueltank.png",
	displayName     = _("Centerline Fuel Tank"),
	Weight_Empty    = 50, --kg
	Weight          = 5300, --kg
	Cx_pil          = 0.00141476,
	
	shape_table_data =
	{
		{
			name     = "Central_Fuel_Tank",
			file    = "Central_Fuel_Tank",
			life    = 1,
			fire    = {0, 1},
			username    = "Central_Fuel_Tank",
			index    = WSTYPE_PLACEHOLDER,
		},
	},
	
	Elements =
	{
		{
			ShapeName    = "scooty",
		},
	},
}

----------------------------------
-- DECLARING OUR CUSTOM LOADOUT --
----------------------------------
declare_loadout(centerline_ft)
