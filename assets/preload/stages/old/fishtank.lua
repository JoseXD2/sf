function onCreate()
	-- background shit
	makeLuaSprite('bgsquarebob', 'squarebob/bgsquarebob', -1111, -650);
	scaleObject('bgsquarebob', 1.7, 1.7);

	addLuaSprite('bgsquarebob', false)
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end