# Grade-System-Calculator

# Student Grade Calculator Mobile App

## Project Description
Create a simple Student Grade Calculator mobile application using Flutter and Dart. The application allows users to enter a student's name and grades in five subjects, calculate the general average, and display whether the student passed or failed.

The application must be beginner-friendly and simple enough to complete within 90 minutes.

## Technologies
- Flutter
- Dart
- Material Design
- No database required

## Features
1. **Student Name** — Enter the student's full name.
2. **Subject Grades** — Enter grades for:
   - Mathematics
   - English
   - Science
   - Filipino
   - Computer
3. **Calculate Average** — Calculate the average of all five subjects.
4. **Pass or Fail Result**
   - Average of 75 or above: PASSED
   - Average below 75: FAILED
5. **Input Validation**
   - Student name cannot be empty.
   - All five grades are required.
   - Grades must be numeric and between 0 and 100.
6. **Reset Button** — Clear all inputs and results.
7. **Result Display** — Show the student's name, general average, and pass/fail status.

## Calculation Formula

General Average = Total of All Subject Grades / 5

Example:

- Mathematics: 85
- English: 80
- Science: 90
- Filipino: 85
- Computer: 80
- General Average: 84.00
- Result: PASSED

## UI Design
- Use a clean, modern mobile interface.
- Use blue as the primary color.
- Add a school icon at the top.
- Include labeled input fields for the student name and grades.
- Use a prominent Calculate Average button.
- Use a Reset button to clear the form.
- Display results inside a card.
- Use green for PASSED and red for FAILED.
- Make the layout scrollable and responsive for different screen sizes.

## Project Requirements
- Build the application using Flutter and Dart.
- Put the main application code in `lib/main.dart`.
- Use Flutter's built-in Material widgets.
- Keep the code simple and easy for beginners to understand.
- Do not use a database, backend, login system, or external API.
- Ensure the application works on Android devices and emulators.

## Instructions for GitHub Copilot
Generate the complete, working Flutter application based on these requirements.

Provide all necessary Dart code, input validation, average calculations, result display, and reset functionality.

Make sure the application can run using:

```bash
flutter pub get
flutter run
```

Keep the project simple enough to build, test, and demonstrate within 90 minutes.

## Expected Output
A functional Student Grade Calculator mobile app that calculates the student's average and displays PASSED or FAILED based on the passing grade of 75.
