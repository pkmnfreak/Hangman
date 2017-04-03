# Hangman #

## Description ##
An iOS application for the Hangman game. Users are able to start a game, make guesses for a phrase (list of phrases are buildings on the UC Berkeley campus), see their progresses toward the phrase, see a list of previously guessed, incorrect letters, see how many guesses they have left (indicated by a hangman image), be alerted of a win or loss, and start a new game.

<center> <img src=https://github.com/pkmnfreak/Hangman/blob/master/README-images/hangman1.png width = "350" > </center>

###  Hangman Game View ###
* A UILabel that displays the "_"s corresponding to each word in the provided puzzle string
* A UILabel that displays the incorrect guesses thus far
* A TextField (where the user enters a letter as a guess)
* The user is only able to guess a single letter at a time
* A "Guess" button which determines whether the letter entered in the textfield is correct or not, and updates the game accordingly
* If that letter appears in the puzzle string, the corresponding "_" is replaced by the correctly guessed letter
* If that letter does not appear in the puzzle string, that letter is added to a UILabel keeping track of "Incorrect Guesses: ", and the Hangman image updates to represent the number of incorrect guesses
* A square-dimensioned UIImageView that represents the "state" of the Hangman, with appropriate images for each "state"
* Implements AutoLayout

### Finished Game States, Start New Game ###
* A win state, indicated by an Alert (Pop up box). This prevents additional guesses
* A fail state, indicated by an Alert (Pop up box). This prevents additional guesses)
* A "Start Over" button, which starts a new game
