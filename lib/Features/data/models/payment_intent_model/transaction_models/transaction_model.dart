class TransactionModel {
  final AmountModel amountModel;
  final String description;
  final ItemsListModel itemsListModel;

  TransactionModel({
    required this.amountModel,
    required this.description,
    required this.itemsListModel,
  });
  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      amountModel: AmountModel.fromJson(json['amount']),
      description: json['description'],
      itemsListModel: json['item_list'],
    );
  }
  Map<String, dynamic> toJson({
    required AmountModel amountModel,
    required DetailsModel detailsModel,
    required ItemsListModel itemsListModel,
  }) {
    return {
      'amount': amountModel.toJosn(detailsModel: detailsModel),
      'description': description,
      'item_list': itemsListModel.toJosn(),
    };
  }
}

class ItemsListModel {
  final List<ItemsModel> items;
  ItemsListModel({required this.items});
  factory ItemsListModel.fromJson(Map<String, dynamic> json) {
    return ItemsListModel(items: json['items']);
  }
  Map<String, dynamic> toJosn() {
    return {
      'items': items.map((e) => e.toJson()).toList(),
    };
  }
}

class ItemsModel {
  final String name;
  final int quantity;
  final String price;
  final String currency;

  ItemsModel({
    required this.name,
    required this.quantity,
    required this.price,
    required this.currency,
  });
  factory ItemsModel.fromJson(Map<String, dynamic> json) {
    return ItemsModel(
      name: json['name'],
      quantity: json['quantity'],
      price: json['price'],
      currency: json['currency'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'quantity': quantity,
      'price': price,
      'currency': currency,
    };
  }
}

class AmountModel {
  final String total;
  final String currency;
  final DetailsModel detailsModel;

  AmountModel({
    required this.total,
    required this.currency,
    required this.detailsModel,
  });
  factory AmountModel.fromJson(Map<String, dynamic> json) {
    return AmountModel(
      total: json['total'],
      currency: json['currency'],
      detailsModel: DetailsModel.fromJson(json['details']),
    );
  }
  Map<dynamic, dynamic> toJosn({required DetailsModel detailsModel}) {
    return {
      'total': total,
      'currency': currency,
      'details': detailsModel.toJosn(),
    };
  }
}

class DetailsModel {
  final String subtotal;
  final String shipping;
  final int shippingDiscount;

  DetailsModel({
    required this.subtotal,
    required this.shipping,
    required this.shippingDiscount,
  });
  factory DetailsModel.fromJson(Map<String, dynamic> json) {
    return DetailsModel(
      subtotal: json['subtotal'],
      shipping: json['shipping'],
      shippingDiscount: json['shipping_discount'],
    );
  }
  Map<String, dynamic> toJosn() {
    return {
      'subtotal': subtotal,
      'shipping': shipping,
      'shippingDiscount': shippingDiscount,
    };
  }
}
