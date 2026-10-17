--==================================================
-- ANTONMVTWIN • 28KXPEHH & KYWSAM
-- GUN CUSTOMIZER — 44 ESTILOS + PRELOAD + FORCE APPLY 🖤💙
--==================================================

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local ContentProvider = game:GetService("ContentProvider")

local player = Players.LocalPlayer
local PlayerGui = player:WaitForChild("PlayerGui")

--==================================================
-- CONFIG
--==================================================

local GUN_TOOL_NAME = "Gun" 
local TARGET_NAME = "GunDisplay"

local USE_TEXTURES = true
local GUN_MATERIAL = Enum.Material.Metal 

local WHITE = Color3.fromRGB(255, 255, 255)

-- 🐱 IMAGEM CHOCO CAT
local CHOCO_IMG = "rbxthumb://type=Asset&id=118126832694865&w=150&h=150"

-- 🖤💙 CORES
local BK_BLACK       = Color3.fromRGB(15, 15, 20)
local BK_BLACK_SOFT  = Color3.fromRGB(30, 30, 40)
local BK_BLACK_DARK  = Color3.fromRGB(5, 5, 10)
local BLUE_LIGHT     = Color3.fromRGB(180, 220, 255)
local BLUE_MEDIUM    = Color3.fromRGB(120, 180, 240)

--==================================================
-- DETECÇÃO DE TIROS
--==================================================

local SHOT_NAMES = {
    Bullet = true, Projectile = true, Tracer = true, Shot = true, Laser = true,
    BulletTrail = true, BulletTracer = true, MuzzleFlash = true,
}

--==================================================
-- CORES (44 ESTILOS)
--==================================================

local EFFECT_COLORS = {
    Purple                       = Color3.fromRGB(115, 35, 170),
    RedScope                     = Color3.fromRGB(170, 0, 0),
    BlueScope                    = Color3.fromRGB(20, 45, 110),
    RainbowScope                 = Color3.fromRGB(255, 100, 200),
    Rosescope                    = Color3.fromRGB(255, 105, 180),
    WhiteScope                   = Color3.fromRGB(255, 255, 255),
    GhostScope                   = Color3.fromRGB(255, 255, 255),
    LadyNoir                     = Color3.fromRGB(200, 30, 90),
    RainbowDashScope             = Color3.fromRGB(0, 200, 255),
    PomPomPurinScope             = Color3.fromRGB(255, 200, 120),
    MyMelodyScope                = Color3.fromRGB(255, 150, 200),
    CinnamorollScope             = Color3.fromRGB(160, 220, 255),
    HallowHelloKittyScope        = Color3.fromRGB(255, 120, 200),
    FluttershyScope              = Color3.fromRGB(255, 220, 130),
    PinkPieScope                 = Color3.fromRGB(255, 105, 180),
    ShinobuScope                 = Color3.fromRGB(150, 80, 200),
    KuromiScope                  = Color3.fromRGB(90, 50, 130),
    ChocoCatScope                = Color3.fromRGB(75, 45, 25),
    CatNoirCyanScope             = Color3.fromRGB(0, 220, 220),
    TwilightBiScope              = Color3.fromRGB(200, 100, 255),
    CreatorScope                 = Color3.fromRGB(255, 180, 60),
    ChocoScope                   = Color3.fromRGB(92, 51, 23),
    EasterScope                  = Color3.fromRGB(180, 240, 180),
    GreenAppleBowScope           = Color3.fromRGB(140, 220, 60),
    AppleStrawberryKittyScope    = Color3.fromRGB(255, 80, 120),
    BlueCookieCremeScope         = Color3.fromRGB(100, 170, 255),
    PinkMintScope                = Color3.fromRGB(255, 160, 200),
    FiliaScope                   = Color3.fromRGB(150, 60, 200),
    NapolitanScope               = Color3.fromRGB(255, 140, 170),
    AppleJackScope               = Color3.fromRGB(240, 150, 60),
    SummerAquaScope              = Color3.fromRGB(80, 220, 220),
    SweetPetalAppleBlossomScope  = Color3.fromRGB(255, 180, 210),
    ChocoFlakeCreamScope         = Color3.fromRGB(180, 130, 90),
    RedVelvetScope               = Color3.fromRGB(200, 30, 60),
    SwagMusicScope               = Color3.fromRGB(150, 80, 220),
    FallScope                    = Color3.fromRGB(230, 130, 60),
    PusheenScope                 = Color3.fromRGB(180, 170, 160),
    PudinScope                   = Color3.fromRGB(255, 210, 130),
    VectorFlourishScope          = Color3.fromRGB(120, 220, 100),
    FrutigerAeroScopeV1          = Color3.fromRGB(80, 180, 220),
    FrutigerAeroScopeV2          = Color3.fromRGB(130, 220, 180),
    MoeKawaiiScope               = Color3.fromRGB(255, 160, 200),
    PastelKawaiiScope            = Color3.fromRGB(255, 240, 180),
}

