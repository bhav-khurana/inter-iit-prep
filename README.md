# InterIIT Prep Project

An app built in Flutter for the prepAthon of Inter IIT Tech Meet 12.0.
- [Local Setup](#local-setup)
- [Features](#features)
- [TechStack](#techstack)


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
The app is built using `Flutter` as the frontend framework. It uses `Firebase Firestore` to store doctors' data and integrates `OpenAI gpt-3.5` API to calculate the approximate calorie consumption and generate a summary from the given text
