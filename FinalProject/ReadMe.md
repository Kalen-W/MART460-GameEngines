Kalen Weinheimer
12-14-2022

# Project Undead Strategy

<br />

[[WebGL Build](https://kalen-w.github.io/MART491-GameStudio/ProjectUndeadStrategyV0.3/)]

<br />


### Basic Controls
--------------------------------
#### Selecting A Unit:  
Click on a tile to select it, if this tile has a unit, that unit will be highlighted (showing it's info in the top right of the screen). Click the highlighted unit a second time to select it (if it's your own unit), this will allow you to move and attack with the unit.

#### Moving A Unit:  
To move a selected unit, select a tile within it's movement range by clicking it, then either click the same tile again, or click the "Move" button at the bottom of the screen.

#### Attacking With A Unit:  
To attack with a unit, first insure the target is within the unit's attack range, next you must click the target to highlight it, and then either right click it, or click the "Attack" button at the bottom of the screen.

#### Camera Movement:  
To pan the camera view, simply hold down the right mouse button and move the mouse.

#### Pause Menu:  
Open the pause menu by pressing [escape], this allows you to return to the main menu, or exit to desktop.


<br />


### Navigating The Map  
--------------------------------
The screen you are first taken to after starting a game is the map screen. This map is made up of individual nodes organized into columns. Your goal is to travel from the left most node to the right most node. You can only travel to the right, losing access to all previous nodes and all other nodes within your current column. When traveling to a node you will either have a new combat encounter to face or an event of some kind.  
(dark blue node: currently occupied; light blue node: available to be traveled to; black node: inaccessible; light gray node: out of reach)


<br />


### Equipment  
--------------------------------
After completing a combat encounter you may be rewarded with a new piece of equipment, which may be equipped within the equipment menu, accessible from the map screen via the "Equipment" button in the top-left.  
Once within the equipment menu, you will see all unequipped items shown in a grid on the right side of the screen. The left side of the screen shows the six slots which you may drag and drop specific types of items onto to equip them. And clicking on an item will display it's effects within the middle section of the screen. There is also a delete button in the bottom-right of the middle section, which will delete the currently displayed item.  
The equipment menu may then be exited by clicking the "X" button in the top-right.


<br />


### Unit Summoning  
--------------------------------
Combat will start with you only having one unit, your commander, but additional units can be summoned through the summoning menu. To use the summoning menu: first select the tile you with the unit to be summoned onto (it must be within the movement range of your commander), open the summoning menu by pressing [tab] (or clicking the rectangle along the left edge of the screen), then click the unit you wish to summon.  

Summoned units cannot act on the turn they are summoned, and your are limited on the number you may summon by the "summoning stones", the amount you have being visible at the bottom of the summoning menu. These summoning stones reset every combat encounter, and you will gradually gain more as you progress.


<br />


### Ending Your Turn  
--------------------------------
To end your turn simply press the "End Turn" bottom near the bottom right of the screen. This will allow the computer enemy to take it's turn, and then begin your next turn, allowing all units to move and attack again.


<br />


### Winning / Losing  
--------------------------------
To win a combat encounter you must defeat all enemy units, and you lose once your commander unit has been defeated.  
To win the entire game you must travel to the last node on the map (the furthest right node).
