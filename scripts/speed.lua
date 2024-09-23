require 'io'

function addSpeed()
    mp.set_property_native("speed", mp.get_property_number("speed")+0.1)
    print(mp.get_property_number("speed"))
end

function subtractSpeed()
    mp.set_property_native("speed", mp.get_property_number("speed")-0.1)
    print(mp.get_property_number("speed"))
end

function resetSpeed()
    mp.set_property_native("speed", 1)
    print(mp.get_property_number("speed"))
end

mp.add_forced_key_binding("9", subtractSpeed)
mp.add_forced_key_binding("0", addSpeed)
mp.add_forced_key_binding("BACKSPACE", resetSpeed)
