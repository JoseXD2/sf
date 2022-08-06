local anims = {'LEFT', 'DOWN', 'UP', 'RIGHT'}
function onUpdate(elapsed)
    for i = 0,3 do
        setPropertyFromGroup('strumLineNotes', i, 'x', -1000)
    end
end
function onStartCountdown()
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if not getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'Note Sprites/NOTE_assets_'..BFName..''); --Change texture
			setPropertyFromGroup('unspawnNotes', i, 'antialiasing', false)
		end
	end
end
function onCreate() --COMPOSER NAME
	makeLuaText('watermark', songName .. " | Womo ", 0, -2, 550); -- You can edit the created by Prisma Text just dont change anything else
    setTextSize('watermark', 15);
	addLuaText('watermark');
end
local allowCountdown = false --VIDEO CUTSCENE
function onStartCountdown()
	if not allowCountdown and isStoryMode and not seenCutscene then --Block the first countdown
		setProperty('inCutscene', true);
		startVideo('squid2cutscene');
		allowCountdown = true;
		return Function_Stop;
	end
	return Function_Continue;
end