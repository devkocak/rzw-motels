if GetResourceState('ox_inventory') ~= 'started' then return end

OpenStash = function(data,identifier)
    -- TriggerEvent('ox_inventory:openInventory', 'stash', {id = 'stash_'..data.motel..'_'..identifier..'_'..data.index, name = 'Storage', slots = 70, weight = 70000, coords = GetEntityCoords(cache.ped)})
    TriggerEvent('ox_inventory:openInventory', 'stash', {id = 'stash_yume_rusun_'..identifier, name = 'Storage', slots = 100, weight = 2500000, coords = GetEntityCoords(cache.ped)})
end