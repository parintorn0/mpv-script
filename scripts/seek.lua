local mp = require("mp")

local seekStep=5

function goLeft()
    local point=mp.get_property_number("time-pos")-seekStep
    if point <= 0 then
        point=0
    end
    mp.set_property_native("time-pos", point)
end

function goRight()
    local point=mp.get_property_number("time-pos")+seekStep
    if point >= mp.get_property_number("duration") then
        point=0;
    end
    mp.set_property_native("time-pos", point)
end

function prevFrame()
    mp.command("frame-back-step")
end

function nextFrame()
    mp.command("frame-step")
end

mp.add_forced_key_binding("LEFT", "LEFT", goLeft)
mp.add_forced_key_binding("RIGHT", "RIGHT", goRight)
mp.add_forced_key_binding("d", "d", prevFrame)
mp.add_forced_key_binding("f", "f", nextFrame)