--[[
    SCRIPT: DuyHud Hub Framework (Blue Edition 🔵)
    AUTHOR: DuyHud
    VERSION: 1.1
    NOTE: Copy link RAW của file này dán vào Executor để chạy trong game.
--]]

local player = game.Players.LocalPlayer
local pGui = player:WaitForChild("PlayerGui")

-- KIỂM TRA NẾU ĐÃ CÓ MENU THÌ XÓA CÁI CŨ ĐỂ KHÔNG BỊ TRÙNG
if pGui:FindFirstChild("DuyHud_GUI") then
    pGui:FindFirstChild("DuyHud_GUI"):Destroy()
end

-- 1. TẠO LỚP NỀN (SCREEN GUI)
local sg = Instance.new("ScreenGui")
sg.Name = "DuyHud_GUI"
sg.Parent = pGui
sg.ResetOnSpawn = false -- Chết đi menu không bị mất

-- 2. TẠO KHUNG MENU CHÍNH
local main = Instance.new("Frame")
main.Name = "MainFrame"
main.Size = UDim2.new(0, 260, 0, 180) -- Rộng 260, Cao 180
main.Position = UDim2.new(0.5, -130, 0.4, -90) -- Căn giữa
main.BackgroundColor3 = Color3.fromRGB(15, 15, 15) -- Nền tối để màu xanh nổi bật
main.BorderSizePixel = 0
main.Visible = false -- Mặc định ẩn
main.Parent = sg

-- Bo góc cho menu (Dành cho bản Roblox mới)
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 10)
corner.Parent = main

-- 3. TIÊU ĐỀ
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 35)
title.BackgroundColor3 = Color3.fromRGB(0, 85, 255) -- MÀU XANH DƯƠNG NỔI BẬT
title.Text = "DUYHUD HUB ☠️"
title.TextColor3 = Color3.fromRGB(255, 255, 255) -- Chữ màu trắng cho dễ nhìn
title.TextScaled = true
title.Parent
