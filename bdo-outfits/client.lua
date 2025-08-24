
local categoryNames = {
    [0x9925C067] = joaat('hats'),
    [0x1D4C528A] = joaat('pants'),
    [0x2026C46D] = joaat('shirts_full'), 
    [0x485EE834] = joaat('vests'),
    [0xE06D30CE] = joaat('coats'),
    [0x7BC10759] = joaat('gloves'),
    [0x777EC6EF] = joaat('boots'),
    [0xAF14310B] = joaat('poncho'),
    [0x877A2CF7] = joaat('suspenders'),
    [0x5FC29285] = joaat('neckwear'),
    [0x3C1A74CD] = joaat('neckwear2'),
    [0x662AC34] = joaat('coat2'),
    [0x9B2C8B89] = joaat('gunbelt'),
    [0xF1542D11] = joaat('gunbelt_accs'),
    [0xA6D134C6] = joaat('belt'),
    [0xFAE9107F] = joaat('buckle'),
    [0xB6B6122D] = joaat('holster'),
    [0xC04F118B] = joaat('holster2'),
    [0x94504D26] = joaat('satchel'),
    [0x83887E88] = joaat('loadout'),
    [0xEABE0032] = joaat('gauntlets'),
    [0x7A96FACA] = joaat('ringl'),
    [0xF16A1D23] = joaat('ringr'),
    [0x7B6B036F] = joaat('bracelet'),
    [0x79D7DF96] = joaat('accessory'),
    [0x18729F39] = joaat('spurs'),
    [0x3107499B] = joaat('chaps'),
    [0xFBB5D87F] = joaat('boots2'),
    [0x5A6D85E6] = joaat('mask'),
    [0x9B0A2BFE] = joaat('apron'),
    [0x96EDAE5C] = joaat('teeth'),
    [0xB3966C9] = joaat('BODIES_UPPER'),
    [0x823687F5] = joaat('BODIES_LOWER'),
    [1065202434] = '1065202434',
}

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

