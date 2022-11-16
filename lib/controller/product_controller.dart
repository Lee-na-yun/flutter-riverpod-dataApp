// view -> Controller에 요청
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_dataapp/domain/product/product.dart';
import 'package:riverpod_dataapp/domain/product/product_http_repository.dart';
import 'package:riverpod_dataapp/views/product/list/product_list_view_store.dart';

final productController = Provider<ProductController>((ref) {
  return ProductController(ref);
});

class ProductController {
  final Ref _ref;
  ProductController(this._ref);

  void findAll() {
    List<Product> productList = _ref.read(productHttpRepository).findAll();
    _ref.read(productListViewStore.notifier).onRefresh(productList);
    // 데이터만 받아서 vm에 데이터 갱신시켜 줌
  }

  void insert(Product productReqDto) {
    Product productRespDto =
        _ref.read(productHttpRepository).insert(productReqDto);
    _ref.read(productListViewStore.notifier).addProduct(productRespDto);
  }

  void deleteById(int id) {
    int result = _ref.read(productHttpRepository).deleteById(id);
    if (result == 1) {
      _ref.read(productListViewStore.notifier).removeProduct(id);
    }
  }
}
