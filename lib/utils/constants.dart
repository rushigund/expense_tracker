import 'package:flutter/material.dart';

class AppConstants {
  // Categories
  static const List<String> categories = [
    'General',
    'Food',
    'Transport',
    'Shopping',
    'Entertainment',
    'Health',
    'Education',
  ];

  // Category Icons
  static IconData getCategoryIcon(String category) {
    switch (category.toLowerCase()) {
      case 'food':
        return Icons.restaurant;
      case 'transport':
        return Icons.directions_car;
      case 'shopping':
        return Icons.shopping_bag;
      case 'entertainment':
        return Icons.movie;
      case 'health':
        return Icons.medical_services;
      case 'education':
        return Icons.school;
      default:
        return Icons.receipt;
    }
  }

  // Colors
  static const Color primaryColor = Colors.blue;
  static const Color accentColor = Colors.blueAccent;
  static const Color errorColor = Colors.red;
  static const Color successColor = Colors.green;
  
  // Text Styles
  static const TextStyle titleStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );
  
  static const TextStyle subtitleStyle = TextStyle(
    fontSize: 14,
    color: Colors.grey,
  );
  
  static const TextStyle amountStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.red,
  );
} 