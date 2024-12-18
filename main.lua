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
SMODS.Atlas({
	key = "silly",
	path = "SillyConsume.png",
	px = 71,
	py = 95,
}):register()


    SMODS.Joker{
        key = 'silly-cat',
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


    SMODS.ConsumableType{
        key = 'SillyConsumableType',

        collection_rows = {2,3},
        primary_colour = G.C.BLUE,
        secondary_colour = G.C.GOLD,
        loc_txt = {
            collection = 'Silly Cards',
            name = 'Silly',
            undiscovered = {
                name = 'Undiscovered Silly Card',
                text = {'The silly!!!'}
            }
        },
        shop_rate = 0.15,
    }

    SMODS.UndiscoveredSprite{
        key = 'SillyConsumableType',
        atlas = 'silly',
        pos = {x = 2, y = 0}
    }

    SMODS.Consumable{
        key = 'Silly',
        set = 'SillyConsumableType',
        atlas = "silly",
        pos = {x = 0, y = 0},
        loc_txt = {
            name = "Silly Guy",
            text = {
                'Add {C:dark_edition}Polychrome{} to up to #1# selected cards',
                'and create a Spectral card'
            }
        },
        config = {
            extra = {
                cards = 2,
            }   
        },
        loc_vars = function(self,info_queue, center)
            return {vars = {center.ability.extra.cards}}
        end,
        can_use = function(self,card)
            if G and G.hand then
                if #G.hand.highlighted ~= 0 and #G.hand.highlighted <= 2 then
                    return true
                end
            end
            return false       
        end,
        use = function(self,card,area,copier)
            for i = 1, #G.hand.highlighted do
                G.hand.highlighted[i]:set_edition({polychrome = true}, true)
            end
            
            local newcard = create_card('Spectral', G.consumeables)
            newcard:add_to_deck()
            G.consumeables:emplace(newcard)
        end,
    }
    SMODS.Consumable{
        key = 'Paint',
        set = 'SillyConsumableType',
        atlas = "silly",
        pos = {x = 1, y = 0},
        loc_txt = {
            name = "Silly Paint",
            text = {
                'Add a random edition to #1# selected card',
            }
        },
        config = {
            extra = {
                cards = 1,
            }   
        },
        loc_vars = function(self,info_queue, center)
            return {vars = {center.ability.extra.cards}}
        end,
        can_use = function(self,card)
            if G and G.hand then
                if #G.hand.highlighted ~= 0 and #G.hand.highlighted <= 1 then
                    return true
                end
            end
            return false       
        end,
        use = function(self, card, area, copier)
            if G and G.hand and G.hand.highlighted then
                for i = 1, #G.hand.highlighted do
                    G.hand.highlighted[i]:set_edition(poll_edition('random key', nil, false, true))
                end
            end
        end,
    
    }












----------------------------------------------
------------MOD CODE END----------------------
    