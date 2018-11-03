
if settings.startup["deco-shred-create-shrine-offer"].value then

  local satteliteTechnologyName = "rocket-silo"

  if settings.startup["deco-shred-create-tech"].value then
    data:extend({
      {
        type = "technology",
        name = "shrine-offering",
        icon = data.raw["item"]["offering-shred-1"].icon,
        icon_size = data.raw["item"]["offering-shred-1"].icon_size,

        prerequisites = {
          "deco-shred",
          satteliteTechnologyName,
        },

        effects = {},

        unit =
        {
          count = data.raw["item"]["satellite"].rocket_launch_product[2] or 1000,
          ingredients =
          {
            {"science-pack-1", 1},
            {"science-pack-2", 1},
            {"science-pack-3", 1},
            {"military-science-pack", 1},
            {"production-science-pack", 1},
            {"high-tech-science-pack", 1},
            {"space-science-pack", 1},
          },
          time = 60,
        },
      },
    })

    satteliteTechnologyName = "shrine-offering"
  end

  for _,decoName in pairs({
    "shred",
    "santa",
    "inter",
    "voske",
    "east",
  }) do
    local offeringName = "offering-"..decoName.."-1"
    if data.raw.recipe[offeringName] then

      data.raw["recipe"][offeringName].enabled = false
      table.insert(data.raw["technology"][satteliteTechnologyName].effects, {type = "unlock-recipe", recipe = offeringName})
      
    end
  end

end
