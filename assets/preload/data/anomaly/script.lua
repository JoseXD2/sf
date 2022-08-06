function onUpdate(elapsed)
	if dadName == 'glitchpants' then --replace the name for your character name
	  if curStep >= 0 then
  
		songPos = getSongPosition()
  
		local currentBeat = (songPos/1000)*(bpm/80)
  
		doTweenY(dadTweenY, 'dad', -100-110*math.sin((currentBeat*0.25)*math.pi),0.001)
  
	  end
	end
end

function onUpdate(elapsed)
	random = getRandomInt(1, 4, true)
	songPos = getSongPosition()
   local currentBeat = (songPos / 100)*(curBpm/300)
   noteTweenX(defaultPlayerStrumX0, 4, ((screenWidth / 2) - (157 / 2)) + (math.sin((currentBeat) + 0) * random2), 0.001)
   noteTweenX(defaultPlayerStrumX1, 5, ((screenWidth / 2) - (157 / 2)) + (math.sin((currentBeat) + 1) * random2), 0.001)
   noteTweenX(defaultPlayerStrumX2, 6, ((screenWidth / 2) - (157 / 2)) + (math.sin((currentBeat) + 2) * random2), 0.001)
   noteTweenX(defaultPlayerStrumX3, 7, ((screenWidth / 2) - (157 / 2)) + (math.sin((currentBeat) + 3) * random2), 0.001)
   noteTweenX(defaultPlayerStrumX0, 4, defaultPlayerStrumX0 - random2*math.sin((currentBeat+random2*random2)*math.pi), random2)
	  noteTweenX(defaultPlayerStrumX1, 5, defaultPlayerStrumX1 - random2 + random2*math.sin((currentBeat+random2*random2)*math.pi), random2)
	  noteTweenX(defaultPlayerStrumX2, 6, defaultPlayerStrumX2 - random2*math.sin((currentBeat+random2*random2)*math.pi), random2)
	  noteTweenX(defaultPlayerStrumX3, 7, defaultPlayerStrumX3 - random2 + random2*math.sin((currentBeat+random2*random2)*math.pi), random2)
	noteTweenX(defaultOpponentStrumX0, 0, defaultOpponentStrumX0 + random2*math.sin((currentBeat+random2*random2)*math.pi), random2)
	  noteTweenX(defaultOpponentStrumX1, 1, defaultOpponentStrumX1 + random2 - random2*math.sin((currentBeat+random2*random2)*math.pi), random2)
	  noteTweenX(defaultOpponentStrumX2, 2, defaultOpponentStrumX2 + random2*math.sin((currentBeat+random2*random2)*math.pi), random2)
	  noteTweenX(defaultOpponentStrumX3, 3, defaultOpponentStrumX3 + random2 - random2*math.sin((currentBeat+random2*random2)*math.pi), random2)
  end
  
  local waAngle = 360
  local speentime = 1
  function onBeatHit()
  random2 = getRandomInt(-360, 360, true) 
	  for i = 0, 7 do
	  noteTweenAngle(i, i, waAngle , speentime, 'cubeInOut')
	  waAngle = waAngle + random2
	  end
  end
  function onTweenCompleted(tag)
	  if tag == '1' then
		  for i = 0, 7 do
		  noteTweenAngle(i, i, waAngle , speentime, 'cubeInOut')
		  waAngle = waAngle + random2
		  end
	  end
  end
  
  function opponentNoteHit() --ur mom
	random2 = getRandomInt(-10, 10, true) 
	random3 = getRandomInt(-360, 360, true) 
	songPos = getSongPosition()
	local currentBeat = (songPos/random3)*(curBpm/random3)
	doTweenAngle('GUITTween','camHUD', random2, 0.01)
  end
  function onStartCountdown()
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if not getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'Note Sprites/NOTE_assets_'..dadName..''); --Change texture
			setPropertyFromGroup('unspawnNotes', i, 'antialiasing', false)
		end
	end
end
finishedGameover = false;
startedPlaying = false;

function onGameOver()
    soundFadeIn(nil, 4, 0.2, 0.2);
    math.randomseed(os.time());
    soundName = string.format('deathlines/GLITCHLINE%i', math.random(1, 3));
    playSound(soundName, 2, 'GlitchlineSND');
    startedPlaying = true;
	setPropertyFromClass('flixel.FlxG', 'music.volume', 0.2);
	return Function_Continue;
end

function onGameOverConfirm(reset)
	finishedGameover = true;
end

function onSoundFinished(tag)
	if tag == 'GlitchlineSND' and not finishedGameover then
		soundFadeIn(nil, 4, 0.2, 1);
	end
end
function onUpdate(elapsed)
	if dadName == 'glitchpants' then --replace the name for your character name
	  if curStep >= 0 then
  
		songPos = getSongPosition()
  
		local currentBeat = (songPos/1000)*(bpm/80)
  
		doTweenY(dadTweenY, 'dad', -100-110*math.sin((currentBeat*0.25)*math.pi),0.001)
  
	  end
	end
end
function onCreate() --COMPOSER NAME
	makeLuaText('watermark', songName .. " | Womo ", 0, -2, 550); -- You can edit the created by Prisma Text just dont change anything else
    setTextSize('watermark', 15);
	addLuaText('watermark');
end
function onUpdate(elapsed)
if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.SEVEN') then
setProperty ('inCutscene', true)  
       close() --i am going to make a crash note with this and you cant stop me
end
end