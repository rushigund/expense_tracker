# Expense Tracker App

A Flutter-based expense tracking application with local storage using Hive and state management with BLoC pattern.

## Features

- ✅ Add and delete expense entries (Title, amount, date, category)
- ✅ View a list of all expenses with beautiful UI
- ✅ Show total expense summary
- ✅ Clean and responsive UI
- ✅ State management using BLoC
- ✅ Local data storage using Hive
- ✅ Category-based expense organization
- ✅ Date picker for expense dates
- ✅ Form validation

## Screenshots

The app features:
- **Home Screen**: Displays total expenses summary and list of all expenses
- **Add Expense Screen**: Form to add new expenses with validation
- **Delete Confirmation**: Safe deletion with confirmation dialog

## Getting Started

### Prerequisites

- Flutter SDK (latest stable version)
- Dart SDK
- Android Studio / VS Code with Flutter extensions

### Installation

1. **Clone or download the project**
   ```bash
   git clone <repository-url>
   cd expense_tracker
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Generate Hive adapters** (if needed)
   ```bash
   flutter packages pub run build_runner build
   ```

4. **Run the app**
   ```bash
   flutter run
   ```

## Project Structure

```
lib/
├── main.dart                 # App entry point with Hive initialization
├── models/
│   ├── expense.dart          # Expense data model with Hive annotations
│   └── expense.g.dart        # Generated Hive adapter
├── bloc/
│   └── expense_bloc.dart     # BLoC for state management
└── screens/
    ├── home_screen.dart      # Main screen with expense list
    └── add_expense_screen.dart # Add new expense form
```

## Dependencies

- **hive**: Local database storage
- **hive_flutter**: Flutter integration for Hive
- **flutter_bloc**: State management
- **equatable**: Value equality for BLoC
- **intl**: Internationalization and date formatting
- **uuid**: Unique ID generation

## Features in Detail

### 1. Expense Management
- Add expenses with title, amount, date, and category
- Delete expenses with confirmation dialog
- Form validation for all fields

### 2. Categories
- Predefined categories: General, Food, Transport, Shopping, Entertainment, Health, Education
- Category-specific icons for better visual organization

### 3. UI/UX
- Material Design 3 with modern styling
- Responsive layout that works on different screen sizes
- Beautiful gradient cards and smooth animations
- Intuitive navigation and user feedback

### 4. Data Persistence
- All data is stored locally using Hive
- No internet connection required
- Fast and reliable data access

### 5. State Management
- Clean architecture with BLoC pattern
- Reactive UI updates
- Error handling and loading states

## Usage

1. **Adding an Expense**:
   - Tap the floating action button (+)
   - Fill in the expense details
   - Select a category
   - Choose a date
   - Tap "Add Expense"

2. **Viewing Expenses**:
   - All expenses are displayed on the home screen
   - Total amount is shown at the top
   - Expenses are listed with category icons

3. **Deleting an Expense**:
   - Tap the delete icon on any expense card
   - Confirm deletion in the dialog

## Future Enhancements

- [ ] Firebase Authentication (optional bonus feature)
- [ ] Expense editing
- [ ] Expense filtering by category/date
- [ ] Expense statistics and charts
- [ ] Export functionality
- [ ] Multiple currencies
- [ ] Budget setting and tracking

## Troubleshooting

### Common Issues

1. **Hive adapter not found**:
   ```bash
   flutter packages pub run build_runner build --delete-conflicting-outputs
   ```

2. **Dependencies not found**:
   ```bash
   flutter clean
   flutter pub get
   ```

3. **Build errors**:
   - Ensure Flutter SDK is up to date
   - Check that all dependencies are compatible

## Contributing

Feel free to submit issues and enhancement requests!

## License

This project is open source and available under the [MIT License](LICENSE).