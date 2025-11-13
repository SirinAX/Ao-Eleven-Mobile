import 'package:flutter/material.dart';
import '../models/product_entry.dart';
import '../widgets/left_drawer.dart';
import '../widgets/product_entry_card.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import '../screens/product_detail.dart';

class ProductEntryListPage extends StatefulWidget {
  final bool myProductsOnly;
  const ProductEntryListPage({super.key, this.myProductsOnly = false});

  @override
  State<ProductEntryListPage> createState() => _ProductEntryListPageState();
}

class _ProductEntryListPageState extends State<ProductEntryListPage> {
  Future<List<ProductEntry>> fetchProducts(CookieRequest request) async {
    // Tambahkan query parameter jika myProductsOnly true
    final url = widget.myProductsOnly
        ? 'http://localhost:8000/products/json/?filter=my'
        : 'http://localhost:8000/products/json/';

    final response = await request.get(url);

    List<ProductEntry> listProducts = [];
    for (var d in response) {
      if (d != null) listProducts.add(ProductEntry.fromJson(d));
    }
    return listProducts;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.myProductsOnly ? 'My Products' : 'All Products'),
      ),
      drawer: const LeftDrawer(),
      body: FutureBuilder<List<ProductEntry>>(
        future: fetchProducts(request),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text(
                'Belum ada produk yang ditambahkan.',
                style: TextStyle(fontSize: 20, color: Color(0xff59A5D8)),
              ),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (_, index) => ProductEntryCard(
                product: snapshot.data![index],
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetailPage(
                        product: snapshot.data![index],
                      ),
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
