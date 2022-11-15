// product_list_page를 위한 데이터를 가짐
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_dataapp/domain/product/product.dart';

final productListViewModel =
    StateNotifierProvider<ProductListViewModel, List<Product>>((ref) {
  return ProductListViewModel();
});

class ProductListViewModel extends StateNotifier<List<Product>> {
  ProductListViewModel() : super([]);

  void onLoad(List<Product> products) {
    state = products;
  }
}
