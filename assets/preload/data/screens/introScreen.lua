function create()
	-- Enable cam follow
	enableCamFollow(0.06)

	imageID = createImage("menuBG", -80, 0)
	setGraphicSize(math.floor(getWidth() * 1.1))
	add(imageID);

	textID = createText("Hello World!", 5, 5, 12)
	add(textID)

	luaAlphabet = createAlphabet(0, 50, "swagshit", true, false)
	add(luaAlphabet)

	luaAlphabet1 = createAlphabet(0, 120, "all the time", true, false)
	add(luaAlphabet1)

	playMusic("freakyMenu", 0)
	fadeInMusic(4, 0, 0.7)

	changeBPM(102)
end

function update(elapsed)
	
end

function stepHit()
	print("step")
end

function beatHit()
	print("beat")
end