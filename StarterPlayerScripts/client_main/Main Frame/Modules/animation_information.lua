--// Location: game.StarterPlayerScripts.ClientMain.["Main Frame"].Modules.animation_information
--// Type: ModuleScript
 
 
local animations = {}
local player_binds = {}
 
function animations.return_binds()
    return player_binds
end
 
function animations.update_binds(tbl)
    player_binds = tbl
end
 
local IDs = {
    Jump_Catch = 2848964624;
    Left_Catch = 2848925854;
    --right_catch = nil;
    Dive_Catch = 2848953852;
    Lineup_WR = 2849709770;
    Lineup_CB = 2838797025;
    Block = 2838797025;
    Block_Push = 2838797025;
    Lineup_DE = 2838797025;
    Swat = 2848820174;
    Throw = 2838776984;
    Slide = 2871257990;
    Kneel = 2871300417;
    Lineup_QB = 02871307036;
    Hold_QB = 2838748954;
    Hold_BC = 2849714239;
    Tuck = 2837684798;
    Tuck_Cont = 2837895326;
    --spin = nil;
    --Fake = nil;
    --Run = nil;
    Juke = 2838813492;
    Dive = 2838096753;
    Hurdle = 2871318410;
    Hike = 2849666333;
    Lineup_CE = 2849678937;
};
 
local default_animations = {
}
 
animations.anim_tracks = {}
 
function animations.initiate()
    local player = game.Players.LocalPlayer
    for name, anim_id in pairs(IDs) do
        local anim = Instance.new('Animation');
        anim.AnimationId = 'rbxassetid://'..anim_id
        local anim_track = player.Character:FindFirstChild('Humanoid'):LoadAnimation(anim)
        animations.anim_tracks[name] = anim_track
    end
end
 
function animations.play_animation(anim_name, arg)
    if anim_name == 'lineup' then
        local new_anim_name = anim_name .. '_' .. string.lower(arg)
        animations.anim_tracks[new_anim_name]:Play()
    elseif anim_name == 'hold' then
        local new_anim_name = anim_name .. '_' .. string.lower(arg)
        animations.anim_tracks[new_anim_name]:Play()
    elseif anim_name == 'tuck' then
    elseif anim_name == 'block' then
       
    else
        animations.anim_tracks[anim_name]:Play()
    end
end
 
function animations.receive_button_press(inputObject, inputType, Pos)
    for bind, keycode in pairs(player_binds[_G.cur_screen]) do
        if keycode == inputObject.KeyCode and inputType == Enum.UserInputState.Begin then
            animations.play_animation(bind)
        end
    end
end
 
return animations
 
