﻿local L = LibStub("AceLocale-3.0"):NewLocale("PassLoot", "koKR", false);
if not L then return end
-- L["Active Filters"] = "Active Filters"
--[==[ L["Active Filters_Desc"] = [=[Select a filter to modify, or shift-right-click to remove this filter
(Each filter must have at least one match)]=] ]==]
L["Add"] = "추가" -- Needs review
-- L["Add a new rule."] = "Add a new rule."
-- L["Add this filter."] = "Add this filter."
-- L["Allow Multiple Confirm Popups"] = "Allow Multiple Confirm Popups"
-- L["Available Filters"] = "Available Filters"
--[==[ L["Available Filters_Desc"] = [=[Select a filter to use.
(Each filter must have at least one match)]=] ]==]
-- L["Change the exception status of this filter."] = "Change the exception status of this filter."
-- L["Checking this will disable the exclusive bit to allow multiple confirmation of loot roll popups"] = "Checking this will disable the exclusive bit to allow multiple confirmation of loot roll popups"
-- L["Checking this will prevent extra details from being displayed."] = "Checking this will prevent extra details from being displayed."
-- L["Clean Rules"] = "Clean Rules"
--[==[ L["CLEAN RULES DESC"] = [=[Are you sure?

It is recommended that you activate all modules used in rules.
]=] ]==]
--[==[ L["Click to select and edit this rule."] = [=[Click to select and edit this rule.
Right click to copy or export this rule.]=] ]==]
-- L["Create Copy"] = "Create Copy"
-- L["Default"] = "Default"
-- L["Description"] = "Description"
--[==[ L["Description_Desc"] = [=[Description of this rule.
(Saves when you press enter)]=] ]==]
-- L["Disenchant"] = "DE"
-- L["Disenchant_Desc"] = "If an enchanter is present, will roll disenchant on all loot matching this rule."
-- L["Display a warning when a rule is skipped."] = "Display a warning when a rule is skipped."
-- L["Displays disabled or unknown filter variables."] = "Displays disabled or unknown filter variables."
-- L["Down"] = "Down"
-- L["Enabled"] = "Enabled"
-- L["Enable / Disable this module."] = "Enable / Disable this module."
-- L["Enable Mod"] = "Enable Mod"
-- L["Enable or disable this mod."] = "Enable or disable this mod."
--[==[ L["Enter the text displayed when rolling."] = [=[Enter the text displayed when rolling.
Use '%item%' for item being rolled on.
Use '%rule%' for rule that was matched.
]=] ]==]
-- L["Exception"] = "Exception"
-- L["EXCEPTION_PREFIX"] = "! "
-- L["Export To"] = "Export To"
-- L["Found some rules that will be skipped."] = "Found some rules that will be skipped."
-- L["General Options"] = "General Options"
-- L["Greed"] = "Greed"
-- L["Ignored"] = "Ignored"
-- L["Ignoring %item% (%rule%)"] = "Ignoring %item% (%rule%)"
-- L["Menu"] = "Menu"
-- L["Messages"] = "Messages"
-- L["Module"] = "Module"
-- L["Modules"] = "Modules"
-- L["Move selected rule down in priority."] = "Move selected rule down in priority."
-- L["Move selected rule up in priority."] = "Move selected rule up in priority."
-- L["Need"] = "Need"
-- L["No rules matched."] = "No rules matched."
-- L["Opens the PassLoot Menu."] = "Opens the PassLoot Menu."
-- L["Options"] = "Options"
-- L["Output"] = "Output"
-- L["Pass"] = "Pass"
-- L["PassLoot"] = "PassLoot"
-- L["PASSLOOT_SLASH_COMMAND"] = "passloot"
-- L["Profiles"] = "Profiles"
-- L["Quiet"] = "Quiet"
-- L["Remove"] = "Remove"
-- L["Removes disabled or unknown filters from current rules."] = "Removes disabled or unknown filters from current rules."
-- L["Remove selected rule."] = "Remove selected rule."
-- L["Remove this filter."] = "Remove this filter."
-- L["Rolling disenchant on %item% (%rule%)"] = "Rolling disenchant on %item% (%rule%)"
-- L["Rolling greed on %item% (%rule%)"] = "Rolling greed on %item% (%rule%)"
-- L["Rolling is tried from left to right"] = "Rolling is tried from left to right"
-- L["Rolling need on %item% (%rule%)"] = "Rolling need on %item% (%rule%)"
-- L["Rolling pass on %item% (%rule%)"] = "Rolling pass on %item% (%rule%)"
-- L["Rule List"] = "Rule List"
-- L["Skipping %rule%"] = "Skipping %rule%"
-- L["Skip Rules"] = "Skip Rules"
-- L["Skip rules that have disabled or unknown filters."] = "Skip rules that have disabled or unknown filters."
-- L["Skip Warning"] = "Skip Warning"
-- L["Temp Description"] = "Temp Description"
-- L["Test"] = "Test"
-- L["Test an item link to see how we would roll"] = "Test an item link to see how we would roll"
-- L["Unable to copy rule"] = "Unable to copy rule"
-- L["Unknown Filters"] = "Unknown Filters"
-- L["Up"] = "Up"
-- L["Will pass on all loot matching this rule."] = "Will pass on all loot matching this rule."
-- L["Will roll greed on all loot matching this rule."] = "Will roll greed on all loot matching this rule."
-- L["Will roll need on all loot matching this rule."] = "Will roll need on all loot matching this rule."

