local mp = require("mp")

local seekStep=5

function seek(isLeft ,isCtrl)
    if(isCtrl) then
        seekStep=2.5;
    end
    if(isLeft) then
        seekStep=-seekStep;
    end
    local point=mp.get_property_number("time-pos")+seekStep
    if point <= 0 or point >= mp.get_property_number("duration") then
        point=0
    end
    mp.set_property_native("time-pos", point)
end

function goLeft()
    seek(true, false)
end

function goRight()
    seek(false, false)
end

function goHalfLeft()
    seek(true, true)
end

function goHalfRight()
    seek(false, true)
end

function prevFrame()
    mp.command("frame-back-step")
end

function nextFrame()
    mp.command("frame-step")
end

mp.add_forced_key_binding("LEFT", goLeft)
mp.add_forced_key_binding("RIGHT", goRight)
mp.add_forced_key_binding("d", prevFrame)
mp.add_forced_key_binding("f", nextFrame)
mp.add_forced_key_binding("ctrl+LEFT", goHalfLeft)
mp.add_forced_key_binding("ctrl+RIGHT", goHalfRight)
