local util = require("util")

local debug = false
function util.debug_error(string)
  if not debug then return end
  error(string)
end


function util.insert_quality(entity, item_dict, quality)
  if not (entity and entity.valid and item_dict and quality) then return end
  local items = prototypes.item
  local insert = entity.insert
  for name, count in pairs (item_dict) do
    if items[name] then
      insert{name = name, count = count, quality = quality}
    else
      log("Item to insert not valid: "..name)
    end
  end
end

function util.insert_random_quality(entity, item_dict)
  if not (entity and entity.valid and item_dict) then return end
  local items = prototypes.item
  local insert = entity.insert
  for name, count in pairs (item_dict) do
    if items[name] then
      insert{name = name, count = count, quality = util.random_quality()}
    else
      log("Item to insert not valid: "..name)
    end
  end
end

function util.random_quality()
  local qualities = {"normal", "uncommon", "rare", "epic", "legendary"}
  local idx = math.random(1, #qualities)
  return qualities[idx]
end

return util