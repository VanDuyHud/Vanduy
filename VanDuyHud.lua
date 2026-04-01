-- [[ VAN DUY HUD - PHIÊN BẢN KINH DOANH PREMIUM 2026 ]] --
-- [[ BẢN QUYỀN THUỘC VỀ: VAN DUY ]] --

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("⭐ VAN DUY HUD - PREMIUM ⭐", "BloodTheme")

-- --- TAB CHÍNH (FARM) ---
local Tab1 = Window:NewTab("🔥 Cày Cấp")
local Section1 = Tab1:NewSection("Hệ Thống Tự Động")

Section1:NewToggle("Auto Farm Level", "Tự động nhận nhiệm vụ + Đánh quái", function(state)
    _G.AutoFarm = state
end)

Section1:NewToggle("Gom Quái (Bring Mob)", "Hút quái siêu tốc không mất máu", function(state)
    _G.BringMob = state
end)

Section1:NewToggle("Đánh Nhanh (Fast Attack)", "Sát thương cực lớn, không delay", function(state)
    _G.FastAttack = state
end)

-- --- TAB VŨ KHÍ ---
local Tab2 = Window:NewTab("⚔️ Vũ Khí")
local Section2 = Tab2:NewSection("Chọn Công Cụ Chiến Đấu")

Section2:NewDropdown("Chọn Vũ Khí", "Chọn vũ khí để farm", {"Cận Chiến", "Kiếm", "Trái Ác Quỷ"}, function(weapon)
    _G.SelectWeapon = weapon
end)

-- --- TAB TỐI ƯU (DÀNH CHO KINH DOANH) ---
local Tab3 = Window:NewTab("⚡ Tối Ưu")
local Section3 = Tab3:NewSection("Chế Độ Premium")

Section3:NewButton("Bật Chế Độ Giảm Lag", "Xóa mọi chi tiết thừa, tăng FPS", function()
    local terrain = game.Workspace.Terrain
    terrain.WaterWaveSize = 0
    terrain.WaterWaveSpeed = 0
    game.Lighting.GlobalShadows = false
    settings().Rendering.QualityLevel = 1
    print("VanDuyHud: Đã tối ưu hóa đồ họa!")
end)

Section3:NewButton("Treo Máy Xuyên Đêm", "Tắt hình ảnh để máy mát, tiết kiệm pin", function()
    game:GetService("RunService"):Set3dRenderingEnabled(false)
end)

-- --- TAB THÔNG TIN ---
local Tab4 = Window:NewTab("💎 Thông Tin")
local Section4 = Tab4:NewSection("Chủ Sở Hữu: VAN DUY")
Section4:NewLabel("Phiên Bản: 2.0 (Premium)")
Section4:NewLabel("Trạng Thái: Không Cần Key")

-- --- THÔNG BÁO KHI VÀO GAME ---
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "VanDuyHud Premium",
    Text = "Chào mừng Chủ Nhân VanDuy quay trở lại!",
    Duration = 10
})
