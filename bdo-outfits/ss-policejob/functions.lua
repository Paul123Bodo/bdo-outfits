function NOTIFY(text) --SET YOUR NOTIFYCATIONS
    local VorpCore = exports.vorp_core:GetCore()
	VorpCore.NotifyLeft(Config.Text["tittle_notification"], text, "generic_textures", "tick", 6000, "COLOR_WHITE")
end

function DEATHNOTIFY(text) --SET YOUR NOTIFYCATIONS
    local VorpCore = exports.vorp_core:GetCore()
	VorpCore.NotifyLeft("Verificare", text, "generic_textures", "tick", 6000, "COLOR_WHITE")
end

function ALERTNOTIFY(title, text, time)
    local VorpCore = exports.vorp_core:GetCore()
    VorpCore.NotifySimpleTop(title, text, time)
end

function CLOAKROOM() -- if you wanna use a cloak room ! (ClothingScript = true in config)
	TriggerEvent('xakra_clothingstores:OutfitsClothingStoreMenu')
	--TriggerEvent('syn_clothing:OpenOutfits')
	--TriggerEvent('kd_clothingstore:openWardrobe')
    --TriggerEvent("sirevlc_law_and_order_menu")
end    

function GOONDUTY(playerPed, myJob, myGrade) -- if you wanna trigger something when you go onDUTY !
    SIREVLCLAWANDORDER(playerPed, myJob, myGrade)
	--ExecuteCommand("onduty")
	--TriggerServerEvent("syn_society:checkjob")
end

function GOOFFDUTY() -- if you wanna trigger something when you go offDUTY !
    --ExecuteCommand("rc")
	exports['bdo-outfits']:SetDefaultOutfit()
	--ExecuteCommand("offduty")
	--TriggerServerEvent("syn_society:checkjob")
end    

