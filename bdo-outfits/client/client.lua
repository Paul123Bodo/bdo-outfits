local Bdo = exports['bdo-core']:BdoStringData()
local GetCore = Bdo.GetCore()
local OutfitType = nil
local OutfitIndex = nil
local IsNaked = false

AddEventHandler("onResourceStop", function(resourceName) 
    if resourceName == 'bdo-outfits' then TriggerEvent('bdo-input:client:CloseInput')  end
end)

local PlayerSkinData = {}
local CategoryNames = {
    [0x9925C067] = joaat('hats'),
    [0x1D4C528A] = joaat('pants'),
    [0x2026C46D] = joaat('shirts_full'),
    [0x485EE834] = joaat('vests'),
    [0xE06D30CE] = joaat('coats'),
    [0xEABE0032] = joaat('gloves'),
    [0x777EC6EF] = joaat('boots'),
    [0xAF14310B] = joaat('ponchos'),
    [0x877A2CF7] = joaat('suspenders'),
    [0x5FC29285] = joaat('neckwear'),
    [0x3C1A74CD] = joaat('cloaks'), 
    [0x0662AC34]  = joaat('coats_closed'),
    [0x9B2C8B89] = joaat('gunbelts'),
    [0xF1542D11] = joaat('gunbelt_accs'),
    [0xA6D134C6] = joaat('belts'),
    [0xFAE9107F] = joaat('belt_buckles'),
    [0xB6B6122D] = joaat('holsters_left'),
    [0xB9E2FA01] = joaat('holsters_right'),
    [0x94504D26] = joaat('satchels'),
    [0x42247599] = joaat('satchels'),
    [0x83887E88] = joaat('loadouts'),
    [0x91CE9B20] = joaat('gauntlets'),
    [0xF16A1D23] = joaat('jewelry_rings_left'),
    [0x7A6BBD0B] = joaat('jewelry_rings_right'),
    [0x7BC10759] = joaat('jewelry_bracelets'),
    [0x79D7DF96] = joaat('accessories'),
    [0x18729F39] = joaat('boot_accessories'),
    [0x3107499B] = joaat('chaps'), 
    [0x7505EF42] = joaat('masks'),
    [0x76F0E272] = joaat('aprons'),
    [0x96EDAE5C] = joaat('teeth'),
    [0x0B3966C9]  = joaat('BODIES_UPPER'), 
    [0x823687F5] = joaat('BODIES_LOWER'),    
    [0x15D3C7F2] = joaat('beards_chin'),
    [0xB6B63737] = joaat('beards_chops'),
    -- [0xECC8B25A] = joaat('beards_mustache'),
    -- [0xF8016BCA] = joaat('beards_complete'),
    [0x3F7F3587] = joaat('badges'),
    [0xA0E3AB7F] = joaat('skirts'), 
    [0x7A96FACA] = joaat('neckties'),
    [0x7BE77792] = joaat('holsters_knife'),
    [0x7C00A8F0] = joaat('talisman_holster'),
    [0x8EFB276A] = joaat('talisman_satchel'), 
    [0xDA0E2C55] = joaat('ammo_rifles'),
    [0xDB64A390] = joaat('talisman_wrist'),
    [0x4A73515C] = joaat('MASKS_LARGE'), 
    -- [0xEA24B45E] = joaat('eyes'), 
    -- [0x8E84A2AA] = joaat('hair_accessories'),
    [0xA2926F9B] = joaat('dresses'),
    [0x72E6EF74] = joaat('armor'),
    -- [0x05E47CA6]  = joaat('eyewear'),
    [0x1AECF7DC] = joaat('talisman_belt'),
    [0x49C89D9B] = joaat('holsters_crossdraw'),
    [0x3F7DB302] = joaat('female_police_coats')
}
local Outfits = {
    male = {
        police = {
            [1] = {
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][1],
                clothes = {
                    {category=0xB3966C9, drawable=-1129422788, albedo=-542241787, normal=-843436149, material=1800424428, palette=-1436165981, tint0=68, tint1=57, tint2=2}, -- 188311241
                    {category=0x2026C46D, drawable=-1214127888, albedo=2037809824, normal=-297276107, material=546130716, palette=-1436165981, tint0=0, tint1=72, tint2=73}, -- 539411565
                    {category=0x9925C067, drawable=173851521, albedo=-677161978, normal=-984372841, material=-888829087, palette=-76459397, tint0=9, tint1=9, tint2=9}, -- -1725579161
                    {category=0x96EDAE5C, drawable=-1439539395, albedo=528025401, normal=46748413, material=947155584, palette=0, tint0=0, tint1=0, tint2=0}, -- -1762808228
                },
            },
            [2] = {
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][2],
                clothes = {
                    {category=0xB3966C9, drawable=-1129422788, albedo=-542241787, normal=-843436149, material=1800424428, palette=-1436165981, tint0=68, tint1=57, tint2=2}, -- 188311241
                    {category=0x2026C46D, drawable=-1214127888, albedo=2037809824, normal=-297276107, material=546130716, palette=-1436165981, tint0=0, tint1=72, tint2=73}, -- 539411565
                    {category=0x9925C067, drawable=173851521, albedo=-677161978, normal=-984372841, material=-888829087, palette=-76459397, tint0=9, tint1=9, tint2=9}, -- -1725579161
                    {category=0x96EDAE5C, drawable=-1439539395, albedo=528025401, normal=46748413, material=947155584, palette=0, tint0=0, tint1=0, tint2=0}, -- -1762808228
                    {category=0x3C1A74CD, drawable=-1333865326, albedo=112926476, normal=1624161570, material=-16128164, palette=1090645383, tint0=140, tint1=21, tint2=21}, -- 1008366797   
                },
            },
            [3] = {
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][3],        
                clothes = {
                    {category=0x1D4C528A, drawable=1723942258, albedo=2112509777, normal=690069542, material=1838257263, palette=-183908539, tint0=0, tint1=1, tint2=3}, -- 491541130
                    {category=0xE06D30CE, drawable=-1345428747, albedo=2134487834, normal=-99377884, material=1759965653, palette=-76459397, tint0=0, tint1=0, tint2=0}, -- -529714994
                    {category=0x9925C067, drawable=525853119, albedo=-256293007, normal=-588281463, material=818090742, palette=1669565057, tint0=139, tint1=254, tint2=143}, -- -1725579161
                    {category=0x7BC10759, drawable=-397407957, albedo=-714916835, normal=-1978155534, material=-1195006570, palette=-76459397, tint0=0, tint1=0, tint2=0}, -- -356646862
                    {category=0x96EDAE5C, drawable=-1439539395, albedo=528025401, normal=46748413, material=947155584, palette=-76459397, tint0=0, tint1=0, tint2=0}, -- -1762808228
                },
            },
            [4] = {
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][4],        
                clothes = {
                    {category=0x1D4C528A, drawable=1723942258, albedo=2112509777, normal=690069542, material=1838257263, palette=-183908539, tint0=0, tint1=1, tint2=3}, -- 491541130
                    {category=0xE06D30CE, drawable=-1345428747, albedo=2134487834, normal=-99377884, material=1759965653, palette=-76459397, tint0=0, tint1=0, tint2=0}, -- -529714994
                    {category=0x9925C067, drawable=525853119, albedo=-256293007, normal=-588281463, material=818090742, palette=1669565057, tint0=139, tint1=254, tint2=143}, -- -1725579161
                    {category=0x7BC10759, drawable=-397407957, albedo=-714916835, normal=-1978155534, material=-1195006570, palette=-76459397, tint0=0, tint1=0, tint2=0}, -- -356646862
                    {category=0x96EDAE5C, drawable=-1439539395, albedo=528025401, normal=46748413, material=947155584, palette=-76459397, tint0=0, tint1=0, tint2=0}, -- -1762808228
                    {category=0x3C1A74CD, drawable=-1333865326, albedo=112926476, normal=1624161570, material=-16128164, palette=1090645383, tint0=140, tint1=21, tint2=21}, -- 1008366797   
                },
            },
            [5] = { 
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][5],        
                clothes = {
                    {category=0x1D4C528A, drawable=1723942258, albedo=2112509777, normal=690069542, material=1838257263, palette=-183908539, tint0=0, tint1=1, tint2=2}, -- 491541130
                    {category=0xE06D30CE, drawable=-2120317290, albedo=-808148941, normal=1751679152, material=2131653421, palette=-76459397, tint0=15, tint1=16, tint2=15}, -- -529714994
                    {category=0x9925C067, drawable=525853119, albedo=-256293007, normal=-588281463, material=818090742, palette=1669565057, tint0=139, tint1=254, tint2=143}, -- -1725579161
                    {category=0x7BC10759, drawable=-35410540, albedo=1422988492, normal=430675706, material=-884128923, palette=-1436165981, tint0=15, tint1=16, tint2=15}, -- -356646862
                    {category=0x96EDAE5C, drawable=-513552989, albedo=384223714, normal=457070985, material=-1611477825, palette=0, tint0=0, tint1=0, tint2=0}, -- -1762808228
                },
            }, 
            [6] = { 
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][6],        
                clothes = {
                    {category=0x1D4C528A, drawable=1723942258, albedo=2112509777, normal=690069542, material=1838257263, palette=-183908539, tint0=0, tint1=1, tint2=2}, -- 491541130
                    {category=0xE06D30CE, drawable=-2120317290, albedo=-808148941, normal=1751679152, material=2131653421, palette=-76459397, tint0=15, tint1=16, tint2=15}, -- -529714994
                    {category=0x9925C067, drawable=525853119, albedo=-256293007, normal=-588281463, material=818090742, palette=1669565057, tint0=139, tint1=254, tint2=143}, -- -1725579161
                    {category=0x7BC10759, drawable=-35410540, albedo=1422988492, normal=430675706, material=-884128923, palette=-1436165981, tint0=15, tint1=16, tint2=15}, -- -356646862
                    {category=0x96EDAE5C, drawable=-513552989, albedo=384223714, normal=457070985, material=-1611477825, palette=0, tint0=0, tint1=0, tint2=0}, -- -1762808228
                    {category=0x3C1A74CD, drawable=-1333865326, albedo=112926476, normal=1624161570, material=-16128164, palette=1090645383, tint0=140, tint1=21, tint2=21}, -- 1008366797   
                },
            }, 
            [7] = { 
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][7],
                clothes = {
                    {category=0x1D4C528A, drawable=1723942258, albedo=2112509777, normal=690069542, material=1838257263, palette=-183908539, tint0=0, tint1=1, tint2=3}, -- 491541130
                    {category=0xE06D30CE, drawable=1291754835, albedo=715937446, normal=1491624329, material=421034676, palette=-1436165981, tint0=0, tint1=0, tint2=0}, -- -529714994
                    {category=0x9925C067, drawable=525853119, albedo=-256293007, normal=-588281463, material=818090742, palette=-76459397, tint0=23, tint1=24, tint2=24}, -- -1725579161
                    {category=0x7BC10759, drawable=-397407957, albedo=-714916835, normal=-1978155534, material=-1195006570, palette=-76459397, tint0=0, tint1=0, tint2=0}, -- -356646862
                    {category=0x96EDAE5C, drawable=-1439539395, albedo=528025401, normal=46748413, material=947155584, palette=-783849117, tint0=0, tint1=0, tint2=0}, -- -1762808228
                },
            }, 
            [8] = { 
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][8],
                clothes = {
                    {category=0x1D4C528A, drawable=1723942258, albedo=2112509777, normal=690069542, material=1838257263, palette=-183908539, tint0=0, tint1=1, tint2=3}, -- 491541130
                    {category=0xE06D30CE, drawable=1291754835, albedo=715937446, normal=1491624329, material=421034676, palette=-1436165981, tint0=0, tint1=0, tint2=0}, -- -529714994
                    {category=0x9925C067, drawable=525853119, albedo=-256293007, normal=-588281463, material=818090742, palette=-76459397, tint0=23, tint1=24, tint2=24}, -- -1725579161
                    {category=0x7BC10759, drawable=-397407957, albedo=-714916835, normal=-1978155534, material=-1195006570, palette=-76459397, tint0=0, tint1=0, tint2=0}, -- -356646862
                    {category=0x96EDAE5C, drawable=-1439539395, albedo=528025401, normal=46748413, material=947155584, palette=-783849117, tint0=0, tint1=0, tint2=0}, -- -1762808228
                    {category=0x3C1A74CD, drawable=-1333865326, albedo=112926476, normal=1624161570, material=-16128164, palette=1090645383, tint0=21, tint1=21, tint2=21}, -- 1008366797   
                },
            }, 
            [9] = {
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][9],
                clothes = {
                    {category=0x1D4C528A, drawable=1723942258, albedo=2112509777, normal=690069542, material=1838257263, palette=-183908539, tint0=0, tint1=1, tint2=3}, -- 491541130
                    {category=0xE06D30CE, drawable=1291754835, albedo=715937446, normal=1491624329, material=421034676, palette=-1436165981, tint0=0, tint1=0, tint2=0}, -- -529714994
                    {category=0x9925C067, drawable=1599070998, albedo=2014390805, normal=88936532, material=1534695787, palette=864404955, tint0=21, tint1=47, tint2=17}, -- -1725579161
                    {category=0x7BC10759, drawable=-397407957, albedo=-714916835, normal=-1978155534, material=-1195006570, palette=-183908539, tint0=0, tint1=0, tint2=64}, -- -356646862
                    {category=0x96EDAE5C, drawable=-1439539395, albedo=528025401, normal=46748413, material=947155584, palette=-783849117, tint0=0, tint1=0, tint2=0}, -- -1762808228
                },
            },
            [10] = {
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][10],
                clothes = {
                    {category=0x1D4C528A, drawable=1723942258, albedo=2112509777, normal=690069542, material=1838257263, palette=-183908539, tint0=0, tint1=1, tint2=3}, -- 491541130
                    {category=0xE06D30CE, drawable=1291754835, albedo=715937446, normal=1491624329, material=421034676, palette=-1436165981, tint0=0, tint1=0, tint2=0}, -- -529714994
                    {category=0x9925C067, drawable=1599070998, albedo=2014390805, normal=88936532, material=1534695787, palette=864404955, tint0=21, tint1=47, tint2=17}, -- -1725579161
                    {category=0x7BC10759, drawable=-397407957, albedo=-714916835, normal=-1978155534, material=-1195006570, palette=-183908539, tint0=0, tint1=0, tint2=64}, -- -356646862
                    {category=0x96EDAE5C, drawable=-1439539395, albedo=528025401, normal=46748413, material=947155584, palette=-783849117, tint0=0, tint1=0, tint2=0}, -- -1762808228
                    {category=0x3C1A74CD, drawable=-1333865326, albedo=112926476, normal=1624161570, material=-16128164, palette=1090645383, tint0=21, tint1=21, tint2=21}, -- 1008366797   
                },
            },
            [11] = {
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][11],
                clothes = {
                    {category=0x79D7DF96, drawable=930202700, albedo=249134150, normal=-122197785, material=284165947, palette=0, tint0=0, tint1=0, tint2=0}, -- -503809350
                    {category=0x1D4C528A, drawable=-1428788349, albedo=-1150582536, normal=1581210225, material=-1871144329, palette=0, tint0=0, tint1=0, tint2=0}, -- 491541130
                    {category=0x777EC6EF, drawable=-690272614, albedo=-2074599180, normal=805319813, material=-166341591, palette=0, tint0=0, tint1=0, tint2=0}, -- 2004797167
                    {category=0x2026C46D, drawable=481827851, albedo=1896989854, normal=-1204001803, material=1938517189, palette=-1436165981, tint0=16, tint1=16, tint2=16}, -- 539411565
                    {category=0xE06D30CE, drawable=-1004634573, albedo=-1750504385, normal=-1634405330, material=-771479417, palette=0, tint0=0, tint1=0, tint2=0}, -- -529714994
                    {category=0x7BC10759, drawable=-1325881672, albedo=-236554935, normal=-917718345, material=-548245503, palette=-1436165981, tint0=16, tint1=49, tint2=80}, -- -356646862 
                },
            },  
            [12] = {
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][12],
                clothes = {
                    {category=0x1D4C528A, drawable=965124777, albedo=-1739436, normal=792923658, material=105949347, palette=0, tint0=0, tint1=0, tint2=0}, -- 491541130
                    {category=0x777EC6EF, drawable=-1891744276, albedo=644474146, normal=-106889355, material=855361609, palette=0, tint0=0, tint1=0, tint2=0}, -- 2004797167
                    {category=0x2026C46D, drawable=1393854499, albedo=1193089296, normal=1180286298, material=1829146447, palette=0, tint0=0, tint1=0, tint2=0}, -- 539411565
                    {category=0xE06D30CE, drawable=2113599174, albedo=-772493731, normal=545104298, material=-1226415126, palette=0, tint0=0, tint1=0, tint2=0}, -- -529714994
                    {category=0x485EE834, drawable=2028633127, albedo=866125781, normal=2021166069, material=1189000341, palette=0, tint0=0, tint1=0, tint2=0}, -- 1214179380
                    {category=0x9925C067, drawable=1271024966, albedo=1472552168, normal=-339061572, material=-1381462781, palette=1669565057, tint0=20, tint1=20, tint2=40}, -- -1725579161
                    {category=0x7BC10759, drawable=-1105428533, albedo=21830886, normal=-1547729907, material=524732347, palette=0, tint0=0, tint1=0, tint2=0}, -- -356646862 
                    {category=0x18729F39, drawable=-1368776351, albedo=1992527449, normal=495144942, material=1033827574, palette=0, tint0=0, tint1=0, tint2=0}, -- 145324092
                },
            }, 
            [13] = {
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][13],
                clothes = {
                    {category=0x1D4C528A, drawable=-365296205, albedo=1590198677, normal=181127365, material=446672369, palette=0, tint0=0, tint1=0, tint2=0}, -- 491541130
                    {category=0x777EC6EF, drawable=-578014294, albedo=1970698321, normal=438816309, material=1500476111, palette=0, tint0=0, tint1=0, tint2=0}, -- 2004797167
                    {category=0xB3966C9, drawable=2143687931, albedo=-1670942334, normal=-843436149, material=1800424428, palette=0, tint0=0, tint1=0, tint2=0}, -- 188311241
                    {category=0x2026C46D, drawable=2066620152, albedo=250285119, normal=-1009606912, material=588331732, palette=0, tint0=0, tint1=0, tint2=0}, -- 539411565
                    {category=0xE06D30CE, drawable=-1389568971, albedo=-1160586942, normal=2034637510, material=-1734356596, palette=0, tint0=0, tint1=0, tint2=0}, -- -529714994
                    {category=0x9925C067, drawable=1943204856, albedo=-1670972553, normal=105307549, material=-758731210, palette=0, tint0=0, tint1=0, tint2=0}, -- -1725579161
                    {category=0x877A2CF7, drawable=1547545002, albedo=743320944, normal=1727982253, material=2147013490, palette=0, tint0=0, tint1=0, tint2=0}, -- -2022036233 
                },
            },
            [14] = {
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][14],
                clothes = {
                    {category=0x1D4C528A, drawable=176645266, albedo=6202941, normal=-1907278769, material=-782709900, palette=-183908539, tint0=14, tint1=6, tint2=4}, -- 491541130
                    {category=0xB3966C9, drawable=402953675, albedo=-542241787, normal=-843436149, material=1800424428, palette=0, tint0=0, tint1=0, tint2=0}, -- 188311241
                    {category=0xE06D30CE, drawable=980163741, albedo=259127114, normal=1604419016, material=-1340108274, palette=-183908539, tint0=0, tint1=3, tint2=65}, -- -529714994
                    {category=0x485EE834, drawable=1989928189, albedo=-342182452, normal=-171537332, material=467069039, palette=-183908539, tint0=60, tint1=121, tint2=121}, -- 1214179380
                    {category=0x9925C067, drawable=1533014470, albedo=-1609118041, normal=-1374909416, material=1508790890, palette=-183908539, tint0=14, tint1=9, tint2=9}, -- -1725579161 
                },
            },
            [15] = {
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][15],
                clothes = {
                    {category=0x1D4C528A, drawable=-1116491255, albedo=-650591881, normal=-1208709833, material=2132618937, palette=-1436165981, tint0=0, tint1=0, tint2=0}, -- 491541130
                    {category=0x777EC6EF, drawable=-1006246715, albedo=-1210048578, normal=813962424, material=456577244, palette=-1436165981, tint0=0, tint1=0, tint2=0}, -- 2004797167
                    {category=0xB3966C9, drawable=-1991023829, albedo=-542241787, normal=-843436149, material=1800424428, palette=-1436165981, tint0=0, tint1=0, tint2=0}, -- 188311241
                    {category=0x2026C46D, drawable=272740873, albedo=-1191531978, normal=301785601, material=-1177558513, palette=-1436165981, tint0=0, tint1=0, tint2=0}, -- 539411565
                    {category=0xE06D30CE, drawable=1731510946, albedo=584958286, normal=-1426726828, material=247050523, palette=0, tint0=0, tint1=0, tint2=0}, -- -529714994
                    {category=0x485EE834, drawable=-2007531057, albedo=-809083487, normal=1958391183, material=1523054631, palette=-1436165981, tint0=0, tint1=0, tint2=0}, -- 1214179380 
                },
            },
            [16] = {
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][16],
                clothes = {
                    {category=0x1D4C528A, drawable=-868790105, albedo=828756412, normal=219773524, material=1681476173, palette=0, tint0=0, tint1=0, tint2=0}, -- 491541130
                    {category=0x777EC6EF, drawable=-1649833849, albedo=-1212096885, normal=-225656062, material=-1141256075, palette=0, tint0=0, tint1=0, tint2=0}, -- 2004797167
                    {category=0xB3966C9, drawable=-1177034185, albedo=-542241787, normal=-843436149, material=1800424428, palette=0, tint0=0, tint1=0, tint2=0}, -- 188311241
                    {category=0x2026C46D, drawable=-1977372578, albedo=-795477001, normal=1107807857, material=-931273402, palette=0, tint0=0, tint1=0, tint2=0}, -- 539411565
                    {category=0xE06D30CE, drawable=895886363, albedo=-534357769, normal=1837086399, material=-1163740486, palette=0, tint0=0, tint1=0, tint2=0}, -- -529714994
                    {category=0x485EE834, drawable=1820610958, albedo=-903740776, normal=-1554314681, material=1532260688, palette=0, tint0=0, tint1=0, tint2=0}, -- 1214179380
                    {category=0x9925C067, drawable=-1822303641, albedo=-1681972577, normal=-1003817086, material=-1049849035, palette=0, tint0=0, tint1=0, tint2=0}, -- -1725579161 
                    {category=0x18729F39, drawable=2018195407, albedo=1571062434, normal=1630896808, material=2070711418, palette=0, tint0=0, tint1=0, tint2=0}, -- 145324092
                },
            },   
            [17] = {
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][17],
                clothes = {
                    {category=0x96EDAE5C, drawable=-1439539395, albedo=528025401, normal=46748413, material=947155584, palette=0, tint0=0, tint1=0, tint2=0}, -- -1762808228
                    {category=0x7A96FACA, drawable=123395723, albedo=506150540, normal=1490989471, material=-133703132, palette=-1436165981, tint0=21, tint1=21, tint2=21}, -- 2056714954
                    {category=0x1D4C528A, drawable=248605434, albedo=-909057372, normal=-386777702, material=1924172640, palette=-183908539, tint0=99, tint1=1, tint2=14}, -- 491541130
                    {category=0xE06D30CE, drawable=2139220531, albedo=-705237091, normal=-910750410, material=-384983333, palette=-783849117, tint0=0, tint1=1, tint2=17}, -- -529714994
                    {category=0x485EE834, drawable=1423356495, albedo=-2139082987, normal=1138501913, material=81350210, palette=-1436165981, tint0=15, tint1=75, tint2=21}, -- 1214179380
                    {category=0x9B2C8B89, drawable=640036974, albedo=797217307, normal=1283957305, material=-350065273, palette=-783849117, tint0=12, tint1=12, tint2=12}, -- -1691579511
                    {category=0x9925C067, drawable=1637017148, albedo=2076717003, normal=-1185806742, material=685598891, palette=864404955, tint0=53, tint1=57, tint2=62}, -- -1725579161
                    {category=0xEABE0032, drawable=-386477528, albedo=-1127880905, normal=419586397, material=141730922, palette=-783849117, tint0=15, tint1=15, tint2=15}, -- -356646862 
                },
            },   
            [18] = {
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][18],            
                clothes = {
                    {category=0x96EDAE5C, drawable=-1439539395, albedo=528025401, normal=46748413, material=947155584, palette=0, tint0=0, tint1=0, tint2=0}, -- -1762808228
                    {category=0x1D4C528A, drawable=1617169950, albedo=-147609320, normal=406694477, material=-409187971, palette=-183908539, tint0=0, tint1=14, tint2=19}, -- 491541130
                    {category=0xB3966C9, drawable=-1129422788, albedo=-542241787, normal=-843436149, material=1800424428, palette=0, tint0=0, tint1=0, tint2=0}, -- 188311241
                    {category=0xE06D30CE, drawable=1074976730, albedo=-391464219, normal=-991324933, material=1329882972, palette=-1436165981, tint0=44, tint1=60, tint2=47}, -- -529714994
                    {category=0x9B2C8B89, drawable=1668736303, albedo=-1277809537, normal=224853329, material=-1038541810, palette=-783849117, tint0=14, tint1=14, tint2=14}, -- -1691579511
                    {category=0x9925C067, drawable=1637017148, albedo=2077320610, normal=-2022383379, material=-1725560418, palette=-76459397, tint0=3, tint1=24, tint2=10}, -- -1725579161
                    {category=0x3F7F3587, drawable=-1407232293, albedo=1791740708, normal=-1235594984, material=-683089630, palette=0, tint0=0, tint1=0, tint2=0}, -- 1065301383
                },
            },   
            [19] = {
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][19],                
                clothes = {
                    {category=0x96EDAE5C, drawable=-1439539395, albedo=528025401, normal=46748413, material=947155584, palette=0, tint0=0, tint1=0, tint2=0}, -- -1762808228
                    {category=0x1D4C528A, drawable=698820373, albedo=-820078948, normal=2081597832, material=2001873248, palette=-783849117, tint0=16, tint1=14, tint2=30}, -- 491541130
                    {category=0xB3966C9, drawable=-1508034642, albedo=-542241787, normal=-843436149, material=1800424428, palette=-76459397, tint0=68, tint1=57, tint2=2}, -- 188311241
                    {category=0x485EE834, drawable=1637082490, albedo=907977298, normal=1182527624, material=1950895012, palette=-1436165981, tint0=15, tint1=154, tint2=21}, -- 1214179380
                    {category=0x9B2C8B89, drawable=-235572285, albedo=797217307, normal=1283957305, material=-350065273, palette=-783849117, tint0=7, tint1=7, tint2=14}, -- -1691579511
                    {category=0x9925C067, drawable=1637017148, albedo=2076717003, normal=-1185806742, material=685598891, palette=-76459397, tint0=1, tint1=24, tint2=24}, -- -1725579161
                    {category=0xEABE0032, drawable=2112732961, albedo=826382745, normal=-454824698, material=-1503836292, palette=-783849117, tint0=15, tint1=72, tint2=19}, -- -356646862
                    {category=0x3F7F3587, drawable=2146167541, albedo=-136827380, normal=727388561, material=-1534084000, palette=-76459397, tint0=28, tint1=28, tint2=28}, -- 1065301383
                },
            },   
            [20] = {            
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][20],
                clothes = {
                    {category=0x96EDAE5C, drawable=-1439539395, albedo=528025401, normal=46748413, material=947155584, palette=0, tint0=0, tint1=0, tint2=0}, -- -1762808228
                    {category=0x1D4C528A, drawable=1226793773, albedo=-1674893493, normal=473822028, material=1859557387, palette=-183908539, tint0=98, tint1=0, tint2=65}, -- 491541130
                    {category=0xB3966C9, drawable=-1935208702, albedo=-542241787, normal=-843436149, material=1800424428, palette=0, tint0=0, tint1=0, tint2=0}, -- 188311241
                    {category=0x485EE834, drawable=-2078433723, albedo=340030300, normal=1206795947, material=883751244, palette=1090645383, tint0=16, tint1=21, tint2=19}, -- 1214179380
                    {category=0x9B2C8B89, drawable=-1482458731, albedo=797217307, normal=1283957305, material=-350065273, palette=-183908539, tint0=0, tint1=2, tint2=2}, -- -1691579511
                    {category=0x9925C067, drawable=-494078350, albedo=-1017763273, normal=804803685, material=378887819, palette=1669565057, tint0=52, tint1=49, tint2=49}, -- -1725579161
                    {category=0x3F7F3587, drawable=-1407232293, albedo=1791740708, normal=-1235594984, material=-683089630, palette=-783849117, tint0=0, tint1=0, tint2=0}, -- 1065301383
                },
            },   
            [21] = {
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][21],
                clothes = {
                    {category=0x96EDAE5C, drawable=-1439539395, albedo=528025401, normal=46748413, material=947155584, palette=0, tint0=0, tint1=0, tint2=0}, -- -1762808228
                    {category=0x7A96FACA, drawable=-2000068390, albedo=-1899829375, normal=1793568609, material=1669458990, palette=-183908539, tint0=0, tint1=0, tint2=0}, -- 2056714954
                    {category=0x1D4C528A, drawable=1226793773, albedo=-313050483, normal=-13054398, material=-521014931, palette=-183908539, tint0=1, tint1=10, tint2=38}, -- 491541130
                    {category=0xB3966C9, drawable=-1129422788, albedo=-542241787, normal=-843436149, material=1930818411, palette=0, tint0=0, tint1=0, tint2=0}, -- 188311241
                    {category=0xE06D30CE, drawable=-1302865445, albedo=464285398, normal=1490513551, material=1001145020, palette=-183908539, tint0=96, tint1=13, tint2=60}, -- -529714994
                    {category=0x9B2C8B89, drawable=640036974, albedo=797217307, normal=1283957305, material=-350065273, palette=-183908539, tint0=18, tint1=18, tint2=18}, -- -1691579511
                    {category=0x9925C067, drawable=1120811319, albedo=-705044925, normal=1485403780, material=1282937524, palette=-183908539, tint0=4, tint1=0, tint2=4}, -- -1725579161
                },
            },   
            [22] = {                        
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][22],    
                clothes = {
                    {category=0x96EDAE5C, drawable=-1439539395, albedo=528025401, normal=46748413, material=947155584, palette=0, tint0=0, tint1=0, tint2=0}, -- -1762808228
                    {category=0x1D4C528A, drawable=799583740, albedo=40000741, normal=1551945942, material=-843068101, palette=-183908539, tint0=96, tint1=2, tint2=4}, -- 491541130
                    {category=0x485EE834, drawable=-788349814, albedo=536649903, normal=-1599720190, material=-1246113319, palette=-183908539, tint0=190, tint1=0, tint2=21}, -- 1214179380
                    {category=0x9B2C8B89, drawable=-235572285, albedo=797217307, normal=1283957305, material=-350065273, palette=-183908539, tint0=11, tint1=11, tint2=43}, -- -1691579511
                    {category=0x9925C067, drawable=-1735928443, albedo=531041914, normal=-1138963133, material=1140582903, palette=-183908539, tint0=0, tint1=3, tint2=0}, -- -1725579161
                    {category=0xEABE0032, drawable=-265973224, albedo=1155208862, normal=-674977188, material=1225579361, palette=-183908539, tint0=1, tint1=19, tint2=0}, -- -356646862
                    {category=0x3F7F3587, drawable=2146167541, albedo=-136827380, normal=727388561, material=-1534084000, palette=-183908539, tint0=0, tint1=0, tint2=0}, -- 1065301383
                },
            },
            [23] = {
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][23],
                clothes = {
                    {category=0x96EDAE5C, drawable=-1000238177, albedo=860485841, normal=-1120366532, material=-1435693698, palette=0, tint0=0, tint1=0, tint2=0}, -- -1762808228
                    {category=0x7A96FACA, drawable=-1629818836, albedo=402563446, normal=-2139234927, material=257524214, palette=-1436165981, tint0=20, tint1=20, tint2=20}, -- 2056714954
                    {category=0x1D4C528A, drawable=-1955436082, albedo=1685127659, normal=158006089, material=1395696470, palette=-183908539, tint0=66, tint1=17, tint2=19}, -- 491541130
                    {category=0xB3966C9, drawable=-1129422788, albedo=-542241787, normal=-843436149, material=1800424428, palette=-1436165981, tint0=0, tint1=0, tint2=0}, -- 188311241
                    {category=0xE06D30CE, drawable=-2137563902, albedo=187349218, normal=1346581695, material=538600559, palette=-1436165981, tint0=49, tint1=20, tint2=20}, -- -529714994
                    {category=0x485EE834, drawable=-1832529786, albedo=-1975070146, normal=908253191, material=1670868421, palette=-1436165981, tint0=15, tint1=47, tint2=21}, -- 1214179380
                    {category=0x9B2C8B89, drawable=470632819, albedo=797217307, normal=1283957305, material=-350065273, palette=-783849117, tint0=7, tint1=7, tint2=37}, -- -1691579511
                    {category=0x9925C067, drawable=689963931, albedo=392948981, normal=1251975365, material=469609248, palette=-76459397, tint0=90, tint1=34, tint2=90}, -- -1725579161 
                },
            },
            [24] = {
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][24],    
                clothes = {
                    {category=0x96EDAE5C, drawable=-1439539395, albedo=528025401, normal=46748413, material=947155584, palette=1090645383, tint0=78, tint1=19, tint2=45}, -- -1762808228
                    {category=0x7A96FACA, drawable=-2000068390, albedo=-1899829375, normal=1793568609, material=1669458990, palette=864404955, tint0=253, tint1=253, tint2=253}, -- 2056714954
                    {category=0x1D4C528A, drawable=1943484568, albedo=480709612, normal=399773429, material=-1341415703, palette=1090645383, tint0=19, tint1=254, tint2=244}, -- 491541130
                    {category=0xB3966C9, drawable=-1129422788, albedo=-542241787, normal=-843436149, material=1800424428, palette=1090645383, tint0=78, tint1=19, tint2=45}, -- 188311241
                    {category=0xE06D30CE, drawable=-1754973085, albedo=-1564902574, normal=-1468799283, material=1001027706, palette=-183908539, tint0=8, tint1=9, tint2=7}, -- -529714994
                    {category=0x485EE834, drawable=-204693026, albedo=238870979, normal=-1599720190, material=-1246113319, palette=-113397560, tint0=15, tint1=77, tint2=0}, -- 1214179380
                    {category=0x9B2C8B89, drawable=470632819, albedo=693269532, normal=-1628815956, material=-1225560080, palette=-783849117, tint0=4, tint1=4, tint2=18}, -- -1691579511
                    {category=0x9925C067, drawable=1637017148, albedo=2077320610, normal=-2022383379, material=-1725560418, palette=1669565057, tint0=254, tint1=253, tint2=245}, -- -1725579161 
                },
            },
            [25] = {
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][25],            
                clothes = {
                    {category=0x96EDAE5C, drawable=-1439539395, albedo=528025401, normal=46748413, material=947155584, palette=0, tint0=0, tint1=0, tint2=0}, -- -1762808228
                    {category=0x1D4C528A, drawable=2141929534, albedo=-870483828, normal=-32831069, material=-1295929491, palette=-1436165981, tint0=21, tint1=21, tint2=21}, -- 491541130
                    {category=0x777EC6EF, drawable=1438554546, albedo=655499996, normal=-1914747245, material=1182458805, palette=-1436165981, tint0=21, tint1=21, tint2=21}, -- 2004797167
                    {category=0xB3966C9, drawable=-1129422788, albedo=-542241787, normal=1725041356, material=1800424428, palette=-1436165981, tint0=21, tint1=21, tint2=21}, -- 188311241
                    {category=0x2026C46D, drawable=-1333070210, albedo=8590835, normal=68113534, material=-1105843728, palette=-1436165981, tint0=15, tint1=41, tint2=21}, -- 539411565
                    {category=0x485EE834, drawable=-464639937, albedo=882821737, normal=1960269087, material=2096280955, palette=-1436165981, tint0=48, tint1=19, tint2=19}, -- 1214179380
                    {category=0x9B2C8B89, drawable=-235572285, albedo=693269532, normal=1283957305, material=-350065273, palette=-1436165981, tint0=21, tint1=21, tint2=21}, -- -1691579511
                    {category=0x3F7F3587, drawable=-1407232293, albedo=1791740708, normal=-1235594984, material=-683089630, palette=0, tint0=0, tint1=0, tint2=0}, -- 1065301383
                },
            },
            [26] = {
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][26],
                clothes = {
                    {category=0x96EDAE5C, drawable=-1439539395, albedo=528025401, normal=46748413, material=947155584, palette=0, tint0=0, tint1=0, tint2=0}, -- -1762808228
                    {category=0x1D4C528A, drawable=664935223, albedo=-395382980, normal=586905005, material=-1896478908, palette=-183908539, tint0=64, tint1=66, tint2=24}, -- 491541130
                    {category=0xB3966C9, drawable=-1129422788, albedo=-542241787, normal=-843436149, material=1800424428, palette=-76459397, tint0=21, tint1=21, tint2=21}, -- 188311241
                    {category=0x2026C46D, drawable=1224987155, albedo=853890971, normal=-171066609, material=-339525284, palette=-183908539, tint0=61, tint1=66, tint2=66}, -- 539411565
                    {category=0xB6B63737, drawable=1646749941, albedo=-122711323, normal=2121174521, material=-184742647, palette=-541985204, tint0=23, tint1=87, tint2=57}, -- -1229572297
                    {category=0xE06D30CE, drawable=980163741, albedo=259127114, normal=1604419016, material=-1340108274, palette=-783849117, tint0=8, tint1=29, tint2=116}, -- -529714994
                    {category=0x9B2C8B89, drawable=-235572285, albedo=797217307, normal=1283957305, material=-350065273, palette=-783849117, tint0=15, tint1=15, tint2=15}, -- -1691579511
                    {category=0x9925C067, drawable=450389772, albedo=1474642820, normal=-720443594, material=-404106863, palette=-76459397, tint0=96, tint1=101, tint2=27}, -- -1725579161
                    {category=0x3F7F3587, drawable=582521430, albedo=-1125093656, normal=-741662607, material=1627473259, palette=-1436165981, tint0=21, tint1=21, tint2=21}, -- 1065301383
                },
            },
            [27] = {
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][27],
                clothes = {
                    {category=0x96EDAE5C, drawable=-513552989, albedo=384223714, normal=457070985, material=-1611477825, palette=0, tint0=0, tint1=0, tint2=0}, -- -1762808228
                    {category=0x1D4C528A, drawable=326335146, albedo=745220735, normal=1841580847, material=-1147431694, palette=-1436165981, tint0=21, tint1=62, tint2=21}, -- 491541130
                    {category=0xB3966C9, drawable=-1129422788, albedo=-542241787, normal=-843436149, material=1800424428, palette=0, tint0=0, tint1=0, tint2=0}, -- 188311241
                    {category=0xE06D30CE, drawable=843227244, albedo=1526542609, normal=-1032011664, material=-454829523, palette=-1436165981, tint0=21, tint1=37, tint2=15}, -- -529714994
                    {category=0x9B2C8B89, drawable=-235572285, albedo=693269532, normal=-1628815956, material=-1225560080, palette=-783849117, tint0=26, tint1=26, tint2=26}, -- -1691579511
                    {category=0x9925C067, drawable=-1445952582, albedo=46335032, normal=2020870091, material=-2140740800, palette=-76459397, tint0=0, tint1=17, tint2=17}, -- -1725579161 
                },
            },
            [28] = {
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][28],
                clothes = {
                    {category=0x96EDAE5C, drawable=-513552989, albedo=384223714, normal=457070985, material=-1611477825, palette=0, tint0=0, tint1=0, tint2=0}, -- -1762808228
                    {category=0x1D4C528A, drawable=799583740, albedo=40000741, normal=1551945942, material=-843068101, palette=-183908539, tint0=189, tint1=14, tint2=5}, -- 491541130
                    {category=0xB3966C9, drawable=-1446561450, albedo=-542241787, normal=-843436149, material=1800424428, palette=0, tint0=0, tint1=0, tint2=0}, -- 188311241
                    {category=0x485EE834, drawable=1778307874, albedo=-9988198, normal=149478346, material=-1426919135, palette=-183908539, tint0=60, tint1=98, tint2=14}, -- 1214179380
                    {category=0x9B2C8B89, drawable=-235572285, albedo=693269532, normal=-1628815956, material=-1225560080, palette=-183908539, tint0=0, tint1=1, tint2=14}, -- -1691579511
                    {category=0x9925C067, drawable=1533014470, albedo=-1609118041, normal=-1374909416, material=1508790890, palette=864404955, tint0=54, tint1=37, tint2=39}, -- -1725579161
                    {category=0x3F7F3587, drawable=582521430, albedo=-1125093656, normal=-741662607, material=1627473259, palette=0, tint0=0, tint1=0, tint2=0}, -- 1065301383
                },
            },
            [29] = {
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][29],
                clothes = {
                    {category=0x96EDAE5C, drawable=-1439539395, albedo=528025401, normal=46748413, material=947155584, palette=0, tint0=0, tint1=0, tint2=0}, -- -1762808228
                    {category=0x1D4C528A, drawable=326335146, albedo=-1610489999, normal=618331041, material=-725524332, palette=-183908539, tint0=190, tint1=10, tint2=6}, -- 491541130
                    {category=0xB3966C9, drawable=402953675, albedo=-542241787, normal=-843436149, material=1800424428, palette=0, tint0=0, tint1=0, tint2=0}, -- 188311241
                    {category=0xE06D30CE, drawable=-197087928, albedo=-2010712594, normal=-1793615929, material=-1053924690, palette=-783849117, tint0=5, tint1=28, tint2=11}, -- -529714994
                    {category=0x9B2C8B89, drawable=640036974, albedo=693269532, normal=-1628815956, material=-1225560080, palette=-183908539, tint0=0, tint1=0, tint2=0}, -- -1691579511
                    {category=0x9925C067, drawable=1656204760, albedo=2077320610, normal=-2022383379, material=-1725560418, palette=864404955, tint0=55, tint1=21, tint2=21}, -- -1725579161
                    {category=0x3F7F3587, drawable=-1095012490, albedo=-136827380, normal=727388561, material=-1534084000, palette=-1436165981, tint0=3, tint1=3, tint2=3}, -- 1065301383
                },
            },
            [30] = {
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][30],
                clothes = {
                    {category=0x96EDAE5C, drawable=-1439539395, albedo=528025401, normal=46748413, material=947155584, palette=-1436165981, tint0=0, tint1=0, tint2=0}, -- -1762808228
                    {category=0x1D4C528A, drawable=-138461438, albedo=-1917680642, normal=-1008175587, material=-2131795727, palette=-183908539, tint0=200, tint1=47, tint2=15}, -- 491541130
                    {category=0xB3966C9, drawable=-1129422788, albedo=-542241787, normal=-843436149, material=1800424428, palette=-1436165981, tint0=0, tint1=0, tint2=0}, -- 188311241
                    {category=0x485EE834, drawable=-1774035917, albedo=-508801734, normal=25801510, material=2124866966, palette=-113397560, tint0=127, tint1=248, tint2=44}, -- 1214179380
                    {category=0x9B2C8B89, drawable=-235572285, albedo=693269532, normal=-1628815956, material=-1225560080, palette=-183908539, tint0=7, tint1=7, tint2=7}, -- -1691579511
                    {category=0x3F7F3587, drawable=-846587472, albedo=-136827380, normal=727388561, material=-1534084000, palette=-76459397, tint0=7, tint1=7, tint2=7}, -- 1065301383
                    {category=0x9925C067, drawable=1656204760, albedo=2077320610, normal=-2022383379, material=-1725560418, palette=864404955, tint0=55, tint1=21, tint2=21}, -- -1725579161
                },
            },
            [31] = {
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][31],
                clothes = {
                    {category=0x96EDAE5C, drawable=-710199758, albedo=302991810, normal=-1941221196, material=-633023678, palette=0, tint0=0, tint1=0, tint2=0}, -- -1762808228
                    {category=0x7A96FACA, drawable=1684176173, albedo=508297576, normal=-865358364, material=-243616168, palette=-1436165981, tint0=21, tint1=21, tint2=21}, -- 2056714954
                    {category=0x1D4C528A, drawable=-1955436082, albedo=1685127659, normal=158006089, material=1395696470, palette=-183908539, tint0=65, tint1=24, tint2=21}, -- 491541130
                    {category=0xB3966C9, drawable=-1129422788, albedo=-542241787, normal=-843436149, material=1800424428, palette=-1436165981, tint0=0, tint1=0, tint2=0}, -- 188311241
                    {category=0xE06D30CE, drawable=-1595974063, albedo=298585444, normal=-830571678, material=-372689521, palette=-1436165981, tint0=21, tint1=15, tint2=78}, -- -529714994
                    {category=0x9B2C8B89, drawable=470632819, albedo=797217307, normal=1283957305, material=-350065273, palette=-783849117, tint0=19, tint1=33, tint2=27}, -- -1691579511
                    {category=0x9925C067, drawable=689963931, albedo=392948981, normal=1251975365, material=469609248, palette=-76459397, tint0=95, tint1=26, tint2=95}, -- -1725579161 
                },
            },
            [32] = {
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][32],
                clothes = {
                    {category=0x96EDAE5C, drawable=-1439539395, albedo=528025401, normal=46748413, material=947155584, palette=0, tint0=0, tint1=0, tint2=0}, -- -1762808228
                    {category=0x7A96FACA, drawable=1981179144, albedo=1019315718, normal=1563869863, material=-1478366495, palette=-1436165981, tint0=21, tint1=250, tint2=250}, -- 2056714954
                    {category=0x1D4C528A, drawable=-1955436082, albedo=1685127659, normal=158006089, material=1395696470, palette=-1436165981, tint0=155, tint1=254, tint2=253}, -- 491541130
                    {category=0xB3966C9, drawable=-1129422788, albedo=-542241787, normal=-843436149, material=1800424428, palette=-1436165981, tint0=0, tint1=0, tint2=0}, -- 188311241
                    {category=0xE06D30CE, drawable=1045805263, albedo=1687752693, normal=1868005180, material=1315293422, palette=-1436165981, tint0=20, tint1=15, tint2=47}, -- -529714994
                    {category=0x9B2C8B89, drawable=640036974, albedo=797217307, normal=1283957305, material=-350065273, palette=-783849117, tint0=33, tint1=33, tint2=33}, -- -1691579511
                    {category=0x9925C067, drawable=689963931, albedo=392948981, normal=1251975365, material=469609248, palette=-76459397, tint0=18, tint1=12, tint2=85}, -- -1725579161
                    {category=0x3F7F3587, drawable=-317816448, albedo=1091825667, normal=1516997826, material=-1902665200, palette=-1436165981, tint0=0, tint1=0, tint2=0}, -- 1065301383
                },
            }, 
        },
        prison = {
            [1] = { -- prizonier
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][33],
                clothes = {
                    {category=0x1D4C528A, drawable=-191387767, albedo=-1880217208, normal=-509671880, material=-318584341, palette=-1436165981, tint0=56, tint1=21, tint2=56}, -- 491541130
                    {category=0x777EC6EF, drawable=1640060077, albedo=-1739103350, normal=32228037, material=-881930859, palette=-183908539, tint0=66, tint1=83, tint2=98}, -- 2004797167
                    {category=0xB3966C9, drawable=-863732016, albedo=-542241787, normal=1725041356, material=1800424428, palette=-1436165981, tint0=0, tint1=0, tint2=0}, -- 188311241
                    {category=0x2026C46D, drawable=1298870604, albedo=1144720348, normal=496731875, material=-1151469321, palette=-1436165981, tint0=41, tint1=21, tint2=56}, -- 539411565 
                },
            }, 
        },
        doctor = {
            [1] = {
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][34],        
                clothes = {
                    {category=0x79D7DF96, drawable=-190432557, albedo=1198133757, normal=-182344719, material=1642198167, palette=0, tint0=0, tint1=0, tint2=0}, -- -503809350
                    {category=0x1D4C528A, drawable=1723942258, albedo=2112509777, normal=690069542, material=1838257263, palette=1734720533, tint0=0, tint1=20, tint2=21}, -- 491541130
                    {category=0x777EC6EF, drawable=1337344056, albedo=-50676366, normal=-521907831, material=-1776057685, palette=0, tint0=0, tint1=0, tint2=0}, -- 2004797167
                    {category=0xB3966C9, drawable=1003128393, albedo=-1550158509, normal=1725041356, material=1800424428, palette=-1698476236, tint0=0, tint1=0, tint2=0}, -- 188311241
                    {category=0x2026C46D, drawable=432279179, albedo=-1432286807, normal=1189725944, material=-1061914318, palette=0, tint0=0, tint1=0, tint2=0}, -- 539411565
                    {category=0xE06D30CE, drawable=-422432824, albedo=-778562152, normal=840346275, material=-357944286, palette=0, tint0=0, tint1=0, tint2=0}, -- -529714994 
                    {category=0x485EE834, drawable=1080665738, albedo=-1480824467, normal=-1358925947, material=-467873710, palette=0, tint0=0, tint1=0, tint2=0}, -- 1214179380
                },
            },  
            [2] = {
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][35],        
                clothes = { 
                    {category=0x7A96FACA, drawable=1736916977, albedo=859590470, normal=849440494, material=-186402972, palette=0, tint0=0, tint1=0, tint2=0}, -- -1052460486
                    {category=0x1D4C528A, drawable=-403694760, albedo=1666639941, normal=-1174818323, material=1246688797, palette=0, tint0=0, tint1=0, tint2=0}, -- 491541130
                    {category=0x777EC6EF, drawable=-139192076, albedo=1234622162, normal=792332941, material=1294286984, palette=0, tint0=0, tint1=0, tint2=0}, -- 2004797167
                    {category=0xB3966C9, drawable=-522692150, albedo=-1045623586, normal=-843436149, material=1800424428, palette=0, tint0=0, tint1=0, tint2=0}, -- 188311241
                    {category=0xE06D30CE, drawable=-739396586, albedo=-1700116836, normal=204620498, material=636391252, palette=-1436165981, tint0=0, tint1=0, tint2=0}, -- -529714994 
                },
            },  
            [3] = {
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][36],        
                clothes = { 
                    {category=0x7A96FACA, drawable=1736916977, albedo=859590470, normal=849440494, material=-186402972, palette=0, tint0=0, tint1=0, tint2=0}, -- -1052460486
                    {category=0x1D4C528A, drawable=-403694760, albedo=1666639941, normal=-1174818323, material=1246688797, palette=0, tint0=0, tint1=0, tint2=0}, -- 491541130
                    {category=0x777EC6EF, drawable=-139192076, albedo=1234622162, normal=792332941, material=1294286984, palette=0, tint0=0, tint1=0, tint2=0}, -- 2004797167
                    {category=0xB3966C9, drawable=-522692150, albedo=-1045623586, normal=-843436149, material=1800424428, palette=0, tint0=0, tint1=0, tint2=0}, -- 188311241
                    {category=0xE06D30CE, drawable=-739396586, albedo=-1700116836, normal=204620498, material=636391252, palette=-1436165981, tint0=0, tint1=0, tint2=0}, -- -529714994
                    {category=0x9925C067, drawable=1378158597, albedo=1104760186, normal=-1687547374, material=1654578723, palette=0, tint0=0, tint1=0, tint2=0}, -- -1725579161 
                },
            },  
            [4] = {
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][37],        
                clothes = { 
                    {category=0x7A96FACA, drawable=-14800051, albedo=1019315718, normal=1563869863, material=-1478366495, palette=-1436165981, tint0=137, tint1=137, tint2=137}, -- -1052460486
                    {category=0x1D4C528A, drawable=1062524676, albedo=-1322666109, normal=-335913858, material=-1021445462, palette=0, tint0=0, tint1=0, tint2=0}, -- 491541130
                    {category=0x777EC6EF, drawable=949484857, albedo=1357281007, normal=-660698115, material=-961263195, palette=0, tint0=0, tint1=0, tint2=0}, -- 2004797167
                    {category=0xB3966C9, drawable=1887902871, albedo=-1550158509, normal=1173544845, material=1800424428, palette=-1436165981, tint0=0, tint1=0, tint2=0}, -- 188311241
                    {category=0x2026C46D, drawable=-1454851511, albedo=800772200, normal=-776860660, material=1117586156, palette=0, tint0=0, tint1=0, tint2=0}, -- 539411565
                    {category=0x485EE834, drawable=1080665738, albedo=-1480824467, normal=-1358925947, material=-467873710, palette=0, tint0=0, tint1=0, tint2=0}, -- 1214179380 
                },
            }, 
            [5] = {
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][38],        
                clothes = { 
                    {category=0x96EDAE5C, drawable=-1439539395, albedo=528025401, normal=46748413, material=947155584, palette=-1529893936, tint0=0, tint1=0, tint2=0}, -- -1762808228
                    {category=0x1D4C528A, drawable=1723942258, albedo=2112509777, normal=690069542, material=1838257263, palette=1734720533, tint0=0, tint1=20, tint2=21}, -- 491541130
                    {category=0xB3966C9, drawable=-1129422788, albedo=-542241787, normal=-843436149, material=1800424428, palette=-1436165981, tint0=0, tint1=0, tint2=0}, -- 188311241 
                    {category=0xE06D30CE, drawable=2129473303, albedo=-1715110074, normal=-641624863, material=-1850234415, palette=1090645383, tint0=15, tint1=8, tint2=21}, -- -529714994
                },
            },       
            [6] = {
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][39],        
                clothes = { 
                    {category=0x96EDAE5C, drawable=-1439539395, albedo=528025401, normal=46748413, material=947155584, palette=0, tint0=0, tint1=0, tint2=0}, -- -1762808228
                    {category=0x7A96FACA, drawable=744500516, albedo=-215233343, normal=-511387333, material=-1732316548, palette=-1436165981, tint0=21, tint1=21, tint2=21}, -- 2056714954
                    {category=0x1D4C528A, drawable=1723942258, albedo=2112509777, normal=690069542, material=1838257263, palette=1734720533, tint0=0, tint1=20, tint2=21}, -- 491541130
                    {category=0xB3966C9, drawable=-1129422788, albedo=-542241787, normal=-843436149, material=1800424428, palette=0, tint0=0, tint1=0, tint2=0}, -- 188311241
                    {category=0xE06D30CE, drawable=2051076135, albedo=-1483765548, normal=2038285849, material=-1718303533, palette=1090645383, tint0=144, tint1=16, tint2=16}, -- -529714994
                },
            },       
            [7] = {
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][40],        
                clothes = { 
                    {category=0x96EDAE5C, drawable=-1439539395, albedo=528025401, normal=46748413, material=947155584, palette=-1529893936, tint0=0, tint1=0, tint2=0}, -- -1762808228
                    {category=0x1D4C528A, drawable=1723942258, albedo=2112509777, normal=690069542, material=1838257263, palette=-183908539, tint0=0, tint1=0, tint2=0}, -- 491541130
                    {category=0xB3966C9, drawable=-1129422788, albedo=-542241787, normal=-843436149, material=1800424428, palette=-1436165981, tint0=0, tint1=0, tint2=0}, -- 188311241 
                    {category=0xE06D30CE, drawable=2129473303, albedo=-1715110074, normal=-641624863, material=-1850234415, palette=1090645383, tint0=15, tint1=8, tint2=21}, -- -529714994
                },
            },       
        },
        miner = {
            [1] = {
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][41],
                clothes = {
                    {category=0xB3966C9, drawable=-1129422788, albedo=-542241787, normal=-843436149, material=1800424428, palette=0, tint0=0, tint1=0, tint2=0}, -- 188311241
                    {category=0x2026C46D, drawable=-812698334, albedo=715130297, normal=-1571270412, material=-936347143, palette=-1436165981, tint0=15, tint1=15, tint2=15}, -- 539411565
                    {category=0xE06D30CE, drawable=-2063750837, albedo=558805409, normal=-186153921, material=-1849014771, palette=-1436165981, tint0=19, tint1=21, tint2=21}, -- -529714994
                    {category=0x9925C067, drawable=213896827, albedo=795943031, normal=1290268429, material=-388326440, palette=-76459397, tint0=22, tint1=10, tint2=96}, -- -1725579161
                    {category=0x3F7DB302, drawable=-690056489, albedo=2047213176, normal=-31265558, material=-784575965, palette=-183908539, tint0=200, tint1=28, tint2=192}, -- 1065202434
                    {category=0x96EDAE5C, drawable=-1439539395, albedo=604363614, normal=46748413, material=947155584, palette=-783849117, tint0=0, tint1=0, tint2=0}, -- -1762808228
                },
            },
            [2] = {
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][42],
                clothes = { 
                    {category=0x9925C067, drawable=213896827, albedo=795943031, normal=1290268429, material=-388326440, palette=-76459397, tint0=22, tint1=10, tint2=96}, -- -1725579161 
                },
            },
        },
        gentleman = {
            [1] = {
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][43],        
                clothes = {
                    {category=0x96EDAE5C, drawable=-1439539395, albedo=528025401, normal=46748413, material=947155584, palette=0, tint0=0, tint1=0, tint2=0}, -- -1762808228
                    {category=0x7A96FACA, drawable=123395723, albedo=-1717707909, normal=1847113433, material=1759818788, palette=1090645383, tint0=21, tint1=21, tint2=21}, -- 2056714954
                    {category=0x1D4C528A, drawable=267711189, albedo=1042539678, normal=-426627649, material=361432629, palette=-183908539, tint0=200, tint1=1, tint2=3}, -- 491541130
                    {category=0xB3966C9, drawable=-1129422788, albedo=-542241787, normal=-843436149, material=1800424428, palette=-1436165981, tint0=0, tint1=0, tint2=0}, -- 188311241
                    {category=0xE06D30CE, drawable=82282646, albedo=298585444, normal=-830571678, material=-372689521, palette=1090645383, tint0=143, tint1=15, tint2=142}, -- -529714994
                    {category=0x9925C067, drawable=-143286509, albedo=-1616330501, normal=1998993597, material=1412418863, palette=864404955, tint0=142, tint1=142, tint2=40}, -- -1725579161
                },
            },  
            [2] = {
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][44],        
                clothes = { 
                    {category=0x96EDAE5C, drawable=-1439539395, albedo=528025401, normal=46748413, material=947155584, palette=-1436165981, tint0=89, tint1=89, tint2=50}, -- -1762808228
                    {category=0x7A96FACA, drawable=2002760033, albedo=-162601034, normal=-1607008042, material=474770411, palette=-76459397, tint0=21, tint1=21, tint2=21}, -- 2056714954
                    {category=0x1D4C528A, drawable=267711189, albedo=404731488, normal=-426627649, material=361432629, palette=-183908539, tint0=66, tint1=1, tint2=14}, -- 491541130
                    {category=0xB3966C9, drawable=-1129422788, albedo=-542241787, normal=-843436149, material=1800424428, palette=1734720533, tint0=0, tint1=0, tint2=0}, -- 188311241
                    {category=0xE06D30CE, drawable=-160077102, albedo=1687752693, normal=1868005180, material=1315293422, palette=1090645383, tint0=141, tint1=15, tint2=37}, -- -529714994
                    {category=0x9925C067, drawable=689963931, albedo=392948981, normal=1251975365, material=469609248, palette=864404955, tint0=21, tint1=47, tint2=19}, -- -1725579161
                },
            },  
            [3] = {
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][45],        
                clothes = { 
                    {category=0x96EDAE5C, drawable=-1439539395, albedo=528025401, normal=46748413, material=947155584, palette=-1436165981, tint0=21, tint1=41, tint2=20}, -- -1762808228
                    {category=0x7A96FACA, drawable=-1149449097, albedo=-1165865879, normal=1492866797, material=-1187329244, palette=-1436165981, tint0=21, tint1=21, tint2=21}, -- 2056714954
                    {category=0x1D4C528A, drawable=1723942258, albedo=-74923716, normal=-240756558, material=-1813972057, palette=-183908539, tint0=66, tint1=1, tint2=46}, -- 491541130
                    {category=0xB3966C9, drawable=-1129422788, albedo=-542241787, normal=-843436149, material=1800424428, palette=-76459397, tint0=0, tint1=0, tint2=0}, -- 188311241
                    {category=0xE06D30CE, drawable=-1769133885, albedo=1063326208, normal=2074889474, material=919608667, palette=1090645383, tint0=21, tint1=15, tint2=154}, -- -529714994
                    {category=0x9925C067, drawable=966700612, albedo=552573178, normal=-1073380292, material=-1899463171, palette=864404955, tint0=21, tint1=36, tint2=21}, -- -1725579161
                },
            },  
            [4] = {
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][46],        
                clothes = { 
                    {category=0x96EDAE5C, drawable=-1439539395, albedo=604363614, normal=46748413, material=947155584, palette=-783849117, tint0=0, tint1=0, tint2=0}, -- -1762808228
                    {category=0x7A96FACA, drawable=1497852285, albedo=1459812439, normal=-510628925, material=-56618563, palette=-1436165981, tint0=76, tint1=76, tint2=76}, -- 2056714954
                    {category=0x1D4C528A, drawable=1723942258, albedo=2112509777, normal=690069542, material=1838257263, palette=-183908539, tint0=61, tint1=0, tint2=61}, -- 491541130
                    {category=0xB3966C9, drawable=-1129422788, albedo=-1793453564, normal=-843436149, material=1800424428, palette=-1698476236, tint0=0, tint1=0, tint2=0}, -- 188311241
                    {category=0xE06D30CE, drawable=-200316618, albedo=-1132900948, normal=-1523890844, material=1863383117, palette=-1436165981, tint0=141, tint1=16, tint2=141}, -- -529714994
                },
            },    
            [5] = {
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][47],        
                clothes = { 
                    {category=0x96EDAE5C, drawable=-1439539395, albedo=528025401, normal=46748413, material=947155584, palette=0, tint0=0, tint1=0, tint2=0}, -- -1762808228
                    {category=0x7A96FACA, drawable=-427919278, albedo=-1717707909, normal=1847113433, material=1759818788, palette=-1436165981, tint0=21, tint1=20, tint2=20}, -- 2056714954
                    {category=0x1D4C528A, drawable=267711189, albedo=404731488, normal=-426627649, material=361432629, palette=-183908539, tint0=64, tint1=0, tint2=0}, -- 491541130
                    {category=0xB3966C9, drawable=-1129422788, albedo=-542241787, normal=-843436149, material=1800424428, palette=-76459397, tint0=19, tint1=54, tint2=21}, -- 188311241
                    {category=0xE06D30CE, drawable=1372495683, albedo=94260373, normal=1225673780, material=-59759722, palette=-1436165981, tint0=20, tint1=15, tint2=78}, -- -529714994
                    {category=0x9925C067, drawable=-1197277352, albedo=439504349, normal=-1597866672, material=-312768709, palette=-76459397, tint0=94, tint1=91, tint2=93}, -- -1725579161
                },
            },  
            [6] = {
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][48],        
                clothes = { 
                    {category=0x96EDAE5C, drawable=-1439539395, albedo=528025401, normal=46748413, material=947155584, palette=-783849117, tint0=0, tint1=0, tint2=0}, -- -1762808228
                    {category=0x7A96FACA, drawable=837466449, albedo=-1309302949, normal=-1276378341, material=-1470214039, palette=-1436165981, tint0=21, tint1=21, tint2=21}, -- 2056714954
                    {category=0x1D4C528A, drawable=1723942258, albedo=2112509777, normal=690069542, material=1838257263, palette=-183908539, tint0=66, tint1=19, tint2=18}, -- 491541130
                    {category=0xB3966C9, drawable=-1129422788, albedo=-1793453564, normal=-843436149, material=1800424428, palette=-1698476236, tint0=9, tint1=1, tint2=1}, -- 188311241
                    {category=0xE06D30CE, drawable=2051076135, albedo=-1483765548, normal=2038285849, material=-1718303533, palette=-1436165981, tint0=21, tint1=16, tint2=146}, -- -529714994
                },
            },  
            [7] = {
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][49],        
                clothes = { 
                    {category=0x96EDAE5C, drawable=-1439539395, albedo=604363614, normal=46748413, material=947155584, palette=-783849117, tint0=0, tint1=0, tint2=0}, -- -1762808228
                    {category=0x7A96FACA, drawable=2124009862, albedo=-702365097, normal=1770252921, material=-1974920264, palette=-1436165981, tint0=21, tint1=21, tint2=21}, -- 2056714954
                    {category=0x1D4C528A, drawable=1723942258, albedo=2112509777, normal=690069542, material=1838257263, palette=-183908539, tint0=63, tint1=0, tint2=0}, -- 491541130
                    {category=0xB3966C9, drawable=-1129422788, albedo=-542241787, normal=-843436149, material=1800424428, palette=-1436165981, tint0=23, tint1=87, tint2=57}, -- 188311241
                    {category=0xE06D30CE, drawable=82282646, albedo=298585444, normal=-830571678, material=-372689521, palette=-1436165981, tint0=36, tint1=16, tint2=20}, -- -529714994
                    {category=0x9925C067, drawable=774869338, albedo=-901879130, normal=1009972241, material=746919296, palette=-76459397, tint0=28, tint1=28, tint2=28}, -- -1725579161
                },
            },  
            [8] = {
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][50],        
                clothes = { 
                    {category=0x96EDAE5C, drawable=-1439539395, albedo=528025401, normal=46748413, material=947155584, palette=0, tint0=0, tint1=0, tint2=0}, -- -1762808228
                    {category=0x7A96FACA, drawable=-1873870582, albedo=879139455, normal=-825582336, material=1519560985, palette=-1436165981, tint0=20, tint1=20, tint2=20}, -- 2056714954
                    {category=0x1D4C528A, drawable=1723942258, albedo=2112509777, normal=690069542, material=1838257263, palette=1090645383, tint0=253, tint1=254, tint2=253}, -- 491541130
                    {category=0xE06D30CE, drawable=2051076135, albedo=-1483765548, normal=2038285849, material=-1718303533, palette=1090645383, tint0=78, tint1=15, tint2=58}, -- -529714994
                    {category=0xEABE0032, drawable=-397407957, albedo=-714916835, normal=-1978155534, material=-1195006570, palette=1090645383, tint0=16, tint1=17, tint2=17}, -- -356646862
                },
            },  
            [9] = {
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][51],        
                clothes = { 
                    {category=0x96EDAE5C, drawable=-1439539395, albedo=528025401, normal=46748413, material=947155584, palette=0, tint0=0, tint1=0, tint2=0}, -- -1762808228
                    {category=0x7A96FACA, drawable=837466449, albedo=-1309302949, normal=-1276378341, material=-1470214039, palette=864404955, tint0=253, tint1=254, tint2=155}, -- 2056714954
                    {category=0x1D4C528A, drawable=267711189, albedo=404731488, normal=-426627649, material=361432629, palette=1090645383, tint0=19, tint1=246, tint2=251}, -- 491541130
                    {category=0xB3966C9, drawable=-1129422788, albedo=-1062117214, normal=-843436149, material=1800424428, palette=-1698476236, tint0=0, tint1=0, tint2=0}, -- 188311241
                    {category=0xE06D30CE, drawable=1372495683, albedo=94260373, normal=1225673780, material=-59759722, palette=1090645383, tint0=241, tint1=8, tint2=139}, -- -529714994
                    {category=0x9925C067, drawable=546700339, albedo=1382966405, normal=1432238265, material=1408927469, palette=864404955, tint0=254, tint1=246, tint2=253}, -- -1725579161
                },
            },  
            [10] = {
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][52],        
                clothes = { 
                    {category=0x96EDAE5C, drawable=-1439539395, albedo=604363614, normal=46748413, material=947155584, palette=-1436165981, tint0=0, tint1=0, tint2=0}, -- -1762808228
                    {category=0x7A96FACA, drawable=-62108143, albedo=-162601034, normal=-866793231, material=-135863371, palette=1090645383, tint0=254, tint1=253, tint2=19}, -- 2056714954
                    {category=0x1D4C528A, drawable=1723942258, albedo=2112509777, normal=690069542, material=1838257263, palette=1090645383, tint0=254, tint1=254, tint2=19}, -- 491541130
                    {category=0xB3966C9, drawable=-1129422788, albedo=-133621342, normal=-843436149, material=1800424428, palette=-1436165981, tint0=9, tint1=9, tint2=9}, -- 188311241
                    {category=0xE06D30CE, drawable=858799924, albedo=459618640, normal=469084545, material=-1885169175, palette=1090645383, tint0=20, tint1=240, tint2=242}, -- -529714994
                    {category=0x485EE834, drawable=-1002020229, albedo=-664069178, normal=-1809660868, material=1331104694, palette=1090645383, tint0=16, tint1=250, tint2=252}, -- 1214179380
                    {category=0x9B2C8B89, drawable=1893381322, albedo=282205715, normal=-1311513249, material=2047130097, palette=1669565057, tint0=254, tint1=254, tint2=241}, -- -1691579511
                },
            },  
            [11] = {
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][53],        
                clothes = { 
                    {category=0x96EDAE5C, drawable=-1439539395, albedo=604363614, normal=46748413, material=947155584, palette=-1436165981, tint0=0, tint1=0, tint2=0}, -- -1762808228
                    {category=0x7A96FACA, drawable=-427919278, albedo=-1717707909, normal=1847113433, material=1759818788, palette=-113397560, tint0=75, tint1=74, tint2=73}, -- 2056714954
                    {category=0x1D4C528A, drawable=1723942258, albedo=2112509777, normal=690069542, material=1838257263, palette=17129595, tint0=254, tint1=251, tint2=251}, -- 491541130
                    {category=0xB3966C9, drawable=-1129422788, albedo=-133621342, normal=-843436149, material=1800424428, palette=-1436165981, tint0=9, tint1=9, tint2=9}, -- 188311241
                    {category=0xE06D30CE, drawable=858799924, albedo=459618640, normal=469084545, material=-1885169175, palette=1090645383, tint0=20, tint1=251, tint2=254}, -- -529714994
                    {category=0x485EE834, drawable=-1002020229, albedo=-288493029, normal=-1809660868, material=1331104694, palette=1090645383, tint0=16, tint1=21, tint2=253}, -- 1214179380
                    {category=0x9B2C8B89, drawable=1893381322, albedo=282205715, normal=-1311513249, material=2047130097, palette=1669565057, tint0=254, tint1=254, tint2=253}, -- -1691579511
                },
            },  
            [12] = {
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][54],        
                clothes = { 
                    {category=0x96EDAE5C, drawable=-1439539395, albedo=528025401, normal=46748413, material=947155584, palette=-76459397, tint0=0, tint1=0, tint2=0}, -- -1762808228
                    {category=0x7A96FACA, drawable=-427919278, albedo=-1717707909, normal=1847113433, material=1759818788, palette=-1436165981, tint0=21, tint1=21, tint2=21}, -- 2056714954
                    {category=0x1D4C528A, drawable=1723942258, albedo=2112509777, normal=690069542, material=1838257263, palette=-183908539, tint0=188, tint1=0, tint2=0}, -- 491541130
                    {category=0xE06D30CE, drawable=1372495683, albedo=94260373, normal=1225673780, material=-59759722, palette=-1436165981, tint0=155, tint1=15, tint2=18}, -- -529714994
                    {category=0x9925C067, drawable=-143286509, albedo=-1616330501, normal=1998993597, material=1412418863, palette=-1436165981, tint0=155, tint1=21, tint2=155}, -- -1725579161
                    {category=0xEABE0032, drawable=-397407957, albedo=-714916835, normal=-1978155534, material=-1195006570, palette=-76459397, tint0=0, tint1=21, tint2=42}, -- -356646862
                },
            },  
            [13] = {
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][55],        
                clothes = { 
                    {category=0x96EDAE5C, drawable=-1000238177, albedo=860485841, normal=-1120366532, material=-1435693698, palette=0, tint0=0, tint1=0, tint2=0}, -- -1762808228
                    {category=0x7A96FACA, drawable=-645182326, albedo=909007475, normal=-925573893, material=320521240, palette=1090645383, tint0=20, tint1=17, tint2=15}, -- 2056714954
                    {category=0x1D4C528A, drawable=267711189, albedo=404731488, normal=-426627649, material=361432629, palette=-183908539, tint0=66, tint1=1, tint2=1}, -- 491541130
                    {category=0xB3966C9, drawable=-1129422788, albedo=-542241787, normal=-843436149, material=1800424428, palette=-1436165981, tint0=0, tint1=0, tint2=0}, -- 188311241
                    {category=0xE06D30CE, drawable=-2000515794, albedo=-1565173757, normal=-605098981, material=-1693727507, palette=1090645383, tint0=48, tint1=16, tint2=78}, -- -529714994
                    {category=0x9B2C8B89, drawable=26472755, albedo=-319554700, normal=2081262199, material=-43473175, palette=-783849117, tint0=5, tint1=5, tint2=5}, -- -1691579511
                    {category=0x9925C067, drawable=-229861899, albedo=1775010137, normal=1334630754, material=1506947571, palette=864404955, tint0=21, tint1=20, tint2=19}, -- -1725579161
                },
            },  
            [14] = {
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][56],        
                clothes = { 
                    {category=0x96EDAE5C, drawable=-1439539395, albedo=528025401, normal=46748413, material=947155584, palette=0, tint0=0, tint1=0, tint2=0}, -- -1762808228
                    {category=0x1D4C528A, drawable=1723942258, albedo=2112509777, normal=690069542, material=1838257263, palette=-183908539, tint0=66, tint1=14, tint2=66}, -- 491541130
                    {category=0xB3966C9, drawable=402953675, albedo=-542241787, normal=-843436149, material=1800424428, palette=-1436165981, tint0=0, tint1=0, tint2=0}, -- 188311241
                    {category=0x2026C46D, drawable=-533785224, albedo=-932416797, normal=1252121788, material=-1575863649, palette=1090645383, tint0=21, tint1=16, tint2=21}, -- 539411565
                },
            },  
            [15] = {
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][57],        
                clothes = { 
                    {category=0x96EDAE5C, drawable=-1439539395, albedo=528025401, normal=46748413, material=947155584, palette=-783849117, tint0=0, tint1=0, tint2=0}, -- -1762808228
                    {category=0x7A96FACA, drawable=837466449, albedo=-1309302949, normal=-1276378341, material=-1470214039, palette=-783849117, tint0=0, tint1=0, tint2=0}, -- 2056714954
                    {category=0x1D4C528A, drawable=1723942258, albedo=2112509777, normal=690069542, material=1838257263, palette=-183908539, tint0=65, tint1=14, tint2=63}, -- 491541130
                    {category=0xE06D30CE, drawable=-2000515794, albedo=124333573, normal=-605098981, material=-1693727507, palette=1090645383, tint0=21, tint1=15, tint2=78}, -- -529714994
                    {category=0x9925C067, drawable=546700339, albedo=-434976162, normal=-1190404394, material=469760921, palette=864404955, tint0=21, tint1=78, tint2=21}, -- -1725579161
                    {category=0xEABE0032, drawable=-35410540, albedo=1422988492, normal=971256509, material=204756558, palette=-1436165981, tint0=15, tint1=15, tint2=15}, -- -356646862
                },
            },  
            [16] = {
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][58],        
                clothes = { 
                    {category=0x96EDAE5C, drawable=-1439539395, albedo=528025401, normal=46748413, material=947155584, palette=0, tint0=0, tint1=0, tint2=0}, -- -1762808228
                    {category=0x7A96FACA, drawable=-124697040, albedo=506150540, normal=1490989471, material=-133703132, palette=-1436165981, tint0=21, tint1=21, tint2=0}, -- 2056714954
                    {category=0x1D4C528A, drawable=-1955436082, albedo=902258387, normal=158006089, material=-1074224041, palette=-183908539, tint0=65, tint1=24, tint2=17}, -- 491541130
                    {category=0xB3966C9, drawable=-1129422788, albedo=-542241787, normal=-843436149, material=1800424428, palette=-783849117, tint0=0, tint1=0, tint2=0}, -- 188311241
                    {category=0xE06D30CE, drawable=-1302865445, albedo=-1757542442, normal=1227331771, material=1656950773, palette=-1436165981, tint0=48, tint1=75, tint2=15}, -- -529714994
                    {category=0x9B2C8B89, drawable=640036974, albedo=797217307, normal=1283957305, material=-350065273, palette=-783849117, tint0=5, tint1=5, tint2=16}, -- -1691579511
                    {category=0x9925C067, drawable=199505207, albedo=1331188107, normal=-942458715, material=-1510363865, palette=-76459397, tint0=96, tint1=18, tint2=18}, -- -1725579161
                },
            },  
            [17] = {
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][59],        
                clothes = { 
                    {category=0x96EDAE5C, drawable=-1439539395, albedo=528025401, normal=46748413, material=947155584, palette=-1436165981, tint0=27, tint1=21, tint2=21}, -- -1762808228
                    {category=0x7A96FACA, drawable=2002760033, albedo=-162601034, normal=-194150642, material=474770411, palette=1090645383, tint0=21, tint1=21, tint2=21}, -- 2056714954
                    {category=0x1D4C528A, drawable=-509929950, albedo=-432267974, normal=-1845384090, material=-1041134371, palette=-183908539, tint0=94, tint1=1, tint2=14}, -- 491541130
                    {category=0xB3966C9, drawable=-1129422788, albedo=-542241787, normal=-843436149, material=1800424428, palette=-1698476236, tint0=0, tint1=0, tint2=0}, -- 188311241
                    {category=0xE06D30CE, drawable=-1769133885, albedo=-2104763636, normal=-995662583, material=-379204777, palette=1090645383, tint0=54, tint1=15, tint2=154}, -- -529714994
                    {category=0x9925C067, drawable=689963931, albedo=392948981, normal=1251975365, material=469609248, palette=864404955, tint0=52, tint1=49, tint2=21}, -- -1725579161
                },
            },  
            [18] = {
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][60],        
                clothes = { 
                    {category=0x96EDAE5C, drawable=-1439539395, albedo=528025401, normal=46748413, material=947155584, palette=0, tint0=0, tint1=0, tint2=0}, -- -1762808228
                    {category=0x7A96FACA, drawable=1065735303, albedo=1019315718, normal=1563869863, material=-1478366495, palette=-1436165981, tint0=159, tint1=159, tint2=159}, -- 2056714954
                    {category=0x1D4C528A, drawable=-1468161975, albedo=194686416, normal=949039566, material=-657370328, palette=-1436165981, tint0=49, tint1=145, tint2=177}, -- 491541130
                    {category=0x777EC6EF, drawable=1640060077, albedo=-1321663475, normal=524026779, material=-907833863, palette=-783849117, tint0=9, tint1=20, tint2=66}, -- 2004797167
                    {category=0xB3966C9, drawable=-1129422788, albedo=-542241787, normal=-843436149, material=1800424428, palette=0, tint0=0, tint1=0, tint2=0}, -- 188311241
                    {category=0xE06D30CE, drawable=-336332142, albedo=-1355649664, normal=953266864, material=-1450926395, palette=-1436165981, tint0=49, tint1=158, tint2=148}, -- -529714994
                    {category=0x485EE834, drawable=474606725, albedo=-2139082987, normal=1138501913, material=81350210, palette=1090645383, tint0=15, tint1=152, tint2=241}, -- 1214179380
                    {category=0x9925C067, drawable=689963931, albedo=392948981, normal=1251975365, material=469609248, palette=1669565057, tint0=241, tint1=152, tint2=21}, -- -1725579161
                },
            },  
            [19] = {
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][61],        
                clothes = { 
                    {category=0xB3966C9, drawable=-1129422788, albedo=-542241787, normal=-843436149, material=1800424428, palette=-76459397, tint0=124, tint1=15, tint2=60}, -- 188311241
                    {category=0xB6B63737, drawable=-141945924, albedo=-122711323, normal=2121174521, material=-184742647, palette=-76459397, tint0=23, tint1=54, tint2=70}, -- -1229572297
                    {category=0x9925C067, drawable=-143286509, albedo=1057558603, normal=471105299, material=679020824, palette=-76459397, tint0=23, tint1=127, tint2=23}, -- -1725579161
                    {category=0x96EDAE5C, drawable=-710199758, albedo=302991810, normal=-1941221196, material=-633023678, palette=0, tint0=0, tint1=0, tint2=0}, -- -1762808228
                    {category=0x7A96FACA, drawable=837466449, albedo=-915329420, normal=269906805, material=-1395875368, palette=-1436165981, tint0=21, tint1=48, tint2=48}, -- 2056714954
                    {category=0x1D4C528A, drawable=-1955436082, albedo=1685127659, normal=158006089, material=1395696470, palette=-183908539, tint0=66, tint1=14, tint2=21}, -- 491541130
                    {category=0xB3966C9, drawable=-1129422788, albedo=-542241787, normal=-843436149, material=1800424428, palette=-1436165981, tint0=0, tint1=0, tint2=0}, -- 188311241
                    {category=0xE06D30CE, drawable=572277507, albedo=-709785379, normal=955881008, material=-1642302516, palette=1090645383, tint0=21, tint1=15, tint2=18}, -- -529714994
                    {category=0x9925C067, drawable=-229861899, albedo=-488093486, normal=-2128795877, material=689998209, palette=864404955, tint0=21, tint1=19, tint2=21}, -- -1725579161
                },
            },  
            [20] = {
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][62],        
                clothes = { 
                    {category=0x96EDAE5C, drawable=-1439539395, albedo=528025401, normal=46748413, material=947155584, palette=0, tint0=0, tint1=0, tint2=0}, -- -1762808228
                    {category=0xB3966C9, drawable=-1129422788, albedo=-542241787, normal=-843436149, material=1800424428, palette=-76459397, tint0=17, tint1=17, tint2=17}, -- 188311241
                    {category=0x9925C067, drawable=-143286509, albedo=-1616330501, normal=1998993597, material=1412418863, palette=1090645383, tint0=139, tint1=21, tint2=139}, -- -1725579161
                    {category=0x96EDAE5C, drawable=-1439539395, albedo=528025401, normal=46748413, material=947155584, palette=0, tint0=0, tint1=0, tint2=0}, -- -1762808228
                    {category=0x7A96FACA, drawable=123395723, albedo=-1717707909, normal=1847113433, material=1759818788, palette=-1436165981, tint0=77, tint1=48, tint2=48}, -- 2056714954
                    {category=0x1D4C528A, drawable=1723942258, albedo=2112509777, normal=690069542, material=1838257263, palette=-183908539, tint0=0, tint1=36, tint2=14}, -- 491541130
                    {category=0xB3966C9, drawable=-1129422788, albedo=-1062117214, normal=-843436149, material=1800424428, palette=-1698476236, tint0=0, tint1=0, tint2=0}, -- 188311241
                    {category=0x485EE834, drawable=614298120, albedo=1881404714, normal=307263431, material=-992701717, palette=-1436165981, tint0=15, tint1=21, tint2=46}, -- 1214179380
                },
            },  
            [21] = {
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][63],        
                clothes = { 
                    {category=0x96EDAE5C, drawable=-1439539395, albedo=528025401, normal=46748413, material=947155584, palette=-783849117, tint0=0, tint1=0, tint2=0}, -- -1762808228
                    {category=0x7A96FACA, drawable=837466449, albedo=-1309302949, normal=-1276378341, material=-1470214039, palette=-1436165981, tint0=21, tint1=21, tint2=21}, -- 2056714954
                    {category=0x1D4C528A, drawable=1723942258, albedo=2112509777, normal=690069542, material=1838257263, palette=-183908539, tint0=63, tint1=1, tint2=21}, -- 491541130
                    {category=0xB3966C9, drawable=-1129422788, albedo=-542241787, normal=-843436149, material=1800424428, palette=-1436165981, tint0=142, tint1=16, tint2=132}, -- 188311241
                    {category=0xE06D30CE, drawable=2051076135, albedo=-1483765548, normal=2038285849, material=-1718303533, palette=1090645383, tint0=60, tint1=15, tint2=20}, -- -529714994
                },
            },  
            [22] = {
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][64],        
                clothes = { 
                    {category=0x96EDAE5C, drawable=-1439539395, albedo=528025401, normal=46748413, material=947155584, palette=0, tint0=0, tint1=0, tint2=0}, -- -1762808228
                    {category=0x7A96FACA, drawable=63120821, albedo=1450713813, normal=-1602083928, material=-1176925563, palette=-1436165981, tint0=20, tint1=20, tint2=20}, -- 2056714954
                    {category=0x1D4C528A, drawable=1723942258, albedo=2112509777, normal=690069542, material=1838257263, palette=-183908539, tint0=64, tint1=1, tint2=66}, -- 491541130
                    {category=0xB3966C9, drawable=-1129422788, albedo=-542241787, normal=-843436149, material=1800424428, palette=-1436165981, tint0=0, tint1=0, tint2=0}, -- 188311241
                    {category=0xE06D30CE, drawable=-1251678610, albedo=904181758, normal=2066849115, material=-1495075152, palette=-1436165981, tint0=53, tint1=15, tint2=75}, -- -529714994
                },
            },  
            [23] = {
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][65],        
                clothes = { 
                    {category=0x96EDAE5C, drawable=-1439539395, albedo=528025401, normal=46748413, material=947155584, palette=0, tint0=0, tint1=0, tint2=0}, -- -1762808228
                    {category=0x7A96FACA, drawable=-1873870582, albedo=1086326204, normal=1439868821, material=-1212061506, palette=-1436165981, tint0=21, tint1=21, tint2=21}, -- 2056714954
                    {category=0x1D4C528A, drawable=1723942258, albedo=2112509777, normal=690069542, material=1838257263, palette=-183908539, tint0=0, tint1=0, tint2=0}, -- 491541130
                    {category=0xB3966C9, drawable=-1129422788, albedo=-542241787, normal=-843436149, material=1800424428, palette=-1436165981, tint0=0, tint1=0, tint2=0}, -- 188311241
                    {category=0x485EE834, drawable=833782152, albedo=1975128951, normal=518543173, material=560312040, palette=1090645383, tint0=15, tint1=75, tint2=76}, -- 1214179380
                },
            },  
            [24] = {
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][66],        
                clothes = { 
                    {category=0x96EDAE5C, drawable=-1439539395, albedo=528025401, normal=46748413, material=947155584, palette=0, tint0=0, tint1=0, tint2=0}, -- -1762808228
                    {category=0x7A96FACA, drawable=-427919278, albedo=-1717707909, normal=1847113433, material=1759818788, palette=-1436165981, tint0=254, tint1=254, tint2=254}, -- 2056714954
                    {category=0x1D4C528A, drawable=1723942258, albedo=2112509777, normal=690069542, material=1838257263, palette=-183908539, tint0=0, tint1=0, tint2=0}, -- 491541130
                    {category=0xB3966C9, drawable=-1129422788, albedo=-1062117214, normal=-843436149, material=1800424428, palette=-1698476236, tint0=0, tint1=0, tint2=0}, -- 188311241
                    {category=0xE06D30CE, drawable=-2000515794, albedo=765117617, normal=-605098981, material=-1693727507, palette=1090645383, tint0=78, tint1=15, tint2=19}, -- -529714994
                },
            },  
            [25] = {
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][67],        
                clothes = { 
                    {category=0x96EDAE5C, drawable=-1439539395, albedo=528025401, normal=46748413, material=947155584, palette=0, tint0=0, tint1=0, tint2=0}, -- -1762808228
                    {category=0x1D4C528A, drawable=1723942258, albedo=2112509777, normal=690069542, material=1838257263, palette=-183908539, tint0=62, tint1=0, tint2=66}, -- 491541130
                    {category=0x823687F5, drawable=1463804675, albedo=1150602442, normal=-1961618120, material=1201626848, palette=0, tint0=0, tint1=0, tint2=0}, -- -2110355467
                    {category=0xB3966C9, drawable=-1129422788, albedo=-1793453564, normal=-843436149, material=1800424428, palette=1734720533, tint0=0, tint1=0, tint2=0}, -- 188311241
                    {category=0xE06D30CE, drawable=1372495683, albedo=94260373, normal=1225673780, material=-59759722, palette=-1436165981, tint0=20, tint1=15, tint2=153}, -- -529714994
                },
            },  
            [26] = {
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][68],        
                clothes = { 
                    {category=0x96EDAE5C, drawable=-1439539395, albedo=604363614, normal=46748413, material=947155584, palette=-783849117, tint0=0, tint1=0, tint2=0}, -- -1762808228
                    {category=0x7A96FACA, drawable=2124009862, albedo=-702365097, normal=1770252921, material=-1974920264, palette=1090645383, tint0=49, tint1=49, tint2=49}, -- 2056714954
                    {category=0x1D4C528A, drawable=1723942258, albedo=2112509777, normal=690069542, material=1838257263, palette=-183908539, tint0=190, tint1=0, tint2=0}, -- 491541130
                    {category=0xB3966C9, drawable=-1129422788, albedo=-1793453564, normal=-843436149, material=1800424428, palette=-1698476236, tint0=23, tint1=50, tint2=19}, -- 188311241
                    {category=0xE06D30CE, drawable=82282646, albedo=298585444, normal=-830571678, material=-372689521, palette=1090645383, tint0=144, tint1=15, tint2=53}, -- -529714994
                },
            },  
            [27] = {
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][69],        
                clothes = { 
                    {category=0x96EDAE5C, drawable=-1439539395, albedo=604363614, normal=46748413, material=947155584, palette=0, tint0=0, tint1=0, tint2=0}, -- -1762808228
                    {category=0x7A96FACA, drawable=744500516, albedo=-215233343, normal=-511387333, material=-1732316548, palette=1090645383, tint0=254, tint1=254, tint2=254}, -- 2056714954
                    {category=0x1D4C528A, drawable=1723942258, albedo=2112509777, normal=690069542, material=1838257263, palette=-183908539, tint0=83, tint1=20, tint2=20}, -- 491541130
                    {category=0xB3966C9, drawable=-1129422788, albedo=-542241787, normal=-843436149, material=1800424428, palette=0, tint0=0, tint1=0, tint2=0}, -- 188311241
                    {category=0xE06D30CE, drawable=-2000515794, albedo=-1565173757, normal=-605098981, material=-1693727507, palette=-1436165981, tint0=38, tint1=15, tint2=152}, -- -529714994
                },
            },  
            [28] = {
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][70],        
                clothes = { 
                    {category=0x96EDAE5C, drawable=-1439539395, albedo=528025401, normal=46748413, material=947155584, palette=0, tint0=0, tint1=0, tint2=0}, -- -1762808228
                    {category=0x7A96FACA, drawable=-1211650658, albedo=1702568362, normal=1071096122, material=1141992449, palette=-113397560, tint0=254, tint1=254, tint2=254}, -- 2056714954
                    {category=0x1D4C528A, drawable=-1200242576, albedo=-1110985473, normal=-1719396720, material=-1753334254, palette=-183908539, tint0=66, tint1=14, tint2=64}, -- 491541130
                    {category=0xB3966C9, drawable=-1129422788, albedo=-542241787, normal=-843436149, material=1800424428, palette=-1436165981, tint0=143, tint1=217, tint2=172}, -- 188311241
                    {category=0xB6B63737, drawable=-141945924, albedo=-122711323, normal=2121174521, material=-184742647, palette=-541985204, tint0=23, tint1=66, tint2=19}, -- -1229572297
                    {category=0xE06D30CE, drawable=1821564031, albedo=-554640854, normal=263732921, material=-1255352480, palette=1090645383, tint0=154, tint1=16, tint2=154}, -- -529714994
                    {category=0x9925C067, drawable=-939341270, albedo=517090484, normal=-676994406, material=-1415967823, palette=-76459397, tint0=127, tint1=74, tint2=27}, -- -1725579161
                },
            },  
            [29] = {
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][71],        
                clothes = { 
                    {category=0x96EDAE5C, drawable=-1439539395, albedo=528025401, normal=46748413, material=947155584, palette=-783849117, tint0=0, tint1=0, tint2=0}, -- -1762808228
                    {category=0x7A96FACA, drawable=837466449, albedo=-1309302949, normal=-1276378341, material=-1470214039, palette=1090645383, tint0=21, tint1=21, tint2=21}, -- 2056714954
                    {category=0x1D4C528A, drawable=267711189, albedo=404731488, normal=-426627649, material=361432629, palette=-183908539, tint0=0, tint1=0, tint2=0}, -- 491541130
                    {category=0xB3966C9, drawable=-1129422788, albedo=-542241787, normal=-843436149, material=1800424428, palette=-1436165981, tint0=0, tint1=0, tint2=0}, -- 188311241
                    {category=0xB6B63737, drawable=140817777, albedo=-122711323, normal=2121174521, material=-184742647, palette=-541985204, tint0=23, tint1=87, tint2=57}, -- -1229572297
                    {category=0xE06D30CE, drawable=-2000515794, albedo=765117617, normal=-605098981, material=-1693727507, palette=1090645383, tint0=124, tint1=15, tint2=53}, -- -529714994
                    {category=0x9925C067, drawable=966700612, albedo=-1449468733, normal=1643081805, material=1832479778, palette=1090645383, tint0=21, tint1=19, tint2=20}, -- -1725579161
                },
            },  
            [30] = {
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][72],        
                clothes = { 
                    {category=0x96EDAE5C, drawable=-1439539395, albedo=528025401, normal=46748413, material=947155584, palette=-783849117, tint0=0, tint1=0, tint2=0}, -- -1762808228
                    {category=0x7A96FACA, drawable=-427919278, albedo=-1717707909, normal=1847113433, material=1759818788, palette=1090645383, tint0=21, tint1=21, tint2=21}, -- 2056714954
                    {category=0x1D4C528A, drawable=1723942258, albedo=2112509777, normal=690069542, material=1838257263, palette=-183908539, tint0=64, tint1=0, tint2=0}, -- 491541130
                    {category=0xB3966C9, drawable=-1129422788, albedo=-542241787, normal=-843436149, material=1800424428, palette=-1698476236, tint0=9, tint1=3, tint2=3}, -- 188311241
                    {category=0xE06D30CE, drawable=-1769133885, albedo=-2104763636, normal=-995662583, material=-379204777, palette=1090645383, tint0=21, tint1=15, tint2=53}, -- -529714994
                },
            },  
            [31] = {
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][73],        
                clothes = { 
                    {category=0x96EDAE5C, drawable=-1439539395, albedo=528025401, normal=46748413, material=947155584, palette=-783849117, tint0=0, tint1=0, tint2=0}, -- -1762808228
                    {category=0x7A96FACA, drawable=-1873870582, albedo=879139455, normal=-825582336, material=1519560985, palette=-1436165981, tint0=20, tint1=21, tint2=21}, -- 2056714954
                    {category=0x1D4C528A, drawable=-1200242576, albedo=-1110985473, normal=-1719396720, material=-1753334254, palette=-183908539, tint0=66, tint1=14, tint2=63}, -- 491541130
                    {category=0xE06D30CE, drawable=2051076135, albedo=-1508821817, normal=2038285849, material=-1718303533, palette=1090645383, tint0=78, tint1=15, tint2=54}, -- -529714994
                    {category=0x9925C067, drawable=-287893322, albedo=-1268879156, normal=1522996660, material=1447145029, palette=864404955, tint0=21, tint1=79, tint2=49}, -- -1725579161
                    {category=0xEABE0032, drawable=-1640517432, albedo=1461604234, normal=-1114982503, material=316817141, palette=-783849117, tint0=58, tint1=58, tint2=58}, -- -356646862
                },
            },  
            [32] = {
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][74],        
                clothes = { 
                    {category=0x96EDAE5C, drawable=-1439539395, albedo=528025401, normal=46748413, material=947155584, palette=-541985204, tint0=0, tint1=0, tint2=0}, -- -1762808228
                    {category=0x7A96FACA, drawable=-427919278, albedo=-1717707909, normal=1847113433, material=1759818788, palette=-1436165981, tint0=21, tint1=21, tint2=21}, -- 2056714954
                    {category=0x1D4C528A, drawable=1723942258, albedo=2112509777, normal=690069542, material=1838257263, palette=-183908539, tint0=63, tint1=11, tint2=14}, -- 491541130
                     {category=0xE06D30CE, drawable=-2000515794, albedo=765117617, normal=-605098981, material=-1693727507, palette=1090645383, tint0=21, tint1=15, tint2=51}, -- -529714994
                    {category=0x9925C067, drawable=546700339, albedo=1382966405, normal=1432238265, material=1408927469, palette=-76459397, tint0=21, tint1=17, tint2=21}, -- -1725579161
                    {category=0xEABE0032, drawable=-397407957, albedo=-714916835, normal=-1978155534, material=-1195006570, palette=1090645383, tint0=15, tint1=20, tint2=20}, -- -356646862
                },
            },  
            [33] = {
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][75],        
                clothes = { 
                    {category=0x96EDAE5C, drawable=-1439539395, albedo=528025401, normal=46748413, material=947155584, palette=-783849117, tint0=0, tint1=0, tint2=0}, -- -1762808228
                    {category=0x7A96FACA, drawable=-1873870582, albedo=1086326204, normal=1439868821, material=-1212061506, palette=1090645383, tint0=45, tint1=45, tint2=45}, -- 2056714954
                    {category=0x1D4C528A, drawable=-1955436082, albedo=1685127659, normal=158006089, material=1395696470, palette=1090645383, tint0=55, tint1=243, tint2=51}, -- 491541130
                    {category=0xB3966C9, drawable=-1129422788, albedo=-1062117214, normal=-843436149, material=1800424428, palette=-1698476236, tint0=142, tint1=16, tint2=132}, -- 188311241
                    {category=0xE06D30CE, drawable=-2000515794, albedo=765117617, normal=-605098981, material=-1693727507, palette=1090645383, tint0=54, tint1=15, tint2=242}, -- -529714994
                },
            },  
            [34] = {
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][76],        
                clothes = { 
                    {category=0x96EDAE5C, drawable=-1439539395, albedo=604363614, normal=46748413, material=947155584, palette=-1436165981, tint0=0, tint1=0, tint2=0}, -- -1762808228
                    {category=0x7A96FACA, drawable=-1211650658, albedo=1702568362, normal=1071096122, material=1141992449, palette=1090645383, tint0=19, tint1=0, tint2=0}, -- 2056714954
                    {category=0x1D4C528A, drawable=-1955436082, albedo=902258387, normal=158006089, material=1395696470, palette=1090645383, tint0=253, tint1=243, tint2=20}, -- 491541130
                    {category=0xB3966C9, drawable=-1129422788, albedo=-133621342, normal=-843436149, material=1800424428, palette=1090645383, tint0=1, tint1=1, tint2=1}, -- 188311241
                    {category=0x485EE834, drawable=1577835066, albedo=-288493029, normal=-1809660868, material=1331104694, palette=1090645383, tint0=21, tint1=241, tint2=20}, -- 1214179380
                    {category=0x9B2C8B89, drawable=223939395, albedo=1676579085, normal=-1587261831, material=1010641735, palette=864404955, tint0=254, tint1=254, tint2=254}, -- -1691579511
                },
            },  
            [35] = {
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][77],        
                clothes = { 
                    {category=0x96EDAE5C, drawable=-1439539395, albedo=528025401, normal=46748413, material=947155584, palette=-783849117, tint0=0, tint1=0, tint2=0}, -- -1762808228
                    {category=0x7A96FACA, drawable=744500516, albedo=-215233343, normal=1504753417, material=856007559, palette=-183908539, tint0=0, tint1=0, tint2=0}, -- 2056714954
                    {category=0x1D4C528A, drawable=1723942258, albedo=2112509777, normal=690069542, material=1838257263, palette=-183908539, tint0=64, tint1=0, tint2=0}, -- 491541130
                    {category=0xE06D30CE, drawable=2051076135, albedo=-1483765548, normal=2038285849, material=-1718303533, palette=-183908539, tint0=64, tint1=60, tint2=85}, -- -529714994
                    {category=0x9925C067, drawable=546700339, albedo=1382966405, normal=1432238265, material=1408927469, palette=-183908539, tint0=61, tint1=60, tint2=61}, -- -1725579161
                    {category=0xEABE0032, drawable=-397407957, albedo=-714916835, normal=-1978155534, material=-1195006570, palette=1090645383, tint0=15, tint1=19, tint2=37}, -- -356646862
                },
            },  
            [36] = {
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][78],        
                clothes = { 
                    {category=0x96EDAE5C, drawable=-1439539395, albedo=528025401, normal=46748413, material=947155584, palette=0, tint0=0, tint1=0, tint2=0}, -- -1762808228
                    {category=0x7A96FACA, drawable=744500516, albedo=-215233343, normal=-511387333, material=-1732316548, palette=1090645383, tint0=254, tint1=254, tint2=254}, -- 2056714954
                    {category=0x1D4C528A, drawable=1723942258, albedo=2112509777, normal=690069542, material=1838257263, palette=-183908539, tint0=0, tint1=0, tint2=0}, -- 491541130
                    {category=0xB3966C9, drawable=-1129422788, albedo=-1793453564, normal=-843436149, material=1800424428, palette=-1698476236, tint0=0, tint1=0, tint2=0}, -- 188311241
                    {category=0xB6B63737, drawable=29091291, albedo=-122711323, normal=2121174521, material=-184742647, palette=-541985204, tint0=23, tint1=50, tint2=19}, -- -1229572297
                    {category=0xE06D30CE, drawable=-2000515794, albedo=-1565173757, normal=-605098981, material=-1693727507, palette=1090645383, tint0=40, tint1=15, tint2=37}, -- -529714994
                },
            },  
            [37] = {
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][79],        
                clothes = { 
                    {category=0x96EDAE5C, drawable=-1439539395, albedo=528025401, normal=46748413, material=947155584, palette=-783849117, tint0=0, tint1=0, tint2=0}, -- -1762808228
                    {category=0x7A96FACA, drawable=1065735303, albedo=-1262700014, normal=1517299298, material=-2045032479, palette=-183908539, tint0=1, tint1=1, tint2=1}, -- 2056714954
                    {category=0x1D4C528A, drawable=-1955436082, albedo=1685127659, normal=158006089, material=1395696470, palette=1090645383, tint0=77, tint1=21, tint2=77}, -- 491541130
                    {category=0xE06D30CE, drawable=-1438476633, albedo=-709785379, normal=955881008, material=-1642302516, palette=1090645383, tint0=76, tint1=15, tint2=254}, -- -529714994
                    {category=0x9B2C8B89, drawable=612384742, albedo=-138835281, normal=1589821689, material=1602328686, palette=-783849117, tint0=0, tint1=37, tint2=0}, -- -1691579511
                    {category=0x9925C067, drawable=546700339, albedo=1382966405, normal=1432238265, material=1408927469, palette=1090645383, tint0=20, tint1=74, tint2=74}, -- -1725579161
                    {category=0xEABE0032, drawable=577590008, albedo=-1667478102, normal=1659242991, material=-1046533290, palette=1090645383, tint0=16, tint1=16, tint2=16}, -- -356646862
                },
            },  
            [38] = {
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][80],        
                clothes = { 
                    {category=0x96EDAE5C, drawable=-1439539395, albedo=528025401, normal=46748413, material=947155584, palette=864404955, tint0=1, tint1=1, tint2=1}, -- -1762808228
                    {category=0x7A96FACA, drawable=-441015717, albedo=1459812439, normal=-510628925, material=-56618563, palette=1090645383, tint0=254, tint1=254, tint2=254}, -- 2056714954
                    {category=0x1D4C528A, drawable=1723942258, albedo=2112509777, normal=690069542, material=1838257263, palette=1090645383, tint0=254, tint1=254, tint2=240}, -- 491541130
                    {category=0xE06D30CE, drawable=-1148258842, albedo=-994587970, normal=1684852886, material=-156563413, palette=1090645383, tint0=78, tint1=15, tint2=77}, -- -529714994
                    {category=0x9925C067, drawable=-287893322, albedo=-1268879156, normal=1522996660, material=1447145029, palette=1090645383, tint0=254, tint1=20, tint2=253}, -- -1725579161
                    {category=0xEABE0032, drawable=-397407957, albedo=-714916835, normal=-1978155534, material=-1195006570, palette=1090645383, tint0=16, tint1=16, tint2=16}, -- -356646862
                },
            },  
            [39] = {
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][81],        
                clothes = { 
                    {category=0x96EDAE5C, drawable=-1439539395, albedo=528025401, normal=46748413, material=947155584, palette=864404955, tint0=1, tint1=1, tint2=1}, -- -1762808228
                    {category=0x7A96FACA, drawable=-427919278, albedo=-1717707909, normal=1847113433, material=1759818788, palette=1090645383, tint0=44, tint1=78, tint2=78}, -- 2056714954
                    {category=0x1D4C528A, drawable=1723942258, albedo=2112509777, normal=690069542, material=1838257263, palette=1090645383, tint0=155, tint1=243, tint2=240}, -- 491541130
                    {category=0xB3966C9, drawable=-1129422788, albedo=-1062117214, normal=-843436149, material=1800424428, palette=-1436165981, tint0=0, tint1=0, tint2=0}, -- 188311241
                    {category=0xE06D30CE, drawable=-2000515794, albedo=765117617, normal=-605098981, material=-1693727507, palette=1090645383, tint0=154, tint1=15, tint2=253}, -- -529714994
                    {category=0x9925C067, drawable=546700339, albedo=1382966405, normal=1432238265, material=1408927469, palette=864404955, tint0=20, tint1=244, tint2=242}, -- -1725579161
                },
            },  
            [40] = {
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][82],        
                clothes = { 
                    {category=0x96EDAE5C, drawable=-1439539395, albedo=528025401, normal=46748413, material=947155584, palette=0, tint0=0, tint1=0, tint2=0}, -- -1762808228
                    {category=0x1D4C528A, drawable=490475067, albedo=-1041796552, normal=1379492015, material=-387224847, palette=-183908539, tint0=0, tint1=22, tint2=17}, -- 491541130
                    {category=0xB3966C9, drawable=-1129422788, albedo=-542241787, normal=1725041356, material=1800424428, palette=-1436165981, tint0=17, tint1=17, tint2=17}, -- 188311241
                    {category=0xE06D30CE, drawable=-2000515794, albedo=-1565173757, normal=-605098981, material=-1693727507, palette=-1436165981, tint0=123, tint1=15, tint2=43}, -- -529714994
                },
            },  
            [41] = {
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][83],        
                clothes = { 
                    {category=0x96EDAE5C, drawable=-710199758, albedo=302991810, normal=-1941221196, material=-633023678, palette=0, tint0=0, tint1=0, tint2=0}, -- -1762808228
                    {category=0x1D4C528A, drawable=1723942258, albedo=2112509777, normal=690069542, material=1838257263, palette=-183908539, tint0=66, tint1=1, tint2=14}, -- 491541130
                    {category=0xB3966C9, drawable=-1129422788, albedo=-1062117214, normal=-843436149, material=1800424428, palette=-1698476236, tint0=0, tint1=0, tint2=0}, -- 188311241
                    {category=0x2026C46D, drawable=-533785224, albedo=445769774, normal=1252121788, material=-1575863649, palette=1090645383, tint0=21, tint1=15, tint2=21}, -- 539411565
                },
            },  
            [42] = {
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][84],        
                clothes = { 
                    {category=0x96EDAE5C, drawable=-1439539395, albedo=528025401, normal=46748413, material=947155584, palette=-541985204, tint0=0, tint1=0, tint2=0}, -- -1762808228
                    {category=0x7A96FACA, drawable=-62108143, albedo=-162601034, normal=-194150642, material=474770411, palette=1090645383, tint0=21, tint1=0, tint2=0}, -- 2056714954
                    {category=0x1D4C528A, drawable=1723942258, albedo=2112509777, normal=690069542, material=1838257263, palette=-183908539, tint0=66, tint1=0, tint2=0}, -- 491541130
                    {category=0xE06D30CE, drawable=-2000515794, albedo=765117617, normal=-605098981, material=-1693727507, palette=-1436165981, tint0=21, tint1=15, tint2=139}, -- -529714994
                    {category=0x9925C067, drawable=-939341270, albedo=517090484, normal=-676994406, material=-1415967823, palette=1090645383, tint0=21, tint1=125, tint2=40}, -- -1725579161
                    {category=0xEABE0032, drawable=-35410540, albedo=1422988492, normal=971256509, material=204756558, palette=1090645383, tint0=15, tint1=15, tint2=15}, -- -356646862
                },
            },  
            [43] = {
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][85],        
                clothes = { 
                    {category=0x96EDAE5C, drawable=-1439539395, albedo=528025401, normal=46748413, material=947155584, palette=0, tint0=0, tint1=0, tint2=0}, -- -1762808228
                    {category=0x7A96FACA, drawable=837466449, albedo=-1309302949, normal=-1276378341, material=-1470214039, palette=-183908539, tint0=66, tint1=66, tint2=66}, -- 2056714954
                    {category=0x1D4C528A, drawable=267711189, albedo=404731488, normal=-426627649, material=361432629, palette=-183908539, tint0=64, tint1=0, tint2=0}, -- 491541130
                    {category=0xB3966C9, drawable=-1129422788, albedo=-542241787, normal=-843436149, material=1800424428, palette=-783849117, tint0=9, tint1=9, tint2=9}, -- 188311241
                    {category=0xE06D30CE, drawable=2051076135, albedo=-1483765548, normal=2038285849, material=-1718303533, palette=1090645383, tint0=94, tint1=16, tint2=19}, -- -529714994
                    {category=0x9925C067, drawable=199505207, albedo=1010344879, normal=1147040055, material=703348357, palette=1090645383, tint0=20, tint1=19, tint2=21}, -- -1725579161
                },
            },  
            [44] = {
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][86],        
                clothes = { 
                    {category=0x96EDAE5C, drawable=-1439539395, albedo=528025401, normal=46748413, material=947155584, palette=-783849117, tint0=0, tint1=0, tint2=0}, -- -1762808228
                    {category=0x7A96FACA, drawable=63120821, albedo=-456646436, normal=1652318803, material=-2072099382, palette=1090645383, tint0=21, tint1=21, tint2=21}, -- 2056714954
                    {category=0x1D4C528A, drawable=1723942258, albedo=2112509777, normal=690069542, material=1838257263, palette=-183908539, tint0=64, tint1=0, tint2=63}, -- 491541130
                    {category=0xB3966C9, drawable=-1129422788, albedo=-542241787, normal=1725041356, material=1800424428, palette=-1436165981, tint0=26, tint1=1, tint2=26}, -- 188311241
                    {category=0xE06D30CE, drawable=2051076135, albedo=-1483765548, normal=2038285849, material=-1718303533, palette=1090645383, tint0=77, tint1=16, tint2=57}, -- -529714994
                },
            },  
            [45] = {
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][87],        
                clothes = { 
                    {category=0x96EDAE5C, drawable=-1439539395, albedo=528025401, normal=46748413, material=947155584, palette=0, tint0=0, tint1=0, tint2=0}, -- -1762808228
                    {category=0x7A96FACA, drawable=837466449, albedo=-1309302949, normal=-1276378341, material=-1470214039, palette=1090645383, tint0=254, tint1=254, tint2=254}, -- 2056714954
                    {category=0x1D4C528A, drawable=1723942258, albedo=2112509777, normal=690069542, material=1838257263, palette=-183908539, tint0=0, tint1=0, tint2=0}, -- 491541130
                    {category=0xB3966C9, drawable=-1129422788, albedo=-1793453564, normal=-843436149, material=1800424428, palette=0, tint0=0, tint1=0, tint2=0}, -- 188311241
                    {category=0xE06D30CE, drawable=-2000515794, albedo=765117617, normal=-605098981, material=-1693727507, palette=1090645383, tint0=79, tint1=15, tint2=254}, -- -529714994
                },
            },  
        },
        naked = {
            [1] = {
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][107],        
                clothes = {
                    {category=0x96EDAE5C, drawable=-1439539395, albedo=528025401, normal=46748413, material=947155584, palette=0, tint0=0, tint1=0, tint2=0}, -- -1762808228
                    {category=0x823687F5, drawable=2138569077, albedo=1051759281, normal=1881865813, material=2085161511, palette=-1436165981, tint0=0, tint1=0, tint2=0}, -- -2110355467
                    {category=0xB3966C9, drawable=-552524547, albedo=208440576, normal=-843436149, material=-1209821529, palette=-783849117, tint0=0, tint1=0, tint2=0}, -- 188311241
                },
            },   
        },
        army = {
            [1] = {
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][88],        
                clothes = {
                    {category=0x96EDAE5C, drawable=-1439539395, albedo=528025401, normal=46748413, material=947155584, palette=0, tint0=0, tint1=0, tint2=0}, -- -1762808228
                    {category=0x1D4C528A, drawable=1869982785, albedo=423208472, normal=-933822787, material=1226785339, palette=-183908539, tint0=189, tint1=0, tint2=94}, -- 491541130
                    {category=0xB3966C9, drawable=-1129422788, albedo=-133621342, normal=-843436149, material=1800424428, palette=-1436165981, tint0=0, tint1=0, tint2=0}, -- 188311241
                    {category=0xE06D30CE, drawable=1371751956, albedo=-2078551787, normal=-1951804625, material=1465139971, palette=-113397560, tint0=144, tint1=74, tint2=154}, -- -529714994
                    {category=0x9925C067, drawable=702369715, albedo=1580969930, normal=870300819, material=-1173500365, palette=-76459397, tint0=90, tint1=84, tint2=87}, -- -1725579161
                    {category=0x83887E88, drawable=1866675535, albedo=-570208217, normal=1702044266, material=-835976996, palette=-783849117, tint0=12, tint1=255, tint2=104}, -- -2088206712
                },
            },   
            [2] = {
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][89],        
                clothes = {
                    {category=0x96EDAE5C, drawable=-1439539395, albedo=528025401, normal=46748413, material=947155584, palette=0, tint0=0, tint1=0, tint2=0}, -- -1762808228
                    {category=0x1D4C528A, drawable=-1675391992, albedo=-1473578072, normal=1701677501, material=1318226604, palette=-183908539, tint0=199, tint1=10, tint2=66}, -- 491541130
                    {category=0xB3966C9, drawable=-1129422788, albedo=-542241787, normal=-843436149, material=1800424428, palette=-783849117, tint0=0, tint1=0, tint2=0}, -- 188311241
                    {category=0xE06D30CE, drawable=464018598, albedo=-535312173, normal=1177014493, material=-1721511595, palette=-1436165981, tint0=58, tint1=21, tint2=21}, -- -529714994
                    {category=0x9925C067, drawable=450389772, albedo=-200207045, normal=103164345, material=-1762505390, palette=-76459397, tint0=35, tint1=42, tint2=19}, -- -1725579161
                    {category=0x83887E88, drawable=443844798, albedo=-1483831189, normal=890151317, material=-512073941, palette=-783849117, tint0=23, tint1=23, tint2=19}, -- -2088206712
                },
            },  
            [3] = {
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][90],        
                clothes = {
                    {category=0x96EDAE5C, drawable=-1439539395, albedo=528025401, normal=46748413, material=947155584, palette=0, tint0=0, tint1=0, tint2=0}, -- -1762808228
                    {category=0x1D4C528A, drawable=490475067, albedo=-637203565, normal=1379492015, material=-387224847, palette=-183908539, tint0=199, tint1=4, tint2=66}, -- 491541130
                    {category=0xB3966C9, drawable=-1129422788, albedo=-542241787, normal=-843436149, material=1800424428, palette=-783849117, tint0=0, tint1=0, tint2=0}, -- 188311241
                    {category=0xE06D30CE, drawable=464018598, albedo=-535312173, normal=1177014493, material=-1721511595, palette=-1436165981, tint0=58, tint1=21, tint2=21}, -- -529714994
                    {category=0x9925C067, drawable=1599070998, albedo=-544302744, normal=-25194841, material=355692373, palette=-76459397, tint0=11, tint1=35, tint2=19}, -- -1725579161
                    {category=0x83887E88, drawable=443844798, albedo=-1483831189, normal=890151317, material=-512073941, palette=-783849117, tint0=23, tint1=23, tint2=19}, -- -2088206712
                },
            },  
            [4] = {
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][91],        
                clothes = {
                    {category=0x96EDAE5C, drawable=-1439539395, albedo=528025401, normal=46748413, material=947155584, palette=0, tint0=0, tint1=0, tint2=0}, -- -1762808228
                    {category=0x1D4C528A, drawable=664935223, albedo=2112599438, normal=-2070511286, material=-1135290711, palette=-183908539, tint0=30, tint1=16, tint2=84}, -- 491541130
                    {category=0xB3966C9, drawable=-1129422788, albedo=-542241787, normal=-843436149, material=1800424428, palette=-783849117, tint0=0, tint1=0, tint2=0}, -- 188311241
                    {category=0xE06D30CE, drawable=464018598, albedo=-535312173, normal=1177014493, material=-1721511595, palette=-1436165981, tint0=155, tint1=20, tint2=153}, -- -529714994
                    {category=0x9925C067, drawable=1599070998, albedo=-544302744, normal=-25194841, material=355692373, palette=-76459397, tint0=35, tint1=8, tint2=19}, -- -1725579161
                    {category=0x83887E88, drawable=443844798, albedo=-1483831189, normal=890151317, material=-512073941, palette=-783849117, tint0=19, tint1=18, tint2=17}, -- -2088206712
                },
            },  
        },
    },
    female = {
        police = {
            [1] = {
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][1],        
                clothes = {
                    {category=0xB3966C9, drawable=-1021748989, albedo=-869920080, normal=1387980394, material=808456005, tint0=0, tint1=0, tint2=0},
                    {category=0x9925C067, drawable=173851521, albedo=-677161978, normal=-984372841, material=-888829087, palette=-76459397, tint0=9, tint1=9, tint2=9},
                    {category=0x3F7DB302, drawable=-51762828, albedo=2037809824, normal=-297276107, material=546130716, tint0=0, tint1=0, tint2=0},
                    {category=0x96EDAE5C, drawable=-964864985, albedo=528025401, normal=46748413, material=947155584, palette=-783849117, tint0=0, tint1=0, tint2=0},
                    {category=0x9B2C8B89, drawable=-801288210, albedo=1831431859, normal=-1485549679, material=11183055, palette=-783849117, tint0=1, tint1=1, tint2=58},
                    {category=0xB6B6122D, drawable=-184950738, albedo=98474534, normal=164956975, material=-934192357, palette=-183908539, tint0=0, tint1=60, tint2=8},
                    {category=0xFAE9107F, drawable=1733721899, albedo=-1921859074, normal=-645191754, material=1671174462, palette=1090645383, tint0=44, tint1=44, tint2=44},
                    {category=0x83887E88, drawable=-933319961, albedo=1542174995, normal=-74347389, material=-2020317616, palette=-783849117, tint0=14, tint1=60, tint2=60},
                },
            }, 
            [2] = {
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][2],        
                clothes = {
                    {category=0xB3966C9, drawable=-1021748989, albedo=-869920080, normal=1387980394, material=808456005, tint0=0, tint1=0, tint2=0},
                    {category=0x9925C067, drawable=525853119, albedo=-256293007, normal=-588281463, material=818090742, palette=1669565057, tint0=139, tint1=254, tint2=143}, -- -1725579161
                    {category=0x3F7DB302, drawable=-51762828, albedo=2037809824, normal=-297276107, material=546130716, tint0=0, tint1=0, tint2=0},
                    {category=0x96EDAE5C, drawable=-964864985, albedo=528025401, normal=46748413, material=947155584, palette=-783849117, tint0=0, tint1=0, tint2=0},
                    {category=0x9B2C8B89, drawable=-801288210, albedo=1831431859, normal=-1485549679, material=11183055, palette=-783849117, tint0=1, tint1=1, tint2=58}, 
                    {category=0xB6B6122D, drawable=-184950738, albedo=98474534, normal=164956975, material=-934192357, palette=-183908539, tint0=0, tint1=60, tint2=8},
                    {category=0xFAE9107F, drawable=1733721899, albedo=-1921859074, normal=-645191754, material=1671174462, palette=1090645383, tint0=44, tint1=44, tint2=44},
                },
            }, 
            [3] = {
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][3],        
                clothes = {
                    {category=0xB3966C9, drawable=-1021748989, albedo=-869920080, normal=1387980394, material=808456005, tint0=0, tint1=0, tint2=0},
                    {category=0x9925C067, drawable=1599070998, albedo=2014390805, normal=88936532, material=1534695787, palette=864404955, tint0=21, tint1=47, tint2=17}, -- -1725579161
                    {category=0x3F7DB302, drawable=-51762828, albedo=2037809824, normal=-297276107, material=546130716, tint0=0, tint1=0, tint2=0},
                    {category=0x96EDAE5C, drawable=-964864985, albedo=528025401, normal=46748413, material=947155584, palette=-783849117, tint0=0, tint1=0, tint2=0},
                    {category=0x9B2C8B89, drawable=-801288210, albedo=1831431859, normal=-1485549679, material=11183055, palette=-783849117, tint0=1, tint1=1, tint2=58}, 
                    {category=0xB6B6122D, drawable=-184950738, albedo=98474534, normal=164956975, material=-934192357, palette=-183908539, tint0=0, tint1=60, tint2=8},
                    {category=0xFAE9107F, drawable=1733721899, albedo=-1921859074, normal=-645191754, material=1671174462, palette=1090645383, tint0=44, tint1=44, tint2=44},
                },
            }, 
            [4] = {
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][4],        
                clothes = {
                    {category=0x1D4C528A, drawable=2083284543, albedo=-947369340, normal=1731124431, material=995106235, palette=0, tint0=41, tint1=21, tint2=48},  
                    {category=0xB3966C9, drawable=-1021748989, albedo=869437735, normal=1387980394, material=808456005, palette=-1436165981, tint0=21, tint1=21, tint2=21}, -- 188311241
                    {category=0xE06D30CE, drawable=-1108277772, albedo=-1823412812, normal=-1849549052, material=-2110210949, palette=-1251868068, tint0=151, tint1=148, tint2=149}, -- -529714994 
                    {category=0x777EC6EF, drawable=1415675066, albedo=-1084702659, normal=802515403, material=173588253, palette=-0, tint0=18, tint1=8, tint2=6}, -- 2004797167
                    {category=0x9925C067, drawable=525853119, albedo=-256293007, normal=-588281463, material=818090742, palette=1669565057, tint0=139, tint1=254, tint2=143}, -- -1725579161
                    {category=0x9B2C8B89, drawable=-801288210, albedo=1831431859, normal=-1485549679, material=11183055, palette=-783849117, tint0=1, tint1=1, tint2=58},
                    {category=0xB6B6122D, drawable=-184950738, albedo=98474534, normal=164956975, material=-934192357, palette=-183908539, tint0=0, tint1=60, tint2=8},   
                    {category=0xFAE9107F, drawable=1733721899, albedo=-1921859074, normal=-645191754, material=1671174462, palette=1090645383, tint0=44, tint1=44, tint2=44},
                },
            },  
            [5] = {
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][5],        
                clothes = {
                    {category=0x96EDAE5C, drawable=-964864985, albedo=528025401, normal=46748413, material=947155584, palette=-113397560, tint0=0, tint1=0, tint2=0}, -- -1762808228
                    {category=0x1D4C528A, drawable=-1880975261, albedo=-2000352815, normal=-1967934901, material=803860073, palette=0, tint0=129, tint1=127, tint2=61}, -- 491541130
                    {category=0x777EC6EF, drawable=843066048, albedo=1340862988, normal=1482867706, material=793710361, palette=0, tint0=254, tint1=249, tint2=243}, -- 2004797167
                    {category=0xB3966C9, drawable=-1021748989, albedo=-869920080, normal=1387980394, material=808456005, palette=-113397560, tint0=0, tint1=0, tint2=0}, -- 188311241
                    {category=0x2026C46D, drawable=1845749310, albedo=-373717140, normal=451466238, material=-1578353692, palette=0, tint0=44, tint1=45, tint2=1}, -- 539411565
                    {category=0xE06D30CE, drawable=-29937627, albedo=-88386583, normal=106417110, material=-750677802, palette=0, tint0=250, tint1=254, tint2=52}, -- -529714994 
                    {category=0x9925C067, drawable=525853119, albedo=-256293007, normal=-588281463, material=818090742, palette=-76459397, tint0=19, tint1=19, tint2=19}, -- -1725579161
                    {category=0xEA24B45E, drawable=2044677326, albedo=-1122970326, normal=-27363481, material=-2146390887, palette=-1529893936, tint0=1, tint1=43, tint2=22}, -- -366693282
                    {category=0x9B2C8B89, drawable=-801288210, albedo=1831431859, normal=-1485549679, material=11183055, palette=-783849117, tint0=1, tint1=1, tint2=58}, 
                    {category=0xFAE9107F, drawable=1733721899, albedo=-1921859074, normal=-645191754, material=1671174462, palette=1090645383, tint0=44, tint1=44, tint2=44},
                },
            },  
        },
        prison = {  
            [1] = { -- prizonier
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][33],
                clothes = {
                    {category=0x1D4C528A, drawable=-1794828308, albedo=1514403428, normal=-1481743709, material=-1279276906, palette=-1436165981, tint0=20, tint1=16, tint2=47}, -- 491541130
                    {category=0x777EC6EF, drawable=-1798246732, albedo=-1739103350, normal=32228037, material=-881930859, palette=-783849117, tint0=2, tint1=2, tint2=97}, -- 2004797167
                    {category=0xB3966C9, drawable=982242418, albedo=156776806, normal=1387980394, material=808456005, palette=-1529893936, tint0=0, tint1=0, tint2=0}, -- 188311241
                    {category=0x2026C46D, drawable=-1907293895, albedo=-651383576, normal=-396122322, material=-240284906, palette=-1436165981, tint0=20, tint1=16, tint2=47}, -- 539411565 
                },
            },
        },
        doctor = {
            [1] = {
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][34],
                clothes = { 
                    {category=0x96EDAE5C, drawable=-964864985, albedo=528025401, normal=46748413, material=947155584, palette=1090645383, tint0=15, tint1=15, tint2=15}, -- -1762808228
                    {category=0x777EC6EF, drawable=-272917581, albedo=99617969, normal=686173355, material=-1487205283, palette=-1251868068, tint0=21, tint1=254, tint2=253}, -- 2004797167
                    {category=0xB3966C9, drawable=764757887, albedo=-1713539050, normal=1387980394, material=808456005, palette=0, tint0=0, tint1=0, tint2=0}, -- 188311241
                    {category=0x2026C46D, drawable=497257015, albedo=-1888764607, normal=-1539908218, material=861402352, palette=1090645383, tint0=15, tint1=15, tint2=15}, -- 539411565
                    {category=0xA0E3AB7F, drawable=-262233026, albedo=-389433163, normal=417220687, material=-983337476, palette=1090645383, tint0=15, tint1=16, tint2=15}, -- -1595692161
                }
            },
            [2] = {
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][35],
                clothes = {  
                    {category=0x2026C46D, drawable=919910570, albedo=-36124351, normal=-1792592157, material=-1860874458, palette=-1436165981, tint0=16, tint1=16, tint2=16}, -- 539411565  
                    {category=0x777EC6EF, drawable=26492772, albedo=-1121104381, normal=762199934, material=96481765, palette=-183908539, tint0=0, tint1=4, tint2=18}, -- 2004797167  
                    {category=0xA0E3AB7F, drawable=493782539, albedo=-953363459, normal=2118377739, material=-1435975155, palette=-113397560, tint0=21, tint1=16, tint2=19}, -- -1595692161
                    {category=0xB3966C9, drawable=-485580515, albedo=-869920080, normal=1387980394, material=452681919, palette=-1436165981, tint0=0, tint1=0, tint2=0}, -- 188311241
                }
            },
            [3] = {
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][36],
                clothes = {   
                    
                    {category=0xA0E3AB7F, drawable=-738727055, albedo=-1113548668, normal=-1422296613, material=-97148635, palette=1090645383, tint0=41, tint1=41, tint2=41}, -- -1595692161

                    {category=0x96EDAE5C, drawable=-964864985, albedo=528025401, normal=46748413, material=947155584, palette=0, tint0=0, tint1=0, tint2=0}, -- -1762808228
                    {category=0x777EC6EF, drawable=26492772, albedo=-1121104381, normal=762199934, material=96481765, palette=-183908539, tint0=0, tint1=7, tint2=30}, -- 2004797167
                    {category=0xB3966C9, drawable=-234931343, albedo=-869920080, normal=1387980394, material=808456005, palette=-1436165981, tint0=0, tint1=0, tint2=0}, -- 188311241
                    {category=0x2026C46D, drawable=109548864, albedo=-1612419041, normal=783619804, material=-769642415, palette=1090645383, tint0=15, tint1=54, tint2=21}, -- 539411565 
                }
            },
            [4] = {
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][37],
                clothes = { 
                    {category=0x777EC6EF, drawable=-272917581, albedo=99617969, normal=686173355, material=-1487205283, palette=-183908539, tint0=0, tint1=4, tint2=46}, -- 2004797167
                    {category=0xB3966C9, drawable=-485580515, albedo=-869920080, normal=1387980394, material=452681919, palette=-1436165981, tint0=0, tint1=0, tint2=0}, -- 188311241
                    {category=0x2026C46D, drawable=142156443, albedo=-36124351, normal=-1792592157, material=1545892836, palette=-1436165981, tint0=42, tint1=42, tint2=42}, -- 539411565
                    {category=0xA0E3AB7F, drawable=493782539, albedo=-662859722, normal=2118377739, material=-1435975155, palette=-1436165981, tint0=123, tint1=1, tint2=19}, -- -1595692161
                }
            },
        },
        naked = {
            [1] = {
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][107],
                clothes = {
                    {category=0x96EDAE5C, drawable=-964864985, albedo=528025401, normal=46748413, material=947155584, palette=0, tint0=0, tint1=0, tint2=0}, -- -1762808228
                    {category=0x823687F5, drawable=982601751, albedo=-608262364, normal=-736360198, material=1234037883, palette=-1436165981, tint0=0, tint1=0, tint2=0}, -- -2110355467
                    {category=0xB3966C9, drawable=22733333, albedo=-869920080, normal=1387980394, material=808456005, palette=-1436165981, tint0=0, tint1=0, tint2=0}, -- 188311241
                }
            }
        },
        ladies = {
            [1] = {
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][92],
                clothes = {
                    {category=0x96EDAE5C, drawable=-964864985, albedo=528025401, normal=46748413, material=947155584, palette=-1436165981, tint0=73, tint1=73, tint2=73}, -- -1762808228
                    {category=0x777EC6EF, drawable=-272917581, albedo=1849287306, normal=-1111844682, material=733806115, palette=-183908539, tint0=0, tint1=0, tint2=0}, -- 2004797167
                    {category=0xB3966C9, drawable=1275589386, albedo=-869920080, normal=1387980394, material=808456005, palette=17129595, tint0=15, tint1=251, tint2=251}, -- 188311241
                    {category=0x2026C46D, drawable=1544109502, albedo=448692981, normal=-1060318999, material=629153454, palette=1090645383, tint0=99, tint1=3, tint2=15}, -- 539411565
                    {category=0x9925C067, drawable=1647215188, albedo=-463148912, normal=-2729503, material=845924104, palette=-183908539, tint0=150, tint1=160, tint2=151}, -- -1725579161
                    {category=0xA0E3AB7F, drawable=-539360739, albedo=68774333, normal=-1972903124, material=-2032307207, palette=-183908539, tint0=151, tint1=151, tint2=151}, -- -1595692161
                    {category=0x7BC10759, drawable=1563571411, albedo=-1340021153, normal=-1269432529, material=241981977, palette=-183908539, tint0=101, tint1=101, tint2=101}, -- 2076247897
                }
            },
            [2] = { 
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][93],    
                clothes = {
                    {category=0x96EDAE5C, drawable=-964864985, albedo=528025401, normal=46748413, material=947155584, palette=-1436165981, tint0=0, tint1=0, tint2=0}, -- -1762808228
                    {category=0x1D4C528A, drawable=1287870321, albedo=-2106383272, normal=209177305, material=812512749, palette=-183908539, tint0=124, tint1=0, tint2=0}, -- 491541130
                    {category=0x777EC6EF, drawable=1512226163, albedo=-93847253, normal=-1524929946, material=656503904, palette=-183908539, tint0=0, tint1=0, tint2=47}, -- 2004797167
                    {category=0xB3966C9, drawable=-1021748989, albedo=869437735, normal=1387980394, material=808456005, palette=-1436165981, tint0=21, tint1=21, tint2=21}, -- 188311241
                    {category=0x2026C46D, drawable=365369415, albedo=1013317036, normal=1205485982, material=1432995310, palette=-183908539, tint0=60, tint1=60, tint2=60}, -- 539411565
                    {category=0xE06D30CE, drawable=-29937627, albedo=936902538, normal=1949766154, material=688690817, palette=-183908539, tint0=0, tint1=123, tint2=123}, -- -529714994
                    {category=0x485EE834, drawable=1032748554, albedo=-672921424, normal=-1622520936, material=2014865576, palette=-183908539, tint0=0, tint1=124, tint2=0}, -- 1214179380
                    {category=0x9B2C8B89, drawable=1520407910, albedo=797217307, normal=1283957305, material=-350065273, palette=-183908539, tint0=0, tint1=0, tint2=0}, -- -1691579511
                    {category=0x9925C067, drawable=1023981905, albedo=822622478, normal=2036287933, material=1354709555, palette=-183908539, tint0=0, tint1=123, tint2=0}, -- -1725579161
                }
            },
            [3] = {     
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][94],
                clothes = {
                    {category=0x96EDAE5C, drawable=-964864985, albedo=528025401, normal=46748413, material=947155584, palette=0, tint0=0, tint1=0, tint2=0}, -- -1762808228
                    {category=0x777EC6EF, drawable=26492772, albedo=-1121104381, normal=762199934, material=96481765, palette=-183908539, tint0=13, tint1=5, tint2=13}, -- 2004797167
                    {category=0xB3966C9, drawable=-1021748989, albedo=-869920080, normal=1387980394, material=808456005, palette=0, tint0=0, tint1=0, tint2=0}, -- 188311241
                    {category=0x2026C46D, drawable=-1907018619, albedo=-1228163283, normal=699789463, material=-152562446, palette=1090645383, tint0=130, tint1=21, tint2=144}, -- 539411565
                    {category=0xA0E3AB7F, drawable=-539360739, albedo=-772508334, normal=-2074430169, material=1105820514, palette=1090645383, tint0=123, tint1=123, tint2=123}, -- -1595692161
                }
            },
            [4] = {
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][95],
                clothes = {
                    {category=0x96EDAE5C, drawable=-964864985, albedo=528025401, normal=46748413, material=947155584, palette=-1436165981, tint0=0, tint1=42, tint2=41}, -- -1762808228
                    {category=0x777EC6EF, drawable=26492772, albedo=-1121104381, normal=762199934, material=96481765, palette=-183908539, tint0=0, tint1=0, tint2=0}, -- 2004797167
                    {category=0xB3966C9, drawable=509220783, albedo=869437735, normal=1387980394, material=808456005, palette=-1698476236, tint0=0, tint1=42, tint2=41}, -- 188311241
                    {category=0x2026C46D, drawable=1544109502, albedo=448692981, normal=-1060318999, material=629153454, palette=-183908539, tint0=90, tint1=0, tint2=73}, -- 539411565
                    {category=0xA0E3AB7F, drawable=378564489, albedo=-808460612, normal=1410008184, material=-706829027, palette=-183908539, tint0=0, tint1=91, tint2=0}, -- -1595692161
                    {category=0xEABE0032, drawable=-1012949496, albedo=-1616845083, normal=312288750, material=211547633, palette=-183908539, tint0=0, tint1=8, tint2=0}, -- -356646862
                }
            },
            [5] = { 
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][96],
                clothes = {
                    {category=0x96EDAE5C, drawable=-964864985, albedo=528025401, normal=46748413, material=947155584, palette=-113397560, tint0=1, tint1=1, tint2=1}, -- -1762808228
                    {category=0x777EC6EF, drawable=26492772, albedo=-1121104381, normal=762199934, material=96481765, palette=1090645383, tint0=244, tint1=254, tint2=242}, -- 2004797167
                    {category=0xE06D30CE, drawable=1949288121, albedo=-775536324, normal=2102647526, material=984679051, palette=1090645383, tint0=45, tint1=15, tint2=45}, -- -529714994
                    {category=0xA0E3AB7F, drawable=-738727055, albedo=-1113548668, normal=-1422296613, material=-97148635, palette=17129595, tint0=46, tint1=45, tint2=246}, -- -1595692161
                    {category=0xEABE0032, drawable=908389237, albedo=-1616845083, normal=312288750, material=211547633, palette=1090645383, tint0=15, tint1=16, tint2=15}, -- -356646862
                }
            },
            [6] = { 
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][97],
                clothes = {
                    {category=0x96EDAE5C, drawable=-964864985, albedo=528025401, normal=46748413, material=947155584, palette=-1436165981, tint0=0, tint1=42, tint2=41}, -- -1762808228
                    {category=0x777EC6EF, drawable=26492772, albedo=-1121104381, normal=762199934, material=96481765, palette=-183908539, tint0=0, tint1=0, tint2=0}, -- 2004797167
                    {category=0xB3966C9, drawable=-2091556444, albedo=869437735, normal=1387980394, material=808456005, palette=-1698476236, tint0=0, tint1=0, tint2=0}, -- 188311241
                    {category=0x2026C46D, drawable=497257015, albedo=-1888764607, normal=-1539908218, material=861402352, palette=-183908539, tint0=190, tint1=200, tint2=60}, -- 539411565
                    {category=0xA0E3AB7F, drawable=378564489, albedo=-808460612, normal=1410008184, material=-706829027, palette=-183908539, tint0=189, tint1=200, tint2=189}, -- -1595692161
                }
            },
            [7] = {     
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][98],
                clothes = {
                    {category=0x96EDAE5C, drawable=-964864985, albedo=528025401, normal=46748413, material=947155584, palette=-1436165981, tint0=0, tint1=0, tint2=0}, -- -1762808228
                    {category=0x777EC6EF, drawable=-1234032351, albedo=-895131712, normal=982925259, material=-311507458, palette=-183908539, tint0=15, tint1=15, tint2=0}, -- 2004797167
                    {category=0xB3966C9, drawable=-1932397771, albedo=869437735, normal=1387980394, material=808456005, palette=-1698476236, tint0=21, tint1=21, tint2=21}, -- 188311241
                    {category=0xE06D30CE, drawable=1938571980, albedo=72867748, normal=2036868039, material=-1398684508, palette=1090645383, tint0=77, tint1=79, tint2=21}, -- -529714994
                    {category=0x9925C067, drawable=1647215188, albedo=-463148912, normal=-2729503, material=845924104, palette=864404955, tint0=39, tint1=76, tint2=51}, -- -1725579161
                    {category=0xA0E3AB7F, drawable=161158814, albedo=2106161669, normal=2021478369, material=-1167069615, palette=17129595, tint0=21, tint1=21, tint2=21}, -- -1595692161
                    {category=0xEABE0032, drawable=-1012949496, albedo=-1616845083, normal=312288750, material=211547633, palette=1090645383, tint0=15, tint1=15, tint2=15}, -- -356646862
                    {category=0x7BC10759, drawable=1563571411, albedo=-1340021153, normal=-1269432529, material=241981977, palette=1090645383, tint0=15, tint1=28, tint2=28}, -- 2076247897
                }
            },
            [8] = {     
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][99],
                clothes = {
                    {category=0x96EDAE5C, drawable=-964864985, albedo=528025401, normal=46748413, material=947155584, palette=0, tint0=0, tint1=0, tint2=0}, -- -1762808228
                    {category=0x777EC6EF, drawable=26492772, albedo=-1121104381, normal=762199934, material=96481765, palette=-183908539, tint0=0, tint1=4, tint2=18}, -- 2004797167
                    {category=0xB3966C9, drawable=-1021748989, albedo=-869920080, normal=1387980394, material=808456005, palette=0, tint0=0, tint1=0, tint2=0}, -- 188311241
                    {category=0x2026C46D, drawable=-1684221916, albedo=1262191108, normal=262801504, material=1837290897, palette=-1436165981, tint0=57, tint1=57, tint2=57}, -- 539411565 
                    {category=0xA0E3AB7F, drawable=-539360739, albedo=-772508334, normal=-2074430169, material=1105820514, palette=17129595, tint0=21, tint1=20, tint2=21}, -- -1595692161
                }
            },
            [9] = {     
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][100],
                clothes = {
                    {category=0x96EDAE5C, drawable=-964864985, albedo=528025401, normal=46748413, material=947155584, palette=0, tint0=0, tint1=0, tint2=0}, -- -1762808228
                    {category=0x777EC6EF, drawable=26492772, albedo=-762988376, normal=787729706, material=1093456761, palette=-183908539, tint0=0, tint1=60, tint2=0}, -- 2004797167
                    {category=0xB3966C9, drawable=-1021748989, albedo=950237995, normal=1387980394, material=808456005, palette=0, tint0=0, tint1=0, tint2=0}, -- 188311241
                    {category=0x2026C46D, drawable=-1239583363, albedo=1121264913, normal=630954815, material=1764276741, palette=1090645383, tint0=21, tint1=21, tint2=21}, -- 539411565
                    {category=0x9925C067, drawable=1023981905, albedo=-1945176932, normal=2056297372, material=-1962107398, palette=-76459397, tint0=24, tint1=28, tint2=28}, -- -1725579161
                    {category=0xA0E3AB7F, drawable=-998398338, albedo=405405321, normal=1291789661, material=-1569908351, palette=-1175980254, tint0=21, tint1=21, tint2=21}, -- -1595692161
                }
            },
            [10] = {     
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][101],
                clothes = {
                    {category=0x96EDAE5C, drawable=-964864985, albedo=528025401, normal=46748413, material=947155584, palette=0, tint0=0, tint1=0, tint2=0}, -- -1762808228
                    {category=0x777EC6EF, drawable=26492772, albedo=-1121104381, normal=762199934, material=96481765, palette=-183908539, tint0=0, tint1=4, tint2=18}, -- 2004797167
                    {category=0xB3966C9, drawable=-1021748989, albedo=-869920080, normal=1387980394, material=808456005, palette=-1436165981, tint0=0, tint1=0, tint2=0}, -- 188311241
                    {category=0xE06D30CE, drawable=-106265291, albedo=940999919, normal=891570713, material=1715364617, palette=1090645383, tint0=44, tint1=16, tint2=49}, -- -529714994
                    {category=0x9925C067, drawable=-1192153128, albedo=1590498178, normal=696824939, material=910121798, palette=-76459397, tint0=12, tint1=18, tint2=31}, -- -1725579161
                    {category=0xA0E3AB7F, drawable=-738727055, albedo=-1570941523, normal=-1422296613, material=-97148635, palette=-1175980254, tint0=47, tint1=21, tint2=47}, -- -1595692161
                    {category=0x7BC10759, drawable=1563571411, albedo=-1340021153, normal=-1269432529, material=241981977, palette=-1436165981, tint0=15, tint1=48, tint2=48}, -- 2076247897
                }
            },
            [11] = {     
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][102],
                clothes = {
                    {category=0x96EDAE5C, drawable=-964864985, albedo=528025401, normal=46748413, material=947155584, palette=-1436165981, tint0=40, tint1=245, tint2=30}, -- -1762808228
                    {category=0x777EC6EF, drawable=-272917581, albedo=1849287306, normal=-1111844682, material=733806115, palette=-183908539, tint0=0, tint1=4, tint2=84}, -- 2004797167
                    {category=0xB3966C9, drawable=-1021748989, albedo=-869920080, normal=2121611750, material=808456005, palette=-1436165981, tint0=254, tint1=254, tint2=254}, -- 188311241
                    {category=0x2026C46D, drawable=-2121364384, albedo=-1534252182, normal=959745066, material=-1747943762, palette=1090645383, tint0=154, tint1=127, tint2=15}, -- 539411565
                    {category=0xA0E3AB7F, drawable=-738727055, albedo=-1570941523, normal=-1422296613, material=-97148635, palette=-1175980254, tint0=154, tint1=145, tint2=155}, -- -1595692161
                }
            },  
            [12] = {     
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][103],
                clothes = {
                    {category=0x96EDAE5C, drawable=-964864985, albedo=528025401, normal=46748413, material=947155584, palette=-1436165981, tint0=0, tint1=0, tint2=0}, -- -1762808228
                    {category=0x777EC6EF, drawable=-1234032351, albedo=-895131712, normal=982925259, material=-311507458, palette=-183908539, tint0=5, tint1=60, tint2=0}, -- 2004797167
                    {category=0xB3966C9, drawable=901367050, albedo=-869920080, normal=1387980394, material=808456005, palette=-1698476236, tint0=21, tint1=21, tint2=21}, -- 188311241
                    {category=0xE06D30CE, drawable=1938571980, albedo=72867748, normal=2036868039, material=-1398684508, palette=-1436165981, tint0=75, tint1=56, tint2=136}, -- -529714994
                    {category=0x9925C067, drawable=1647215188, albedo=-463148912, normal=-2729503, material=845924104, palette=864404955, tint0=56, tint1=56, tint2=80}, -- -1725579161
                    {category=0xA0E3AB7F, drawable=-738727055, albedo=-1113548668, normal=-1422296613, material=-97148635, palette=-1175980254, tint0=79, tint1=41, tint2=138}, -- -1595692161
                    {category=0x7BC10759, drawable=1563571411, albedo=-1340021153, normal=-1269432529, material=241981977, palette=-1436165981, tint0=28, tint1=28, tint2=28}, -- 2076247897
                }
            },
            [13] = {     
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][104],
                clothes = {
                    {category=0x96EDAE5C, drawable=-964864985, albedo=528025401, normal=46748413, material=947155584, palette=-1436165981, tint0=0, tint1=0, tint2=0}, -- -1762808228
                    {category=0x777EC6EF, drawable=-272917581, albedo=99617969, normal=686173355, material=-1487205283, palette=-183908539, tint0=0, tint1=4, tint2=46}, -- 2004797167
                    {category=0xB3966C9, drawable=-485580515, albedo=869437735, normal=1387980394, material=808456005, palette=-1436165981, tint0=21, tint1=21, tint2=21}, -- 188311241
                    {category=0x2026C46D, drawable=888111543, albedo=-36124351, normal=-1792592157, material=-1860874458, palette=-1436165981, tint0=15, tint1=15, tint2=21}, -- 539411565
                    {category=0x9925C067, drawable=1647215188, albedo=-463148912, normal=-2729503, material=845924104, palette=864404955, tint0=39, tint1=76, tint2=51}, -- -1725579161
                    {category=0xA0E3AB7F, drawable=-539360739, albedo=-772508334, normal=-2074430169, material=1105820514, palette=-1175980254, tint0=78, tint1=78, tint2=72}, -- -1595692161
                }
            },
            [14] = {     
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][105],
                clothes = {
                    {category=0x96EDAE5C, drawable=-964864985, albedo=528025401, normal=46748413, material=947155584, palette=-1436165981, tint0=0, tint1=0, tint2=0}, -- -1762808228
                    {category=0x777EC6EF, drawable=-1234032351, albedo=-895131712, normal=982925259, material=-311507458, palette=-183908539, tint0=4, tint1=33, tint2=0}, -- 2004797167
                    {category=0xB3966C9, drawable=-1932397771, albedo=869437735, normal=1387980394, material=808456005, palette=-1698476236, tint0=21, tint1=21, tint2=21}, -- 188311241
                    {category=0xE06D30CE, drawable=1938571980, albedo=72867748, normal=2036868039, material=-1398684508, palette=-1436165981, tint0=107, tint1=56, tint2=100}, -- -529714994
                    {category=0xA0E3AB7F, drawable=161158814, albedo=2106161669, normal=2021478369, material=-1167069615, palette=-1175980254, tint0=107, tint1=107, tint2=107}, -- -1595692161
                    {category=0xEABE0032, drawable=-1012949496, albedo=-1616845083, normal=312288750, material=211547633, palette=-76459397, tint0=0, tint1=0, tint2=0}, -- -356646862
                    {category=0x7BC10759, drawable=1563571411, albedo=-1340021153, normal=-1269432529, material=241981977, palette=1090645383, tint0=16, tint1=28, tint2=28}, -- 2076247897
                }
            }, 
        }
    },
}

