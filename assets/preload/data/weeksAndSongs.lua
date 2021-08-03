function init()
	--[[
		Week args:

		Week ID: Internal week ID
		Week Text: The text that shows up in the top right of the story menu
		Week Characters: An array of characters to show on the story menu
	]] 
	addWeek(0, "Learn how to funk!", {"", "gf", "bf"});

	--[[
		Song args:

		Week ID: Internal week ID
		Song name: Name of the song in the files
		Song character: The character who's icon is shown in the freeplay menu
	]]
	addSong(0, "tutorial", "gf");
end