local GUN_BODY_COLORS = EFFECT_COLORS

--==================================================
-- BEAMS ESPECIAIS
--==================================================

local SPECIAL_BEAMS = {
    CreatorScope = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 30, 30)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 255, 255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 30, 30)),
    }),
    HallowHelloKittyScope = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 130, 0)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(20, 20, 20)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 130, 0)),
    }),
    ChocoCatScope = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(180, 220, 255)),
        ColorSequenceKeypoint.new(0.35, Color3.fromRGB(92, 51, 23)),
        ColorSequenceKeypoint.new(0.65, Color3.fromRGB(255, 255, 255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(180, 220, 255)),
    }),
    RainbowScope = ColorSequence.new({
        ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 0)),
        ColorSequenceKeypoint.new(0.16, Color3.fromRGB(255, 165, 0)),
        ColorSequenceKeypoint.new(0.32, Color3.fromRGB(255, 255, 0)),
        ColorSequenceKeypoint.new(0.48, Color3.fromRGB(0, 255, 0)),
        ColorSequenceKeypoint.new(0.64, Color3.fromRGB(0, 170, 255)),
        ColorSequenceKeypoint.new(0.80, Color3.fromRGB(75, 0, 255)),
        ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 0, 255)),
    }),
    SwagMusicScope = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 105, 180)),
        ColorSequenceKeypoint.new(0.33, Color3.fromRGB(140, 230, 140)),
        ColorSequenceKeypoint.new(0.66, Color3.fromRGB(255, 240, 130)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 105, 180)),
    }),
    PastelKawaiiScope = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 245, 180)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(180, 240, 190)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 245, 180)),
    }),
}

--==================================================
-- TEXTURAS (44 ESTILOS) — IDs ATUALIZADOS
--==================================================

local TEXTURES = {
    RedScope                     = "rbxassetid://84961185975751",
    BlueScope                    = "rbxassetid://82435090032680",
    Purple                       = "rbxassetid://88934686234709",
    RainbowScope                 = "rbxassetid://111439232051230",
    Rosescope                    = "rbxassetid://102809990017058",
    WhiteScope                   = "rbxassetid://87412774611144",
    LadyNoir                     = "rbxassetid://113455213965513",
    RainbowDashScope             = "rbxassetid://91036451391743",
    PomPomPurinScope             = "rbxassetid://103585180315576",
    MyMelodyScope                = "rbxassetid://83689518548676",
    CinnamorollScope             = "rbxassetid://109331272063130",
    HallowHelloKittyScope        = "rbxassetid://87175911202111",
    FluttershyScope              = "rbxassetid://138078031195826",
    PinkPieScope                 = "rbxassetid://81233140778268",
    ShinobuScope                 = "rbxassetid://129716772920139",
    KuromiScope                  = "rbxassetid://139867139703027",
    ChocoCatScope                = "rbxassetid://92566809803349",
    CatNoirCyanScope             = "rbxassetid://131180982037558",
    TwilightBiScope              = "rbxassetid://108862731291876",
    CreatorScope                 = "rbxassetid://112081510735998",
    ChocoScope                   = "rbxassetid://116961984812398",
    EasterScope                  = "rbxassetid://77549067516683",
    GreenAppleBowScope           = "rbxassetid://82764504607954",
    AppleStrawberryKittyScope    = "rbxassetid://119568146178980",
    BlueCookieCremeScope         = "rbxassetid://133388239485972",
    PinkMintScope                = "rbxassetid://71532164725857",
    FiliaScope                   = "rbxassetid://70932940623767",
    NapolitanScope               = "rbxassetid://79744127665364",
    AppleJackScope               = "rbxassetid://76362909492405",
    SummerAquaScope              = "rbxassetid://99078829240858",
    SweetPetalAppleBlossomScope  = "rbxassetid://121702965361666",
    ChocoFlakeCreamScope         = "rbxassetid://85987967443318",
    RedVelvetScope               = "rbxassetid://91979423609344",
    SwagMusicScope               = "rbxassetid://97014644110065",
    FallScope                    = "rbxassetid://118826135119487",
    PusheenScope                 = "rbxassetid://76905425230972",
    PudinScope                   = "rbxassetid://107816958013843",
    VectorFlourishScope          = "rbxassetid://89091163185390",
    FrutigerAeroScopeV1          = "rbxassetid://109961326765377",
    FrutigerAeroScopeV2          = "rbxassetid://89548347687314",
    MoeKawaiiScope               = "rbxassetid://131107656713089",
    PastelKawaiiScope            = "rbxassetid://121510582236866",
}

