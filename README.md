# revo

This application enables users to manage business calls with ease.

The app begins with an onboarding flow where users create an account to proceed. During setup, they are asked to provide key business information, including location, industry, business phone number, and preferred notification method.

Once setup is complete, users are taken to the dashboard, where they can view call history, summaries, and scheduled jobs. After creating an account, users can further customize their experience through detailed account settings.

Users can also search for, create, and modify their job sources.

<img width="1920" height="1080" alt="REVO" src="https://github.com/user-attachments/assets/7764db48-e99c-48a1-96ed-029ac3dc630a" />

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
    │   │   ├── utils/            # Shared utils
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

- **Calls:** `calls` collection

This collection contains the calls.

- **Team:** `team` collection

This collection contains the teams/groups.

- **Invoice:** `invoice` collection

This collection contains the invoices.

- **Companies:** `companies` collection

This collection contains the companies.

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

I implemented flavors to ensure the project is linked to the correct Firebase environment and to properly manage different versions of the application. This guarantees that the production project is not affected during development. I followed a Feature-First approach for the Clean Architecture implementation to clearly separate files and responsibilities within the app.

I used Freezed to generate data models, allowing for safer and more consistent data handling when consuming information from either local or remote sources.

### AI Tools Used

- **Claude**
- **WindSurt**
- **ChatGPT**

### Things To Improve

Roughly, I have spent around 18 hours. This may sound lengthy but I tried to make 1:1 copy from the Figma design to the project. Generating code from AI still needs some refactoring to assure that it is working.

If I have more time, I will be adding state placeholders including the empty, error, loading, and initial. Additionally, the coding part needs heavy refactoring as I have focused on making the widgets needed for each section. Some of the widgets are still not reusable as of the moment. Furthermore, I was not able to make the widgets responsive yet. :<

One thing that consumed time the most is implementing BLoC/Cubit. This is my first time using it on a project as I mainly used Riverpod but with more time, I can learn the proper usage of each BLoC and how it is structured with project to make things much more organized.

## Demo Link

https://drive.google.com/file/d/1mPPgyg2U0Emwyhn7cMC1erUVmRJrkz3S/view?usp=sharing

## Note

The answers for PART 1 is already included in this READme as well.

## Contact

For inquiries:

- Email: markristanfabellar.pro@gmail.com
- GitHub: [Tristaaaaan](https://github.com/Tristaaaaan)
