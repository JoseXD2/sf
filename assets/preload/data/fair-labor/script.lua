local canTaunt = false
local Taunting = false
local TauntTiming = 0.8
local TauntCooldown = 0.1
local introEnded = false

function onSongStart()
    canTaunt = true
end

function Taunt()
    Taunting = true
    canTaunt = false

    characterPlayAnim('nan pengyou', 'respect', true)
    setProperty('nan pengyou.specialAnim', true)
    playSound('gong')

    runTimer('Taunt', TauntTiming)
end

function onUpdate(elapsed)
    local currentBeat = getSongPosition() / crochet

    if curBeat >= 512 and curBeat < 640 then
        local danced = getProperty('gf.danced')
        local angle = math.abs(fastSin(currentBeat))

        if danced then
            setProperty('camHUD.angle', 4 * angle)
        else
            setProperty('camHUD.angle', -4 * angle)
        end

    elseif curBeat >= 704 and curBeat < 832 then
        for i = 0, 7 do
            setStrumX(_G['defaultStrumX' .. i] + 10 * fastSin(currentBeat + i / 4), i)
            noteTweenX('noteTween' .. i, i, _G['defaultStrumX' .. i], crochet / 1000, 'sineOut')
        end

        setProperty('defaultCamZoom', 0.775)
    elseif introEnded then
        setProperty('defaultCamZoom', 0.8125)

        if getProperty('camHUD.angle') ~= 0 then
            setProperty('camHUD.angle', 0)
        end
    end

    local SPACE = keyJustPressed('space')
    if SPACE and not Taunting and canTaunt and not botPlay then
        Taunt()
    end
end

function onTimerCompleted(tag)
    if tag == 'Taunt' then
        Taunting = false
        characterDance('nan pengyou')

        runTimer('TauntCooldown', TauntCooldown)
    elseif tag == 'TauntCooldown' then
        canTaunt = true
    elseif tag == 'checkTaunting' then
        if canTaunt and not Taunting and not botPlay then

        end
    end
end
local allowCountdown = false
function onStartCountdown()
	-- Block the first countdown and start a timer of 0.8 seconds to play the dialogue
	if not allowCountdown and isStoryMode and not seenCutscene then
		setProperty('inCutscene', true);
		runTimer('startDialogue', 0.8);
		allowCountdown = true;
		return Function_Stop;
	end
	return Function_Continue;
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'startDialogue' then -- Timer completed, play dialogue
		startDialogue('dialogue', 'breakfast');
	end
end

-- Dialogue (When a dialogue is finished, it calls startCountdown again)
function onNextDialogue(count)
	-- triggered when the next dialogue line starts, 'line' starts with 1
end

function onSkipDialogue(count)
	-- triggered when you press Enter and skip a dialogue line that was still being typed, dialogue line starts with 1
end
function noteMiss()
    health = getProperty('health')
    setProperty('health', health- 500);
end
function onCreate() --COMPOSER NAME
	makeLuaText('watermark', songName .. " | Womo ", 0, -2, 550); -- You can edit the created by Prisma Text just dont change anything else
    setTextSize('watermark', 15);
	addLuaText('watermark');
	setPropertyFromClass('GameOverSubstate', 'characterName', 'nan pengyou-lose'); --Character json file for the death animation
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'fnfchina_loss_sfx'); --put in mods/sounds/
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'gameOver'); --put in mods/music/
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'gameOverEnd'); --put in mods/music/
end