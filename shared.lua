loadstring(exports.assetify_library:import())()

--[[
    createDummy()
    https://github.com/ov-sa/Assetify.library/wiki/API:-Library#assetifycreatedummy---shared

    shared side

    example path folder
    -----------------------------------------------------
    pathfile: assetify_library\files\assets\object\example\example.txd
    pathfile: assetify_library\files\assets\object\example\example.dff
    pathfile: assetify_library\files\assets\object\example\example.col
    -----------------------------------------------------

    example asset.vcl
    -----------------------------------------------------
    encryptKey: "XqtcfmbZ9oZU8Ton"
    encryptMode: "aes128"
    -----------------------------------------------------
]]--

local Dummy = {}
Dummy.assetType = "object"
Dummy.assetName = "WADADADANG"
Dummy.assetClump = false
Dummy.clumpMaps = false
Dummy.table = {
   position = {x = 0, y = 0, z = 0}, --Optional
   rotation = {x = 0, y = 0, z = 0}, --Optional
   dimension = 0, --Optional
   interior = 0 --Optional
}
Dummy.isScoped = false

local dummy: cDummy = assetify.createDummy( Dummy.assetType, Dummy.assetName, Dummy.assetClump, Dummy.clumpMaps, Dummy.table, Dummy.isScope )