
WINDOW_HEIGTH = 720
WINDOW_WIDTH = 1280

VIRTUAL_HEIGTH = 245
VIRTUAL_WIDTH = 430

function love.load()

love.window.setTitle('Ping Pong')

Player1_Pos = 40
Player2_Pos = 475

Player1_score = 0
Player2_score = 0

Ball_X = 400                                                                    --[[ball x cordinate position]]
Ball_Y = 260                                                                    --[[ball y cordinate position]]

Ball_dx = math.random(2) == 1 and 150 or -150
--Ball_dx = math.random(-50,50)
Ball_dy = math.random(-50,50)

math.randomseed(os.time())

gamestate = 'start'

end

function love.update(dt)

   if love.keyboard.isDown('r') then                                            --[[Player1 paddle moves upward]]

     Player1_Pos = Player1_Pos - 200 * dt
     Player1_Pos = math.max(Player1_Pos , VIRTUAL_HEIGTH-235)                   --[[to limit the movement of paddle]]

   else if love.keyboard.isDown('f') then                                       --[[Player1 paddle moves downward]]

     Player1_Pos = Player1_Pos + 200 * dt
     Player1_Pos = math.min(Player1_Pos , VIRTUAL_HEIGTH + 265)
  end                                                                           --[[end for if]]

end                                                                             --[[end for elseif]]

   if love.keyboard.isDown('down') then                                         --[[Player2 paddle moves downward]]

     Player2_Pos = Player2_Pos + 200 * dt
     Player2_Pos = math.min(Player2_Pos, VIRTUAL_HEIGTH + 265)

   else if love.keyboard.isDown('up') then                                      --[[Player1 paddle moves upward]]

     Player2_Pos = Player2_Pos - 200 * dt
     Player2_Pos = math.max(Player2_Pos, VIRTUAL_HEIGTH - 235)
  end                                                                           --[[end for if]]

end                                                                             --[[end for elseif]]

   if gamestate == 'play' then

     Ball_X = Ball_X + Ball_dx * dt                                              --[[when enter is pressed ball start moving]]
     Ball_Y = Ball_Y + Ball_dy * dt

   end



  if Ball_Y <= 0 then

    Ball_Y = 0
    Ball_dy = - Ball_dy

  end

  if Ball_Y >= VIRTUAL_HEIGTH +330  then

    Ball_Y =  VIRTUAL_HEIGTH +330
    Ball_dy = - Ball_dy

  end


   if (Ball_X > 750 + 20) or (750 > Ball_X + 5) or (Ball_Y > Player2_Pos + 85) or (Player2_Pos > Ball_Y + 5)  then

   else
     Ball_dx = -Ball_dx * 1.04
     Ball_dy = math.random(-100,100)                                               --[[collision detected]]

   end

   if (Ball_X > 30 + 20) or (30 > Ball_X + 5 ) or (Ball_Y > Player1_Pos + 85) or (Player1_Pos > Ball_Y + 5) then

   else
      Ball_dx = -Ball_dx * 1.04
       Ball_dy = math.random(-100,100)
    end

    if (Ball_X > 750 + 20)  then
       Player1_score = Player1_score + 1
       Ball_X = 400
       Ball_Y = 260
       gamestate ='start'

    else if (Ball_X < -10) then
       Player2_score = Player2_score + 1
       Ball_X = 400
       Ball_Y = 260
       gamestate ='start'

     end

   end



end                                                                             --[[end for function]]


function love.keypressed(key)

if key == 'escape' then
  love.event.quit()
end

if key == 'space' then
  if gamestate =='play' then
    gamestate = 'pause'
  else
    gamestate ='play'

  end
end

   if key == 'return' then
      if gamestate == 'start' then
        gamestate = 'play'

      else
        gamestate = 'start'


   Ball_X = 400                                                                    --[[ball x cordinate position]]
   Ball_Y = 260                                                                    --[[ball y cordinate position]]

   Ball_dx = math.random(2) == 1 and 100 or -100

   Ball_dy = math.random(-50,50) * 2

   end

   end

end



function love.draw()

love.graphics.printf("Hello Pong",150,10,500,'center')

love.graphics.printf(tostring(Player1_score),VIRTUAL_WIDTH/2-50 ,VIRTUAL_HEIGTH/3 - 40,400,'left')

love.graphics.printf(tostring(Player2_score),180,40,400,'right')

love.graphics.rectangle('fill', 30, Player1_Pos, 20, 85)                        --[[paddle1 position & dimension]]

love.graphics.rectangle('fill', 750, Player2_Pos, 20, 85)                       --[[paddle2 position & dimension]]

love.graphics.rectangle('fill', Ball_X, Ball_Y, 15, 15)                         --[[Ball position & dimension]]

if Player1_score == 10 then
  love.graphics.printf(tostring("Player1 won"),VIRTUAL_WIDTH/2,VIRTUAL_HEIGTH/2,400,'center')

else if Player2_score == 10 then
    love.graphics.printf(tostring("Player2 won"),VIRTUAL_WIDTH/2,VIRTUAL_HEIGTH/2,400,'center')

  end
end

end
