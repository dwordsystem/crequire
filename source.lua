--[[

crequire - easy solution to using modules, sound playback and more!
as of 6th July 2022, this can:
    - serve as a GetObjects handler
    - serve as a sound handler (can play sound, and change settings easily through music settings)
    - serve as a file handler (only for roblox exploiting scripts)
    - serve as a module editor
    and of course, serves as a module handler - all in a classy style no game developer would be laughing at you.

I am not responsible if this gets used in exploiting scripts, I only provide a simpler way to use stuff.
If you want, you can fork this project and write your own features to it, or modify it - all up to the editor's wish, 
however I'd love it if you'd credit me for making crequire. That'll be awesome!

Enjoy!
~revolume

]]

local crequire = {};

crequire.GetObjects = function(id)
    loadstring(game:GetObjects("rbxassetid://"..id)[1]);
end;

crequire.GetSound = function(id, music_settings)
    local sound = Instance.new("Sound", game:GetService("SoundService"));

    --[[
        -- uncomment it if you're using crequire for Synapse X scripting

        if type(id) ~= "string" then -- sanity check - if id isn't a string ("rbxassetid://idhere") then assume it's a custom asset taken from synapse
            id = getsynasset(id);
        end;
    ]]

    sound.SoundId = id;
    
    if type(music_settings) ~= "table" then -- sanity check - if music_settings isnt a table then load by default volume 5 on the played sound
        sound.Volume = 5;
    elseif type(music_settings) == "table" then
        sound.Volume = music_settings.volume or 5;
        sound.PlaybackLoudness = music_settings.distortion or sound.PlaybackLoudness;
        sound.PlaybackSpeed = music_settings.pitch or 1;
        sound.Looped = music_settings.loop or false;
    end;

    sound:Play();
    task.wait(sound.TimeLength);
    sound:Destroy();
end;

--[[

-- uncomment it if you're using crequire for configuration making in script hubs

crequire.GetFile = function(file, destined_use)
    local required_file = readfile(file);

    if type(destined_use) ~= "string" then return nil end; -- sanity check - if the destined_use arg isn't string then don't bother

    if destined_use == "load table" then
        local result = game:GetService("HttpService"):JSONDecode(required_file);
        return result;
    elseif destined_use == "loadstring" then
        loadstring(game:HttpGet(tostring(required_file)))();
    end;
end;

]]

crequire.Module = function(path)
    return require(path);
end;

crequire.EditModule = function(path, input, value)
    if table.find(crequire.Module(path), input) then
        crequire.Module(path)[input] = value;
    end;
end;

--[[


example of use for all of those:

-- crequire.EditModule:
        local crequire = loadstring(game:HttpGet("link for crequire here"))();
        local module = crequire.Module(game:GetService("ReplicatedStorage").Modules.SuitModule);
        crequire.EditModule(module, ["Mark 33"].FlightSpeed, 3600);

-- crequire.Module:
        local crequire = loadstring(game:HttpGet("link for crequire here"))();
        local module = crequire.Module(game:GetService("ReplicatedStorage").Modules.RaycastHitboxV3);

        for i, v in pairs(module) do
            print(i, v);
        end;

-- crequire.GetFile:
       local crequire = loadstring(game:HttpGet("link for crequire here"))();
       local config = crequire.GetFile("example_config.json", "load table");

       for i, v in next, config do
            print(i, v);
       end;

-- crequire.GetSound:
        local crequire = loadstring(game:HttpGet("link for crequire here"))();
        local audio = 1234567890;

        crequire.GetSound(audio, {
            volume = 8;
            looped = true;
        });

-- crequire.GetObjects:
        local crequire = loadstring(game:HttpGet("link for crequire here"))();
        crequire.GetObjects(123456789);

]]

return crequire;
