---------------------------------------------------------------------------------------------

DepSound = {}
if not configClient then configClient = {} end
isAssetifyLoaded = false
configClient.DepSound = {
    assetType = "module",
    assetName = "WADADADANG",
    depType = "sound",
    depFail = "sound/warning-sound-6686.mp3"
}

configClient.sound = {
    "warning"
}

function loadDepSound ( )
    
    -- Store texture element in the DepSound table variable.
    for i, depIndex in ipairs( configClient.sound ) do
        InsertDepSound ( depIndex )
    end
    
end

function getDepSound ( depIndex )
    if isAssetifyLoaded then
        if DepSound[ depIndex ] then
            return DepSound[ depIndex ]
        end
    end
    return configClient.DepSound.depFail
end

function InsertDepSound ( depIndex )
    if not DepSound[ depIndex ] then
        if configClient.DepSound then
            local dep = assetify.getAssetDep( configClient.DepSound.assetType, configClient.DepSound.assetName, configClient.DepSound.depType, depIndex )
            if dep then
                DepSound[ depIndex ] = dep
                return DepSound[ depIndex ]
            end
        end
        DepSound[ depIndex ] = configClient.DepSound.depFail
        return DepSound[ depIndex ]
    end
end

assetify.network:fetch("Assetify:onAssetLoad", true):on(
    function ( assetType, assetName )
        if assetType == configClient.DepSound.assetType then
            if assetName == configClient.DepSound.assetName then
                loadDepSound ( )
            end
        end
    end
)

assetify.scheduler.execOnLoad(function()
    isAssetifyLoaded = true
end
)

addEventHandler( "onClientResourceStart", resourceRoot, 
function ( )

    if isAssetifyLoaded then
        loadDepSound ( )
    end

end
)

---------------------------------------------------------------------------------------------

local play = playSound( getDepSound ( "warning" ), false, false )
setSoundVolume( play, 1 )


