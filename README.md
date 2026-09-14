# Cataclysm Inspect Mod

DISCLAIMER: Designed for C:BN. I can't say if it works with DDA.

This mod provides a new `USE_ACTION` to the game for displaying a random item-specific prompt as a non-vocal message. Basically, in the same way the Killer Drive trait has you tell yourself that you need to kill.

## How it works

You can put it on anything. When an item using the `INSPECT_ITEM` use_action is activated, the Lua code:

1. Gets the item's unique ID.
2. Uses that ID to parse the prompt category with the matching ID from `prompts.lua`.
3. Chooses one prompt at random.
4. Displays it with `gapi.add_msg()`.

These prompts are Lua strings instead of snippets, unlike newspaper or talking dolls.

## How to add Inspect to your item!

Step 1: Add the use_action to your item's json:

```
"id": "fluffy_toy_inhaler,
"use_action": [ "INSPECT_ITEM" ]
```

Like any multi-use item, you can add it alongside other "use_action"s.

```
"id": "fluffy_toy_inhaler,
"use_action": [ "INSPECT_ITEM", "PLAY_GAME", "INHALER" ]
```

Step 2: Add a prompt category in prompts.lua whose key exactly matches the item's type ID:

```
return {
    your_item_id = {
        "What I want to describe about the object.",
        "Could be lore, relevant thoughts, tactile sensations or visuals."
    },

    fluffy_toy_inhaler = {
        "The little manufacturing sticker comes off as you play with the inhaler in your hands.",
        "You wonder if you'll ever find yourself inhaling some strands of fluff when you least expect.",
        "...It'd probably be best to wash it often with how often you wind up with pink strands in your mouth.",
        "You give it a soft squeeze.",
        "It's absurdly pink."
    }
}
```
Remember to put [ "inspectmod" ] as a dependency for your mod so that it loads first.
And you're done.

# TODO:
- Prompt rarities
- Prompts locked behind favoriting the item
- MAYBE an alternate INSPECT_ITEM called COMFORT, which allows you to do a less lewd version of VIBRATOR for morale bonuses.
- ...And perhaps an alternate of COMFORT called COMFORT_SELF which is a halfway between the two, for the more obviously lewd items.
