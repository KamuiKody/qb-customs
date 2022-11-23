local QBCore = exports['qb-core']:GetCoreObject()
local bodyPoly = {}
local inZone = false
local stock = -1
local mod = -1
local modCategory = -1 
local locationInfo = nil

local function isProperJob()
    local types = {['name'] = 'job', ['type'] = 'jobType'}
    for k,v in pairs(types) do
        for i = 1,#locationInfo[v].restricted do
            if QBCore.Functions.GetPlayerData().job[k] == locationInfo[v].restricted[i] then
                return false
            end
        end
        for i = 1,#locationInfo[v].required do
            if QBCore.Functions.GetPlayerData().job[k] == locationInfo[v].required[i] then
                return true
            end
        end
    end
    return false
end

local function GetModCount()
    local menu = {}
    for k,v in pairs(Config.Categories) do
        local addCat = true
        for i = 1,#locationInfo.restrictedparts do
            if locationInfo.restrictedparts[i] == k then
                addCat = false
            end
        end
        if GetNumVehicleMods(locationInfo.veh, k) > 0 and addCat then
            local newPrice = 'Varies'
            if type(v.price) ~= 'table' then
                newPrice = v.price
            end
            menu[#menu+1] = {
                label = v.label,
                id = k,
                price = newPrice
            }
        end
    end
    return menu
end

local looped = false
local function UIloop()
    if not looped then
        looped = true
        CreateThread(function()
            SetVehicleModKit(locationInfo.veh, 0)
            local menu = GetModCount()
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
end

RegisterNUICallback('Close', function(data)
    SetNuiFocus()
    if modCategory >= 0 then
        SetVehicleMod(locationInfo.veh, modCategory, stock)
    end
    stock = -1
    mod = -1
    modCategory = -1 
end)

RegisterNUICallback('BackToMain', function(data, cb)
    SetVehicleMod(locationInfo.veh, modCategory, stock)
    stock = -1
    mod = -1
    modCategory = -1 
    if not inZone then return end
    cb(GetModCount())
end)

RegisterNUICallback('Preview', function(data)
    if modCategory ~= data.type then return end
    if isProperJob() and inZone then
        mod = data.part
    end
    SetVehicleMod(locationInfo.veh, modCategory, data.part)
    if data.type == 14 then
        local count = 300
        while count > 1 do
            SetControlNormal(0,86,1.0)
            Wait(1)
            count = count - 1
        end
        StartVehicleHorn(locationInfo.veh, 2000, "HELDDOWN", true)
    end
end)

RegisterNUICallback('Purchase', function(data)
    if isProperJob() and inZone then
        QBCore.Functions.TriggerCallback('qb-customs:cb:modBuy', function(cb)
            if cb then
                stock = GetVehicleMod(locationInfo.veh, modCategory)
                SetVehicleMod(locationInfo.veh, modCategory, stock)
                local myCar = QBCore.Functions.GetVehicleProperties(locationInfo.veh)
                TriggerServerEvent('qb-customs:server:updateVehicle', myCar)                
                QBCore.Functions.Notify(GetLabelText(GetModTextLabel(locationInfo.veh, modCategory, mod)).." installed!", 'success')
                
            else
                SetVehicleMod(locationInfo.veh, modCategory, stock)
                QBCore.Functions.Notify("There arent enough funds in the shop for this.", 'error')
                stock = -1
                mod = -1
            end
        end, data)
    end
end)

RegisterNUICallback('CheckOptions', function(data, cb)
    if not inZone or not isProperJob() then return end
    modCategory = data.id
    stock = GetVehicleMod(locationInfo.veh, modCategory)
    local menu = {}
    for k,v in pairs(Config.Categories) do
        if k == data.id then
            local amount = GetNumVehicleMods(locationInfo.veh, k)
            local priceType = false
            if type(v.price) == 'table' then
                menu[#menu+1] = {
                    label = v.label,
                    modType = -1,
                    id = -1
                }
                priceType = true
            else
                menu[#menu+1] = {
                    label = v.label..' | Price: '..v.price,
                    modType = -1,
                    id = -1
                }
            end
            if v.subCat then
                for t,u in pairs(v.subCat) do
                    local price = ''
                    if priceType then
                        price = ' | Price: '..v.price[t+1]
                    end
                    menu[#menu+1] = {
                        label = u .. price,
                        modType = k,
                        id = t
                    }
                end                
            else
                for u = 1,amount do
                    local price = ''
                    local title = GetLabelText(GetModTextLabel(locationInfo.veh, k, u))
                    if priceType then
                        price = ' Price: '..v.price[u]
                        title = v.label .. ' level ' .. u
                    end
                    menu[#menu+1] = {
                        label = title .. price,
                        modType = k,
                        id = u
                    }
                end
            end
            menu[#menu+1] = {
                label = 'Default',
                modType = k,
                id = -1
            }
            menu[#menu+1] = {
                label = '<= Go Back',
                modType = -2,
                id = -2
            }
            cb(menu)
        end
    end
end)

CreateThread(function()
    for k, v in pairs(Config.Locations) do
        bodyPoly[k] = CircleZone:Create(v.coords, v.radius, {
            name = k,
            debugPoly = false
        })
        local bodyCombo = ComboZone:Create(bodyPoly, { name = "bodyCombo", debugPoly = false })
        bodyCombo:onPlayerInOut(function(isPointInside, _, zone)
            if isPointInside then
                locationInfo = v
                if isProperJob() then
                    inZone = true
                    local ent = GetVehiclePedIsIn(PlayerPedId(),false)
                    if ent ~= 0 then
                        locationInfo.veh = ent
                        TriggerServerEvent('qb-customs:updateLocation', locationInfo)
                        UIloop()
                    end
                end
            else
                inZone = false
                locationInfo = nil
                looped = false
                TriggerServerEvent('qb-customs:updateLocation', locationInfo)
                SetNuiFocus(false,false)
                SendNUIMessage({action = 'hide'})
            end
        end)
    end
end)