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
 
--// Location: game.StarterPlayerScripts.ClientMain.["Main Frame"].Modules.DiveModule[dep]
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
