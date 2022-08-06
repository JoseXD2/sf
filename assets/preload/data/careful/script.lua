local angleshit = 1;
local anglevar = 1;
local alphaisfucked = true; --made this since for some fucking reason pb kept appearing when they weren't supposed too xD

function onBeatHit()
    if curBeat > 32 then
        if curBeat % 4 == 0 then
            angleshit = anglevar;
        else
            angleshit = -anglevar;
        end
setPropertyFromClass('ClientPrefs', 'upScroll', true)
setPropertyFromClass('ClientPrefs', 'middleScroll', false)
        setProperty('camHUD.angle',angleshit*3)
        setProperty('camGame.angle',angleshit*3)
        doTweenAngle('turn', 'camHUD', angleshit, stepCrochet*0.002, 'circOut')
        doTweenX('tuin', 'camHUD', -angleshit*8, crochet*0.001, 'linear')
        doTweenAngle('tt', 'camGame', angleshit, stepCrochet*0.002, 'circOut')
        doTweenX('ttrn', 'camGame', -angleshit*8, crochet*0.001, 'linear')
    end
end

function opponentNoteHit()
    if mustHitSection == false then
        health = getProperty('health')
        if getProperty('health') > 0.1 then
            setProperty('health', health- 0.02);
        end
    end
end
function onCreate() --COMPOSER NAME
	makeLuaText('watermark', songName .. " | Spurk ", 0, -2, 550); -- You can edit the created by Prisma Text just dont change anything else
    setTextSize('watermark', 15);
	addLuaText('watermark');
	--DEATH ANIMATION
	setPropertyFromClass('GameOverSubstate', 'characterName', 'ded'); --Character json file for the death animation
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'woosh'); --put in mods/sounds/
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'nothing'); --put in mods/music/
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'laugh'); --put in mods/music/
end

local allowCountdown = false --VIDEO CUTSCENE
function onStartCountdown()
	if not allowCountdown and isStoryMode and not seenCutscene then --Block the first countdown
		setProperty('inCutscene', true);
		startVideo('squidcutscene');
		allowCountdown = true;
		return Function_Stop;
	end
	return Function_Continue;
end
function opponentNoteHit()

triggerEvent('Screen Shake','1,0.006')

end
function onCreate()

   	makeLuaSprite('HVWinning','HealthVignettes/HVWinning', 0, 0)
	setGraphicSize('HVWinning',1280,720)
	setObjectCamera('HVWinning','camHud')
	updateHitbox('HVWinning')
	setBlendMode('HVWinning','multiply')
	addLuaSprite('HVWinning', true);
	
end

function onUpdatePost()

	if flashingLights then
		setProperty('HVWinning.alpha',getProperty('health')/1.5)
	end

end
