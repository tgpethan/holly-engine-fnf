function init()
	-- BF
	local bf = createCharacter("bf")
	addByPrefix(bf, 'idle', 'BF idle dance', 24, false)
	addByPrefix(bf, 'singUP', 'BF NOTE UP0', 24, false)
	addByPrefix(bf, 'singLEFT', 'BF NOTE LEFT0', 24, false)
	addByPrefix(bf, 'singRIGHT', 'BF NOTE RIGHT0', 24, false)
	addByPrefix(bf, 'singDOWN', 'BF NOTE DOWN0', 24, false)
	addByPrefix(bf, 'singUPmiss', 'BF NOTE UP MISS', 24, false)
	addByPrefix(bf, 'singLEFTmiss', 'BF NOTE LEFT MISS', 24, false)
	addByPrefix(bf, 'singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false)
	addByPrefix(bf, 'singDOWNmiss', 'BF NOTE DOWN MISS', 24, false)
	addByPrefix(bf, 'hey', 'BF HEY', 24, false)

	addByPrefix(bf, 'firstDeath', "BF dies", 24, false)
	addByPrefix(bf, 'deathLoop', "BF Dead Loop", 24, true)
	addByPrefix(bf, 'deathConfirm', "BF Dead confirm", 24, false)

	addByPrefix(bf, 'scared', 'BF idle shaking', 24)

	addOffset(bf, 'idle', -5, 0)
	addOffset(bf, "singUP", -29, 27)
	addOffset(bf, "singRIGHT", -38, -7)
	addOffset(bf, "singLEFT", 12, -6)
	addOffset(bf, "singDOWN", -10, -50)
	addOffset(bf, "singUPmiss", -29, 27)
	addOffset(bf, "singRIGHTmiss", -30, 21)
	addOffset(bf, "singLEFTmiss", 12, 24)
	addOffset(bf, "singDOWNmiss", -11, -19)
	addOffset(bf, "hey", 7, 4)
	addOffset(bf, 'firstDeath', 37, 11)
	addOffset(bf, 'deathLoop', 37, 5)
	addOffset(bf, 'deathConfirm', 37, 69)
	addOffset(bf, 'scared', -4, 0)
	print("offsets finished")

	-- GF
	print("yo gf")
	local gf = createCharacter("gf")
	print("we good")
	addByPrefix(gf, 'cheer', 'GF Cheer', 24, false);
	addByPrefix(gf, 'singLEFT', 'GF left note', 24, false);
	addByPrefix(gf, 'singRIGHT', 'GF Right Note', 24, false);
	addByPrefix(gf, 'singUP', 'GF Up Note', 24, false);
	addByPrefix(gf, 'singDOWN', 'GF Down Note', 24, false);
	print("doing indices")
	addByIndices(gf, 'sad', 'gf sad', {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12}, "", 24, false);
	--[[addByIndices(gf, 'danceLeft', 'GF Dancing Beat', {30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14}, "", 24, false);
	addByIndices(gf, 'danceRight', 'GF Dancing Beat', {15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29}, "", 24, false);
	addByIndices(gf, 'hairBlow', "GF Dancing Beat Hair blowing", {0, 1, 2, 3}, "", 24);
	addByIndices(gf, 'hairFall', "GF Dancing Beat Hair Landing", {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11}, "", 24, false);]]
	print("indec done")
	addByPrefix(gf, 'scared', 'GF FEAR', 24);

	addOffset(gf, 'cheer', 0, 0);
	addOffset(gf, 'sad', -2, -2);
	addOffset(gf, 'danceLeft', 0, -9);
	addOffset(gf, 'danceRight', 0, -9);

	addOffset(gf, "singUP", 0, 4);
	addOffset(gf, "singRIGHT", 0, -20);
	addOffset(gf, "singLEFT", 0, -19);
	addOffset(gf, "singDOWN", 0, -20);
	addOffset(gf, 'hairBlow', 45, -8);
	addOffset(gf, 'hairFall', 0, -9);

	addOffset(gf, 'scared', -2, -17);
end