local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Fack hub",
   Icon = 0,
   LoadingTitle = "The Mimic fangame",
   LoadingSubtitle = "by KENG",
   ConfigurationSaving = { Enabled = true, FolderName = nil, FileName = "Big Hub" },
   KeySystem = false
})

Rayfield:Notify({
   Title = "Fack hub",
   Content = "Update 1.0\n-Auto win C2 \n-Esp Monster and Item",
   Duration = 6.5,
   Image = "bell",
})

local RunService = game:GetService("RunService")
local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- ฟังก์ชัน addESP
-- ฟังก์ชัน addESP เวอร์ชั่นปรับปรุง (เช็คการซ้ำซ้อนและแก้เรื่อง Label ไม่ขึ้น)
local function addESP(target, fillCol, outlineCol, labelCol)
    if not target then return end

    -- 1. ค้นหา Part ที่เหมาะสมที่สุดสำหรับยึด BillboardGui
    local adornPart = target:IsA("BasePart") and target or target.PrimaryPart or target:FindFirstChildWhichIsA("BasePart")
    if not adornPart then return end

    -- 2. เช็คว่ามี Highlight อยู่แล้วหรือไม่ ถ้าไม่มีให้สร้างใหม่
    local highlight = target:FindFirstChild("Fack hub Highlight")
    if not highlight then
        highlight = Instance.new("Highlight")
        highlight.Name = "Fack hub Highlight"
        highlight.Parent = target
    end
    
    -- อัปเดตคุณสมบัติ Highlight (เพื่อให้เปลี่ยนสีได้ตาม Callback)
    highlight.FillColor = fillCol
    highlight.OutlineColor = outlineCol
    highlight.OutlineTransparency = 0
    highlight.FillTransparency = 0.5
    highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop

    -- 3. เช็คว่ามี BillboardGui อยู่แล้วหรือไม่ ถ้าไม่มีให้สร้างใหม่
    local billboard = target:FindFirstChild("Fack hub Label")
    if not billboard then
        billboard = Instance.new("BillboardGui")
        billboard.Name = "Fack hub Label"
        billboard.Parent = target
        billboard.Size = UDim2.new(0, 100, 0, 50)
        billboard.AlwaysOnTop = true
        billboard.ExtentsOffset = Vector3.new(0, 3, 0)
        billboard.Adornee = adornPart

        local label = Instance.new("TextLabel")
        label.Name = "TextLabel"
        label.Parent = billboard
        label.Size = UDim2.new(1, 0, 1, 0)
        label.BackgroundTransparency = 1
        label.TextColor3 = labelCol
        label.TextScaled = true
        label.Font = Enum.Font.SourceSansBold

        -- 4. การจัดการระยะทาง (รันเฉพาะตอนสร้าง Label ใหม่)
        local connection
        connection = RunService.RenderStepped:Connect(function()
            if not target or not target.Parent or not billboard or not billboard.Parent then
                connection:Disconnect()
                return
            end

            local myChar = player.Character
            local myRoot = myChar and myChar:FindFirstChild("HumanoidRootPart")

            if myRoot and adornPart then
                local distance = (myRoot.Position - adornPart.Position).Magnitude
                label.Text = string.format("%s\n[%.1f m]", target.Name, distance)
            else
                label.Text = target.Name
            end
        end)
    else
        -- ถ้ามี Label อยู่แล้ว แต่อยากเปลี่ยนสีตัวหนังสือตาม Callback ใหม่
        local existingLabel = billboard:FindFirstChild("TextLabel")
        if existingLabel then
            existingLabel.TextColor3 = labelCol
        end
    end
end



local function teleportTo(cf)
    local char = player.Character
    if char and char:FindFirstChild("HumanoidRootPart") then
        char.HumanoidRootPart.CFrame = cf
    end
end

local function teleportTomodel(po)
    local character = player.Character or player.CharacterAdded:Wait()
        character:PivotTo(po)
end

local lTab = Window:CreateTab("Lobby", "rewind")

if game.PlaceId == 100718194480456 then

local Section = lTab:CreateSection("Chapters")
   
lTab:CreateButton({
       Name = "Tp to Chapters",
       Callback = function()
          for i,v in pairs(workspace.Map.Chapters:GetChildren()) do
          if v.Name == "a CHAPTERS TELEPORT" then
             local prox = v:FindFirstChildOfClass("ProximityPrompt")
             teleportTo(v.CFrame)
             if prox then
                wait(0.5)
                fireproximityprompt(prox)
             end
          end
       end
       end,
    })

local Section = lTab:CreateSection("Gamemode")
   
