--// Location: game.ServerScriptService.server_main
--// Type: ServerScript
 
local Remotes = game.ReplicatedStorage.Remotes
 
local Event = Remotes.Event
local Function = Remotes.Function
local Keys = {}
 
local function GenerateInformation(plr)
    wait(1)
    local Key = game.HttpService:GenerateGUID()
    Keys[plr.Name] = Key
    Event:FireClient(plr,'Key', Key)
    local PlayerConfig = Instance.new('Configuration')
    local Number = Instance.new('IntValue')
    local Catching = Instance.new('BoolValue')
    local Stamina = Instance.new('BoolValue')
    local Blocking = Instance.new('BoolValue')
    local Diving = Instance.new('BoolValue')
    PlayerConfig.Name = 'PlayerConfig'
    Diving.Name = 'Diving'
    Number.Name = 'Number'
    Catching.Name = 'Catching'
    Stamina.Name = 'Stamina'
    Blocking.Name = 'Blocking'
    Diving.Name = 'Diving'
    Diving.Parent = PlayerConfig
    Number.Parent = PlayerConfig
    Catching.Parent = PlayerConfig
    Stamina.Parent = PlayerConfig
    Blocking.Parent = PlayerConfig
    Diving.Parent = PlayerConfig
    PlayerConfig.Parent = plr
end
 
Event.OnServerEvent:Connect(function(plr, ...)
    local tuple = {...}
    if tuple[1] == 'Key' then
        if tuple[1] == Keys[plr.Name] then
            if tuple[2] == 'Block' then
                if not plr.PlayerConfig.Blocking.Value then
                    plr.PlayerConfig.Blocking.Value = true
                end
            elseif tuple[2] == 'Catch' then
                if not plr.PlayerConfig.Catching.Value then
                    plr.PlayerConfig.Catching.Value = true
                end
            elseif tuple[2] == 'Stamina' then
                if not plr.PlayerConfig.Stamina.Value then
                    plr.PlayerConfig.Stamina.Value = true
                end
            elseif tuple[2] == 'Dive' then
                if not plr.PlayerConfig.Diving.Value then
                    plr.PlayerConfig.Diving.Value = true
                end
            elseif tuple[2] == 'Tuck' then
                if not plr.PlayerConfig.Tuck.Value then
                    plr.PlayerConfig.Tuck.Value = true
                    plr.Character.Humanoid.WalkSpeed = 15
                end
            end
        else
            print('key didn\'t match')
        end
    end
end)
 
function Function.OnServerInvoke(plr, ...)
    local tuple = {...}
end
 
game.Players.PlayerAdded:Connect(function(plr)
    GenerateInformation(plr)
    plr.CharacterAdded:Connect(function(char)
        while not char:FindFirstChild('Humanoid') do
            wait()
        end
        char.Humanoid.WalkSpeed = 18
    end)
end)