local LM = LibStub("AceLocale-3.0"):NewLocale("PassLoot_Modules", "koKR", false);
-- LM["10 Man Raid"] = "10 Man Raid"
-- LM["25 Man Raid"] = "25 Man Raid"
-- LM["Accessories"] = "Accessories"
-- LM["Account"] = "Account"
-- LM["Any"] = "Any"
-- LM["Armor"] = "Armor"
-- LM["Bind On"] = "Bind On"
-- LM["Binds On"] = "Binds On"
-- LM["By adding the Confirm DE filter you will not get any confirmations when rolling disenchant.  This might get you into trouble with your group, are you sure?"] = "By adding the Confirm DE filter you will not get any confirmations when rolling disenchant.  This might get you into trouble with your group, are you sure?"
-- LM["Can I Roll"] = "Can I Roll"
-- LM["%class% - %spec%"] = "%class% - %spec%"
-- LM["Class Spec"] = "Class Spec"
-- LM["Confirm BoP"] = "Confirm BoP"
-- LM["Confirm DE"] = "Confirm DE"
-- LM["current"] = "current"
-- LM["Current Spec: %spec%"] = "Current Spec: %spec%"
-- LM["Equal to"] = "Equal to"
-- LM["Equal to %num%"] = "Equal to %num%"
-- LM["Equip"] = "Equip"
-- LM["Equipable"] = "Equipable"
-- LM["Equip Slot"] = "Equip Slot"
-- LM["Exact"] = "Exact"
--[==[ LM["Exact_Desc"] = [=[Checked: Item must match exactly.
Unchecked: Item must have this phrase.]=] ]==]
-- LM["Greater than"] = "Greater than"
-- LM["Greater than %num%"] = "Greater than %num%"
-- LM["Group"] = "Group"
-- LM["Group / Raid"] = "Group / Raid"
-- LM["Guild Group"] = "Guild Group"
-- LM["Guild Group_Desc"] = "Selected rule will match when the group has this percentage of guild mates."
-- LM["Heroic"] = "Heroic"
-- LM["Hybrid"] = "Hybrid"
-- LM["Inventory"] = "Inventory"
-- LM["Item Level"] = "Item Level"
--[==[ LM["ItemLevel_DropDownTooltipDesc"] = [=[Selected rule will only match items when comparing the item level to this.
(use 'current' for your currently equipped item level)]=] ]==]
-- LM["Item Name"] = "Item Name"
-- LM["Item Price"] = "Item Price"
-- LM["Later"] = "Later"
-- LM["Learned"] = "Learned"
-- LM["Learned Item"] = "Learned Item"
-- LM["Less than"] = "Less than"
-- LM["Less than %num%"] = "Less than %num%"
-- LM["level"] = "level"
-- LM["Loot Won"] = "Loot Won"
-- LM["Loot Won Comparison"] = "Loot Won Comparison"
-- LM["Loot Won Counter"] = "Loot Won Counter"
--[==[ LM["Loot Won Counter_Desc"] = [=[Set how many times we have won loot on this rule
(Saves when you press enter)]=] ]==]
-- LM["None"] = "None"
-- LM["Normal"] = "Normal"
-- LM["Not"] = "Not"
-- LM["Not Equal to"] = "Not Equal to"
-- LM["Not Equal to %num%"] = "Not Equal to %num%"
-- LM["Now"] = "Now"
-- LM["Outside"] = "Outside"
-- LM["Pickup"] = "Pickup"
-- LM["Player Name"] = "Player Name"
-- LM["Quality"] = "Quality"
-- LM["Raid"] = "Raid"
-- LM["Raid Finder"] = "Raid Finder"
-- LM["Required Level"] = "Required Level"
--[==[ LM["RequiredLevel_DropDownTooltipDesc"] = [=[Selected rule will only match items when comparing the required level to this.
(Use 'level' for your current level)]=] ]==]
-- LM["Reset Counters On Join"] = "Reset Counters On Join"
--[==[ LM["Reset Counters On Join_Desc"] = [=[Checking this will reset counters on joining a group or raid.
Shift-click to reset all current counters.]=] ]==]
-- LM["Selected rule will match on item names."] = "Selected rule will match on item names."
-- LM["Selected rule will match on player names."] = "Selected rule will match on player names."
-- LM["Selected rule will only match if you are in a group or raid."] = "Selected rule will only match if you are in a group or raid."
-- LM["Selected rule will only match if you can roll this."] = "Selected rule will only match if you can roll this."
-- LM["Selected rule will only match items that are equipable."] = "Selected rule will only match items that are equipable."
-- LM["Selected rule will only match items when compared to vendor value."] = "Selected rule will only match items when compared to vendor value."
-- LM["Selected rule will only match items when comparing already aquired inventory to this."] = "Selected rule will only match items when comparing already aquired inventory to this."
-- LM["Selected rule will only match items when comparing the item level to this."] = "Selected rule will only match items when comparing the item level to this."
-- LM["Selected rule will only match items when comparing the loot won counter to this."] = "Selected rule will only match items when comparing the loot won counter to this."
-- LM["Selected rule will only match items when comparing the required level to this."] = "Selected rule will only match items when comparing the required level to this."
-- LM["Selected rule will only match items when you are in this type of zone."] = "Selected rule will only match items when you are in this type of zone."
-- LM["Selected rule will only match items when you are this class and spec."] = "Selected rule will only match items when you are this class and spec."
-- LM["Selected rule will only match items with this equip slot."] = "Selected rule will only match items with this equip slot."
-- LM["Selected rule will only match items with this type and subtype."] = "Selected rule will only match items with this type and subtype."
-- LM["Selected rule will only match these items."] = "Selected rule will only match these items."
-- LM["Selected rule will only match this quality of items."] = "Selected rule will only match this quality of items."
-- LM["Selected rule will only match usable items."] = "Selected rule will only match usable items."
-- LM["Temp Item Name"] = "Temp Item Name"
-- LM["Temp Name"] = "Temp Name"
-- LM["Temp Zone Name"] = "Temp Zone Name"
-- LM["%type% - %subtype%"] = "%type% - %subtype%"
-- LM["Type / SubType"] = "Type / SubType"
-- LM["Unique"] = "Unique"
--[==[ LM["Unique_Desc"] = [=[Selected rule will only match items that are unique.
This includes items which have a unique stack higher than 1, such as battleground tokens, as well as items which are Unique-Equip.]=] ]==]
-- LM["Unlearned"] = "Unlearned"
-- LM["Unusable"] = "Unusable"
-- LM["Usable"] = "Usable"
-- LM["Use"] = "Use"
-- LM["Use RegEx for partial"] = "Use RegEx for partial"
-- LM["Uses regular expressions when using partial matches."] = "Uses regular expressions when using partial matches."
-- LM["Weapons"] = "Weapons"
-- LM["Will click yes on BoP dialogues."] = "Will click yes on BoP dialogues."
-- LM["Will click yes on Disenchant dialogues."] = "Will click yes on Disenchant dialogues."
-- LM["Will confirm bind!"] = "Will confirm bind!"
-- LM["Will confirm disenchant!"] = "Will confirm disenchant!"
-- LM["Zone Name"] = "Zone Name"
--[==[ LM["Zone Name_Desc"] = [=[Zone name to match selected rule to, leave empty to match any zone.
(Saves when you press enter)
Shift-right-click to fill with current zone name]=] ]==]
-- LM["Zone Type"] = "Zone Type"
-- LM["%zonetype% - %instancedifficulty%"] = "%zonetype% - %instancedifficulty%"

