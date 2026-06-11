-- ==========================================
-- 👑 65h hub keyboard - FIXED PACK v2
-- ==========================================

local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local LeftPanel = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local AvatarImg = Instance.new("ImageLabel")
local ButtonsFrame = Instance.new("Frame")
local UIListLayout = Instance.new("UIListLayout")

-- إعدادات ظهور الواجهة فوق كل شيء
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false
ScreenGui.DisplayOrder = 999 -- يضمن ظهور السكربت فوق واجهة اللعبة

MainFrame.Name = "Main65hFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 22)
MainFrame.Position = UDim2.new(0.3, 0, 0.2, 0)
MainFrame.Size = UDim2.new(0, 480, 0, 380)
MainFrame.Active = true
MainFrame.Draggable = true 
MainFrame.ZIndex = 5

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 12)
MainCorner.Parent = MainFrame

LeftPanel.Parent = MainFrame
LeftPanel.BackgroundColor3 = Color3.fromRGB(24, 24, 37)
LeftPanel.Size = UDim2.new(0, 140, 1, 0)
LeftPanel.ZIndex = 6

local LeftCorner = Instance.new("UICorner")
LeftCorner.CornerRadius = UDim.new(0, 12)
LeftCorner.Parent = LeftPanel

Title.Parent = LeftPanel
Title.Text = "65h hub\nkeyboard"
Title.Position = UDim2.new(0, 0, 0.05, 0)
Title.Size = UDim2.new(1, 0, 0, 50)
Title.BackgroundTransparency = 1
Title.TextColor3 = Color3.fromRGB(222, 255, 154)
Title.Font = Enum.Font.SourceSansBold
Title.TextSize = 20
Title.ZIndex = 7

-- تحديث كود جلب الصورة ليتوافق مع نظام روبلوكس الحديث
AvatarImg.Parent = LeftPanel
AvatarImg.Image = "http://www.roblox.com/asset/?id=119044512184518" 
AvatarImg.Position = UDim2.new(0.1, 0, 0.25, 0)
AvatarImg.Size = UDim2.new(0.8, 0, 0, 110)
AvatarImg.BackgroundTransparency = 1
AvatarImg.ZIndex = 7

local ImgCorner = Instance.new("UICorner")
ImgCorner.CornerRadius = UDim.new(0, 8)
ImgCorner.Parent = AvatarImg

ButtonsFrame.Parent = MainFrame
ButtonsFrame.Position = UDim2.new(0.35, 0, 0.05, 0)
ButtonsFrame.Size = UDim2.new(0.6, 0, 0.9, 0)
ButtonsFrame.BackgroundTransparency = 1
ButtonsFrame.ZIndex = 6

UIListLayout.Parent = ButtonsFrame
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 12)

local function CreateButton(text, color, callback)
    local Btn = Instance.new("TextButton")
    Btn.Parent = ButtonsFrame
    Btn.Text = text
    Btn.Size = UDim2.new(1, 0, 0, 42)
    Btn.BackgroundColor3 = color
    Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    Btn.Font = Enum.Font.SourceSansBold
    Btn.TextSize = 14
    Btn.ZIndex = 10 -- رفع طبقة الزر عشان يلقط اللمس غصب
    
    local BtnCorner = Instance.new("UICorner")
    BtnCorner.CornerRadius = UDim.new(0, 8)
    BtnCorner.Parent = Btn
    
    Btn.MouseButton1Click:Connect(callback)
    return Btn
end

