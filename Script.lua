-- Load DrRay ui
local DrRayLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/DrRay-UI-Library/main/DrRay.lua"))()

-- window
local window = DrRayLibrary:Load("Zizu", "Default")

-- prima tab
local tab1 = DrRayLibrary.newTab("Auto Bubble", "")

-- variabile per fermare/attivare il loop
local autoBubbleEnabled = false

-- funzione per far scoppiare la bolla
local function blowBubble()
    local args = {
        [1] = "BlowBubble"
    }
    game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("Framework"):WaitForChild("Network"):WaitForChild("Remote"):WaitForChild("Event"):FireServer(unpack(args)) 
end

-- Auto Bubble
tab1.newToggle("Auto Bubble", "Auto farm Bubble", true, function(toggleState)
    autoBubbleEnabled = toggleState
    while autoBubbleEnabled and task.wait(0.1) do
        pcall(blowBubble)
    end
end)

-- tp
tab.newDropdown("Teleport", "Select one of these options!", {"Zen"}
