Config = Config

Config.Paints = {
    [1] = {
        label = 'Standard',
        items = {
            {label = "Black", id = 0},
            {label = "Carbon Black", id = 147},
            {label = "Graphite", id = 1},
            {label = "Anhracite Black", id = 11},
            {label = "Black Steel", id = 2},
            {label = "Dark Steel", id = 3},
            {label = "Silver", id = 4},
            {label = "Bluish Silver", id = 5},
            {label = "Rolled Steel", id = 6},
            {label = "Shadow Silver", id = 7},
            {label = "Stone Silver", id = 8},
            {label = "Midnight Silver", id = 9},
            {label = "Cast Iron Silver", id = 10},
            {label = "Red", id = 27},
            {label = "Torino Red", id = 28},
            {label = "Formula Red", id = 29},
            {label = "Lava Red", id = 150},
            {label = "Blaze Red", id = 30},
            {label = "Grace Red", id = 31},
            {label = "Garnet Red", id = 32},
            {label = "Sunset Red", id = 33},
            {label = "Cabernet Red", id = 34},
            {label = "Wine Red", id = 143},
            {label = "Candy Red", id = 35},
            {label = "Hot Pink", id = 135},
            {label = "Pfsiter Pink", id = 137},
            {label = "Salmon Pink", id = 136},
            {label = "Sunrise Orange", id = 36},
            {label = "Orange", id = 38},
            {label = "Bright Orange", id = 138},
            {label = "Gold", id = 99},
            {label = "Bronze", id = 90},
            {label = "Yellow", id = 88},
            {label = "Race Yellow", id = 89},
            {label = "Dew Yellow", id = 91},
            {label = "Dark Green", id = 49},
            {label = "Racing Green", id = 50},
            {label = "Sea Green", id = 51},
            {label = "Olive Green", id = 52},
            {label = "Bright Green", id = 53},
            {label = "Gasoline Green", id = 54},
            {label = "Lime Green", id = 92},
            {label = "Midnight Blue", id = 141},
            {label = "Galaxy Blue", id = 61},
            {label = "Dark Blue", id = 62},
            {label = "Saxon Blue", id = 63},
            {label = "Blue", id = 64},
            {label = "Mariner Blue", id = 65},
            {label = "Harbor Blue", id = 66},
            {label = "Diamond Blue", id = 67},
            {label = "Surf Blue", id = 68},
            {label = "Nautical Blue", id = 69},
            {label = "Racing Blue", id = 73},
            {label = "Ultra Blue", id = 70},
            {label = "Light Blue", id = 74},
            {label = "Chocolate Brown", id = 96},
            {label = "Bison Brown", id = 101},
            {label = "Creeen Brown", id = 95},
            {label = "Feltzer Brown", id = 94},
            {label = "Maple Brown", id = 97},
            {label = "Beechwood Brown", id = 103},
            {label = "Sienna Brown", id = 104},
            {label = "Saddle Brown", id = 98},
            {label = "Moss Brown", id = 100},
            {label = "Woodbeech Brown", id = 102},
            {label = "Straw Brown", id = 99},
            {label = "Sandy Brown", id = 105},
            {label = "Bleached Brown", id = 106},
            {label = "Schafter Purple", id = 71},
            {label = "Spinnaker Purple", id = 72},
            {label = "Midnight Purple", id = 142},
            {label = "Bright Purple", id = 145},
            {label = "Cream", id = 107},
            {label = "Ice White", id = 111},
            {label = "Frost White", id = 112}
        }
    },
    [2] = {
        label = 'Matte',
        items = {
            {label = "Black", id = 12},
            {label = "Gray", id = 13},
            {label = "Light Gray", id = 14},
            {label = "Ice White", id = 131},
            {label = "Blue", id = 83},
            {label = "Dark Blue", id = 82},
            {label = "Midnight Blue", id = 84},
            {label = "Midnight Purple", id = 149},
            {label = "Schafter Purple", id = 148},
            {label = "Red", id = 39},
            {label = "Dark Red", id = 40},
            {label = "Orange", id = 41},
            {label = "Yellow", id = 42},
            {label = "Lime Green", id = 55},
            {label = "Green", id = 128},
            {label = "Forest Green", id = 151},
            {label = "Foliage Green", id = 155},
            {label = "Olive Darb", id = 152},
            {label = "Dark Earth", id = 153},
            {label = "Desert Tan", id = 154}
        }
    },
    [3] = {
        label = 'Metals',
        items = {
            {label = "Brushed Steel", id = 117},
            {label = "Brushed Black Steel", id = 118},
            {label = "Brushed Aluminium", id = 119},
            {label = "Pure Gold", id = 158},
            {label = "Brushed Gold", id = 159},
            {label = "Chrome", id = 120}
        }
    }
}

Config.PaintLocations = {
    [0] = {label = 'Primary', items = Config.Paints},
    [1] = {label = 'Secondary', items = Config.Paints}
}

Config.wheelCategories = {
    [0] = 'Sport',
    [1] = 'Muscle',
    [2] = 'Lowrider',
    [3] = 'SUV',
    [4] = 'Offroad',
    [5] = 'Tuner',
    [6] = 'Motorcycle',
    [7] = 'High End'
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
    [11] = {label = "Engine Upgrade", price = {5000, 10000, 20000, 35000, 52000, 60000}},
    [12] = {label = "Brake Upgrade", price = {5000, 10000, 20000, 35000, 52000, 60000}},
    [13] = {label = "Transmission Upgrade", price = {5000, 10000, 20000, 35000, 52000, 60000}},
    [14] = {label = "Horns", price = 500, items = Config.hornLabels},
    [15] = {label = "Suspension Upgrade", price = {5000, 10000, 20000, 35000, 52000, 60000}},
    [16] = {label = "Armour Upgrade", price = {5000, 10000, 20000, 35000, 52000, 60000}},
    [17] = {label = 'Nitrous', price = 500},
    [18] = {label = "Turbo Upgrade", price = 32000},
    [19] = {label = "Subwoofer", price = 500},
    [20] = {label = "Tire Smoke", price = 500},
    [21] = {label = "Hydraulics", price = 500},
    [22] = {label = "Headlights", price = 500},
    [23] = {label = "Wheels", price = 500, items = Config.wheelCategories},
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
    [49] = {label = "Lightbar", price = 500},
    [50] = {label = "Paint", price = 500}
}