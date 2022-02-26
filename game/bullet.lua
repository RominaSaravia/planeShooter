--! file: bullet.lua

Bullet = Object:extend()

function Bullet:checkCollision(obj,score)
  local self_left = self.x
  local self_right = self.x + self.width
  local self_top = self.y
  local self_bottom = self.y + self.height

  local obj_left = obj.x
  local obj_right = obj.x + obj.width
  local obj_top = obj.y
  local obj_bottom = obj.y + obj.height

  if  self_right > obj_left
      and self_left < obj_right
      and self_bottom > obj_top
      and self_top < obj_bottom then
      self.dead = true
      score.points = score.points + 1

    --Increase enemy speed
    if obj.speed > 0 then
      obj.speed = obj.speed + 50
    else
      obj.speed = obj.speed - 50
    end

  end
end



function Bullet:new(x,y)
    self.image = love.graphics.newImage("assets/bullet.png")
    self.x = x
    self.y = y
    self.speed = 700
    
    self.width = self.image:getWidth()
    self.height = self.image:getHeight()


end



function Bullet:update(dt)
  self.y = self.y + self.speed * dt

  --If the bullet is out of the screen
  if self.y > love.graphics.getHeight() then
      --Restart the game
      love.load()
  end


end



function Bullet:draw()
    love.graphics.draw(self.image, self.x, self.y)
end