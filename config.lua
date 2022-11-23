Config = {}
Config.RequireRepair = false -- set as body health/ i.e 1000.0

Config.Locations = {
    {
        coords = vector3(-211.79, -1324.32, 30.89),
        radius = 5.0,
        job = {
            required = {'mechanic'},
            restricted = {}
        },
        jobType = {
            required = {'mechanic'},
            restricted = {}
        },
        class = {
            required = {},
            restricted = {18}
        },
        restrictedparts = {17,19,20,21,22,23,24,26,47,49}
    }
}

Config.hornLabels = {
    [0] = "Truck Horn",
    [1] = "Cop Horn",
    [2] = "Clown Horn",
    [3] = "Musical Horn 1",
    [4] = "Musical Horn 2",
    [5] = "Musical Horn 3",
    [6] = "Musical Horn 4",
    [7] = "Musical Horn 5",
    [8] = "Sad Trombone",
    [9] = "Classical Horn 1",
    [10] = "Classical Horn 2",
    [11] = "Classical Horn 3",
    [12] = "Classical Horn 4",
    [13] = "Classical Horn 5",
    [14] = "Classical Horn 6",
    [15] = "Classical Horn 7",
    [16] = "Scale - Do",
    [17] = "Scale - Re",
    [18] = "Scale - Mi",
    [19] = "Scale - Fa",
    [20] = "Scale - Sol",
    [21] = "Scale - La",
    [22] = "Scale - Ti",
    [23] = "Scale - Do",
    [24] = "Jazz Horn 1",
    [25] = "Jazz Horn 2",
    [26] = "Jazz Horn 3",
    [27] = "Jazz Horn Loop",
    [28] = "Star Spangled Banner 1",
    [29] = "Star Spangled Banner 2",
    [30] = "Star Spangled Banner 3",
    [31] = "Star Spangled Banner 4",
    [32] = "Classical Horn 8 Loop",
    [33] = "Classical Horn 9 Loop",
    [34] = "Classical Horn 10 Loop",
    [35] = "Classical Horn 8",
    [36] = "Classical Horn 9",
    [37] = "Classical Horn 10",
    [38] = "Funeral Loop",
    [39] = "Funeral",
    [40] = "Spooky Loop",
    [41] = "Spooky",
    [42] = "San Andreas Loop",
    [43] = "San Andreas",
    [44] = "Liberty City Loop",
    [45] = "Liberty City",
    [46] = "Festive 1 Loop",
    [47] = "Festive 1",
    [48] = "Festive 2 Loop",
    [49] = "Festive 2",
    [50] = "Festive 3 Loop",
    [51] = "Festive 3"
}

Config.Categories = {
    [0] = {label = "Spoiler", price = 500},
    [1] = {label = "Front Bumper", price = 500},
    [2] = {label = "Rear Bumper", price = 500},
    [3] = {label = "Side Skirt", price = 500},
    [4] = {label = "Exhaust", price = 500},
    [5] = {label = "Roll Cage", price = 500},
    [6] = {label = "Grille", price = 500},
    [7] = {label = "Hood", price = 500},
    [8] = {label = "Left Fender", price = 500},
    [9] = {label = "Right Fender", price = 500},
    [10] = {label = "Roof", price = 500},    
    [11] = {label = "Engine Upgrade", price = {5000,10000,20000,35000,52000}},
    [12] = {label = "Brake Upgrade", price = {5000,10000,20000,35000,52000}},
    [13] = {label = "Transmission Upgrade", price = {5000,10000,20000,35000,52000}},
    [14] = {label = "Horns", price = 500, subCat = Config.hornLabels},
    [15] = {label = "Suspension Upgrade", price = {5000,10000,20000,35000,52000}},
    [16] = {label = "Armour Upgrade", price = {5000,10000,20000,35000,52000}},
    [17] = {label = 'Nitrous', price = 500},
    [18] = {label = "Turbo Upgrade", price = 32000},
    [19] = {label = "Subwoofer", price = 500},
    [20] = {label = "Tire Smoke", price = 500},
    [21] = {label = "Hydraulics", price = 500},
    [22] = {label = "Headlights", price = 500},
    [23] = {label = "Wheels", price = 500},
    [24] = {label = "Rear Wheels", price = 500},
    [25] = {label = "Plate Holder", price = 500},
    [26] = {label = "Vanity Plates", price = 500},
    [27] = {label = "Trim A", price = 500},
    [28] = {label = "Ornaments", price = 500},
    [29] = {label = "Dashboard", price = 500},
    [30] = {label = "Dial", price = 500},
    [31] = {label = "Door Speaker", price = 500},
    [32] = {label = "Seats", price = 500},
    [33] = {label = "Steering Wheel", price = 500},
    [34] = {label = "Shifter Leaver", price = 500},
    [35] = {label = "Plaque", price = 500},
    [36] = {label = "Speaker", price = 500},
    [37] = {label = "Trunk", price = 500},
    [38] = {label = "Hydraulic", price = 500},    
    [39] = {label = "Engine Block", price = 500},
    [40] = {label = "Air Filter", price = 500},
    [41] = {label = "Strut", price = 500},
    [42] = {label = "Arch Cover", price = 500},
    [43] = {label = "Aerial", price = 500},
    [44] = {label = "Trim B", price = 500},
    [45] = {label = "Fuel Tank", price = 500},
    [46] = {label = "Window", price = 500},
    [47] = {label = "Door", price = 500},
    [48] = {label = "Livery", price = 500},
    [49] = {label = "Lightbar", price = 500}    
}