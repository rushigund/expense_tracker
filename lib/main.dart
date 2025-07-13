import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'models/expense.dart';
import 'bloc/expense_bloc.dart';
import 'screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize Hive
  await Hive.initFlutter();
  
  // Register adapters
  Hive.registerAdapter(ExpenseAdapter());
  
  // Open expense box
  final expenseBox = await Hive.openBox<Expense>('expenses');
  
  runApp(MyApp(expenseBox: expenseBox));
}

class MyApp extends StatelessWidget {
  final Box<Expense> expenseBox;
  
  const MyApp({super.key, required this.expenseBox});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ExpenseBloc(expenseBox)..add(LoadExpenses()),
      child: MaterialApp(
        title: 'Expense Tracker',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          useMaterial3: true,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            elevation: 0,
          ),
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
