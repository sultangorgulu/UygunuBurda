class ProductVariationModel {
  final String id;
  String sku;
  String image;
  String? description;
  double price;
  double salePrice;
  int stock;
  Map<String, String> attributesValues;

  ProductVariationModel({
    required this.id,
    this.sku = '',
    this.image = '',
    this.description = '',
    this.price = 0.0,
    this.salePrice = 0.0,
    this.stock = 0,
    required this.attributesValues,
  });

  static ProductVariationModel empty() => ProductVariationModel(
        id: '',
        attributesValues: {},
      );

  toJson() {
    return {
      'Id': id,
      'Image': image,
      'Price': price,
      'SalesPrice': salePrice,
      'SKU': sku,
      'Stock': stock,
      'AttributesValues': attributesValues,
    };
  }

  ProductVariationModel.fromJson(Map<String, dynamic> snapshot)
      : price = double.parse((snapshot['Price'] ?? 0.0).toString()),
        salePrice = double.parse((snapshot['SalesPrice'] ?? 0.0).toString()),
        image = snapshot['Image'] ?? '',
        stock = snapshot['Stock'] ?? 0,
        sku = snapshot['SKU'] ?? '',
        attributesValues =
            Map<String, String>.from(snapshot['AttributesValues'] ?? ''),
        id = snapshot['Id'] ?? '';
}