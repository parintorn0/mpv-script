local state="forward"
function prevVideo()
    local current=(mp.get_property_native("playlist-current-pos")-1)%mp.get_property_native("playlist-count")
    mp.set_property_native("playlist-pos", current)
end

function nextVideo()
    local current=(mp.get_property_native("playlist-current-pos")+1)%mp.get_property_native("playlist-count")
    mp.set_property_native("playlist-pos", current)
    if state=="forward" then
        mp.set_property_native("play-direction", state)
        state="backward"
    else
        mp.set_property_native("play-direction", state)
        state="forward"
    end
end

-- function goNext()
--     if mp.get_property_number("duration")==nil then
--         return
--     end
--     if (mp.get_property_number("time-pos")<=0.1 and state=="backward") or (mp.get_property_number("time-pos")>=mp.get_property_number("duration")-0.1 and state=="forward") then
--         nextVideo()
--     end
-- end

mp.add_forced_key_binding("PGUP", "PGUP", prevVideo)
mp.add_forced_key_binding("PGDWN", "PGDWN", nextVideo)

-- mp.observe_property("time-pos", "number", goNext)