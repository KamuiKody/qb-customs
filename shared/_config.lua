Config = {}

Config.UseTarget = GetConvar('UseTarget', 'false') == 'true'

Config.RequireRepair = false -- set as body health/ i.e 1000.0
Config.Locations = {
    {
        coords = vector3(-338.94, -137.65, 38.59),
        radius = 5.0,
        job = {
            required = {},
            restricted = {}
        },
        jobType = {
            required = {},
            restricted = {}
        },
        class = {
            required = {},
            restricted = { 18 }
        },
        restrictedparts = { --[[17,19,20,21,22,23,24,26,47,49]] }
    }
}
