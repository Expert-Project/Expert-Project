-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
Expert = {}
Tunnel.bindInterface("keyboard",Expert)
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local Results = false
local Progress = false
-----------------------------------------------------------------------------------------------------------------------------------------
-- FAILURE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("failure",function(Data,Callback)
	Results = false
	Progress = false
	SetNuiFocus(false,false)

	Callback("Ok")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SUCESS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("success",function(Data,Callback)
	SetNuiFocus(false,false)
	Results = Data["data"]
	Progress = false

	Callback("Ok")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CLOSE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("close",function(Data,Callback)
	Results = false
	Progress = false
	SetNuiFocus(false,false)

	Callback("Ok")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- KEYBOARD
-----------------------------------------------------------------------------------------------------------------------------------------
function Keyboard(Data)
	if Progress then return end

	Progress = true
	SetNuiFocus(true,true)
	SetCursorLocation(0.5,0.5)
	SendNUIMessage({ Action = "Open", Payload = Data })

	while Progress do
		Wait(0)
	end

	return Results
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- PASSWORD
-----------------------------------------------------------------------------------------------------------------------------------------
function Password(First)
	local Array = Keyboard({
		title = "Formulário",
		subtitle = "Preencha os campos abaixo",
		rows = {
			{
				id = 1,
				mode = "password",
				placeholder = First,
				value = ""
			}
		}
	})

	if Array and Array["1"] and Array["1"]["input"] ~= "" then
		return { Array["1"]["input"] }
	end

	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- INSTAGRAM
-----------------------------------------------------------------------------------------------------------------------------------------
function Instagram(First)
	local Array = Keyboard({
		title = "Formulário",
		subtitle = "Selecione o campo abaixo",
		rows = {
			{
				id = 1,
				mode = "options",
				placeholder = "Selecione uma opção",
				options = First,
				value = ""
			}
		}
	})

	if Array and Array["1"] and Array["1"]["input"] ~= "" then
		return { Array["1"]["input"] }
	end

	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- EGGS
-----------------------------------------------------------------------------------------------------------------------------------------
function Eggs(First)
	local Array = Keyboard({
		title = "Caça aos Ovos",
		subtitle = "Selecione o tempo abaixo",
		rows = {
			{
				id = 1,
				mode = "options",
				placeholder = "Selecione um tempo",
				options = First,
				value = ""
			}
		}
	})

	if Array and Array["1"] and Array["1"]["input"] ~= "" then
		return { Array["1"]["input"] }
	end

	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- NITRO
-----------------------------------------------------------------------------------------------------------------------------------------
function Nitro(First)
	local Array = Keyboard({
		title = "Formulário",
		subtitle = "Selecione o campo abaixo",
		rows = {
			{
				id = 1,
				mode = "options",
				placeholder = "Selecione uma opção",
				options = First,
				value = ""
			}
		}
	})

	if Array and Array["1"] and Array["1"]["input"] ~= "" then
		return { Array["1"]["input"] }
	end

	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CREATION
-----------------------------------------------------------------------------------------------------------------------------------------
function Creation(First,Second)
	local Array = Keyboard({
		title = "Formulário",
		subtitle = "Preencha os campos abaixo",
		rows = {
			{
				id = 1,
				mode = "text",
				placeholder = First,
				value = ""
			},{
				id = 2,
				mode = "options",
				placeholder = "Selecione uma opção",
				options = Second,
				value = ""
			}
		}
	})

	if Array and Array["1"] and Array["1"]["input"] ~= "" and Array["2"] and Array["2"]["input"] ~= "" then
		return { Array["1"]["input"],Array["2"]["input"] }
	end

	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- COUPON
-----------------------------------------------------------------------------------------------------------------------------------------
function Coupon(First,Second)
	local Array = Keyboard({
		title = "Cupom",
		subtitle = "Preencha os campos abaixo",
		rows = {
			{
				id = 1,
				mode = "text",
				placeholder = First,
				value = ""
			},{
				id = 2,
				mode = "area",
				placeholder = Second,
				value = ""
			}
		}
	})

	if Array and Array["1"] and Array["1"]["input"] ~= "" and Array["2"] and Array["2"]["input"] ~= "" then
		return { Array["1"]["input"],Array["2"]["input"] }
	end

	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- POSTIT
-----------------------------------------------------------------------------------------------------------------------------------------
function PostIt(First,Second)
	local Array = Keyboard({
		title = "Formulário",
		subtitle = "Preencha os campos abaixo",
		rows = {
			{
				id = 1,
				mode = "area",
				placeholder = First,
				value = ""
			},{
				id = 2,
				mode = "options",
				placeholder = "Selecione uma distância",
				options = Second,
				value = ""
			}
		}
	})

	if Array and Array["1"] and Array["1"]["input"] ~= "" and Array["2"] and Array["2"]["input"] ~= "" then
		return { Array["1"]["input"],Array["2"]["input"] }
	end

	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- OPTIONS
-----------------------------------------------------------------------------------------------------------------------------------------
function Options(First,Second)
	local Array = Keyboard({
		title = "Formulário",
		subtitle = "Preencha os campos abaixo",
		rows = {
			{
				id = 1,
				mode = "text",
				placeholder = First,
				value = ""
			},{
				id = 2,
				mode = "options",
				placeholder = "Selecione uma opção",
				options = Second,
				value = ""
			}
		}
	})

	if Array and Array["1"] and Array["1"]["input"] ~= "" and Array["2"] and Array["2"]["input"] ~= "" then
		return { Array["1"]["input"],Array["2"]["input"] }
	end

	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- MONEYWASH
-----------------------------------------------------------------------------------------------------------------------------------------
function MoneyWash(First)
	local Array = Keyboard({
		title = "Máquina de Lavar",
		subtitle = "Lave o seu dinheiro sujo",
		rows = {
			{
				id = 1,
				mode = "options",
				placeholder = "Selecione um valor",
				options = First,
				value = ""
			}
		}
	})

	if Array and Array["1"] and Array["1"]["input"] ~= "" then
		return { Array["1"]["input"] }
	end

	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- LIGHTNING
-----------------------------------------------------------------------------------------------------------------------------------------
function Lightning(First)
	local Array = Keyboard({
		title = "Gerador de Raios",
		subtitle = "Selecione o campo abaixo",
		rows = {
			{
				id = 1,
				mode = "options",
				placeholder = "Selecione uma quantidade",
				options = First,
				value = ""
			}
		}
	})

	if Array and Array["1"] and Array["1"]["input"] ~= "" then
		return { Array["1"]["input"] }
	end

	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- TYRES
-----------------------------------------------------------------------------------------------------------------------------------------
function Tyres(First)
	local Array = Keyboard({
		title = "Pneus",
		subtitle = "Selecione o campo abaixo",
		rows = {
			{
				id = 1,
				mode = "options",
				placeholder = "Escolha o pneu",
				options = First,
				value = ""
			}
		}
	})

	if Array and Array["1"] and Array["1"]["input"] ~= "" then
		return { Array["1"]["input"] }
	end

	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- WEATHER
-----------------------------------------------------------------------------------------------------------------------------------------
function Weather(First,Second)
	local Array = Keyboard({
		title = "Formulário",
		subtitle = "Preencha os campos abaixo",
		rows = {
			{
				id = 1,
				mode = "options",
				placeholder = "Selecione uma Região",
				options = First,
				value = ""
			},{
				id = 2,
				mode = "options",
				placeholder = "Selecione um Clima",
				options = Second,
				value = ""
			}
		}
	})

	if Array and Array["1"] and Array["1"]["input"] ~= "" and Array["2"] and Array["2"]["input"] ~= "" then
		return { Array["1"]["input"],Array["2"]["input"] }
	end

	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- TIMESET
-----------------------------------------------------------------------------------------------------------------------------------------
function Timeset(First,Second)
	local Array = Keyboard({
		title = "Formulário",
		subtitle = "Preencha os campos abaixo",
		rows = {
			{
				id = 1,
				mode = "options",
				placeholder = "Selecione uma Hora",
				options = First,
				value = ""
			},{
				id = 2,
				mode = "options",
				placeholder = "Selecione um Minuto",
				options = Second,
				value = ""
			}
		}
	})

	if Array and Array["1"] and Array["1"]["input"] ~= "" and Array["2"] and Array["2"]["input"] ~= "" then
		return { Array["1"]["input"],Array["2"]["input"] }
	end

	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEM
-----------------------------------------------------------------------------------------------------------------------------------------
function Item(First,Second,Third,Fourth,Fifty)
	local Array = Keyboard({
		title = "Formulário",
		subtitle = "Preencha os campos abaixo",
		rows = {
			{
				id = 1,
				mode = "text",
				placeholder = First,
				value = ""
			},{
				id = 2,
				mode = "text",
				placeholder = Second,
				value = ""
			},{
				id = 3,
				mode = "text",
				placeholder = Third,
				value = ""
			},{
				id = 4,
				mode = "options",
				placeholder = "Selecione uma opção",
				options = Fourth,
				value = ""
			},{
				id = 5,
				mode = "text",
				placeholder = Fifty,
				value = ""
			}
		}
	})

	if Array and Array["1"] and Array["1"]["input"] ~= "" and Array["2"] and Array["2"]["input"] ~= "" and Array["3"] and Array["3"]["input"] ~= "" and Array["4"] and Array["4"]["input"] ~= "" and Array["5"] and Array["5"]["input"] ~= "" then
		return { Array["1"]["input"],Array["2"]["input"],Array["3"]["input"],Array["4"]["input"],Array["5"]["input"] }
	end

	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- GIVEGROUP
-----------------------------------------------------------------------------------------------------------------------------------------
function GiveGroup(First,Second,Third)
	local Array = Keyboard({
		title = "Formulário",
		subtitle = "Preencha os campos abaixo",
		rows = {
			{
				id = 1,
				mode = "text",
				placeholder = First,
				value = ""
			},{
				id = 2,
				mode = "text",
				placeholder = Second,
				value = ""
			},{
				id = 3,
				mode = "options",
				placeholder = "Selecione uma Permissão",
				options = Third,
				value = ""
			}
		}
	})

	if Array and Array["1"] and Array["1"]["input"] ~= "" and Array["2"] and Array["2"]["input"] ~= "" and Array["3"] and Array["3"]["input"] ~= "" then
		return { Array["1"]["input"],Array["2"]["input"],Array["3"]["input"] }
	end

	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- REMOVEGROUP
-----------------------------------------------------------------------------------------------------------------------------------------
function RemoveGroup(First,Second)
	local Array = Keyboard({
		title = "Formulário",
		subtitle = "Preencha os campos abaixo",
		rows = {
			{
				id = 1,
				mode = "text",
				placeholder = First,
				value = ""
			},{
				id = 2,
				mode = "options",
				placeholder = "Selecione uma Permissão",
				options = Second,
				value = ""
			}
		}
	})

	if Array and Array["1"] and Array["1"]["input"] ~= "" and Array["2"] and Array["2"]["input"] ~= "" then
		return { Array["1"]["input"],Array["2"]["input"] }
	end

	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- FINES
-----------------------------------------------------------------------------------------------------------------------------------------
function Fines(First,Second,Third)
	local Array = Keyboard({
		title = "Formulário",
		subtitle = "Preencha os campos abaixo",
		rows = {
			{
				id = 1,
				mode = "text",
				placeholder = First,
				value = ""
			},{
				id = 2,
				mode = "text",
				placeholder = Second,
				value = ""
			},{
				id = 3,
				mode = "area",
				placeholder = Third,
				value = ""
			}
		}
	})

	if Array and Array["1"] and Array["1"]["input"] ~= "" and Array["2"] and Array["2"]["input"] ~= "" and Array["3"] and Array["3"]["input"] ~= "" then
		return { Array["1"]["input"],Array["2"]["input"],Array["3"]["input"] }
	end

	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- BAN
-----------------------------------------------------------------------------------------------------------------------------------------
function Ban(First,Second,Third)
	local Array = Keyboard({
		title = "Formulário",
		subtitle = "Preencha os campos abaixo",
		rows = {
			{
				id = 1,
				mode = "text",
				placeholder = First,
				value = ""
			},{
				id = 2,
				mode = "text",
				placeholder = Second,
				value = ""
			},{
				id = 3,
				mode = "area",
				placeholder = Third,
				value = ""
			}
		}
	})

	if Array and Array["1"] and Array["1"]["input"] ~= "" and Array["2"] and Array["2"]["input"] ~= "" and Array["3"] and Array["3"]["input"] ~= "" then
		return { Array["1"]["input"],Array["2"]["input"],Array["3"]["input"] }
	end

	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- PRIMARY
-----------------------------------------------------------------------------------------------------------------------------------------
function Primary(First)
	local Array = Keyboard({
		title = "Formulário",
		subtitle = "Preencha os campos abaixo",
		rows = {
			{
				id = 1,
				mode = "text",
				placeholder = First,
				value = ""
			}
		}
	})

	if Array and Array["1"] and Array["1"]["input"] ~= "" then
		return { Array["1"]["input"] }
	end

	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- SECONDARY
-----------------------------------------------------------------------------------------------------------------------------------------
function Secondary(First,Second)
	local Array = Keyboard({
		title = "Formulário",
		subtitle = "Preencha os campos abaixo",
		rows = {
			{
				id = 1,
				mode = "text",
				placeholder = First,
				value = ""
			},{
				id = 2,
				mode = "text",
				placeholder = Second,
				value = ""
			}
		}
	})

	if Array and Array["1"] and Array["1"]["input"] ~= "" and Array["2"] and Array["2"]["input"] ~= "" then
		return { Array["1"]["input"],Array["2"]["input"] }
	end

	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- TERTIARY
-----------------------------------------------------------------------------------------------------------------------------------------
function Tertiary(First,Second,Third)
	local Array = Keyboard({
		title = "Formulário",
		subtitle = "Preencha os campos abaixo",
		rows = {
			{
				id = 1,
				mode = "text",
				placeholder = First,
				value = ""
			},{
				id = 2,
				mode = "text",
				placeholder = Second,
				value = ""
			},{
				id = 3,
				mode = "text",
				placeholder = Third,
				value = ""
			}
		}
	})

	if Array and Array["1"] and Array["1"]["input"] ~= "" and Array["2"] and Array["2"]["input"] ~= "" and Array["3"] and Array["3"]["input"] ~= "" then
		return { Array["1"]["input"],Array["2"]["input"],Array["3"]["input"] }
	end

	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- QUATERNARY
-----------------------------------------------------------------------------------------------------------------------------------------
function Quaternary(First,Second,Third,Fourth)
	local Array = Keyboard({
		title = "Formulário",
		subtitle = "Preencha os campos abaixo",
		rows = {
			{
				id = 1,
				mode = "text",
				placeholder = First,
				value = ""
			},{
				id = 2,
				mode = "area",
				placeholder = Second,
				value = ""
			},{
				id = 3,
				mode = "text",
				placeholder = Third,
				value = ""
			},{
				id = 4,
				mode = "text",
				placeholder = Fourth,
				value = ""
			}
		}
	})

	if Array and Array["1"] and Array["1"]["input"] ~= "" and Array["2"] and Array["2"]["input"] ~= "" and Array["3"] and Array["3"]["input"] ~= "" and Array["4"] and Array["4"]["input"] ~= "" then
		return { Array["1"]["input"],Array["2"]["input"],Array["3"]["input"],Array["4"]["input"] }
	end

	return false
end

-----------------------------------------------------------------------------------------------------------------------------------------
-- PERIMETERS
-----------------------------------------------------------------------------------------------------------------------------------------
function Perimeters(First)
	local Array = Keyboard({
		title = "Formulário",
		subtitle = "Preencha os campos abaixo",
		rows = {
			{
				id = 1,
				mode = "text",
				placeholder = "Escolha um Nome",
				value = ""
			}
		}
	})

	if Array and Array["1"] and Array["1"]["input"] ~= "" then
		return { Array["1"]["input"] }
	end

	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ANNOUNCE
-----------------------------------------------------------------------------------------------------------------------------------------
function Announce(First,Second,Third,Fourth)
	local Array = Keyboard({
		title = "Formulário",
		subtitle = "Preencha os campos abaixo",
		rows = {
			{
				id = 1,
				mode = "options",
				placeholder = "Selecione um Tema",
				options = First,
				value = ""
			},{
				id = 2,
				mode = "area",
				placeholder = Second,
				value = ""
			},{
				id = 3,
				mode = "text",
				placeholder = Third,
				value = ""
			},{
				id = 4,
				mode = "text",
				placeholder = Fourth,
				value = ""
			}
		}
	})

	if Array and Array["1"] and Array["1"]["input"] ~= "" and Array["2"] and Array["2"]["input"] ~= "" and Array["3"] and Array["3"]["input"] ~= "" and Array["4"] and Array["4"]["input"] ~= "" then
		return { Array["1"]["input"],Array["2"]["input"],Array["3"]["input"],Array["4"]["input"] }
	end

	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- COPY
-----------------------------------------------------------------------------------------------------------------------------------------
function Copy(First,Second)
	local Array = Keyboard({
		save = true,
		title = "Formulário",
		subtitle = "Preencha os campos abaixo",
		rows = {
			{
				id = 1,
				mode = "area",
				placeholder = First,
				value = Second
			}
		}
	})

	return true
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- AREA
-----------------------------------------------------------------------------------------------------------------------------------------
function Area(First)
	local Array = Keyboard({
		title = "Formulário",
		subtitle = "Preencha os campos abaixo",
		rows = {
			{
				id = 1,
				mode = "area",
				placeholder = First,
				value = ""
			}
		}
	})

	if Array and Array["1"] and Array["1"]["input"] ~= "" then
		return { Array["1"]["input"] }
	end

	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- PASSWORD
-----------------------------------------------------------------------------------------------------------------------------------------
function Expert.Password(First)
	return Password(First)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- FINES
-----------------------------------------------------------------------------------------------------------------------------------------
function Expert.Fines(First,Second,Third)
	return Fines(First,Second,Third)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- BAN
-----------------------------------------------------------------------------------------------------------------------------------------
function Expert.Ban(First,Second,Third)
	return Ban(First,Second,Third)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- PRIMARY
-----------------------------------------------------------------------------------------------------------------------------------------
function Expert.Primary(First)
	return Primary(First)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- SECONDARY
-----------------------------------------------------------------------------------------------------------------------------------------
function Expert.Secondary(First,Second)
	return Secondary(First,Second)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- TERTIARY
-----------------------------------------------------------------------------------------------------------------------------------------
function Expert.Tertiary(First,Second,Third)
	return Tertiary(First,Second,Third)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- QUATERNARY
-----------------------------------------------------------------------------------------------------------------------------------------
function Expert.Quaternary(First,Second,Third,Fourth)
	return Quaternary(First,Second,Third,Fourth)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- AREA
-----------------------------------------------------------------------------------------------------------------------------------------
function Expert.Area(First)
	return Area(First)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- COPY
-----------------------------------------------------------------------------------------------------------------------------------------
function Expert.Copy(First,Message)
	return Copy(First,Message)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- INSTAGRAM
-----------------------------------------------------------------------------------------------------------------------------------------
function Expert.Instagram(First)
	return Instagram(First)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- EGGS
-----------------------------------------------------------------------------------------------------------------------------------------
function Expert.Eggs(First)
	return Eggs(First)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- OPTIONS
-----------------------------------------------------------------------------------------------------------------------------------------
function Expert.Options(First,Secondary)
	return Options(First,Secondary)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- NITRO
-----------------------------------------------------------------------------------------------------------------------------------------
function Expert.Nitro(First)
	return Nitro(First)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- TYRES
-----------------------------------------------------------------------------------------------------------------------------------------
function Expert.Tyres(First)
	return Tyres(First)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- GIVEGROUP
-----------------------------------------------------------------------------------------------------------------------------------------
function Expert.GiveGroup(First,Secondary,Third)
	return GiveGroup(First,Secondary,Third)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- REMOVEGROUP
-----------------------------------------------------------------------------------------------------------------------------------------
function Expert.RemoveGroup(First,Secondary)
	return RemoveGroup(First,Secondary)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- WEATHER
-----------------------------------------------------------------------------------------------------------------------------------------
function Expert.Weather(First,Secondary)
	return Weather(First,Secondary)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- TIMESET
-----------------------------------------------------------------------------------------------------------------------------------------
function Expert.Timeset(First,Secondary)
	return Timeset(First,Secondary)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- POSTIT
-----------------------------------------------------------------------------------------------------------------------------------------
function Expert.PostIt(First,Secondary)
	return PostIt(First,Secondary)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEM
-----------------------------------------------------------------------------------------------------------------------------------------
function Expert.Item(First,Secondary,Third,Fourth,Fifty)
	return Item(First,Secondary,Third,Fourth,Fifty)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ANNOUNCE
-----------------------------------------------------------------------------------------------------------------------------------------
function Expert.Announce(First,Secondary,Third,Fourth)
	return Announce(First,Secondary,Third,Fourth)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CREATION
-----------------------------------------------------------------------------------------------------------------------------------------
function Expert.Creation(First,Secondary)
	return Creation(First,Secondary)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- COUPON
-----------------------------------------------------------------------------------------------------------------------------------------
function Expert.Coupon(First,Secondary)
	return Coupon(First,Secondary)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- PERIMETERS
-----------------------------------------------------------------------------------------------------------------------------------------
function Expert.Perimeters(First)
	return Perimeters(First)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- MONEYWASH
-----------------------------------------------------------------------------------------------------------------------------------------
function Expert.MoneyWash(First)
	return MoneyWash(First)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- LIGHTNING
-----------------------------------------------------------------------------------------------------------------------------------------
function Expert.Lightning(First)
	return Lightning(First)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- EXPORTS
-----------------------------------------------------------------------------------------------------------------------------------------
exports("Ban",Ban)
exports("Eggs",Eggs)
exports("Item",Item)
exports("Area",Area)
exports("Copy",Copy)
exports("Fines",Fines)
exports("Nitro",Nitro)
exports("Tyres",Tyres)
exports("PostIt",PostIt)
exports("Coupon",Coupon)
exports("Options",Options)
exports("Weather",Weather)
exports("Timeset",Timeset)
exports("Primary",Primary)
exports("Creation",Creation)
exports("Password",Password)
exports("Tertiary",Tertiary)
exports("Announce",Announce)
exports("MoneyWash",MoneyWash)
exports("Secondary",Secondary)
exports("Instagram",Instagram)
exports("GiveGroup",GiveGroup)
exports("Lightning",Lightning)
exports("Quaternary",Quaternary)
exports("Perimeters",Perimeters)
exports("RemoveGroup",RemoveGroup)