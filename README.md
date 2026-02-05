# revo

This application enables user to manage calls with ease.

## Folder Structure

### Top Level

    revo/
    │
    ├─ android/
    ├─ ios/
    ├─ assets/
    │   ├─ fonts/
    │   ├─ images/
    │   └─ icons/
    ├─ test/
    ├─ lib/
    │
    ├─ pubspec.yaml
    └─ README.md

### lib/

    revo/
    ├── lib/                      # Source files
    │   ├── main_production.dart  # Production entry point
    │   ├── main_staging.dart     # Development entry point
    │   ├── main_development.dart # Staging entry point
    │   │
    │   ├── config/               # Handle app environment
    │   ├── firebase/             # Firebase Option for each environment
    │   │   ├── dev/
    │   │   ├── prod/
    │   │   ├── stg/
    │   ├── core/                 # Global utilities, configs, theme, DI
    │   │   ├── constants/        # App-wide constants
    │   │   ├── appimages/            # Helper functions (validators, date formatters)
    │   │   ├── approutes/          # App routing & navigation
    │   │   ├── apptext/               # Dependency injection / service locator
    │   │   ├── theme/            # Colors, typography, spacing, theme data
    │   │   └── extensions/       # Dart extensions (String, DateTime, etc.)
    │   │
    │   ├── shared/               # Shared resources across features
    │   │   ├── widgets/          # Atomic design: atoms, molecules, organisms, templates
    │   │   ├── models/           # Shared models
    │   │   └── enums/            # Shared enums
    │   │
    │   ├── features/             # Feature-first structure (Clean Architecture)
    │   │   ├── auth/
    │   │   │   ├── data/         # Data sources, repositories, models
    │   │   │   ├── domain/       # Entities, repositories, use cases
    │   │   │   └── presentation/ # Pages, Cubits/BLoCs, widgets
    │   │   ├── calls/
    │   │   │   ├── data/         # Data sources, repositories, models
    │   │   │   ├── domain/       # Entities, repositories, use cases
    │   │   │   └── presentation/ # Pages, Cubits/BLoCs, widgets
    │   │   ├── jobs/
    │   │   │   ├── data/         # Data sources, repositories, models
    │   │   │   ├── domain/       # Entities, repositories, use cases
    │   │   │   └── presentation/ # Pages, Cubits/BLoCs, widgets
    │   │   ├── users/
    │   │   │   ├── data/         # Data sources, repositories, models
    │   │   │   ├── domain/       # Entities, repositories, use cases
    │   │   │   └── presentation/ # Pages, Cubits/BLoCs, widgets
    │   │   └── other_features/   # Add features here following same pattern
    │   │
    │   ├── l10n/                 # Localization files (.arb)
    │   └── generated/            # Generated code (JSON serialization, localization, etc.)
    │
    ├── test/                     # Automated tests (unit, widget)
    ├── tools/                    # Tools and utilities
    ├── pubspec.yaml               # Project dependencies
    ├── LICENSE                    # License file
    └── README.md                  # Project overview and instructions

## Atomic Design Approach (shared/widgets)

- **Atoms:** Buttons, icons, text fields
- **Molecules:** Input groups, card items (combinations of atoms)
- **Organisms:** Complex UI sections like chat lists or profile headers
- **Templates:** Page-level scaffolds/layouts

**Design Tokens:**  
All colors, typography, and spacing live in `core/theme/` to ensure consistency across the app.

## Firebase Assumptions

- **Auth:** `users` collection
  This collection contains the information submitted by the user, this includes their personal information and business information.

- **Job Sources:** `jobs` collection
  This collection contains the jobs sources.

-

## Core Technologies

### App Development

- **Flutter** (`v3.35.4`)
- **Dart** (`v3.9.2`)
- **BLoC/Cubit**
- **GoRouter**
