
local count = 0
local function counter()
	count = count + 1
	return count
end

SOUND_NOSOUND = -1
TOGGLE_CLICK = counter()
PUSHPRESS = counter()
PUSHRELEASE = counter()
