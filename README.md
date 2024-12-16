local Player: Players = game:GetService(classname "Player")
local LocalPlayer: Player = Player.LocalPlayer

equipitem = function(v: any): ()
	if LocalPlayer.Backpack:FindFirstChild(v) then
		local Eq: any = LocalPlayer.Backpack:FindFirstChild(v)
		LocalPlayer.Character.Humanoid:EquipTool(Eq)
	end
end

for i: any,v: any in pairs(LocalPlayer.Backpack:GetChildren()) do
    if v:IsA ("Tool") and v.Name:lower():find("rod") then
	    equipitem(v: v.Name)
	end
end
