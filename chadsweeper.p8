pico-8 cartridge // http://www.pico-8.com
version 42
__lua__

//the pico-8 is 128x128 pixels, but this game operates in text characters
screen_width = 32
screen_height = 20

game_state = "menu" // "menu", "playing", "end"
win_or_lose = "game end" //neutral value to begin with

function _init() //we don't really use this one
end

function _update() // I should possibly be defining _update60 instead to get 60 fps?
  //trivia: the o button character needs an emoji variation selector after it to be interpreted in pico-8 as the right character, and also to not get mangled in the pico-8 internal editor, but the x button character does not... pico-8 is so weird, because I know more about it than the very people who made it, apparently. (see also the fact that their manual is a txt but has random <br>s in it. But I'm using their thing, instead of vice-versa. Oh well. I guess it *is* a fun toy.
  //If you exclude that variation selector, then left button will be detected instead of the O. What a world!
  
  if game_state == "menu" then
    if btnp(🅾️) then
      //TODO: init the entire game for real
      game_state = "playing"
      return
    end
    if btnp(❎) then
      stop()
    end
  end

  if game_state == "playing" then
    //TODO: track player movement and cursor. and mark and dig things
    if btnp(🅾️) then
      win_or_lose = "you win"
      game_state = "end"
    elseif btnp(❎) then
      win_or_lose = "you lose"
      game_state = "end"
    end
    return
  end

  if game_state == "end" then
    if btnp(🅾️) then
      game_state = "menu"
      return
    end
    if btnp(❎) then
      stop()
    end
  end

end

function _draw()
  cls()
  if game_state == "menu" then
    print("Welcome to minesweeper!")
    print("Press 🅾️ (probably bound to z)")
    print("to play and ❎ (x) to quit")
    print ""
    print "(you may then type shutdown to\nquit)\nyou can also alt-f4 or ctrl-q to\nshutdown"
    print "what else? Well, the directional\ncontrols are ⬅️left ⬆️up ⬇️down\n➡️right. You can use mouse." //TODO: mouse
    print "you can also press pause\n(enter/p) and escape to do\npico-8 system stuff."
  end
  
  if game_state == "playing" or game_state == "end" then
    if game_state == "playing" then
      print "🅾️ (z) to dig, ❎ (x) to mark."
    elseif game_state == "end" then
      print(win_or_lose.."! 🅾️: restart ❎: quit")
    end
    //TODO: draw the board and cursor
    
  end
  -- print(@stat(1))  -- print out @STAT(1) at the end of each frame if you want to see perf information (portion of)
end

--[[
//chatgpt-generated code:
-- Constants for grid size
GRID_WIDTH = 6
GRID_HEIGHT = 8
MINE_CHANCE = 0.1

-- Initialize grid with empty values
grid = {}
for y = 1, GRID_HEIGHT do
    grid[y] = {}
    for x = 1, GRID_WIDTH do
        grid[y][x] = 0 -- Default to no mine
    end
end

-- Function to randomly place mines
function place_mines()
    for y = 1, GRID_HEIGHT do
        for x = 1, GRID_WIDTH do
            if rnd() < MINE_CHANCE then
                grid[y][x] = 1 -- Place a mine
            end
        end
    end
end

-- Call function to populate the grid
place_mines()

-- Debug: Print grid to console
function _draw()
    cls()
    for y = 1, GRID_HEIGHT do
        for x = 1, GRID_WIDTH do
            local cell = grid[y][x]
            print(cell, x * 8, y * 8, 7)
        end
    end
end

--]]

print("hello~")
print("HELLO ヘロ")
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
