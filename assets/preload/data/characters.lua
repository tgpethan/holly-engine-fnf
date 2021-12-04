function init()
	-- BF
	local bf = createCharacter("bf")
	setActiveCharacter(bf)
	
	addByPrefix('idle', 'BF idle dance', 24, false)
	addByPrefix('singUP', 'BF NOTE UP0', 24, false)
	addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false)
	addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false)
	addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false)
	addByPrefix('singUPmiss', 'BF NOTE UP MISS', 24, false)
	addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS', 24, false)
	addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false)
	addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS', 24, false)
	addByPrefix('hey', 'BF HEY', 24, false)

	addByPrefix('firstDeath', "BF dies", 24, false)
	addByPrefix('deathLoop', "BF Dead Loop", 24, true)
	addByPrefix('deathConfirm', "BF Dead confirm", 24, false)

	addByPrefix('scared', 'BF idle shaking', 24)

	addOffset('idle', -5, 0)
	addOffset("singUP", -29, 27)
	addOffset("singRIGHT", -38, -7)
	addOffset("singLEFT", 12, -6)
	addOffset("singDOWN", -10, -50)
	addOffset("singUPmiss", -29, 27)
	addOffset("singRIGHTmiss", -30, 21)
	addOffset("singLEFTmiss", 12, 24)
	addOffset("singDOWNmiss", -11, -19)
	addOffset("hey", 7, 4)
	addOffset('firstDeath', 37, 11)
	addOffset('deathLoop', 37, 5)
	addOffset('deathConfirm', 37, 69)
	addOffset('scared', -4, 0)

	setDefaultAnimation("idle")

	setFlipX(true);

	-- GF
	local gf = createCharacter("gf")
	setActiveCharacter(gf)

	addByPrefix('cheer', 'GF Cheer', 24, false)
	addByPrefix('singLEFT', 'GF left note', 24, false)
	addByPrefix('singRIGHT', 'GF Right Note', 24, false)
	addByPrefix('singUP', 'GF Up Note', 24, false)
	addByPrefix('singDOWN', 'GF Down Note', 24, false)
	addByIndices('sad', 'gf sad', "0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12", {"", 24, false})
	addByIndices('danceLeft', 'GF Dancing Beat', "30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14", {"", 24, false})
	addByIndices('danceRight', 'GF Dancing Beat', "15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29", {"", 24, false})
	addByIndices('hairBlow', "GF Dancing Beat Hair blowing", "0, 1, 2, 3", {"", 24})
	addByIndices('hairFall', "GF Dancing Beat Hair Landing", "0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11", {"", 24, false})
	addByPrefix('scared', 'GF FEAR', 24)

	addOffset('cheer', 0, 0)
	addOffset('sad', -2, -2)
	addOffset('danceLeft', 0, -9)
	addOffset('danceRight', 0, -9)

	addOffset("singUP", 0, 4)
	addOffset("singRIGHT", 0, -20)
	addOffset("singLEFT", 0, -19)
	addOffset("singDOWN", 0, -20)
	addOffset('hairBlow', 45, -8)
	addOffset('hairFall', 0, -9)

	addOffset('scared', -2, -17)

	setDefaultAnimation("danceRight")
end