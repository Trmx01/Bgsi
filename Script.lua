local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "BGSI | Sun X",
    LoadingTitle = "Bubble Gum Script",
    LoadingSubtitle = "Rayfield UI Edition",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "BGSI_Config",
        FileName = "Main"
    },
    KeySystem = false
})

-- Variabili
local autoBubbleEnabled = false

-- Funzioni
local function bubble()
    local args = {
        [1] = "BlowBubble"
    }
    game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("Framework"):WaitForChild("Network"):WaitForChild("Remote"):WaitForChild("Event"):FireServer(unpack(args)) 
end
--===[ HOME ]===
local HomeTab = Window:CreateTab("HOME", 4483362458)
HomeTab:CreateInput({
    Name = "Walkspeed",
    PlaceholderText = "Enter speed",
    RemoveTextAfterFocusLost = true,
    Callback = function(v)
        local speed = tonumber(v)
        if speed then
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = speed
        else
            Rayfield:Notify({Title = "Errore", Content = "Inserisci un numero valido"})
        end
    end
})
HomeTab:CreateToggle({
    Name = "Infinite Jump",
    CurrentValue = false,
    Callback = function(val) getgenv().InfJump = val end
})
HomeTab:CreateToggle({
    Name = "Anti AFK",
    CurrentValue = false,
    Callback = function(val) getgenv().AntiAFK = val end
})
HomeTab:CreateToggle({
    Name = "Noclip",
    CurrentValue = false,
    Callback = function(val) getgenv().Noclip = val end
})

--===[ MAIN ]===
local MainTab = Window:CreateTab("MAIN", 4483362458)
MainTab:CreateToggle({
    Name = "Auto Blow Bubble",
    CurrentValue = false,
    Callback = function(toggleState)
        autoBubbleEnabled = toggleState
        if toggleState then
            task.spawn(function()
                while autoBubbleEnabled and task.wait(0.1) do
                    pcall(bubble)
                end
            end)
        end
    end
})
MainTab:CreateToggle({
    Name = "Auto Sell When Reached",
    CurrentValue = false,
    Callback = function(val) getgenv().AutoSellReached = val end
})
MainTab:CreateToggle({
    Name = "Auto Sell Bubble",
    CurrentValue = false,
    Callback = function(val) getgenv().AutoSell = val end
})
MainTab:CreateToggle({
    Name = "Auto Collect Coins",
    CurrentValue = false,
    Callback = function(val) getgenv().AutoCoins = val end
})
MainTab:CreateToggle({
    Name = "Auto Collect Chests",
    CurrentValue = false,
    Callback = function(val) getgenv().AutoChests = val end
})
MainTab:CreateDropdown({
    Name = "Choose Flavour",
    Options = {"Basic", "Strawberry", "Rainbow"},
    CurrentOption = "Basic",
    Callback = function(v) getgenv().ChosenFlavour = v end
})
MainTab:CreateToggle({
    Name = "Auto Buy Flavours",
    CurrentValue = false,
    Callback = function(val) getgenv().AutoBuyFlavour = val end
})
MainTab:CreateDropdown({
    Name = "Choose Gum",
    Options = {"Starter", "Pro", "Ultra"},
    CurrentOption = "Starter",
    Callback = function(v) getgenv().ChosenGum = v end
})
MainTab:CreateToggle({
    Name = "Auto Buy Gum",
    CurrentValue = false,
    Callback = function(val) getgenv().AutoBuyGum = val end
})
MainTab:CreateToggle({
    Name = "Auto Sell Bubble MAX",
    CurrentValue = false,
    Callback = function(val) getgenv().AutoMaxSell = val end
})
MainTab:CreateDropdown({
    Name = "Select Egg",
    Options = {"Starter Egg", "Void Egg", "Legend Egg"},
    CurrentOption = "Starter Egg",
    Callback = function(v) getgenv().SelectedEgg = v end
})
MainTab:CreateInput({
    Name = "Delay to Hatch",
    PlaceholderText = "Seconds",
    RemoveTextAfterFocusLost = true,
    Callback = function(v)
        local delay = tonumber(v)
        if delay then
            getgenv().HatchDelay = delay
        else
            Rayfield:Notify({Title = "Errore", Content = "Inserisci un numero valido"})
        end
    end
})
MainTab:CreateToggle({
    Name = "Auto Claim Season",
    CurrentValue = false,
    Callback = function(val) getgenv().AutoSeason = val end
})
MainTab:CreateToggle({
    Name = "Auto Claim Prize",
    CurrentValue = false,
    Callback = function(val) getgenv().AutoPrize = val end
})
MainTab:CreateToggle({
    Name = "Auto Claim Void Chest",
    CurrentValue = false,
    Callback = function(val) getgenv().VoidChest = val end
})
MainTab:CreateToggle({
    Name = "Auto Claim Giant Chest",
    CurrentValue = false,
    Callback = function(val) getgenv().GiantChest = val end
})
MainTab:CreateToggle({
    Name = "Auto Claim Infinity Chest",
    CurrentValue = false,
    Callback = function(val) getgenv().InfinityChest = val end
})
MainTab:CreateToggle({
    Name = "Auto Right Chest",
    CurrentValue = false,
    Callback = function(val) getgenv().RightChest = val end
})

