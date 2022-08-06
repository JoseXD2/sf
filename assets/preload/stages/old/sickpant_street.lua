function onCreate()
	-- background shit
	makeLuaSprite('FARBACK', 'sickpants/FARBACK', -410, -100);
	setScrollFactor('FARBACK', 0.9, 0.9);
	scaleObject('FARBACK', 1.7, 1.7);


	makeLuaSprite('Road', 'sickpants/Road', -540, 750);
	setScrollFactor('Road', 0.9, 0.9);
	scaleObject('Road', 1.9, 1.9);


	makeLuaSprite('Sand', 'sickpants/Sand', -470, 600);
	setScrollFactor('Sand', 0.9, 0.9);
	scaleObject('Sand', 1.5, 1.5);


	makeLuaSprite('Squidward-House', 'sickpants/Squidward-House', 460, -230);
	setScrollFactor('Squidward-House', 0.9, 0.9);
	scaleObject('Squidward-House', 1.5, 1.5);

	makeLuaSprite('Path', 'sickpants/Path', 460, 350);
	setScrollFactor('Path', 0.9, 0.9);
	scaleObject('Path', 1.5, 1.5);

	makeLuaSprite('Bus-Stop-sign', 'sickpants/Bus-Stop-sign', -390, 250);
	setScrollFactor('Bus-Stop-sign', 0.9, 0.9);
	scaleObject('Bus-Stop-sign', 1.5, 1.5);

        makeAnimatedLuaSprite('sickgf','sickpants/hotGF',-70,-30)addAnimationByPrefix('sickgf','bop','gfSHARKidle',24,true)
        objectPlayAnimation('sickgf','bop',false)
	scaleObject('sickgf', 1.9, 1.9);

	addLuaSprite('FARBACK', false);

	addLuaSprite('Sand', false);

	addLuaSprite('Path', false);

	addLuaSprite('Squidward-House', false);

	addLuaSprite('Bus-Stop-sign', false);

	addLuaSprite('Road', false);

	addLuaSprite('sickgf', false);

	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end