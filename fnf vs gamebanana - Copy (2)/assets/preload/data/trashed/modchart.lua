function start (song)
	print("Song: " .. song .. " @ " .. bpm .. " downscroll: " .. downscroll)

end


function update (elapsed)
    local currentBeat = (songPos / 1000)*(bpm/84)
    if curStep >= 0 and curStep < 10000 then
        for i=0,8 do
            setActorY(_G['defaultStrum'..i..'Y'] + 10 * math.sin((currentBeat + i*0.25) * math.pi), i)
        end
    end

end



function beatHit (beat)

end 

function stepHit (step)


end

function keyPressed (key)

end

function playerTwoTurn()
    camGame:tweenZoom(1.5,(crochet * 4) / 1000)
end

function playerOneTurn()
    camGame:tweenZoom(1,(crochet * 4) / 1000)
end