#pragma once
#include "MiG25System.h"

class LandingGear : public System
{
public:
	enum class GEAR_STATE
	{
		STATE_RETRACTED = 0,
		STATE_DOWN,
	};
public:
	LandingGear()
		: state(LandingGear::GEAR_STATE::STATE_DOWN)
	{
	}
	~LandingGear() = default;

	void InitCold() override
	{
		this->state = LandingGear::GEAR_STATE::STATE_DOWN;
	}

	void InitHot() override
	{
		this->state = LandingGear::GEAR_STATE::STATE_RETRACTED;
	}

	void SetState(LandingGear::GEAR_STATE state)
	{
		this->state = state;
	}

	const GEAR_STATE LandingGear::GetState() const
	{
		return this->state;
	}

	void UpdateFrame(const double frametime)
	{

	}
private:
	GEAR_STATE state;
};
