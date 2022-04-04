
local tagdeveloper = 'nil' -- DONT TOUCH PLEASE 
local tagadmin = 'nil' -- DONT TOUCH PLEASE 
local tagvlasnik = 'nil'  -- DONT TOUCH PLEASE 
local tagspecaros = 'nil' -- DONT TOUCH PLEASE


RegisterNetEvent('dinaj:tagdeveloper')
AddEventHandler('dinaj:tagdeveloper', function(id, tag) 
    if tagdeveloper == 'nil' then
	    if tag == 'true' then
		    tagdeveloper = id .. ''
	    end
	else
	    if tag == 'true' then
		    tagdeveloper = tagdeveloper ..'\n'.. id
	    end
    end
end) 


RegisterNetEvent('dinaj:tagadmin')
AddEventHandler('dinaj:tagadmin', function(id, tag) 
    if tagadmin == 'nil' then
	    if tag == 'true' then
		    tagadmin = id .. ''
	    end
	else
	    if tag == 'true' then
		    tagadmin = tagadmin ..'\n'.. id
	    end
    end
end) 


RegisterNetEvent('dinaj:tagvlasnik')
AddEventHandler('dinaj:tagvlasnik', function(id, tag) 
    if tagvlasnik == 'nil' then
	    if tag == 'true' then
		    tagvlasnik = id .. ''
	    end
	else
	    if tag == 'true' then
		    tagvlasnik = tagvlasnik ..'\n'.. id
	    end
    end
end) 


RegisterNetEvent('dinaj:tagspecaros')
AddEventHandler('dinaj:tagspecaros', function(id, tag) 
    if tagspecaros == 'nil' then
	    if tag == 'true' then
		    tagspecaros = id .. ''
	    end
	else
	    if tag == 'true' then
		    tagspecaros = tagspecaros ..'\n'.. id
	    end
    end
end) 

RegisterNetEvent('dinaj:ocistitagare')
AddEventHandler('dinaj:ocistitagare', function() 
    tagdeveloper = 'nil'
    tagadmin = 'nil'
	tagvlasnik = 'nil'
	tagspecaros = 'nil'
	TriggerServerEvent('dinaj:SVstarttag')
end) 



