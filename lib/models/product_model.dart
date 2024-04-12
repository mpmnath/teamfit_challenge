class ProductModel {
  final String objectId;
  final String productId;
  final String queryId;
  final String title;
  final String description;
  final PriceModel price;
  final String category;
  final List<String> imageUrls;
  final VoucherModel voucher;
  final bool isNew;
  final List<String> deliveryTimes;
  final PartnerModel partner;

  ProductModel({
    required this.objectId,
    required this.productId,
    required this.queryId,
    required this.title,
    required this.description,
    required this.price,
    required this.category,
    required this.imageUrls,
    required this.voucher,
    required this.isNew,
    required this.deliveryTimes,
    required this.partner,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    // Parsing delivery times
    List<String> deliveryTimes = [];
    if (json['deliveryTimes'] != null) {
      json['deliveryTimes'].forEach((time) {
        deliveryTimes.add(time['name']);
      });
    }

    return ProductModel(
      objectId: json['objectID'],
      productId: json['productId'],
      queryId: json['queryId'],
      title: json['title'],
      description: json['description'],
      price: PriceModel.fromJson(json['price']),
      category: json['category']['name'],
      imageUrls: List<String>.from(json['images']),
      voucher: json['vouchers'] != null
          ? VoucherModel.fromJson(json['vouchers'][0])
          : VoucherModel(),
      isNew: json['flags'] != null ? json['flags'].contains('new') : false,
      deliveryTimes: deliveryTimes,
      partner: PartnerModel.fromJson(json['partner']),
    );
  }

  static List<ProductModel> parseList(List<dynamic> list) {
    return list.map((i) => ProductModel.fromJson(i)).toList();
  }
}

class VoucherModel {
  final String? text;
  final double? valuePercentage;

  VoucherModel({
    this.text,
    this.valuePercentage,
  });

  factory VoucherModel.fromJson(Map<String, dynamic> json) {
    return VoucherModel(
      text: json['text'],
      valuePercentage: json['valuePercentage'],
    );
  }
}

class PriceModel {
  final double value;
  final String? currency;
  final double valueFormer;
  final double salePercentage;

  PriceModel({
    required this.value,
    this.currency,
    required this.valueFormer,
    required this.salePercentage,
  });

  factory PriceModel.fromJson(Map<String, dynamic> json) {
    return PriceModel(
      value: json['value'],
      currency: json['currency'],
      valueFormer: json['valueFormer'],
      salePercentage: json['salePercentage'].toDouble(),
    );
  }
}

// partner model
class PartnerModel {
  final String alias;
  final String id;
  final String name;
  final List<String> paymentMethods;

  PartnerModel({
    required this.alias,
    required this.id,
    required this.name,
    required this.paymentMethods,
  });

  factory PartnerModel.fromJson(Map<String, dynamic> json) {
    return PartnerModel(
      alias: json['alias'],
      id: json['id'],
      name: json['name'],
      paymentMethods: List<String>.from(json['paymentMethods']),
    );
  }
}
