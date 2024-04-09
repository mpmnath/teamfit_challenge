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
  });
}

class VoucherModel {
  final String? code;
  final String? text;
  final String? percentage;
  final String? value;
  VoucherModel({
    this.code,
    this.text,
    this.percentage,
    this.value,
  });
}

class PriceModel {
  final double value;
  final String? currency;
  final double valueFormer;
  final int salePercentage;
  PriceModel({
    required this.value,
    this.currency,
    required this.valueFormer,
    required this.salePercentage,
  });
}
