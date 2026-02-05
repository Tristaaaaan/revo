# revo

A new Flutter project.

## Core Technologies

### Top Level

revo/
│
├─ android/ # Native Android code
├─ ios/ # Native iOS code
├─ web/ # Web platform code
├─ assets/ # Static assets
│ ├─ fonts/ # Custom fonts
│ ├─ images/ # App images
│ └─ icons/ # Icons used across app
├─ test/ # Unit & widget tests
├─ lib/ # Main Dart code
│ ├─ main.dart # Entry point
│ ├─ app.dart # Root widget, theme, navigation
│ │
│ ├─ core/ # Global utilities, configs, theme, DI
│ │ ├─ constants/ # App-wide constants
│ │ ├─ utils/ # Helper functions (validators, date formatters)
│ │ ├─ routing/ # App routing & navigation
│ │ ├─ di/ # Dependency injection / service locator
│ │ ├─ theme/ # Colors, typography, spacing, theme data
│ │ └─ extensions/ # Dart extensions (String, DateTime, etc.)
│ │
│ ├─ shared/ # Shared resources across features
│ │ ├─ widgets/ # Atomic design: atoms, molecules, organisms, templates
│ │ ├─ models/ # Shared models
│ │ └─ enums/ # Shared enums
│ │
│ ├─ features/ # Feature-first structure (Clean Architecture)
│ │ ├─ auth/
│ │ │ ├─ data/ # Data sources, repositories, models
│ │ │ ├─ domain/ # Entities, repositories, use cases
│ │ │ └─ presentation/# Pages, Cubits/BLoCs, widgets
│ │ │
│ │ ├─ chat/
│ │ │ ├─ data/
│ │ │ ├─ domain/
│ │ │ └─ presentation/
│ │ │
│ │ └─ other_features/ # Add features here following same pattern
│ │
│ ├─ l10n/ # Localization files (.arb)
│ └─ generated/ # Generated code (JSON serialization, localization, etc.)
│
├─ pubspec.yaml # Project dependencies
└─ README.md # Project overview and instructions

### Folder Structure

## Core Technologies

### App Development

- **Flutter** (`v3.35.4`)
- **Dart** (`v3.9.2`)
- **BLoC/Cubit**
- **GoRouter**
