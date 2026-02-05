# revo

This application enables user to manage business calls with ease.

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
    │   │   ├── appimages/        # Helper images
    │   │   ├── approutes/        # Helper routes
    │   │   ├── apptext/          # Helper text
    │   │   └── apptheme/         # Helper theme
    │   │
    │   ├── shared/               # Shared resources across features
    │   │   ├── widgets/          # Common Widgets
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
    │
    ├── test/                     # Automated tests (unit, widget)
    ├── tools/                    # Tools and utilities
    ├── pubspec.yaml              # Project dependencies
    ├── LICENSE                   # License file
    └── README.md                 # Project overview and instructions

## Atomic Design Approach (shared/widgets)

- **Atoms:** Buttons, icons, text fields
- **Molecules:** Input groups, card items (combinations of atoms)
- **Organisms:** Complex UI sections like chat lists or profile headers
- **Templates:** Page-level scaffolds/layouts

**Design Tokens:**  
All colors, typography, and spacing live in `core/appdesign/` to ensure consistency across the app.

## Firebase Assumptions

- **Auth:** `users` collection
  This collection contains the information submitted by the user, this includes their personal information and business information.

- **Job Sources:** `jobs` collection
  This collection contains the jobs sources.

-

## How to Use the Project

Ensure that Flutter is already installed on your computer.

1. Clone the project

```
git clone https://github.com/Tristaaaaan/revo
```

2. Open the project on your preferred IDE and add dependencies:

```
flutter pub get
```

3. Run the project:

- In VS Code, click the Run and Debug icon on the left sidebar, then select the environment you want to run.

## Development Details

### App Development

- **Flutter** (`v3.35.4`)
- **Dart** (`v3.9.2`)
- **BLoC/Cubit**
- **GoRouter**

### Structure

I implement flavors to assure that the project will be linked to the right Firebase project once it is already implemented and handle each versions of the application properly. This assure that the production project will not be touched during the development of the application. I followed a Feature-First approach when it comes to Clean Architecture implementation. This is clearly separate the features files within the app.

I used Freezed to generate the data models in order to safely utilize it when consuming data from either local or remote source

### AI Tools Used

- **Claude**
- **WindSurt**
- **ChatGPT**

### Things To Improve

Roughly, I have spent around 18 hours. This may sound lengthy but I tried to make 1:1 copy from the Figma design to the project. Generating code from AI still needs some refactoring to assure that it is working.

If I have more time, I will be adding state plaholders including the empty, error, loading, and initial. Additionally, the coding part needs heavy refactoring as I have focused on making the widgets needed for each section. Some of the widgets are still not reusable as of the moment. Furthermore, I was not able to make the widgets responsive yet. :<

One thing that consumed time the most is implementing BLoC/Cubit. This is my first time using it on a project as I mainly used Riverpod but with more time, I can learn the proper usage of each BLoC and how it is structured with project to make things much more organized.

## Contact

For inquiries:

- Email: markristanfabellar.pro@gmail.com
- GitHub: [Tristaaaaan](https://github.com/Tristaaaaan)
