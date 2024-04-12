import 'package:dashboard_delight/models/product_model.dart';

// FakeResult class to represent the result of a fake API call
class FakeResult {
  final List<ProductModel> products;

  FakeResult({
    required this.products,
  });

  @override
  String toString() {
    return 'FakeResult{products: $products}';
  }

// creates a FakeResult instance from a JSON object
  factory FakeResult.fromJson(Map<String, dynamic> json) {
    final List<dynamic> hits = json['hits'] ?? [];

    // hard code values in the ProductModel constructor
    ProductModel product = ProductModel(
      objectId: 'dff8f5deddffa23feca6b64a89f84739',
      productId: 'afbc68f37efff223c09a165918ceb0ec',
      queryId: '30116',
      title: 'Big-Sofa Justo 310x110 cm Chenille Beige, Big Sofas',
      description:
          'Mit ihren schönen weichen Formen und einer ansprechenden Färbung in Beige wirkt die XXL-Couch Justo',
      price: PriceModel(
        value: 2399.9,
        currency: 'EUR',
        valueFormer: 2999.9,
        salePercentage: -20.0,
      ),
      category: 'Big Sofas',
      imageUrls: [
        '12280ad.jpg',
        '2ec5322.jpg',
        '3e90b71.jpg',
        '4588a89.jpg',
        '5b0f09e.jpg',
        '69e12f7.jpg'
      ],
      voucher: VoucherModel(
        text: 'extra bei Vorkasse',
        valuePercentage: 2.0,
      ),
      isNew: true,
      deliveryTimes: [
        'sofort lieferbar',
        'bis 2 Wochen',
        'bis 4 Wochen',
        'bis 8 Wochen',
        'Lieferung vor Weihnachten',
      ],
      partner: PartnerModel(
        alias: "partner_191",
        id: "c5992279-9dbf-43fb-a0f3-2433ce581315",
        name: "DELIFE",
        paymentMethods: [
          "PayPal, Rechnungkauf, Kreditkarte (Visa, Mastercard), Finanzierung, Vorkasse mit 2% Rabatt, Barabholung"
        ],
      ),
    );
    List<ProductModel> products = hits.map((item) => product).toList();
    //List<ProductModel> products = hits.map((item) => ProductModel.fromJson(item)).toList(); // uncomment this line to use the JSON data
    return FakeResult(
      products: products,
    );
  }
}
