function create()
    imageID = createImage("menuBG", -80, 0)
    --setGraphicSize(math.ciel(getWidth(imageID) * 1.1))
    add(imageID);

    textID = createText("Hello World!", 5, 5, 12)
    add(textID)
end

function update(elapsed)

end