PauseState = Class{__includes = BaseState}

pauseIcon = love.graphics.newImage('pause.png') 

function PauseState:init() 
    -- save PlayState vars
    self.x = 0 
end 

function PauseState:update(dt) 
    -- if p is pressed again, go back to play
    if love.keyboard.wasPressed('p') then
        gStateMachine:change('play')
    end
end 

function PauseState:render() 
    love.graphics.draw(pauseIcon, (VIRTUAL_WIDTH-pauseIcon:getWidth())/2, (VIRTUAL_HEIGHT-pauseIcon:getHeight())/2)
end