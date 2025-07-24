# Weather App

A clean architecture weather application with Firebase backend.

## Key Features

- **Clean Architecture**  
  - Easy maintenance  
  - Better testability  
  - Clear separation of concerns  

- **Firebase Integration**  
  - 🔐 Firebase Auth for user authentication  
  - 📁 Firestore for user data storage  

- **User Flow**  
  - Sign up/in screens  
  - Home screen with weather data  
  - Logout confirmation  

## Screenshots

<table>
  <tr>
    <td><img src="./design/login.png" width="250"/><br/><center><b>Login Screen</b><br/>User login UI</center></td>
    <td><img src="./design/signup.png" width="250"/><br/><center><b>Sign Up Screen</b><br/>Register a new user</center></td>
    <td><img src="./design/homescreen.png" width="250"/><br/><center><b>Home Screen</b><br/>Weather info and weekly forecast</center></td>
  </tr>
</table>

## Technical Details

- **Backend**: Firebase (Auth + Firestore)  
- **Architecture**: Clean Architecture pattern  
- **State Management**: Bloc  

## Home Screen Description

The home screen automatically fetches the user's current location (latitude and longitude) using device GPS.  
This location data is then used to make a query to a weather API to retrieve current weather conditions, including:

- Temperature  
- Weather condition (e.g., clear, cloudy, rain)  
- Location name (e.g., city)

In addition to the current weather, the screen also displays **a weekly weather forecast**, allowing the user to view upcoming weather conditions for the next 7 days in a horizontal timeline.

A logout button is also available with confirmation before signing out.

## Setup

1. Clone the repository  
2. Add your Firebase config files  
3. Run `flutter pub get`  
4. Launch with `flutter run`  

## Future Improvements

- Add more detailed weather info (wind, humidity, pressure)  
- Implement user preferences (unit settings, themes)  
- Add daily/hourly toggle  
