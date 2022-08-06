                  --settings--
local healthdrain = true; --- everytime opponent hit notes your health get drained like boyfriend do to opponent [default: true]
-- more coming
              --settings Alternate--
local songBarr = true; --- a bar that will show what playing rn with bpm  [default: true]
local bopHead = false; --- chars bopping on the beat [default: false]   [credit to bbpanzu]
local hideP2Notes = false; --- hide the opponent notes [default: false]
local ExtraMinimalized = false; --- dat hud still annoying you? dont worry i got the better one [default: false]
local FullHud = false; --- show everything like sick,etc.. just set it to true.. you will see [default: false]    [credit to  Batata ? on discord]         

                 --randomness--
local funnybf = false; --- what the fuck is wrong with bf [default: false]               [credit to 4k_funny on youtube]



                --the thing lolollolololol--
-- form bbpanzu
local dadsingL = 4
local bfsingL = 4
realAnimdad = 'idle'
realAnimbf = 'idle'
function getAnim(char,prop)
prop = prop or 'name'
	return getProperty(char .. '.animation.curAnim.' .. prop)

end
----------------------
--form batata
notehitlol = 0
cmoffset = -4
cmy = 20
tnhx = -10
---------------------
function onCreate(elapsed)
 if FullHud then
    makeLuaText("tnh", 'Total Notes Hit: 0', 250, tnhx, 259);
    makeLuaText("cm", 'Combos: 0', 200, -getProperty('tnh.x') + cmoffset, getProperty('tnh.y') + cmy);
    makeLuaText("sick", 'Sicks!: 0', 200, getProperty('cm.x'), getProperty('cm.y') + 30);
    makeLuaText("good", 'Goods: 0', 200, getProperty('cm.x'), getProperty('sick.y') + 30);
    makeLuaText("bad", 'Bads: 0', 200, getProperty('cm.x'), getProperty('good.y') + 30);
    makeLuaText("shit", 'Shits: 0', 200, getProperty('cm.x'), getProperty('bad.y') + 30);
    makeLuaText("miss", 'Misses: 0', 200, getProperty('cm.x'), getProperty('shit.y') + 30);
	
	
    setObjectCamera("tnh", 'other');
    setTextSize('tnh', 20);
    addLuaText("tnh");
    setObjectCamera("cm", 'other');
    setTextSize('cm', 20);
    addLuaText("cm");
    setTextAlignment('cm', 'left')
    setObjectCamera("sick", 'other');
    setTextSize('sick', 20);
    addLuaText("sick");
    setTextAlignment('sick', 'left')
    setObjectCamera("good", 'other');
    setTextSize('good', 20);
    addLuaText("good");
    setTextAlignment('good', 'left')
    setObjectCamera("bad", 'other');
    setTextSize('bad', 20);
    addLuaText("bad");
    setTextAlignment('bad', 'left')
    setObjectCamera("shit", 'other');
    setTextSize('shit', 20);
    addLuaText("shit");
    setTextAlignment('shit', 'left')
    setObjectCamera("miss", 'other');
    setTextSize('miss', 20);
    setTextColor('miss', 'ff0000');
    addLuaText("miss");
    setTextAlignment('miss', 'left')
	end
end

woosh = -69420
function onCreatePost()

  if hideP2Notes then
  	for i = 0, getProperty('opponentStrums.length')-1 do
		setPropertyFromGroup('opponentStrums',i,'visible',false)
		setPropertyFromGroup('opponentStrums',i,'y', woosh)
		setPropertyFromGroup('opponentStrums',i,'x', woosh)
	end
end
  if ExtraMinimalized then
    setProperty('scoreTxt.alpha', 1*1)
   setProperty('healthBar.angle', 1*90)
    setProperty('healthBar.x', 1* 930)
   setProperty('healthBar.y', 1* 350)
    setProperty('iconP1.alpha', 1* 0)
   setProperty('iconP2.alpha', 1* 0)
    setTextSize('scoreTxt', 26)	
   setProperty('timeTxt.x',1 * 760)
