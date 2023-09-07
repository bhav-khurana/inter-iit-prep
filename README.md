# InterIIT Prep Project

An app built in Flutter for the prepAthon of Inter IIT Tech Meet 12.0.
- [Local Setup](#local-setup)
- [Features](#features)
- [TechStack](#techstack)
- [Resuable Widgets](#reusable-widgets)


## Local Setup
1. Fork and clone the repository
```
git clone https://github.com/bhav-khurana/inter-iit-prep.git
``` 
2. Open the project with Android Studio (or VS Code)
3. Create a `.env` file in the project directory and put in your OpenAI API key in the following format
```
OPENAI_API_KEY = #your-key-goes-here
```
4. Run the app
```
flutter run lib/main.dart
```


## Features
The app seeks to harness the power of mobile applications in three key sectors, namely:
- FoodTech
- HealthTech
- EdTech

This app offers a multifaceted approach to address various aspects of health and education.
In the FoodTech component, users can input their personal information and set a specific target weight within a designated timeframe. Leveraging OpenAI, the app calculates an estimated daily calorie requirement and offers a user-friendly interface for monitoring calorie consumption.

In the HealthTech segment, the app facilitates the search for specialized doctors and enables users to schedule appointments at their preferred time slots. The app retrieves doctor information from Firebase Firestore.

In the EdTech domain, users have the capability to generate flashcards from PDF files. Furthermore, users can specify the number of flashcards they wish to create, enhancing their learning experience.


## TechStack
The app is built using `Flutter` as the frontend framework. It uses `Firebase Firestore` to store doctors' data and integrates `OpenAI gpt-3.5` API to calculate the approximate calorie consumption and generate a summary from the given text.

## Reusable Widgets

### Custom Input Field
A [custom input field](lib/features/healthtech/components/inputField.dart) which takes in the following parameters:
- `TextEditingController controller`: controls the text in the input field
- `String hint`: the hint text to be shown in the field when it is empty

### Feature Button
A [custom feature button](lib/features/welcome/components/featureButton.dart) widget to redirect to a particular feature on the screen. It takes in the following parameters:
- `String image`: the path of the image to be shown as a leading widget in the button
- `String title`: title to be shown on the button

### Items Container
An [items container](lib/features/healthtech/components/foodItemsContainer.dart) widget to add items for breakfast/lunch/dinner and calculate calorie count. It takes in the following parameters:
- `String foodType`: the food type to be shown at the top of the container.
- `VoidCallback refresh`: a call back function to refresh the state of the parent widget

### Item Tile
An [item tile](lib/features/healthtech/components/itemTile.dart) widget to show the item and its quantity in a tile. It takes in the following parameters:
- `String item`: the item name to be shown
- `String quantity`: the quantity of the item to be shown

### Doctor Card
A [doctor card](lib/features/foodtech/components/doctorCard.dart) widget to display the details of the doctor in the form of a card. It takes in the following parameters:
- `String name`: name of the doctor to be shown the card
- `String desc`: specialization of the doctor
- `String availability`: the hours in which the doctor is available
- `String image`: path of the image
- `int phoneNo`: the phone number of the doctor

### End Button
An [end button](lib/features/foodtech/components/endButton.dart) widget to be shown at the bottom of a screen. It takes in the following parameters:
- `String text`: the text to be shown on the button
- `Color color`: the background color of the button


