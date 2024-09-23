local aPoint=0
local bPoint=nil
local looping=true
local isReverse=true
local reversing=true


function setA()
    aPoint=mp.get_property_number("time-pos")
end

function setB()
    if mp.get_property_number("time-pos")>aPoint then
        bPoint=mp.get_property_number("time-pos")
    end
end

function loop()
    if bPoint==nil then
        return
    end
    if mp.get_property_number("time-pos") >= bPoint then
        if looping then
            mp.set_property_native("time-pos", aPoint)
        else
            if isReverse and reversing==false then
                mp.set_property_native("play-direction", "backward")
                reversing=true
                mp.set_property_native("time-pos", bPoint)
                mp.command("play")
            end
        end
    elseif mp.get_property_number("time-pos") <= aPoint and isReverse and reversing then
        mp.set_property_native("play-direction", "forward")
        reversing=false
        mp.set_property_native("time-pos", aPoint)
        mp.command("play")
    end
end

function options()
    isReverse= not isReverse
end

function resetA()
    aPoint=0
end

function resetB()
    bPoint=mp.get_property_number("duration")
end

function toggleLoop()
    looping= not looping
end

function seektoA()
    mp.set_property_native("time-pos", aPoint)
end

function check()
    print(mp.get_property_number("duration"))
end

function checkDuration()
    if mp.get_property_number("duration")~=nil and bPoint==nil then
        bPoint=mp.get_property_number("duration")
    end
end

mp.observe_property("time-pos", "string", loop)
mp.observe_property("duration", "number", checkDuration)

mp.add_forced_key_binding("l", "l", options)
mp.add_forced_key_binding("[", "[", setA)
mp.add_forced_key_binding("]", "]", setB)
mp.add_forced_key_binding("{", "{", resetA)
mp.add_forced_key_binding("}", "}", resetB)
mp.add_forced_key_binding("\\", "\\", toggleLoop)

mp.add_forced_key_binding(".", ".", seektoA)
mp.add_forced_key_binding(",", "", seektoA)


mp.add_forced_key_binding("u", "", check)
-- mp.set_property_native("play-direction", "backward")