end
if not FullHud then
 setProperty('timeBarBG.visible', false)
 setProperty('timeBar.visible', false)
   if downscroll then
  setProperty('scoreTxt.y', 1*690)
  setProperty('timeTxt.y', getProperty('iconP1.y')+ 5)
  setProperty('timeTxt.x', getProperty('scoreTxt.x')+ 440)
  end
   if not downscroll then
   setProperty('scoreTxt.y', 1*20)
  setProperty('timeTxt.y', getProperty('iconP1.y')+ 100)
   end
 end
end

-- form 4k_funny
accel_x = 0
accel_x2 = 0
bounce = 0
bf_flip = 1
pos_x = 800
--------------
	
function onUpdate(elapsed)
if songBarr then
   	setProperty('wtf.y', getProperty('wot.y') + 70)
    setProperty('wtf.x', getProperty('wot.x') + 20)
    setProperty('wtf2.y', getProperty('wot.y') + 10)
	setProperty('wtf2.x', getProperty('wot.x') + 10)
end
if FullHud then
    notehitloltosting = tostring(notehitlol)
    setTextString('cm', 'Combos: ' .. getProperty('combo'))
    setTextString('sick', 'Sick!: ' .. getProperty('sicks'))
    setTextString('good', 'Goods: ' .. getProperty('goods'))
    setTextString('bad', 'Bads: ' .. getProperty('bads'))
    setTextString('shit', 'Shits: ' .. getProperty('shits'))
    setTextString('miss', 'Misses: ' .. getProperty('songMisses'))
end
if funnybf then
  if keyPressed("left") then
		bounce = (1 - math.abs(accel_x)/5)
		bf_flip = 1
	elseif keyPressed("up") then
		bounce = bounce*0.8 + 0.25
	elseif keyPressed("down") then
		bounce = bounce*0.7 + 0.25
	elseif keyPressed("right") then
		bounce = (1 - math.abs(accel_x)/5)
		bf_flip = -1
	else
		accel_x2 = accel_x2 + (1 - bounce)/5
		bounce = (bounce*0.8 + 0.2) + accel_x2
	end
 
	if keyPressed("left") then
		accel_x = accel_x*0.75 - 1*0.25
	elseif keyPressed("right") then
		accel_x = accel_x*0.75 + 1*0.25
	else
		accel_x = (accel_x)*0.8
	end
 
	pos_x = pos_x + accel_x*6
	setProperty('boyfriend.x', pos_x - 1/bounce * 150)
    setProperty('boyfriend.y', 100 + 1/bounce * 350)
	scaleObject('boyfriend', bf_flip/bounce, bounce)
end
    if curStep == 5 and songBarr then 
	doTweenX('wota', 'wot', -500 , 0.8, 'quadInOut')
    elseif curStep == 25 and ExtraMinimalized then
	doTweenAlpha('youz', 'youe',0, 2, 'linear')
	doTweenAlpha('youx', 'youv',0, 2, 'linear')
    end

   if getProperty('health') > 1.6 then
     setTextColor('scoreTxt', '00DB45')
  elseif getProperty('health') < 0.4 then
     setTextColor('scoreTxt', 'FF0000')
  else
     setTextColor('scoreTxt', 'FFFFFF')
   end
end


