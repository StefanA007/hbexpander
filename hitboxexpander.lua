function getPlayersName()
    for i, v in pairs(game:GetChildren()) do
        if v.ClassName == "Players" then
            return v.Name
        end
    end
end

local players = getPlayersName()

local localPlayer = game[players].LocalPlayer

coroutine.resume(coroutine.create(function()
    while task.wait() do
        coroutine.resume(coroutine.create(function()
            for _, v in pairs(game[players]:GetPlayers()) do
                if v.Name ~= localPlayer.Name and v.Character then
                    local parts = {
                    --    "RightUpperLeg",
                    --    "LeftUpperLeg",
                        "HeadHB",
                    }
                    for _, partName in ipairs(parts) do
                        local part = v.Character[partName]
                        if part then
                            part.Transparency = 1
                            part.Massless = true
                            part.CanCollide = false
                            part.Size = Vector3.new(30, 29, 20)
                        end
                    end
                end
            end
        end))
    end
end))