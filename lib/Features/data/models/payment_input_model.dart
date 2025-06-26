class PaymentInputModel {
  final String currency;
  final String customerId;
  final num amount;

  PaymentInputModel({
    required this.currency,
    required this.customerId,
    required this.amount,
  });
  Map<String, dynamic> toJson() {
    return {
      'currency': currency,
      'amount': amount,
      'customer': customerId,
    };
  }
}
