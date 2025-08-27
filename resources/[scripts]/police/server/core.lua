-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRPC = Tunnel.getInterface("vRP")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
Expert = {}
Tunnel.bindInterface("police",Expert)
vKEYBOARD = Tunnel.getInterface("keyboard")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local Active = {}
-----------------------------------------------------------------------------------------------------------------------------------------
-- REQUEST
-----------------------------------------------------------------------------------------------------------------------------------------
function Expert.Request()
	local source = source
	local Passport = vRP.Passport(source)
	if Passport and not Active[Passport] and vRP.HasService(Passport,"Policia") then
		local Identity = vRP.Identity(Passport)
		if Identity then
			Active[Passport] = true

			local Messages = {}
			local Hierarchy = vRP.Hierarchy("Policia")[vRP.GetUserHierarchy(Passport, "Policia") + 1]
			local Permission = vRP.HasPermission(Passport,"Policia")
			local ConsultMessages = vRP.Query("police/dashboard/All")
			for _,v in pairs(ConsultMessages) do
				Messages[#Messages + 1] = {
					["id"] = v["id"],
					["Name"] = v["Name"],
					["Message"] = v["Message"]
				}
			end

			local Wanteds = {}
			local ConsultWanteds = vRP.Query("police/wanted/Limit",{ Limit = 1 })
			for _,v in pairs(ConsultWanteds) do
				Wanteds[#Wanteds + 1] = {
					["Passport"] = v["Passport"],
					["Name"] = vRP.FullName(v["Passport"]),
					["Type"] = v["Crime"],
					["Avatar"] = vRP.Avatar(v["Passport"])
				}
			end

			local Prisons = {}
			local ConsultPrisons = vRP.Query("police/prisons/Limit",{ Limit = 3 })
			for _,v in pairs(ConsultPrisons) do
				Prisons[#Prisons + 1] = {
					["Passport"] = v["Passport"],
					["Name"] = vRP.FullName(v["Passport"]),
					["Police"] = vRP.FullName(v["Police"]),
					["Avatar"] = vRP.Avatar(v["Passport"])
				}
			end

			local Courses = {}
			local ConsultCourses = vRP.Query("police/courses/All",{ Passport = Passport })
			for _,v in pairs(ConsultCourses) do
				Courses[#Courses + 1] = {
					["Type"] = v["Type"],
					["Instructor"] = vRP.FullName(v["Police"]),
					["Date"] = v["Date"]
				}
			end

			local TotalFines = vRP.Query("police/dashboard/Fines")
			local TotalServices = vRP.Query("police/dashboard/Services")

			Active[Passport] = nil

			return {
				["Level"] = Permission,
				["Avatar"] = Identity["Avatar"],
				["Name"] = Identity["Name"].." "..Identity["Lastname"],
				["Permission"] = Hierarchy,
				["Badge"] = Identity["Badge"],
				["Messages"] = Messages,
				["Wanteds"] = Wanteds,
				["Prisons"] = Prisons,
				["Courses"] = Courses,
				["Dashboard"] = {
					["Prisons"] = TotalServices[1]["Amount"],
					["Vehicles"] = 0,
					["Fines"] = TotalFines[1]["Amount"]
				}
			}
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- DASHBOARDREMOVEMESSAGE
-----------------------------------------------------------------------------------------------------------------------------------------
function Expert.DashboardRemoveMessage(Number)
	local source = source
	local Number = parseInt(Number)
	local Passport = vRP.Passport(source)
	if Passport and not Active[Passport] and vRP.HasService(Passport,"Policia",1) then
		Active[Passport] = true

		local DoesExist = vRP.Query("police/dashboard/Select",{ id = Number })
		if DoesExist[1] then
			vRP.Query("police/dashboard/RemoveMessage",{ id = Number })
			Active[Passport] = nil

			return true
		end
	end

	Active[Passport] = nil

	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- SEARCHLIST
