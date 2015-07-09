# Welcome to the Mirror wiki!

## Objective
Find the key and unlock the gate in each level to clear them. Levels should feature puzzles focused on challenging the player's ability to think outside of the box as they modify their surroundings to suit the objective.

## Gameplay Mechanics

![Gameplay Loop Diagram](https://github.com/oliviaiscool/Mirror/blob/master/Notes/gameplayloops.png)

The game follows the physics of a basic platformer for the most part, in which the hero can jump and move left and right. The world contains the player, platforms and objects (e.g. keys, movable objects/boxes, gates). Most objects are not affected by gravity. Movable objects are an exception.

Every level has a line down the middle that separates the first half from the latter half. Objects in the first half appear on the second half, but reflected over the x & y axes. Actions performed on an object in the first half are also performed on it's flipped counterpart, and vice verse. Certain items cannot be obtained without taking advantage of this property.

## Level Design

Levels should be focused around a single puzzle that either introduces a new mechanic, tests the players recall of an old mechanic, or combines mechanics to create a more challenging experience.

The controls rely on buttons, allowing the hero to move back and forth. This is good, because the nature of the game is to have the hero navigate through the levels, making observations, testing to see what works and making mistakes.

_An example: a key hovers overhead in the air, trapped inside a box. You jump, thinking you can get the key, but you are unable to grab it. You end up bumping into the block, pushing it farther in the air until it hits the ceiling. You think you've just messed everything up, but actually you've just cleared the level. If you walk across the line into the second half, you'll find the box, which was once stuck to the ceiling, is stuck to the floor. You can now pick up the key and use it to unlock the gate._

## Technical

### Scenes
1. Main Menu
2. Level Select
3. Gameplay

### Controls/Input
* Button Based Controls
     * `leftButton` to walk left
     * `rightButton` to walk right
     * `jumpButton` to jump
* walk into a dynamic physics object to move it

### Classes/CCBs
* Scenes
    * Main Menu
    * Level Select
    * Gameplay
* Nodes/Sprites
    * Hero
    * WorldObject
        * Keys [Sprites]
        * Ground [Sprites]
        * Movable Boxes [Nodes]
        * Gates [Sprites]

## MVP Milestones
* Week 1 (7/7 - 7/11/2014)
  * Finish controls and make sure the buttons work as they were intended to
  * Start working on the mirror thingie
* Week 2 (7/14 - 7/18/2014) - finishing a playable build
  * Finish the mirror thingie
  * Create levels 1-5
* Week 3 (7/21 - 7/25/2014)
  * Make a tutorial!
  * Add levels (you should be able to do this easily)
* Week 4 (7/28 - 8/1/2014) - finishing core gameplay
  * Create the level select page*
  * Find better sprites*
  * Incorporate the story into the puzzle?
* Week 5 (8/4 - 8/8/2014)
  * Add animations to the gate at the end of the level
  * Add animations to the keys
* Week 6 (8/11 - 8/15/2014) - finishing the polish
  * Tie up loose ends
