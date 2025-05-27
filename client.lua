


--[[
    client side

    sound.play()
    https://github.com/ov-sa/Assetify.library/wiki/API:-Sound#assetifysoundplay---client


    example path folder
    -----------------------------------------------------
    pathfile: assetify_library\files\assets\sound\soundeffects\sound\bear-191995.mp3
    pathfile: assetify_library\files\assets\sound\soundeffects\sound\beast-snarling-82801.mp3
    pathfile: assetify_library\files\assets\sound\soundeffects\sound\warning-sound-6686.mp3
    -----------------------------------------------------

    example asset.vcl
    -----------------------------------------------------
    encryptKey: "XqtcfmbZ9oZU8Ton"
    encryptMode: "aes128"
    assetSounds:
        animal:
            "bear": "bear-191995.mp3"
            "beast": "beast-snarling-82801.mp3"
        warn:
            "warning": "warning-sound-6686.mp3"
    -----------------------------------------------------
]]--
local configClient = {}

configClient.playSound = {
    assetName = "soundeffects",
    soundVolume = 100,
    isScoped = true,
    isLooped = false
}

local cSound1 = assetify.sound.play( configClient.playSound.assetName, "animal", "bear", configClient.playSound.soundVolume, configClient.playSound.isScoped, configClient.playSound.isLooped )
local cSound2 = assetify.sound.play( configClient.playSound.assetName, "animal", "beast", configClient.playSound.soundVolume, configClient.playSound.isScoped, configClient.playSound.isLooped )
local cSound3 = assetify.sound.play( configClient.playSound.assetName, "warn", "warning", configClient.playSound.soundVolume, configClient.playSound.isScoped, configClient.playSound.isLooped )
-- return sound element


--[[
    shared side

    getAssetDep()
    https://github.com/ov-sa/Assetify.library/wiki/API:-Sound#assetifysoundplay---client

    example path folder
    -----------------------------------------------------
    pathfile: assetify_library\files\assets\module\WADADADANG\dep\WADADADANG.png
    pathfile: assetify_library\files\assets\module\WADADADANG\dep\chicken-noise-196746.mp3
    -----------------------------------------------------

    example asset.vcl
    -----------------------------------------------------
    encryptKey: "XqtcfmbZ9oZU8Ton"
    encryptMode: "aes128"

    assetDeps:
        texture:
            "WADADADANG": "WADADADANG.png"
        sound:
            "chicken": "chicken-noise-196746.mp3"
    -----------------------------------------------------
]]--


configClient.dep = {
    assetName = "module",
    assetType = "WADADADANG",
    depSubIndex = false,
}

local cDep1 = assetify.getAssetDep( configClient.dep.assetName, configClient.dep.assetType, "texture", "WADADADANG", configClient.dep.depSubIndex )
-- return texture element

local cDep2 = assetify.getAssetDep( configClient.dep.assetName, configClient.dep.assetType, "sound", "chicken", configClient.dep.depSubIndex )
-- return userdata