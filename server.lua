local tagondeveloper = {}
local tagonchecksuperadmin = {}
local developerindex = 0 -- DONT TOUCH PLEASE!


local tagonadmin = {}
local tagoncheckadmin = {}
local adminindex = 0 -- DONT TOUCH PLEASE!


local tagonvlasnik = {}
local tagoncheckmod = {}
local vlasnikindex = 0 -- DONT TOUCH PLEASE!


local tagonspecaros = {}
local tagoncheckhelper = {}
local specarosindex = 0 -- DONT TOUCH PLEASE!


RegisterServerEvent("dinaj:SVstarttag")
AddEventHandler('dinaj:SVstarttag', function()
    local playerId = source
    if jeDeveloper(playerId) then
	    dprint('Allowed developeri: ' .. playerId)
	    developerindex = developerindex + 1
	    tagondeveloper[developerindex] = {
	        ['id'] = playerId,
	    }
	end
	if jeAdmin(playerId) then
	    dprint('Allowed Admin: ' .. playerId)
	    adminindex = adminindex + 1
	    tagonadmin[adminindex] = {
	        ['id'] = playerId,
	    }
	end
	if jeMod(playerId) then
	    dprint('Allowed Mod: ' .. playerId)
	    vlasnikindex = vlasnikindex + 1
	    tagonvlasnik[vlasnikindex] = {
	        ['id'] = playerId,
	    }
	end
	if jeSpecaros(playerId) then
	    dprint('Allowed Helper: ' .. playerId)
	    specarosindex = specarosindex + 1
	    tagonspecaros[specarosindex] = {
	        ['id'] = playerId,
	    }
	end	  
	dinajrestarttagdeveloper()
	dinajrestarttagadmin()
	dinajrestarttagvlasnik()
	dinajrestarttagspecaros()
end)
	
RegisterServerEvent("dinaj:SVstarttagjoin")
AddEventHandler('dinaj:SVstarttagjoin', function()
    local playerId = source
    if jeDeveloper(playerId) then
	    dprint('Allowed developeri: ' .. playerId)
	    developerindex = developerindex + 1
	    tagonchecksuperadmin[playerId] = true
	    tagondeveloper[developerindex] = {
	        ['id'] = playerId,
	    }
	end
	if jeAdmin(playerId) then
	    dprint('Allowed Admin: ' .. playerId)
	    adminindex = adminindex + 1
	    tagoncheckadmin[playerId] = true
	    tagonadmin[adminindex] = {
	        ['id'] = playerId,
	    }
	end
	if jeMod(playerId) then
	    dprint('Allowed Mod: ' .. playerId)
	    vlasnikindex = vlasnikindex + 1
	    tagoncheckmod[playerId] = true
	    tagonvlasnik[vlasnikindex] = {
	        ['id'] = playerId,
	    }
	end
	if jeSpecaros(playerId) then
	    dprint('Allowed Helper: ' .. playerId)
	    specarosindex = specarosindex + 1
	    tagoncheckhelper[playerId] = true
	    tagonspecaros[specarosindex] = {
	        ['id'] = playerId,
	    }
	end
	dinajrestarttagdeveloper()
	dinajrestarttagadmin()
	dinajrestarttagvlasnik()
	dinajrestarttagspecaros()
end)


function dinajrestarttagdeveloper()
    dprint('Restartovanje developeri...')
    for i = 1, #tagondeveloper,1 do
        if tagonchecksuperadmin[tagondeveloper[i].id] == true then	
    	    TriggerClientEvent("dinaj:tagdeveloper", -1, tagondeveloper[i].id, 'true')
	        dprint('developeri ciscenje ID:: ' .. tagondeveloper[i].id)
        else
    	    TriggerClientEvent("dinaj:tagdeveloper", -1, tagondeveloper[i].id, 'false')
	        dprint('developeri ciscenje ID:: ' .. tagondeveloper[i].id)
		end
	end
end


function dinajrestarttagadmin()
    dprint('Restartovanje admini...')
    for i = 1, #tagonadmin,1 do
        if tagoncheckadmin[tagonadmin[i].id] == true then	
    	    TriggerClientEvent("dinaj:tagadmin", -1, tagonadmin[i].id, 'true')
	        dprint('admini ciscenje ID:: ' .. tagonadmin[i].id)
        else
    	    TriggerClientEvent("dinaj:tagadmin", -1, tagonadmin[i].id, 'false')
	        dprint('admini ciscenje ID:: ' .. tagonadmin[i].id)
		end
	end
end


function dinajrestarttagvlasnik()
    dprint('Restartovanje vlasnici...')
    for i = 1, #tagonvlasnik,1 do
        if tagoncheckmod[tagonvlasnik[i].id] == true then	
    	    TriggerClientEvent("dinaj:tagvlasnik", -1, tagonvlasnik[i].id, 'true')
	        dprint('vlasnici ciscenje ID:: ' .. tagonvlasnik[i].id)
        else
    	    TriggerClientEvent("dinaj:tagvlasnik", -1, tagonvlasnik[i].id, 'false')
	        dprint('vlasnici ciscenje ID:: ' .. tagonvlasnik[i].id)
		end
	end
end

function dinajrestarttagspecaros()
    dprint('Restartovanje specarosi...')
    for i = 1, #tagonspecaros,1 do
        if tagoncheckhelper[tagonspecaros[i].id] == true then	
    	    TriggerClientEvent("dinaj:tagspecaros", -1, tagonspecaros[i].id, 'true')
	        dprint('specarosi ciscenje ID:: ' .. tagonspecaros[i].id)
        else
    	    TriggerClientEvent("dinaj:tagspecaros", -1, tagonspecaros[i].id, 'false')
	        dprint('specarosi ciscenje ID:: ' .. tagonspecaros[i].id)
		end
	end
