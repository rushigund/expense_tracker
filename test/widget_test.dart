// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:expense_tracker/main.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/bloc/expense_bloc.dart';

void main() {
  group('Expense Tracker App Tests', () {
    testWidgets('App should start without crashing', (WidgetTester tester) async {
      // Initialize Hive for testing
      await Hive.initFlutter();
      Hive.registerAdapter(ExpenseAdapter());
      final expenseBox = await Hive.openBox<Expense>('expenses');
      
      // Build our app and trigger a frame.
      await tester.pumpWidget(MyApp(expenseBox: expenseBox));
      
      // Verify that the app title is displayed
      expect(find.text('Expense Tracker'), findsOneWidget);
    });
  });
}
