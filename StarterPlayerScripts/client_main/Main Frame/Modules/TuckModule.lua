local TuckModule = {}
local MainModule = require(script.Parent.Parent)
local Key = nil
 
local function Tuck(actionName, inputState, inputObject)
    if inputState == Enum.UserInputState.Begin then
        MainModule:Tuck(Key, inputState)
    elseif inputState == Enum.UserInputState.End then
        MainModule:Tuck(Key, inputState)
    else
   
    end
end
 
local CAS = game:GetService('ContextActionService')
 
CAS:BindAction('Tuck', Tuck, true, Enum.KeyCode.R)
 
function TuckModule:AcceptKey(newKey)
    Key = newKey
end
 
return TuckModule
