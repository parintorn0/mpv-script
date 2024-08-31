local mp = require("mp")

function prevVideo()
    mp.command("")
end

function prevVideo()
    local current=(mp.get_property_native("playlist-current-pos")-1)%mp.get_property_native("playlist-count")
    mp.set_property_native("playlist-pos", current)
end

function nextVideo()
    local current=(mp.get_property_native("playlist-current-pos")+1)%mp.get_property_native("playlist-count")
    mp.set_property_native("playlist-pos", current)
end

mp.add_forced_key_binding("PGUP", "PGUP", prevVideo)
mp.add_forced_key_binding("PGDWN", "PGDWN", nextVideo)