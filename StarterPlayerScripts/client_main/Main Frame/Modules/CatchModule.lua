--// Location: game.StarterPlayerScripts.ClientMain.["Main Frame"].Modules.CatchModule[dep]
--// Type: ModuleScript
 
local CatchModule = {}
local MainModule = require(script.Parent.Parent)
local Key = nil
local CAS = game:GetService('ContextActionService')
 
local function Catch(actionName, inputState, inputObject)
    if inputState == Enum.UserInputState.Begin then
        MainModule:InitiateCatch(Key, inputState)
    elseif inputState == Enum.UserInputState.End then
        MainModule:InitiateCatch(Key, inputState)
    else
   
    end
end
 
CAS:BindAction('CatchBall', Catch, true, Enum.KeyCode.C)--, Enum.UserInputType.MouseButton1)   
 
function CatchModule:AcceptKey(newKey)
    Key = newKey
end
 
return CatchModule
