local seekStep=5;

function seek(isLeft ,isShift, isCtrl, isAlt)
    if(isShift) then
        seekStep=2.5;
    end
    if(isAlt) then
        seekStep=0.5;
    end
    if(isCtrl) then
        seekStep=0.25;
    end
    if(isLeft) then
        seekStep=-seekStep;
    end
    local point=mp.get_property_number("time-pos")+seekStep
    if point <= 0 or point >= mp.get_property_number("duration") then
        if point >= mp.get_property_number("duration") then
            mp.set_property_native("playlist-pos", (mp.get_property_native("playlist-current-pos")+1)%mp.get_property_native("playlist-count"))
        end
        point=0
    end
    mp.set_property_native("time-pos", point)
    seekStep=5;
end

function goLeft()
    seek(true, false, false, false)
end

function goRight()
    seek(false, false, false, false)
end

function goHalfLeft()
    seek(true, true, false, false)
end

function goHalfRight()
    seek(false, true, false, false)
end

function goLittleLeft()
    seek(true, false, true, false)
end

function goLittleRight()
    seek(false, false, true, false)
end

function goVeryLittleLeft()
    seek(true, false, false, true)
end

function goVeryLittleRight()
    seek(false, false, false, true)
end


function prevFrame()
    mp.command("frame-back-step")
end

function nextFrame()
    mp.command("frame-step")
end


function doNothing()
    return;
end

mp.add_forced_key_binding("LEFT", goLeft)
mp.add_forced_key_binding("RIGHT", goRight)
mp.add_forced_key_binding("d", prevFrame)
mp.add_forced_key_binding("f", nextFrame)
mp.add_forced_key_binding(";", prevFrame)
mp.add_forced_key_binding("\'", nextFrame)
mp.add_forced_key_binding("shift+LEFT", goHalfLeft)
mp.add_forced_key_binding("shift+RIGHT", goHalfRight)
mp.add_forced_key_binding("ctrl+LEFT", goLittleLeft)
mp.add_forced_key_binding("ctrl+RIGHT", goLittleRight)

-- mp.add_forced_key_binding("alt+LEFT", goVeryLittleLeft)
-- mp.add_forced_key_binding("alt+RIGHT", goVeryLittleRight)
mp.add_forced_key_binding("ctrl+alt+LEFT", doNothing)
mp.add_forced_key_binding("ctrl+alt+RIGHT", doNothing)
