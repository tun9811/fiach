local Player = game:GetService("Players")
local GuiService = game:GetService("GuiService")
local VirtualInputManager = game:GetService("VirtualInputManager")
local LocalPlayer = Player.LocalPlayer
local Char = LocalPlayer.Character
local HR = Char.HumanoidRootPart
local StandHR = HR.CFrame

equipitem = function(v)
    if LocalPlayer.Backpack:FindFirstChild(v) then
        local Eq = LocalPlayer.Backpack:FindFirstChild(v)
		LocalPlayer.Character.Humanoid:EquipTool(Eq)
	end
end

----

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Athena Hub Fisch", "Midnight")
local Tab = Window:NewTab("Main")
local Section = Tab:NewSection("Main")

Section:NewToggle("AutoCast", "", function(v)
    _G.AutoCast = v
while _G.AutoCast do wait()
    pcall(function()
    if (StandHR.Position - HR.Position).Magnitude >= 1 then
    HR.CFrame = StandHR
end
local Rod = LocalPlayer.Character:FindFirstChildOfClass("Tool")
    Rod.events.cast:FireServer(100,1)
	    end)
	end
end)

-- AutoS
Section:NewToggle("AutoShake", "", function(v)
    _G.AutoShake = v
local GUI = LocalPlayer.PlayerGui
local shakeui = GUI:FindFirstChild("shakeui")
    while _G.AutoShake do wait()
	    pcall(function()
    if shakeui and shakeui.Enabled then
        local safezone = shakeui:FindFirstChild("safezone")
    if safezone then
		local button = safezone:FindFirstChild("button")
	if button and button:IsA("ImageButton") and button.Visible then
	task.wait(.001)
        GuiService.SelectedCoreObject = button
        VirtualInputManager:SendKeyEvent(true,Enum.KeyCode.Return,false,game)
        VirtualInputManager:SendKeyEvent(false,Enum.KeyCode.Return,false,game)
                    end	
	            end
            end
		end)
    end
end)

-- AutoR
Section:NewToggle("AutoReel", "", function(v)
     _G.AutoReel = v
local reelfinished = game:GetService("ReplicatedStorage").events.reelfinished
for i,v in pairs(LocalPlayer.PlayerGui:GetChildren()) do
    if v:IsA("ScreenGui") and v.Name == "reel" then
	    if v:FindFirstChild ("bar") then
		wait(1)
            reelfinished:FireServer(100,true)
        end
    end
end
end)

-- EquipTool
spawn(function()
    pcall(function()
    while _G.AutoCast do wait()
for i,v in pairs(LocalPlayer.Backpack:GetChildren()) do
    if v:IsA ("Tool") and v.Name:lower():find("rod") then
        equipitem(v.Name)
                end    
            end
        end
    end)
end)
