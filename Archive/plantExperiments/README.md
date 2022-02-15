# Procedural Plant Experiments

A while ago I stumbled across [this paper](http://algorithmicbotany.org/papers/lsfp.pdf) and was intrigued so I made this small program capable of generating some of the fractals described in the paper copying a few of the patterns in the paper and attempting a couple of my own. It's not very easy to read however as it was never really intended to be but I think I might come back to it and tidy up because it's really quite a fascinating subject.

## How to run it

Download [LÖVE 2d](https://love2d.org "LÖVE 2D's Homepage"), extract it then drag and drop the folder containing main.lua onto LOVE.exe. Hey presto, magic zesto, the game will appear before you! I'm not sure what version I used... will update this!

## Controls

- Up and Down to zoom in and out
- Left and Right to step generator back and forward
- Comma and Dot to change generators

## Todo list

- [ ] Rewrite
- [ ] Optimize to allow more steps without lag
- [ ] Perform generation in a seperate thread to prevent program hang
- [ ] Progress bar for slow generators
- [ ] Remove lib requirement
- [ ] Add groups funcionality (treat strings as groups and allow replacement of groups)
