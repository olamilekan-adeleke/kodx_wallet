import 'dart:convert';

class WalletModel {
  WalletModel({
    required this.totalReceived,
    required this.totalSent,
    required this.balance,
  });

  final int totalReceived;
  final int totalSent;
  final int balance;

  factory WalletModel.fromJson(String str) {
    return WalletModel.fromMap(json.decode(str));
  }

  String toJson() => json.encode(toMap());

  factory WalletModel.fromMap(Map<String, dynamic> json) {
    return WalletModel(
      totalReceived: json["total_received"] as int,
      totalSent: json["total_sent"] as int,
      balance: json["balance"] as int,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "total_received": totalReceived,
      "total_sent": totalSent,
      "balance": balance,
    };
  }
}
