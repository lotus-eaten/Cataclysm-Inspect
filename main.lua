local mod = game.mod_runtime[game.current_mod]
local prompts = require("./prompts")

mod.inspect_item = function(params)
    local item = params.item

    if not item then
        return 0
    end

    local item_id = item:get_type():str()
    local choices = prompts[item_id]

    if not choices or #choices == 0 then
        return 0
    end

    gapi.add_msg(choices[math.random(#choices)])

    return 0
end
