# Keeper

Clean Architecture Flutter project.

An application for storing and monitoring your assignments and notes.

// todo : add family members

# Structure

lib/
├── data/                   # Data layer: handles data sources and models
│   ├── datasources/        # Data source implementations (e.g., SQFLite)
│   ├── mappers/            # Mappers to convert between DTOs and entities
│   ├── models/             # Models for repository and datasources (DTOs)
│   ├── repositories/       # Repository implementations
├── domain/                 # Domain layer: business logic and entities
│   ├── entities/           # Business entities
│   ├── usecases/           # Use cases (business logic)
├── presentation/           # Presentation layer: UI and state management
│   ├── pages/              # UI pages/screens
│   ├── widgets/            # Reusable UI components
├── main.dart               # Entry point of the application
├── service_locator.dart    # Register services using GetIt

# Screens

<img src="https://github.com/hemidvsmusayev/Keeper/blob/master/assets/screens/1.jpg?raw=true" width="300"> <img src="https://github.com/hemidvsmusayev/Keeper/blob/master/assets/screens/2.jpg?raw=true" width="300"> <img src="https://github.com/hemidvsmusayev/Keeper/blob/master/assets/screens/3.jpg?raw=true" width="300">
<img src="https://github.com/hemidvsmusayev/Keeper/blob/master/assets/screens/4.jpg?raw=true" width="300"> <img src="https://github.com/hemidvsmusayev/Keeper/blob/master/assets/screens/5.jpg?raw=true" width="300">
