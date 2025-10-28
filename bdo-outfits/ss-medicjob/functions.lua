function RESSURECT(playerPed)
    TriggerEvent('vorp:resurrectPlayer', playerPed)
    TriggerEvent("vorp:showUi", true)
    TriggerServerEvent("vorpcharacter:getPlayerSkin")
    TriggerServerEvent("vorp:ImDead", false)
end

function METABOLISM(playerPed) -- if you wanna use any metabolism you can set triggers when heal / revive to refill !
	exports["SS-Metabolism"]:AddThirsty(100)
    exports["SS-Metabolism"]:AddHungry(100)
    exports["SS-Metabolism"]:RemoveStress(100)
end

function MEDICALCABMETABOLISM(playerPed) -- if you wanna use any metabolism you can set triggers when heal / revive to refill !
    ClearPedTasks(playerPed)
    ClearPedSecondaryTask(playerPed)
    TriggerEvent("vorp:showUi", true)
	exports["SS-Metabolism"]:AddThirsty(100)
    exports["SS-Metabolism"]:AddHungry(100)
    exports["SS-Metabolism"]:RemoveStress(100)
    Wait(10000)
    TriggerEvent('vorp:resurrectPlayer', playerPed)
end

function SIREVLCMAIDSANDDOCTORS(playerPed, jobGrade) -- if you have sirevlc_maids_and_doctors
    if IsPedMale(playerPed) then
    	if jobGrade == 1 then
			exports['bdo-outfits']:SetOutfit('doctor', 4)
		elseif jobGrade == 2 then
			exports['bdo-outfits']:SetOutfit('doctor', 4)
		elseif jobGrade == 3 then
			exports['bdo-outfits']:SetOutfit('doctor', 5)
		elseif jobGrade == 4 then
			exports['bdo-outfits']:SetOutfit('doctor', 5)
		elseif jobGrade == 5 then
			exports['bdo-outfits']:SetOutfit('doctor', 7)
		elseif jobGrade == 6 then
			exports['bdo-outfits']:SetOutfit('doctor', 7)
		elseif jobGrade == 7 then
			exports['bdo-outfits']:SetOutfit('doctor', 1)
		elseif jobGrade == 8 then
			exports['bdo-outfits']:SetOutfit('doctor', 1)
        elseif jobGrade == 9 then
			exports['bdo-outfits']:SetOutfit('doctor', 6)
		end
	else
		if jobGrade == 1 then
			exports['bdo-outfits']:SetOutfit('doctor', 4)
		elseif jobGrade == 2 then
			exports['bdo-outfits']:SetOutfit('doctor', 4)
		elseif jobGrade == 3 then
			exports['bdo-outfits']:SetOutfit('doctor', 4)
		elseif jobGrade == 4 then
			exports['bdo-outfits']:SetOutfit('doctor', 2)
		elseif jobGrade == 5 then
			exports['bdo-outfits']:SetOutfit('doctor', 2)
		elseif jobGrade == 6 then
			exports['bdo-outfits']:SetOutfit('doctor', 2)
		elseif jobGrade == 7 then
			exports['bdo-outfits']:SetOutfit('doctor', 1)
		elseif jobGrade == 8 then
			exports['bdo-outfits']:SetOutfit('doctor', 3)
		end
	end
end

function ONDUTYSOCIETY() -- if you wan't to trigger some functions when you go onDuty in MedicJob !
	--ExecuteCommand("onduty")
	--TriggerServerEvent("syn_society:checkjob")
end

function OFFDUTYSOCIETY() -- if you wan't to trigger some functions when you go offDuty in MedicJob !
    --ExecuteCommand("rc")
    exports['bdo-outfits']:SetDefaultOutfit()
	--ExecuteCommand("offduty")
	--TriggerServerEvent("syn_society:checkjob")
end

function CLOAKROOM() -- if you wanna use a cloak room ! (ClothingScript = true in config)
	TriggerEvent('xakra_clothingstores:OutfitsClothingStoreMenu')
end

function NOTIFY(text) --SET YOUR NOTIFYCATIONS
    local VORPcore = exports.vorp_core:GetCore()
	VORPcore.NotifyLeft("Medic", text, "generic_textures", "tick", 5000, "COLOR_WHITE")
end
	
function CHECKNOTIFY(text) --SET YOUR NOTIFYCATIONS
    local VORPcore = exports.vorp_core:GetCore()
    VORPcore.NotifyLeft("Medic", text, "generic_textures", "tick", 5000, "COLOR_WHITE")
	--TriggerEvent("vorp:ShowBottomRight", text, 7000)
end
	
function DEATHNOTIFY(text, text1) --SET YOUR NOTIFYCATIONS
    local VORPcore = exports.vorp_core:GetCore()
    VORPcore.NotifyFail(text, text1, 4000)
end

