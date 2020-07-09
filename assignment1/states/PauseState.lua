PauseState = Class{__includes = BaseState}

pauseIcon = love.graphics.newImage('pause.png') 

function PauseState:init() 
    -- play the pause sound
    sounds['pause']:play()

    -- pause background music as soon as you pause
    sounds['music']:pause()

    -- save PlayState vars
    self.x = 0 
end 

function PauseState:update(dt) 
    -- if p is pressed again, go back to play
    if love.keyboard.wasPressed('p') then

        -- ask play state to reload saved variables
        gStateMachine:change('play')

        -- resume background music 
        sounds['music']:resume()
    end
end 

function PauseState:render() 
    love.graphics.draw(pauseIcon, (VIRTUAL_WIDTH-pauseIcon:getWidth())/2, (VIRTUAL_HEIGHT-pauseIcon:getHeight())/2)
end