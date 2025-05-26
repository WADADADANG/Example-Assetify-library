


--[[
    client side

    sound.play()
    https://github.com/ov-sa/Assetify.library/wiki/API:-Sound#assetifysoundplay---client


    example path folder
    -----------------------------------------------------
    pathfile: assetify_library\files\assets\sound\assetName_example\sound\bear-191995.mp3
    pathfile: assetify_library\files\assets\sound\assetName_example\sound\beast-snarling-82801.mp3
    -----------------------------------------------------

    example asset.vcl
    -----------------------------------------------------
    encryptKey: "XqtcfmbZ9oZU8Ton"
    encryptMode: "aes128"
    assetSounds:
        animals:
            -: "bear-191995.mp3"
            -: "beast-snarling-82801.mp3"
    -----------------------------------------------------
]]--


local play = {
    assetName = "effects",
    soundCategory = "animals",
    soundIndex = 1,
    soundVolume = 100,
    isScoped = true,
    isLooped = false
}

local cSound = assetify.sound.play( play.assetName, play.soundCategory, play.soundIndex, play.soundVolume, play.isScoped, play.isLooped )


--[[
    shared side

    getAssetDep()
    https://github.com/ov-sa/Assetify.library/wiki/API:-Sound#assetifysoundplay---client

    example path folder
    -----------------------------------------------------
    pathfile: assetify_library\files\assets\module\assetName_example\dep\WADADADANG.png
    -----------------------------------------------------

    example asset.vcl
    -----------------------------------------------------
    encryptKey: "XqtcfmbZ9oZU8Ton"
    encryptMode: "aes128"

    assetDeps:
        logo:
            -: "WADADADANG.png"
    -----------------------------------------------------
]]--


local DepImage = {}
DepImage.assetName = "module"
DepImage.assetType = "image"
DepImage.depType = "logo"
DepImage.depIndex = 1
DepImage.depSubIndex = false -- Optional 

local cDep = assetify.getAssetDep( DepImage.assetName, DepImage.assetType, DepImage.depType, DepImage.depIndex, DepImage.depSubIndex )