--==================================================
-- 🔥 PRELOAD TURBINADO
--==================================================

task.spawn(function()
    local ids = {}
    for _, id in pairs(TEXTURES) do 
        table.insert(ids, id) 
    end
    
    for i = 1, #ids, 5 do
        local bloco = {}
        for j = i, math.min(i + 4, #ids) do
            table.insert(bloco, ids[j])
        end
        pcall(function()
            ContentProvider:PreloadAsync(bloco)
        end)
    end
    
    print("[Customizer] Texturas pré-carregadas ✔")
end)

--==================================================
-- GRADIENTE
--==================================================

local function shiftColor(cor, factor)
    if factor > 0 then
        return cor:Lerp(Color3.new(1,1,1), factor)
    else
        return cor:Lerp(Color3.new(0,0,0), -factor)
    end
end

local function applyGradient(container, baseColor, overrideTable)
    if not container then return end

    local parts = {}
    for _, obj in ipairs(container:GetDescendants()) do
        if obj:IsA("BasePart") or obj:IsA("MeshPart") then
            table.insert(parts, obj)
        end
    end
    if container:IsA("BasePart") or container:IsA("MeshPart") then
        table.insert(parts, container)
    end

    if #parts == 0 then return end

    table.sort(parts, function(a, b)
        return a.Position.Y > b.Position.Y
    end)

    local total = math.max(#parts, 1)

    for i, part in ipairs(parts) do
        local t = (i - 1) / math.max(total - 1, 1)
        local fator = 0.25 - (t * 0.50)
        local corFinal = shiftColor(baseColor, fator)

        pcall(function()
            saveOriginal(part, "Color")
            part.Color = corFinal
        end)
    end
end

--==================================================
-- LISTA DE ESTILOS
--==================================================

local Styles = {
    "Normal", "Purple", "RedScope", "BlueScope", "RainbowScope",
    "Rosescope", "WhiteScope", "GhostScope", "LadyNoir",
    "RainbowDashScope", "PomPomPurinScope", "MyMelodyScope",
    "CinnamorollScope", "HallowHelloKittyScope", "FluttershyScope",
    "PinkPieScope", "ShinobuScope", "KuromiScope", "ChocoCatScope",
    "CatNoirCyanScope", "TwilightBiScope", "CreatorScope", "ChocoScope",
    "EasterScope", "GreenAppleBowScope", "AppleStrawberryKittyScope",
    "BlueCookieCremeScope", "PinkMintScope", "FiliaScope", "NapolitanScope",
    "AppleJackScope", "SummerAquaScope", "SweetPetalAppleBlossomScope",
    "ChocoFlakeCreamScope", "RedVelvetScope", "SwagMusicScope", "FallScope",
    "PusheenScope", "PudinScope", "VectorFlourishScope",
    "FrutigerAeroScopeV1", "FrutigerAeroScopeV2",
    "MoeKawaiiScope", "PastelKawaiiScope",
}

local CURRENT_STYLE = "Normal"
local customizerEnabled = true
local minimized = false
local originalProperties = {}
local hookedTools = {}

local function saveOriginal(object, property)
    originalProperties[object] = originalProperties[object] or {}
    local properties = originalProperties[object]
    if properties[property] == nil then
        local ok, value = pcall(function() return object[property] end)
        if ok then properties[property] = value end
    end
end

local function restoreObject(object)
    local properties = originalProperties[object]
    if not properties or not object.Parent then return end
    for property, value in pairs(properties) do
        pcall(function() object[property] = value end)
    end
end

local function restoreAll()
    for object in pairs(originalProperties) do restoreObject(object) end
end

local function colorEffect(object, style)
    if not object or not object.Parent then return end
    local isEffect = object:IsA("Beam") or object:IsA("Trail") or object:IsA("ParticleEmitter")

    if style == "GhostScope" then
        if isEffect then
            saveOriginal(object, "Color")
            saveOriginal(object, "Transparency")
            object.Color = ColorSequence.new(WHITE)
            object.Transparency = NumberSequence.new(0.5)
        end
        return
    end

    if SPECIAL_BEAMS[style] then
        if isEffect then
            saveOriginal(object, "Color")
            object.Color = SPECIAL_BEAMS[style]
        end
        return
    end

    local color = EFFECT_COLORS[style]
    if color and isEffect then
        saveOriginal(object, "Color")
        object.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, shiftColor(color, 0.3)),
            ColorSequenceKeypoint.new(0.5, color),
            ColorSequenceKeypoint.new(1, shiftColor(color, -0.3)),
        })
    end
