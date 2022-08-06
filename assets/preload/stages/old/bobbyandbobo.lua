function onCreate()
	-- background shit
	makeLuaSprite('sky', 'stages/bobbyandbobo/sky', -300, -300);
	setScrollFactor('sky', 0.3, 0.3);
	scaleObject('sky', 1.5, 1.5);

	makeLuaSprite('airship', 'stages/bobbyandbobo/airship', -225, -280);
	scaleObject('airship', 1.5, 1.5);

	addLuaSprite('sky', false);
	addLuaSprite('airship', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end