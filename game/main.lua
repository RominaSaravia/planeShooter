--! file: main.lua

function love.keypressed(key)
  player:keyPressed(key)
end


---------------------------------------------
function love.load()
  Object = require "classic"
  require "player"
  require "enemy"
  require "bullet"
  
  player = Player()
  enemy = Enemy()
  listOfBullets = {}

  
end


---------------------------------------------
function love.update(dt)
  player:update(dt)
  enemy:update(dt)

  for i,v in ipairs(listOfBullets) do
      v:update(dt)
      v:checkCollision(enemy)

      --If the bullet has the property dead and it's true then..
      if v.dead then
          --Remove it from the list
          table.remove(listOfBullets, i)
      end
  end

end


---------------------------------------------
function love.draw()
  love.graphics.setBackgroundColor(20/255,20/255,80/255)
  love.graphics.print("Shoot de opponent using <SPACE>\nMove with arrows\nIf you miss, the game will restart")
  player:draw()
  enemy:draw()

  for i,v in ipairs(listOfBullets) do
    v:draw()
  end


end