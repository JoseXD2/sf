function onCreate()
	-- background shit
	makeLuaSprite('squid-wall', 'squid/squid-wall', -500, -700);
	setScrollFactor('squid-wall', 0.9, 0.9);
	
	makeLuaSprite('squid-ground', 'squid/squid-ground', -600, -900);
	setScrollFactor('squid-ground', 0.9, 0.9);
	scaleObject('squid-ground', 1.1, 1.1);

	makeLuaSprite('squid-couch', 'squid/squid-couch', 1700, 280);
	setScrollFactor('squid-couch', 0.9, 0.9);
	scaleObject('squid-couch', 0.6, 0.6);

	makeLuaSprite('squidbf-tv', 'squid/squidbf-tv', 2000, 470);
	setScrollFactor('squidbf-tv', 0.9, 0.9);
	scaleObject('squidbf-tv', 0.5, 0.5);

        makeLuaSprite('wall', 'squid/wall', -2400, -895);
	setScrollFactor('wall', 0.9, 0.9);
	scaleObject('wall', 1.1, 1.1);

        makeLuaSprite('fuck this door', 'squid/fuck this door', -1980, -370);
	setScrollFactor('fuck this door', 0.9, 0.9);
	scaleObject('fuck this door', 0.6, 0.6);

	makeLuaSprite('statue of squidbf', 'squid/statue of squidbf', 1760, 320);
	setScrollFactor('statue of squidbf', 0.9, 0.9);

	-- sprites that only load if Low Quality is turned off
	if not lowQuality then
		makeLuaSprite('picture 1', 'squid/picture 1', -125, -100);
		setScrollFactor('picture 1', 0.9, 0.9);

		makeLuaSprite('picture 2', 'squid/picture 2', 340, -100);
		setScrollFactor('picture 2', 0.9, 0.9);

		makeLuaSprite('picture 3', 'squid/picture 3', 340, 150);
		setScrollFactor('picture 3', 0.9, 0.9);

		makeLuaSprite('picture 4', 'squid/picture 4', -125, 150);
		setScrollFactor('picture 4', 0.9, 0.9);
	end

	addLuaSprite('squid-wall', false);
	addLuaSprite('squid-ground', false);
	addLuaSprite('statue of squidbf', false);
	addLuaSprite('squid-couch', false);
	addLuaSprite('squidbf-tv', false);
	addLuaSprite('picture 1', false);
	addLuaSprite('picture 2', false);
	addLuaSprite('picture 3', false);
	addLuaSprite('picture 4', false);
	addLuaSprite('wall', false);
	addLuaSprite('fuck this door', false);
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end