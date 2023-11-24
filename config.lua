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
            Title = "Bald Fade Hair1",
            Description = "Style your hair into a bald fade.",
        },
        Hair4 = {
            Position = 4, -- POSTION NEEDS TO MATCH THE INTEGER FOLLOWING HAIR, IE: Hair1 = 1, Hair2 = 2, Hair3 = 3
            Drawable = 13,
            Title = "Bald Fade Hair2",
            Description = "Style your hair into a bald fade.",
        },
        Hair5 = {
            Position = 5, -- POSTION NEEDS TO MATCH THE INTEGER FOLLOWING HAIR, IE: Hair1 = 1, Hair2 = 2, Hair3 = 3
            Drawable = 114,
            Title = "Bald Fade Hair3",
            Description = "Style your hair into a bald fade.",
        },
        Hair6 = {
            Position = 6, -- POSTION NEEDS TO MATCH THE INTEGER FOLLOWING HAIR, IE: Hair1 = 1, Hair2 = 2, Hair3 = 3
            Drawable = 15,
            Title = "Bald Fade Hair4",
            Description = "Style your hair into a bald fade.",
        },
        Hair7 = {
            Position = 7, -- POSTION NEEDS TO MATCH THE INTEGER FOLLOWING HAIR, IE: Hair1 = 1, Hair2 = 2, Hair3 = 3
            Drawable = 16,
            Title = "Bald Fade Hair5",
            Description = "Style your hair into a bald fade.",
        },
        Hair8 = {
            Position = 8, -- POSTION NEEDS TO MATCH THE INTEGER FOLLOWING HAIR, IE: Hair1 = 1, Hair2 = 2, Hair3 = 3
            Drawable = 17,
            Title = "Bald Fade Hair6",
            Description = "Style your hair into a bald fade.",
        },
        Hair9 = {
            Position = 9, -- POSTION NEEDS TO MATCH THE INTEGER FOLLOWING HAIR, IE: Hair1 = 1, Hair2 = 2, Hair3 = 3
            Drawable = 18,
            Title = "Bald Fade Hair7",
            Description = "Style your hair into a bald fade.",
        },
        Hair10 = {
            Position = 10, -- POSTION NEEDS TO MATCH THE INTEGER FOLLOWING HAIR, IE: Hair1 = 1, Hair2 = 2, Hair3 = 3
            Drawable = 19,
            Title = "Bald Fade Hair8",
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
            Drawable = 163,
            Title = "Low-Tight Pony",
            Description = "Style your hair into a low and tight ponytail.",
        },
        Hair3 = {
            Position = 3, -- POSTION NEEDS TO MATCH THE INTEGER FOLLOWING HAIR, IE: Hair1 = 1, Hair2 = 2, Hair3 = 3
            Drawable = 22,
            Title = "Low-Loose Bun",
            Description = "Style your hair into a low and loose bun.",
        },
    },
}
