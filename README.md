# Lab 4 - *Cat Facts! Flashcard Game*

Submitted by: **Meghan Thomas**

**Cat Facts! Flashcard Game** is an app that helps users learn and retain fun facts about cats. The app provides a deck of pre-made flashcards featuring cat-related facts, allowing users to swipe through and mark cards they need to review or have learned. Users can also add their own custom cards to the deck. Once the deck is completed, users can reset and start again or re-study the ones they marked to do so. 

Time spent: **4** hours spent in total

## Required Features

The following **required** functionality is completed:

- [X] View a flashcard and toggle between the card's question and answer text
- [X] Understand the effects of swiping left or right by updating the cards color as the user swipes
- [X] Swipe left and right to progress through the deck
- [X] Reset the deck with all the cards or only cards they've categorized as needing more practice
- [X] Create new flashcards and add them to the deck

 
The following **optional** features are implemented:

- [ ] Save cards so they're available across app launches
- [ ] Delete cards

## Video Walkthrough

![videowalkthrough](https://github.com/FAU-Fall2024-iOS-Mobile-App/lab-4-meghane/blob/main/lab4.gif)

## Steps

1. Firstly, I did the initial commit with a blank XCode project.
2. I followed CodePath's instructions in step 1 to get familiarized with the layout of SwiftUI view, I didn't make any commits for this step.
3. Then I made the flashcard UI in the ContentView file, I changed the colors from blue to cyan to change things up a bit.
4. I then made a new SwiftUI view file called CardView, so the content and card were in two separate locations.
5. After that, I created the ability to change the card from question to answer.
6. I then made the flashcard deck and added my fun facts about cats.
7. Next, I added the ability for users to swipe their cards, and with that, the cards fade to a red or green color to visually identify if the user wants to mark it as learned or still need to be practiced.
8. Afterwards, I then added the code that removes the card when it is fully swiped away or the animation to bounce it back if not swiped fully.
9. I then added the ability for a user to reset the deck once they have gone through it, or just reset back to the cards they need to practice again.
10. After that, I added the ability for a user to create their own flashcards with a modal sheet via a new SwiftUI view file, CreateFlashcardView.
11. I created a Launchscreen and from there the app was finished!


## Notes

- I didn't encounter any major issues throughout the duration of this lab. I struggled a bit throughout when following along with the CodePath instructions due to not understanding 100% where a snippet of code went. However, I was able to overcome this struggle eventually by learning my way around the code. 

## License

    Copyright [2024] [Meghan Thomas]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
