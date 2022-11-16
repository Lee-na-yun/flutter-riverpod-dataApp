// view -> Controller에 요청
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_dataapp/domain/product/product.dart';
import 'package:riverpod_dataapp/domain/product/product_http_repository.dart';
import 'package:riverpod_dataapp/main.dart';
import 'package:riverpod_dataapp/views/components/my_alert_dialog.dart';
import 'package:riverpod_dataapp/views/product/list/product_list_view_store.dart';

final productController = Provider<ProductController>((ref) {
  return ProductController(ref);
});

/*
*  컨트롤러: 비지니스 로직 담당
* - 레파지토리에게 응답 받고
* - view에 전달
*/
class ProductController {
  final context = navigatorKey.currentContext!; // 느낌표(!) 넣어주면 null이 아니라는 뜻
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
    } else {
      showCupertinoDialog(
        context: context,
        builder: (context) => MyAlertDialog(msg: "삭제에 실패하였습니다."),
      );
    }
  }

  void updateById(int id, Product productDto) {
    Product productRespDto =
        _ref.read(productHttpRepository).updateById(id, productDto);
    _ref.read(productListViewStore.notifier).updateProduct(productRespDto);
  }
}
