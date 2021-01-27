#pragma once
#include "MiG25System.h"

class Airframe : public System
{
public:
	Airframe()
		:
		leftWingLamp(0),
		rightWingLamp(0),
		backTailLamp(0),
		navigationLights(false),
		landingLights(false),
		isImmortal(false)
	{
	}
	~Airframe() = default;

	void Init() override
	{
		for (unsigned int i = 0; i < 111; i++)
		{
			elementIntegrity[i] = 1.0;
		}
	}
	float GetNavigationLight() {
		return (navigationLights == true) ? 1.0f : 0.0f;
	}
	float GetLandingLight() {
		return (landingLights == true) ? 1.0f : 0.0f;
	}
	// Scripts\Aircrafts\_Common\Damage.lua for element numbers
	void OnAirframeDamage(const int Element, const double element_integrity_factor)
	{
		if (Element >= 0 && Element < 111)
		{
			elementIntegrity[Element] = element_integrity_factor;
		}

		if (isImmortal == false)
		{

		}
	}
	void OnRepair()
	{
		for (unsigned int i = 0; i < 111; i++)
		{
			elementIntegrity[i] = 1.0;
		}
	}
	bool IsRepairNeeded() const 
	{
		for (unsigned int i = 0; i < 111; i++)
		{
			if (elementIntegrity[i] < 1)
			{
				return true;
			}
		}
		return false;
	}
	bool IsImmortal() const { return isImmortal; }
	void SetImmortal(const bool value) { this->isImmortal = value; }
	void UpdateFrame(const double frameTime)
	{
	}
private:
	// left, right and back (tail)
	// 0=off, 1=on
	float leftWingLamp;
	float rightWingLamp;
	float backTailLamp;

	bool navigationLights;//left wingtip red, right wingtip green, tail white
	bool landingLights;

	// damage status of section in 0.01 increments
	double elementIntegrity[111];
	bool isImmortal; // <- ignore damage
};