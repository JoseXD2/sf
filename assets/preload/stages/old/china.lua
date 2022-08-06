function onCreate()
	-- background shit
	makeLuaSprite('CHINA_SPONGE_BG2', 'china/CHINA_SPONGE_BG2', -310, -30);
	setScrollFactor('CHINA_SPONGE_BG2', 0.9, 0.9);
	scaleObject('CHINA_SPONGE_BG2', 0.8, 0.8);

	addLuaSprite('CHINA_SPONGE_BG2', false);
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end