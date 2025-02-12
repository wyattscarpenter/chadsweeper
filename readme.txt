# Chadsweeper

## Overview

For a lark, for a larf, I'm making a minesweeper game. I'm doing it in Pico-8 bc my teammate wanted to. This also means I get to learn lua (wow, cool (lua is just another lil imperative interpreted language inspired by C and stuff so I basically already know it (I do like how the arrays start at one, though 🙂 (this is perhaps my most controversial opinion)))). I didn't particularly learn lua very thoroughly so this project might be doing various things the hard way (such as 0-initializing arrays using a for loop).

Stage one of this project is just making a vanilla minesweeper game in pico8.

1.5: add nice colors and stuff

Stage 2 is adding mouse support that also moves the in-game cursor. This is possible but you have to enable some things, I hear.

Stage 3? Game design.

Stage 4, is having a novel minesweeper-based (based) game. Working title: chadsweeper.

## OK but how do I even run the project?

Good question.

I'm not sure about all the ways. But, at least, if you have pico-8 installed on your computer, then `pico8 -run chadsweeper.p8` in this folder will run the game (this is what run.bat does). I also have p8 files associated with pico8 so I can just click on them, although that just edits the file, so you'd have to hit escape and then type run and then hit enter to play the game that way. To exit the weird little pico8 zone, either from that or from doing the in-game quit (x on menu screens), issue the command "shutdown", or hit alt-f4 or ctrl-q.

I think it's impossible to shebang a p8 file with something like `#!/bin/pico8` or `#!usr/bin/env pico8`, sadly. So you can't just run ./chadsweeper.p8 from the linux shell. Still, the run.bat should still work, as a shell script.

TODO: presumably I want to put this up online somewhere where people can just play it. itch.io or github.io or suchlike.


