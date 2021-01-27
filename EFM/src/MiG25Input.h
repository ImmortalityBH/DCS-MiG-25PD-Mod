#pragma once

// Used in ::ed_fm_setcommand()
namespace MiG25
{
	enum InputCommands
	{
		// commands from "command_defs.lua"
		starterButton = 3000,
		throttleIdleCutoff = 3001,
		throttle = 3002,
		throttleAxis = 3006,
		trimUp = 3007,
		trimDown = 3008,
		trimLeft = 3009,
		trimRight = 3010,
		// jostick axis commands
		JoystickPitch = 2001,
		JoystickRoll = 2002,
		JoystickYaw = 2003,
		JoystickThrottle = 2004,

		Reserved //placeholder
	};
}