function onBeatHit()
  if bopHead then
		if getAnim("dad") == "idle"..getProperty('dad.idleSuffix') then
			characterPlayAnim("dad","idle"..getProperty('dad.idleSuffix'),true)
		end
		if getAnim("boyfriend") == "idle"..getProperty('boyfriend.idleSuffix') then
			characterPlayAnim("boyfriend","idle"..getProperty('boyfriend.idleSuffix'),true)
		end


	end
	if getProperty('curBeat') % 1 == 0 then
	        setProperty('timeTxt.angle',1*-5)
			doTweenAngle('ho','timeTxt', 0, 0.5, 'sineInOut')
		if getProperty('health') > 1.6 then
			setProperty('iconP1.angle',1*10)
			setProperty('iconP2.angle',1*0)
			doTweenAngle('re', 'iconP1', 0, 0.5, 'sineInOut')
		elseif getProperty('health') < 0.4 then
		    setProperty('iconP1.angle',1*0)
			setProperty('iconP2.angle',1*10)
			doTweenAngle('ree', 'iconP2', 0, 0.5, 'sineInOut')
		else
			setProperty('iconP1.angle',1*10)
			setProperty('iconP2.angle',1*-10)
			doTweenAngle('re', 'iconP1', 0, 0.5, 'sineInOut')
			doTweenAngle('ree', 'iconP2', 0, 0.5, 'sineInOut')
	    end
	end

	if getProperty('curBeat') % 2 == 0 then
	        setProperty('timeTxt.angle',1*5)
			doTweenAngle('ho','timeTxt', 0, 0.5, 'linear')
	    if getProperty('health') > 1.6 then
			setProperty('iconP1.angle',1*-15)
			setProperty('iconP2.angle',1*0)
			doTweenAngle('re', 'iconP1', 0, 0.5, 'linear')
		elseif getProperty('health') < 0.4 then
		    setProperty('iconP1.angle',1*0)
			setProperty('iconP2.angle',1*-15)
			doTweenAngle('ree', 'iconP2', 0, 0.5, 'linear')
		else
			setProperty('iconP1.angle',1*-15)
			setProperty('iconP2.angle',1*15)
			doTweenAngle('re', 'iconP1', 0, 0.5, 'linear')
			doTweenAngle('ree', 'iconP2', 0, 0.5, 'linear')
		end
   end
end

function goodNoteHit(id, direction, noteType, isSustainNote)
      if not isSustainNote then    
         notehitlol = notehitlol + 1;
         setTextString('tnh', 'Total Notes Hit: ' .. tostring(notehitlol))
     end -- NOTE I DID NOT MAKE THIS FRANTASTIC24 MADE THIS! [real]

end
function onUpdate(elapsed)
if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.EIGHT') then
setProperty ('inCutscene', true)  
playSound('bruh', 1);
makeLuaSprite('bruh', 'bruh', -470, -350);
addLuaSprite('bruh', false);
scaleObject('bruh', 3.3, 2.6);
setScrollFactor('bruh', 0, 0);
end
end
function onUpdate(elapsed)
if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.SEVEN') then
setProperty ('inCutscene', true)  
playSound('bruh', 1);
makeLuaSprite('bruh', 'bruh', -470, -350);
addLuaSprite('bruh', false);
scaleObject('bruh', 3.3, 2.6);
setScrollFactor('bruh', 0, 0);
loadSong('anomaly','hard')
end
end
function onCreatePost()
	if botPlay then
	setProperty('scoreTxt.visible', false)
	end
end
function onCountdownTick(counter)
    if counter == 3 then
        characterPlayAnim('boyfriend', 'hey', true)
        characterPlayAnim('gf', 'cheer', true)
    end
end
function onCreate()
	makeLuaSprite('uglyHB', 'MobileHaters-healthbar', 0, 0)
	setObjectCamera('uglyHB', 'hud')
	setScrollFactor('uglyHB', 0.9, 0.9)
	
	addLuaSprite('uglyHB', true)
end

function onCreatePost()
	--Fucker's Healthbar
    setProperty('uglyHB.alpha',  getPropertyFromClass('ClientPrefs', 'healthBarAlpha'))

    setProperty('uglyHB.x', getProperty('healthBar.x') - 20)

    setProperty('uglyHB.angle', getProperty('healthBar.angle'))
    setProperty('uglyHB.y', getProperty('healthBar.y') - 20)
    setProperty('uglyHB.scale.x', getProperty('healthBar.scale.x'))
    setProperty('uglyHB.scale.y', getProperty('healthBar.scale.y'))
    setObjectOrder('uglyHB', 4)
	setObjectOrder('healthBar', 3)
	setObjectOrder('healthBarBG', 2)
end

