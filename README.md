# Siege Week 9 -> Onsleight
A game where you avoid sleighs that are zipping down a hill for as long as possible.
[Theme was Winter]

<img src="assets/screenshots/Gameplay.png">

---
## Controls
- W/S to move forwards and backwards
- A/D to move left and right
- Play on web [here](https://baton-0.itch.io/onsleight)!

## Overview
- Made with absolutely messy code to see how much I could get done in the time limit; pure creation.
- [img of code]

## Credits
- [Music / sfx credits]

---
## Devlogs
### Tuesday -> Sleds & Sled Spawner
- Got the sleds working very basically, and made a script for spawning them in rows off screen.
### Wednesday -> Player & Better Spawning
- Made the player controller, just a basic top down controller.
- Made some big tweaks to the sled spawning, like making it pick a position from a bag so it spawns one in every row before repeating the row.
### Thursday -> Collision
- Made a StaticBody around the playspace so the player can't leave it.
- Made the sleds stop moving once they run into the player or the bottom of the screen.
### Saturday -> Game Loop
- Finally locked in, and got the entire game loop working;
- The player can take damage and knockback.
- There's a working start menu and replay menu, which use a simple threshold shader for the transition.
- The sleds, spawner, and player are all reset when a new round starts.
### Sunday -> Polish
- Did all of the art and animation;
- Player animation (penguin!)
- Sled crashing animation for when they hit something
- Background tileset
- UI screens