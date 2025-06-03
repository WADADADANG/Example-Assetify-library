--------------------------------------------------------------------------------------------------

heartbeat = {}

function getElementGroundPosition ( element, px, py, pz, height, callBack )
    if not heartbeat.getGround then heartbeat.getGround = {} end

    if heartbeat.getGround[ element ] then return false end

    local x, y, z = px, py, pz
    heartbeat.getGround[ element ] = assetify.thread:createHeartbeat( 
        function ( )
            x, y, z = assetify.thread:getThread():await(
                assetify.network:emitCallback("getGroundPositionFromServer", true, false, element, px, py, pz, height)
            )
            return false
        end,
        function ( ... )
            if callBack then
                local getType = type( callBack )
                if getType == "function" then -- ใช้สำหรับภายใน resource นี้ / use for this resource
                    callBack( x, y, z, height )
                elseif getType == "string" then -- ใช้สำหรับ resource อื่น / use for other resource
                    triggerEvent( callBack, element, x, y, z, height )
                end
            end
            heartbeat.getGround[ element ] = nil
        end,
        1000 * 1
    )
end


-- ใช้จาก resource นี้
local tx, ty, ty = 0, 0, 3
local height = 0.5
getElementGroundPosition ( player, tx, ty, ty, height, function ( x, y, z, height )
    outputChatBox( "Ground Position: " .. x .. ", " .. y .. ", " .. z .. ", Height: " .. height, player )
end
)

-- ใช้จาก resource นี้และอื่นๆ
local tx, ty, ty = 0, 0, 3
local height = 0.5
getElementGroundPosition ( player, tx, ty, ty, height, "callBackEvent:getGroundPosition" )

addEvent( "callBackEvent:getGroundPosition", true )
addEventHandler( "callBackEvent:getGroundPosition", root,
function ( x, y, z, height )
    outputChatBox( "Ground Position: " .. x .. ", " .. y .. ", " .. z .. ", Height: " .. height, source )
end
)

--------------------------------------------------------------------------------------------------