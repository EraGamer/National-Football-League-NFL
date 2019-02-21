-// Location: game.StarterGui.["Key Binds"].LocalScript
--// Type: LocalScript
 
local sg = script.Parent
local frame = script.Parent.Frame
local button = frame.TextButton
local binds = frame.Binds.Frame
local open_pos = UDim2.new(0.5, -150, 0.5, -150)
local close_pos = UDim2.new(0, -302,0.5, -150)
local open = false
_G.cur_screen = 'QB'
local cur_screen = 'QB'
local screen_names = {
    WR = 'Wide Receiver';
    CB = 'Cornerback';
    DE = 'Defensive End';
    BC = 'Ball Carrier';
    C = 'Center';
    QB = 'Quarterback';
}
local position = 4
local possible_screens = {'WR', 'CB', 'DE', 'QB', 'BC', 'C'}
local animation_information = require(game.Players.LocalPlayer.PlayerScripts.ClientMain['Main Framework']['Modules'].animation_information)
local pos_binds = {
    WR = {
        Jump_Catch = Enum.KeyCode.Space;
        Left_Catch = Enum.KeyCode.Q;
        Right_Catch = Enum.KeyCode.E;
        Lineup = Enum.KeyCode.V;
        Dive = Enum.KeyCode.F;
        Block = Enum.KeyCode.X
    };
    CB = {
        Jump_Catch = Enum.KeyCode.Space;
        Left_Catch = Enum.KeyCode.Q;
        Right_Catch = Enum.KeyCode.E;
        Lineup = Enum.KeyCode.Z;
        Dive = Enum.KeyCode.F;
        Block = Enum.KeyCode.X
    };
    DE = {
        Block = Enum.KeyCode.X;
        Lineup = Enum.KeyCode.V;
        Swat = Enum.KeyCode.Space;
    };
    QB = {
        Fake = Enum.KeyCode.F;
        Run = Enum.KeyCode.R;
        Slide = Enum.KeyCode.C;
        Kneel = Enum.KeyCode.Z;
        Lineup = Enum.KeyCode.V;
    };
    BC = {
        Tuck = Enum.KeyCode.R;
        Spin = Enum.KeyCode.F;
        Juke = Enum.KeyCode.G;
        Dive = Enum.KeyCode.E;
        Hurdle = Enum.KeyCode.Space;
        Kneel = Enum.KeyCode.Z;
        Slide = Enum.KeyCode.C;
    };
    C = {
        Hike = Enum.KeyCode.E;
        Block = Enum.KeyCode.X;
        Lineup = Enum.KeyCode.V;
    };
}
 
animation_information:update_binds(pos_binds)
 
local function load_bindscreen()
    animation_information.update_binds(pos_binds)
    local bind_table = pos_binds[cur_screen]
    local i = 0
    for name, keycode in pairs(bind_table) do
        i = i + 1
        local current_frame = binds:FindFirstChild('Frame' .. tostring(i))
        current_frame.Visible = true
        local label = current_frame:FindFirstChildOfClass('TextLabel')
        local button = current_frame:FindFirstChildOfClass('TextButton')
       
        local new_string, matches = string.gsub(name, '_', ' ')
        label.Name = name
        label.Text = new_string
        button.Text = keycode.Name
    end
    while i < 8 do
        i = i + 1
        local current_frame = binds:FindFirstChild('Frame' .. tostring(i))
        current_frame.Visible = false
    end
    script.Parent.Frame.Binds.Position_Name.Text = screen_names[cur_screen]
end
 
for _, bind_frame in pairs(binds:GetChildren()) do
    if bind_frame:IsA('Frame') then
        bind_frame:FindFirstChild('Key').MouseButton1Click:Connect(function()
            local bind_set = false
            local timeout = 6
            bind_frame.Key.Text = 'Press a key'
            spawn(function()
                for i = 0,6,-1 do
                    wait(1)
                    timeout = i
                end
            end)
            while not bind_set and timeout > 0 do
                local inputObject, gameProcessedEvent = game:GetService('UserInputService').InputBegan:Wait()
                if inputObject.UserInputType == Enum.UserInputType.Keyboard then
                    bind_set = true
                    bind_frame.Key.Text = inputObject.KeyCode.Name
                    pos_binds = animation_information.return_binds()
                    local new_str, matches = string.gsub(bind_frame:FindFirstChildOfClass('TextLabel').Name, ' ', '_')
                    pos_binds[cur_screen][new_str] = inputObject.KeyCode
                    animation_information.update_binds(pos_binds)
                end
            end
            if not bind_set then
                local new_str, matches = string.gsub(bind_frame:FindFirstChildOfClass('TextLabel').Name, ' ', '_')
                bind_frame.Key.Text = pos_binds[cur_screen][new_str].Name
                -- make = default value
            end
        end)
    end
end
 
button.MouseButton1Click:Connect(function()
    if open then
        open = not open
        frame:TweenPosition(close_pos, nil, Enum.EasingStyle.Linear, 1, true)
    else
        open = not open
        frame:TweenPosition(open_pos, nil, Enum.EasingStyle.Linear, 1, true)
    end
end)
 
script.Parent.Frame.Binds.Forward.MouseButton1Click:Connect(function()
    position = position + 1
    if position > #possible_screens then
        position = 1
    end
    cur_screen = possible_screens[position]
    _G.cur_screen = possible_screens[position]
    load_bindscreen()
end)
 
script.Parent.Frame.Binds.Back.MouseButton1Click:Connect(function()
    position = position - 1
    if position < 1 then
        position = #possible_screens
    end
    cur_screen = possible_screens[position]
    _G.cur_screen = possible_screens[position]
    load_bindscreen()
end)
 
load_bindscreen()
