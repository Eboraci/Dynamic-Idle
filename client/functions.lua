local YRK = {}
local globalIdle = 500 
local defaultIdle = 20000

local function returnTable()
    return YRK
end 

-- Function: Nearest Coords to a single Point, with Z
function YRK.nearestCoordsToSinglePoint(coords, optDefaultDistance, shouldDraw, FunctionToCall)
    if type(coords) == 'vector3' then 
        local ped = PlayerPedId()
        local playerCoords = GetEntityCoords(ped)
        local distance = #(playerCoords - coords.xyz)
        local defaultDistance = 100.0

        if optDefaultDistance then 
            if type(optDefaultDistance) == 'number' then 
                optDefaultDistance = tonumber(optDefaultDistance)
                if optDefaultDistance > 0.0 and optDefaultDistance <= 250.0 then 
                    defaultDistance = optDefaultDistance
                end 
            end
        end 

        local distanceFar = tonumber(defaultDistance / 2)
        local distanceMid = tonumber(distanceFar / 2)
        local distanceNear = 1.5

        if distance <= defaultDistance then 
            local idle = tonumber(distance * globalIdle)
            if idle >= 10000 then 
                if IsPedInAnyVehicle(ped) then 
                    local GetVehiclePedIsIn = GetVehiclePedIsIn(ped)
                    if (GetEntitySpeed(GetVehiclePedIsIn) * 3.6) > 0.0 then 
                        idle = idle / 2 
                    end
                else 
                    if IsPedRunning(ped) then 
                        idle = idle / 1.5
                    else 
                        idle = idle / 1.25
                    end 
                end 
            else 
                -- Waking up program
                if distance <= distanceFar then 
                    idle = 3000

                    if distance <= distanceMid then 
                        idle = 1500
                        if shouldDraw then 
                            local _, groundz = GetGroundZAndNormalFor_3dCoord(coords.x, coords.y, coords.z)
                            DrawMarker(
                                27, -- Circle
                                coords.x,
                                coords.y,
                                groundz,
                                0, 0, 0, -- Direction
                                0, 0, 0, -- Rotation
                                0.1, 0.1, 0.1, -- Scale
                                255, 255, 255, 250, -- RGBA
                                false,
                                false,
                                2,
                                false,
                                false,
                                false,
                                false
                            )
                        end
                    end 
                    if distance <= distanceNear then 
                        idle = 1 
                        FunctionToCall()
                    end 
                end 
            end 
            return idle 
        end 
        return defaultIdle 
    end 
end


-- Function: Nearest Coords to a single Point, no Z
function YRK.nearestCoordsToSinglePoint_2(coords, optDefaultDistance, FunctionToCall)
    if type(coords) == 'vector3' then 
        local ped = PlayerPedId()
        local playerCoords = GetEntityCoords(ped)
        local distance = #(playerCoords.xy - coords.xy)
        local defaultDistance = 100.0

        if optDefaultDistance then 
            if type(optDefaultDistance) == 'number' then 
                optDefaultDistance = tonumber(optDefaultDistance)
                if optDefaultDistance > 0.0 and optDefaultDistance <= 250.0 then 
                    defaultDistance = optDefaultDistance
                end 
            end
        end 

        local distanceFar = tonumber(defaultDistance / 2)
        local distanceMid = tonumber(distanceFar / 2)
        local distanceNear = 1.5

        if distance <= defaultDistance then 
            local idle = tonumber(distance * globalIdle)
            if idle >= 10000 then 
                if IsPedInAnyVehicle(ped) then 
                    local GetVehiclePedIsIn = GetVehiclePedIsIn(ped)
                    if (GetEntitySpeed(GetVehiclePedIsIn) * 3.6) > 0.0 then 
                        idle = idle / 2 
                    end
                else 
                    if IsPedRunning(ped) then 
                        idle = idle / 1.5
                    else 
                        idle = idle / 1.25
                    end 
                end 
            else 
                -- Waking up program
                if distance <= distanceFar then 
                    idle = 3000

                    if distance <= distanceMid then 
                        idle = 1500
                    end 
                    if distance <= distanceNear then 
                        idle = 1 
                        FunctionToCall()
                    end 
                end 
            end 
            return idle 
        end 
        return defaultIdle
    end 
end

-- Function: Expensive Nearest Coords to a single Point, with Z
function YRK.expensiveNearestCoordsToSinglePoint(coords, optDefaultDistance, FunctionToCall)
    if type(coords) == 'vector3' then 
        local ped = PlayerPedId()
        local playerCoords = GetEntityCoords(ped)
        local distance = #(playerCoords.xyz - coords.xyz)
        local defaultDistance = 100.0

        if optDefaultDistance then 
            if type(optDefaultDistance) == 'number' then 
                optDefaultDistance = tonumber(optDefaultDistance)
                if optDefaultDistance > 0.0 and optDefaultDistance <= 250.0 then 
                    defaultDistance = optDefaultDistance
                end 
            end
        end 

        local distanceFar = tonumber(defaultDistance / 2)
        local distanceMid = tonumber(distanceFar / 2)

        if distance <= defaultDistance then 
            local idle = tonumber(distance * globalIdle)
            if idle >= 10000 then 
                idle = 10000
            else 
                -- Waking up program
                if distance <= distanceFar then 
                    idle = 3000

                    if distance <= distanceMid then 
                        idle = 1
                        FunctionToCall()
                    end
                end 
            end 
            return idle 
        end 
        return defaultIdle
    end 
end

-- Function: Expensive Nearest Coords to a single Point, no Z
function YRK.expensiveNearestCoordsToSinglePoint_2(coords, optDefaultDistance, FunctionToCall)
    if type(coords) == 'vector3' then 
        local ped = PlayerPedId()
        local playerCoords = GetEntityCoords(ped)
        local distance = #(playerCoords.xy - coords.xy)
        local defaultDistance = 100.0

        if optDefaultDistance then 
            if type(optDefaultDistance) == 'number' then 
                optDefaultDistance = tonumber(optDefaultDistance)
                if optDefaultDistance > 0.0 and optDefaultDistance <= 250.0 then 
                    defaultDistance = optDefaultDistance
                end 
            end
        end 

        local distanceFar = tonumber(defaultDistance / 2)
        local distanceMid = tonumber(distanceFar / 2)

        if distance <= defaultDistance then 
            local idle = tonumber(distance * globalIdle)
            if idle >= 10000 then 
                idle = 10000
            else 
                -- Waking up program
                if distance <= distanceFar then 
                    idle = 3000

                    if distance <= distanceMid then 
                        idle = 1
                        FunctionToCall()
                    end 
                end 
            end 
            return idle 
        end 
        return defaultIdle
    end 
end


-- It is not recommended to use this function as an exports, copy and paste it into your script is preffered

-- Example:
-- Citizen.CreateThread(function()
--     while true do 
--         local main = YRK.nearestCoordsToSinglePoint(vec3(-1746.09, 32.16, 67.39), 100, false,
--         function()
--             if IsControlJustPressed(0, 38) then 
--                 print('You pressed E')
--             end 
--         end)
--         Citizen.Wait(main)
--     end 
-- end)

exports('YRK', returnTable)