function SIREVLCLAWANDORDER(playerPed, myJob, jobGrade) -- if you have sirevlc_law_and_order
    if myJob == "OfiterValentine" then
    	if IsPedMale(playerPed) then
    		if jobGrade == 1 then
				exports['bdo-outfits']:SetOutfit('police', 1)
			elseif jobGrade == 2 then
				exports['bdo-outfits']:SetOutfit('police', 2)
			elseif jobGrade == 3 then
				exports['bdo-outfits']:SetOutfit('police', 3)
			elseif jobGrade == 4 then
				exports['bdo-outfits']:SetOutfit('police', 4)
			elseif jobGrade == 5 then
				exports['bdo-outfits']:SetOutfit('police', 5)
			elseif jobGrade == 6 then
				exports['bdo-outfits']:SetOutfit('police', 6)
			end
		else
			if jobGrade == 1 then
				exports['bdo-outfits']:SetOutfit('police', 1)
			elseif jobGrade == 2 then
				exports['bdo-outfits']:SetOutfit('police', 1)
			elseif jobGrade == 3 then
				exports['bdo-outfits']:SetOutfit('police', 1)
			elseif jobGrade == 4 then
				exports['bdo-outfits']:SetOutfit('police', 2)
			elseif jobGrade == 5 then
				exports['bdo-outfits']:SetOutfit('police', 2)
			elseif jobGrade == 6 then
				exports['bdo-outfits']:SetOutfit('police', 2)
			end
		end
	elseif myJob == "SerifValentine" then
			if IsPedMale(playerPed) then
				if jobGrade == 7 then
					exports['bdo-outfits']:SetOutfit('police', 7)
				elseif jobGrade == 8 then
					exports['bdo-outfits']:SetOutfit('police', 9)
				end
			else
				if jobGrade == 7 then
					exports['bdo-outfits']:SetOutfit('police', 3)
				elseif jobGrade == 8 then
					exports['bdo-outfits']:SetOutfit('police', 5)
				end
			end
		elseif myJob == "OfiterAnnesburg" then
			if IsPedMale(playerPed) then
				if jobGrade == 1 then
					exports['bdo-outfits']:SetOutfit('police', 1)
				elseif jobGrade == 2 then
					exports['bdo-outfits']:SetOutfit('police', 2)
				elseif jobGrade == 3 then
					exports['bdo-outfits']:SetOutfit('police', 3)
				elseif jobGrade == 4 then
					exports['bdo-outfits']:SetOutfit('police', 4)
				elseif jobGrade == 5 then
					exports['bdo-outfits']:SetOutfit('police', 5)
				elseif jobGrade == 6 then
					exports['bdo-outfits']:SetOutfit('police', 6)
				end
			else
				if jobGrade == 1 then
					exports['bdo-outfits']:SetOutfit('police', 1)
				elseif jobGrade == 2 then
					exports['bdo-outfits']:SetOutfit('police', 1)
				elseif jobGrade == 3 then
					exports['bdo-outfits']:SetOutfit('police', 1)
				elseif jobGrade == 4 then
					exports['bdo-outfits']:SetOutfit('police', 2)
				elseif jobGrade == 5 then
					exports['bdo-outfits']:SetOutfit('police', 2)
				elseif jobGrade == 6 then
					exports['bdo-outfits']:SetOutfit('police', 2)
				end
			end
		elseif myJob == "SerifAnnesburg" then
			if IsPedMale(playerPed) then
				if jobGrade == 7 then
					exports['bdo-outfits']:SetOutfit('police', 7)
				elseif jobGrade == 8 then
					exports['bdo-outfits']:SetOutfit('police', 9)
				end
			else
				if jobGrade == 7 then
					exports['bdo-outfits']:SetOutfit('police', 3)
				elseif jobGrade == 8 then
					exports['bdo-outfits']:SetOutfit('police', 5)
				end
			end
		elseif myJob == "OfiterRhodes" then
			if IsPedMale(playerPed) then
				if jobGrade == 1 then
					exports['bdo-outfits']:SetOutfit('police', 1)
				elseif jobGrade == 2 then
					exports['bdo-outfits']:SetOutfit('police', 2)
				elseif jobGrade == 3 then
					exports['bdo-outfits']:SetOutfit('police', 3)
				elseif jobGrade == 4 then
					exports['bdo-outfits']:SetOutfit('police', 4)
				elseif jobGrade == 5 then
					exports['bdo-outfits']:SetOutfit('police', 5)
				elseif jobGrade == 6 then
					exports['bdo-outfits']:SetOutfit('police', 6)
				end
			else
				if jobGrade == 1 then
					exports['bdo-outfits']:SetOutfit('police', 1)
				elseif jobGrade == 2 then
					exports['bdo-outfits']:SetOutfit('police', 1)
				elseif jobGrade == 3 then
					exports['bdo-outfits']:SetOutfit('police', 1)
				elseif jobGrade == 4 then
					exports['bdo-outfits']:SetOutfit('police', 2)
				elseif jobGrade == 5 then
					exports['bdo-outfits']:SetOutfit('police', 2)
				elseif jobGrade == 6 then
					exports['bdo-outfits']:SetOutfit('police', 2)
				end
			end
		elseif myJob == "SerifRhodes" then
			if IsPedMale(playerPed) then
				if jobGrade == 7 then
					exports['bdo-outfits']:SetOutfit('police', 7)
				elseif jobGrade == 8 then
					exports['bdo-outfits']:SetOutfit('police', 9)
				end
			else
				if jobGrade == 7 then
					exports['bdo-outfits']:SetOutfit('police', 3)
				elseif jobGrade == 8 then
					exports['bdo-outfits']:SetOutfit('police', 5)
				end
			end
		elseif myJob == "OfiterBlackWater" then
			if IsPedMale(playerPed) then
				if jobGrade == 1 then
					exports['bdo-outfits']:SetOutfit('police', 1)
				elseif jobGrade == 2 then
					exports['bdo-outfits']:SetOutfit('police', 2)
				elseif jobGrade == 3 then
					exports['bdo-outfits']:SetOutfit('police', 3)
				elseif jobGrade == 4 then
					exports['bdo-outfits']:SetOutfit('police', 4)
				elseif jobGrade == 5 then
					exports['bdo-outfits']:SetOutfit('police', 5)
				elseif jobGrade == 6 then
					exports['bdo-outfits']:SetOutfit('police', 6)
				end
			else
				if jobGrade == 1 then
					exports['bdo-outfits']:SetOutfit('police', 1)
				elseif jobGrade == 2 then
					exports['bdo-outfits']:SetOutfit('police', 1)
				elseif jobGrade == 3 then
					exports['bdo-outfits']:SetOutfit('police', 1)
				elseif jobGrade == 4 then
					exports['bdo-outfits']:SetOutfit('police', 2)
				elseif jobGrade == 5 then
					exports['bdo-outfits']:SetOutfit('police', 2)
				elseif jobGrade == 6 then
					exports['bdo-outfits']:SetOutfit('police', 2)
				end
			end
		elseif myJob == "SerifBlackWater" then
			if IsPedMale(playerPed) then
				if jobGrade == 7 then
					exports['bdo-outfits']:SetOutfit('police', 7)
				elseif jobGrade == 8 then
					exports['bdo-outfits']:SetOutfit('police', 9)
				end
			else
				if jobGrade == 7 then
					exports['bdo-outfits']:SetOutfit('police', 3)
				elseif jobGrade == 8 then
					exports['bdo-outfits']:SetOutfit('police', 5)
				end
			end
	elseif myJob == "Maresal" then
		if IsPedMale(playerPed) then
			if jobGrade == 8 then
				exports['bdo-outfits']:SetOutfit('police', 11)
			elseif jobGrade == 9 then
				exports['bdo-outfits']:SetOutfit('police', 11)
			elseif jobGrade == 10 then
				exports['bdo-outfits']:SetOutfit('police', 11)
			end
		end
	elseif myJob == "Detectiv" then
		if IsPedMale(playerPed) then
    		if jobGrade == 1 then
				exports['bdo-outfits']:SetOutfit('police', 19)
			elseif jobGrade == 2 then
				exports['bdo-outfits']:SetOutfit('police', 19)
			elseif jobGrade == 3 then
				exports['bdo-outfits']:SetOutfit('police', 19)
			elseif jobGrade == 4 then
				exports['bdo-outfits']:SetOutfit('police', 19)
			elseif jobGrade == 5 then
				exports['bdo-outfits']:SetOutfit('police', 19)
			elseif jobGrade == 6 then
				exports['bdo-outfits']:SetOutfit('police', 19)
			end
		else
			if jobGrade == 1 then
				exports['bdo-outfits']:SetOutfit('police', 4)
			elseif jobGrade == 2 then
				exports['bdo-outfits']:SetOutfit('police', 4)
			elseif jobGrade == 3 then
				exports['bdo-outfits']:SetOutfit('police', 4)
			elseif jobGrade == 4 then
				exports['bdo-outfits']:SetOutfit('police', 4)
			elseif jobGrade == 5 then
				exports['bdo-outfits']:SetOutfit('police', 4)
			elseif jobGrade == 6 then
				exports['bdo-outfits']:SetOutfit('police', 4)
			end
		end
    elseif myJob == "PolitiaFederala" then
		if IsPedMale(playerPed) then
    		if jobGrade == 1 then
				exports['bdo-outfits']:SetOutfit('police', 8)
			elseif jobGrade == 2 then
				exports['bdo-outfits']:SetOutfit('police', 8)
			elseif jobGrade == 3 then
				exports['bdo-outfits']:SetOutfit('police', 8)
			elseif jobGrade == 4 then
				exports['bdo-outfits']:SetOutfit('police', 8)
			elseif jobGrade == 5 then
				exports['bdo-outfits']:SetOutfit('police', 8)
			elseif jobGrade == 6 then
				exports['bdo-outfits']:SetOutfit('police', 8)
			elseif jobGrade == 7 then
				exports['bdo-outfits']:SetOutfit('police', 8)
			elseif jobGrade == 8 then
				exports['bdo-outfits']:SetOutfit('police', 8)
			elseif jobGrade == 9 then
				exports['bdo-outfits']:SetOutfit('police', 9)
			end
		else
			if jobGrade == 1 then
				exports['bdo-outfits']:SetOutfit('police', 5)
			elseif jobGrade == 2 then
				exports['bdo-outfits']:SetOutfit('police', 5)
			elseif jobGrade == 3 then
				exports['bdo-outfits']:SetOutfit('police', 5)
			elseif jobGrade == 4 then
				exports['bdo-outfits']:SetOutfit('police', 5)
			elseif jobGrade == 5 then
				exports['bdo-outfits']:SetOutfit('police', 5)
			elseif jobGrade == 6 then
				exports['bdo-outfits']:SetOutfit('police', 5)
			elseif jobGrade == 7 then
				exports['bdo-outfits']:SetOutfit('police', 5)
			elseif jobGrade == 8 then
				exports['bdo-outfits']:SetOutfit('police', 5)
			elseif jobGrade == 9 then
				exports['bdo-outfits']:SetOutfit('police', 5)
			elseif jobGrade == 10 then
				exports['bdo-outfits']:SetOutfit('police', 5)
			end
		end
	elseif myJob == "PolitieFrontiera" then
		if IsPedMale(playerPed) then
    		if jobGrade == 1 then
				exports['bdo-outfits']:SetOutfit('police', 3)
			elseif jobGrade == 2 then
				exports['bdo-outfits']:SetOutfit('police', 3)
			elseif jobGrade == 3 then
				exports['bdo-outfits']:SetOutfit('police', 3)
			elseif jobGrade == 4 then
				exports['bdo-outfits']:SetOutfit('police', 3)
			elseif jobGrade == 5 then
				exports['bdo-outfits']:SetOutfit('police', 3)
			elseif jobGrade == 6 then
				exports['bdo-outfits']:SetOutfit('police', 3)
			elseif jobGrade == 7 then
				exports['bdo-outfits']:SetOutfit('police', 3)
			elseif jobGrade == 8 then
				exports['bdo-outfits']:SetOutfit('police', 3)
			elseif jobGrade == 9 then
				exports['bdo-outfits']:SetOutfit('police', 3)
			elseif jobGrade == 10 then
				exports['bdo-outfits']:SetOutfit('police', 3)
			end
		else
			if jobGrade == 1 then
				exports['bdo-outfits']:SetOutfit('police', 4)
			elseif jobGrade == 2 then
				exports['bdo-outfits']:SetOutfit('police', 4)
			elseif jobGrade == 3 then
				exports['bdo-outfits']:SetOutfit('police', 4)
			elseif jobGrade == 4 then
				exports['bdo-outfits']:SetOutfit('police', 4)
			elseif jobGrade == 5 then
				exports['bdo-outfits']:SetOutfit('police', 4)
			elseif jobGrade == 6 then
				exports['bdo-outfits']:SetOutfit('police', 4)
			elseif jobGrade == 7 then
				exports['bdo-outfits']:SetOutfit('police', 4)
			elseif jobGrade == 8 then
				exports['bdo-outfits']:SetOutfit('police', 4)
			elseif jobGrade == 9 then
				exports['bdo-outfits']:SetOutfit('police', 4)
			elseif jobGrade == 10 then
				exports['bdo-outfits']:SetOutfit('police', 4)
			end
		end
	end
