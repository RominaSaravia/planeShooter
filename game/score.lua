--! file: score.lua
Score = Object:extend()

function Score:new()
  self.points = 0
  self.x = 0 
  self.y = 550


end


function Score:update(dt)

end


function Score:draw()
  local window_width = love.graphics.getWidth()
  local fontScore = love.graphics.newFont( "/font/Pompiere-Regular.ttf",30 )
  local fontScore = love.graphics.newText( fontScore,"Score: " .. self.points )

  love.graphics.draw( fontScore,  window_width/2.5 , self.y)


end