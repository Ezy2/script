local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()


-- Windows
local Window = OrionLib:MakeWindow({Name = "TestWare V3", HidePremium = true, SaveConfig = true, ConfigFolder = "NoStop", IntroText="TestWare V3"})

-- Tabs
local Main = Window:MakeTab({
	Name = "Main",
	PremiumOnly = false
})

local Character = Window:MakeTab({
	Name = "Character",
	PremiumOnly = false
})
-- Global Values

_G.AJV = 50


-- Main

Main:AddToggle({
	Name = "Safe Teleport",
	Default = false,
	Callback = function(Value)
	local G = game:GetService("Workspace")["Safe Zones"]
	_G.H = Value

    while _G.H do
        for _,v in pairs(G:GetChildren()) do
            if not _G.H then break end
            if v.Name == "safe box" then continue end
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame + Vector3.new(0,1,0)
            wait(0.5)
        end
    end
    end
})

Main:AddButton({
	Name = "Delete Map",
	Callback = function()
    for _,v in pairs(Workspace:GetChildren()) do 
        v:Destroy()
        end
  	end    
})

-- Character

Character:AddToggle({
	Name = "God Mode",
	Default = false,
	Callback = function(Value)
		_G.GODMODE = Value
	end    
})

Character:AddToggle({
	Name = "Anti Void (Teleport)",
	Default = false,
	Callback = function(Value)
	_G.SW = Value    
	    
		while _G.SW do
	    if game.Players.LocalPlayer.Character:WaitForChild("Humanoid").FloorMaterial ~= Enum.Material.Air then 
	        _G.SP = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame end
		    if game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Y < -70 then
		        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = _G.SP
		        game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0,15,0) 
                wait(0.1)
                game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(-10,0,-10) *game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector
		        end
		    wait()
		    end
	end    
})

Character:AddToggle({
	Name = "Anti Void (Jump)",
	Default = false,
	Callback = function(Value)
	_G.SJ = Value    
	    
		while _G.SJ do
		    if game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Y < -70 then
		        game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0,200,0)
		        end
		    wait()
		    end
	end    
})


Character:AddToggle({
	Name = "Auto Jump",
	Default = false,
	Callback = function(Value)
	    _G.L = Value
	    local lg = false
	    
		while _G.L do 
		    print(game.Players.LocalPlayer.Character:WaitForChild("Humanoid").FloorMaterial)
		    if game.Players.LocalPlayer.Character:WaitForChild("Humanoid").FloorMaterial == Enum.Material.Air then
		        if lg then
		        game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0,_G.AJV,0)
		        lg = false end
		    else
		        lg = true
		        end
		    wait()
		    end
	end    
})

Character:AddSlider({
	Name = "Walk Speed",
	Min = 16,
	Max = 200,
	Default = 16,
	Color = Color3.fromRGB(9, 99, 195),
	Increment = 0.5,
	ValueName = "Speed",
	Callback = function(Speed)
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Speed
	end    
})

Character:AddSlider({
	Name = "Jump Height",
	Min = 7.1,
	Max = 100,
	Default = 16,
	Color = Color3.fromRGB(9, 99, 195),
	Increment = 0.5,
	ValueName = "JumpHeight",
	Callback = function(JumpHeight)
		game.Players.LocalPlayer.Character.Humanoid.JumpHeight = JumpHeight
	end    
})

local LocalPlayer = game:GetService("Players").LocalPlayer
local OldIndex = nil
_G.GODMODE = false

OldIndex = hookmetamethod(game, "__index", function(Self, Key)
    if not checkcaller() and Self == LocalPlayer and Key == "Character" and _G.GODMODE then
        return nil
    end

    return OldIndex(Self, Key)
end)

Character:AddSlider({
	Name = "Slider",
	Min = 50,
	Max = 150,
	Default = 50,
	Color = Color3.fromRGB(9, 99, 195),
	Increment = 1,
	ValueName = "Auto JumpHeight",
	Callback = function(Value)
		_G.AJV = Value
	end    
})
