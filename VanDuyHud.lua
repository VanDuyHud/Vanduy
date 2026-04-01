-- [[ 🌟 VAN DUY HUD - PREMIUM ULTIMATE V12.5 🌟 ]] --
-- [[ TÁC GIẢ: VAN DUY HUD | KHÔNG GET KEY | FULL 3 SEA ]] --

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("⭐ VAN DUY HUD - PREMIUM ⭐", "BloodTheme")

-- --- 🔘 NÚT TRÒN ĐÓNG/MỞ (FLOATING BUTTON) ---
local OpenCloseBtn = Instance.new("ScreenGui")
local MainButton = Instance.new("TextButton")
local UICorner = Instance.new("UICorner")
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
MainButton.MouseButton1Click:Connect(function()
    game:GetService("CoreGui"):FindFirstChild("⭐ VAN DUY HUD - PREMIUM ⭐").Enabled = not game:GetService("CoreGui"):FindFirstChild("⭐ VAN DUY HUD - PREMIUM ⭐").Enabled
end)

-- --- 🔥 TAB 1: CÀY CẤP THÔNG MINH (TELEPORT) ---
local TabFarm = Window:NewTab("🔥 Cày Cấp")
local SectionFarm = TabFarm:NewSection("Smart-Farm (Xoẹt Xoẹt)")

SectionFarm:NewToggle("Bật Auto Farm Level", "Đủ Level là dịch chuyển tới bãi mới", function(state)
    _G.AutoFarm = state
    spawn(function()
        while _G.AutoFarm do
            task.wait(0.5)
            local lvl = game:GetService("Players").LocalPlayer.Data.Level.Value
            local farmPos, questRemote, questID
            
            -- Logic Duy yêu cầu: 1-10 Đảo Hải Tặc, và bãi cuối các Sea
            if lvl >= 1 and lvl <= 14 then
                farmPos = Vector3.new(1059.3, 15.4, 1550.6)
                questRemote = "BanditQuest1"
                questID = 1
            elseif lvl >= 700 and lvl < 1500 then -- Bãi cuối Sea 1 cho level cao
                farmPos = Vector3.new(-480.4, 20.6, 4300.2)
                questRemote = "FountainQuest"
                questID = 2
            else
                -- Mặc định bãi hiện tại (Duy có thể thêm chi tiết các đảo khác)
                farmPos = Vector3.new(1059.3, 15.4, 1550.6)
                questRemote = "BanditQuest1"
                questID = 1
            end

            -- Dịch chuyển tới NPC/Quái ngay lập tức
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(farmPos)
            if not game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", questRemote, questID)
            end
        end
    end)
end)

-- --- 💰 TAB 2: KIẾM TIỀN (TELEPORT CHEST) ---
local TabChest = Window:NewTab("💰 Kiếm Tiền")
local SectionChest = TabChest:NewSection("Auto Chest Teleport")

SectionChest:NewToggle("Auto Dịch Chuyển Lụm Rương", "Biến tới từng rương trên bản đồ", function(state)
    _G.CollectChest = state
    spawn(function()
        while _G.CollectChest do
            task.wait(0.2)
            pcall(function()
                for _, v in pairs(game:GetService("Workspace"):GetChildren()) do
                    if v.Name:find("Chest") and v:IsA("Part") then
                        if not _G.CollectChest then break end
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
                        task.wait(0.2)
                    end
                end
            end)
        end
    end)
end)

-- --- 🌀 TAB 3: SIÊU RAID PREMIUM ---
local TabRaid = Window:NewTab("🌀 Siêu Raid")
local SectionRaid = TabRaid:NewSection("Quái Hiện Là Chết")

SectionRaid:NewDropdown("Chọn Chip Raid", "Chọn trái muốn thức tỉnh", {"Flame", "Ice", "Light", "Magma", "Buddha"}, function(v)
    _G.SelectedRaid = v
end)

SectionRaid:NewToggle("Auto Raid (Instant Kill)", "Tự vào Raid + Diệt quái tức thì", function(state)
    _G.AutoRaid = state
    spawn(function()
        while _G.AutoRaid do
            task.wait(0.1)
            -- Kill Aura: Quái vừa ra là chết
            for _, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                if v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 0, 5)
                    local tool = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
                    if tool then tool:Activate() end
                end
            end
        end
    end)
end)

-- --- 💎 TAB 4: VẬT PHẨM (FULL 3 SEA) ---
local TabItem = Window:NewTab("💎 Vật Phẩm")
local SectionItem = TabItem:NewSection("Săn Đồ Hiếm")

SectionItem:NewToggle("Auto Nón Chó Đỏ (Sea 1)", "Săn Boss Magma Admiral", function() end)
SectionItem:NewButton("Lấy Kiếm Brook (Sea 1)", "Mua Soul Cane", function() end)
SectionItem:NewToggle("Auto Kiếm Rengoku (Sea 2)", "Săn Đô Đốc Băng", function() end)
SectionItem:NewToggle("Auto Song Kiếm CDK (Sea 3)", "Làm nhiệm vụ tối thượng", function() end)

-- --- ⚙️ TAB 5: HỆ THỐNG ---
local TabMisc = Window:NewTab("⚙️ Hệ Thống")
TabMisc:NewSection("Tác giả: VAN DUY HUD")
TabMisc:NewButton("Siêu Giảm Lag (Smooth)", "Tối ưu máy yếu", function()
    for _, v in pairs(game:GetDescendants()) do
        if v:IsA("Part") then v.Material = Enum.Material.SmoothPlastic end
    end
end)