end

local function applyObject(object)
    if not customizerEnabled then return end

    local isPart   = object:IsA("BasePart")
    local isMesh   = object:IsA("SpecialMesh")
    local isDecal  = object:IsA("Decal") or object:IsA("Texture")
    local isSurf   = object:IsA("SurfaceAppearance")
    local isEffect = object:IsA("Beam") or object:IsA("Trail") or object:IsA("ParticleEmitter")

    if CURRENT_STYLE == "GhostScope" then
        if isPart then
            saveOriginal(object, "Color"); saveOriginal(object, "Transparency")
            object.Color = WHITE; object.Transparency = 0.5
            if object:IsA("MeshPart") then saveOriginal(object, "TextureID"); object.TextureID = "" end
            local surf = object:FindFirstChildOfClass("SurfaceAppearance")
            if surf then saveOriginal(surf, "Transparency"); surf.Transparency = 1 end
            local mesh = object:FindFirstChildOfClass("SpecialMesh")
            if mesh then saveOriginal(mesh, "TextureId"); mesh.TextureId = "" end
        elseif isMesh then
            saveOriginal(object, "TextureId"); object.TextureId = ""
        elseif isDecal then
            saveOriginal(object, "Transparency"); object.Transparency = 1
        elseif isEffect then
            saveOriginal(object, "Color"); saveOriginal(object, "Transparency")
            object.Color = ColorSequence.new(WHITE)
            object.Transparency = NumberSequence.new(0.5)
        end
        return
    end

    local textureId = TEXTURES[CURRENT_STYLE]
    local bodyColor = GUN_BODY_COLORS[CURRENT_STYLE]

    if USE_TEXTURES and textureId then
        if object:IsA("MeshPart") then saveOriginal(object, "TextureID"); object.TextureID = textureId
        elseif isMesh then saveOriginal(object, "TextureId"); object.TextureId = textureId
        elseif isDecal then saveOriginal(object, "Texture"); object.Texture = textureId
        elseif isSurf then saveOriginal(object, "ColorMap"); object.ColorMap = textureId end
    end

    if isPart and bodyColor then
        saveOriginal(object, "Color")
        object.Color = bodyColor
        if not USE_TEXTURES then
            saveOriginal(object, "Material")
            object.Material = GUN_MATERIAL
            if object:IsA("MeshPart") then saveOriginal(object, "TextureID"); object.TextureID = "" end
            local surf = object:FindFirstChildOfClass("SurfaceAppearance")
            if surf then saveOriginal(surf, "Transparency"); surf.Transparency = 1 end
            local mesh = object:FindFirstChildOfClass("SpecialMesh")
            if mesh then saveOriginal(mesh, "TextureId"); mesh.TextureId = "" end
        end
    end

    if isEffect then
        if SPECIAL_BEAMS[CURRENT_STYLE] then
            saveOriginal(object, "Color")
            object.Color = SPECIAL_BEAMS[CURRENT_STYLE]
        else
            local color = EFFECT_COLORS[CURRENT_STYLE]
            if color then
                saveOriginal(object, "Color")
                object.Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, shiftColor(color, 0.3)),
                    ColorSequenceKeypoint.new(0.5, color),
                    ColorSequenceKeypoint.new(1, shiftColor(color, -0.3)),
                })
            end
        end
    end
end

