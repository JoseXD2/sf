function onCreate()
	-- background shit
	makeLuaSprite('jellyfish fields', 'stages/your boy sponge/jellyfish fields', -350, 100);
	setScrollFactor('jellyfish fields', 0.9, 0.9);
	scaleObject('jellyfish fields', 1.1, 1.1);

	addLuaSprite('jellyfish fields', false);

	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end