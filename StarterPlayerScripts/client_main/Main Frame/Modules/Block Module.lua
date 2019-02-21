local BlockModule = {}
local MainModule = require(script.Parent.Parent)
local Key = nil
 
local function Block(_, _, input)
    if input.UserInputState == Enum.UserInputState.Begin then
        MainModule:InitiateBlock(Key, input.UserInputState)
    elseif input.UserInputeState == Enum.UserInputState.End then
        MainModule:InitiateBlock(Key, input.UserInputState)
    else
   
    end
end
 
local CAS = game:GetService('ContextActionService')
 
CAS:BindAction('StartBlock', Block, true, Enum.KeyCode.X)
 
function BlockModule:AcceptKey(newKey)
    Key = newKey
end
 
return BlockModule
