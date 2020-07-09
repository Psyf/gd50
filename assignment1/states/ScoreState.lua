--[[
    ScoreState Class
    Author: Colton Ogden
    cogden@cs50.harvard.edu

    A simple state used to display the player's score before they
    transition back into the play state. Transitioned to from the
    PlayState when they collide with a Pipe.
]]

ScoreState = Class{__includes = BaseState}

--[[
    When we enter the score state, we expect to receive the score
    from the play state so we know what to render to the State.
]]
function ScoreState:enter(params)
    self.score = params.score
end

function ScoreState:update(dt)
    -- go back to play if enter is pressed
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateMachine:change('countdown')
    end
end

function drawMedal(score)
    if score == 0 then 
        return 
    else
        if score == 1 then 
            medal = love.graphics.newImage('medals/bronze.png')
        elseif score == 2 then  
            medal = love.graphics.newImage('medals/silver.png')
        else
            medal = love.graphics.newImage('medals/gold.png')
        end

        love.graphics.draw(medal, (VIRTUAL_WIDTH - medal:getWidth())/2, (VIRTUAL_HEIGHT - medal:getHeight())/2)
    end
end

function ScoreState:render()
    -- simply render the score to the middle of the screen
    love.graphics.setFont(flappyFont)
    love.graphics.printf('Oof! You lost!', 0, 54, VIRTUAL_WIDTH, 'center')

    love.graphics.setFont(mediumFont)
    love.graphics.printf('Score: ' .. tostring(self.score), 0, 90, VIRTUAL_WIDTH, 'center')
    
    -- displaying medal 
    drawMedal(self.score)

    love.graphics.printf('Press Enter to Play Again!', 0, 190, VIRTUAL_WIDTH, 'center')
end