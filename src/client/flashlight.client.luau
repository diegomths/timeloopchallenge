local RunService = game:GetService("RunService")
local currentCamera = game.Workspace.CurrentCamera
local player = game.Players.LocalPlayer

local rightShoulder:Motor6D = nil
local heartbeatConnection:RBXScriptConnection = nil

local function updateFlashlightPosition()
    if rightShoulder == nil then return end

    local lookVectorY = currentCamera.CFrame.LookVector.Y
    local shoulderC0Vector = rightShoulder.C0.Position
    rightShoulder.C0 = CFrame.new(shoulderC0Vector) * CFrame.Angles(lookVectorY,0,0)
end

--need to wait for character to be loaded
player.CharacterAdded:Connect(function()
    print("Character added")
	local backpack = player:FindFirstChildOfClass("Backpack")
    local flashlight = backpack:FindFirstChild("Flashlight")

    --detect when the flashlight is activated and deactivated
    flashlight.Activated:Connect(function()
        print("Flashlight activated")
        
    end)

    flashlight.Deactivated:Connect(function()
        print("Flashlight deactivated")
    end)

    flashlight.Equipped:Connect(function()
        print("Flashlight equipped")

        local rightUpperArm = player.Character:FindFirstChild("RightUpperArm")
        rightShoulder = rightUpperArm:FindFirstChild("RightShoulder")

        heartbeatConnection = RunService.Heartbeat:Connect(updateFlashlightPosition)
    end)

    flashlight.Unequipped:Connect(function()
        if heartbeatConnection ~= nil then
            heartbeatConnection:Disconnect()
            heartbeatConnection = nil
        end
    end)
end)



