import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_dataapp/domain/product/product.dart';

// 생성자주입
final productHttpRepository = Provider<ProductHttpRepository>((ref) {
  return ProductHttpRepository();
});

class ProductHttpRepository {
  // 가짜데이터
  List<Product> list = [
    Product(1, "바나나", 1000),
    Product(2, "딸기", 2000),
    Product(3, "참외", 3000),
  ];

  Product findById(int id) {
    // http 통신코드 필요 - API문서 참조 // 통신은 메모리가 함
    Product product = list.singleWhere((product) => product.id == id);
    return product; //통신없이 데이터 바인딩 중
  }

  List<Product> findAll() {
    // http 통신코드 필요
    return list;
  }

  // name, price값만 받음
  Product insert(Product product) {
    // http 통신코드 필요 (product 전송)
    product.id = 4;
    list = [...list, product];
    return product;
  }

  Product updateById(int id, Product productDto) {
    // http 통신코드 필요
    list = list.map((product) {
      if (product.id == id) {
        product = productDto;
        return product;
      } else {
        return product;
      }
    }).toList();
    productDto.id = id;
    return productDto;
  }

  int deleteById(int id) {
    // http 통신코드 필요
    list.where((product) => product.id != id).toList();
    if (id == 4) {
      return -1;
    } else {
      return 1;
    }
  }
}