local function GetComponentIndexByCategory(ped, category)
    local numComponents = Citizen.InvokeNative(0x90403E8107B60E81, ped, Citizen.ResultAsInteger()) 
    local componentsCount = GetNumComponentsInPed(ped) 
    for i=0, numComponents-1, 1 do
        local componentCategory = Citizen.InvokeNative(0x9b90842304c938a7, ped, i, 0, Citizen.ResultAsInteger()) 
        Citizen.InvokeNative(0xD3A7B003ED343FD9, ped, componentCategory, false, false, false)
        if componentCategory == category then
            return i
        end
    end
end 

function SetOutfit(type, outfit) 
    local Ped = PlayerPedId()
    local Gender = IsPedMale(Ped) and "male" or "female"
    if Outfits[Gender][type] == nil then
        print("^4[BDO-OUTFITS]:THIS OUTFIT TYPE `" .. type .. "` NOT EXIST IN OUTFITS CONFIG LIST...!^7")
        return
    end
    local Outfit = Outfits[Gender][type][outfit]
 
    if not PlayerSkinData or next(PlayerSkinData) == nil then
        PlayerSkinData = {}
        for category, name in pairs(CategoryNames) do
            local componentIndex = GetComponentIndexByCategory(Ped, category) or GetComponentIndexByCategory(Ped, joaat(name))
            if componentIndex and name then
                local drawable, albedo, normal, material = Citizen.InvokeNative(0xA9C28516A6DC9D56, Ped, componentIndex, Citizen.PointerValueInt(), Citizen.PointerValueInt(), Citizen.PointerValueInt(), Citizen.PointerValueInt())
                local palette, tint0, tint1, tint2 = Citizen.InvokeNative(0xE7998FEC53A33BBE, Ped, componentIndex, Citizen.PointerValueInt(), Citizen.PointerValueInt(), Citizen.PointerValueInt(), Citizen.PointerValueInt())
                --print(string.format("{category=0x%X, drawable=%d, albedo=%d, normal=%d, material=%d, palette=%d, tint0=%d, tint1=%d, tint2=%d},", category, drawable, albedo, normal, material, palette, tint0, tint1, tint2))          
                PlayerSkinData[category] = {drawable=drawable, albedo=albedo, normal=normal, material=material, palette=palette, tint0=tint0, tint1=tint1, tint2=tint2}
            end
        end 
    end
    for category, name in pairs(CategoryNames) do
        if name ~= 'BODIES_UPPER' and name ~= 'BODIES_LOWER' then
            Citizen.InvokeNative(0xD710A5007C2AC539, Ped, category, 0)
            Citizen.InvokeNative(0xAAB86462966168CE, Ped, true)
            Citizen.InvokeNative(0xCC8CA3E88256E58F, Ped, false, true, true, true, false)
        end
    end
    if type ~= 'naked' then
        OutfitType = type
        OutfitIndex = outfit
        IsNaked = false
    else
        IsNaked = true
    end  
    if Outfit then
        if #Outfit.clothes == 1 then
            local item = Outfit.clothes[1] 
            local tempSkinData = {}
            for k, v in pairs(PlayerSkinData) do
                tempSkinData[k] = {}
                for k2, v2 in pairs(v) do
                    tempSkinData[k][k2] = v2
                end
            end 
            tempSkinData[item.category] = {
                drawable = item.drawable,
                albedo = item.albedo,
                normal = item.normal,
                material = item.material,
                palette = item.palette,
                tint0 = item.tint0,
                tint1 = item.tint1,
                tint2 = item.tint2
            } 
            for category, data in pairs(tempSkinData) do
                SetMetaPedTag(Ped, data.drawable, data.albedo, data.normal, data.material, data.palette, data.tint0, data.tint1, data.tint2)
            end
            Citizen.InvokeNative(0xAAB86462966168CE, Ped, true)
            Citizen.InvokeNative(0xCC8CA3E88256E58F, Ped, false, true, true, true, false)
            return
        end 
        for _, item in pairs(Outfit.clothes) do
            SetMetaPedTag(Ped, item.drawable, item.albedo, item.normal, item.material, item.palette, item.tint0, item.tint1, item.tint2)
        end
        Citizen.InvokeNative(0xAAB86462966168CE, Ped, true)
        Citizen.InvokeNative(0xCC8CA3E88256E58F, Ped, false, true, true, true, false)
    else
        print("^4[BDO-OUTFITS]:THIS OUTFIT IS NOT REGISTERED IN THE OUTFIT CONFIG...!^7")
    end 
