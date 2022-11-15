import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_dataapp/controller/product_controller.dart';

class ProductListPage extends ConsumerWidget {
  const ProductListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pc = ref.read(productController); //객체를 하나 띄워놓고 읽기
    pc.findAll();

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      appBar: AppBar(title: Text("Product_list_page")),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) => ListTile(
          onTap: () {},
          leading: Icon(Icons.account_balance_wallet),
          title: Text(
            "바나나",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text("1000"),
        ),
      ),
    );
  }
}