Citizen.CreateThread(function ()
    while true do
        for _, player in ipairs(GetActivePlayers()) do
		
		    local ped = GetPlayerPed(player)
			local name = GetPlayerName(player)
			local playerped = PlayerPedId()
            local pedpos = GetEntityCoords(ped)
			local playerpedpos = GetEntityCoords(playerped)
			local distance = #(playerpedpos - pedpos)
			local x2, y2, z2 = table.unpack(GetEntityCoords(ped))
			local offset = 0.8 + displayTAGHeight * 0.1
			z2 = z2 + offset
			
			if not SeeSelfTag then 
                if ped ~= playerped then
				    if ignorePlayerNameDistance then
						for i,l in ipairs(stringsplit(tagdeveloper, "\n")) do
			            	for i = 1, #l do
						    	if l == tostring(GetPlayerServerId(player)) then
		                        	DrawText3DTag(vector3(x2, y2, z2), "[ "..name.." | Developer ]")
								end
							end
			       	    end
						for i,l in ipairs(stringsplit(tagadmin, "\n")) do
			           	    for i = 1, #l do
						    	if l == tostring(GetPlayerServerId(player)) then
		                        	DrawText3DTag(vector3(x2, y2, z2), "[ "..name.." | Admin ]")
								end
							end
			        	end
						for i,l in ipairs(stringsplit(tagvlasnik, "\n")) do
			            	for i = 1, #l do
						    	if l == tostring(GetPlayerServerId(player)) then
		                        	DrawText3DTag(vector3(x2, y2, z2), "[ "..name.." | Vlasnik ]")
								end
							end
			        	end
						for i,l in ipairs(stringsplit(tagspecaros, "\n")) do
			            	for i = 1, #l do
						    	if l == tostring(GetPlayerServerId(player)) then
		                        	DrawText3DTag(vector3(x2, y2, z2), "[ "..name.." | Spectate tim ]")
								end
							end
			        	end
					else
					    if distance < playerNamesDist then
                    	    if not ignorePlayerNameDistance then
					            for i,l in ipairs(stringsplit(tagdeveloper, "\n")) do
			                        for i = 1, #l do
						                if l == tostring(GetPlayerServerId(player)) then
		                                    DrawText3DTag(vector3(x2, y2, z2), "[ "..name.." | Developer ]")
							            end
						            end
								end
						        for i,l in ipairs(stringsplit(tagadmin, "\n")) do
			                        for i = 1, #l do
						                if l == tostring(GetPlayerServerId(player)) then
		                                    DrawText3DTag(vector3(x2, y2, z2), "[ "..name.." | Admin ]")
							            end
						            end
								end
						        for i,l in ipairs(stringsplit(tagvlasnik, "\n")) do
			                        for i = 1, #l do
						                if l == tostring(GetPlayerServerId(player)) then
		                                    DrawText3DTag(vector3(x2, y2, z2), "[ "..name.." | Vlasnik ]")
							            end
									end
						        end
						        for i,l in ipairs(stringsplit(tagspecaros, "\n")) do
			                        for i = 1, #l do
						                if l == tostring(GetPlayerServerId(player)) then
		                                    DrawText3DTag(vector3(x2, y2, z2), "[ "..name.." | Spectate tim ]")
										end
									end
							    end
						    end
			            end
			        end
                end  
            else
                if ignorePlayerNameDistance then
					for i,l in ipairs(stringsplit(tagdeveloper, "\n")) do
			            for i = 1, #l do
						    if l == tostring(GetPlayerServerId(player)) then
		                        DrawText3DTag(vector3(x2, y2, z2), "[ "..name.." | Developer ]")
							end
						end
			        end
				
				    for i,l in ipairs(stringsplit(tagadmin, "\n")) do
			            for i = 1, #l do
						    if l == tostring(GetPlayerServerId(player)) then
		                        DrawText3DTag(vector3(x2, y2, z2), "[ "..name.." | Admin ]")
							end
						end
			        end
				
				    for i,l in ipairs(stringsplit(tagvlasnik, "\n")) do
			            for i = 1, #l do
						    if l == tostring(GetPlayerServerId(player)) then
		                        DrawText3DTag(vector3(x2, y2, z2), "[ "..name.." | Vlasnik ]")
							end
						end
			        end
				
				    for i,l in ipairs(stringsplit(tagspecaros, "\n")) do
			            for i = 1, #l do
						    if l == tostring(GetPlayerServerId(player)) then
		                        DrawText3DTag(vector3(x2, y2, z2), "[ "..name.." | Spectate tim ]")
							end
						end
			        end
				else
                    if distance < playerNamesDist then
                        if not ignorePlayerNameDistance then
					        for i,l in ipairs(stringsplit(tagdeveloper, "\n")) do
                                for i = 1, #l do
						            if l == tostring(GetPlayerServerId(player)) then
		                                DrawText3DTag(vector3(x2, y2, z2), "[ "..name.." | Developer ]")
			                        end
								end
							end
						end
						for i,l in ipairs(stringsplit(tagadmin, "\n")) do
			                for i = 1, #l do
						        if l == tostring(GetPlayerServerId(player)) then
		                            DrawText3DTag(vector3(x2, y2, z2),  "[ "..name.." | Admin ]")
							    end
						    end
			            end
						for i,l in ipairs(stringsplit(tagvlasnik, "\n")) do
			                for i = 1, #l do
						        if l == tostring(GetPlayerServerId(player)) then
		                            DrawText3DTag(vector3(x2, y2, z2), "[ "..name.." | Vlasnik ]")
							    end
						    end
			            end
						for i,l in ipairs(stringsplit(tagspecaros, "\n")) do
			                for i = 1, #l do
						        if l == tostring(GetPlayerServerId(player)) then
		                            DrawText3DTag(vector3(x2, y2, z2), "[ "..name.." | Spectate tim ]")
							    end
						    end
			            end
			        end
                end  
            end
        end
        Citizen.Wait(5)
    end
end)



function DrawText3DTag(coords, text)
    -- Format the text
    SetTextColour(250, 250, 250, 200)
    SetTextScale(0.0, 0.4)
    SetTextFont(4)
	SetTextColour(34, 214, 108, 200)
    SetTextDropshadow(0, 0, 0, 0, 200)
    SetTextEdge(2, 0, 0, 0, 150)
    SetTextOutline()
	SetTextCentre(1)
	SetTextProportional(1)
    SetTextDropShadow()
    SetTextCentre(true)

    -- Diplay the text
    BeginTextCommandDisplayText("STRING")
    AddTextComponentSubstringPlayerName(text)
    SetDrawOrigin(coords, 0)
    EndTextCommandDisplayText(0.0, 0.0)
    ClearDrawOrigin()
end


function stringsplit(inputstr, sep)
    if sep == nil then
        sep = "%s"
    end
    local t={} ; i=1
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        t[i] = str
        i = i + 1
    end
    return t
end