end

exports('SetOutfit', SetOutfit) 

function SetDefaultOutfit()
    local Ped = PlayerPedId()
    if not PlayerSkinData or next(PlayerSkinData) == nil then 
        return
    end
    for category, name in pairs(CategoryNames) do
        if name ~= 'BODIES_UPPER' and name ~= 'BODIES_LOWER' then
            Citizen.InvokeNative(0xD710A5007C2AC539, Ped, category, 0)
            Citizen.InvokeNative(0xAAB86462966168CE, Ped, true)
            Citizen.InvokeNative(0xCC8CA3E88256E58F, Ped, false, true, true, true, false)
        end
    end
    for category, data in pairs(PlayerSkinData) do
        SetMetaPedTag(Ped, data.drawable, data.albedo, data.normal, data.material, data.palette, data.tint0, data.tint1, data.tint2)
    end
    Citizen.InvokeNative(0xAAB86462966168CE, Ped, true)
    Citizen.InvokeNative(0xCC8CA3E88256E58F, Ped, false, true, true, true, false)
    --print("^4[BDO-OUTFITS]: Hainele default au fost aplicate!^7")
    OutfitType = nil
    OutfitIndex = nil
end

exports('SetDefaultOutfit', SetDefaultOutfit)
 
RegisterCommand(OutfitsSet.SetOutfitsMenuCmd, function(_, args)                  
    if not OutfitsSet.UsingSetOutfitsMenuCmd then return end
    local type = args[1]
    local outfit = tonumber(args[2])  
    SetOutfit(type, outfit)
end, false) 

