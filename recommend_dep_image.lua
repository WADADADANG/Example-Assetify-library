---------------------------------------------------------------------------------------------

DepImage = {}
if not configClient then configClient = {} end
configClient.DepImage = {
    assetType = "module",
    assetName = "image",
    depType = "texture"
}

configClient.bgImage = {
    "bg-1",
    "bg-2",
    "bg-3",
    "bg-4",
    "bg-5"
}

function loadDepImage ( )
    
    -- Store texture element in the BgImage table variable.
    for i, depIndex in ipairs( configClient.bgImage ) do
        InsertDepImage ( depIndex )
    end
    
end

function getDepImage ( depIndex )
    if DepImage[ depIndex ] then
        return DepImage[ depIndex ]
    end
    return "/img/warning.png"
end

function InsertDepImage ( depIndex )
    if not DepImage[ depIndex ] then
        if configClient.DepImage then
            local dep = assetify.getAssetDep( configClient.DepImage.assetType, configClient.DepImage.assetName, configClient.DepImage.depType, depIndex )
            if dep then
                DepImage[ depIndex ] = dep
                return DepImage[ depIndex ]
            end
        end
        DepImage[ depIndex ] = "/img/warning.png"
        return DepImage[ depIndex ]
    end
end

assetify.network:fetch("Assetify:onAssetLoad", true):on(
    function ( assetType, assetName )
        if assetType == configClient.DepImage.assetType then
            if assetName == configClient.DepImage.assetName then
                loadDepImage ( )
            end
        end
    end
)

addEventHandler( "onClientResourceStart", resourceRoot, 
function ( )
    loadDepImage ( )
end
)

---------------------------------------------------------------------------------------------

dxDrawImage( 0, 0, 500, 500, getDepImage ( "bg-1" ) )