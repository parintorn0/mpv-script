local mp = require("mp")

local volumeStep=5

function volumeDown()
    local volume=mp.get_property_number("volume")-volumeStep;
    if volume<=0 then
        volume=0
    end
    mp.set_property_native("volume", volume)
end

function volumeUp()
    local volume=mp.get_property_number("volume")+volumeStep;
    if volume>=100 then
        volume=100
    end
    mp.set_property_native("volume", volume)
end

mp.add_forced_key_binding("DOWN", "DOWN", volumeDown)
mp.add_forced_key_binding("UP", "UP", volumeUp)