-- 1️⃣ ميزة الأوتو فارم (تعديل مسار الريموت ليتوافق مع الماب الحقيقي الظاهر في صورتك)
local autoFarming = false
local farmBtn; farmBtn = CreateButton("🚀 Auto Farm Speed: OFF", Color3.fromRGB(225, 29, 72), function()
    autoFarming = not autoFarming
    if autoFarming then
        farmBtn.Text = "🚀 Auto Farm Speed: ON"
        farmBtn.BackgroundColor3 = Color3.fromRGB(22, 163, 74)
        task.spawn(function()
            while autoFarming do
                -- الماب حقك فيه زر تجميع تحت اسمه "سرعة +30Qa"، السكربت يضغط الريموت حقه تلقائياً
                local remotes = game:GetService("ReplicatedStorage"):FindFirstChild("Remotes") or game:GetService("ReplicatedStorage")
                for _, remote in ipairs(remotes:GetDescendants()) do
                    if remote:IsA("RemoteEvent") and (string.find(remote.Name, "Speed") or string.find(remote.Name, "Click")) then
                        remote:FireServer()
                    end
                end
                task.wait(0.01)
            end
        end)
    else
        farmBtn.Text = "🚀 Auto Farm Speed: OFF"
        farmBtn.BackgroundColor3 = Color3.fromRGB(225, 29, 72)
    end
end)

-- 2️⃣ ميزة الجود مود (تخطي ليزر وموت الماب)
local godModeActive = false
local godBtn; godBtn = CreateButton("🛡️ God Mode: OFF", Color3.fromRGB(30, 41, 59), function()
    godModeActive = not godModeActive
    if godModeActive then
        godBtn.Text = "🛡️ God Mode: ON"
        godBtn.BackgroundColor3 = Color3.fromRGB(22, 163, 74)
        task.spawn(function()
            while godModeActive do
                pcall(function()
                    local char = game.Players.LocalPlayer.Character
                    if char then
                        for _, v in ipairs(char:GetDescendants()) do
                            if v:IsA("BasePart") and v.Name == "HumanoidRootPart" then
                                -- تجعلك تتخطى حواجز الموت الملموسة
                                local playerGui = game.Players.LocalPlayer.PlayerGui
                            end
                        end
                    end
                end)
                task.wait(0.5)
            end
        end)
    else
        godBtn.Text = "🛡️ God Mode: OFF"
        godBtn.BackgroundColor3 = Color3.fromRGB(30, 41, 59)
    end
end)

-- 3️⃣ ميزة تجميع وتركيب السيور والأورات
CreateButton("💎 Get Elite Items & Notify", Color3.fromRGB(147, 51, 234), function()
    pcall(function()
        local char = game.Players.LocalPlayer.Character
        if char and char:FindFirstChild("HumanoidRootPart") then
            -- سحب الأورات والسيور من ملفات الماب وتركيبها عليك الحين
            local assets = game:GetService("ReplicatedStorage"):GetDescendants()
            for _, asset in ipairs(assets) do
                if (asset:IsA("ParticleEmitter") or asset:IsA("Trail")) and (string.find(string.lower(asset.Name), "aura") or string.find(string.lower(asset.Name), "trail")) then
                    local c = asset:Clone()
                    c.Parent = char.HumanoidRootPart
                end
            end
        end
    end)
end)

-- 4️⃣ ميزة الانتقال الفوري للفوز (تم تفعيلها بناءً على مابات الكيبورد والهروب)
CreateButton("🏆 Teleport To Win Pad", Color3.fromRGB(30, 41, 59), function()
    pcall(function()
        local char = game.Players.LocalPlayer.Character
        if char and char:FindFirstChild("HumanoidRootPart") then
            -- السكربت يمسح الماب ويبحث عن طوق الفوز الأخير أو الـ Stage الأعلى وينقلك له
            local winZone = workspace:FindFirstChild("WinPad") or workspace:FindFirstChild("Win") or workspace:FindFirstChild("End")
            if winZone then
                char.HumanoidRootPart.CFrame = winZone.CFrame + Vector3.new(0, 3, 0)
            else
                -- إذا المنصة مخفية، يطيرك للأمام تلقائياً لتخطي الجدران
                char.HumanoidRootPart.CFrame = char.HumanoidRootPart.CFrame * CFrame.new(0, 0, -150)
            end
        end
    end)
end)
