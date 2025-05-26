


--[[
    sound.play()
    https://github.com/ov-sa/Assetify.library/wiki/API:-Sound#assetifysoundplay---client

    client side

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