// product_list_page를 위한 데이터를 가짐
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_dataapp/domain/product/product.dart';
import '../../../domain/product/product_http_repository.dart';

final productListViewStore =
    StateNotifierProvider<ProductListViewStore, List<Product>>((ref) {
  return ProductListViewStore(ref.read(productHttpRepository).findAll());
});

class ProductListViewStore extends StateNotifier<List<Product>> {
  ProductListViewStore(super.state);

  // 필요할때마다 갱신하는 메소드
  void onRefresh(List<Product> products) {
    state = products;
  }

  void addProduct(Product productRespDto) {
    state = [...state, productRespDto];
  }

  void removeProduct(int id) {
    state = state.where((product) => product.id != id).toList();
  }
}