RegisterCommand(OutfitsSet.UndressPed, function(_, args)                  
    if not OutfitsSet.UndressPed then return end
    local type = args[1]
    local outfit = tonumber(args[2])  
    SetOutfit('naked', 1)
    IsNaked = true
end, false) 

RegisterCommand(OutfitsSet.DressPed, function(_, args)                  
    if not OutfitsSet.DressPed then return end
    local type = args[1]
    local outfit = tonumber(args[2])   
    if OutfitType and OutfitIndex then
        SetOutfit(OutfitType, OutfitIndex)
        IsNaked = false
    else
        SetDefaultOutfit()
    end 
end, false) 

RegisterCommand(OutfitsSet.OutfitsMenuCmd, function()             
    if not OutfitsSet.UsingOutfitsMenuCmd then return end
    local OutfitsMenu = {}
    local ped = PlayerPedId()
    local gender = IsPedMale(ped) and "male" or "female"
    for key, v in pairs(Outfits[gender]) do 
        OutfitsMenu[#OutfitsMenu + 1] = {
            header = OutfitsSet.Language.Menu[OutfitsSet.SetLanguage][key],
            title = OutfitsSet.Language.Menu[OutfitsSet.SetLanguage]['MenuTitle'],
            params = {
                event = 'bdo-outfits:client:GetOutfitsList',
                args = {
                    gender = gender,
                    key = key,
                }   
            }
        }
    end
    exports['bdo-input']:InputMenu(OutfitsMenu, false, 'bdo-outfits/interface', 'menu.png')
end)

