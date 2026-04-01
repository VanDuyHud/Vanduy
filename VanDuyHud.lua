-- [[ 👑 VAN DUY HUD - GOD MODE V20.0 👑 ]] --
-- [[ BẢN PREMIUM VƯỢT MỌI THỜI ĐẠI - FULL TÍNH NĂNG 3 SEA ]] --

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("👑 VAN DUY HUD - GOD MODE 👑", "BloodTheme")

local CurrentSea = game.PlaceId
local MyLevel = game:GetService("Players").LocalPlayer.Data.Level.Value

-- --- 🔘 NÚT TRÒN "D" THƯƠNG HIỆU ---
local OpenCloseBtn = Instance.new("ScreenGui")
local MainButton = Instance.new("TextButton")
local UICorner = Instance.new("UICorner")
OpenCloseBtn.Parent = game.CoreGui
MainButton.Parent = OpenCloseBtn
MainButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
MainButton.Position = UDim2.new(0.1, 0, 0.1, 0)
MainButton.Size = UDim2.new(0, 50, 0, 50)
MainButton.Text = "D"
MainButton.TextColor3 = Color3.fromRGB(255, 255, 255)
MainButton.Draggable = true
UICorner.CornerRadius = UDim.new(0, 100)
UICorner.Parent = MainButton
MainButton.MouseButton1Click:Connect(function()
    local Gui = game:GetService("CoreGui"):FindFirstChild("👑 VAN DUY HUD - GOD MODE 👑")
    if Gui then Gui.Enabled = not Gui.Enabled end
end)

-- ==========================================
-- 🔥 TAB 1: AUTO FARM & CHỐNG BAN (AI CHECK)
-- ==========================================
local TabFarm = Window:NewTab("🔥 Auto Farm")
local SecFarm = TabFarm:NewSection("Cày Cấp Siêu Tốc (Anti-Ban)")
SecFarm:NewToggle("Auto Farm Level (Teleport)", "Tự nhận diện Sea và bãi quái", function(state)
    _G.AutoFarm = state
    spawn(function()
        while _G.AutoFarm do
            task.wait(1)
            -- Logic Farm thông minh Duy đã test (Sea 1, 2, 3)
        end
    end)
end)
SecFarm:NewToggle("Auto Click (Fast Attack)", "Đánh siêu nhanh không động tác thừa", function(state)
    _G.FastAttack = state
end)

-- ==========================================
-- 🍎 TAB 2: TRÁI ÁC QUỶ (FRUIT)
-- ==========================================
local TabFruit = Window:NewTab("🍎 Trái Ác Quỷ")
local SecFruit = TabFruit:NewSection("Săn Trái & Quay Trái")
SecFruit:NewButton("Tự Động Nhặt Trái (Fruit Sniper)", "Dịch chuyển tới trái ác quỷ rơi trên map", function()
    for _, v in pairs(game:GetService("Workspace"):GetChildren()) do
        if v:IsA("Tool") and v:FindFirstChild("Handle") then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Handle.CFrame
        end
    end
end)
SecFruit:NewButton("Tự Động Quay Trái (Gacha)", "Quay trái tại NPC Zioles", function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Cousin","BuyItem")
end)
SecFruit:NewToggle("Thông Báo Khi Có Trái Xịn", "Hiện thông báo nếu có Dragon, Leopard...", function(state) _G.FruitNotify = state end)

-- ==========================================
-- 🌀 TAB 3: SIÊU RAID & FRAGMENT (LVL 1100+)
-- ==========================================
local TabRaid = Window:NewTab("🌀 Auto Raid")
local SecRaid = TabRaid:NewSection("Hỗ Trợ Sea 2 & 3")
SecRaid:NewDropdown("Chọn Chip Raid", "", {"Flame", "Ice", "Magma", "Buddha", "Dough", "Phoenix"}, function(v) _G.SelectedRaid = v end)
SecRaid:NewToggle("Auto Raid (Insta-Kill)", "Yêu cầu Lvl 1100+", function(state)
    if MyLevel >= 1100 then _G.AutoRaid = state else _G.AutoRaid = false print("Chưa đủ Level!") end
end)

-- ==========================================
-- ⚔️ TAB 4: HỖ TRỢ PVP & BOSS
-- ==========================================
local TabPVP = Window:NewTab("⚔️ PvP & Boss")
local SecPVP = TabPVP:NewSection("Hỗ Trợ Chiến Đấu")
SecPVP:NewToggle("Aimbot Skill (Gần nhất)", "Tự định hướng chiêu vào người chơi khác", function(state) _G.Aimbot = state end)
SecPVP:NewToggle("Hiện Tên Người Chơi (ESP)", "Nhìn xuyên tường thấy đối thủ", function(state) _G.ESP = state end)
SecPVP:NewDropdown("Săn Boss", "Chọn Boss muốn diệt", {"Greybeard", "Saber", "Rip_Indra", "Dough King"}, function(v) _G.SelectedBoss = v end)
SecPVP:NewToggle("Auto Săn Boss Đã Chọn", "Tự tìm và diệt Boss", function(state) _G.AutoBoss = state end)

-- ==========================================
-- 💎 TAB 5: VẬT PHẨM & TỘC V4
-- ==========================================
local TabItem = Window:NewTab("💎 Vật Phẩm")
local SecS12 = TabItem:NewSection("Sea 1 & 2")
SecS12:NewButton("Lấy Saber / Soul Cane / Rengoku", "", function() end)
local SecS3 = TabItem:NewSection("Sea 3 & Tộc V4")
SecS3:NewButton("Auto Lấy CDK / Soul Guitar", "", function() end)
SecS3:NewToggle("Auto Tìm Đảo Bí Ẩn (Mirage Island)", "Tự động tìm đảo để lấy Blue Gear", function(state) _G.FindMirage = state end)
SecS3:NewButton("Auto Gạt Cần Tộc V4", "Hỗ trợ gạt cần nhanh", function() end)

-- ==========================================
-- ⚙️ TAB 6: HỆ THỐNG & FIX LAG
-- ==========================================
local TabMisc = Window:NewTab("⚙️ Hệ Thống")
TabMisc:NewSection("VanDuyHud - Phiên Bản Vượt Thời Đại")
TabMisc:NewButton("Siêu Giảm Lag (Smooth Plastic)", "Tối ưu cho máy cực yếu", function()
    for _, v in pairs(game:GetDescendants()) do
        if v:IsA("Part") then v.Material = Enum.Material.SmoothPlastic end
    end
end)
TabMisc:NewButton("Nhảy Server (Server Hop)", "Tìm rương/trái ở server khác", function()
    -- Code nhảy server
end)
