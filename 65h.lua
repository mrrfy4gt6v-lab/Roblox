-- ==========================================
-- 👑 65h hub keyboard - FINAL CHAD EDITION
-- ==========================================

local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local LeftPanel = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local AvatarImg = Instance.new("ImageLabel")
local ButtonsFrame = Instance.new("Frame")
local UIListLayout = Instance.new("UIListLayout")

-- إعدادات الواجهة والظهور
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false

MainFrame.Name = "Main65hFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 22) -- أسود ملكي داكن
MainFrame.Position = UDim2.new(0.3, 0, 0.2, 0)
MainFrame.Size = UDim2.new(0, 480, 0, 380)
MainFrame.Active = true
MainFrame.Draggable = true -- تحريك سهل بأصبعك على الأيباد

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 12)
MainCorner.Parent = MainFrame

-- اللوحة الجانبية
LeftPanel.Parent = MainFrame
LeftPanel.BackgroundColor3 = Color3.fromRGB(24, 24, 37)
LeftPanel.Size = UDim2.new(0, 140, 1, 0)

local LeftCorner = Instance.new("UICorner")
LeftCorner.CornerRadius = UDim.new(0, 12)
LeftCorner.Parent = LeftPanel

-- اسم السكربت الفخم باللون الفوسفوري
Title.Parent = LeftPanel
Title.Text = "65h hub\nkeyboard"
Title.Position = UDim2.new(0, 0, 0.05, 0)
Title.Size = UDim2.new(1, 0, 0, 50)
Title.BackgroundTransparency = 1
Title.TextColor3 = Color3.fromRGB(222, 255, 154)
Title.Font = Enum.Font.SourceSansBold
Title.TextSize = 20

-- صورة البسة المروقة المعتمدة برقم الأيدي الخاص بك 🐱🎵
AvatarImg.Parent = LeftPanel
AvatarImg.Image = "rbxassetid://119044512184518" 
AvatarImg.Position = UDim2.new(0.1, 0, 0.22, 0)
AvatarImg.Size = UDim2.new(0.8, 0, 0, 110)
AvatarImg.BackgroundTransparency = 1

local ImgCorner = Instance.new("UICorner")
ImgCorner.CornerRadius = UDim.new(0, 8)
ImgCorner.Parent = AvatarImg

-- لوحة الأزرار والميزات
ButtonsFrame.Parent = MainFrame
ButtonsFrame.Position = UDim2.new(0.32, 0, 0.05, 0)
ButtonsFrame.Size = UDim2.new(0.65, 0, 0.9, 0)
ButtonsFrame.BackgroundTransparency = 1

UIListLayout.Parent = ButtonsFrame
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 8)

local function CreateButton(text, color, callback)
    local Btn = Instance.new("TextButton")
    Btn.Parent = ButtonsFrame
    Btn.Text = text
    Btn.Size = UDim2.new(1, 0, 0, 38)
    Btn.BackgroundColor3 = color
    Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    Btn.Font = Enum.Font.SourceSansBold
    Btn.TextSize = 14
    
    local BtnCorner = Instance.new("UICorner")
    BtnCorner.CornerRadius = UDim.new(0, 8)
    BtnCorner.Parent = Btn
    
    Btn.MouseButton1Click:Connect(callback)
    return Btn
end

-- 1️⃣ ميزة الأوتو فارم (تجميع السرعة والنقاط التلقائي)
local autoFarming = false
CreateButton("🚀 Auto Farm Speed: OFF", Color3.fromRGB(225, 29, 72), function()
    autoFarming = not autoFarming
    local btn = ButtonsFrame:FindFirstChild("🚀 Auto Farm Speed: OFF") or ButtonsFrame:FindFirstChild("🚀 Auto Farm Speed: ON")
    if autoFarming then
        btn.Text = "🚀 Auto Farm Speed: ON"
        btn.BackgroundColor3 = Color3.fromRGB(22, 163, 74)
        task.spawn(function()
            while autoFarming do
                local r = game:GetService("ReplicatedStorage"):FindFirstChild("Remotes") or game:GetService("ReplicatedStorage")
                if r:FindFirstChild("GenerateSpeed") then r.GenerateSpeed:FireServer()
                elseif r:FindFirstChild("AddSpeed") then r.AddSpeed:FireServer() end
                task.wait(0.01)
            end
        end)
    else
        btn.Text = "🚀 Auto Farm Speed: OFF"
        btn.BackgroundColor3 = Color3.fromRGB(225, 29, 72)
    end
end)

-- 2️⃣ ميزة الجود مود (الخلود وعدم الموت من الجدران)
local godModeActive = false
CreateButton("🛡️ God Mode: OFF", Color3.fromRGB(30, 41, 59), function()
    godModeActive = not godModeActive
    local btn = ButtonsFrame:FindFirstChild("🛡️ God Mode: OFF") or ButtonsFrame:FindFirstChild("🛡️ God Mode: ON")
    if godModeActive then
        btn.Text = "🛡️ God Mode: ON"
        btn.BackgroundColor3 = Color3.fromRGB(22, 163, 74)
        task.spawn(function()
            while godModeActive do
                if game.Players.LocalPlayer.Character then
                    for _, v in ipairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                        if v:IsA("Script") and (string.find(string.lower(v.Name), "kill") or string.find(string.lower(v.Name), "death")) then
                            v:Destroy()
                        end
                    end
                end
                task.wait(0.5)
            end
        end)
    else
        btn.Text = "🛡️ God Mode: OFF"
        btn.BackgroundColor3 = Color3.fromRGB(30, 41, 59)
    end
end)

-- 3️⃣ ثغرة الأدوات الفخمة ومحاكاة تنبيه الشاشة للروبوكس
CreateButton("💎 Get Elite Items & Notify", Color3.fromRGB(147, 51, 234), function()
    local player = game.Players.LocalPlayer
    local char = player.Character
    
    if char and char:FindFirstChild("HumanoidRootPart") then
        local storage = game:GetService("ReplicatedStorage")
        local targetEffect = storage:FindFirstChild("Trails") or storage:FindFirstChild("Effects") or storage:FindFirstChild("Shop")
        
        if targetEffect then
            for _, effect in ipairs(targetEffect:GetChildren()) do
                if effect:IsA("ParticleEmitter") or effect:IsA("Trail") then
                    local clone = effect:Clone()
                    clone.Parent = char.HumanoidRootPart
                end
            end
        end
        
        local remotes = game:GetService("ReplicatedStorage"):FindFirstChild("Remotes") or game:GetService("ReplicatedStorage")
        if remotes:FindFirstChild("SystemMessage") or remotes:FindFirstChild("Notify") then
            local msgRemote = remotes:FindFirstChild("SystemMessage") or remotes:FindFirstChild("Notify")
            msgRemote:FireServer("[SHOP] " .. player.Name .. " has unlocked the Radiant Trail! ✨")
        end
    end
end)

-- 4️⃣ ميزة الانتقال السريع لمنصة الفوز وتخطي الماب
CreateButton("🏆 Teleport To Win Pad", Color3.fromRGB(30, 41, 59), function()
    local p = game.Players.LocalPlayer
    if p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
        local w = workspace:FindFirstChild("WinPad") or workspace:FindFirstChild("Win")
        if w then p.Character.HumanoidRootPart.CFrame = w.CFrame + Vector3.new(0,3,0) end
    end
end)
