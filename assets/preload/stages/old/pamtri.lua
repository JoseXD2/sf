function onCreate()
	-- background shit
	makeLuaSprite('pamtris sky', 'pamtri/pamtris sky', -600, -300);
	setScrollFactor('pamtris sky', 0.7, 0.7);
	
	makeLuaSprite('pamtris sand', 'pamtri/pamtris sand', -650, -400);
	scaleObject('pamtris sand', 1.1, 1.1);

	-- sprites that only load if Low Quality is turned off
	if not lowQuality then
	end

	addLuaSprite('pamtris sky', false);
	addLuaSprite('pamtris sand', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end