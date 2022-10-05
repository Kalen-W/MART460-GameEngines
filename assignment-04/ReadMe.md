Kalen Weinheimer

10 / 05 / 2022

--------------------------------

This project is a simple recreation of chess, with a mostly random compute opponent.

This is not fully functional however, and a few of the missing features include castling, en passant, promotion, and check movement restrictions.


The Player will always play as white and thus take the first turn. A piece can be moved by clicking on it with the left mouse button, dragging it over a tile that it can legally move to, and the releasing the left mouse button.
(Additionally, although pointless, the right mouse button can be held to pan the view.)



Also, to be more specific, the computer opponent takes a list of all its pieces that can move, randomizes the order, then search through the list until it finds a piece capable of taking one of the player's pieces. And should that fail it will randomly move a random piece.
