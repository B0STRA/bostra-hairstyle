Config = {
    QB = true, --true for QB Notify and item use, false for ESX item use.  idk esx, I looked at some code and threw it in PRs welcome. 
    Notify = "QB", -- "QB" for QBCore Notify, "OX" for ox_lib
    Items = true, --Use items to style hair, if false, use /hathair POSITION
    ItemName = "hairspray", 
    Command = true,
    CommandName = "hathair", --   for command use
    PropName = "bostra_hairspray",
    Male = {
        Hair1 = {
            Position = 1, -- POSTION NEEDS TO MATCH THE INTEGER FOLLOWING HAIR, IE: Hair1 = 1, Hair2 = 2, Hair3 = 3
            Drawable = 0, -- Drawable ID of your hair model 
            Title = "Slicked Back Hair", 
            Description = "Style your hair and slick it back.",
        },
        Hair2 = {
            Position = 2, -- POSTION NEEDS TO MATCH THE INTEGER FOLLOWING HAIR, IE: Hair1 = 1, Hair2 = 2, Hair3 = 3
            Drawable = 27,
            Title = "Faux-Hawk Hair",
            Description = "Style your hair into a faux-hawk.",
        },
        Hair3 = {
            Position = 3, -- POSTION NEEDS TO MATCH THE INTEGER FOLLOWING HAIR, IE: Hair1 = 1, Hair2 = 2, Hair3 = 3
            Drawable = 12,
            Title = "Bald Fade Hair",
            Description = "Style your hair into a bald fade.",
        },
    },
    Female = {
        Hair1 = {
            Position = 1, -- POSTION NEEDS TO MATCH THE INTEGER FOLLOWING HAIR, IE: Hair1 = 1, Hair2 = 2, Hair3 = 3
            Drawable = 20,
            Title = "Short Bob Hair",
            Description = "Style your hair into a short bob.",
        },
        Hair2 = {
            Position = 2, -- POSTION NEEDS TO MATCH THE INTEGER FOLLOWING HAIR, IE: Hair1 = 1, Hair2 = 2, Hair3 = 3
            Drawable = 21,
            Title = "Pixie Hair",
            Description = "Style your hair into a pixie cut.",
        },
        Hair3 = {
            Position = 3, -- POSTION NEEDS TO MATCH THE INTEGER FOLLOWING HAIR, IE: Hair1 = 1, Hair2 = 2, Hair3 = 3
            Drawable = 22,
            Title = "Braided Mohawk Hair",
            Description = "Style your hair into a braided mohawk.",
        },
    },
}
