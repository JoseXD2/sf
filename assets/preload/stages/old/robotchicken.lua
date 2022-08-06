function onCreate()
	-- background shit
	makeLuaSprite('restaurantbg', 'robot chicken/restaurantbg', -740, -300);
	scaleObject('restaurantbg', 1.2, 1.2);

	makeLuaSprite('adult swim logo', 'robot chicken/adult swim logo', 1000, 580);
	setLuaSpriteScrollFactor('adult swim logo', 0, 0)

	addLuaSprite('restaurantbg', false);
	addLuaSprite('adult swim logo', true);

        setObjectCamera("adult swim logo", "hud")
        setObjectCamera("adult swim logo", "hud")

	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end