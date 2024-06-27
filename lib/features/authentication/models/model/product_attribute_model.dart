class ProductAttributeModel {
  String? name;
  final List<String>? values;

  ProductAttributeModel({this.name, this.values});

  toJson() {
    return {'Name': name, 'Values': values};
  }

  ProductAttributeModel.fromJson(Map<String, dynamic> snapshot)
      : name = snapshot.containsKey('Name') ? snapshot['Name'] ?? '' : '',
        values = List<String>.from(snapshot['Values'] ?? '');
}