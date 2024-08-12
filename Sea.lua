


local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()

local Window = Library.CreateLib("Meme Sea | Xiaoly", "GrapeTheme")

local Tab1 = Window:NewTab("Settings")
local Tab = Window:NewTab("Main-Features")



local CredSection = Tab1:NewSection("Settings")
local Section = Tab:NewSection("Main-Features")



local followDistance = 7 -- Default follow distance


Section:NewToggle("AutoFarm (Nearest Mob)", "AutoFarm", function(Value)
    a = Value
    while a do
        task.wait()
        pcall(function()
            local player = game.Players.LocalPlayer
            wait() -- load character

            local char = player.Character
            local char_root = char:FindFirstChild("HumanoidRootPart")

            local nearest_hum = math.huge
            local target_root
            local target_hum

            for i, v in pairs(workspace.Monster:GetDescendants()) do
                local root = v:FindFirstChild("HumanoidRootPart")
                local hum = v:FindFirstChild("Humanoid")

                if root and hum and v ~= char then
                    local mag = (char_root.Position - root.Position).magnitude

                    if mag < 100 and mag < nearest_hum then
                        local obstructed = false

                        local ray = Ray.new(char_root.Position, (root.Position - char_root.Position).unit * 20)
                        local part = workspace:FindPartOnRay(ray, char, false, true)

                        if part then
                            if part.Parent ~= v then
                                obstructed = true
                            end
                        end

                        if not obstructed then
                            nearest_hum = mag
                            target_root = root
                            target_hum = hum
                        end
                    end
                end
            end

            if target_root and target_hum then
                nearest_hum = math.huge

                local behind = (target_root.CFrame * CFrame.new(0, 0, followDistance)).p -- the behind position
                local lookAt = (target_root.Position - char_root.Position).unit -- direction to look at

                char_root.CFrame = CFrame.new(behind)
                char_root.CFrame = CFrame.new(behind, behind + Vector3.new(lookAt.X, 0, lookAt.Z))

                target_hum:TakeDamage()
            end
        end)
    end
end)
Section:NewSlider("Autofarm Distance", "Distance", 25, 0, function(s) -- 50 (MaxValue) | 0 (MinValue)
    followDistance = s
end)

Section:NewToggle("Kill Aura", "Kill Aura", function(Value)
    a = Value
    spawn(function()
        while a do
            wait(0.2)
            pcall(function()
                local vim = game:GetService("VirtualInputManager")
                local player = game.Players.LocalPlayer
                local starterGui = player:WaitForChild("PlayerGui")

                -- Function to find a GUI element by type
                local function findGuiElement(parent, targetType)
                    for _, descendant in pairs(parent:GetDescendants()) do
                        if descendant:IsA(targetType) then
                            return descendant
                        end
                    end
                    return nil
                end

                -- Find the GUI element
                local x = findGuiElement(starterGui, "GuiObject")
                if x then
                    local clickX = x.AbsolutePosition.X + x.AbsoluteSize.X / 2 - 205
                    local clickY = x.AbsolutePosition.Y + x.AbsoluteSize.Y / 2 + 60

                    vim:SendMouseButtonEvent(clickX, clickY, 0, true, x, 1)
                    vim:SendMouseButtonEvent(clickX, clickY, 0, false, x, 1)
                else
                    warn("No suitable GUI element found")
                end
            end)
        end
    end)
end)
Section:NewToggle("Mob Hitbox OP", "Mob Hitbox", function(Value)
 a = Value
        while a do task.wait(1)
        pcall(function()
 for _, v in pairs(game.Workspace:GetDescendants()) do
    if v.Name == "HumanoidRootPart" and v:IsA("Part") and v.Parent ~= game.Players.LocalPlayer.Character then
        v.Size = Vector3.new(17,17,17)
        v.Transparency = 0.8
        v.Material = "Neon"
    
        v.CanCollide = true
    end
end
  end)
             end
    end)