RegisterCommand(OutfitsSet.OccasionsOutfit, function() -- aici deschidem meniul si in functie de gender oferim outfiturile pentru gentelman sau ladies  
    if not OutfitsSet.UsingOccasionsOutfit then return end
    local job = Bdo.ClientGetPlayerJob()
    if OutfitsSet.OccasionsOutfitReqJob and job ~= OutfitsSet.OccasionsOutfitJobReq then return Bdo:BottomNotifyCore(OutfitsSet.NotifyOccasionsOutfitJobReq, 3000) end
    local gender = IsPedMale(PlayerPedId()) and "male" or "female"
    local occasions = gender == "male" and 'gentleman' or 'ladies'
    local OutfitsList = {}
    for key, v in pairs(Outfits[gender][occasions]) do
        OutfitsList[#OutfitsList + 1] = {
            header = v.label,
            title = OutfitsSet.Language.Menu[OutfitsSet.SetLanguage][key],
            params = {
                event = 'bdo-outfits:client:SetOutfit',
                args = {
                    type = occasions,
                    outfit = key
                }
            }
        }
    end
    exports['bdo-input']:InputMenu(OutfitsList, false, 'bdo-outfits/interface', 'menu.png')
end, false)

RegisterCommand(OutfitsSet.OccasionCmd, function()
    if not OutfitsSet.OccasionCmdEnsure then return end
    local job = Bdo.ClientGetPlayerJob()
    if OutfitsSet.OccasionCmdEnsureJobReq and job ~= OutfitsSet.OccasionCmdEnsureJobReq then return Bdo:BottomNotifyCore(OutfitsSet.NotifyOccasionCmdEnsureJobReq, 3000) end
    SetDefaultOutfit()
end, false)

