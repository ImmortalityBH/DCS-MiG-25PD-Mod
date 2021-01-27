// ED_FM_Template.cpp : Defines the exported functions for the DLL application.
// MiG-25P mod EFM by Immortality
// Start date 10/12/20
// End date
// Source Data
// 1) MiG-25RBT Technical Manual
// DCS WORLD COORINATE SYSTEM REF
// X: through front of the nose
// Y: through the top of the aircraft
// Z: through the right wing
// Normal Aerodynamics/Control Convention:
// Xbody: Out the front of the nose
// Ybody: Out the right wing
// Zbody: Out the bottom of the aircraft

#include "stdafx.h"
#include "MiG25.h"
#include "ED_FM_Utility.h"
#include <Math.h>
#include <stdio.h>
#include <string>

//MiG25 headers
#include "MiG25Input.h"
#include "MiG25Constants.h"
#include "MiG25Engine.h"
#include "MiG25FuelSystem.h"
#include "MiG25Airframe.h"
#include "MiG25Gear.h"

namespace MiG25
{
	LandingGear Gear;
	FuelSystem Fuel;
}

Vec3	common_moment;
Vec3	common_force;
Vec3    center_of_gravity;
Vec3	wind;
Vec3	velocity_world_cs;
double  throttle		  = 0;
double  stick_roll		  = 0;
double  stick_pitch		  = 0;

double  internal_fuel     = 0; //in kg/liters
double  fuel_consumption_since_last_time  = 0;
double  atmosphere_density = 0;
double  aoa = 0;
double  speed_of_sound = 320; // in m/s


double mach_table[] = {
	0,	
	0.2,
	0.4,
	0.6,
	0.7,
	0.8,
	0.9,
	1,	
	1.05,
	1.1,
	1.2,
	1.3,
	1.5,
	1.7,
	1.8,
	2,	
	2.2,
	2.5,
	3.9,
};

double cx0[] =
{
	0.0165,
	0.0165,
	0.0165,
	0.0165,
	0.0170,
	0.0178,
	0.0215,
	0.0310,
	0.0422,
	0.0440,
	0.0432,
	0.0423,
	0.0416,
	0.0416,
	0.0416,
	0.0410,
	0.0395,
};

double Cya[] = {
	   0.077,	
	   0.077,	
	   0.077,	
	   0.080,	
	   0.083,	
	   0.087,	
	   0.091,	
	   0.094,	
	   0.094,	
	   0.091,	
	   0.085,	
	   0.068,	
	   0.051,	
	   0.043,	
	   0.037,	
	   0.036,	
	   0.033,	
};

double B[] ={
	0.1,	
	0.1,	
	0.1,	 
	0.094,	
	0.094,	
	0.094,	
	0.11,	
	0.15,	
	0.15,	
	0.14,	
	0.17,	
	0.23,	
	0.23,	
	0.08,	
	0.16,	
	0.25,	
	0.35,	
};

double B4[] ={
	0.032,	
	0.032,	 
	0.032,	
	0.043,	
	0.045,	
	0.048,	
	0.050,	
	0.1,	
	0.1,	
	0.1,	
	0.096,	
	0.09,	
	0.38,	
	2.5,	
	3.2,	
	4.5,	
	6.0,	
};

double CyMax[] = {
	1.6,
	1.6,
	1.6,
	1.5,
	1.45,
	1.4,
	1.3,
	1.2,
	1.1,
	1.05,
	1.0,
	0.9,
	0.7,
	0.55,
	0.4,
	0.4,
	0.4,
};

/*void simulate_fuel_consumption(double dt)
{
	fuel_consumption_since_last_time =  10 * throttle * dt; //10 kg persecond
	if (fuel_consumption_since_last_time > internal_fuel)
		fuel_consumption_since_last_time = internal_fuel;
	internal_fuel -= fuel_consumption_since_last_time;
}*/

// This is where the simulation send the accumulated forces to the DCS Simulation after each run frame
void ed_fm_add_local_force(double & x,double &y,double &z,double & pos_x,double & pos_y,double & pos_z)
{

}

// same but in component form , return value bool : function will be called until return value is true
bool ed_fm_add_local_force_component(double& x, double& y, double& z, double& pos_x, double& pos_y, double& pos_z)
{
	return false;
}