Section:NewButton("CFrame Speed Press Z", "Speed", function()
repeat
		wait()
	until game:IsLoaded()
	local L_134_ = game:service('Players')
	local L_135_ = L_134_.LocalPlayer
	repeat
		wait()
	until L_135_.Character
	local L_136_ = game:service('UserInputService')
	local L_137_ = game:service('RunService')
	getgenv().Multiplier = 0.5
	local L_138_ = true
	local L_139_
	L_136_.InputBegan:connect(function(L_140_arg0)
		if L_140_arg0.KeyCode == Enum.KeyCode.LeftBracket then
			Multiplier = Multiplier + 0.01
			print(Multiplier)
			wait(0.2)
			while L_136_:IsKeyDown(Enum.KeyCode.LeftBracket) do
				wait()
				Multiplier = Multiplier + 0.01
				print(Multiplier)
			end
		end
		if L_140_arg0.KeyCode == Enum.KeyCode.RightBracket then
			Multiplier = Multiplier - 0.01
			print(Multiplier)
			wait(0.2)
			while L_136_:IsKeyDown(Enum.KeyCode.RightBracket) do
				wait()
				Multiplier = Multiplier - 0.01
				print(Multiplier)
			end
		end
		if L_140_arg0.KeyCode == Enum.KeyCode.Z then
			L_138_ = not L_138_
			if L_138_ == true then
				repeat
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame + game.Players.LocalPlayer.Character.Humanoid.MoveDirection * Multiplier
					game:GetService("RunService").Stepped:wait()
				until L_138_ == false
			end
		end
	end)
end)

Section:NewSlider("CFrame Speed", "Speed", 5, 0, function(s) -- 500 (MaxValue) | 0 (MinValue)
 getgenv().Multiplier = s
end)
Section:NewButton("Boost FPS", "FPS Booster", function()
        for _,v in pairs(workspace:GetDescendants()) do
if v.ClassName == "Part"
or v.ClassName == "SpawnLocation"
or v.ClassName == "WedgePart"
or v.ClassName == "Terrain"
or v.ClassName == "MeshPart" then
v.Material = "Plastic"
end
end
end)

Section:NewToggle("Infinite Jump", "Infinite Jump", function(state)
if state then
_G.infinjump = true
local Player = game:GetService("Players").LocalPlayer
local Mouse = Player:GetMouse()
Mouse.KeyDown:connect(function(k)
if _G.infinjump then
if k:byte() == 32 then
Humanoid = game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
Humanoid:ChangeState("Jumping")
wait(0.1)
Humanoid:ChangeState("Seated")
end
end
end)
local Player = game:GetService("Players").LocalPlayer
local Mouse = Player:GetMouse()
    else
if _G.infinjump == true then
_G.infinjump = false
else
_G.infinjump = true
end
end
            end)

Section:NewToggle("Noclip", "Noclip", function()
 local Noclip = nil
local Clip = nil

function noclip()
	Clip = false
	local function Nocl()
		if Clip == false and game.Players.LocalPlayer.Character ~= nil then
			for _,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
				if v:IsA('BasePart') and v.CanCollide and v.Name ~= floatName then
					v.CanCollide = false
				end
			end
		end
		wait(0.21) -- basic optimization
	end
	Noclip = game:GetService('RunService').Stepped:Connect(Nocl)
end

function clip()
	if Noclip then Noclip:Disconnect() end
	Clip = true
end

noclip()
end)


CredSection:NewLabel("Made By LordRestu")


CredSection:NewKeybind("Toggle UI", "Toggle The UI", Enum.KeyCode.L, function()
	Library:ToggleUI()
end)

CredSection:NewButton("Mobile Keyboard", "Mobile Players", function(state)
loadstring(game:HttpGet("https://raw.githubusercontent.com/advxzivhsjjdhxhsidifvsh/mobkeyboard/main/main.txt", true))()
end)