RegisterNetEvent('bdo-outfits:client:GetOutfitsList', function(data)
    local OutfitsList = {}
    for key, v in ipairs(Outfits[data.gender][data.key]) do
        OutfitsList[#OutfitsList + 1] = {
            header = v.label,
            title = OutfitsSet.Language.Menu[OutfitsSet.SetLanguage][data.key],
            params = {
                event = 'bdo-outfits:client:SetOutfit',
                args = {
                    type = data.key,
                    outfit = key
                }
            }
        }
    end
    exports['bdo-input']:InputMenu(OutfitsList, false, 'bdo-outfits/interface', 'menu.png')
end)

RegisterNetEvent('bdo-outfits:client:SetOutfit', function(data) 
    SetOutfit(data.type, data.outfit)
end)  
 
CreateThread(function()
    while true do
        Wait(500) 
        if OutfitType and OutfitIndex or IsNaked then
            local Ped = PlayerPedId()
            local Gender = IsPedMale(Ped) and "male" or "female"
            local Outfit = IsNaked and Outfits[Gender].naked[1] or Outfits[Gender][OutfitType] and Outfits[Gender][OutfitType][OutfitIndex]
            if Outfit and Outfit.clothes then 
                local mismatch = false
                -- Set din ce componente are outfitul curent
                local allowedCategories = {}
                for _, item in pairs(Outfit.clothes) do
                    allowedCategories[item.category] = true
                end
                -- Scoate de pe ped orice component care nu e in allowedCategories
                local clearedAny = false
                for category, _ in pairs(CategoryNames) do
                    if not allowedCategories[category] then 
                        local componentIndex = GetComponentIndexByCategory(Ped, category)
                        if componentIndex then
                            Citizen.InvokeNative(0xD710A5007C2AC539, Ped, category, 0) -- clear slot
                            clearedAny = true
                        end
                    end
                end
                if clearedAny then
                    Citizen.InvokeNative(0xAAB86462966168CE, Ped, true)
                    Citizen.InvokeNative(0xCC8CA3E88256E58F, Ped, false, true, true, true, false)
                end
                -- Verificare dacă un slot configurat se potrivește cu config-ul
                for _, item in pairs(Outfit.clothes) do 
                    local componentIndex = GetComponentIndexByCategory(Ped, item.category)
                    if componentIndex then 
                        local drawable, albedo, normal, material = Citizen.InvokeNative(0xA9C28516A6DC9D56, Ped, componentIndex, Citizen.PointerValueInt(), Citizen.PointerValueInt(), Citizen.PointerValueInt(), Citizen.PointerValueInt()) 
                        if drawable ~= item.drawable or albedo ~= item.albedo or normal ~= item.normal or material ~= item.material then 
                            mismatch = true
                            break
                        end
                    end
                end
                if mismatch then
                    SetOutfit(OutfitType, OutfitIndex)
                end
            end
        end
    end
end)


