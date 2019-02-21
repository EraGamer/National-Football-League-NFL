--// Location: game.StarterPlayerScripts.ClientMain.["Main Frame"].Modules.userinput_controller
--// Type: ModuleScript
 
 
local userinput_controller = {}
local main_framework = require(script.Parent.Parent)
local animation_information = require(script.Parent.animation_information)
local UIS = game:GetService('UserInputService')
 
UIS.InputBegan:Connect(function(inputObject, gameProcessedEvent)
    if inputObject.UserInputType == Enum.UserInputType.Keyboard and not gameProcessedEvent then
        animation_information.receive_button_press(inputObject, Enum.UserInputState.Begin)
    end
end)
UIS.InputEnded:Connect(function(inputObject, gameProcessedEvent)
    if inputObject.UserInputType == Enum.UserInputType.Keyboard and not gameProcessedEvent then
        animation_information.receive_button_press(inputObject, Enum.UserInputState.End)
    end
end)
 
return userinput_controller
