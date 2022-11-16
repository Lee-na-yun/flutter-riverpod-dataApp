import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_dataapp/controller/product_controller.dart';
import 'package:riverpod_dataapp/domain/product/product.dart';
import 'package:riverpod_dataapp/views/product/list/product_list_view_store.dart';

class ProductListPage extends ConsumerWidget {
  const ProductListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pm = ref.watch(productListViewStore);
    final pc = ref.read(productController); //객체를 하나 띄워놓고 읽기

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          pc.insert(Product(4, "호박", 2000));
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(title: Text("Product_list_page")),
      body: ListView.builder(
        itemCount: pm.length,
        itemBuilder: (context, index) => ListTile(
          key: ValueKey(pm[index].id),
          onTap: () {
            pc.deleteById(pm[index].id);
          },
          leading: Icon(Icons.account_balance_wallet),
          title: Text(
            "${pm[index].name}",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text("${pm[index].price}"),
        ),
      ),
    );
  }
}