-- CreateThread(function()
--     while true do
--         Wait(500) 
--         if OutfitType and OutfitIndex or IsNaked then
--             local Ped = PlayerPedId()
--             local Gender = IsPedMale(Ped) and "male" or "female"
--             local Outfit = IsNaked and Outfits[Gender].naked[1] or Outfits[Gender][OutfitType] and Outfits[Gender][OutfitType][OutfitIndex]
--             if Outfit and Outfit.clothes then 
--                 local mismatch = false
--                 for _, item in pairs(Outfit.clothes) do 
--                     local componentIndex = GetComponentIndexByCategory(Ped, item.category)
--                     if componentIndex then 
--                         local drawable, albedo, normal, material = Citizen.InvokeNative(0xA9C28516A6DC9D56, Ped, componentIndex, Citizen.PointerValueInt(), Citizen.PointerValueInt(), Citizen.PointerValueInt(), Citizen.PointerValueInt()) 
--                         if drawable ~= item.drawable or albedo ~= item.albedo or normal ~= item.normal or material ~= item.material then 
--                             mismatch = true
--                             break
--                         end
--                     end
--                 end
--                 if mismatch then
--                     SetOutfit(OutfitType, OutfitIndex)
--                 end
--             end
--         end
--     end
-- end)

-- function GetClosestNPC(radius)
--     local playerPed = PlayerPedId()
--     local playerCoords = GetEntityCoords(playerPed)
--     local handle, ped = FindFirstPed()
--     local success
--     local closestPed = nil
--     local closestDist = radius or 3.0