// This is where the simulation send the accumulated moments to the DCS Simulation
// after each run frame
void ed_fm_add_local_moment(double & x,double &y,double &z)
{

}

// same but in component form , return value bool : function will be called until return value is true
bool ed_fm_add_local_moment_component(double& x, double& y, double& z)
{
	return false;
}

/*void ed_fm_add_global_force(double & x,double &y,double &z,double & pos_x,double & pos_y,double & pos_z)
{}
bool ed_fm_add_global_force_component(double& x, double& y, double& z, double& pos_x, double& pos_y, double& pos_z)
{return false;}
void ed_fm_add_global_moment(double & x,double &y,double &z)
{}
bool ed_fm_add_global_moment_component(double& x, double& y, double& z)
{ return false;}*/

//-----------------------------------------------------------------------
// The most important part of the entire EFM code.  This is where your code
// gets called for each run frame.  Each run frame last for a duration of
// "dt". dt is actually slice-length DCS wants code to limit itself to,
// not actually time passed since last frame - it is constant 0.006000 seconds.
void ed_fm_simulate(double dt)
{

	// update amount of fuel used and change in mass
	MiG25::Fuel.UpdateFrame(0, dt);

}

// called before simulation to set up your environment for the next step
// give parameters of surface under your aircraft
void ed_fm_set_surface(double h, double h_obj, unsigned surface_type, double normal_x, double normal_y, double normal_z)
{
	
}

void ed_fm_set_atmosphere(double h,//altitude above sea level
							double t,//current atmosphere temperature , Kelwins
							double a,//speed of sound
							double ro,// atmosphere density
							double p,// atmosphere pressure
							double wind_vx,//components of velocity vector, including turbulence in world coordinate system
							double wind_vy,//components of velocity vector, including turbulence in world coordinate system
							double wind_vz //components of velocity vector, including turbulence in world coordinate syste
						)
{
	wind.x = wind_vx;
	wind.y = wind_vy;
	wind.z = wind_vz;

	//kelvin to celcius
	//temp in Celcius = t - 273;

	atmosphere_density = ro;
	speed_of_sound     = a;
}
/*
called before simulation to set up your environment for the next step
*/
void ed_fm_set_current_mass_state (double mass,
									double center_of_mass_x,
									double center_of_mass_y,
									double center_of_mass_z,
									double moment_of_inertia_x,
									double moment_of_inertia_y,
									double moment_of_inertia_z
									)
{
	center_of_gravity.x  = center_of_mass_x;
	center_of_gravity.y  = center_of_mass_y;
	center_of_gravity.z  = center_of_mass_z;
}
/*
called before simulation to set up your environment for the next step
*/
void ed_fm_set_current_state (double ax,//linear acceleration component in world coordinate system
							double ay,//linear acceleration component in world coordinate system
							double az,//linear acceleration component in world coordinate system
							double vx,//linear velocity component in world coordinate system
							double vy,//linear velocity component in world coordinate system
							double vz,//linear velocity component in world coordinate system
							double px,//center of the body position in world coordinate system
							double py,//center of the body position in world coordinate system
							double pz,//center of the body position in world coordinate system
							double omegadotx,//angular accelearation components in world coordinate system
							double omegadoty,//angular accelearation components in world coordinate system
							double omegadotz,//angular accelearation components in world coordinate system
							double omegax,//angular velocity components in world coordinate system
							double omegay,//angular velocity components in world coordinate system
							double omegaz,//angular velocity components in world coordinate system
							double quaternion_x,//orientation quaternion components in world coordinate system
							double quaternion_y,//orientation quaternion components in world coordinate system
							double quaternion_z,//orientation quaternion components in world coordinate system
							double quaternion_w //orientation quaternion components in world coordinate system
							)
{
	velocity_world_cs.x = vx;
	velocity_world_cs.y = vy;
	velocity_world_cs.z = vz;
}


