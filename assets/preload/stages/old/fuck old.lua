function onCreate()
	-- background shit
	makeLuaSprite('wggsbBG1', 'squid/wggsbBG1', -700, -368);
	scaleObject('wggsbBG1', 1.5, 1.5);

	makeLuaSprite('wggsbBGpaintings', 'squid/wggsbBGpaintings', -690, -368);
	scaleObject('wggsbBGpaintings', 1.5, 1.5);

	makeLuaSprite('wggsbBGprops', 'squid/wggsbBGprops', -800, -368);
	setScrollFactor('wggsbBGprops', 0.9, 0.9);
	scaleObject('wggsbBGprops', 1.5, 1.5);

	addLuaSprite('wggsbBG1', false);
	addLuaSprite('wggsbBGpaintings', false);
	addLuaSprite('wggsbBGprops', false);
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end