lTab:CreateButton({
       Name = "Tp to Gamemode",
       Callback = function()
          local StarterGui = game:GetService("StarterGui")
          StarterGui:SetCore("SendNotification", {
          Title = "Wait update"; -- หัวข้อ
          Text = "waitttt meee make script"; -- ข้อความ
         Icon = "rbxassetid://11293977610"; -- ใส่ ID รูปภาพ (ถ้ามี)
         Duration = 5; -- แสดงค้างไว้กี่วินาที
             
          --[[for i,v in pairs(workspace.Map.Gamemodes:GetChildren()) do
          if v.Name == "a GAMEMODES TELEPORT" then
             local prox = v:FindFirstChildOfClass("ProximityPrompt")
             teleportTo(v.CFrame)
             if prox then
                wait(0.5)
                fireproximityprompt(prox)
             end
          end
       end]]--
       end,
    })
end

if game.PlaceId == 81060983902607 then
   
   local Section = lTab:CreateSection("Chapters All")
   
   lTab:CreateButton({
       Name = "Exit Chapters",
       Callback = function()
          local character = player.Character

          if character and character:FindFirstChild("Humanoid") then
             character.Humanoid.Health = 0
          end
       end,
    })
   
   local Section = lTab:CreateSection("Chapters1")
   
   lTab:CreateButton({
       Name = "join Chapters1 Normal",
       Callback = function()
          teleportTo(workspace.Map["CHAPTER 1"].Normal.Normal.Gate.CFrame)
       end,
    })
   
   lTab:CreateButton({
       Name = "join Chapters1 Nightmare",
       Callback = function()
          teleportTo(workspace.Map["CHAPTER 1"].Nightmare.Nightmare.Gate.CFrame)
       end,
    })
   
   local Section = lTab:CreateSection("Chapters2")
   
   lTab:CreateButton({
       Name = "join Chapters2 Normal",
       Callback = function()
          teleportTo(workspace.Map["CHAPTER 2"].Normal.Normal.Gate.CFrame)
       end,
    })
   
   lTab:CreateButton({
       Name = "join Chapters2 Nightmare",
       Callback = function()
          teleportTo(workspace.Map["CHAPTER 2"].Nightmare.Nightmare.Gate.CFrame)
       end,
    })
   
   local Section = lTab:CreateSection("Chapters3")
   
   lTab:CreateButton({
       Name = "join Chapters3 Normal",
       Callback = function()
          teleportTo(workspace.Map["CHAPTER 3"].Normal.Normal.Gate.CFrame)
       end,
    })
   
   lTab:CreateButton({
       Name = "join Chapters3 Nightmare",
       Callback = function()
          teleportTo(workspace.Map["CHAPTER 3"].Nightmare.Nightmare.Gate.CFrame)
       end,
    })
   
end

local b1Tab = Window:CreateTab("B1C1", "rewind")

-- Part 1
if game.PlaceId == 87791728997427 then
    local Section = b1Tab:CreateSection("Part 1")
    b1Tab:CreateButton({
       Name = "Auto Win",
       Callback = function()
         teleportTo(workspace.TELEPORTER.CFrame)
       end,
    })
end

-- Part 2
if game.PlaceId == 90294585121339 then
    local Section = b1Tab:CreateSection("Part 2")
    b1Tab:CreateButton({
       Name = "Auto Win",
       Callback = function()
         teleportTo(workspace.TELEPORTER.CFrame)
       end,
    })

    b1Tab:CreateSection("ESP")
    b1Tab:CreateButton({
       Name = "ESP item",
       Callback = function()
          if workspace:FindFirstChild("Kit") then
              for _, obj in pairs(workspace.Kit:GetChildren()) do
                 if obj.Name == "Butterfly" then
                    addESP(obj, Color3.fromRGB(0, 255, 0), Color3.fromRGB(255, 255, 255), Color3.fromRGB(0, 255, 0))
                 end
              end
          end
       end,
    })

    b1Tab:CreateButton({
       Name = "ESP Wukachi",
       Callback = function()
          for _, obj in pairs(workspace:GetChildren()) do
             if obj.Name == "Wukachi" then
                addESP(obj, Color3.fromRGB(255, 0, 0), Color3.fromRGB(255, 255, 255), Color3.fromRGB(255, 255, 255))
             end
          end
       end,
    })
end

-- Part 3
if game.PlaceId == 90716306329028 then
    local Section = b1Tab:CreateSection("Part 3")
    b1Tab:CreateButton({
       Name = "Auto Win",
       Callback = function()
         teleportTo(workspace.Teleport.Teleporter.CFrame)
       end,
    })

    b1Tab:CreateSection("ESP")
    b1Tab:CreateButton({
       Name = "ESP item",
       Callback = function()
          if workspace:FindFirstChild("Map") and workspace.Map:FindFirstChild("Kit") then
              for _, obj in pairs(workspace.Map.Kit:GetChildren()) do
                 if obj.Name == "Butterfly" then
                    addESP(obj, Color3.fromRGB(0, 255, 0), Color3.fromRGB(255, 255, 255), Color3.fromRGB(0, 255, 0))
                 end
              end
          end
       end,
    })
       
    b1Tab:CreateButton({
       Name = "ESP Headless girl",
       Callback = function()
          for _, obj in pairs(workspace:GetChildren()) do
             if obj.Name == "Headless girl" then
                addESP(obj, Color3.fromRGB(255, 0, 0), Color3.fromRGB(255, 255, 255), Color3.fromRGB(0, 255, 0))
             end
          end
       end,
    })
end

local b2Tab = Window:CreateTab("B1C2", "rewind")

local Section = b2Tab:CreateSection("Part 1")
    
b2Tab:CreateButton({
       Name = "Auto Win",
       Callback = function()
          teleportTo(CFrame.new(267.994232, 2.99999928, 749.983154, 0.950570881, 3.66342761e-08, 0.310507625, -1.0137077e-08, 1, -8.69487948e-08, -0.310507625, 7.95033515e-08, 0.950570881))
          if not game:IsLoaded() then game.Loaded:Wait() end
          if workspace:WaitForChild("TELEPORTER") then
             teleportTo(workspace.TELEPORTER.CFrame)
          end
       end,
})

--[[b2Tab:CreateButton({
       Name = "Remove Door Butterfly",
       Callback = function()
          workspace.Map.Map.Kit.ButterflyDoor:Destroy()
       end,
}) --]]

local Section = b2Tab:CreateSection("Code")

pcall(function()
local model = workspace.Map.Map["Paper With Text"]
   
local targetPos = model:GetPivot().Position
   
player:RequestStreamAroundAsync(targetPos)

   
local code = workspace.Map.Map["Paper With Text"].Sign.SurfaceGui.TextLabel
local Label = b2Tab:CreateLabel(code.Text, "newspaper")
end)

local Section = b2Tab:CreateSection("ESP")

b2Tab:CreateButton({
       Name = "ESP item",
       Callback = function()
          if workspace:FindFirstChild("Map") and workspace.Map.Map:FindFirstChild("Kit") then
              for _, obj in pairs(workspace.Map.Map.Kit:GetChildren()) do
                 if obj:IsA("Model") then
                    addESP(obj, Color3.fromRGB(0, 255, 0), Color3.fromRGB(255, 255, 255), Color3.fromRGB(0, 255, 0))
                 end
              end
          end
          for _, obj in pairs(workspace.Map.Map:GetChildren()) do
             if obj.Name == "Paper With Text" then
                addESP(obj, Color3.fromRGB(0, 255, 0), Color3.fromRGB(255, 255, 255), Color3.fromRGB(0, 255, 0))
             end
          end
       end,
    })

b2Tab:CreateButton({
       Name = "ESP Kanichi",
       Callback = function()
          for _, obj in pairs(workspace:GetChildren()) do
             if obj.Name == "Kanichi" then
                addESP(obj, Color3.fromRGB(255, 0, 0), Color3.fromRGB(255, 255, 255), Color3.fromRGB(255, 255, 255))
             end
          end
       end,
    })

local Section = b2Tab:CreateSection("Part 2")
    
b2Tab:CreateButton({
       Name = "Auto Win",
       Callback = function()
          teleportTo(workspace.TELEPORTER.CFrame)
       end,
})

local Section = b2Tab:CreateSection("ESP")

b2Tab:CreateButton({
       Name = "ESP item",
       Callback = function()
          if workspace:FindFirstChild("Kit") then
              for _, obj in pairs(workspace.Kit:GetChildren()) do
                 if obj:IsA("Model") then
                    addESP(obj, Color3.fromRGB(0, 255, 0), Color3.fromRGB(255, 255, 255), Color3.fromRGB(0, 255, 0))
                 end
              end
          end
       end,
    })

b2Tab:CreateButton({
       Name = "ESP Tanicho",
       Callback = function()
          for _, obj in pairs(workspace:GetChildren()) do
             if obj.Name == "Tanicho" then
                addESP(obj, Color3.fromRGB(255, 0, 0), Color3.fromRGB(255, 255, 255), Color3.fromRGB(255, 255, 255))
             end
          end
       end,
    })

local Section = b2Tab:CreateSection("Part 3")
    
b2Tab:CreateButton({
       Name = "Auto Win",
       Callback = function()
          teleportTo(workspace.Checkpoint.CFrame)
          task.wait(0.5)
          if not game:IsLoaded() then game.Loaded:Wait() end
          if workspace:WaitForChild("RewardPart") then
          teleportTo(workspace.RewardPart.CFrame)
          end
       end,
})

local Section = b2Tab:CreateSection("ESP")

b2Tab:CreateButton({
       Name = "ESP item",
       Callback = function()
          if workspace:FindFirstChild("Kit") then
              for _, obj in pairs(workspace.Kit:GetChildren()) do
                 if obj:IsA("Model") then
                    addESP(obj, Color3.fromRGB(0, 255, 0), Color3.fromRGB(255, 255, 255), Color3.fromRGB(0, 255, 0))
                 end
              end
          end
       end,
    })

b2Tab:CreateButton({
       Name = "ESP Sama",
       Callback = function()
          for _, obj in pairs(workspace:GetChildren()) do
             if obj.Name == "Sama" then
                addESP(obj, Color3.fromRGB(255, 0, 0), Color3.fromRGB(255, 255, 255), Color3.fromRGB(255, 255, 255))
             end
          end
       end,
    })

local b3Tab = Window:CreateTab("B1C3", "rewind")

-- 1. เตรียมตำแหน่งและฟังก์ชันโหลดไว้นอกปุ่ม เพื่อให้ Loop เข้าถึงได้
local b3p1Positions = {
    Vector3.new(-112.20437622070312, 120.71897888183594, -680.92431640625),
    Vector3.new(1707.4842529296875, -79.51859283447266, 478.4386901855469)
}

local function b3LoadStreaming()
    for _, targetPos in ipairs(b3p1Positions) do
        player:RequestStreamAroundAsync(targetPos)
    end
end

-- 2. สร้าง Loop สำหรับ Streaming (จะทำงานเบื้องหลังทันที)
task.spawn(function()
    while true do
        -- โหลดแมพทุกๆ 2 วินาทีเพื่อให้วัตถุไม่หาย
        b3LoadStreaming()
        task.wait(2)
    end
end)

local Section = b3Tab:CreateSection("Part 1")

b3Tab:CreateButton({
    Name = "Auto Win",
    Callback = function()
        local targetModel = workspace.Map["Water part"]:WaitForChild("Rage")
        teleportTomodel(targetModel:GetPivot() * CFrame.new(0,7,0))
        
        task.wait(2)
        if not game:IsLoaded() then game.Loaded:Wait() end
        if workspace:WaitForChild("TELEPORTER") then
            teleportTo(workspace.TELEPORTER.CFrame)
        end
    end,
})

b3Tab:CreateSection("ESP")

b3Tab:CreateButton({
    Name = "ESP item",
    Callback = function()
        -- เรียกโหลดทันทีเมื่อกดปุ่ม
        b3LoadStreaming()
        task.wait(0.5)

        -- ESP ประตู Butterfly
        local lib = workspace.Map:FindFirstChild("Library")
        if lib and lib:FindFirstChild("Butterfly door") then
            for _, obj in pairs(lib["Butterfly door"]:GetChildren()) do
                if obj:IsA("Model") or obj:IsA("BasePart") then
                    addESP(obj, Color3.fromRGB(0, 255, 0), Color3.fromRGB(255, 255, 255), Color3.fromRGB(0, 255, 0))
                end
            end
        end

        -- ESP สำหรับ Key และ KeyDoor (แยกกัน)
        for _, obj in pairs(workspace:GetChildren()) do
            local name = obj.Name:lower() 
            if string.find(name, "key") or string.find(name, "door") then
                if obj:IsA("Model") or obj:IsA("BasePart") then
                    addESP(obj, Color3.fromRGB(255, 255, 0), Color3.fromRGB(255, 255, 255), Color3.fromRGB(255, 255, 0))
                end
            end
        end
       for _, obj in pairs(workspace.Main.ToolsGive:GetChildren()) do
                 if obj:IsA("MeshPart") then
                    addESP(obj, Color3.fromRGB(0, 255, 0), Color3.fromRGB(255, 255, 255), Color3.fromRGB(0, 255, 0))
                 end
              end
    end, -- ปิด Callback
}) -- ปิด CreateButton

b3Tab:CreateButton({
    Name = "ESP monster",
    Callback = function()
        for _, obj in pairs(workspace:GetChildren()) do
            if obj.Name == "Kaita" then
                addESP(obj, Color3.fromRGB(255, 0, 0), Color3.fromRGB(255, 255, 255), Color3.fromRGB(255, 255, 255))
            end
        end
    end,
})

local Section = b3Tab:CreateSection("Part 2")

local b3p2Positions = {
    Vector3.new(-6066.3876953125, 5300.41796875, 10752.248046875),
    Vector3.new(-6309.5791015625, 5300.41796875, 10917.6875),
    Vector3.new(-6530.12158203125, 5300.41796875, 10701.943359375),
    Vector3.new(-6380.25634765625, 5300.41796875, 10644.3203125)
}

local function b3LoadStreaming()
    for _, targetPos in ipairs(b3p2Positions) do
        player:RequestStreamAroundAsync(targetPos)
    end
end

-- 2. สร้าง Loop สำหรับ Streaming (จะทำงานเบื้องหลังทันที)
task.spawn(function()
    while true do
        -- โหลดแมพทุกๆ 2 วินาทีเพื่อให้วัตถุไม่หาย
        b3LoadStreaming()
        task.wait(2)
    end
end)

b3Tab:CreateButton({
    Name = "Auto Win",
    Callback = function()
        local targetModel = workspace.Map.Maze:WaitForChild("Arms")
        teleportTomodel(targetModel:GetPivot() * CFrame.new(0,7,0))
        
        task.wait(2)
        if not game:IsLoaded() then game.Loaded:Wait() end
        if workspace:WaitForChild("TELEPORTER") then
            teleportTo(workspace.TELEPORTER.CFrame)
        end
    end,
})

b3Tab:CreateSection("ESP")

b3Tab:CreateButton({
    Name = "ESP item",
    Callback = function()
       pcall(function()
        -- ESP ประตู Butterfly
        for _, obj in pairs(workspace.Main.ToolsGive:GetChildren()) do
           if obj:IsA("Model") or obj:IsA("BasePart") then
              addESP(obj, Color3.fromRGB(0, 255, 0), Color3.fromRGB(255, 255, 255), Color3.fromRGB(0, 255, 0))
           end
        end

        -- ESP สำหรับ Key และ KeyDoor (แยกกัน)
        for _, obj in pairs(workspace:GetChildren()) do
            local name = obj.Name:lower() 
            if string.find(name, "key") or string.find(name, "door") then
                if obj:IsA("Model") or obj:IsA("BasePart") then
                    addESP(obj, Color3.fromRGB(255, 255, 0), Color3.fromRGB(255, 255, 255), Color3.fromRGB(255, 255, 0))
                end
            end
        end
       end)
       
       for _, obj in pairs(workspace.Main2.ToolsGive:GetChildren()) do
           if obj:IsA("MeshPart") then
              addESP(obj, Color3.fromRGB(0, 255, 0), Color3.fromRGB(255, 255, 255), Color3.fromRGB(0, 255, 0))
           end
        end
    end,
})

b3Tab:CreateButton({
    Name = "ESP monster",
    Callback = function()
        for _, obj in pairs(workspace:GetChildren()) do
            if obj.Name == "Mihana" then
                addESP(obj, Color3.fromRGB(255, 0, 0), Color3.fromRGB(255, 255, 255), Color3.fromRGB(255, 255, 255))
            end
        end
    end,
})

b3Tab:CreateButton({
    Name = "Auto Win",
    Callback = function()
        local targetModel = workspace.Map["Winners house"]:WaitForChild("House")
        teleportTomodel(targetModel:GetPivot() * CFrame.new(0,0,0))
        
        task.wait(2)
        if not game:IsLoaded() then game.Loaded:Wait() end
        if workspace["Teleport 4"]:WaitForChild("Teleporter") then
            teleportTo(workspace["Teleport 4"].Teleporter.CFrame)
        end
    end,
})

b3Tab:CreateButton({
    Name = "ESP monster",
    Callback = function()
        for _, obj in pairs(workspace:GetChildren()) do
            if obj.Name == "Kusonoki" then
                addESP(obj, Color3.fromRGB(255, 0, 0), Color3.fromRGB(255, 255, 255), Color3.fromRGB(255, 255, 255))
            end
        end
    end,
})
--[[local StarterGui = game:GetService("StarterGui")
          StarterGui:SetCore("SendNotification", {
          Title = "Wait update"; -- หัวข้อ
          Text = "waitttt meee make script"; -- ข้อความ
         Icon = "rbxassetid://11293977610"; -- ใส่ ID รูปภาพ (ถ้ามี)
         Duration = 5; -- แสดงค้างไว้กี่วินาที--]]
