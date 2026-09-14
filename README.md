Cataclysm Inspect Mod

DISCLAIMER: Designed for C. I can't say if it works with DDA.

This mod provides a new USE_ACTION to the game for displaying a random item-specific prompt as a non-vocal message. Basically, in the same way the Killer Drive trait has you tell yourself that you need to kill.

How it works

You can put INSPECT_ITEM on any item. When an item using the INSPECT_ITEM use_action is activated, the Lua code:

Gets the item's unique type ID.
Uses that ID to find a matching prompt category.
Chooses one prompt at random.
Displays it with gapi.add_msg().

These prompts are Lua strings instead of snippets, unlike what newspapers or talking dolls use.

# How to add Inspect functionality into your own mod
"Cataclysm Pillow Talk", my follow-up mod, is the best example of this if you need a reference.

Step 1: Make Inspect a dependency:

Make sure your mod's modinfo.json lists inspectmod as a dependency:

{
    "dependencies": [ "bn", "inspectmod" ]
}

Step 2: Create a prompts.lua, put your prompts there in the form of categories:

return {
    fluffy_toy_inhaler = {
        "The little manufacturing sticker comes off as you play with the inhaler in your hands.",
        "You wonder if you'll ever find yourself inhaling some strands of fluff when you least expect.",
        "...It'd probably be best to wash it often with how often you wind up with pink strands in your mouth.",
        "You give it a soft squeeze.",
        "It's absurdly pink."
    },

    another_item = {
        "You examine it carefully.",
        "You turn it over in your hands.",
        "It feels familiar."
    }
}

Step 3: Create a preload.lua:

Preloading is necessary to share its prompts with Inspect.

local inspect = game.mod_runtime["inspectmod"]
local prompts = require("./prompts")

if inspect and inspect.register_prompts then
    for item_id, choices in pairs(prompts) do
        inspect.register_prompts(item_id, choices)
    end
end

This connects your mod to Inspect.
You do not need to copy Inspect's main.lua, preload.lua, or prompts.lua into your own mod.

Step 4: Add INSPECT_ITEM to your item

For example:

[
    {
        "id": "fluffy_toy_inhaler",
        "type": "TOOL",
        "name": { "str": "fluffy toy inhaler" },
        "description": "A suspiciously fluffy inhaler.",
        "use_action": [ "INSPECT_ITEM" ]
    }
]

# TODO
- Prompt rarities
- Prompts locked behind favoriting the item
- MAYBE an alternate INSPECT_ITEM called COMFORT, which allows you to do a less lewd version of VIBRATOR for morale bonuses.
- ...And perhaps an alternate of COMFORT called COMFORT_SELF which is a halfway between the two, for the more obviously lewd items.
