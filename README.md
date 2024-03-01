# Thegames

Is a Flutter apps using [RAWG API](https://rawg.io) to display all games of playstation. 

### How To Run This Project

- Clone this repository
  
  ```bash
  git clone https://github.com/FajarSubeki/thegames.git
  ```
- For can connect to API you need to change the api key in `contants.dart`. You can generate api key in (https://rawg-api.com/api).
- Run `flutter pub get` to install all the dependencies
- Run `flutter run` to run the app on your device or emulator

### Clean Architecture


Clean Architecture is a software design philosophy that aims to organize code in a way that emphasizes separation of concerns and maintainability. Clean Architecture promotes a clear separation between business logic and implementation details, making the codebase more modular and flexible.

The architecture is divided into 3 layers:

![Clean Architecture](https://blog.cleancoder.com/uncle-bob/images/2012-08-13-the-clean-architecture/CleanArchitecture.jpg)

- **Data Layer**: This layer contains all the data sources and repositories. It also contains the models for the data.
- **Domain Layer**: This layer contains the use cases and the entities.
- **Presentation Layer**: This layer contains the UI and the BLoC.
