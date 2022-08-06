function onCreate()

	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Piss Note' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'piss note'); 
			setPropertyFromGroup('unspawnNotes', i, 'hitHealth', '-0');
			setPropertyFromGroup('unspawnNotes', i, 'missHealth', '0');
			setPropertyFromGroup('unspawnNotes', i, 'hitCausesMiss', true);

			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true);
			end
		end
	end

end

function goodNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'Piss Note' then

	end
end
function noteMiss(id, noteData, noteType, isSustainNote)
  if noteType == 'Piss Note' then
    cameraFlash("game", "f4ff1c", "0.9", false)
    setProperty('health', getProperty('health')-0.10);
	
	end
end