----Never Gonna Give You Up
currentDifficulty = 'its still fucked';

function onCreate()
    makeLuaText('songText', songName .. " " .. currentDifficulty .. " - Parodie Engine 0.5.2", 0, 2, 701);
    setTextAlignment('songText', 'left');
    setTextSize('songText', 15);
    setTextBorder('songText', 1, '000000');
    addLuaText('songText');
end

function onCreatePost()
    setProperty('timeBar.y', getProperty('timeBar.y') - 10);
    setProperty('timeTxt.y', getProperty('timeTxt.y') - 10);
end

function onUpdate(elapsed)
    currentDifficulty = getProperty('storyDifficultyText');
    setTextString('songText', songName .. " " .. currentDifficulty .. " - Parodie Engine 0.5.2");
end
--Script by Thats-Unusual
function noteMiss(id, direction, noteType, isSustainNote)
        if noteType == ''
	then playSound('dolphin miss', 0.9) --('dolphin miss', volume)   --MAKE SURE THE SOUND IS IN MODS (SOUNDS FOLDER)
        end
end
--easy script configs
IntroTextSize = 20	--Size of the text for the Now Playing thing.
IntroSubTextSize = 25 --size of the text for the Song Name.
IntroTagColor = 'FFF463'	--Color of the tag at the end of the box.
IntroTagWidth = 18	--Width of the box's tag thingy.
--easy script configs

--actual script
function onCreate()
	--the tag at the end of the box
	makeLuaSprite('JukeBoxTag', 'empty', -305-IntroTagWidth, 15)
	makeGraphic('JukeBoxTag', 300+IntroTagWidth, 100, IntroTagColor)
	setObjectCamera('JukeBoxTag', 'other')
	addLuaSprite('JukeBoxTag', true)

	--the box
	makeLuaSprite('JukeBox', 'empty', -305-IntroTagWidth, 15)
	makeGraphic('JukeBox', 300, 100, '000000')
	setObjectCamera('JukeBox', 'other')
	addLuaSprite('JukeBox', true)
	
	--the text for the "Now Playing" bit
	makeLuaText('JukeBoxText', 'Now Playing:', 300, -305-IntroTagWidth, 30)
	setTextAlignment('JukeBoxText', 'left')
	setObjectCamera('JukeBoxText', 'other')
	setTextSize('JukeBoxText', IntroTextSize)
	addLuaText('JukeBoxText')
	
	--text for the song name
	makeLuaText('JukeBoxSubText', songName, 300, -305-IntroTagWidth, 60)
	setTextAlignment('JukeBoxSubText', 'left')
	setObjectCamera('JukeBoxSubText', 'other')
	setTextSize('JukeBoxSubText', IntroSubTextSize)
	addLuaText('JukeBoxSubText')
end

--motion functions
function onSongStart()
	-- Inst and Vocals start playing, songPosition = 0
	doTweenX('MoveInOne', 'JukeBoxTag', 0, 1, 'CircInOut')
	doTweenX('MoveInTwo', 'JukeBox', 0, 1, 'CircInOut')
	doTweenX('MoveInThree', 'JukeBoxText', 0, 1, 'CircInOut')
	doTweenX('MoveInFour', 'JukeBoxSubText', 0, 1, 'CircInOut')
	
	runTimer('JukeBoxWait', 3, 1)
end

function onTimerCompleted(tag, loops, loopsLeft)
	-- A loop from a timer you called has been completed, value "tag" is it's tag
	-- loops = how many loops it will have done when it ends completely
	-- loopsLeft = how many are remaining
	if tag == 'JukeBoxWait' then
		doTweenX('MoveOutOne', 'JukeBoxTag', -450, 1.5, 'CircInOut')
		doTweenX('MoveOutTwo', 'JukeBox', -450, 1.5, 'CircInOut')
		doTweenX('MoveOutThree', 'JukeBoxText', -450, 1.5, 'CircInOut')
		doTweenX('MoveOutFour', 'JukeBoxSubText', -450, 1.5, 'CircInOut')
	end
end