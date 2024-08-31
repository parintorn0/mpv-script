local mp = require("mp")

local aPoint=0
local bPoint=nil

function setA()
    aPoint=mp.get_property_number("time-pos")
end

function setB()
    if(mp.get_property_number("time-pos")>aPoint) then
        bPoint=mp.get_property_number("time-pos")
    end
end

function loop()
    if bPoint~=nil and aPoint < bPoint and mp.get_property_number("time-pos") >= bPoint then
        mp.set_property_native("time-pos", aPoint)
    end
end

function resetA()
    aPoint=0
end

function resetB()
    bPoint=nil
end

mp.observe_property("time-pos", "string", loop)

mp.add_forced_key_binding("[", "[", setA)
mp.add_forced_key_binding("]", "]", setB)
mp.add_forced_key_binding("{", "{", resetA)
mp.add_forced_key_binding("}", "}", resetB)