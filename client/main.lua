QBCore = QBCore or exports['qb-core']:GetCoreObject()
local mod = {}
local modInfo = {}
local vehicleInfo = {}
local bodyPoly = {}
local listen = false
local finalList = false
local active = -1

local function goBack()
    mod[#mod] = nil
    return #mod
end

---@param tableIndex "index of how deep you want to go into the Config.Categories table (#mod = all the way)"
---@return table "Table at its current index"
local function getCurrentMenu(tableIndex)
    local menu = Config.Categories
    if not next(mod) or not mod[1] then return menu end
    if not tableIndex then tableIndex = #mod end
    for i = 1, tableIndex do
        if not mod[i] then closeMenu(true) return false end
        menu = menu[mod[i]]
    end
    return menu
end

local function pressHorn(veh, time)
    for i = 1, time do
        SetControlNormal(0, 86, 1.0)
        StartVehicleHorn(veh, 2000, "HELDDOWN", true)
        Wait(1)
    end
end

local function sprayCar(veh)
    SetVehicleColours(veh, vehicleInfo.color1, vehicleInfo.color2)
    SetVehicleExtraColours(veh, vehicleInfo.color1Coat, vehicleInfo.color2Coat)
end

local function setNeons(veh, index, color)
    if color then
        if type(color) == "number" then SetVehicleNeonLightsColor_2(veh, color) return end
        SetVehicleNeonLightsColor(veh, color.r, color.g, color.b)
        return
    end
    if type(index) == "number" then SetVehicleNeonLightEnabled(veh, index, not IsVehicleNeonLightEnabled(veh, index)) return end
    if index == "all" then index = {0,1,2,3} end
    for i = 1, #index do
        SetVehicleNeonLightEnabled(veh, index[i], not IsVehicleNeonLightEnabled(veh, index[i]))
    end
end

local function setHeadlights(veh, xenon, color)
    if not xenon and not color then SetVehicleMod(veh, 22, 0) return end
    if xenon then SetVehicleMod(veh, 22, 1) end
    if color then
        if color == "number" then SetVehicleXenonLightsColor(veh, color) return end
        SetVehicleXenonLightsColor(veh, color.r, color.g, color.b)
    end
end

local function getModLabels(vehicle, modType)
    local amount = GetNumVehicleMods(vehicle, modType)
    local menu = getCurrentMenu(#mod)
    local indexPrices = true
    local price = ''
    if menu.price and type(menu.price) == "number" then
        price = " Price: $"..menu.price
        indexPrices = false
    end
    local list = {}
    for i = 1, (amount + 1) do
        local id = (i - 1)
        local title = GetLabelText(GetModTextLabel(vehicle, modType, id))
        if indexPrices then price = " Price: $"..menu.price[id] end
        list[#list + 1] = {
            label = title .. price
        }
    end
    return list
end

local function GetModCount(location, vehicle)
    local menu = {}
    for k,v in pairs(Config.Categories) do
        local addCat = true
        for i = 1,#Config.Locations[location].restrictedparts do
            if Config.Locations[location].restrictedparts[i] == k then
                addCat = false
            end
        end
        if GetNumVehicleMods(vehicle, k) > 0 and addCat then
            local label = v.label
            if v.price and type(v.price) == "number" then label = label .." Price: "..v.price end
            menu[#menu+1] = {
                label = label,
            }
        end
    end
    return menu
end

local function openMenu(menu, veh, init, bool)
    if listen then return end
    CreateThread(function()
        if init then vehicleInfo = QBCore.Functions.GetVehicleProperties(veh) end
        SetVehicleModKit(veh, 0)
        SendNUIMessage({init = init, menu = menu})
        if not bool then
            listen = true
            while listen do
                Wait(5)
                if IsControlJustPressed(0, 19) then
                    listen = false
                end
            end
        end
        SetNuiFocus(true, true)
    end)
end

local function checkPermission(zone)
    QBCore.Functions.TriggerCallback("qb-customs:cb:permissionsCheck", function(data)
        if not data then return end        
        local veh = GetVehiclePedIsIn(PlayerPedId(), false)
        mod = GetModCount(zone, veh)
        openMenu(mod, veh, true, Config.UseTarget)
    end, zone)
end

RegisterNUICallback('Close', function()
    modInfo = {}
    active = -1
    SetNuiFocus(false, false)
end)

RegisterNUICallback('ButtonPressed', function(bool)
    if not bool then addPart() return end
    purchasePart()
end)

RegisterNUICallback('CategoryChoosen', function(index)
    if finalList then active = index return end
    local menu = getCurrentMenu(#mod)
    active = -1
    if not menu[index] then modInfo = menu[index] return end
    modInfo = {}
    menu = menu[index]
    mod[#mod + 1] = index
    openMenu(menu, false, true)
end)

CreateThread(function()
    for k, v in pairs(Config.Locations) do
        if Config.UseTarget then
            exports["qb-target"]:AddCircleZone(k, v.coords, v.radius, {
                name = k,
                debugPoly = false,
                minZ = v.coords.z - 5,
                maxZ = v.coords.z + 5
            },
            {
                options = {
                    {
                        action = function(data)
                            checkPermission(data.name)
                        end,
                        icon = v.icon,
                        label = v.label
                    }
                },
                distance = 1.5
            })
        else
            bodyPoly[k] = CircleZone:Create(v.coords, v.radius, {
                name = k,
                debugPoly = false,
                minZ = v.coords.z - 5,
                maxZ = v.coords.z + 5
            })
            local bodyCombo = ComboZone:Create(bodyPoly, { name = "bodyCombo", debugPoly = false})
            bodyCombo:onPlayerInOut(function(isPointInside, _, zone)
                if not isPointInside then return end
                checkPermission(zone.name)
            end)
        end
    end
end)