--===[ INVENTORY ]===
local InventoryTab = Window:CreateTab("INVENTORY", 4483362458)
InventoryTab:CreateToggle({
    Name = "Auto Best Pets",
    CurrentValue = false,
    Callback = function(val) getgenv().BestPets = val end
})
InventoryTab:CreateInput({
    Name = "Pet Name (Enchant)",
    PlaceholderText = "Enter pet name",
    RemoveTextAfterFocusLost = true,
    Callback = function(v) getgenv().EnchantPet = v end
})
InventoryTab:CreateToggle({
    Name = "Auto Reroll Enchant (BETA)",
    CurrentValue = false,
    Callback = function(val) getgenv().Reroll = val end
})
InventoryTab:CreateToggle({
    Name = "Auto Upgrade Mastery - Pets",
    CurrentValue = false,
    Callback = function(val) getgenv().MasteryPets = val end
})
InventoryTab:CreateToggle({
    Name = "Auto Upgrade Mastery - Buffs",
    CurrentValue = false,
    Callback = function(val) getgenv().MasteryBuffs = val end
})
InventoryTab:CreateToggle({
    Name = "Auto Upgrade Mastery - Shops",
    CurrentValue = false,
    Callback = function(val) getgenv().MasteryShops = val end
})
InventoryTab:CreateToggle({
    Name = "Auto Upgrade Mastery - Gifts",
    CurrentValue = false,
    Callback = function(val) getgenv().MasteryGifts = val end
})
InventoryTab:CreateDropdown({
    Name = "Select Potion",
    Options = {"Power", "Luck", "Speed"},
    CurrentOption = "Power",
    Callback = function(v) getgenv().Potion = v end
})
InventoryTab:CreateDropdown({
    Name = "Choose Power",
    Options = {"x2 Strength", "x2 Hatch"},
    CurrentOption = "x2 Strength",
    Callback = function(v) getgenv().PotionPower = v end
})
InventoryTab:CreateToggle({
    Name = "Auto Use Potion",
    CurrentValue = false,
    Callback = function(val) getgenv().UsePotion = val end
})
InventoryTab:CreateToggle({
    Name = "Auto Use All Potions",
    CurrentValue = false,
    Callback = function(val) getgenv().UseAll = val end
})
InventoryTab:CreateDropdown({
    Name = "Select Island",
    Options = {"Void", "Heaven", "Zen"},
    CurrentOption = "Void",
    Callback = function(v) getgenv().Island = v end
})

--===[ TELEPORTS ]===
local TeleportTab = Window:CreateTab("TELEPORTS", 4483362458)
TeleportTab:CreateButton({
    Name = "Discover Zen Island",
    Callback = function()
        Rayfield:Notify({Title = "Teleport", Content = "Teleporting to Zen Island"})
    end
})
TeleportTab:CreateDropdown({
    Name = "Select Island",
    Options = {"Void", "Heaven", "Zen"},
    CurrentOption = "Void",
    Callback = function(v) getgenv().TPIsland = v end
})
TeleportTab:CreateButton({
    Name = "Teleport to Island",
    Callback = function()
        Rayfield:Notify({Title = "Teleport", Content = "Teleporting to " .. (getgenv().TPIsland or "Unknown")})
    end
})

--===[ WEBHOOK ]===
local WebhookTab = Window:CreateTab("WEBHOOK", 4483362458)
WebhookTab:CreateInput({
    Name = "Webhook URL",
    PlaceholderText = "https://discord.com/api/webhooks/...",
    RemoveTextAfterFocusLost = true,
    Callback = function(v) getgenv().WebhookURL = v end
})
WebhookTab:CreateButton({
    Name = "Send Test Message",
    Callback = function()
        Rayfield:Notify({Title = "Webhook", Content = "Sending test message to: " .. (getgenv().WebhookURL or "No URL")})
    end
})
WebhookTab:CreateInput({
    Name = "Time to Send (seconds)",
    PlaceholderText = "e.g. 600",
    RemoveTextAfterFocusLost = true,
    Callback = function(v)
        local time = tonumber(v)
        if time then
            getgenv().WebhookTime = time
        else
            Rayfield:Notify({Title = "Errore", Content = "Inserisci un numero valido"})
        end
    end
})
WebhookTab:CreateToggle({
    Name = "Send Statistics",
    CurrentValue = false,
    Callback = function(val) getgenv().SendStats = val end
})

--===[ MISCELLANEOUS ]===
local MiscTab = Window:CreateTab("MISCELLANEOUS", 4483362458)
MiscTab:CreateButton({
    Name = "Redeem All Codes",
    Callback = function()
        Rayfield:Notify({Title = "Codes", Content = "Redeeming all codes..."})
    end
})
MiscTab:CreateDropdown({
    Name = "Move Method",
    Options = {"Tween", "CFrame", "TP"},
    CurrentOption = "Tween",
    Callback = function(v) getgenv().MoveMethod = v end
})

--===[ STATUS ]===
local StatusTab = Window:CreateTab("STATUS", 4483362458)
StatusTab:CreateParagraph({
    Title = "Game Stats",
    Content = "Coins: 0\nGems: 0\nBubbles: 0"
})

--===[ SETTINGS ]===
local SettingsTab = Window:CreateTab("SETTINGS", 4483362458)
SettingsTab:CreateButton({
    Name = "Rejoin Server",
    Callback = function()
        local success, err = pcall(function()
            game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId)
        end)
        if not success then
            Rayfield:Notify({Title = "Errore", Content = "Impossibile ricongiungersi al server"})
        end
    end
})

--===[ CREDIT ]===
local CreditTab = Window:CreateTab("CREDIT", 4483362458)
CreditTab:CreateParagraph({
    Title = "Credit",
    Content = "by zizu"
})
