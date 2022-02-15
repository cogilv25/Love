# Procedural Things

Around about 2016 I stumbled across [this paper](http://algorithmicbotany.org/papers/lsfp.pdf) and was intrigued so I made a small program (located in the archive section of this repo) capable of generating some of the fractals described in the paper and attempting a couple of my own, it was never really intended to be taken further and as such is not very maintainable, quite messy and hard to follow. This is it's successor, which is going to be more maintainable and possibly evolve into a useful tool/program although for now is still more of a toy/proof of concept than a project with a distinct objective.

## How to run it

Download [LÖVE 2d](https://love2d.org "LÖVE 2D's Homepage"), extract it then drag and drop the folder containing main.lua onto LOVE.exe. Hey presto, magic zesto, the game will appear before you! Latest version of LÖVE should work!

## Controls

Undecided...

## C++ version

I may make a version in C++/GLFW/OpenGL which would be a utility for creating offline procedurally generated content for use in other projects

## Todo list

- [ ] Class
  - [ ] DataManager
  - [ ] Generators
    - [ ] LSystem
    - [ ] Filter
    - [ ] Noise
  - [ ] Converter
    - [ ] Turtle
  - [ ] File
    - [ ] Generator
    - [ ] Text
    - [ ] Texture
    - [ ] Sound
  - [ ] Renderer
    - [ ] TransformRenderer
    - [ ] TextRenderer
    - [ ] LayerRenderer
    - [ ] InterfaceRenderer
  - [ ] GUI
    - [ ] Layout
    - [ ] Controls
      - [ ] Label
      - [ ] Button
      - [ ] TextBox
      - [ ] Slider

- [ ] Data
  - [ ] Generators
    - [ ] LSystemGenerator
    - [ ] FilterGenerator
  - [ ] GUI
    - [ ] Images
    - [ ] Fonts
    - [ ] Layouts (HTML?)
      - [ ] Main Menu
      - [ ] Generator Browser


- [ ] Logic
  - [ ] Rendering Loop
   - [ ] Frame Buffer
   - [ ] Buffer Swapping
  - [ ] File IO
    - [ ] Generators
    - [ ] Textures
    - [ ] Sounds

- [ ] Functionality
  - [ ] Layers

- [ ] Project Management
  - [ ] Todo List
  - [ ] Releases
