-- Localization
-- Create a table to hold localized strings
local L = {}
-- Set the default language to English
L["AddonName"] = "WoWAddonTemplate"
L["MyOption"] = "My Option"
L["MyOptionTooltip"] = "Enable or disable my option"
L["Debug"] = "Debug"
L["DebugTooltip"] = "Enable or disable debug messages"
-- Add additional localized strings as needed

-- Set the language to the user's selected language
local locale = GetLocale()
if locale == "enUS" then
	-- English (US) is the default language, so no need to do anything
elseif locale == "deDE" then
	-- German
	L["AddonName"] = "WoWAddonVorlage"
	L["MyOption"] = "Meine Option"
	L["MyOptionTooltip"] = "Aktiviere oder deaktiviere meine Option"
	L["Debug"] = "Debuggen"
	L["DebugTooltip"] = "Aktiviere oder deaktiviere Debug-Nachrichten"
	-- Add additional localized strings as needed for German
elseif locale == "esES" or locale == "esMX" then
	-- Spanish
	L["AddonName"] = "PlantillaAddonWoW"
	L["MyOption"] = "Mi Opción"
	L["MyOptionTooltip"] = "Activa o desactiva mi opción"
	L["Debug"] = "Depurar"
	L["DebugTooltip"] = "Activa o desactiva mensajes de depuración"
	-- Add additional localized strings as needed for Spanish
elseif locale == "frFR" then
	-- French
	L["AddonName"] = "ModèleAddonWoW"
	L["MyOption"] = "Mon Option"
	L["MyOptionTooltip"] = "Activer ou désactiver mon option"
	L["Debug"] = "Déboguer"
	L["DebugTooltip"] = "Activer ou désactiver les messages de débogage"
	-- Add additional localized strings as needed for French
	-- Add additional language cases as needed
end

-- Create a new table to hold your addon's functions and data
local WoWAddonTemplate = CreateFrame("Frame")

-- Set default values for the addon's saved variables
local defaults = {
	someOption = false,
	debug = false,
}

-- Create a function to print debug messages
function WoWAddonTemplate:Debug(message)
	-- Only print debug messages if the debug flag is set to true
	if WowAddonTemplateDB.debug then
		-- Print a message to the chat window in cyan
		print("|cff00ffffWoWAddonTemplate Debug:|r " .. tostring(message))
	end
end

-- Create a function to initialize your addon
function WoWAddonTemplate:InitializeAddOn()
	-- Add initialization code here, such as registering events and creating frames
	self:RegisterEvent("PLAYER_LOGIN")
end

-- Create a function to handle events
function WoWAddonTemplate:OnEvent(event, ...)
	if event == "ADDON_LOADED" and ... == "WoWAddonTemplate" then
		-- Debug message to indicate that the addon has loaded
		self:Debug("WoWAddonTemplate loaded.")

		-- Create a saved variable database for your addon with default values
		WowAddonTemplateDB = WowAddonTemplateDB or CopyTable(defaults)

		-- Call functions to initialize the addon options and main functionality
		self:InitializeOptions()
		self:InitializeAddOn()
	elseif event == "PLAYER_LOGIN" then
		-- Add code to handle the PLAYER_LOGIN event here
		self:Debug("Player logged in!")
	end
end

-- Register your addon for events
WoWAddonTemplate:RegisterEvent("ADDON_LOADED")
WoWAddonTemplate:SetScript("OnEvent", WoWAddonTemplate.OnEvent)

-- Create a configuration panel for your addon
function WoWAddonTemplate:InitializeOptions()
	-- Create a new frame to hold the addon options
	local optionsPanel = CreateFrame("Frame", "AddonOptionsPanel", InterfaceOptionsFramePanelContainer)

	-- Set the name of the options panel using a localized string
	optionsPanel.name = L["AddonName"]

	-- Create a check button for the "My Option" option
	local myOptionCheckbox = CreateFrame("CheckButton", "AddonMyOptionCheckbox", optionsPanel, "InterfaceOptionsCheckButtonTemplate")
	myOptionCheckbox:SetPoint("TOPLEFT", 16, -16)
	myOptionCheckbox.Text:SetText(L["MyOption"])
	myOptionCheckbox.tooltipText = L["MyOptionTooltip"]
	myOptionCheckbox:SetScript("OnClick", function(self)
		-- Update the value of the "myOption" saved variable
		WowAddonTemplateDB.myOption = self:GetChecked()
	end)
	myOptionCheckbox:SetChecked(WowAddonTemplateDB.myOption)

	-- Create a check button for the "Debug" option
	local debugCheckbox = CreateFrame("CheckButton", "AddonDebugCheckbox", optionsPanel, "InterfaceOptionsCheckButtonTemplate")
	debugCheckbox:SetPoint("TOPLEFT", myOptionCheckbox, "BOTTOMLEFT", 0, -8)
	debugCheckbox.Text:SetText(L["Debug"])
	debugCheckbox.tooltipText = L["DebugTooltip"]
	debugCheckbox:SetScript("OnClick", function(self)
		-- Update the value of the "debug" saved variable
		WowAddonTemplateDB.debug = self:GetChecked()
	end)
	debugCheckbox:SetChecked(WowAddonTemplateDB.debug)

	-- Add the options panel to the Blizzard interface options
	InterfaceOptions_AddCategory(optionsPanel)
end
