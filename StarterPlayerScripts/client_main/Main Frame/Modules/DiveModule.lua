-// Location: game.StarterPlayerScripts.ClientMain.["Main Frame"].Modules.DiveModule[dep]
--// Type: ModuleScript
 
local DiveModule = {}
local MainModule = require(script.Parent.Parent)
 
local Key = nil
 
local function Dive(actionName, inputState, inputObject)
    if inputState == Enum.UserInputState.Begin then
        MainModule:Dive(Key, inputState)
    elseif inputState == Enum.UserInputState.End then
        MainModule:Dive(Key, inputState)
    else
   
    end
end
 
local CAS = game:GetService('ContextActionService')
 
CAS:BindAction('Dive', Dive, true, Enum.KeyCode.Backspace, Enum.KeyCode.E)
 
function DiveModule:AcceptKey(newKey)
    Key = newKey
end
 
return DiveModule