local function applyToTool(tool)
    if not tool or not tool:IsA("Tool") then return 0 end
    if not string.find(tool.Name, GUN_TOOL_NAME) then return 0 end
    if not customizerEnabled or CURRENT_STYLE == "Normal" then return 0 end

    local count = 0
    if tool:IsA("BasePart") or tool:IsA("SpecialMesh") or tool:IsA("Decal")
       or tool:IsA("Texture") or tool:IsA("Beam") or tool:IsA("Trail")
       or tool:IsA("ParticleEmitter") or tool:IsA("SurfaceAppearance") then
        applyObject(tool); count += 1
    end
    for _, obj in ipairs(tool:GetDescendants()) do applyObject(obj); count += 1 end

    if CURRENT_STYLE ~= "GhostScope" then
        local bodyColor = GUN_BODY_COLORS[CURRENT_STYLE]
        if bodyColor then applyGradient(tool, bodyColor, true) end
    end
    return count
end

--==================================================
-- 🔥 FORCE APPLY (6x)
--==================================================

local function forceApplyTool(tool)
    if not customizerEnabled or CURRENT_STYLE == "Normal" then return end
    task.spawn(function()
        applyToTool(tool)
        task.wait(0.05); applyToTool(tool)
        task.wait(0.15); applyToTool(tool)
        task.wait(0.35); applyToTool(tool)
        task.wait(0.7); applyToTool(tool)
        task.wait(1.5); applyToTool(tool)
    end)
end

local function setupTool(tool)
    if not tool:IsA("Tool") then return end
    if not string.find(tool.Name, GUN_TOOL_NAME) then return end
    if hookedTools[tool] then return end
    hookedTools[tool] = true

    tool.Equipped:Connect(function() forceApplyTool(tool) end)
    tool.Unequipped:Connect(function() forceApplyTool(tool) end)

    tool.DescendantAdded:Connect(function(obj)
        if not customizerEnabled or CURRENT_STYLE == "Normal" then return end
        task.wait(0.05)
        applyObject(obj)
        if CURRENT_STYLE ~= "GhostScope" then
            local bodyColor = GUN_BODY_COLORS[CURRENT_STYLE]
            if bodyColor then applyGradient(tool, bodyColor, true) end
        end
    end)

    tool.Destroying:Connect(function() hookedTools[tool] = nil end)
    forceApplyTool(tool)
end

local function setupCharacter(character)
    for _, obj in ipairs(character:GetChildren()) do
        if obj:IsA("Tool") then setupTool(obj) end
    end
    character.ChildAdded:Connect(function(obj)
        if obj:IsA("Tool") then setupTool(obj) end
    end)
end

local function setupBackpack()
    local backpack = player:WaitForChild("Backpack")
    for _, obj in ipairs(backpack:GetChildren()) do
        if obj:IsA("Tool") then setupTool(obj) end
    end
    backpack.ChildAdded:Connect(function(obj)
        if obj:IsA("Tool") then setupTool(obj) end
    end)
end

local function getNearestDisplay()
    local character = player.Character
    local root = character and character:FindFirstChild("HumanoidRootPart")
    if not root then return nil end
    local nearest, nearestDistance = nil, math.huge
    for _, object in ipairs(workspace:GetDescendants()) do
        if object.Name == TARGET_NAME then
            local part
            if object:IsA("BasePart") then part = object
            elseif object:IsA("Model") then part = object.PrimaryPart or object:FindFirstChildWhichIsA("BasePart", true)
            elseif object:IsA("Tool") then part = object:FindFirstChild("Handle", true) end
            if part and part:IsA("BasePart") then
                local distance = (part.Position - root.Position).Magnitude
                if distance < nearestDistance then nearestDistance = distance; nearest = object end
            end
        end
    end
    return nearest
end

local function applyToContainer(container)
    if not container then return 0 end
    local count = 0
    if container:IsA("BasePart") or container:IsA("SpecialMesh") or container:IsA("Decal")
       or container:IsA("Texture") or container:IsA("Beam") or container:IsA("Trail")
       or container:IsA("ParticleEmitter") or container:IsA("SurfaceAppearance") then
        applyObject(container); count += 1
    end
    for _, object in ipairs(container:GetDescendants()) do applyObject(object); count += 1 end
    if CURRENT_STYLE ~= "Normal" and CURRENT_STYLE ~= "GhostScope" then
        local bodyColor = GUN_BODY_COLORS[CURRENT_STYLE]
        if bodyColor then applyGradient(container, bodyColor, true) end
    end
    return count
end

local function findShotContainer(object)
    if SHOT_NAMES[object.Name] then return object end
    if object.Parent and SHOT_NAMES[object.Parent.Name] then return object.Parent end
    return nil
end

