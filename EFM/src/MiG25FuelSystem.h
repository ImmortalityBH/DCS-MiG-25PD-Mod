#pragma once
#include "MiG25System.h"

//fuel measured in Kg or liters
class FuelTank
{
public:
	FuelTank(double volume = 0, double fuel = 0)
		:
		volume(volume),
		fuel(fuel),
		x(0),
		y(0),
		z(0)
	{
	}
	FuelTank(const FuelTank&) = delete;
	FuelTank& operator=(const FuelTank&) = delete;
	~FuelTank() = default;

	// add what is possible, return remaining if full
	double AddFuel(const double addition)
	{
		double space = volume - fuel;
		if (space < addition)
		{
			fuel = volume; // set to max
			return (addition - space); // overflow
		}
		fuel += addition;
		return 0;
	}
	double DecreaseFuel(const double decrement)
	{
		if (fuel < decrement)
		{
			double tmp = decrement - fuel;
			fuel = 0; // set to min
			return tmp; //remaing
		}
		fuel -= decrement;
		return 0;
	}
	double GetVolume() const { return volume; }
	double GetFuel() const { return fuel; }
	double SetFuel(double fuel) { this->fuel = fuel; }
	double GetSpace() const { return (volume - fuel); }
	void SetX(const double x) { this->x = x; }
	void SetY(const double y) { this->y = y; }
	void SetZ(const double z) { this->z = z; }
	double GetX() const { return x; }
	double GetY() const { return y; }
	double GetZ() const { return z; }
private:
	double volume; //tank capacity
	double fuel; //amount remainging
	double x, y, z;
};

class FuelSystem : public System
{
public:
	FuelSystem()
		:
		is_unlimited_fuel(false),
		previous_usage(0),
		centerTank(7100),
		leftWingTank(3550),
		rightWingTank(3550),
		isIdleCutoff(false),
		isFuelFlow(false)
	{
	}
	~FuelSystem() = default;

	void InitCold() override
	{
		isIdleCutoff = true;
		isFuelFlow = false;
	}
	void InitHot() override
	{
		isIdleCutoff = false;
		isFuelFlow = true;
	}

	// is low fuel indication
	bool isLowFuel() const
	{
		// check remaining fuel
		if (this->GetInteralFuel() <= 1000)
		{
			return false;
		}
		return false;
	}

	void SetInternalFuel(const double fuel)
	{
		centerTank.SetFuel(0);
		leftWingTank.SetFuel(0);
		rightWingTank.SetFuel(0);
		this->RefuelAdd(fuel);
	}

	double GetInteralFuel() const
	{
		return (centerTank.GetFuel() + leftWingTank.GetFuel() + rightWingTank.GetFuel());
	}

	void SetIdleCutOff(const float value)
	{
		if (value == 1)
		{
			isIdleCutoff = true;
			return;
		}
		isIdleCutoff = false;
	}

	double GetUsageSinceLastFrame() const
	{
		return this->previous_usage;
	}

	void ClearUsageSinceLastFrame()
	{
		this->previous_usage = 0;
	}

	void UpdateFrame(const double rpm, const double frameTime)
	{
		if (this->IsUnlimitedFuel() == true)
		{
			isFuelFlow = true;
			return;
		}
							//fuel consumption rate L/s
		double fueltmp = rpm * 0.0816 * frameTime;
		previous_usage += fueltmp; // add to usage since last frame
		// TODO: transfer of fuel between tanks

		fueltmp = leftWingTank.DecreaseFuel(fueltmp);
		fueltmp = rightWingTank.DecreaseFuel(fueltmp);
		fueltmp = centerTank.DecreaseFuel(fueltmp);

		if (this->GetInteralFuel() > 0 && !isIdleCutoff)
		{
			isFuelFlow = true;
		}
		else
		{
			isFuelFlow = false;
		}
	}

	bool IsIdleCutOff() const { return this->isIdleCutoff; }
	void SetUnlimitedFuel(const bool value) { this->is_unlimited_fuel = value; }
	bool IsUnlimitedFuel() const { return this->is_unlimited_fuel; }

	void RefuelAdd(const double fuel) // in Kg
	{	// distribute fuel to each tank for weight balance
		double addition = fuel;
		addition = centerTank.AddFuel(addition);
		addition = leftWingTank.AddFuel(addition);
		addition = rightWingTank.AddFuel(addition);
	}
private:
	bool is_unlimited_fuel;
	double previous_usage;

	FuelTank centerTank;
	FuelTank leftWingTank;
	FuelTank rightWingTank;

	bool isIdleCutoff;
	bool isFuelFlow;
};




