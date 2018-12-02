function love.load()
    --set default constants
    love.graphics.setDefaultFilter('nearest', 'nearest')
    gameDirector = require "controllers.GameDirector":new()
    local inGame = require "scenes.InGameScene":new(gameDirector:getWorld().world)
    sceneDirector = gameDirector:getLibrary("MoonJohn"):new(require "scenes.SplashScreen":new())
    --Adding Scenes to SceneDirector

    --[[sceneDirector:addScene("mainMenu", require "scenes.MainMenuScene":new())
    sceneDirector:addScene("credits", require "scenes.CreditsScene":new())
    sceneDirector:addScene("configurations", require "scenes.ConfigurationScene":new())
    sceneDirector:addScene("configureKey", require "scenes.ConfigureKeyScene":new())--]]
    sceneDirector:addScene("inGame", inGame)
end

function love.touchpressed(id, x, y, dx, dy, pressure)
end

function love.touchreleased(id, x, y, dx, dy, pressure)
end

function love.touchmoved(id, x, y, dx, dy, pressure)
end

function love.mousemoved(x, y, dx, dy, istouch)
    sceneDirector:mousemoved(x, y, dx, dy, istouch)
end

function love.mousepressed(x, y, button)
    sceneDirector:mousepressed(x, y, button)
end

function love.mousereleased(x, y, button)
    sceneDirector:mousereleased(x, y, button)
end

function love.wheelmoved(x, y)
    sceneDirector:wheelmoved(x, y)
end

function love.update(dt)
    sceneDirector:update(dt)
end

function love.draw()
    sceneDirector:draw()
end

function love.resize(w, h)
    sceneDirector:resize(w, h)
end
