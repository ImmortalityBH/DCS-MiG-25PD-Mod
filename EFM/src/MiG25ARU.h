#pragma once
#include "MiG25System.h"

class ARU : public System
{
public:
	ARU();
	~ARU() = default;

	void InitCold() override;
	void InitHot() override;

	void ConfigureElevatorPosition(double& elevatorPosition_DEG, const double mach);
private:
	double ratio;
};
