--[[
    GD50
    Match-3 Remake

    -- Tile Class --

    Author: Colton Ogden
    cogden@cs50.harvard.edu

    The individual tiles that make up our game board. Each Tile can have a
    color and a variety, with the varietes adding extra points to the matches.
]]

Tile = Class{}

function Tile:init(x, y, color, variety)
    
    -- board positions
    self.gridX = x
    self.gridY = y

    -- coordinate positions
    self.x = (self.gridX - 1) * 32
    self.y = (self.gridY - 1) * 32

    -- tile appearance/points
    self.color = color
    self.variety = variety

    -- different shapes with different scores
    -- flat worth 50, and increases by 10 as we go to the right
    self.worth = 40 + self.variety*10

    if math.random(10) == 1 then 
        self.shiny = true
    else
        self.shiny = false 
    end
end

function Tile:gatherPoints()
    local temp = self.worth 
    self.worth = 0 
    return temp
end

function Tile:render(x, y)
    
    -- draw shadow
    love.graphics.setColor(34, 32, 52, 255)
    love.graphics.draw(gTextures['main'], gFrames['tiles'][self.color][self.variety],
        self.x + x + 2, self.y + y + 2)

    -- draw tile itself
    love.graphics.setColor(255, 255, 255, 255)
    love.graphics.draw(gTextures['main'], gFrames['tiles'][self.color][self.variety],
        self.x + x, self.y + y)

    -- love.graphics.print(self.color, self.x+x, self.y+y)

    -- draw the shine 
    if self.shiny then 
        love.graphics.print('S', self.x+x, self.y+y, -0.2, 0.8, 0.8)
    end
end