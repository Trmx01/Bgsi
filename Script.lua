local DrRayLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/DrRay-UI-Library/main/DrRay.lua"))()

-- window
local window = DrRayLibrary:Load("Zizu", "Default")
-- prima tab
local tab1 = DrRayLibrary.newTab("Auto Bubble", "")
tab1.newToggle("Toggle", "Toggle! (prints the state)", true, function(toggleState)
    
