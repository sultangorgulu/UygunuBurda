import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uygunuburda/common/widgets/products/sortable/sortable_products.dart';
import 'package:uygunuburda/database/products_cloud.dart';
import 'package:uygunuburda/features/authentication/models/model/product_models.dart';
import 'package:uygunuburda/util/constants/sizes.dart';

class SearchPage extends StatefulWidget {
  final String searchQuery;

  const SearchPage({Key? key, required this.searchQuery}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Product> _products = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _searchProducts(widget.searchQuery);
  }

  void _searchProducts(String query) {
    // Firestore'dan ürünleri aramak için bir sorgu oluşturun
    final queryRef = FirebaseFirestore.instance
        .collection('Products')
        .where('Title', isGreaterThanOrEqualTo: query)
        .where('Title', isLessThanOrEqualTo: query + '\uf8ff');

    ProductsCloud.instance.fetchProductsByQuery(queryRef)
      .then((products) {
        setState(() {
          _products = products;
          _isLoading = false;
        });
      }).catchError((error) {
        // Hata durumunda kullanıcıyı bilgilendirin
        print(error);
        setState(() {
          _isLoading = false;
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.searchQuery} için arama sonuçları'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : _products.isEmpty
              ? Center(child: Text('No products found'))
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SortableProducts(
                    products: _products,
                  ),
                ),
    );
  }
}