local function colorShotContainer(container)
    if not container then return end
    colorEffect(container, CURRENT_STYLE)
    for _, object in ipairs(container:GetDescendants()) do colorEffect(object, CURRENT_STYLE) end
end

workspace.DescendantAdded:Connect(function(object)
    if not customizerEnabled or CURRENT_STYLE == "Normal" then return end
    task.defer(function()
        if not object.Parent then return end
        local shot = findShotContainer(object)
        if shot then
            local ownerId = shot:GetAttribute("OwnerUserId")
            if ownerId == nil or ownerId == player.UserId then colorShotContainer(shot) end
        end
    end)
end)

--==================================================
-- APPLY FUNCTIONS
--==================================================

function applyCurrentStyleRef()
    restoreAll()

    local function runApply()
        local char = player.Character
        if char then
            for _, obj in ipairs(char:GetDescendants()) do
                if obj:IsA("Tool") and string.find(obj.Name, GUN_TOOL_NAME) then
                    applyToTool(obj)
                end
            end
        end
        local backpack = player:FindFirstChild("Backpack")
        if backpack then
            for _, obj in ipairs(backpack:GetChildren()) do
                if obj:IsA("Tool") and string.find(obj.Name, GUN_TOOL_NAME) then
                    applyToTool(obj)
                end
            end
        end
        local display = getNearestDisplay()
        if display then applyToContainer(display) end
    end

    runApply()
    task.wait(0.05); runApply()
    task.wait(0.15); runApply()
    task.wait(0.35); runApply()
    task.wait(0.7); runApply()
    task.wait(1.5); runApply()
end

local function applyCurrentStyle()
    if not customizerEnabled then 
        if status then status.Text = "Customizer desligado" end
        return 
    end
    applyCurrentStyleRef()
    if status then
        status.Text = CURRENT_STYLE .. " aplicado"
    end
end

--==================================================
-- PERSISTÊNCIA
--==================================================

if player.Character then setupCharacter(player.Character) end

player.CharacterAdded:Connect(function(character)
    hookedTools = {}
    setupCharacter(character)

    task.wait(0.5)
    if customizerEnabled and CURRENT_STYLE ~= "Normal" then
        applyCurrentStyleRef()
    end
end)

player.ChildAdded:Connect(function(child)
    if child.Name == "Backpack" then
        task.wait(0.3)
        setupBackpack()
        task.wait(0.2)
        if customizerEnabled and CURRENT_STYLE ~= "Normal" then
            applyCurrentStyleRef()
        end
    end
end)

setupBackpack()

--==================================================
-- 🖤💙 UI PRETO & AZUL CLARO
--==================================================

local oldGui = PlayerGui:FindFirstChild("MatrixVoidPanel")
if oldGui then oldGui:Destroy() end

local gui = Instance.new("ScreenGui")
gui.Name = "MatrixVoidPanel"; gui.ResetOnSpawn = false; gui.IgnoreGuiInset = false; gui.Parent = PlayerGui

local ball = Instance.new("ImageButton")
ball.Name = "ChocoBall"
ball.Size = UDim2.fromOffset(70, 70)
ball.Position = UDim2.new(0, 20, 0.5, -35)
ball.BackgroundColor3 = BK_BLACK
ball.BorderSizePixel = 0
ball.AutoButtonColor = true
ball.Active = true
ball.Visible = true
ball.Image = CHOCO_IMG
ball.ScaleType = Enum.ScaleType.Fit
ball.Parent = gui
Instance.new("UICorner", ball).CornerRadius = UDim.new(1, 0)

local ballStroke = Instance.new("UIStroke", ball)
ballStroke.Color = BLUE_LIGHT
ballStroke.Thickness = 3

local main = Instance.new("Frame")
main.Name = "MainFrame"
main.Size = UDim2.fromOffset(280, 430)
main.Position = UDim2.new(0.5, -140, 0.4, -215)
main.BackgroundColor3 = BK_BLACK
main.BorderSizePixel = 0
main.Active = true
main.ClipsDescendants = true
main.Visible = false
main.Parent = gui
Instance.new("UICorner", main).CornerRadius = UDim.new(0, 18)

local stroke = Instance.new("UIStroke", main)
stroke.Color = BLUE_LIGHT
stroke.Thickness = 2.5

local mainGrad = Instance.new("UIGradient", main)
mainGrad.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, BK_BLACK),
    ColorSequenceKeypoint.new(1, BK_BLACK_SOFT),
})
mainGrad.Rotation = 90

