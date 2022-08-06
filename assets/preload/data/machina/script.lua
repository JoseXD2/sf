function onCreate() --COMPOSER NAME
	makeLuaText('watermark', songName .. " | Womo ", 0, -2, 550); -- You can edit the created by Prisma Text just dont change anything else
    setTextSize('watermark', 15);
	addLuaText('watermark');
	--DEATH ANIMATION
	setPropertyFromClass('GameOverSubstate', 'characterName', 'bf-robotchicken'); --Character json file for the death animation
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'bf-robot_loss_sfx'); --put in mods/sounds/
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'gameOver'); --put in mods/music/
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'gameOverEnd'); --put in mods/music/
end
finishedGameover = false;
startedPlaying = false;

function onGameOver()
    soundFadeIn(nil, 4, 0.2, 0.2);
    math.randomseed(os.time());
    soundName = string.format('ROBOTLINE%i', math.random(1, 5));
    playSound(soundName, 2, 'RobotlineSND');
    startedPlaying = true;
	setPropertyFromClass('flixel.FlxG', 'music.volume', 0.2);
	return Function_Continue;
end

function onGameOverConfirm(reset)
	finishedGameover = true;
end

function onSoundFinished(tag)
	if tag == 'RobotlineSND' and not finishedGameover then
		soundFadeIn(nil, 4, 0.2, 1);
	end
end
function onEndSong()
	if not allowEnd and isStoryMode then
		startVideo('robotchickendcutscene');
		allowEnd = true;
		return Function_Stop;
	end
	return Function_Continue;
end