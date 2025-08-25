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
    [0xECC8B25A] = joaat('beards_mustache'),
    [0xF8016BCA] = joaat('beards_complete'),
    [0x3F7F3587] = joaat('badges'),
    [0xA0E3AB7F] = joaat('skirts'), 
    [0x7A96FACA] = joaat('neckties'),
    [0x7BE77792] = joaat('holsters_knife'),
    [0x7C00A8F0] = joaat('talisman_holster'),
    [0x8EFB276A] = joaat('talisman_satchel'), 
    [0xDA0E2C55] = joaat('ammo_rifles'),
    [0xDB64A390] = joaat('talisman_wrist'),
    [0x4A73515C] = joaat('MASKS_LARGE'), 
    [0xEA24B45E] = joaat('eyes'), 
    [0x8E84A2AA] = joaat('hair_accessories'),
    [0xA2926F9B] = joaat('dresses'),
    [0x72E6EF74] = joaat('armor'),
    [0x05E47CA6]  = joaat('eyewear'),
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
                    {category=0x1D4C528A, drawable=1723942258, albedo=2112509777, normal=690069542, material=1838257263, palette=-183908539, tint0=0, tint1=1, tint2=3}, -- 491541130
                    {category=0xE06D30CE, drawable=-1345428747, albedo=2134487834, normal=-99377884, material=1759965653, palette=-76459397, tint0=0, tint1=0, tint2=0}, -- -529714994
                    {category=0x9925C067, drawable=525853119, albedo=-256293007, normal=-588281463, material=818090742, palette=1669565057, tint0=139, tint1=254, tint2=143}, -- -1725579161
                    {category=0x7BC10759, drawable=-397407957, albedo=-714916835, normal=-1978155534, material=-1195006570, palette=-76459397, tint0=0, tint1=0, tint2=0}, -- -356646862
                    {category=0x96EDAE5C, drawable=-1439539395, albedo=528025401, normal=46748413, material=947155584, palette=-76459397, tint0=0, tint1=0, tint2=0}, -- -1762808228
                },
            },
            [3] = { 
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][3],        
                clothes = {
                    {category=0x1D4C528A, drawable=1723942258, albedo=2112509777, normal=690069542, material=1838257263, palette=-183908539, tint0=0, tint1=1, tint2=2}, -- 491541130
                    {category=0xE06D30CE, drawable=-2120317290, albedo=-808148941, normal=1751679152, material=2131653421, palette=-76459397, tint0=15, tint1=16, tint2=15}, -- -529714994
                    {category=0x9925C067, drawable=525853119, albedo=-256293007, normal=-588281463, material=818090742, palette=1669565057, tint0=139, tint1=254, tint2=143}, -- -1725579161
                    {category=0x7BC10759, drawable=-35410540, albedo=1422988492, normal=430675706, material=-884128923, palette=-1436165981, tint0=15, tint1=16, tint2=15}, -- -356646862
                    {category=0x96EDAE5C, drawable=-513552989, albedo=384223714, normal=457070985, material=-1611477825, palette=0, tint0=0, tint1=0, tint2=0}, -- -1762808228
                },
            },
            [4] = { 
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][4],
                clothes = {
                    {category=0x1D4C528A, drawable=1723942258, albedo=2112509777, normal=690069542, material=1838257263, palette=-183908539, tint0=0, tint1=1, tint2=3}, -- 491541130
                    {category=0xE06D30CE, drawable=1291754835, albedo=715937446, normal=1491624329, material=421034676, palette=-1436165981, tint0=0, tint1=0, tint2=0}, -- -529714994
                    {category=0x9925C067, drawable=525853119, albedo=-256293007, normal=-588281463, material=818090742, palette=-76459397, tint0=23, tint1=24, tint2=24}, -- -1725579161
                    {category=0x7BC10759, drawable=-397407957, albedo=-714916835, normal=-1978155534, material=-1195006570, palette=-76459397, tint0=0, tint1=0, tint2=0}, -- -356646862
                    {category=0x96EDAE5C, drawable=-1439539395, albedo=528025401, normal=46748413, material=947155584, palette=-783849117, tint0=0, tint1=0, tint2=0}, -- -1762808228
                },
            }, 
            [5] = {
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][5],
                clothes = {
                    {category=0x1D4C528A, drawable=1723942258, albedo=2112509777, normal=690069542, material=1838257263, palette=-183908539, tint0=0, tint1=1, tint2=3}, -- 491541130
                    {category=0xE06D30CE, drawable=1291754835, albedo=715937446, normal=1491624329, material=421034676, palette=-1436165981, tint0=0, tint1=0, tint2=0}, -- -529714994
                    {category=0x9925C067, drawable=1599070998, albedo=2014390805, normal=88936532, material=1534695787, palette=864404955, tint0=21, tint1=47, tint2=17}, -- -1725579161
                    {category=0x7BC10759, drawable=-397407957, albedo=-714916835, normal=-1978155534, material=-1195006570, palette=-183908539, tint0=0, tint1=0, tint2=64}, -- -356646862
                    {category=0x96EDAE5C, drawable=-1439539395, albedo=528025401, normal=46748413, material=947155584, palette=-783849117, tint0=0, tint1=0, tint2=0}, -- -1762808228
                },
            },
            [6] = {
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][6],
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
            [7] = {
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][7],
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
            [8] = {
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][8],
                clothes = {
                    {category=0x1D4C528A, drawable=176645266, albedo=6202941, normal=-1907278769, material=-782709900, palette=-183908539, tint0=14, tint1=6, tint2=4}, -- 491541130
                    {category=0xB3966C9, drawable=402953675, albedo=-542241787, normal=-843436149, material=1800424428, palette=0, tint0=0, tint1=0, tint2=0}, -- 188311241
                    {category=0xE06D30CE, drawable=980163741, albedo=259127114, normal=1604419016, material=-1340108274, palette=-183908539, tint0=0, tint1=3, tint2=65}, -- -529714994
                    {category=0x485EE834, drawable=1989928189, albedo=-342182452, normal=-171537332, material=467069039, palette=-183908539, tint0=60, tint1=121, tint2=121}, -- 1214179380
                    {category=0x9925C067, drawable=1533014470, albedo=-1609118041, normal=-1374909416, material=1508790890, palette=-183908539, tint0=14, tint1=9, tint2=9}, -- -1725579161 
                },
            },
            [9] = {
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][9],
                clothes = {
                    {category=0x1D4C528A, drawable=-1116491255, albedo=-650591881, normal=-1208709833, material=2132618937, palette=-1436165981, tint0=0, tint1=0, tint2=0}, -- 491541130
                    {category=0x777EC6EF, drawable=-1006246715, albedo=-1210048578, normal=813962424, material=456577244, palette=-1436165981, tint0=0, tint1=0, tint2=0}, -- 2004797167
                    {category=0xB3966C9, drawable=-1991023829, albedo=-542241787, normal=-843436149, material=1800424428, palette=-1436165981, tint0=0, tint1=0, tint2=0}, -- 188311241
                    {category=0x2026C46D, drawable=272740873, albedo=-1191531978, normal=301785601, material=-1177558513, palette=-1436165981, tint0=0, tint1=0, tint2=0}, -- 539411565
                    {category=0xE06D30CE, drawable=1731510946, albedo=584958286, normal=-1426726828, material=247050523, palette=0, tint0=0, tint1=0, tint2=0}, -- -529714994
                    {category=0x485EE834, drawable=-2007531057, albedo=-809083487, normal=1958391183, material=1523054631, palette=-1436165981, tint0=0, tint1=0, tint2=0}, -- 1214179380 
                },
            },
            [10] = {
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][10],
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
        },
        prison = {
            [1] = { -- prizonier
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][12],
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
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][19],        
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
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][20],        
                clothes = { 
                    {category=0x7A96FACA, drawable=1736916977, albedo=859590470, normal=849440494, material=-186402972, palette=0, tint0=0, tint1=0, tint2=0}, -- -1052460486
                    {category=0x1D4C528A, drawable=-403694760, albedo=1666639941, normal=-1174818323, material=1246688797, palette=0, tint0=0, tint1=0, tint2=0}, -- 491541130
                    {category=0x777EC6EF, drawable=-139192076, albedo=1234622162, normal=792332941, material=1294286984, palette=0, tint0=0, tint1=0, tint2=0}, -- 2004797167
                    {category=0xB3966C9, drawable=-522692150, albedo=-1045623586, normal=-843436149, material=1800424428, palette=0, tint0=0, tint1=0, tint2=0}, -- 188311241
                    {category=0xE06D30CE, drawable=-739396586, albedo=-1700116836, normal=204620498, material=636391252, palette=-1436165981, tint0=0, tint1=0, tint2=0}, -- -529714994 
                },
            },  
            [3] = {
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][21],        
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
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][22],        
                clothes = { 
                    {category=0x7A96FACA, drawable=-14800051, albedo=1019315718, normal=1563869863, material=-1478366495, palette=-1436165981, tint0=137, tint1=137, tint2=137}, -- -1052460486
                    {category=0x1D4C528A, drawable=1062524676, albedo=-1322666109, normal=-335913858, material=-1021445462, palette=0, tint0=0, tint1=0, tint2=0}, -- 491541130
                    {category=0x777EC6EF, drawable=949484857, albedo=1357281007, normal=-660698115, material=-961263195, palette=0, tint0=0, tint1=0, tint2=0}, -- 2004797167
                    {category=0xB3966C9, drawable=1887902871, albedo=-1550158509, normal=1173544845, material=1800424428, palette=-1436165981, tint0=0, tint1=0, tint2=0}, -- 188311241
                    {category=0x2026C46D, drawable=-1454851511, albedo=800772200, normal=-776860660, material=1117586156, palette=0, tint0=0, tint1=0, tint2=0}, -- 539411565
                    {category=0x485EE834, drawable=1080665738, albedo=-1480824467, normal=-1358925947, material=-467873710, palette=0, tint0=0, tint1=0, tint2=0}, -- 1214179380
                    {category=0x96EDAE5C, drawable=1995084767, albedo=528025401, normal=46748413, material=947155584, palette=0, tint0=0, tint1=0, tint2=0}, -- -1762808228
                },
            },    
        },
        miner = {
            [1] = {
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][23],
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
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][24],
                clothes = { 
                    {category=0x9925C067, drawable=213896827, albedo=795943031, normal=1290268429, material=-388326440, palette=-76459397, tint0=22, tint1=10, tint2=96}, -- -1725579161 
                },
            },
        },
    },
    female = {
        police = {
            [1] = {
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][13],        
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
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][14],        
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
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][15],        
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
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][16],        
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
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][17],        
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
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][18],
                clothes = {
                    {category=0x1D4C528A, drawable=-1794828308, albedo=1514403428, normal=-1481743709, material=-1279276906, palette=-1436165981, tint0=20, tint1=16, tint2=47}, -- 491541130
                    {category=0x777EC6EF, drawable=-1798246732, albedo=-1739103350, normal=32228037, material=-881930859, palette=-783849117, tint0=2, tint1=2, tint2=97}, -- 2004797167
                    {category=0xB3966C9, drawable=982242418, albedo=156776806, normal=1387980394, material=808456005, palette=-1529893936, tint0=0, tint1=0, tint2=0}, -- 188311241
                    {category=0x2026C46D, drawable=-1907293895, albedo=-651383576, normal=-396122322, material=-240284906, palette=-1436165981, tint0=20, tint1=16, tint2=47}, -- 539411565
                    {category=0x96EDAE5C, drawable=-964864985, albedo=528025401, normal=46748413, material=947155584, palette=0, tint0=0, tint1=0, tint2=0}, -- -1762808228
                },
            },
        },
        doctor = {
            [1] = {
                label = OutfitsSet.Language.Outfits[OutfitsSet.SetLanguage][25],
                clothes = {
                    {category=0x96EDAE5C, drawable=-964864985, albedo=528025401, normal=46748413, material=947155584, palette=1090645383, tint0=15, tint1=15, tint2=15}, -- -1762808228
                    {category=0x777EC6EF, drawable=-272917581, albedo=99617969, normal=686173355, material=-1487205283, palette=-1251868068, tint0=21, tint1=254, tint2=253}, -- 2004797167
                    {category=0xB3966C9, drawable=764757887, albedo=-1713539050, normal=1387980394, material=808456005, palette=0, tint0=0, tint1=0, tint2=0}, -- 188311241
                    {category=0x2026C46D, drawable=497257015, albedo=-1888764607, normal=-1539908218, material=861402352, palette=1090645383, tint0=15, tint1=15, tint2=15}, -- 539411565
                    {category=0xEA24B45E, drawable=2044677326, albedo=-1122970326, normal=-27363481, material=-2146390887, palette=-1529893936, tint0=3, tint1=73, tint2=43}, -- -366693282
                    {category=0xA0E3AB7F, drawable=-262233026, albedo=-389433163, normal=417220687, material=-983337476, palette=1090645383, tint0=15, tint1=16, tint2=15}, -- -1595692161
                }
            }
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
                print(string.format("{category=0x%X, drawable=%d, albedo=%d, normal=%d, material=%d, palette=%d, tint0=%d, tint1=%d, tint2=%d},", category, drawable, albedo, normal, material, palette, tint0, tint1, tint2))          
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
    print("^4[BDO-OUTFITS]: Hainele default au fost aplicate!^7")
end

exports('SetDefaultOutfit', SetDefaultOutfit)


RegisterCommand(OutfitsSet.SetOutfitsMenuCmd, function(_, args)                  
    if not OutfitsSet.UsingSetOutfitsMenuCmd then return end
    local type = args[1]
    local outfit = tonumber(args[2])  
    SetOutfit(type, outfit)
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

RegisterNetEvent('bdo-outfits:client:GetOutfitsList', function(data)
    local OutfitsList = {}
    for key, v in pairs(Outfits[data.gender][data.key]) do
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
 
 
function GetClosestNPC(radius)
    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)
    local handle, ped = FindFirstPed()
    local success
    local closestPed = nil
    local closestDist = radius or 3.0

    repeat
        if DoesEntityExist(ped) and not IsPedAPlayer(ped) then
            local pedCoords = GetEntityCoords(ped)
            local dist = #(playerCoords - pedCoords)
            if dist < closestDist then
                closestDist = dist
                closestPed = ped
            end
        end
        success, ped = FindNextPed(handle)
    until not success
    EndFindPed(handle)
    return closestPed
end  
 
function PrintAllPedComponents(ped)
    while not IsPedReadyToRender(ped) do
        Wait(0)
    end 
    local playerPed = PlayerPedId()
    for category, name in pairs(CategoryNames) do
        if name ~= 'BODIES_UPPER' and name ~= 'BODIES_LOWER' then
            Citizen.InvokeNative(0xD710A5007C2AC539, playerPed, category, 0)
            Citizen.InvokeNative(0xAAB86462966168CE, playerPed, true)
            Citizen.InvokeNative(0xCC8CA3E88256E58F, playerPed, false, true, true, true, false)
        end
    end 
 
    for category, name in pairs(CategoryNames) do   
        local componentIndex = GetComponentIndexByCategory(ped, category) or GetComponentIndexByCategory(ped, joaat(name))  
        if componentIndex and name then 
            local drawable, albedo, normal, material = Citizen.InvokeNative(0xA9C28516A6DC9D56, ped, componentIndex, Citizen.PointerValueInt(), Citizen.PointerValueInt(), Citizen.PointerValueInt(), Citizen.PointerValueInt())
            local palette, tint0, tint1, tint2 = Citizen.InvokeNative(0xE7998FEC53A33BBE, ped, componentIndex, Citizen.PointerValueInt(), Citizen.PointerValueInt(), Citizen.PointerValueInt(), Citizen.PointerValueInt())
    
            SetMetaPedTag(playerPed, drawable, albedo, normal, material, palette, tint0, tint1, tint2)
            print(string.format("{category=0x%X, drawable=%d, albedo=%d, normal=%d, material=%d, palette=%d, tint0=%d, tint1=%d, tint2=%d}, -- %s", category, drawable, albedo, normal, material, palette, tint0, tint1, tint2, tostring(name)))
        else
            --print("Nu există componentă pentru slotul: " .. name)
        end
    end
 
    Citizen.InvokeNative(0xAAB86462966168CE, playerPed, true)
    Citizen.InvokeNative(0xCC8CA3E88256E58F, playerPed, false, true, true, true, false)
end

RegisterCommand("asd", function()
    local ped = GetClosestNPC(3.0) -- sau PlayerPedId() pentru player
    if ped then
        PrintAllPedComponents(ped)
    else
        print("Nu e niciun NPC aproape de tine.")
    end
end, false)

RegisterCommand("rrr", function(_, args)
    local outfit = tonumber(args[1])
    local ped = GetClosestNPC(3.0) -- sau PlayerPedId() pentru player
    if ped then 
        SetPedOutfitPreset(ped, outfit)
    else
        print("Nu e niciun NPC aproape de tine.")
    end
end, false)
 
  
