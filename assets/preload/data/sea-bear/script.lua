local xx = 400;
local yy = 400;
local xx2 = 1000;
local yy2 = 500;
local ofs = 60;
local followchars = true;
local del = 0;
local del2 = 0;
function onUpdate()
	if del > 0 then
		del = del - 1
	end
	if del2 > 0 then
		del2 = del2 - 1
	end
    if followchars == true then
        if mustHitSection == false then
            if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
        else

            if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
            end
	    if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
        end
    else
        triggerEvent('Camera Follow Pos','','')
    end
    
end
function onCreate() --COMPOSER NAME
	makeLuaText('watermark', songName .. " | Polar ", 0, -2, 550); -- You can edit the created by Prisma Text just dont change anything else
    setTextSize('watermark', 15);
	addLuaText('watermark');
	--DEATH ANIMATION
	setPropertyFromClass('GameOverSubstate', 'characterName', 'bfpamtri'); --Character json file for the death animation
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'shot'); --put in mods/sounds/
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'pamtri'); --put in mods/music/
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'santiago'); --put in mods/music/
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