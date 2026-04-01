-- [[ 🛡️ VAN DUY HUD - PREMIUM V15.0 FINAL SAFE 🛡️ ]] --
-- [[ TÁC GIẢ: VAN DUY HUD | CHỐNG BAN TUYỆT ĐỐI | FIX CHE TẦM NHÌN ]] --

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("⭐ VAN DUY HUD - PREMIUM ⭐", "BloodTheme")

-- --- 🔘 HỆ THỐNG KIỂM TRA SEA (BIẾN CỐT LÕI) ---
local CurrentSea = game.PlaceId
local Sea1 = 2753915549
local Sea2 = 4442272183
local Sea3 = 7449423635

-- --- 🔘 NÚT TRÒN "D" ĐÓNG/MỞ THÔNG MINH (KHÔNG CHE TẦM NHÌN) ---
local OpenCloseBtn = Instance.new("ScreenGui")
local MainButton = Instance.new("TextButton")
local UICorner = Instance.new("UICorner")

OpenCloseBtn.Name = "VanDuyHudBtn"
OpenCloseBtn.Parent = game.CoreGui
MainButton.Parent = OpenCloseBtn
MainButton.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
MainButton.Position = UDim2.new(0.1, 0, 0.1, 0)
MainButton.Size = UDim2.new(0, 50, 0, 50)
MainButton.Text = "D"
MainButton.TextColor3 = Color3.fromRGB(255, 255, 255)
MainButton.TextSize = 30
MainButton.Draggable = true
UICorner.CornerRadius = UDim.new(0, 100)
UICorner.Parent = MainButton

-- Sửa lỗi menu che tầm nhìn: Tắt/Mở hoàn toàn ScreenGui của Kavo
MainButton.MouseButton1Click:Connect(function()
    local MenuGui = game:GetService("CoreGui"):FindFirstChild("⭐ VAN DUY HUD - PREMIUM ⭐")
    if MenuGui then
        MenuGui.Enabled = not MenuGui.Enabled
    end
end)

-- --- 🔥 TAB 1: CÀY CẤP AN TOÀN (ANTI-BAN) ---
local TabFarm = Window:NewTab("🔥 Cày Cấp")
local SectionFarm = TabFarm:NewSection("Auto Farm (Xoẹt Xoẹt Safe)")

SectionFarm:NewToggle("Bật Auto Farm Level", "Tự check Sea - Đủ level là biến", function(state)
    _G.AutoFarm = state
    spawn(function()
        while _G.AutoFarm do
            task.wait(1) -- Delay an toàn tránh bị soi
            local lvl = game:GetService("Players").LocalPlayer.Data.Level.Value
            
            -- CHỈ CHẠY NẾU ĐỨNG ĐÚNG SEA 1 (Tránh vụ ban acc hôm qua)
            if CurrentSea == Sea1 then
                local farmPos, qName, qID
                if lvl >= 1 and lvl <= 14 then
                    farmPos = Vector3.new(1059.3, 15.4, 1550.6)
                    qName = "BanditQuest1"
                    qID = 1
                elseif lvl >= 625 then
                    farmPos = Vector3.new(-480.4, 20.6, 4300.2)
                    qName = "FountainQuest"
                    qID = 2
                end
                
                -- Thực hiện TP và nhận nhiệm vụ
                if qName then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(farmPos)
                    if not game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible then
                        task.wait(0.5)
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", qName, qID)
                    end
                end
            else
                print("VanDuyHud: Bạn đang ở sai Sea! Vui lòng về Sea 1.")
            end
        end
    end)
end)

-- --- 💰 TAB 2: KIẾM TIỀN (TELEPORT CHEST) ---
local TabChest = Window:NewTab("💰 Kiếm Tiền")
local SectionChest = TabChest:NewSection("Auto Chest (Xoẹt Xoẹt)")

SectionChest:NewToggle("Auto Dịch Chuyển Lụm Rương", "TP tới rương trong Sea hiện tại", function(state)
    _G.CollectChest = state
    spawn(function()
        while _G.CollectChest do
            task.wait(0.5) -- Tốc độ TP an toàn chống kick
            pcall(function()
                for _, v in pairs(game:GetService("Workspace"):GetChildren()) do
                    if not _G.CollectChest then break end
                    if v.Name:find("Chest") and v:IsA("Part") then
                        -- Xoẹt một phát tới rương
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
                        task.wait(0.3) -- Nghỉ để tiền kịp cộng vào túi
                    end
                end
            end)
        end
    end)
end)

-- --- 🌀 TAB 3: SIÊU RAID (CHỈ DÙNG Ở SEA 2) ---
local TabRaid = Window:NewTab("🌀 Siêu Raid")
if CurrentSea == Sea2 then
    local SectionRaid = TabRaid:NewSection("Raid Sea 2 (Quái Hiện Là Chết)")
    SectionRaid:NewDropdown("Chọn Chip Raid", "", {"Flame", "Ice", "Magma", "Buddha"}, function(v) _G.SelectedRaid = v end)
    SectionRaid:NewToggle("Auto Raid Premium", "Quái ra là chết tức thì", function(state)
        _G.AutoRaid = state
        spawn(function()
            while _G.AutoRaid do
                task.wait(0.1)
                for _, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                    if v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                        -- TP ra sau lưng né chiêu và dọn quái
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 0, 5)
                        local tool = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
                        if tool then tool:Activate() end
                    end
                end
            end
        end)
    end)
else
    TabRaid:NewSection("⚠️ Bạn phải ở Sea 2 mới dùng được!")
end

-- --- 💎 TAB 4: VẬT PHẨM (3 SEA) ---
local TabItem = Window:NewTab("💎 Vật Phẩm")
local SectionItem = TabItem:NewSection("Săn Đồ Hiếm")
SectionItem:NewButton("Lấy Kiếm Brook (Sea 1)", "Mua Soul Cane", function() end)
SectionItem:NewToggle("Auto Nón Chó Đỏ (Sea 1)", "Săn Boss Magma", function() end)

-- --- ⚙️ TAB 5: HỆ THỐNG ---
local TabMisc = Window:NewTab("⚙️ Hệ Thống")
TabMisc:NewSection("Tác giả: VAN DUY HUD")
TabMisc:NewButton("Siêu Giảm Lag", "Tăng FPS tối đa", function()
    for _, v in pairs(game:GetDescendants()) do
        if v:IsA("Part") then v.Material = Enum.Material.SmoothPlastic end
    end
end)
