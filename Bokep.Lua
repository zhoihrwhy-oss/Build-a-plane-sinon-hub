local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer

local AutoTweenActive = false
local LoopTPActive = false

-- [[ FITUR 1: AUTO TWEEN +50 SEAP DETIK ]]
task.spawn(function()
    while task.wait(1) do
        if AutoTweenActive and LocalPlayer.Character then
            local hrp = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if hrp then
                -- Tween ke atas sejauh +50 dari posisi sekarang
                local targetCFrame = hrp.CFrame * CFrame.new(0, 0, 100000000)
                local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Linear)
                local tween = TweenService:Create(hrp, tweenInfo, {CFrame = targetCFrame})
                tween:Play()
            end
        end
    end
end)

-- [[ FITUR 2: LOOP TELEPORT +10 ]]
task.spawn(function()
    while task.wait(0.5) do -- Jeda antar teleportasi (bisa lu kecilin kalau mau lebih cepet)
        if LoopTPActive and LocalPlayer.Character then
            local hrp = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if hrp then
                -- Teleport maju ke depan karakter sejauh +10
                hrp.CFrame = hrp.CFrame * CFrame.new(0, 0, -100000)
            end
        end
    end
end)

-- [[ LOAD UI TORA LIBRARY ]]
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/liebertsx/Tora-Library/main/src/librarynew", true))()

local mainWin = library:CreateWindow("Sinon Hub by:Ardi")

mainWin:AddToggle({
    ["text"] = "Auto Farming v1",
    ["flag"] = "auto_tween_toggle",
    ["state"] = false,
    ["callback"] = function(state)
        AutoTweenActive = state
    end
})

mainWin:AddToggle({
    ["text"] = "Farming v2",
    ["flag"] = "loop_tp_toggle",
    ["state"] = false,
    ["callback"] = function(state)
        LoopTPActive = state
    end
})

library:Init()
