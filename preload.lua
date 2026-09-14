local mod = game.mod_runtime[game.current_mod]

-- Public cross-mod registration interface.
mod.external_prompts = {}

mod.register_prompts = function(item_id, choices)
    if type(item_id) ~= "string" then
        return false
    end
    if type(choices) ~= "table" or #choices == 0 then
        return false
    end

    mod.external_prompts[item_id] = choices
    return true
end

game.iuse_functions["INSPECT_ITEM"] = function(...)
    return mod.inspect_item(...)
end
