import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/expense.dart';

// Events
abstract class ExpenseEvent extends Equatable {
  const ExpenseEvent();

  @override
  List<Object?> get props => [];
}

class LoadExpenses extends ExpenseEvent {}

class AddExpense extends ExpenseEvent {
  final String title;
  final double amount;
  final DateTime date;
  final String category;

  const AddExpense({
    required this.title,
    required this.amount,
    required this.date,
    this.category = 'General',
  });

  @override
  List<Object?> get props => [title, amount, date, category];
}

class DeleteExpense extends ExpenseEvent {
  final String id;

  const DeleteExpense(this.id);

  @override
  List<Object?> get props => [id];
}

// States
abstract class ExpenseState extends Equatable {
  const ExpenseState();

  @override
  List<Object?> get props => [];
}

class ExpenseInitial extends ExpenseState {}

class ExpenseLoading extends ExpenseState {}

class ExpenseLoaded extends ExpenseState {
  final List<Expense> expenses;
  final double totalAmount;

  const ExpenseLoaded({
    required this.expenses,
    required this.totalAmount,
  });

  @override
  List<Object?> get props => [expenses, totalAmount];
}

class ExpenseError extends ExpenseState {
  final String message;

  const ExpenseError(this.message);

  @override
  List<Object?> get props => [message];
}

// Bloc
class ExpenseBloc extends Bloc<ExpenseEvent, ExpenseState> {
  final Box<Expense> _expenseBox;

  ExpenseBloc(this._expenseBox) : super(ExpenseInitial()) {
    on<LoadExpenses>(_onLoadExpenses);
    on<AddExpense>(_onAddExpense);
    on<DeleteExpense>(_onDeleteExpense);
  }

  void _onLoadExpenses(LoadExpenses event, Emitter<ExpenseState> emit) {
    emit(ExpenseLoading());
    try {
      final expenses = _expenseBox.values.toList();
      final totalAmount = expenses.fold<double>(0, (sum, expense) => sum + expense.amount);
      emit(ExpenseLoaded(expenses: expenses, totalAmount: totalAmount));
    } catch (e) {
      emit(ExpenseError('Failed to load expenses: $e'));
    }
  }

  void _onAddExpense(AddExpense event, Emitter<ExpenseState> emit) {
    try {
      final expense = Expense(
        title: event.title,
        amount: event.amount,
        date: event.date,
        category: event.category,
      );
      
      _expenseBox.add(expense);
      
      final expenses = _expenseBox.values.toList();
      final totalAmount = expenses.fold<double>(0, (sum, exp) => sum + exp.amount);
      emit(ExpenseLoaded(expenses: expenses, totalAmount: totalAmount));
    } catch (e) {
      emit(ExpenseError('Failed to add expense: $e'));
    }
  }

  void _onDeleteExpense(DeleteExpense event, Emitter<ExpenseState> emit) {
    try {
      final expenseToDelete = _expenseBox.values.firstWhere((expense) => expense.id == event.id);
      expenseToDelete.delete();
      
      final expenses = _expenseBox.values.toList();
      final totalAmount = expenses.fold<double>(0, (sum, exp) => sum + exp.amount);
      emit(ExpenseLoaded(expenses: expenses, totalAmount: totalAmount));
    } catch (e) {
      emit(ExpenseError('Failed to delete expense: $e'));
    }
  }
} 