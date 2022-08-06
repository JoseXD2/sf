function onCreate()
	-- background shit
	makeLuaSprite('Walls', 'stages/spongequan/Walls', -600, -150);
	setScrollFactor('stageback', 0.9, 0.9);
	
	makeLuaSprite('Floor', 'stages/spongequan/Floor', -600, -150);
	setScrollFactor('stagefront', 0.9, 0.9);
	scaleObject('stagefront', 1.1, 1.1);

	makeLuaSprite('Misc', 'stages/spongequan/Misc', -600, -150);
	setScrollFactor('stagefront', 0.9, 0.9);
	scaleObject('stagefront', 1.1, 1.1);

	addLuaSprite('Walls', false);
	addLuaSprite('Floor', false);
	addLuaSprite('Misc', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end