function init()
	setDefaultCamZoom(0.9)
	-- Image lookups use your stage name, make sure this is set!
	setCurrentStage("stage")

	setGF("gf")
	setBF("bf")

	local bg = createFlxSprite("stageback", {-600, -200})
	setAntialiasing(bg, true)
	setScrollFactor(bg, 0.9, 0.9)
	setActive(bg, true)
	finish(bg)

	local stageFront = createFlxSprite("stagefront", {-650, 600})
	setGraphicSize(stageFront, math.ceil(getWidth(stageFront) * 1.1))
	updateHitbox(stageFront)
	setAntialiasing(stageFront, true)
	setScrollFactor(stageFront, 0.9, 0.9)
	setActive(stageFront, false)
	finish(stageFront)

	local stageCurtains = createFlxSprite("stagecurtains", {-500, -300})
	setGraphicSize(stageCurtains, math.ceil(getWidth(stageCurtains) * 0.9))
	updateHitbox(stageCurtains)
	setAntialiasing(stageCurtains, true)
	setScrollFactor(stageCurtains, 1.3, 1.3)
	setActive(stageCurtains, false)
	finish(stageCurtains)
end

function initFinal()
	setGFPos(400, 130)
	setDadPos(100, 100)
	
	setBFPos(770, 450)
end

function update(elapsed)
	
end

function stepHit(curStep, curBeat)

end

function beatHit(curStep, curBeat)
	
end