local titleBar = Instance.new("Frame")
titleBar.Size = UDim2.new(1, 0, 0, 42)
titleBar.BackgroundColor3 = BK_BLACK_DARK
titleBar.BorderSizePixel = 0
titleBar.Active = true
titleBar.Parent = main
Instance.new("UICorner", titleBar).CornerRadius = UDim.new(0, 18)

local tbFix = Instance.new("Frame", titleBar)
tbFix.Size = UDim2.new(1, 0, 0, 14)
tbFix.Position = UDim2.new(0, 0, 1, -14)
tbFix.BackgroundColor3 = BK_BLACK_DARK
tbFix.BorderSizePixel = 0

local headerIcon = Instance.new("ImageLabel")
headerIcon.Size = UDim2.fromOffset(30, 30)
headerIcon.Position = UDim2.new(0, 8, 0.5, -15)
headerIcon.BackgroundTransparency = 1
headerIcon.Image = CHOCO_IMG
headerIcon.ScaleType = Enum.ScaleType.Fit
headerIcon.ZIndex = 3
headerIcon.Parent = titleBar

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -80, 1, 0)
title.Position = UDim2.fromOffset(44, 0)
title.BackgroundTransparency = 1
title.Text = "antonmvtwin • kywsam"
title.TextColor3 = BLUE_LIGHT
title.TextSize = 13
title.Font = Enum.Font.FredokaOne
title.TextXAlignment = Enum.TextXAlignment.Left
title.ZIndex = 3
title.Parent = titleBar

local minimize = Instance.new("TextButton")
minimize.Size = UDim2.fromOffset(26, 26)
minimize.Position = UDim2.new(1, -32, 0, 8)
minimize.BackgroundColor3 = BLUE_MEDIUM
minimize.Text = "-"
minimize.TextColor3 = BK_BLACK
minimize.TextSize = 18
minimize.Font = Enum.Font.FredokaOne
minimize.BorderSizePixel = 0
minimize.ZIndex = 3
minimize.Parent = titleBar
Instance.new("UICorner", minimize).CornerRadius = UDim.new(1, 0)

local content = Instance.new("Frame")
content.Position = UDim2.fromOffset(12, 48)
content.Size = UDim2.new(1, -24, 1, -58)
content.BackgroundTransparency = 1
content.ZIndex = 2
content.Parent = main

local layout = Instance.new("UIListLayout")
layout.Padding = UDim.new(0, 7)
layout.SortOrder = Enum.SortOrder.LayoutOrder
layout.Parent = content

local function makeButton(text, parent)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, 0, 0, 30)
    button.BackgroundColor3 = BK_BLACK_SOFT
    button.BorderSizePixel = 0
    button.Text = text
    button.TextColor3 = BLUE_LIGHT
    button.TextSize = 12
    button.Font = Enum.Font.FredokaOne
    button.AutoButtonColor = true
    button.ZIndex = 3
    button.Parent = parent
    Instance.new("UICorner", button).CornerRadius = UDim.new(0, 10)
    local bs = Instance.new("UIStroke", button)
    bs.Color = BLUE_LIGHT
    bs.Thickness = 1.5
    return button
end

local matrixButton = makeButton("CUSTOMIZER: ON", content)
local purpleButton = makeButton("QUICK STYLE: PURPLE", content)
local rainbowButton = makeButton("QUICK STYLE: RAINBOWSCOPE", content)

local label = Instance.new("TextLabel")
label.Size = UDim2.new(1, 0, 0, 18)
label.BackgroundTransparency = 1
label.Text = "TEXTURES (44 estilos)"
label.TextColor3 = BLUE_LIGHT
label.TextSize = 11
label.Font = Enum.Font.FredokaOne
label.TextXAlignment = Enum.TextXAlignment.Left
label.ZIndex = 3
label.Parent = content

local scroll = Instance.new("ScrollingFrame")
scroll.Name = "StyleList"
scroll.Size = UDim2.new(1, 0, 0, 190)
scroll.BackgroundColor3 = BK_BLACK_DARK
scroll.BackgroundTransparency = 0.3
scroll.BorderSizePixel = 0
scroll.ScrollBarThickness = 4
scroll.ScrollBarImageColor3 = BLUE_LIGHT
scroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
scroll.CanvasSize = UDim2.new(0, 0, 0, 0)
scroll.ZIndex = 3
scroll.Parent = content
Instance.new("UICorner", scroll).CornerRadius = UDim.new(0, 10)

