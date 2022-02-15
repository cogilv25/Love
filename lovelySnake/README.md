# Lovely Snake 

I wanted to create a finished game because of my terrible habit of starting lots of ambitious projects but never completing them so I decided to make the good old classic snake game... AND I actually completed it to a point I'm happy with. There are improvements that could be made for sure but it's a playable game so I'm pretty much calling it done unless I have some inspiration to go back and work on it at some point.

## How to run it

Download [LÖVE 2d](https://love2d.org "LÖVE 2D's Homepage"), extract it then drag and drop the folder containing main.lua onto LOVE.exe. Hey presto, magic zesto, the game will appear before you! I'm not sure what version I used... will update this!

## Controls

- Arrow keys or WASD to change direction
- r to reset
- ESC to pause
- 3 to cheat (snake grows without eating)

## Possible future improvements / problems

- [x] Change to a more logical grid based format
- [x] Add win condition and scores
- [ ] Add highscores table
- [x] Add a game over message
- [x] Add a pause menu
- [ ] Add a main menu
- [ ] Encapsulate and generalise menus into a "class"
- [ ] Allow arbitrary window dimensions
- [x] Use a random value for seeding the rng such as the current time
- [x] Food should not spawn in a space occupied by the snake
- [x] Food could respawn as soon as it's eaten by the head
- [x] Improve food respawn algorithm (may be too slow for older computers at high scores)
- [x] Border on bottom, right, top and left should be the same size
- [x] Snake update function could be more efficient