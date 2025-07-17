class TransactionModel {
  final String title;
  final DateTime dateTime;
  final String paymentMethod;
  final double amount;
  final double? tip;

  TransactionModel({
    required this.title,
    required this.dateTime,
    required this.paymentMethod,
    required this.amount,
    this.tip,
  });

  // Factory constructor to create a TransactionModel from JSON
  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      title: json['title'] as String,
      dateTime: DateTime.parse(json['dateTime'] as String),
      paymentMethod: json['paymentMethod'] as String,
      amount: (json['amount'] as num).toDouble(),
      tip: json['tip'] != null ? (json['tip'] as num).toDouble() : null,
    );
  }
} 