end

function dinajCleanTagTable()
    dprint("Cleaning...")
    developerindex = 0
	adminindex = 0
	vlasnikindex = 0
	specarosindex = 0
	if DebugZaRetarde then
	    for i = 1, #tagondeveloper,1 do
		    dprint("developeri ciscenje ID: "  .. tagondeveloper[i].id)
	    end
		for i = 1, #tagonadmin,1 do
		    dprint("admini ciscenje ID: "  .. tagonadmin[i].id)
	    end
		for i = 1, #tagonvlasnik,1 do
		    dprint("vlasnici ciscenje ID: "  .. tagonvlasnik[i].id)
	    end
		for i = 1, #tagonspecaros,1 do
		    dprint("specarosi ciscenje ID: "  .. tagonspecaros[i].id)
	    end
	end
	for k in pairs (tagondeveloper) do
        tagondeveloper [k] = nil
    end
	for k in pairs (tagonadmin) do
        tagonadmin [k] = nil
    end
	for k in pairs (tagonvlasnik) do
        tagonvlasnik [k] = nil
    end
	for k in pairs (tagonspecaros) do
        tagonspecaros [k] = nil
    end
	TriggerClientEvent("dinaj:ocistitagare", -1)
end

RegisterCommand("tag", function(source, args, rawCommand)
    if jeDeveloper(source) then
	    if tagonchecksuperadmin[source] == true  then
			tagonchecksuperadmin[source] = false
		    developerindex = 0
			for k in pairs (tagondeveloper) do
        		tagondeveloper [k] = nil
    		end
			TriggerClientEvent("dinaj:ocistitagare", -1)
		    TriggerClientEvent('chatMessage', source, "Staff tag ugašen!")
		else
			tagonchecksuperadmin[source] = true
			developerindex = 0
			for k in pairs (tagondeveloper) do
        		tagondeveloper [k] = nil
    		end
			TriggerClientEvent("dinaj:ocistitagare", -1)
			TriggerClientEvent('chatMessage', source, "Staff tag upaljen!")
	    end
	end
	if jeAdmin(source) then
	    if tagoncheckadmin[source] == true  then
			tagoncheckadmin[source] = false
		    adminindex = 0
			for k in pairs (tagonadmin) do
        		tagonadmin [k] = nil
    	    end
			TriggerClientEvent("dinaj:ocistitagare", -1)
		    TriggerClientEvent('chatMessage', source, "Staff tag ugašen!")
		else
			tagoncheckadmin[source] = true
			adminindex = 0
			for k in pairs (tagonadmin) do
        		tagonadmin [k] = nil
    		end
			TriggerClientEvent("dinaj:ocistitagare", -1)
			TriggerClientEvent('chatMessage', source, "Staff tag upaljen!")
	    end
	end
    if jeMod(source) then
	    if tagoncheckmod[source] == true  then
		    tagoncheckmod[source] = false
		    vlasnikindex = 0
			for k in pairs (tagonvlasnik) do
        		tagonvlasnik [k] = nil
    		end
			TriggerClientEvent("dinaj:ocistitagare", -1)
		    TriggerClientEvent('chatMessage', source, "Staff tag ugašen!")
		else
			tagoncheckmod[source] = true
			vlasnikindex = 0
			for k in pairs (tagonvlasnik) do
        		tagonvlasnik [k] = nil
    	    end
			TriggerClientEvent("dinaj:ocistitagare", -1)
			TriggerClientEvent('chatMessage', source, "Staff tag upaljen!")
		end
	end
	if jeSpecaros(source) then
	    if tagoncheckhelper[source] == true  then
			tagoncheckhelper[source] = false
		    specarosindex = 0
		    for k in pairs (tagonspecaros) do
        		tagonspecaros [k] = nil
    		end
			TriggerClientEvent("dinaj:ocistitagare", -1)
		    TriggerClientEvent('chatMessage', source, "Staff tag ugašen!")
		else
			tagoncheckhelper[source] = true
			specarosindex = 0
		    for k in pairs (tagonspecaros) do
        		tagonspecaros [k] = nil
    	    end
			TriggerClientEvent("dinaj:ocistitagare", -1)
			TriggerClientEvent('chatMessage', source, "Staff tag upaljen!")
		end
	end
end, false)


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

function jeDeveloper(player)
    local allowed = false
    for i,id in ipairs(developeri) do
        for x,pid in ipairs(GetPlayerIdentifiers(player)) do
            if string.lower(pid) == string.lower(id) then
                allowed = true
            end
        end
    end
    return allowed
end

function jeAdmin(player)
    local allowed = false
    for i,id in ipairs(admini) do
        for x,pid in ipairs(GetPlayerIdentifiers(player)) do
            if string.lower(pid) == string.lower(id) then
                allowed = true
            end
        end
    end
    return allowed
end

function jeMod(player)
    local allowed = false
    for i,id in ipairs(vlasnici) do
        for x,pid in ipairs(GetPlayerIdentifiers(player)) do
            if string.lower(pid) == string.lower(id) then
                allowed = true
            end
        end
    end
    return allowed
end

function jeSpecaros(player)
    local allowed = false
    for i,id in ipairs(specarosi) do
        for x,pid in ipairs(GetPlayerIdentifiers(player)) do
            if string.lower(pid) == string.lower(id) then
                allowed = true
            end
        end
    end
    return allowed
end

function dprint(msg)
	if DebugZaRetarde then
		print(msg)
	end
end

---THIS CLEAN THE TABLE EVERY MINUTE, YOU CAN CHANGE THIS THIME, OPTIONAL. 
function cleantagstable()
	SetTimeout(60000, dinajCleanTagTable)  
	SetTimeout(60000, cleantagstable) 
end

cleantagstable()