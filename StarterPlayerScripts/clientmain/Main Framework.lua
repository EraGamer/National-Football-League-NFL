local framework = {}
local Key = nil
local AnimationIDs = {
    Tuck = 'rbxassetid://2837684798';
    TuckCont = 'rbxassetid://2837895326';
    Dive = 'rbxassetid://2848953852';
    Juke = 'rbxassetid://2838813492';
    Jump = 'rbxassetid://2848964624';
}
 
local Animations = {
}
Animations.Tuck = Instance.new("Animation")
Animations.Tuck.AnimationId = AnimationIDs.Tuck
Animations.TuckCont = Instance.new('Animation')
Animations.TuckCont.AnimationId = AnimationIDs.TuckCont
Animations.Dive = Instance.new('Animation')
Animations.Dive.AnimationId = AnimationIDs.Dive
Animations.Jump = Instance.new('Animation');
Animations.Jump.AnimationId = AnimationIDs.Jump
 
function framework:InitiateCatch(key, direction)
    if not key == Key then return end
    local newDirection = (direction == Enum.UserInputState.Begin and 'Begin' or 'End')
    if newDirection == 'Begin' then
       
    elseif newDirection == 'End' then
       
    end
end
 
function framework:InitiateBlock(key, direction)
    if not key == Key then return end
    local newDirection = (direction == Enum.UserInputState.Begin and 'Begin' or 'End')
    if newDirection == 'Begin' then
       
    elseif newDirection == 'End' then
       
    end
end
 
function framework:Stamina(key, direction)
    if not key == Key then return end
    local newDirection = (direction == Enum.UserInputState.Begin and 'Begin' or 'End')
    if newDirection == 'Begin' then
       
    elseif newDirection == 'End' then
       
    end
end
 
function framework:Tuck(key, direction)
    if not key == Key then return end
    local newDirection = (direction == Enum.UserInputState.Begin and 'Begin' or 'End')
    if newDirection == 'Begin' then
        framework.Event:FireServer(key, 'Tuck')
        framework.animTrackTuck:Play()
        wait(1)
        if framework.animTrackTuck.IsPlaying then
            framework.animTrackTuckCont:Play()
            framework.animTrackTuck:Stop()
        else   
        end
    elseif newDirection == 'End' then
        print('Ended')
        if framework.animTrackTuck.IsPlaying then
            framework.animTrackTuck:Stop()
        end
        framework.animTrackTuckCont:Stop()
    end
end
 
function framework:Dive(key, direction)
    if not key == Key then return end
    local newDirection = (direction == Enum.UserInputState.Begin and 'Begin' or 'End')
    if newDirection == 'Begin' then
        framework.Event:FireServer(key, 'Dive')
        framework.animTrackDive:Play()
        --framework.humanoid.WalkSpeed = 20
        wait(1)
        framework.humanoid.WalkSpeed = 5
        wait(.75)
        framework.humanoid.WalkSpeed = 18
    elseif newDirection == 'End' then
       
    end
end
 
function framework:Jump(key, direction)
    if not key == Key then return end
    local newDirection = (direction == Enum.UserInputState.Begin and 'Begin' or 'End')
    if newDirection == 'Begin' then
        --framework.Event:FireServer(key, 'Dive')
        framework.animTrackJump:Play()
        --framework.humanoid.WalkSpeed = 20
        framework.humanoid.WalkSpeed = 10
        wait(.5)
        framework.humanoid.WalkSpeed = 2
        wait(.5)
        framework.humanoid.WalkSpeed = 18
    elseif newDirection == 'End' then
       
    end
end
 
function framework.Initialize()
    --[[ GLOBAL VARIABLES ]]--
    -- SERVICES
    framework.players = game:GetService("Players")
    framework.runservice = game:GetService("RunService")
    framework.userinputservice = game:GetService("UserInputService")
    framework.repstore = game:GetService("ReplicatedStorage")
 
    -- PLAYER VARIABLES
    framework.player = framework.players.LocalPlayer
    framework.character = framework.player.Character
    framework.currentcamera = workspace.CurrentCamera
    while not framework.player.Character do wait() end
    framework.humanoid = framework.player.Character:WaitForChild('Humanoid')
    -- REMOTES
    framework.Remotes = framework.repstore.Remotes
    framework.Event = framework.Remotes.Event
    framework.Function = framework.Remotes.Function
   
    -- [[ OTHER MODULES ]] --
    -- HANDLERS
    framework.animation_information = require(script['Modules'].animation_information)
    framework.userinput_controller = require(script['Modules'].userinput_controller)
    framework.animation_information.initiate()
    --framework.CatchModule = require(script['Modules'].CatchModule)
    --framework.BlockModule = require(script['Modules'].BlockModule)
    --framework.StaminaModule = require(script['Modules'].StaminaModule)
    --framework.TuckModule = require(script['Modules'].TuckModule)
    --framework.DiveModule = require(script['Modules'].DiveModule)
    --framework.JumpModule = require(script['Modules'].JumpModule)
    framework.animation_information.anim_tracks.Lineup_QB.Looped = true
    framework.animation_information.anim_tracks.Lineup_CB.Looped = true
    framework.animation_information.anim_tracks.Lineup_WR.Looped = true
    framework.animation_information.anim_tracks.Lineup_DE.Looped = true
    framework.animation_information.anim_tracks.Lineup_CE.Looped = true
    framework.animation_information.anim_tracks.Hold_QB.Looped = true
    framework.animation_information.anim_tracks.Hold_BC.Looped = true
    framework.animation_information.anim_tracks.Block.Looped = true
   
    game.Players.LocalPlayer.Character.Humanoid.Changed:Connect(function()
        if game.Players.LocalPlayer.Character.Humanoid.Jump then
            game.Players.LocalPlayer.Character.Humanoid.Jump = false
        end
    end)
    framework.Event.OnClientEvent:Connect(function(...)
    local tuple = {...}
    if tuple[1] == 'Key' then
        Key = tuple[2]
        --framework.CatchModule:AcceptKey(tuple[2])
        --framework.BlockModule:AcceptKey(tuple[2])
        --framework.StaminaModule:AcceptKey(tuple[2])
        --framework.DiveModule:AcceptKey(tuple[2])
        --framework.TuckModule:AcceptKey(tuple[2])
        --framework.JumpModule:AcceptKey(tuple[2])
    end
end)
end
 
return framework