local ConfigClothes = {
    Police = {
        male = { 
            hats = { 
                {category=0x9925C067, drawable=525853119, albedo=-256293007, normal=-588281463, material=818090742, tint0=139, tint1=254, tint2=143},
                {category=0x9925C067, drawable=525853119, albedo=-256293007, normal=-588281463, material=818090742, tint0=23, tint1=24, tint2=24}, 
                {category=0x9925C067, drawable=525853119, albedo=-256293007, normal=-588281463, material=818090742, tint0=139, tint1=254, tint2=143}, 
                {category=0x9925C067, drawable=173851521, albedo=-677161978, normal=-984372841, material=-888829087, tint0=9, tint1=9, tint2=9}, 
                {category=0x9925C067, drawable=525853119, albedo=-256293007, normal=-588281463, material=818090742, tint0=23, tint1=24, tint2=24}, 
                {category=0x9925C067, drawable=-143286509, albedo=-1616330501, normal=1998993597, material=1412418863, tint0=141, tint1=254, tint2=254}, -- femeie
            },
            pants = {
                {category=0x1D4C528A, drawable=1723942258, albedo=2112509777, normal=690069542, material=1838257263, tint0=0, tint1=1, tint2=3},
                {category=0xB3966C9, drawable=-1129422788, albedo=-542241787, normal=-843436149, material=1800424428, tint0=68, tint1=57, tint2=2},
                {category=0x1D4C528A, drawable=-191387767, albedo=-1880217208, normal=-509671880, material=-318584341, tint0=56, tint1=21, tint2=56}, 
            },
            coats = {
                {category=0xE06D30CE, drawable=-1345428747, albedo=2134487834, normal=-99377884, material=1759965653, tint0=0, tint1=0, tint2=0},
                {category=0xE06D30CE, drawable=1291754835, albedo=715937446, normal=1491624329, material=421034676, tint0=0, tint1=0, tint2=0},    
                {category=0xE06D30CE, drawable=-2120317290, albedo=-808148941, normal=1751679152, material=2131653421, tint0=15, tint1=16, tint2=15}, 
                {category=0xE06D30CE, drawable=1291754835, albedo=715937446, normal=1491624329, material=421034676, tint0=0, tint1=0, tint2=0}, 
            },
            jewelry_bracelets = {
                {category=0x7BC10759, drawable=-397407957, albedo=-714916835, normal=-1978155534, material=-1195006570, tint0=0, tint1=0, tint2=0},
                {category=0x7BC10759, drawable=-397407957, albedo=-714916835, normal=-1978155534, material=-1195006570, tint0=0, tint1=0, tint2=0}, 
                {category=0x7BC10759, drawable=-35410540, albedo=1422988492, normal=430675706, material=-884128923, tint0=15, tint1=16, tint2=15}, 
                {category=0x7BC10759, drawable=-397407957, albedo=-714916835, normal=-1978155534, material=-1195006570, tint0=0, tint1=0, tint2=0}, 

            }, 
            teeth = {
                {category=0x96EDAE5C, drawable=-1439539395, albedo=528025401, normal=46748413, material=947155584, tint0=0, tint1=0, tint2=0},
                {category=0x96EDAE5C, drawable=-1000238177, albedo=860485841, normal=-1120366532, material=-1435693698, tint0=0, tint1=0, tint2=0}, -- prisonier
                {category=0x96EDAE5C, drawable=-964864985, albedo=528025401, normal=46748413, material=947155584, tint0=0, tint1=0, tint2=0}, -- femeie
            },
            boots = {

            }, 
            BODIES_UPPER = {

            },
            shirts_full = {

            }, 
        },
        female = {
            {category=0x9925C067, drawable=-143286509, albedo=-1616330501, normal=1998993597, material=1412418863, tint0=141, tint1=254, tint2=254}, -- palarie femeie polistist originala
            {category=0x9925C067, drawable=525853119, albedo=-256293007, normal=-588281463, material=818090742, tint0=139, tint1=254, tint2=143}, -- palarie femeie polistist de la politist male 1
            {category=0x9925C067, drawable=525853119, albedo=-256293007, normal=-588281463, material=818090742, tint0=23, tint1=24, tint2=24}, -- palarie femeie polistist de la politist male 2
            {category=0x9925C067, drawable=173851521, albedo=-677161978, normal=-984372841, material=-888829087, tint0=0, tint1=0, tint2=0}, -- palarie femeie polistist de la politist male 3
            {category=0x9925C067, drawable=525853119, albedo=-256293007, normal=-588281463, material=818090742, tint0=139, tint1=254, tint2=143}, -- palarie femeie polistist de la politist male 4
        } 
    }
}

