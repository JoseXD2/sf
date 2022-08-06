function onCreate() --COMPOSER NAME
	makeLuaText('watermark', songName .. " | Bfbro ", 0, -2, 550); -- You can edit the created by Prisma Text just dont change anything else
    setTextSize('watermark', 15);
	addLuaText('watermark');
	--DEATH ANIMATION
	setPropertyFromClass('GameOverSubstate', 'characterName', 'drugbf'); --Character json file for the death animation
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'drug_loss_sfx'); --put in mods/sounds/
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'gameOver'); --put in mods/music/
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'gameOverEnd'); --put in mods/music/
end
finishedGameover = false;
startedPlaying = false;

function onGameOver()
    soundFadeIn(nil, 4, 0.2, 0.2);
    math.randomseed(os.time());
    soundName = string.format('DRUGLINE%i', math.random(1, 5));
    playSound(soundName, 2, 'DruglineSND');
    startedPlaying = true;
	setPropertyFromClass('flixel.FlxG', 'music.volume', 0.2);
	return Function_Continue;
end

function onGameOverConfirm(reset)
	finishedGameover = true;
end

function onSoundFinished(tag)
	if tag == 'DruglineSND' and not finishedGameover then
		soundFadeIn(nil, 4, 0.2, 1);
	end
end