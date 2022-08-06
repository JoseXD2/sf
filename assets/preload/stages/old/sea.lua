function onCreate()

	makeLuaSprite('sea', 'sponge tears/sea', 0, -200);
	addLuaSprite('sea', false);

	makeAnimatedLuaSprite('splash','sponge tears/splash', 1200, 530)
	addAnimationByPrefix('splash','splash','splash',20,true)
	addLuaSprite('splash',true)
	objectPlayAnimation('splash','splash',false)

	makeAnimatedLuaSprite('sp','sponge tears/sp', -40, -40)
	setLuaSpriteScrollFactor('sp',0,0)
	addAnimationByPrefix('sp','sp','sp',20,true)
	addLuaSprite('sp',true)
	objectPlayAnimation('sp','sp',false)

	close(true)
end