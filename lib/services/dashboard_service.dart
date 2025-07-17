import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/transaction_model.dart';

// Model for the entire dashboard data
class DashboardData {
  final String userName;
  final double amountCollected;
  final int ordersDeliveredToday;
  final bool isOnline;
  final int deliveryOrdersCount;
  final List<TransactionModel> recentTransactions;

  DashboardData({
    required this.userName,
    required this.amountCollected,
    required this.ordersDeliveredToday,
    required this.isOnline,
    required this.deliveryOrdersCount,
    required this.recentTransactions,
  });

  // Factory constructor to create DashboardData from JSON
  factory DashboardData.fromJson(Map<String, dynamic> json) {
    return DashboardData(
      userName: json['userName'] as String,
      amountCollected: (json['amountCollected'] as num).toDouble(),
      ordersDeliveredToday: json['ordersDeliveredToday'] as int,
      isOnline: json['isOnline'] as bool,
      deliveryOrdersCount: json['deliveryOrdersCount'] as int,
      recentTransactions: (json['recentTransactions'] as List)
          .map((e) => TransactionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

// Service to fetch dashboard data from API
class DashboardService {
  static const String apiUrl = 'https://example.com/api/dashboard';

  // Fetch dashboard data from API
  static Future<DashboardData> fetchDashboardData() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      final data = json.decode(response.body) as Map<String, dynamic>;
      return DashboardData.fromJson(data);
    } else {
      throw Exception('Failed to load dashboard data');
    }
  }
} 