---------------------------------------------------------------------------------------------

DepSound = {}
if not configClient then configClient = {} end
configClient.DepSound = {
    assetType = "module",
    assetName = "WADADADANG",
    depType = "sound"
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
    if DepSound[ depIndex ] then
        return DepSound[ depIndex ]
    end
    return "/sound/warning-sound-6686.mp3"
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
        DepSound[ depIndex ] = "/sound/warning-sound-6686.mp3"
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

addEventHandler( "onClientResourceStart", resourceRoot, 
function ( )
    loadDepSound ( )
end
)

---------------------------------------------------------------------------------------------

local play = playSound( getDepSound ( "warning" ), false, false )
setSoundVolume( play, 1 )


