pico-8 cartridge // http://www.pico-8.com
version 42
__lua__

//the pico-8 is 128x128 pixels, but this game operates in text characters
screen_width = 32
screen_height = 20

game_state = "menu" // "menu", "playing", "end"
win_or_lose = "game end" //neutral value to begin with

cursor_x = 1
cursor_y = 1

a_little_wait = 50

artificial_input_rate_limiter = 20

function _init() //we don't really use this one
end

function _update60() // defining _update60 instead of _update to get 60 fps
  //trivia: the o button character needs an emoji variation selector after it to be interpreted in pico-8 as the right character, and also to not get mangled in the pico-8 internal editor, but the x button character does not... pico-8 is so weird, because I know more about it than the very people who made it, apparently. (see also the fact that their manual is a txt but has random <br>s in it. But I'm using their thing, instead of vice-versa. Oh well. I guess it *is* a fun toy.
  //If you exclude that variation selector, then left button will be detected instead of the O. What a world!
  
  if game_state == "menu" then
    if artificial_input_rate_limiter == 0 then
      artificial_input_rate_limiter = 2
      if btnp(🅾️) then
        //init the entire game for real
        field = {}
        dug = {}
        flag = {}
        for y = 1, screen_height do
          field[y] = {}
          dug[y] = {}
          flag[y] = {}
          for x = 1, screen_width do
            dug[y][x] = 0 -- nothing is dug yet
            flag[y][x] = 0
            if rnd() < 0.1 then // 10% mine chance
              field[y][x] = 1 -- Place a mine
            else
              field[y][x] = 0 -- no mine
            end
          end
        end
        game_state = "playing"
        return
      end
      if btnp(❎) then
        stop()
      end
    else
      artificial_input_rate_limiter -= 1
    end
  end

  if game_state == "playing" then
    if artificial_input_rate_limiter == 0 then //todo: this is just for feel, but it could be improved with some input buffering probably. // actually, come to think of it, the best way to do this type of input is presumably tracking it in smaller amounts and then discretize it. which also lines up pretty well with the idea of using the mouse pointer as well.
      artificial_input_rate_limiter = 2
      if btn(⬅️) and cursor_x > 1 then
        cursor_x -= 1
      end
      if btn(➡️) and cursor_x < screen_width then
        cursor_x += 1
      end
      if btn(⬆️) and cursor_y > 1 then
        cursor_y -= 1
      end
      if btn(⬇️) and cursor_y < screen_height then
        cursor_y += 1
      end
    else
      artificial_input_rate_limiter -= 1
    end
    if btn(🅾️) then
      dug[cursor_y][cursor_x] = 1
      if field[cursor_y][cursor_x] == 1 then
        game_state = "end"
        artificial_input_rate_limiter = a_little_wait
      end
    elseif btnp(❎) then
      if dug[cursor_y][cursor_x] != 1 then
        flag[cursor_y][cursor_x] ^^= 1
      end
    end
    return
  end

  if game_state == "end" then
    if artificial_input_rate_limiter == 0 then
      artificial_input_rate_limiter = 2
      if btnp(🅾️) then
        game_state = "menu"
        artificial_input_rate_limiter = a_little_wait
        return
      end
      if btnp(❎) then
        stop()
      end
    else
      artificial_input_rate_limiter -= 1
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
    print "what else? Well, the directional"
    print "controls are ⬅️left ⬆️up ⬇️down"
    print "➡️right. You can use mouse." //TODO: mouse
    print "you can also press pause\n(enter/p) and escape to do\npico-8 system stuff."
  end
  
  if game_state == "playing" or game_state == "end" then
    if game_state == "playing" then
      print "🅾️ (z) to dig, ❎ (x) to mark."
    elseif game_state == "end" then
      print(win_or_lose.."! 🅾️: restart ❎: quit")
    end
    for y = 1, screen_height do
      for x = 1, screen_width do
        //todo: we have to actually draw, you know, the minesweeper numbers.
        if dug[y][x] == 1 then
          char = field[y][x]
        elseif flag[y][x] == 1 then
          char = "x"
        else
          char = "?"
        end
        print(char, x * 4 - 4, y * 6, 7)
      end
    end
  spr(0, cursor_x * 4 - 4 -2, cursor_y * 6 - 2)
  end
  -- print(@stat(1))  -- print out @STAT(1) at the end of each frame if you want to see perf information (portion of)
end

print("hello~")
print("HELLO ヘロ")
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
08808800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
08000800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
08000800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
08808800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
