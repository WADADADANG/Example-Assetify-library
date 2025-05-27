---------------------------------------------------------------------------------------------

DepImage = {}

configClient = {}
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
    
    -- เก็บข้อมูล texture ไว้ในตัวแปร DepImage
    for i, depIndex in ipairs( configClient.bgImage ) do
        InsertDepImage ( depIndex )
    end
    
end

function getDepImage ( depIndex )
    if DepImage[ depIndex ] then
        return DepImage[ depIndex ]
    end
    
    if configClient.DepImage then
        local dep = assetify.getAssetDep( configClient.DepImage.assetType, configClient.DepImage.assetName, configClient.DepImage.depType, depIndex )
        if dep then
            return dep
        end
    end
    return "/img/warning.png"
end

function InsertDepImage ( depIndex )
    if not DepImage[ depIndex ] then
        DepImage[ depIndex ] = getDepImage ( depIndex )
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