void ed_fm_set_current_state_body_axis(double ax,//linear acceleration component in body coordinate system
	double ay,//linear acceleration component in body coordinate system
	double az,//linear acceleration component in body coordinate system
	double vx,//linear velocity component in body coordinate system
	double vy,//linear velocity component in body coordinate system
	double vz,//linear velocity component in body coordinate system
	double wind_vx,//wind linear velocity component in body coordinate system
	double wind_vy,//wind linear velocity component in body coordinate system
	double wind_vz,//wind linear velocity component in body coordinate system

	double omegadotx,//angular accelearation components in body coordinate system
	double omegadoty,//angular accelearation components in body coordinate system
	double omegadotz,//angular accelearation components in body coordinate system
	double omegax,//angular velocity components in body coordinate system
	double omegay,//angular velocity components in body coordinate system
	double omegaz,//angular velocity components in body coordinate system
	double yaw,  //radians
	double pitch,//radians
	double roll, //radians
	double common_angle_of_attack, //AoA radians
	double common_angle_of_slide   //AoS radians
	)
{
	aoa = common_angle_of_attack;
}
// list of input enums kept in separate header for easier documenting
//
// Command = Command Index (See Export.lua), Value = Signal Value (-1 to 1 for Joystick Axis)
void ed_fm_set_command (int command,
							float value)
{
	if (command == 2004)//iCommandPlaneThrustCommon
	{
		throttle = 0.5 * (-value + 1.0);
	}
	else if (command == 2001)//iCommandPlanePitch
	{
		stick_pitch		  = value;
	}
	else if (command == 2002)//iCommandPlaneRoll
	{
		stick_roll		  = value;
	}
}
/*
	Mass handling 

	will be called  after ed_fm_simulate :
	you should collect mass changes in ed_fm_simulate 

	double delta_mass = 0;
	double x = 0;
	double y = 0; 
	double z = 0;
	double piece_of_mass_MOI_x = 0;
	double piece_of_mass_MOI_y = 0; 
	double piece_of_mass_MOI_z = 0;
 
	//
	while (ed_fm_change_mass(delta_mass,x,y,z,piece_of_mass_MOI_x,piece_of_mass_MOI_y,piece_of_mass_MOI_z))
	{
	//internal DCS calculations for changing mass, center of gravity,  and moments of inertia
	}
*/
bool ed_fm_change_mass  (double & delta_mass,
						double & delta_mass_pos_x,
						double & delta_mass_pos_y,
						double & delta_mass_pos_z,
						double & delta_mass_moment_of_inertia_x,
						double & delta_mass_moment_of_inertia_y,
						double & delta_mass_moment_of_inertia_z
						)
{
	if (fuel_consumption_since_last_time > 0)
	{
		delta_mass		 = fuel_consumption_since_last_time;
		delta_mass_pos_x = -1.0;
		delta_mass_pos_y =  1.0;
		delta_mass_pos_z =  0;

		delta_mass_moment_of_inertia_x	= 0;
		delta_mass_moment_of_inertia_y	= 0;
		delta_mass_moment_of_inertia_z	= 0;

		fuel_consumption_since_last_time = 0; // set it 0 to avoid infinite loop, because it called in cycle 
		// better to use stack like structure for mass changing 
		return true;
	}
	else 
	{
		return false;
	}
}

// set internal fuel volume , init function, called on object creation and for refueling , 
// you should distribute it inside at different fuel tanks
void   ed_fm_set_internal_fuel(double fuel)
{
	MiG25::Fuel.SetInternalFuel(fuel);
}

// get internal fuel volume
double ed_fm_get_internal_fuel()
{
	return MiG25::Fuel.GetInteralFuel();
}

// set external fuel volume for each payload station , called for weapon init and on reload
void  ed_fm_set_external_fuel (int	 station,
								double fuel,
								double x,
								double y,
								double z)
{
}

// get external fuel volume
double ed_fm_get_external_fuel ()
{
	return 0; //no external fuel for MiG25P
}

// called on ground refuel
 void ed_fm_refueling_add_fuel(double fuel)
{
	return MiG25::Fuel.RefuelAdd(fuel);
}

// external model draw arguments. size: coutns elements in array
void ed_fm_set_draw_args (EdDrawArgument * drawargs,size_t size)
{
	drawargs[28].f   = (float)throttle;
	drawargs[29].f   = (float)throttle;

	if (size > 616)
	{	
		drawargs[611].f = drawargs[0].f;
		drawargs[614].f = drawargs[3].f;
		drawargs[616].f = drawargs[5].f;
	}

}