local scrollLayout = Instance.new("UIListLayout")
scrollLayout.Padding = UDim.new(0, 6)
scrollLayout.SortOrder = Enum.SortOrder.LayoutOrder
scrollLayout.Parent = scroll

local scrollPad = Instance.new("UIPadding", scroll)
scrollPad.PaddingTop = UDim.new(0, 6)
scrollPad.PaddingBottom = UDim.new(0, 6)
scrollPad.PaddingLeft = UDim.new(0, 6)
scrollPad.PaddingRight = UDim.new(0, 6)

local status = Instance.new("TextLabel")
status.Size = UDim2.new(1, 0, 0, 20)
status.BackgroundTransparency = 1
status.Text = "Ready"
status.TextColor3 = BLUE_LIGHT
status.TextSize = 10
status.Font = Enum.Font.FredokaOne
status.TextWrapped = true
status.ZIndex = 3
status.Parent = content

local function selectStyle(styleName)
    local valid = false
    for _, name in ipairs(Styles) do if name == styleName then valid = true break end end
    if not valid then return end

    CURRENT_STYLE = styleName
    for _, button in ipairs(scroll:GetChildren()) do
        if button:IsA("TextButton") then
            local selected = button:GetAttribute("StyleName") == styleName
            button.BackgroundTransparency = selected and 0 or 0.15
            button.BackgroundColor3 = selected and BLUE_MEDIUM or BK_BLACK_SOFT
            button.TextColor3 = selected and BK_BLACK or BLUE_LIGHT
        end
    end
    applyCurrentStyle()
end

for _, styleName in ipairs(Styles) do
    local button = makeButton(styleName, scroll)
    button:SetAttribute("StyleName", styleName)
    local preview = EFFECT_COLORS[styleName]
    if preview then
        button.BackgroundColor3 = preview
        button.BackgroundTransparency = 0
        local lum = preview.R * 0.299 + preview.G * 0.587 + preview.B * 0.114
        button.TextColor3 = lum > 0.6 and BK_BLACK or WHITE
    end
    button.Activated:Connect(function() selectStyle(styleName) end)
end

matrixButton.Activated:Connect(function()
    customizerEnabled = not customizerEnabled
    matrixButton.Text = customizerEnabled and "CUSTOMIZER: ON" or "CUSTOMIZER: OFF"
    if customizerEnabled then applyCurrentStyle()
    else restoreAll(); status.Text = "Propriedades originais restauradas" end
end)

purpleButton.Activated:Connect(function()
    if CURRENT_STYLE == "Purple" then selectStyle("Normal") else selectStyle("Purple") end
end)

rainbowButton.Activated:Connect(function()
    if CURRENT_STYLE == "RainbowScope" then selectStyle("Normal") else selectStyle("RainbowScope") end
end)

local function openPanel() ball.Visible = false; main.Visible = true end
local function closePanel() main.Visible = false; ball.Visible = true end

ball.Activated:Connect(openPanel)
minimize.Activated:Connect(closePanel)

local function makeDraggable(dragObj, moveObj)
    local dragStart, startPos, dragging = nil, nil, false
    dragObj.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true; dragStart = input.Position; startPos = moveObj.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then dragging = false end
            end)
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            local delta = input.Position - dragStart
            moveObj.Position = UDim2.new(
                startPos.X.Scale, startPos.X.Offset + delta.X,
                startPos.Y.Scale, startPos.Y.Offset + delta.Y
            )
        end
    end)
end

makeDraggable(titleBar, main)
makeDraggable(ball, ball)

--==================================================
-- 🔥 LOOP DE SEGURANÇA
--==================================================

task.spawn(function()
    while task.wait(3) do
        if customizerEnabled and CURRENT_STYLE ~= "Normal" then
            local char = player.Character
            if char then
                for _, obj in ipairs(char:GetDescendants()) do
                    if obj:IsA("Tool") and string.find(obj.Name, GUN_TOOL_NAME) then
                        applyToTool(obj)
                    end
                end
            end
            local backpack = player:FindFirstChild("Backpack")
            if backpack then
                for _, obj in ipairs(backpack:GetChildren()) do
                    if obj:IsA("Tool") and string.find(obj.Name, GUN_TOOL_NAME) then
                        applyToTool(obj)
                    end
                end
            end
        end
    end
end)

print("[Customizer] Carregado ✔ — 44 estilos 🖤💙")
