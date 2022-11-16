// product_list_page를 위한 데이터를 가짐
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_dataapp/domain/product/product.dart';
import '../../../domain/product/product_http_repository.dart';

final productListViewModel =
    StateNotifierProvider<ProductListViewModel, List<Product>>((ref) {
  return ProductListViewModel(ref.read(productHttpRepository).findAll());
});

class ProductListViewModel extends StateNotifier<List<Product>> {
  ProductListViewModel(super.state);

  // 필요할때마다 갱신하는 메소드
  void onRefresh(List<Product> products) {
    state = products;
  }
}
