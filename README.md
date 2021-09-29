# LÖVE Template

An opinionated template/starter project for [LÖVE](https://love2d.org)/Love2D game framework projects.

This project implements some of the most basic LÖVE features and is inteneded to provide boilerplate code for those features which can be changed and built off of to "kickstart" a LÖVE project.

Includes:
- An [.editorconfig file](https://editorconfig.org)
- A [.luacheckrc file](https://luacheck.readthedocs.io/en/stable/config.html) for [Luacheck](https://github.com/mpeterv/luacheck) with some basic defaults for LÖVE projects
- A trivial "game" (just a spinning icon on a background) which implements:
  - Separate "Game" and "Player" objects (not everything is crammed in main.lua)
  - "Gameplay" pauses or unpauses when the Escape key is pressed or the window gains or loses focus
  - A resizable window and graphics that properly adjust based on window size

## License & Attribution

This project is open source under the zlib license (the same license LÖVE itself uses).

The heart icon image is from the [LÖVE project](https://github.com/love2d/love) repository.
