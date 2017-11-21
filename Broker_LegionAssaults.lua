-- Events() v3 - Finds right date/time for next event
local function Events()
	TCount=0
	TStart = time({hour=19, min=00, sec=00, day=19, month=11, year=2017, isdst})
	while(TCount < 60) do
		TStart = TStart+66600
		if(TStart - time() > 0) then
			if(TStart - time() < 45000) then
				return(TStart)
			end
		end
		TCount = TCount+1
	end
end

-- Broker stuff, shows time on broker.
local obj = LibStub("LibDataBroker-1.1"):NewDataObject("Legion Assaults", {type = "data source", value = "0", text = "0", icon = "Interface\\Icons\\70_inscription_vantus_rune_tomb"})
local function NextEvent()
	C_Timer.After(1, NextEvent)
	TimeToEvent = Events()
	if not TimeToEvent then
		TimeCalc = "Assault in progress"
	else
		TimeCalc = date('!%H:%M:%S',difftime(TimeToEvent, time()))
	end
	obj.text = TimeCalc
	obj.value = TimeCalc
end

NextEvent()