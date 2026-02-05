# revo

A new Flutter project.

## Folder

### Top Level

    revo/
    │
    ├─ android/
    ├─ ios/
    ├─ web/
    ├─ assets/
    │   ├─ fonts/
    │   ├─ images/
    │   └─ icons/
    ├─ test/
    ├─ lib/
    │
    ├─ pubspec.yaml
    └─ README.md

### Top Level

    revo/
    ├── android/                  # Native Android code
    ├── ios/                      # Native iOS code
    ├── web/                      # Web platform code
    ├── assets/                   # Static assets
    │   ├── fonts/                # Custom fonts
    │   ├── images/               # App images
    │   └── icons/                # App icons
    ├── build/                    # Compiled files (Flutter build outputs)
    ├── docs/                     # Documentation files
    ├── lib/                      # Source files
    │   ├── main.dart             # App entry point
    │   ├── app.dart              # Root widget, theme, navigation
    │   │
    │   ├── core/                 # Global utilities, configs, theme, DI
    │   │   ├── constants/        # App-wide constants
    │   │   ├── utils/            # Helper functions (validators, date formatters)
    │   │   ├── routing/          # App routing & navigation
    │   │   ├── di/               # Dependency injection / service locator
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
    │   │   │
    │   │   ├── chat/
    │   │   │   ├── data/
    │   │   │   ├── domain/
    │   │   │   └── presentation/
    │   │   │
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
- **Chat:** `chatRooms/{roomId}/messages` subcollection
- **Profiles:** `users` collection with profile info
- **Settings:** `userPreferences` per user
- **Streams:** Real-time updates for chat and user presence

## Core Technologies

### App Development

- **Flutter** (`v3.35.4`)
- **Dart** (`v3.9.2`)
- **BLoC/Cubit**
- **GoRouter**
