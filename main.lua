local GameDirector = require "controllers.GameDirector"
larguraTela = love.graphics.getWidth()
alturaTela = love.graphics.getHeight()

function love.load()
    background = love.graphics.newImage("assets/img/background.jpg")
    playMusic = love.audio.newSource("assets/sound/TheBlackParrot_-_High_Hopes.mp3", "static")

    imgBola = love.graphics.newImage ("assets/img/bola.png")

    bola = {}
    love.physics.setMeter(32)
    world = love.physics.newWorld(0, 0, true)
    bola.body = love.physics.newBody(world, 0, 0, "dynamic")
    bola.shape = love.physics.newCircleShape(20, 20, 5)
    bola.fixture = love.physics.newFixture(bola.body, bola.shape)
    bola.velocidade = 1000
    bola.direcao = 5    
end

function love.update(dt)
    world:update(dt)
    movimentos(dt)
end

function love.draw()
    love.graphics.draw(background, 0, 0, 0, 0.5, 0.3)
    love.audio.play(playMusic)

    love.graphics.setColor(255, 0, 0)
	love.graphics.circle("fill", larguraTela / 2, 500, 50, 50)
end

function movimentos (dt)
    if love.keyboard.isDown("right") then
        bola.body:setAngularVelocity(bola.direcao)
    
    elseif love.keyboard.isDown("left") then
        bola.body:setAngularVelocity(bola.direcao)
    else
        bola.body:setAngularVelocity(0)
    end
    if love.keyboard.isDown("up") then
        bola.body:setLinearVelocity(bola.velocidade * math.cos(bola.body:getAngle()), bola.velocidade * math.sin(bola.body:getAngle()))
    
    else
        bola.body:setLinearVelocity(0, 0)
    end
end