-----------------------------------------------------------------------------------------------------------------------------------------
function Expert.SearchList()
	local Prisons = {}
	local source = source
	local Passport = vRP.Passport(source)
	if Passport and not Active[Passport] and vRP.HasService(Passport,"Policia") then
		Active[Passport] = true

		local List = {}
		local Consult = vRP.Query("police/prisons/Limit",{ Limit = 8 })
		for _,v in pairs(Consult) do
			local OtherPassport = v["Passport"]
			local Identity = vRP.Identity(OtherPassport)
			if not List[OtherPassport] and Identity then
				List[OtherPassport] = true

				Prisons[#Prisons + 1] = {
					["Passport"] = OtherPassport,
					["Name"] = Identity["Name"].." "..Identity["Lastname"],
					["Phone"] = Identity["Phone"],
					["Sex"] = Identity["Sex"],
					["Blood"] = Sanguine(Identity["Blood"]),
					["Prison"] = Identity["Prison"]
				}
			end
		end

		Active[Passport] = nil
	end

	return Prisons
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- SEARCH
-----------------------------------------------------------------------------------------------------------------------------------------
function Expert.Search(Number)
	local source = source
	local Identity = vRP.Identity(Number)
	local Passport = vRP.Passport(source)
	if Passport and not Active[Passport] and vRP.HasService(Passport,"Policia") and Identity then
		return true
	end

	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- PERSONAL
-----------------------------------------------------------------------------------------------------------------------------------------
function Expert.Personal(Number)
	local source = source
	local Number = parseInt(Number)
	local Passport = vRP.Passport(source)
	if Passport and not Active[Passport] and vRP.HasService(Passport,"Policia") then
		Active[Passport] = true

		local Crimes = {}
		local Identity = vRP.Identity(Number)
		if Identity then
			local Consult = vRP.Query("police/prisons/User",{ Passport = Number })
			for _,v in pairs(Consult) do
				Crimes[#Crimes + 1] = {
					["Police"] = vRP.FullName(v["Police"]),
					["Fines"] = v["Fines"],
					["Services"] = v["Services"],
					["Date"] = v["Date"],
					["Crimes"] = v["Crimes"],
					["Notes"] = v["Notes"]
				}
			end

			Active[Passport] = nil

			return {
				["Passport"] = Number,
				["Avatar"] = Identity["Avatar"],
				["Name"] = Identity["Name"].." "..Identity["Lastname"],
				["Phone"] = Identity["Phone"],
				["Sex"] = Identity["Sex"],
				["Blood"] = Sanguine(Identity["Blood"]),
				["Prison"] = Identity["Prison"],
				["Crimes"] = Crimes
			}
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- PRISON
-----------------------------------------------------------------------------------------------------------------------------------------
function Expert.Prison(Table)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport and not Active[Passport] and vRP.HasService(Passport,"Policia") then
		Active[Passport] = true

		local Fines = parseInt(Table["fines"])
		local Services = parseInt(Table["services"])
		local OtherPassport = parseInt(Table["passport"])

		vRP.Query("police/prisons/Insert",{ Passport = OtherPassport, Police = Passport, Crimes = Table["crimes"], Notes = Table["notes"], Fines = Fines, Services = Services, Date = os.date("%d/%m/%Y").." | "..os.date("%H:%M") })

		if Fines > 0 then
			exports["bank"]:AddFines(OtherPassport,OtherPassport,Fines,Table["crimes"])
		end

		if Services > 0 then
			vRP.InsertPrison(OtherPassport,Services)

			local OtherSource = vRP.Source(OtherPassport)
			if OtherSource then
				vRP.Teleport(OtherSource,1679.94,2513.07,45.56)
				TriggerClientEvent("police:Prisioner",OtherSource,true)
				TriggerClientEvent("Notify",OtherSource,"Boolingbroke","Todas as lixeiras do pátio estão disponíveis para <b>vasculhar</b> em troca de redução penal.","amarelo",30000)
			end
		end

		Active[Passport] = nil

		return true
	end

	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- BADGE
-----------------------------------------------------------------------------------------------------------------------------------------
function Expert.Badge(Number)
	local source = source
	local Number = parseInt(Number)
	local Passport = vRP.Passport(source)
	if Passport and not Active[Passport] and vRP.HasService(Passport,"Policia") and Number > 0 then
		vRP.SetBadge(Passport,Number)

		return true
	end

	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- MESSAGE
-----------------------------------------------------------------------------------------------------------------------------------------
function Expert.Message(Message)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport and vRP.HasGroup(Passport,"Policia",2) then
		vRP.Query("police/dashboard/Message",{ Name = vRP.FullName(Passport), Message = Message })

		return true
	end

	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- COURSES
-----------------------------------------------------------------------------------------------------------------------------------------
function Expert.Courses(Table)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport and vRP.HasGroup(Passport,"Policia",2) then
		vRP.Query("police/courses/Insert",{ Passport = Table["passport"], Police = Table["instructor"], Type = Table["name"], Date = os.date("%d/%m/%Y") })

		return true
	end

	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- DISCONNECT
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("Disconnect",function(Passport,source)
	if Active[Passport] then
		Active[Passport] = nil
	end
end)