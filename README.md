local player = game:GetService("Players")
local LocalPlayer = Player.LocalPlayer

equipitem = function(v)
    if LocalPlayer.Backpack:FindFirstChild(v) then
        local Eq = LocalPlayer.Backpack:FindFirstChild(v)
		LocalPlayer.Character.Humanoid:EquipTool(Eq)
	end
end

for i,v in piars(LocalPlayer.Backpack:GetChildren()) do
    if v:IsA ("Tool") and v.Name:lower():find("rod") then
    equipitem(v.Name)
    end    
end
