Powerup = Class{}

function Powerup:init(type) 
    self.skin = math.random(10)

    self.height = 16 
    self.width = 16

    -- generate it at the top of the window
    self.x = math.random(0, VIRTUAL_WIDTH)
    self.y = 0

    -- slowly fall down 
    self.dx = 0 
    self.dy = 10

    -- behaviour and skin depends on type
    self.type = type 

    -- we can delete / ignore if out of play 
    self.inPlay = true 
end 

function Powerup:update()
    self.y = self.y + self.dy 
end 

--[[
    Copied from the Ball class 
    target should be paddle 
]]
function Powerup:collides(target)
    -- first, check to see if the left edge of either is farther to the right
    -- than the right edge of the other
    if self.x > target.x + target.width or target.x > self.x + self.width then
        return false
    end

    -- then check to see if the bottom edge of either is higher than the top
    -- edge of the other
    if self.y > target.y + target.height or target.y > self.y + self.height then
        return false
    end 

    -- if the above aren't true, they're overlapping
    return true
end