end

Config.BlacklistCities = {
    --'Annesburg',
    --'Blackwater',
    --'Rhodes',
    'Siska',
    --'StDenis',
    --'Strawberry',
    --'Valentine',
}

Config.BlackListModels = { -- Those npc's don't alert 
	"cs_nbxpolicechiefformal",
    "mp_u_m_m_lom_train_prisoners_01",
    "g_m_m_bountyhunters_01",
    "g_m_m_unibanditos_01",
    "re_street_fight_males_01",
    "U_M_M_BHT_ODRISCOLLSLEEPING",
    "re_street_fight_males_01",
    "mp_g_m_m_bountyhunters_01",
    "U_M_M_BHT_ODRISCOLLMAULED",
    "U_M_M_BHT_ODRISCOLLDRUNK",
    "mp_g_m_m_armoredjuggernauts_01",
}

Config.Zones = { -- ZONE HASHES AND THEIR NAMES (DON'T CHANGE THE HASHES, ONLY THE NAME!) 
[-1825355772] = {City = "BlueWater Marsh"},
[1192830049] = {City = "Aurora Basin"},
[-1657629123] = {City = "Bahia De La Plaz"},
[1498241388] = {City = "Barrow Lagoon"},
[591254234] = {City = "Cairn Lake"},
[-931296374] = {City = "BlackWater"},  
[-1860484356] = {City = "Cattail Pond"},
[-138648964] = {City = "BlackWater"},
[-138648964] = {City = "Dakota River"},
[1418297928] = {City = "Deadboot Creek"},
[-209915926] = {City = "Dewberry Creek"},
[1747109213] = {City = "Elysian Pool"},
[1200586933] = {City = "Eris Field"},
[14408272] = {City = "Flat Iron Lake"},
[-909666220] = {City = "Heartland Oil Fields"},
[2110038470] = {City = "Heartland Overflow"},
[466986025] = {City = "Lakay"},
[1194268234] = {City = "Lake Don Julio"},
[1558584712] = {City = "Lannahechee River"},
[2014257401] = {City = "Little Creek River"},
[-1004072985] = {City = "Lower Montana River"},
[1560871107] = {City = "Mattock Pond"},
[-1225359404] = {City = "Montos Rest"},
[1677110452] = {City = "Moonstone Pond"},
[1806114556] = {City = "Mount Hagen"},
[735229158] = {City = "Ocreaghs Run"},
[1573733873] = {City = "Owanjila"},
[1490773376] = {City = "Roanoke Valley"},
[1737121879] = {City = "San Luis River"},
[-493344856] = {City = "Sea Of Coronado"},
[-410208673] = {City = "Southfield Flats"},
[1688095983] = {City = "Spider Gorge"},
[-1118608187] = {City = "Stillwater Creek"},
[1318629609] = {City = "Upper Montana River"},
[-1774142845] = {City = "Whinyard Strait"},
[-1288973891] = {City = "Aguasdulces"},
[-420810761] = {City = "Armadillo"},
[-849548894] = {City = "Arroyo De la Vibora"},
[206751400] = {City = "Bacchus Bridge"},
[-872824657] = {City = "Bacchus Station"},
[-1660988219] = {City = "Bards Crossing"},
[-1217490622] = {City = "Beartooth Beck"},
[1474025912] = {City = "Benedict Pass"},
[-745404624] = {City = "Benedict Point"},
[-931296374] = {City = "BlackWater"},
[-67181220] = {City = "Bolger Glade"},
[-166839571] = {City = "Braithwaite Manor"},
[573463789] = {City = "Calibans Seat"},
[2084778330] = {City = "Calliga Hall"},
[422513214] = {City = "Calumet Ravine"},
[-2028095666] = {City = "Cinco Torres"},
[-1349514245] = {City = "Citadel Rock"},
[-962704492] = {City = "Cotorra Springs"},
[-484064781] = {City = "Cumberland Falls"},
[1035413795] = {City = "Diablo Ridge"},
[1962976783] = {City = "Donner Falls"},
[350117545] = {City = "Emerald Ranch"},
[-847222477] = {City = "Flatneck Station"},
[-1037423548] = {City = "Fort Mercer"},
[-99881305] = {City = "Fort Wallace"},
[-1114958242] = {City = "Granite Pass"},
[-716869579] = {City = "Hawks Eye Creek"},
[2018850994] = {City = "Jorges Gap"},
[1595262844] = {City = "Kamassa River"},
[1073515151] = {City = "La Capilla"},
[894611678] = {City = "Lagras"},
[831787576] = {City = "Lake Isabella"},
[-1532919875] = {City = "Macfarlanes Ranch"},
[-1203685470] = {City = "Manteca Falls"},
[578416223] = {City = "Manzanita Post"},
[-156397252] = {City = "Mercer Station"},
[548590694] = {City = "Mount Shann"},
[-1420336129] = {City = "Owanjila Dam"},
[278622988] = {City = "Plainview"},
[721024961] = {City = "Quakers Cove"},
[-864457539] = {City = "Rathskeller Fork"},
[1305807350] = {City = "Rhodes"},
[769580703] = {City = "Riggs Station"},
[1767717886] = {City = "Ringneck Creek"},
[1860483486] = {City = "Rio Del Lobo Rock"},
[10200028] = {City = "Saint Denis"},
[1106871234] = {City = "Sisika Penitentiary"},
[-2038495927] = {City = "Tempest Rim"},
[903669278] = {City = "Thieves Landing"},
[-1926488450] = {City = "Three Sisters"},
[-2049654576] = {City = "Tumbleweed"},
[-1988735197] = {City = "Twin Rocks"},  
[1003908247] = {City = "Twin Stack Pass"},  
[-1777630136] = {City = "Valentine"},  
[-1633799162] = {City = "Van Horn Trading Post"},  
[1453682244] = {City = "Wallace Station"},  
[1246510947] = {City = "Window Rock"},  
[1085851378] = {City = "Brandywine Drop"},  
[-1231793417] = {City = "Emerald Station"},  
[-346622837] = {City = "Strawberry"},
[-735849380] = {City = "Wapiti Indian Reservation"},
[-2001518509] = {City = "Annesburg"},
}