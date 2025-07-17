import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/transaction_model.dart';

// Model for the wallet data
class WalletData {
  final String userName;
  final double availableBalance;
  final double bankReceived;
  final double cashReceived;
  final List<TransactionModel> transactions;

  WalletData({
    required this.userName,
    required this.availableBalance,
    required this.bankReceived,
    required this.cashReceived,
    required this.transactions,
  });

  // Factory constructor to create WalletData from JSON
  factory WalletData.fromJson(Map<String, dynamic> json) {
    return WalletData(
      userName: json['userName'] as String,
      availableBalance: (json['availableBalance'] as num).toDouble(),
      bankReceived: (json['bankReceived'] as num).toDouble(),
      cashReceived: (json['cashReceived'] as num).toDouble(),
      transactions: (json['transactions'] as List)
          .map((e) => TransactionModel(
                title: e['type'] as String,
                dateTime: DateTime.parse(e['datetime'] as String),
                paymentMethod: '', // Not used in wallet, can be empty
                amount: (e['amount'] as num).toDouble(),
                tip: null,
              ))
          .toList(),
    );
  }
}

// Service to fetch wallet data from API
class WalletService {
  static const String apiUrl = 'https://example.com/api/wallet';

  // Fetch wallet data from API
  static Future<WalletData> fetchWalletData() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      final data = json.decode(response.body) as Map<String, dynamic>;
      return WalletData.fromJson(data);
    } else {
      throw Exception('Failed to load wallet data');
    }
  }
} 