local ConfigOutfits = {
    male = {
        [1] = {
            {category=0x1D4C528A, drawable=1723942258, albedo=2112509777, normal=690069542, material=1838257263, palette=-183908539, tint0=0, tint1=1, tint2=3}, -- 491541130
            {category=0xE06D30CE, drawable=-1345428747, albedo=2134487834, normal=-99377884, material=1759965653, palette=-76459397, tint0=0, tint1=0, tint2=0}, -- -529714994
            {category=0x9925C067, drawable=525853119, albedo=-256293007, normal=-588281463, material=818090742, palette=1669565057, tint0=139, tint1=254, tint2=143}, -- -1725579161
            {category=0x7BC10759, drawable=-397407957, albedo=-714916835, normal=-1978155534, material=-1195006570, palette=-76459397, tint0=0, tint1=0, tint2=0}, -- -356646862
            {category=0x96EDAE5C, drawable=-1439539395, albedo=528025401, normal=46748413, material=947155584, palette=-76459397, tint0=0, tint1=0, tint2=0}, -- -1762808228
        },
        [2] = {
            {category=0x1D4C528A, drawable=1723942258, albedo=2112509777, normal=690069542, material=1838257263, palette=-183908539, tint0=0, tint1=1, tint2=3}, -- 491541130
            {category=0xE06D30CE, drawable=1291754835, albedo=715937446, normal=1491624329, material=421034676, palette=-1436165981, tint0=0, tint1=0, tint2=0}, -- -529714994
            {category=0x9925C067, drawable=525853119, albedo=-256293007, normal=-588281463, material=818090742, palette=-76459397, tint0=23, tint1=24, tint2=24}, -- -1725579161
            {category=0x7BC10759, drawable=-397407957, albedo=-714916835, normal=-1978155534, material=-1195006570, palette=-76459397, tint0=0, tint1=0, tint2=0}, -- -356646862
            {category=0x96EDAE5C, drawable=-1439539395, albedo=528025401, normal=46748413, material=947155584, palette=-783849117, tint0=0, tint1=0, tint2=0}, -- -1762808228
        },
        [3] = {
            {category=0x1D4C528A, drawable=1723942258, albedo=2112509777, normal=690069542, material=1838257263, palette=-183908539, tint0=0, tint1=1, tint2=2}, -- 491541130
            {category=0xE06D30CE, drawable=-2120317290, albedo=-808148941, normal=1751679152, material=2131653421, palette=-76459397, tint0=15, tint1=16, tint2=15}, -- -529714994
            {category=0x9925C067, drawable=525853119, albedo=-256293007, normal=-588281463, material=818090742, palette=1669565057, tint0=139, tint1=254, tint2=143}, -- -1725579161
            {category=0x7BC10759, drawable=-35410540, albedo=1422988492, normal=430675706, material=-884128923, palette=-1436165981, tint0=15, tint1=16, tint2=15}, -- -356646862
            {category=0x96EDAE5C, drawable=-513552989, albedo=384223714, normal=457070985, material=-1611477825, palette=0, tint0=0, tint1=0, tint2=0}, -- -1762808228
        },
        [4] = {
            {category=0xB3966C9, drawable=-1129422788, albedo=-542241787, normal=-843436149, material=1800424428, palette=-1436165981, tint0=68, tint1=57, tint2=2}, -- 188311241
            {category=0x2026C46D, drawable=-1214127888, albedo=2037809824, normal=-297276107, material=546130716, palette=-1436165981, tint0=0, tint1=72, tint2=73}, -- 539411565
            {category=0x9925C067, drawable=173851521, albedo=-677161978, normal=-984372841, material=-888829087, palette=-76459397, tint0=9, tint1=9, tint2=9}, -- -1725579161
            {category=0x96EDAE5C, drawable=-1439539395, albedo=528025401, normal=46748413, material=947155584, palette=0, tint0=0, tint1=0, tint2=0}, -- -1762808228
        }, 
        [5] = {
            {category=0x1D4C528A, drawable=965124777, albedo=-1739436, normal=792923658, material=105949347, palette=0, tint0=0, tint1=0, tint2=0}, -- 491541130
            {category=0x777EC6EF, drawable=-1891744276, albedo=644474146, normal=-106889355, material=855361609, palette=0, tint0=0, tint1=0, tint2=0}, -- 2004797167
            {category=0x2026C46D, drawable=1393854499, albedo=1193089296, normal=1180286298, material=1829146447, palette=0, tint0=0, tint1=0, tint2=0}, -- 539411565
            {category=0xE06D30CE, drawable=2113599174, albedo=-772493731, normal=545104298, material=-1226415126, palette=0, tint0=0, tint1=0, tint2=0}, -- -529714994
            {category=0x485EE834, drawable=2028633127, albedo=866125781, normal=2021166069, material=1189000341, palette=0, tint0=0, tint1=0, tint2=0}, -- 1214179380
            {category=0x9925C067, drawable=1271024966, albedo=1472552168, normal=-339061572, material=-1381462781, palette=1669565057, tint0=20, tint1=20, tint2=40}, -- -1725579161
            {category=0x7BC10759, drawable=-1105428533, albedo=21830886, normal=-1547729907, material=524732347, palette=0, tint0=0, tint1=0, tint2=0}, -- -356646862
            {category=0x96EDAE5C, drawable=-1335425412, albedo=1954605989, normal=-283748646, material=-1286071097, palette=-1436165981, tint0=0, tint1=0, tint2=0}, -- -1762808228
            {category=0x18729F39, drawable=-1368776351, albedo=1992527449, normal=495144942, material=1033827574, palette=0, tint0=0, tint1=0, tint2=0}, -- 145324092
        },
        [6] = {
            {category=0x7A96FACA, drawable=411900003, albedo=-702365097, normal=669677164, material=-418775242, palette=-183908539, tint0=1, tint1=1, tint2=1}, -- -1052460486
            {category=0x1D4C528A, drawable=176645266, albedo=-885313316, normal=-1977069052, material=-2061593421, palette=-183908539, tint0=46, tint1=16, tint2=51}, -- 491541130
            {category=0xE06D30CE, drawable=-1754973085, albedo=-1564902574, normal=-1468799283, material=1001027706, palette=-1436165981, tint0=49, tint1=38, tint2=38}, -- -529714994
            {category=0x485EE834, drawable=-204693026, albedo=238870979, normal=-1599720190, material=-1246113319, palette=-183908539, tint0=61, tint1=200, tint2=205}, -- 1214179380
            {category=0x7BC10759, drawable=1035315425, albedo=1954072985, normal=163869504, material=-760587134, palette=-183908539, tint0=0, tint1=0, tint2=47}, -- -356646862
            {category=0x96EDAE5C, drawable=-1439539395, albedo=528025401, normal=46748413, material=947155584, palette=0, tint0=0, tint1=0, tint2=0}, -- -1762808228
        },
        [7] = {
            {category=0x7A96FACA, drawable=1684176173, albedo=754987030, normal=-225447624, material=-1297388853, palette=0, tint0=0, tint1=0, tint2=0}, -- -1052460486
            {category=0x1D4C528A, drawable=-2112727794, albedo=-793481145, normal=-395052702, material=952507527, palette=-183908539, tint0=65, tint1=35, tint2=0}, -- 491541130
            {category=0xE06D30CE, drawable=-2137563902, albedo=433721459, normal=-1476134882, material=918886534, palette=-1436165981, tint0=154, tint1=21, tint2=47}, -- -529714994
            {category=0x485EE834, drawable=-156962038, albedo=661198519, normal=1079605582, material=-31002414, palette=-1436165981, tint0=15, tint1=60, tint2=21}, -- 1214179380
            {category=0x9925C067, drawable=-1418589795, albedo=-448683462, normal=1805490732, material=1803170466, palette=-76459397, tint0=5, tint1=19, tint2=0}, -- -1725579161
            {category=0x7BC10759, drawable=-386477528, albedo=-1127880905, normal=419586397, material=141730922, palette=-783849117, tint0=15, tint1=15, tint2=15}, -- -356646862
            {category=0x96EDAE5C, drawable=-1439539395, albedo=528025401, normal=46748413, material=947155584, palette=0, tint0=0, tint1=0, tint2=0}, -- -1762808228
        },
        [8] = {
            {category=0x1D4C528A, drawable=-624212920, albedo=-926888255, normal=2056973770, material=-18016631, palette=-1436165981, tint0=0, tint1=0, tint2=0}, -- 491541130
            {category=0x777EC6EF, drawable=-1317853453, albedo=1167351835, normal=254446392, material=1877111151, palette=-1436165981, tint0=0, tint1=0, tint2=0}, -- 2004797167
            {category=0xB3966C9, drawable=608726543, albedo=1765983932, normal=1725041356, material=1800424428, palette=-1436165981, tint0=0, tint1=0, tint2=0}, -- 188311241
            {category=0x2026C46D, drawable=735670151, albedo=-1888289598, normal=-1854379988, material=176711064, palette=-1436165981, tint0=0, tint1=0, tint2=0}, -- 539411565
            {category=0xE06D30CE, drawable=-87520356, albedo=738247393, normal=2096825156, material=111739572, palette=-1436165981, tint0=0, tint1=0, tint2=0}, -- -529714994
            {category=0x485EE834, drawable=-1803327215, albedo=1559736454, normal=-1193080133, material=1505152944, palette=-1436165981, tint0=0, tint1=0, tint2=0}, -- 1214179380
            {category=0x9925C067, drawable=-1422436402, albedo=-228259707, normal=265843288, material=-48595367, palette=-76459397, tint0=0, tint1=0, tint2=0}, -- -1725579161
            {category=0x96EDAE5C, drawable=967875243, albedo=1954605989, normal=-283748646, material=-1286071097, palette=-1436165981, tint0=0, tint1=0, tint2=0}, -- -1762808228
            {category=0x18729F39, drawable=-1830619650, albedo=-1234475126, normal=-97993584, material=879075569, palette=-1436165981, tint0=0, tint1=0, tint2=0}, -- 145324092
        },
        [9] = { -- marshal
            {category=0x79D7DF96, drawable=930202700, albedo=249134150, normal=-122197785, material=284165947, palette=0, tint0=0, tint1=0, tint2=0}, -- -503809350
            {category=0x1D4C528A, drawable=-1428788349, albedo=-1150582536, normal=1581210225, material=-1871144329, palette=0, tint0=0, tint1=0, tint2=0}, -- 491541130
            {category=0x777EC6EF, drawable=-690272614, albedo=-2074599180, normal=805319813, material=-166341591, palette=0, tint0=0, tint1=0, tint2=0}, -- 2004797167
            {category=0x2026C46D, drawable=481827851, albedo=1896989854, normal=-1204001803, material=1938517189, palette=-1436165981, tint0=16, tint1=16, tint2=16}, -- 539411565
            {category=0xE06D30CE, drawable=-1004634573, albedo=-1750504385, normal=-1634405330, material=-771479417, palette=0, tint0=0, tint1=0, tint2=0}, -- -529714994
            {category=0x7BC10759, drawable=-1325881672, albedo=-236554935, normal=-917718345, material=-548245503, palette=-1436165981, tint0=16, tint1=49, tint2=80}, -- -356646862
            {category=0x96EDAE5C, drawable=-1104561086, albedo=-879887817, normal=-334506798, material=2074534126, palette=-1436165981, tint0=0, tint1=0, tint2=0}, -- -1762808228
        },
        [10] = { -- prizonier
            {category=0x1D4C528A, drawable=-191387767, albedo=-1880217208, normal=-509671880, material=-318584341, palette=-1436165981, tint0=56, tint1=21, tint2=56}, -- 491541130
            {category=0x777EC6EF, drawable=1640060077, albedo=-1739103350, normal=32228037, material=-881930859, palette=-183908539, tint0=66, tint1=83, tint2=98}, -- 2004797167
            {category=0xB3966C9, drawable=-863732016, albedo=-542241787, normal=1725041356, material=1800424428, palette=-1436165981, tint0=0, tint1=0, tint2=0}, -- 188311241
            {category=0x2026C46D, drawable=1298870604, albedo=1144720348, normal=496731875, material=-1151469321, palette=-1436165981, tint0=41, tint1=21, tint2=56}, -- 539411565
            {category=0x96EDAE5C, drawable=-1000238177, albedo=860485841, normal=-1120366532, material=-1435693698, palette=0, tint0=0, tint1=0, tint2=0}, -- -1762808228
        },
        [11] = {
            {category=0x1D4C528A, drawable=1723942258, albedo=2112509777, normal=690069542, material=1838257263, palette=-183908539, tint0=0, tint1=1, tint2=3}, -- 491541130
            {category=0xE06D30CE, drawable=1291754835, albedo=715937446, normal=1491624329, material=421034676, palette=-1436165981, tint0=0, tint1=0, tint2=0}, -- -529714994
            {category=0x9925C067, drawable=1599070998, albedo=2014390805, normal=88936532, material=1534695787, palette=864404955, tint0=21, tint1=47, tint2=17}, -- -1725579161
            {category=0x7BC10759, drawable=-397407957, albedo=-714916835, normal=-1978155534, material=-1195006570, palette=-183908539, tint0=0, tint1=0, tint2=64}, -- -356646862
            {category=0x96EDAE5C, drawable=-1439539395, albedo=528025401, normal=46748413, material=947155584, palette=-783849117, tint0=0, tint1=0, tint2=0}, -- -1762808228
        }, 
    },
    female = {
        [1] = {
            {category=0xB3966C9, drawable=-1021748989, albedo=-869920080, normal=1387980394, material=808456005, tint0=0, tint1=0, tint2=0},
            {category=0x9925C067, drawable=-143286509, albedo=-1616330501, normal=1998993597, material=1412418863, tint0=141, tint1=254, tint2=254}, -- palarie femeie polistist originala
            {category=0x3F7DB302, drawable=-51762828, albedo=2037809824, normal=-297276107, material=546130716, tint0=0, tint1=0, tint2=0},
            {category=0x96EDAE5C, drawable=-964864985, albedo=528025401, normal=46748413, material=947155584, palette=-783849117, tint0=0, tint1=0, tint2=0},
        },
        [2] = { -- prizonier
            {category=0x1D4C528A, drawable=-1794828308, albedo=1514403428, normal=-1481743709, material=-1279276906, palette=-1436165981, tint0=20, tint1=16, tint2=47}, -- 491541130
            {category=0x777EC6EF, drawable=-1798246732, albedo=-1739103350, normal=32228037, material=-881930859, palette=-783849117, tint0=2, tint1=2, tint2=97}, -- 2004797167
            {category=0xB3966C9, drawable=982242418, albedo=156776806, normal=1387980394, material=808456005, palette=-1529893936, tint0=0, tint1=0, tint2=0}, -- 188311241
            {category=0x2026C46D, drawable=-1907293895, albedo=-651383576, normal=-396122322, material=-240284906, palette=-1436165981, tint0=20, tint1=16, tint2=47}, -- 539411565
            {category=0x96EDAE5C, drawable=-964864985, albedo=528025401, normal=46748413, material=947155584, palette=0, tint0=0, tint1=0, tint2=0}, -- -1762808228
        },
    },
}

