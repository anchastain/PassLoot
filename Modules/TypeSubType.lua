﻿local PassLoot = LibStub("AceAddon-3.0"):GetAddon("PassLoot");
local L = LibStub("AceLocale-3.0"):GetLocale("PassLoot_Modules");
local module = PassLoot:NewModule(L["Type / SubType"])
local binv, BI;

if ( not LibStub("LibBabble-Inventory-3.0", true) ) then
  return;
end

function module:SetupValues()
  binv = LibStub("LibBabble-Inventory-3.0");
  BI = binv:GetUnstrictLookupTable();
  module.ItemTypes = {
    {
      ["Name"] = L["Any"],
      ["Value"] = 1,
      ["SubTypes"] = {
        {
          ["Name"] = L["Any"],
          ["Value"] = 1,
        },
      },
    },
    {
      ["Name"] = BI["Weapon"] or "Weapon",
      ["Value"] = 2,
      ["SubTypes"] = {
        {
          ["Name"] = L["Any"],
          ["Value"] = 1,
        },
        {
          ["Name"] = BI["One-Handed Axes"] or "One-Handed Axes",
          ["Value"] = 2,
        },
        {
          ["Name"] = BI["Two-Handed Axes"] or "Two-Handed Axes",
          ["Value"] = 3,
        },
        {
          ["Name"] = BI["Bows"] or "Bows",
          ["Value"] = 4,
        },
        {
          ["Name"] = BI["Guns"] or "Guns",
          ["Value"] = 5,
        },
        {
          ["Name"] = BI["One-Handed Maces"] or "One-Handed Maces",
          ["Value"] = 6,
        },
        {
          ["Name"] = BI["Two-Handed Maces"] or "Two-Handed Maces",
          ["Value"] = 7,
        },
        {
          ["Name"] = BI["Polearms"] or "Polearms",
          ["Value"] = 8,
        },
        {
          ["Name"] = BI["One-Handed Swords"] or "One-Handed Swords",
          ["Value"] = 9,
        },
        {
          ["Name"] = BI["Two-Handed Swords"] or "Two-Handed Swords",
          ["Value"] = 10,
        },
        {
          ["Name"] = BI["Staves"] or "Staves",
          ["Value"] = 11,
        },
        {
          ["Name"] = BI["Fist Weapons"] or "Fist Weapons",
          ["Value"] = 12,
        },
        {
          ["Name"] = BI["Miscellaneous"] or "Miscellaneous",
          ["Value"] = 13,
        },
        {
          ["Name"] = BI["Daggers"] or "Daggers",
          ["Value"] = 14,
        },
        {
          ["Name"] = BI["Thrown"] or "Thrown",
          ["Value"] = 15,
        },
        {
          ["Name"] = BI["Crossbows"] or "Crossbows",
          ["Value"] = 16,
        },
        {
          ["Name"] = BI["Wands"] or "Wands",
          ["Value"] = 17,
        },
        {
          ["Name"] = BI["Fishing Poles"] or "Fishing Poles",
          ["Value"] = 18,
        },
      },
    },
    {
      ["Name"] = BI["Armor"] or "Armor",
      ["Value"] = 3,
      ["SubTypes"] = {
        {
          ["Name"] = L["Any"],
          ["Value"] = 1,
        },
        {
          ["Name"] = BI["Miscellaneous"] or "Miscellaneous",
          ["Value"] = 2,
        },
        {
          ["Name"] = BI["Cloth"] or "Cloth",
          ["Value"] = 3,
        },
        {
          ["Name"] = BI["Leather"] or "Leather",
          ["Value"] = 4,
        },
        {
          ["Name"] = BI["Mail"] or "Mail",
          ["Value"] = 5,
        },
        {
          ["Name"] = BI["Plate"] or "Plate",
          ["Value"] = 6,
        },
        {
          ["Name"] = BI["Shields"] or "Shields",
          ["Value"] = 7,
        },
        {
          ["Name"] = BI["Relic"] or "Relic",
          ["Value"] = 12,  -- 4.0.3 added
        },
      },
    },
    {
      ["Name"] = BI["Container"] or "Container",
      ["Value"] = 4,
      ["SubTypes"] = {
        {
          ["Name"] = L["Any"],
          ["Value"] = 1,
        },
        {
          ["Name"] = BI["Bag"] or "Bag",
          ["Value"] = 2,
        },
        -- {
          -- ["Name"] = BI["Soul Bag"] or "Soul Bag",
          -- ["Value"] = 3,
        -- }, -- Removed 4.0.3
        {
          ["Name"] = BI["Herb Bag"] or "Herb Bag",
          ["Value"] = 4,
        },
        {
          ["Name"] = BI["Enchanting Bag"] or "Enchanting Bag",
          ["Value"] = 5,
        },
        {
          ["Name"] = BI["Engineering Bag"] or "Engineering Bag",
          ["Value"] = 6,
        },
        {
          ["Name"] = BI["Gem Bag"] or "Gem Bag",
          ["Value"] = 7,
        },
        {
          ["Name"] = BI["Mining Bag"] or "Mining Bag",
          ["Value"] = 8,
        },
        {
          ["Name"] = BI["Leatherworking Bag"] or "Leatherworking Bag",
          ["Value"] = 9,
        },
        {
          ["Name"] = BI["Inscription Bag"] or "Inscription Bag",
          ["Value"] = 10,
        },  -- 3.0 added
        {
          ["Name"] = BI["Tackle Box"] or "Tackle Box",
          ["Value"] = 11,
        },  -- 4.0.3 added
      },
    },
    {
      ["Name"] = BI["Consumable"] or "Consumable",
      ["Value"] = 5,
      ["SubTypes"] = {
        {
          ["Name"] = L["Any"],
          ["Value"] = 1,
        },
        {
          ["Name"] = BI["Food & Drink"] or "Food & Drink",
          ["Value"] = 2,
        },
        {
          ["Name"] = BI["Potion"] or "Potion",
          ["Value"] = 3,
        },
        {
          ["Name"] = BI["Elixir"] or "Elixir",
          ["Value"] = 4,
        },
        {
          ["Name"] = BI["Flask"] or "Flask",
          ["Value"] = 5,
        },
        {
          ["Name"] = BI["Bandage"] or "Bandage",
          ["Value"] = 6,
        },
        {
          ["Name"] = BI["Item Enhancement"] or "Item Enhancement",
          ["Value"] = 7,
        },
        {
          ["Name"] = BI["Scroll"] or "Scroll",
          ["Value"] = 8,
        },
        {
          ["Name"] = BI["Other"] or "Other",
          ["Value"] = 9,
        },
        {
          ["Name"] = BI["Consumable"],  --Pending possible removal since 2.4.2  (Fel Blossom, Midsummer Ground Flower, Mana Emerald, Mana Ruby)  in 3.0 - (Fel Lotus, Scroll of Strength VI)
          ["Value"] = 10,
        },
      },
    },  -- 5
    {
      ["Name"] = BI["Glyph"] or "Glyph",
      ["Value"] = 15,
      ["SubTypes"] = {
        {
          ["Name"] = L["Any"],
          ["Value"] = 1,
        },
        {
          ["Name"] = BI["Warrior"] or "Warrior",
          ["Value"] = 2,
        },
        {
          ["Name"] = BI["Paladin"] or "Paladin",
          ["Value"] = 3,
        },
        {
          ["Name"] = BI["Hunter"] or "Hunter",
          ["Value"] = 4,
        },
        {
          ["Name"] = BI["Rogue"] or "Rogue",
          ["Value"] = 5,
        },
        {
          ["Name"] = BI["Priest"] or "Priest",
          ["Value"] = 6,
        },
        {
          ["Name"] = BI["Death Knight"] or "Death Knight",
          ["Value"] = 7,
        },
        {
          ["Name"] = BI["Shaman"] or "Shaman",
          ["Value"] = 8,
        },
        {
          ["Name"] = BI["Mage"] or "Mage",
          ["Value"] = 9,
        },
        {
          ["Name"] = BI["Warlock"] or "Warlock",
          ["Value"] = 10,
        },
        {
          ["Name"] = BI["Monk"] or "Monk",
          ["Value"] = 12,
        },
        {
          ["Name"] = BI["Druid"] or "Druid",
          ["Value"] = 11,
        },
      },
    },  -- 3.0 Added
    {
      ["Name"] = BI["Trade Goods"] or "Trade Goods",
      ["Value"] = 6,
      ["SubTypes"] = {
        {
          ["Name"] = L["Any"],
          ["Value"] = 1,
        },
        {
          ["Name"] = BI["Elemental"] or "Elemental",
          ["Value"] = 2,
        },
        {
          ["Name"] = BI["Cloth"] or "Cloth",
          ["Value"] = 3,
        },
        {
          ["Name"] = BI["Leather"] or "Leather",
          ["Value"] = 4,
        },
        {
          ["Name"] = BI["Metal & Stone"] or "Metal & Stone",
          ["Value"] = 5,
        },
        {
          ["Name"] = BI["Cooking"] or "Cooking",
          ["Value"] = 6,
        },
        {
          ["Name"] = BI["Herb"] or "Herb",
          ["Value"] = 7,
        },
        {
          ["Name"] = BI["Enchanting"] or "Enchanting",
          ["Value"] = 8,
        },
        {
          ["Name"] = BI["Jewelcrafting"] or "Jewelcrafting",
          ["Value"] = 9,
        },
        {
          ["Name"] = BI["Parts"] or "Parts",
          ["Value"] = 10,
        },
        {
          ["Name"] = BI["Devices"] or "Devices",
          ["Value"] = 11,
        },
        {
          ["Name"] = BI["Explosives"] or "Explosives",
          ["Value"] = 12,
        },
        {
          ["Name"] = BI["Materials"] or "Materials",
          ["Value"] = 15, -- 2.4.2 added
        },
        {
          ["Name"] = BI["Other"] or "Other",
          ["Value"] = 13,
        },
        -- {
          -- ["Name"] = BI["Armor Enchantment"] or "Armor Enchantment",
          -- ["Value"] = 16,  -- 3.0 added, 4.0.3 removed
        -- },
        -- {
          -- ["Name"] = BI["Weapon Enchantment"] or "Weapon Enchantment",
          -- ["Value"] = 17,  -- 3.0 added, 4.0.3 removed
        -- },
        {
          ["Name"] = BI["Item Enchantment"] or "Item Enchantment",
          ["Value"] = 18,  -- 4.0.3 added
        },
      },
    },
    {
      ["Name"] = BI["Recipe"] or "Recipe",
      ["Value"] = 9,
      ["SubTypes"] = {
        {
          ["Name"] = L["Any"],
          ["Value"] = 1,
        },
        {
          ["Name"] = BI["Book"] or "Book",
          ["Value"] = 2,
        },
        {
          ["Name"] = BI["Leatherworking"] or "Leatherworking",
          ["Value"] = 3,
        },
        {
          ["Name"] = BI["Tailoring"] or "Tailoring",
          ["Value"] = 4,
        },
        {
          ["Name"] = BI["Engineering"] or "Engineering",
          ["Value"] = 5,
        },
        {
          ["Name"] = BI["Blacksmithing"] or "Blacksmithing",
          ["Value"] = 6,
        },
        {
          ["Name"] = BI["Cooking"] or "Cooking",
          ["Value"] = 7,
        },
        {
          ["Name"] = BI["Alchemy"] or "Alchemy",
          ["Value"] = 8,
        },
        {
          ["Name"] = BI["First Aid"] or "First Aid",
          ["Value"] = 9,
        },
        {
          ["Name"] = BI["Enchanting"] or "Enchanting",
          ["Value"] = 10,
        },
        {
          ["Name"] = BI["Fishing"] or "Fishing",
          ["Value"] = 11,
        },
        {
          ["Name"] = BI["Jewelcrafting"] or "Jewelcrafting",
          ["Value"] = 12,
        },
        {
          ["Name"] = BI["Inscription"] or "Inscription",
          ["Value"] = 13,  -- Added 4.0.3 I think
        },
      },
    },
    {
      ["Name"] = BI["Gem"] or "Gem",
      ["Value"] = 10,
      ["SubTypes"] = {
        {
          ["Name"] = L["Any"] or "Any",
          ["Value"] = 1,
        },
        {
          ["Name"] = BI["Red"] or "Red",
          ["Value"] = 2,
        },
        {
          ["Name"] = BI["Blue"] or "Blue",
          ["Value"] = 3,
        },
        {
          ["Name"] = BI["Yellow"] or "Yellow",
          ["Value"] = 4,
        },
        {
          ["Name"] = BI["Purple"] or "Purple",
          ["Value"] = 5,
        },
        {
          ["Name"] = BI["Green"] or "Green",
          ["Value"] = 6,
        },
        {
          ["Name"] = BI["Orange"] or "Orange",
          ["Value"] = 7,
        },
        {
          ["Name"] = BI["Meta"] or "Meta",
          ["Value"] = 8,
        },
        {
          ["Name"] = BI["Simple"] or "Simple",
          ["Value"] = 9,
        },
        {
          ["Name"] = BI["Prismatic"] or "Prismatic",
          ["Value"] = 10,
        },
        {
          ["Name"] = BI["Hydraulic"] or "Hydraulic",
          ["Value"] = 11,  -- Added 4.0.3  Removed 5.0.4
        },
        {
          ["Name"] = BI["Cogwheel"] or "Cogwheel",
          ["Value"] = 12,  -- Added 4.0.3
        },
      },
    },
    {
      ["Name"] = BI["Miscellaneous"] or "Miscellaneous",
      ["Value"] = 11,
      ["SubTypes"] = {
        {
          ["Name"] = L["Any"],
          ["Value"] = 1,
        },
        {
          ["Name"] = BI["Junk"] or "Junk",
          ["Value"] = 2,
        },
        {
          ["Name"] = BI["Reagent"] or "Reagent",
          ["Value"] = 3,
        },
        {
          ["Name"] = BI["Companion Pets"] or "Companion Pets",
          ["Value"] = 4,
        },
        {
          ["Name"] = BI["Holiday"] or "Holiday",
          ["Value"] = 5,
        },
        {
          ["Name"] = BI["Mount"] or "Mount",
          ["Value"] = 7,
        }, -- 2.4.2 added
        {
          ["Name"] = BI["Other"] or "Other",
          ["Value"] = 6,
        },
      },
    },
    {
      ["Name"] = BI["Key"] or "Key",
      ["Value"] = 12,
      ["SubTypes"] = {
        {
          ["Name"] = L["Any"],
          ["Value"] = 1,
        },
        {
          ["Name"] = BI["Key"] or "Key",
          ["Value"] = 2,
        },
      },
    },  -- 5.0.4 doesn't show but does still exist - Veil Skith Prison Key for example
    {
      ["Name"] = BI["Quest"] or "Quest",
      ["Value"] = 13,
      ["SubTypes"] = {
        {
          ["Name"] = L["Any"],
          ["Value"] = 1,
        },
        {
          ["Name"] = BI["Quest"] or "Quest",
          ["Value"] = 2,
        },
      },
    },  -- 15
  };
  for TypeIndex = #module.ItemTypes, 1, -1 do
    if ( module.ItemTypes[TypeIndex] ) then
      for SubTypeIndex = #module.ItemTypes[TypeIndex].SubTypes, 1, -1 do
        if ( not module.ItemTypes[TypeIndex].SubTypes[SubTypeIndex] ) then
          -- ChatFrame1:AddMessage("Removing "..TypeIndex.." "..SubTypeIndex);
          table.remove(module.ItemTypes[TypeIndex].SubTypes, SubTypeIndex);
        end
      end
    else
      -- ChatFrame1:AddMessage("Removing "..TypeIndex);
      table.remove(module.ItemTypes, TypeIndex)
    end
  end
