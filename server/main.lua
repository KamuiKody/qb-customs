QBCore = QBCore or exports['qb-core']:GetCoreObject()

local function permissionsCheck(src, location)
    local PlayerData = QBCore.Functions.GetPlayer(src).PlayerData
    local types = {['name'] = 'job', ['type'] = 'jobType'}
    for k,v in pairs(types) do
        for i = 1,#Config.Locations[location][v].restricted do
            if PlayerData.job[k] == locationInfo[v].restricted[i] then
                return false
            end
        end
        for i = 1,#Config.Locations[location][v].required do
            if PlayerData.job[k] == Config.Locations[location][v].required[i] then
                return PlayerData.job.name
            end
        end
    end
    if not next(Config.Locations[location]['job'].required) and not next(Config.Locations[location]['jobType'].required) then return true end
    return false
end

local function IsVehicleOwned(plate)
    local result = MySQL.scalar.await('SELECT plate FROM player_vehicles WHERE plate = ?', { plate })
    if not result then return false end
    return true
end

local function checkData(data, _modType)
    if not _modType then return Config.Categories[data.index_1].price end
    local mods = {
        upgrade = Config.Categories[data.index_1].price[data.index_2] or 0,
        paint = Config.Categories[data.index_1].items[data.index_2].items[data.index_3].price or 0,
        horn = Config.Categories[data.index_1].price or 0,
        wheels = Config.Categories[data.index_1].items[data.index_2].price or 0
    }
    return mods[_modType].price
end

RegisterNetEvent("qb-customs:server:updateVehicle", function(myCar)
    if not IsVehicleOwned(myCar.plate) then return end
    MySQL.update('UPDATE player_vehicles SET mods = ? WHERE plate = ?', { json.encode(myCar), myCar.plate })
end)

QBCore.Functions.CreateCallback("qb-customs:cb:permissionsCheck", function(source, cb, location)
    cb(permissionsCheck(source, location))
end)

QBCore.Functions.CreateCallback("qb-customs:cb:purchaseMod", function(source, cb, args)
    local Player = QBCore.Functions.GetPlayer(source)
    local job = permissionsCheck(source, args.location)
    if not job then cb(false) return end
    local data = checkData(args, args.modType)
    if type(job) == 'string' then
        if not exports['qb-management']:RemoveMoney(job, data.price) then cb(false) return end
        cb(true)
    elseif job then
        if Player.Functions.RemoveMoney('cash', data.price, 'Bennys Purchase') then
            cb(true)
            return
        else
            if not Player.Functions.RemoveMoney('bank', data.price, 'Bennys Purchase') then cb(false) return end
            cb(true)
        end
    else
        -- notify insufficient permissions
    end
end)