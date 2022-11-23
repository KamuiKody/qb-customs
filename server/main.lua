local QBCore = exports['qb-core']:GetCoreObject()
local locationInfo = {}

local function isProperJob(src)
    local PlayerData = QBCore.Functions.GetPlayer(src).PlayerData
    local types = {['name'] = 'job', ['type'] = 'jobType'}
    for k,v in pairs(types) do
        for i = 1,#locationInfo[PlayerData.citizenid][v].restricted do
            if PlayerData.job[k] == locationInfo[v].restricted[i] then
                return false
            end
        end
        for i = 1,#locationInfo[PlayerData.citizenid][v].required do
            if PlayerData.job[k] == locationInfo[PlayerData.citizenid][v].required[i] then
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
    if isProperJob(src) then
        for k,v in pairs(Config.Categories) do
            if k == data.type then
                local price = 0
                if type(v.price) == 'table' then
                    price = v.price[data.part]
                else
                    price = v.price
                end
                print(price)
                if exports['qb-management']:RemoveMoney(Player.PlayerData.job.name, price) then
                    cb(true)
                    -- log it here
                else
                    cb(false)
                end
            end
        end
    end
end)