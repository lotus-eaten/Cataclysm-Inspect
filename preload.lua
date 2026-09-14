local mod = game.mod_runtime[game.current_mod]

game.iuse_functions["INSPECT_ITEM"] = function(...)
    return mod.inspect_item(...)
end