function CurrentZone() -- CURRENT ZONE
	local playerPed = PlayerPedId()
    local pcoords = GetEntityCoords(playerPed)
	local zone = Citizen.InvokeNative(0x43AD8FC02B429D33, pcoords, -1)
	if zone == GetHashKey("Annesburg") then
    	return "Annesburg"
    elseif zone == GetHashKey("Blackwater") then
    	return "Blackwater"
    elseif zone == GetHashKey("Rhodes") then
    	return "Rhodes"
    elseif zone == GetHashKey("StDenis") then
    	return "Saint Denis"
    elseif zone == GetHashKey("Strawberry") then
    	return "Strawberry"
    elseif zone == GetHashKey("Tumbleweed") then
        return "Tumbleweed"
    elseif zone == GetHashKey("Valentine") then
        return "Valentine"
	elseif zone == GetHashKey("Armadillo") then
        return "Armadillo"
	elseif zone == GetHashKey("Vanhorn") then
        return "Vanhorn"
	elseif zone == GetHashKey("Siska") then
        return "Siska"
    elseif zone == GetHashKey("Ambarino") then
        return "Ambarino"
    elseif zone == GetHashKey("Guarma") then
        return "Guarma"
    elseif zone == GetHashKey("Lemoyne") then
        return "Lemoyne"
    elseif zone == GetHashKey("LowerWestElizabeth") then
        return "Lower West Elizabeth"
    elseif zone == GetHashKey("NewAustin") then
        return "New Austin"
    elseif zone == GetHashKey("NewHanover") then
        return "New Hanover"
    elseif zone == GetHashKey("NuevoParaiso") then
        return "Nuevo Paraiso"
    elseif zone == GetHashKey("UpperWestElizabeth") then
        return "Upper West Elizabeth"
    elseif zone == GetHashKey("WestElizabeth") then
        return "West Elizabeth"
	elseif zone == GetHashKey("AguasdulcesFarm") then
        return "Aguasdulces Farm"
	elseif zone == GetHashKey("AguasdulcesRuins") then
        return "Aguasdulces Ruins"
	elseif zone == GetHashKey("AguasdulcesVilla") then
        return "Aguasdulces Villa"
    elseif zone == GetHashKey("BeechersHope") then
        return "Beechers Hope"   
    elseif zone == GetHashKey("Braithwaite") then
        return "Braithwaite"
    elseif zone == GetHashKey("Butcher") then
        return "Butcher"
	elseif zone == GetHashKey("VANHORN") then
        return "Van Horn"
    elseif zone == GetHashKey("Caliga") then
        return "Caliga"
    elseif zone == GetHashKey("cornwall") then
        return "Cornwall"
    elseif zone == GetHashKey("Emerald") then
        return "Emerald"
    elseif zone == GetHashKey("lagras") then
        return "Lagras"    
	elseif zone == GetHashKey("Manicato") then
        return "Manicato"
    elseif zone == GetHashKey("Manzanita") then
        return "Manzanita"
    elseif zone == GetHashKey("Wallace") then
        return "Wallace"
    elseif zone == GetHashKey("wapiti") then
        return "Wapiti"
    elseif zone == GetHashKey("BayouNwa") then
        return "Bayou Nwa"
    elseif zone == GetHashKey("bigvalley") then
        return "Big Valley"
    elseif zone == GetHashKey("ChollaSprings") then
        return "Cholla Springs"
    elseif zone == GetHashKey("GaptoothRidge") then
        return "Gaptooth Ridge"
    elseif zone == GetHashKey("greatPlains") then
        return "Great Plains"
	elseif zone == GetHashKey("BluewaterMarsh") then
        return "Bluewater Marsh"
	elseif zone == GetHashKey("Cumberland") then
        return "Cumberland"
	elseif zone == GetHashKey("DiezCoronas") then
        return "Diez Coronas"
	elseif zone == GetHashKey("DiezCoronas") then
        return "Diez Coronas"
	elseif zone == GetHashKey("GrizzliesEast") then
        return "Grizzlies East"
	elseif zone == GetHashKey("GrizzliesWest") then
        return "Grizzlies West"
	elseif zone == GetHashKey("GuarmaD") then
        return "Guarma"
	elseif zone == GetHashKey("Heartlands") then
        return "Heartlands"
	elseif zone == GetHashKey("HennigansStead") then
        return "Hennigans Stead"
    elseif zone == GetHashKey("Perdido") then
        return "Perdido"
	elseif zone == GetHashKey("PuntaOrgullo") then
        return "Punta Orgullo"
	elseif zone == GetHashKey("RioBravo") then
        return "Rio Bravo"
	elseif zone == GetHashKey("roanoke") then
        return "Roanoke Ridge"
	elseif zone == GetHashKey("scarlettMeadows") then
        return "Scarlett Meadows"
	elseif zone == GetHashKey("TallTrees") then
        return "Tall Trees"
	elseif zone == 0x724E7654 then
        return "Heartland"
	elseif zone == 0x41332496 then
        return "Hanover"
	elseif zone == 0x5CD2A36F then
        return "Heartland"
	elseif zone == 0x9125D14C then
        return "Grizlies"
	elseif zone == 0x943198D3 then
        return "Grizlies"
    elseif zone == 0xD41D039A then
        return "Grizlies"
    elseif zone == 0x945395DF then
        return "Lemoyne"
    elseif zone == 0x0F32B44D then
        return "Lemoyne"
    elseif zone == 0x9652B96E then
        return "Bay Lagras"
	elseif zone == 0x2A6CBBA2 then
        return "Bay Saint Denis"
    elseif zone == 0x2D1A7AF2 then
        return "Sisika"
    elseif zone == 0xFC531E7A then
        return "Braith Waitemanor"
    elseif zone == 0xD218D90D then
        return "Caligahall"
    elseif zone == 0xD3F2B8A7 then
        return "Rhodes"
    elseif zone == 0x41759831 then
        return "New Austin"
	elseif zone == 0x3AC128F9 then
        return "Gaptooth Ridge"
    elseif zone == 0x33D88587 then
        return "Hennigans Stead"
    elseif zone == 0xD428627B then
        return "Rio Bravo"
    elseif zone == 0x41332496 then
        return "New Hanover"
    elseif zone == 0xD69B5B49 then
        return "West Elizabeth"
	end
end