local player = game.Players.LocalPlayer


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
end)



