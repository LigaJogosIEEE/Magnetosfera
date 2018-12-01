local World ={}

World.__index = World

function World:new()
    love.physics.setMeter(32)
    local world = love.physics.newWorld(0, 0, 0)

    world:setCallbacks(startContact, finishContact)

    return setmetatable({world = world}, World)
end

return World