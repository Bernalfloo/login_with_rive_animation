# 🐻 Rive Animated Login Screen – Flutter

An interactive **animated login screen** built with **Flutter** and **Rive**, featuring a responsive bear character that reacts to user interactions in real time using **State Machines**.

This project demonstrates how modern UI animations can be integrated into mobile applications to create more engaging and dynamic user experiences.

---

## 📷 Demo

![Login Animation Demo](assets/demo.gif)

The GIF above shows the complete behavior of the login screen, including user interaction with the email and password fields and the bear's animated reactions.

---

## 🔥 Overview

This project demonstrates the process of building an animated login interface using **Rive animations integrated into Flutter**.

The main goal is to show how animations can react dynamically to user actions such as typing, focusing input fields, or validating data. Instead of static UI elements, the interface becomes interactive and responsive.

The animation improves the **user experience (UX)** by providing visual feedback and making the login process more intuitive and engaging.

---

## ⭐ Features

- 🧠 **Interactive Rive animation integrated into Flutter**
- 👀 The bear follows the cursor while typing in the email field
- 🙈 The bear covers its eyes when the password field is focused
- 🔒 Password field is hidden by default for security
- 👁️ Toggle button to show or hide the password
- ⚠️ If any input is invalid, the bear reacts with a worried expression
- 🎉 If both fields are valid, the bear reacts with happiness
- 🎯 Real-time animation control using **Rive State Machines**
- 📱 Responsive UI built with Flutter widgets
- 🔄 Dynamic reaction to user input using listeners

---

## 🤖 Rive & State Machines

### What is Rive?

**Rive** is a real-time interactive animation tool used by designers and developers to create animations that can respond to user input.

Unlike traditional animations such as videos or GIFs, Rive animations can be **interactive**, meaning they can change dynamically depending on user behavior.

Rive allows animations to be exported and used in multiple platforms including:

- Mobile applications  
- Web applications  
- Games  
- Desktop applications  

This makes it a powerful tool for creating modern and dynamic user interfaces.

---

### What is a State Machine?

A **State Machine** in Rive is a system that controls how an animation behaves depending on different states and conditions.

State Machines allow animations to change automatically based on inputs such as:

- Boolean values  
- Triggers  
- Numeric values  

In this project, the State Machine controls the bear’s reactions depending on user interaction.

Example behaviors used in this login screen:

| User Action | Animation Reaction |
|-------------|-------------------|
| User types email | Bear follows cursor |
| Password field focused | Bear covers its eyes |
| Invalid input | Bear shows worried reaction |
| Valid input | Bear shows happy reaction |

State Machines make the animation **interactive and responsive**.

---

## 🌐 Technologies Used

The following technologies were used to build this project:

- 🐦 **Flutter** – Cross-platform UI framework developed by Google  
- 🎨 **Rive** – Real-time animation and interaction design tool  
- 🧠 **Rive State Machines** – Logic system used to control animation behavior  
- 🎯 **FocusNode** – Detects when input fields gain or lose focus  
- 🔍 **Regex** – Used to validate email and password inputs  
- 👂 **Listeners** – Detect and respond to user input changes  
- 🎛️ **Controllers** – Manage animation logic and UI interaction  
- 📦 **Dart** – Programming language used by Flutter  
- 🧑‍💻 **Visual Studio Code** – Development environment used to build the project  

---

## 🛠️ Project Structure

Below is the basic structure of the project focusing on the main files inside the **lib** folder.

```text
lib/
│
├── main.dart
│   └── Entry point of the Flutter application
│
├── login_screen.dart
│   └── Builds the animated login interface and handles logic
```

### File Description

**main.dart**
- Initializes the Flutter application  
- Starts the app  
- Loads the main screen  

**login_screen.dart**
- Contains the login UI  
- Connects Flutter with the Rive animation  
- Detects user interaction with input fields  
- Validates email and password  
- Controls animation states  

---

## 🎓 Academic Information

**Subject:** Graphication  
**Instructor:** RODRIGO FIDEL GAXIOLA SOSA

---

## 🎨 Animation Credits

The animation used in this project was created by the **Rive community**.

Full credit goes to the original creator of the animation.

Original asset link:  
https://rive.app/marketplace/3645-7621-remix-of-login-machine/

---

## 💡 Notes

- This README is written entirely in **English** as required.  
- Emojis are used to make the documentation **more visually engaging**.  
- The project demonstrates how **interactive animations can improve user interface design** in modern applications.  
- The project is intended for **educational purposes for the Graphication course**.
