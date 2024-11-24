--- STEAMODDED HEADER
--- MOD_NAME: LQXY's mod
--- MOD_ID: LQXY_77
--- MOD_AUTHOR: [LQXY_77]
--- MOD_DESCRIPTION: LQXY's mod.
--- PREFIX: lqxy
----------------------------------------------
------------MOD CODE -------------------------

SMODS.Atlas{
    key = 'Jokers',
    path = 'Jokers.Png',
    px = 71,
    py = 95
}

SMODS.Atlas({
	key = "modicon",
	path = "ModIcon.png",
	px = 16,
	py = 16,
}):register()


    SMODS.Joker{
        key = 'joker2',
        loc_txt = {
            name = 'Silly cat',
            text = {
            '{X:mult,C:white}X#1#{} Mult',
            '{C:dark_edition,s:0.5}so silly!!!{}'
            }
        },
        atlas = 'Jokers',
        rarity = 1, --rarity: 1 = Common, 2 = Uncommon, 3 = Rare, 4 = Legendary
        --soul_pos = { x = 0, y = 0 },
        cost = 4, --cost
        unlocked = true, --where it is unlocked or not: if true, 
        discovered = true, --whether or not it starts discovered
        blueprint_compat = true, --can it be blueprinted/brainstormed/other
        eternal_compat = true, --can it be eternal
        perishable_compat = true, --can it be perishable
        pos = {x = 0, y = 0},
        config = {
            extra = {
                Xmult = 1.5
            }
        },
        loc_vars = function(self,info_queue,center)
            return {vars = {center.ability.extra.Xmult}}
        end,
        calculate = function(self,card,context)
            if context.joker_main then
                return {
                    card = card,
                    Xmult_mod = card.ability.extra.Xmult,
                    message = 'X' .. card.ability.extra.Xmult,
                    colour = G.C.MULT
                }
            end
        end
    }
----------------------------------------------
------------MOD CODE END----------------------
    