end
module.ConfigOptions_RuleDefaults = {
  -- { VariableName, Default },
  { "Type", nil }, -- No longer used
  { "SubType", nil }, -- No longer used
  {
    "TypeSubType",
    -- {
      -- [1] = { Type, SubType, Exception }
    -- },

  },
};
module.NewFilterValue_Type = 1;
module.NewFilterValue_SubType = 1;

function module:OnEnable()
  self:SetupValues();
  self:RegisterDefaultVariables(self.ConfigOptions_RuleDefaults);
  self:AddWidget(self.Widget);
  self:CheckDBVersion(4, "UpgradeDatabase");
end

function module:OnDisable()
  self:UnregisterDefaultVariables();
  self:RemoveWidgets();
end

function module:UpgradeDatabase(FromVersion, Rule)
  if ( FromVersion == 1 ) then
    local Table = {
      { "Type", nil },
      { "SubType", nil },
      { "TypeSubType", {} },
    };
    if ( Rule.Type and Rule.SubType ) then
      Table[3][2][1] = {
        Rule.Type,
        Rule.SubType,
        false
      };
    end
    return Table;
  end
  if ( FromVersion == 2 ) then
    local Table = {
      { "Type", nil },
      { "SubType", nil },
      { "TypeSubType", {} },
    };
    if ( type(Rule.TypeSubType) == "table" ) then
      for Key, Value in ipairs(Rule.TypeSubType) do
        Table[3][2][Key] = { Value[1], Value[2], false };
      end
    end
    return Table;
  end
  if ( FromVersion == 3 ) then
    local Table = {
      { "Type", nil },
      { "SubType", nil },
      { "TypeSubType", nil },
    };
    if ( type(Rule.TypeSubType) == "table" ) then
      if ( #Rule.TypeSubType == 0 ) then
        return Table;
      end
    end
  end
  return;
end

function module:CreateWidget()
  local Widget = CreateFrame("Frame", "PassLoot_Frames_Widgets_TypeSubType", nil, "UIDropDownMenuTemplate");
  Widget:EnableMouse(true);
  Widget:SetHitRectInsets(15, 15, 0 ,0);
  _G[Widget:GetName().."Text"]:SetJustifyH("CENTER");
  UIDropDownMenu_SetWidth(Widget, 220);
  Widget:SetScript("OnEnter", function() self:ShowTooltip(L["Type / SubType"], L["Selected rule will only match items with this type and subtype."]) end);
  Widget:SetScript("OnLeave", function() GameTooltip:Hide() end);
  local Button = _G[Widget:GetName().."Button"];
  Button:SetScript("OnEnter", function() self:ShowTooltip(L["Type / SubType"], L["Selected rule will only match items with this type and subtype."]) end);
  Button:SetScript("OnLeave", function() GameTooltip:Hide() end);
  local Title = Widget:CreateFontString(Widget:GetName().."Title", "BACKGROUND", "GameFontNormalSmall");
  Title:SetParent(Widget);
  Title:SetPoint("BOTTOMLEFT", Widget, "TOPLEFT", 20, 0);
  Title:SetText(L["Type / SubType"]);
  Widget:SetParent(nil);
  Widget:Hide();
  Widget.initialize = function(...) self:DropDown_Init(...) end;
  Widget.YPaddingTop = Title:GetHeight();
  Widget.Height = Widget:GetHeight() + Widget.YPaddingTop;
  Widget.XPaddingLeft = -15;
  Widget.XPaddingRight = -15;
  Widget.Width = Widget:GetWidth() + Widget.XPaddingLeft + Widget.XPaddingRight;
  Widget.PreferredPriority = 9;
  Widget.Info = {
    L["Type / SubType"],
    L["Selected rule will only match items with this type and subtype."],
  };
  return Widget;
end
module.Widget = module:CreateWidget();

-- Local function to get the data and make sure it's valid data
function module.Widget:GetData(RuleNum)
  local Data = module:GetConfigOption("TypeSubType", RuleNum);
  local Changed = false;
  if ( Data ) then
    if ( type(Data) == "table" and #Data > 0 ) then
      for Key, Value in ipairs(Data) do
        if ( type(Value) ~= "table" or type(Value[1]) ~= "number" or type(Value[2]) ~= "number" ) then
          Data[Key] = {
            module.NewFilterValue_Type,
            module.NewFilterValue_SubType,
            false
          };
          Changed = true;
        else  -- Check to make sure they are valid
          local FoundType, FoundSubType;
          for TypeKey, TypeValue in pairs(module.ItemTypes) do
            if ( TypeValue.Value == Data[Key][1] ) then
              FoundType = true;
              for SubTypeKey, SubTypeValue in pairs(TypeValue.SubTypes) do
                if ( SubTypeValue.Value == Data[Key][2] ) then
                  FoundSubType = true;
                  break;
                end
              end
              break;
            end
          end
          if ( not FoundType or not FoundSubType ) then
            Data[Key] = {
              module.NewFilterValue_Type,
              module.NewFilterValue_SubType,
              false
            };
            Changed = true;
          end
        end  -- If valid.
      end
    else
      Data = nil;
      Changed = true;
    end
  end
  if ( Changed ) then
    module:SetConfigOption("TypeSubType", Data);
  end
  return Data or {};
end

function module.Widget:GetNumFilters(RuleNum)
  local Value = self:GetData(RuleNum);
  return #Value;
end

function module.Widget:AddNewFilter()
  local Value = self:GetData();
  local NewTable = {
    module.NewFilterValue_Type,
    module.NewFilterValue_SubType,
    false
  };
  table.insert(Value, NewTable);
  module:SetConfigOption("TypeSubType", Value);
end

function module.Widget:RemoveFilter(Index)
  local Value = self:GetData();
  table.remove(Value, Index);
  if ( #Value == 0 ) then
    Value = nil;
  end
  module:SetConfigOption("TypeSubType", Value);
end

function module.Widget:DisplayWidget(Index)
  if ( Index ) then
    module.FilterIndex = Index;
  end
  local Value = self:GetData();
  local Value_Type = Value[module.FilterIndex][1];
  local Value_SubType = Value[module.FilterIndex][2];
  UIDropDownMenu_SetText(module.Widget, module:GetTypeSlotText(Value_Type, Value_SubType));
end

function module.Widget:GetFilterText(Index)
  local Value = self:GetData();
  local Value_Type = Value[Index][1];
  local Value_SubType = Value[Index][2];
  return module:GetTypeSlotText(Value_Type, Value_SubType);
end

function module.Widget:IsException(RuleNum, Index)
  local Data = self:GetData(RuleNum);
  return Data[Index][3];
end

function module.Widget:SetException(RuleNum, Index, Value)
  local Data = self:GetData(RuleNum);
  Data[Index][3] = Value;
  module:SetConfigOption("TypeSubType", Data);
end

function module.Widget:SetMatch(ItemLink, Tooltip)
  local _, _, _, _, _, ItemType, ItemSubType, _, _, _ = GetItemInfo(ItemLink);
  module.CurrentTypeMatch = -1;
  module.CurrentSubTypeMatch = -1;
  for TypeKey, TypeValue in pairs(module.ItemTypes) do
    if ( ItemType == TypeValue.Name ) then
      for SubTypeKey, SubTypeValue in pairs(TypeValue.SubTypes) do
        if ( ItemSubType == SubTypeValue.Name ) then
          module.CurrentSubTypeMatch = SubTypeValue.Value;
          break;
        end
      end
      module.CurrentTypeMatch = TypeValue.Value
      break;
    end
  end
  if ( ItemType ) then
    module:Debug("Type: "..ItemType.." Found: ("..module.CurrentTypeMatch..") ");
    if ( module.CurrentTypeMatch == -1 ) then
      module:Debug("Could not find ItemType: "..ItemType);
    end
  end
  if ( ItemSubType ) then
    module:Debug("Sub Type: "..ItemSubType.." Found: ("..module.CurrentSubTypeMatch..") ");
    if ( module.CurrentSubTypeMatch == -1 ) then
      module:Debug("Could not find ItemSubType: "..ItemSubType);
    end
  end
end

function module.Widget:GetMatch(RuleNum, Index)
  local Value = self:GetData(RuleNum);
  local RuleType = Value[Index][1];
  local RuleSubType = Value[Index][2];
  if ( RuleType > 1 ) then
    if ( RuleType ~= module.CurrentTypeMatch ) then
      module:Debug("Type doesn't match");
      return false;
    end
  end
  if ( RuleSubType > 1 ) then
    if ( RuleSubType ~= module.CurrentSubTypeMatch ) then
      module:Debug("SubType doesn't match");
      return false;
    end
  end
  return true;
end

function module:DropDown_Init(Frame, Level)
  Level = Level or 1;
  local info = {};
  info.checked = false;
  info.notCheckable = true;
  info.func = function(...) self:DropDown_OnClick(...) end;
  info.owner = Frame;
  if ( Level == 1 ) then
    for Key, Value in ipairs(self.ItemTypes) do
      info.text = Value.Name;
      info.hasArrow = true;
      info.notClickable = false;
      info.value = {
        ["Key"] = Key,
        ["Type"] = Value.Value,
        ["SubType"] = 1,
      };
      UIDropDownMenu_AddButton(info, Level);
    end
  else
    for Key, Value in ipairs(self.ItemTypes[UIDROPDOWNMENU_MENU_VALUE.Key].SubTypes) do
      info.text = Value.Name;
      info.hasArrow = false;
      info.notClickable = false;
      info.value = {
        ["Key"] = UIDROPDOWNMENU_MENU_VALUE.Key,
        ["Type"] = UIDROPDOWNMENU_MENU_VALUE.Type,
        ["SubType"] = Value.Value,
      };
      UIDropDownMenu_AddButton(info, Level);
    end
  end
end

function module:DropDown_OnClick(Frame)
  local Value = self.Widget:GetData();
  Value[self.FilterIndex][1] = Frame.value.Type;
  Value[self.FilterIndex][2] = Frame.value.SubType;
  self:SetConfigOption("TypeSubType", Value);
  UIDropDownMenu_SetText(Frame.owner, self:GetTypeSlotText(Frame.value.Type, Frame.value.SubType));
  DropDownList1:Hide(); -- Nested dropdown buttons don't hide their parent menus on click.
end

function module:GetTypeSlotText(TypeID, SubTypeID)
  for TypeKey, TypeValue in ipairs(self.ItemTypes) do
    if ( TypeValue.Value == TypeID ) then
      for SubTypeKey, SubTypeValue in ipairs(TypeValue.SubTypes) do
        if ( SubTypeValue.Value == SubTypeID ) then
          local ReturnValue = string.gsub(L["%type% - %subtype%"], "%%type%%", TypeValue.Name);
          ReturnValue = string.gsub(ReturnValue, "%%subtype%%", SubTypeValue.Name);
          return ReturnValue;
        end
      end
    end
  end
  return "";
end
