--// Location: game.StarterPlayerScripts.ClientMain.["Main Frame"].Modules.JumpModule[dep]
--// Type: ModuleScript
 
 
local TuckModule = {}
local MainModule = require(script.Parent.Parent)
local Key = nil
 
local function Jump(actionName, inputState, inputObject)
    if inputState == Enum.UserInputState.Begin then
        MainModule:Jump(Key, inputState)
    elseif inputState == Enum.UserInputState.End then
        MainModule:Jump(Key, inputState)
    else
   
    end
end
 
local CAS = game:GetService('ContextActionService')
 
CAS:BindAction('Jump', Jump, true, Enum.KeyCode.Space)
 
MainModule.humanoid:GetPropertyChangedSignal('Jump'):Connect(function()
    MainModule.humanoid.Jump = false
end)
function TuckModule:AcceptKey(newKey)
    Key = newKey
end
 
return TuckModule
