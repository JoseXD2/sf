function onUpdate()
--dad
    if curBeat > 204 then
    if mustHitSection == false then

        if getProperty('dad.animation.curAnim.name') == 'singUP' then
            	triggerEvent('Screen Shake','0.1,0.005','0.1,0.005')
        end
        if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
            	triggerEvent('Screen Shake','0.1,0.003','')
        end
        if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
            	triggerEvent('Screen Shake','0.1,0.003','0.1,0.005')
        end
        if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
            	triggerEvent('Screen Shake','0.1,0.003','')
        end
        else

            if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Screen Shake','0.1,0.003','0.1,0.005')
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Screen Shake','0.1,0.003','')
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
                triggerEvent('Screen Shake','0.1,0.005','0.1,0.005')
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Screen Shake','0.1,0.003','')
            end
            end
            end
        end
        --hi it's me cherry i made this cuz i was upset that i made an animation for a character that's equivalent to gf's "sad" animation
--and i realized it wasn't playing bc there's no code for the gf character to cry when a combo is broken 
--and i thought "wtf. i'm going to fix this no matter how frustrating the process is." so here's my efforts
--btw remove this text that proves *i* made this and i will come for your kneecaps -cherry
local hitInARow = 0

function goodNoteHit(id, direction, noteType, isSustainNote)
    if not isSustainNote then
        hitInARow = getProperty(hitInARow)+ 1
    end
end

function noteMiss(id, direction, noteType, isSustainNote)
    if hitInARow >= 10 then
        triggerEvent('Play Animation', 'sad', 'gf')
        hitInARow = 0
    end
end
function onCreate() --COMPOSER NAME
	makeLuaText('watermark', songName .. " | Hecc and Malk ", 0, -2, 550); -- You can edit the created by Prisma Text just dont change anything else
    setTextSize('watermark', 15);
	addLuaText('watermark');
	setPropertyFromClass('GameOverSubstate', 'characterName', 'childbf-dies'); --Character json file for the death animation
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'child_loss_sfx'); --put in mods/sounds/
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'childgameOver'); --put in mods/music/
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'gameOverEnd'); --put in mods/music/
end