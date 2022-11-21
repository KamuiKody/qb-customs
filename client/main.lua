local QBCore = exports['qb-core']:GetCoreObject()
local bodyPoly = {}
local inZone = false

local function isProperJob(data)
    local types = {['name'] = 'job', ['type'] = 'jobType'}
    for i = 1,#data.job.restricted do
        for k,v in pairs(types) do
            if QBCore.Functions.GetPlayerData().job[k] == data[v].restricted[i] then
                return false
            end
        end
    end
    for i = 1,#data.job.required do
        for k,v in pairs(types) do
            if QBCore.Functions.GetPlayerData().job[k] == data[v].required[i] then
                return true
            end
        end
    end
    return false
end

local function GetModCount(data)
    local menu = {}
    for k,v in pairs(Config.Categories) do
        local addCat = true
        for i = 1,#data.restrictedparts do
            if data.restrictedparts[i] == k then
            addCat = false
            return
            end
        end
        if GetNumVehicleMods(data.veh, k) > 0 and addCat then
            local newPrice = 'Varies'
            if type(v.price) ~= 'table' then
                newPrice = v.price
            end
            menu[#menu + 1] = {
                label = v.label,
                id = k,
                price = newPrice
            }
        end
    end
    return menu
end

local function UIloop(data)
    CreateThread(function()
        SetVehicleModKit(data.veh, 0)
        local menu = GetModCount(data)
        SendNUIMessage({action = 'show', items = menu})
        while inZone do
            Wait(5)
            if IsControlJustPressed(0, 19) then   
                SetNuiFocus(true,true)
                break
            end
        end
    end)
end


CreateThread(function()
    for _, v in pairs(Config.Locations) do
        local polyCount = #bodyPoly + 1
        bodyPoly[polyCount] = CircleZone:Create(v.coords, v.radius {
            name = polyCount,
            debugPoly = false
        })
        local bodyCombo = ComboZone:Create(bodyPoly, { name = "bodyCombo", debugPoly = false })
        bodyCombo:onPlayerInOut(function(isPointInside, _, zone)
            if isPointInside then
                if isProperJob(v) then
                    inZone = true
                    local ent = GetVehiclePedIsIn(PlayerPedId(),false)
                    if ent ~= 0 then
                        v.veh = ent
                        UIloop(v)
                    end
                end
            else
                inZone = false
                SetNuiFocus(false,false)
                SendNUIMessage({action = 'hide'})
            end
        end)
    end
end)