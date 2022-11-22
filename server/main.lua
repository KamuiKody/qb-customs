local QBCore = exports['qb-core']:GetCoreObject()
local locationInfo = {}

local function isProperJob()
    local src = source
    local citizenid = QBCore.Functions.GetPlayer(src).PlayerData.citizenid
    local types = {['name'] = 'job', ['type'] = 'jobType'}
    for k,v in pairs(types) do
        for i = 1,#locationInfo[citizenid][v].restricted do
            if QBCore.Functions.GetPlayerData().job[k] == locationInfo[v].restricted[i] then
                return false
            end
        end
        for i = 1,#locationInfo[citizenid][v].required do
            if QBCore.Functions.GetPlayerData().job[k] == locationInfo[v].required[i] then
                return true
            end
        end
    end
    return false
end

local function IsVehicleOwned(plate)
    local retval = false
    local result = MySQL.scalar.await('SELECT plate FROM player_vehicles WHERE plate = ?', { plate })
    if result then retval = true end
    return retval
end

RegisterNetEvent('qb-customs:updateLocation', function(data)
    local src = source
    local citizenid = QBCore.Functions.GetPlayer(src).PlayerData.citizenid
    locationInfo[citizenid] = data
end)

RegisterNetEvent("qb-customs:server:updateVehicle", function(myCar)
    if IsVehicleOwned(myCar.plate) then
        MySQL.update('UPDATE player_vehicles SET mods = ? WHERE plate = ?', { json.encode(myCar), myCar.plate })
    end
end)

QBCore.Functions.CreateCallback('qb-customs:cb:modBuy', function(source, cb, data)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if isProperJob() then
        for k,v in pairs(Config.Categories) do
            if k == data.type then
                local price = v.price
                if type(price) == 'table' then
                    price = v.price[data.part+1]
                end
                if exports['qb-management']:RemoveMoney('mechanic', price) then
                    cb(true)
                    -- log it here
                else
                    cb(false)
                end
            end
        end
    end
end)