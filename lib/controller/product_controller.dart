// view -> Controller에 요청
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_dataapp/domain/product/product.dart';
import 'package:riverpod_dataapp/domain/product/product_http_repository.dart';

final productController = Provider((ref) {
  return ProductController(ref);
});

/*class ProductController {
  ProductHttpRepository repo = ProductHttpRepository();*/
class ProductController {
  final Ref _ref;
  ProductController(this._ref);

  /*void findAll() {
    List<Product> productList = repo
        .findAll(); // 이 데이터는 provider의 창고(store)에 주기 //view는 controller에 요청만 함
  }*/
  void findAll() {
    List<Product> productList = _ref.read(productHttpRepository).findAll();
    _ref.read(productListViewModel.notifier).onLoad(productList);
  }
}