--     repeat
--         if DoesEntityExist(ped) and not IsPedAPlayer(ped) then
--             local pedCoords = GetEntityCoords(ped)
--             local dist = #(playerCoords - pedCoords)
--             if dist < closestDist then
--                 closestDist = dist
--                 closestPed = ped
--             end
--         end
--         success, ped = FindNextPed(handle)
--     until not success
--     EndFindPed(handle)
--     return closestPed
-- end  
 
-- function PrintAllPedComponents(ped)
--     while not IsPedReadyToRender(ped) do
--         Wait(0)
--     end 
--     local playerPed = PlayerPedId()
--     for category, name in pairs(CategoryNames) do
--         if name ~= 'BODIES_UPPER' and name ~= 'BODIES_LOWER' then
--             Citizen.InvokeNative(0xD710A5007C2AC539, playerPed, category, 0)
--             Citizen.InvokeNative(0xAAB86462966168CE, playerPed, true)
--             Citizen.InvokeNative(0xCC8CA3E88256E58F, playerPed, false, true, true, true, false)
--         end
--     end 
 
--     for category, name in pairs(CategoryNames) do   
--         local componentIndex = GetComponentIndexByCategory(ped, category) or GetComponentIndexByCategory(ped, joaat(name))  
--         if componentIndex and name then 
--             local drawable, albedo, normal, material = Citizen.InvokeNative(0xA9C28516A6DC9D56, ped, componentIndex, Citizen.PointerValueInt(), Citizen.PointerValueInt(), Citizen.PointerValueInt(), Citizen.PointerValueInt())
--             local palette, tint0, tint1, tint2 = Citizen.InvokeNative(0xE7998FEC53A33BBE, ped, componentIndex, Citizen.PointerValueInt(), Citizen.PointerValueInt(), Citizen.PointerValueInt(), Citizen.PointerValueInt())
    
--             SetMetaPedTag(playerPed, drawable, albedo, normal, material, palette, tint0, tint1, tint2)
--             print(string.format("{category=0x%X, drawable=%d, albedo=%d, normal=%d, material=%d, palette=%d, tint0=%d, tint1=%d, tint2=%d}, -- %s", category, drawable, albedo, normal, material, palette, tint0, tint1, tint2, tostring(name)))
--         else
--             --print("Nu există componentă pentru slotul: " .. name)
--         end
--     end
 
--     Citizen.InvokeNative(0xAAB86462966168CE, playerPed, true)
--     Citizen.InvokeNative(0xCC8CA3E88256E58F, playerPed, false, true, true, true, false)
-- end

-- RegisterCommand("asd", function()
--     local ped = GetClosestNPC(3.0) -- sau PlayerPedId() pentru player
--     if ped then
--         PrintAllPedComponents(ped)
--     else
--         print("Nu e niciun NPC aproape de tine.")
--     end
-- end, false)

-- RegisterCommand("rrr", function(_, args)
--     local outfit = tonumber(args[1])
--     local ped = GetClosestNPC(3.0) 
--     if ped then 
--         SetPedOutfitPreset(ped, outfit)
--     else
--         print("Nu e niciun NPC aproape de tine.")
--     end
-- end, false)