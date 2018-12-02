local SplashScreen = {}

SplashScreen.__index = SplashScreen

function SplashScreen:new()
    local this = {
        splash_company = love.graphics.newImage("assets/company_logo.png"),
        splash_loveLogo = love.graphics.newImage("assets/engine_logo.png"),
        all = {"splash_company", "splash_loveLogo"},
        current = 1,
        elapsedTime = 0
    }
    
    return setmetatable(this, SplashScreen)
end

function SplashScreen:mousepressed(x, y, button)
    self.elapsedTime = 3
end

function SplashScreen:update(dt)
    sceneDirector:clearStack("inGame")
    self.elapsedTime = self.elapsedTime + dt
    if self.elapsedTime > 2 then
        self.current = self.current + 1
        self.elapsedTime = 0
        if self.current > #self.all then
            sceneDirector:clearStack("inGame")
        end
    end
end

function SplashScreen:draw()
    local item = self.all[self.current]
    if item then
        love.graphics.draw(self[item], 1, 1, 0, love.graphics.getWidth() / 2, love.graphics.getHeight() / 2)
    end
end

return SplashScreen
