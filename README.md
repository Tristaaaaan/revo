# revo

A new Flutter project.

## Core Technologies

### Top Level

📦 revo
├─ 📱 android/ # Native Android code
├─ 🍎 ios/ # Native iOS code
├─ 🌐 web/ # Web platform code
├─ 🖼 assets/ # Static assets
│ ├─ 🔤 fonts/
│ ├─ 🖼 images/
│ └─ 🎨 icons/
├─ 🧪 test/ # Unit & widget tests
├─ 💻 lib/ # Main Dart code
│ ├─ main.dart
│ ├─ app.dart
│ ├─ core/
│ │ ├─ constants/
│ │ ├─ utils/
│ │ ├─ routing/
│ │ ├─ di/
│ │ ├─ theme/
│ │ └─ extensions/
│ ├─ shared/
│ │ ├─ widgets/
│ │ ├─ models/
│ │ └─ enums/
│ ├─ features/
│ │ ├─ auth/
│ │ │ ├─ data/
│ │ │ ├─ domain/
│ │ │ └─ presentation/
│ │ ├─ chat/
│ │ │ ├─ data/
│ │ │ ├─ domain/
│ │ │ └─ presentation/
│ │ └─ other_features/
│ ├─ l10n/
│ └─ generated/
├─ 📦 pubspec.yaml
└─ 📄 README.md

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
