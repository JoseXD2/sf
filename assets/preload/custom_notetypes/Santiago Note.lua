local healthDrop = 0;
local FUCKYOU = 0;
function onCreate()
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Santiago Note' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'Santiago');
			setPropertyFromGroup('unspawnNotes', i, 'hitHealth', '0.023');
			setPropertyFromGroup('unspawnNotes', i, 'missHealth', '0.095');
			setPropertyFromGroup('unspawnNotes', i, 'hitCausesMiss', true);

			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true);
			end
		end
	end
end

function onUpdate()
    setProperty('health', getProperty('health') - healthDrop); 
end

function noteMiss(id, noteData, noteType, isSustainNote)
	if noteType == 'Santiago Note' then
		playSound('Santiago', 0.6);
		healthDrop = healthDrop + 0.001;
		if healthDrop == 0.001 then
			runTimer('BITCHLMAO', 0.001, 9000000);
		else 
			FUCKYOU = 0;
		end
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'finishebolabitchanim' then
		removeLuaSprite('ebolabitch')
	end
	
	if tag == 'BITCHLMAO' then
		FUCKYOU = FUCKYOU + 1;
		if FUCKYOU >= 9000000 then
			healthDrop = 0;
		end
	end
end