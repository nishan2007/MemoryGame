# MemoryGame
Project 4 - Memory Game

Submitted by: Nishan Narain

Memory Game is an interactive SwiftUI app where users flip cards to find matching pairs. The game includes a dynamic grid layout, matching logic, and the ability to reset and customize gameplay.

Time spent: 4 to 6 hours spent in total

Required Features

The following required functionality is completed:

[x] App loads to display a grid of cards initially placed face-down
	•	Upon launching the app, a grid of cards is visible
	•	Cards are facedown to indicate the start of the game

[x] Users can tap cards to toggle their display between the back and the face
	•	Tapping on a facedown card flips it to reveal the front
	•	Tapping a second card that is not identical flips both back down

[x] When two matching cards are found, they both disappear from view
	•	The app checks if two selected cards match
	•	Matching cards are removed from the grid
	•	Non-matching cards return to the facedown position

[x] User can reset the game and start a new game via a button
	•	A reset button is included
	•	The button reshuffles cards and resets game state

Optional Features

The following optional features are implemented:

[x] User can select number of pairs to play with
	•	Implemented using a segmented Picker with options like 2, 4, and 6 pairs

[x] App allows for user to scroll to see pairs out of view
	•	Implemented using a ScrollView wrapping the grid

[x] Enhanced UI design
	•	Styled cards with colors and rounded corners
	•	Custom emoji symbols for cards
	•	Clean layout and spacing

Additional Features

[x] Prevents selecting more than two cards at once
[x] Adds a short delay before flipping cards back down for better user experience
[x] Smooth gameplay using SwiftUI state management

Video Walkthrough

https://www.loom.com/share/914028c49e024cbaa23227186a4f320f

Notes

Some challenges encountered while building the app included:
	•	Managing state for selected cards and ensuring only two cards can be flipped at a time
	•	Implementing matching logic with delays without breaking the UI
	•	Resetting the game state cleanly
	•	Understanding how LazyVGrid works for layout

License

Copyright 2026 Nishan Narain

Licensed under the Apache License, Version 2.0 (the License)
You may not use this file except in compliance with the License
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an AS IS basis, without warranties or conditions of any kind, either express or implied
