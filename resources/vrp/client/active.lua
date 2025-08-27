-----------------------------------------------------------------------------------------------------------------------------------------
-- ACTIVE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("vRP:Active")
AddEventHandler("vRP:Active", function(Passport, Name)
	SetDiscordAppId(1104088666655178852)
	SetDiscordRichPresenceAsset("expert")
	SetRichPresence("#"..Passport.." "..Name)
	SetDiscordRichPresenceAssetSmall("expert")
	SetDiscordRichPresenceAssetText("Expert")
	SetDiscordRichPresenceAssetSmallText("Expert")
	SetDiscordRichPresenceAction(0, "Expert", ServerLink)
end)