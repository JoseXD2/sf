function onCreate()
	-- background shit
	makeLuaSprite('scareyBG2', 'stages/SCARY!/scareyBG2', -600, -300);
	setScrollFactor('scareyBG2', 0.9, 0.9);

	addLuaSprite('scareyBG2', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end