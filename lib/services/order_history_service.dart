import 'dart:convert';
import 'package:http/http.dart' as http;

// Model for a single order history item
class OrderHistory {
  final String invoice;
  final double amount;
  final String currency;
  final String paymentMode;
  final DateTime date;
  final double priceUsd;
  final String address;
  final List<String> products;

  OrderHistory({
    required this.invoice,
    required this.amount,
    required this.currency,
    required this.paymentMode,
    required this.date,
    required this.priceUsd,
    required this.address,
    required this.products,
  });

  // Factory constructor to create OrderHistory from JSON
  factory OrderHistory.fromJson(Map<String, dynamic> json) {
    return OrderHistory(
      invoice: json['invoice'] as String,
      amount: (json['amount'] as num).toDouble(),
      currency: json['currency'] as String,
      paymentMode: json['payment_mode'] as String,
      date: DateTime.parse(json['date'] as String),
      priceUsd: (json['price_usd'] as num).toDouble(),
      address: json['address'] as String,
      products: (json['products'] as List).map((e) => e as String).toList(),
    );
  }
}

// Service to fetch order history from API
class OrderHistoryService {
  static const String apiUrl = 'https://example.com/api/orders';

  // Fetch order history from API
  static Future<List<OrderHistory>> fetchOrderHistory() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((e) => OrderHistory.fromJson(e as Map<String, dynamic>)).toList();
    } else {
      throw Exception('Failed to load order history');
    }
  }
} 