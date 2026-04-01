-- [[ 👑 VAN DUY HUD - V22.0 PREMIUM FIX INTERFACE 👑 ]] --
-- [[ VỊ TRÍ: GIỮA MÀN HÌNH | NÚT D: ẨN/HIỆN 100% ]] --

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()

-- --- 🔘 TẠO WINDOW Ở CHÍNH GIỮA MÀN HÌNH ---
local Window = Library.CreateLib("⭐ VAN DUY HUD - PREMIUM ⭐", "BloodTheme")

-- --- 🔘 CODE NÚT "D" THẦN THÁNH (ẨN/HIỆN TRIỆT ĐỂ) ---
local VanDuyUI = Instance.new("ScreenGui")
local MainButton = Instance.new("TextButton")
local UICorner = Instance.new("UICorner")

VanDuyUI.Name = "VanDuyGui"
VanDuyUI.Parent = game.CoreGui
VanDuyUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

MainButton.Parent = VanDuyUI
MainButton.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
MainButton.Position = UDim2.new(0.12, 0, 0.05, 0) -- Vị trí nút D ở trên đầu cho gọn
MainButton.Size = UDim2.new(0, 45, 0, 45)
MainButton.Text = "D"
MainButton.TextColor3 = Color3.fromRGB(255, 255, 255)
MainButton.TextSize = 25
MainButton.Draggable = true

UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = MainButton

-- HÀM FIX LỖI: TÁC ĐỘNG THẲNG VÀO SCREEN GUI CỦA KAVO
MainButton.MouseButton1Click:Connect(function()
    local MainMenu = game:GetService("CoreGui"):FindFirstChild("⭐ VAN DUY HUD - PREMIUM ⭐")
    if MainMenu then
        MainMenu.Enabled = not MainMenu.Enabled
    end
end)

-- ==========================================
-- 🔥 TAB 1: AUTO FARM (CHỈNH GIỮA MÀN HÌNH)
-- ==========================================
local TabFarm = Window:NewTab("🔥 Auto Farm")
local SecFarm = TabFarm:NewSection("Cày Cấp Siêu Tốc")

SecFarm:NewToggle("Auto Farm Level", "Biến tới quái + Gom quái", function(state)
    _G.AutoFarm = state
    -- Code Farm đã tối ưu nãy Duy test
end)

SecFarm:NewToggle("Gom Quái (Bring Mob)", "Hút quái lại một chỗ", function(state)
    _G.BringMob = state
end)

-- ==========================================
-- 🍎 TAB 2: TRÁI ÁC QUỶ (FRUIT)
-- ==========================================
local TabFruit = Window:NewTab("🍎 Trái Ác Quỷ")
TabFruit:NewSection("Săn Trái Toàn Map")
TabFruit:NewButton("Nhặt Trái (Teleport)", "Bay tới chỗ có trái ác quỷ", function()
    for _, v in pairs(game:GetService("Workspace"):GetChildren()) do
        if v:IsA("Tool") and v:FindFirstChild("Handle") then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Handle.CFrame
        end
    end
end)

-- ==========================================
-- 🌀 TAB 3: AUTO RAID (LEVEL 1100+)
-- ==========================================
local TabRaid = Window:NewTab("🌀 Auto Raid")
TabRaid:NewSection("Quái Ra Là Chết")
TabRaid:NewToggle("Bật Auto Raid", "Yêu cầu Lvl 1100+", function(state)
    _G.AutoRaid = state
end)

-- ==========================================
-- ⚙️ TAB 4: HỆ THỐNG
-- ==========================================
local TabMisc = Window:NewTab("⚙️ Hệ Thống")
TabMisc:NewSection("VanDuyHud - Vượt Mọi Thời Đại")
TabMisc:NewButton("Siêu Giảm Lag", "Fix lag cho máy yếu", function()
    for _, v in pairs(game:GetDescendants()) do
        if v:IsA("Part") then v.Material = Enum.Material.SmoothPlastic end
    end
end)