RegisterCommand('outfit', function(_, args)
    local outfit = tonumber(args[1])
    local ped = PlayerPedId()
    for category, name in pairs(categoryNames) do
        if name ~= 'BODIES_UPPER' and name ~= 'BODIES_LOWER' then
            Citizen.InvokeNative(0xD710A5007C2AC539, ped, category, 0)
            Citizen.InvokeNative(0xAAB86462966168CE, ped, true)
            Citizen.InvokeNative(0xCC8CA3E88256E58F, ped, false, true, true, true, false)
        end
    end
    for _, outfit in pairs(ConfigOutfits.male[outfit]) do   
        SetMetaPedTag(ped, outfit.drawable, outfit.albedo, outfit.normal, outfit.material, outfit.palette, outfit.tint0, outfit.tint1, outfit.tint2)
    end
    Citizen.InvokeNative(0xAAB86462966168CE, ped, true)
    Citizen.InvokeNative(0xCC8CA3E88256E58F, ped, false, true, true, true, false)
end, false)

function PrintAllPedComponents(ped)
    while not IsPedReadyToRender(ped) do
        Wait(0)
    end 
    local playerPed = PlayerPedId()
    for category, name in pairs(categoryNames) do
        if name ~= 'BODIES_UPPER' and name ~= 'BODIES_LOWER' then
            Citizen.InvokeNative(0xD710A5007C2AC539, playerPed, category, 0)
            Citizen.InvokeNative(0xAAB86462966168CE, playerPed, true)
            Citizen.InvokeNative(0xCC8CA3E88256E58F, playerPed, false, true, true, true, false)
        end
    end

    function GetComponentIndexByCategory(ped, category)
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

    local list_female_clothes = {
        {index = 0, drawable = -529714994, albedo = -1823412812, normal = -1849549052, material = -2110210949, tint0 = 151, tint1 = 148, tint2 = 149},
        {index = 4, drawable = 188311241, albedo = 869437735, normal = 1387980394, material = 808456005, tint0 = 21, tint1 = 21, tint2 = 21},
    }
 
    for category, name in pairs(categoryNames) do
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
 
  