// cockpit draw arguments
void ed_fm_set_fc3_cockpit_draw_args(EdDrawArgument* drawargs, size_t size)
{

}

// shake level amplitude for head simulation
double ed_fm_get_shake_amplitude()
{
	return 0;
}

// will be called for your internal configuration
void ed_fm_configure(const char * cfg_path)
{

}

// called when fm not needed anymore: aircraft death, mission quit etc.; use to reset flight model
void ed_fm_release()
{

}

double ed_fm_get_param(unsigned index)
{
	if (index <= ED_FM_END_ENGINE_BLOCK)
	{
		switch (index)
		{
		case ED_FM_ENGINE_0_RPM:			
		case ED_FM_ENGINE_0_RELATED_RPM:	
		case ED_FM_ENGINE_0_THRUST:			
		case ED_FM_ENGINE_0_RELATED_THRUST:	
			return 0; // APU
		case ED_FM_ENGINE_1_RPM:
			return throttle * 3000;
		case ED_FM_ENGINE_1_RELATED_RPM:
			return throttle;
		case ED_FM_ENGINE_1_THRUST:
			return throttle * 5000 * 9.81;
		case ED_FM_ENGINE_1_RELATED_THRUST:
			return throttle;
		}
	}
	else if (index >= ED_FM_SUSPENSION_0_RELATIVE_BRAKE_MOMENT &&
			 index < ED_FM_OXYGEN_SUPPLY)
	{
		static const int block_size = ED_FM_SUSPENSION_1_RELATIVE_BRAKE_MOMENT - ED_FM_SUSPENSION_0_RELATIVE_BRAKE_MOMENT;
		switch (index)
		{
		case 0 * block_size + ED_FM_SUSPENSION_0_GEAR_POST_STATE:
		case 1 * block_size + ED_FM_SUSPENSION_0_GEAR_POST_STATE:
		case 2 * block_size + ED_FM_SUSPENSION_0_GEAR_POST_STATE:
			//return test_gear_state;
		}
	}
	return 0;

}

// These 3 functions called at beginning of every mission, used to initialize systems
void ed_fm_cold_start()
{
	MiG25::Gear.InitCold();
	MiG25::Fuel.InitCold();
}

void ed_fm_hot_start()
{
	MiG25::Gear.InitHot();
	MiG25::Fuel.InitHot();
}

void ed_fm_hot_start_in_air()
{
	MiG25::Gear.InitHot();
	MiG25::Fuel.InitHot();
}

bool ed_fm_make_balance(double& ax, double& ay, double& az, double& vx, double& vy, double& vz, double& omegadotx, double& omegadoty, double& omegadotz, double& omegax, double& omegay, double& omegaz, double& yaw, double& pitch, double& roll)
{

}

bool ed_fm_enable_debug_info()
{
#if _DEBUG
	return true;
#else
	return false;
#endif
}

ED_FM_TEMPLATE_API size_t ed_fm_debug_watch(int level, char* buffer, size_t maxlen)
{
	switch (level)
	{
	case 0: // ED_WATCH_BRIEF = 0

		break;
	case 1: // ED_WATCH_NORMAL = 1

		break;
	case 2: // ED_WATCH_FULL = 2

		break;
	}
	return sprintf_s(buffer, maxlen, "THIS IS A TEST");
}

void ed_fm_set_plugin_data_install_path(const char* path)
{

}

void ed_fm_on_panned_failure(const char* data)
{

}

void ed_fm_on_damage(int Element, double element_integrity_factor)
{

}

void ed_fm_repair()
{
	
}

bool ed_fm_need_to_be_repaired()
{

}

void ed_fm_set_immortal(bool value)
{

}

void ed_fm_unlimited_fuel(bool vlaue)
{

}

void ed_fm_set_easy_flight(bool value)
{

}

void ed_fm_set_property_numeric(const char* property_name, float value)
{

}

void ed_fm_set_property_string(const char* property_name, const char* value)
{

}

bool ed_fm_pop_simulation_event(ed_fm_simulation_event& out)
{

}

void ed_fm_suspension_feedback(int idx, const ed_fm_suspension_info* info)
{

}

