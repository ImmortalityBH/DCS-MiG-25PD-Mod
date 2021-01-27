#pragma once
#include "MiG25System.h"
#include "../include/Cockpit/ccParametersAPI.h"

class Engine : public System
{
public:
	Engine()
	{

	}
	~Engine() = default;

	void InitCold() override;
	void InitHot() override;
	void SetThrottleInput(const double value);
	void SetStarterButton(const float value);
private:
	double throttleInput;

	double N1_RPM, N2_RPM;//left, right

	bool engineRunning;
	bool isStarterPressed;

	double oilPressure;

	double turbineTemperature;
	bool hotStart;
	bool engineFire;

	//EDPARAM cockpitAPI;
};

