local ProceduralBars = {}

ProceduralBars.__index = ProceduralBars

function ProceduralBars:new(world)
    return setmetatable({
        elapsedTime = 0,
        world = world,
        Bar = require "models.entities.Bar",
        leftBars = {},
        rightBars = {}
    }, ProceduralBars)
end

function ProceduralBars:removeBar(bar, left)
    local bars = left and self.leftBars or self.rightBars
    for index = 1, #bars do
        if bars[index] == bar then
            table.remove(bars, index)
            index = #bars + 2
            return true
        end
    end
    return false
end

function ProceduralBars:update(dt)
    self.elapsedTime = self.elapsedTime + dt
    if self.elapsedTime > 0.5 then
        table.insert(self.leftBars, self.Bar:new(self.world, 10, 100, 20, 200, 100))
        table.insert(self.rightBars, self.Bar:new(self.world, 470, 900, 20, 200, -100))
        self.elapsedTime = 0
    end
    for index, bar in pairs(self.leftBars) do
        bar:update(dt)
    end
    for index, bar in pairs(self.rightBars) do
        bar:update(dt)
    end
end

function ProceduralBars:draw()
    for index, bar in pairs(self.leftBars) do
        bar:draw()
    end
    for index, bar in pairs(self.rightBars) do
        bar:draw()
    end
end

return ProceduralBars
