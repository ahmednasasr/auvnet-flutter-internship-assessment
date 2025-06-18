# 📱 AUVNET Flutter Internship Assessment

A well-structured Flutter application built for the AUVNET internship assessment, demonstrating a complete authentication flow, onboarding experience, and home interface with clean architecture and Bloc state management.

---

## 🚀 Getting Started

This app delivers a smooth user experience from the splash screen to authenticated usage. Built with maintainability and scalability in mind using the **Bloc pattern** and **Clean Architecture** principles.

---

## ✨ Features

- ⏳ **Splash Screen**: Displays for 5 seconds upon app launch.
- 👣 **Onboarding Flow**:
    - 3 informative onboarding pages.
    - Users can swipe through or tap **Next**.
    - **Get Started** navigates to the login screen.
- 🔐 **Authentication**:
    - Integrated with **Firebase Authentication**.
    - **Sign Up**: User provides full name, email, and password.
        - The full name is stored and used later to personalize the user experience.
    - **Login**: Existing users can log in using email and password.
    - High accuracy and stability ensured through proper error handling.
- 🏠 **Home Screen**:
    - Personalized greeting: "Hi, [User Name]".
    - Professionally crafted UI layout with clean design.
- 🗃️ **Firestore Storage**:
    - Upon signup, the user is added to the **`users`** collection in Firestore.
    - The app supports structured user data storage for future use.

---

## 🧱 Architecture

- ✅ Clean Architecture structure
- ✅ Bloc State Management
- ✅ Dependency Injection via `getIt`
- ✅ Local data persistence using `Hive`
- ✅ Shared Preferences for lightweight caching

---

## 📸 Images

```used images
assets/images/6.png
assets/images/13 1.png
assets/images/213123.png
assets/images/Ellipse 153.png
/.Shortcuts images
assets/images/Group 10.png
assets/images/Group 6.png
//
// Popular restaurants nearby images
assets/images/Group 13.png
assets/images/Group 14.png
assets/images/Group 16.png
assets/images/Group 17.png
//
assets/images/nawel.png
assets/images/photo_2023-09-03_13-36-55 1.png

