--// Location: game.StarterPlayerScripts.ClientMain.["Main Frame"].Modules.StaminaModule[dep]
--// Type: ModuleScript
 
local StaminaModule = {}
local MainModule = require(script.Parent.Parent)
local Key = nil
 
local function Stamina(_, _, input)
    if input.UserInputState == Enum.UserInputState.Begin then
        MainModule:Stamina(Key, input.UserInputState)
    elseif input.UserInputeState == Enum.UserInputState.End then
        MainModule:Stamina(Key, input.UserInputState)
    else
   
    end
end
 
local CAS = game:GetService('ContextActionService')
 
CAS:BindAction('StartStamina', Stamina, true, Enum.KeyCode.Q)
 
function StaminaModule:AcceptKey(newKey)
    Key = newKey
end
 
return StaminaModule
