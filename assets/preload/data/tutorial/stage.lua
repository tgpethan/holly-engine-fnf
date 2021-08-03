function init()
    --defaultCamZoom = 0.9
    setCurrentStage("stage");

    --print("ello there")

    createFlxSprite("stageback", {-600, -200})
    --bg.setAntialiasing(true)
    --bg.setScrollFactor(0.9, 0.9)
    --bg.setActive(true)
    --bg.finish()

    --local stageFront = createFlxSprite("stagefront", {-650, 600})
    --stageFront.setGraphicSize(math.ceil(stageFront.getWidth() * 1.1))
    --stageFront.updateHitbox()
    --stageFront.setAntialiasing(true)
    --stageFront.setScrollFactor(0.9, 0.9)
    --stageFront.setActive(false)
    --stageFront.finish()

    --local stageCurtains = createFlxSprite("stagecurtains", {-500, -300})
    --stageCurtains.setGraphicSize(math.ceil(stageCurtains.getWidth() * 0.9))
    --stageCurtains.updateHitbox()
    --stageCurtains.setAntialiasing(true)
    --stageCurtains.setScrollFactor(1.3, 1.3)
    --stageCurtains.setActive(false)
    --stageCurtains.finish()
    --print("done")
end