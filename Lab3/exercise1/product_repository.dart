import 'dart:async';
import 'product.dart';

class ProductRepository {
  final List<Product> _products = [
    Product(
      id: 1,
      name: 'Iphone 18 Promax Burgundy',
      price: 2997,
    ),
    Product(
      id: 2,
      name: 'Iphone Duo',
      price: 3199,
    ),
  ];

  //broadcast() cho phép nhiều listener cùng nghe một Stream
  final StreamController<Product> _controller =
  StreamController<Product>.broadcast();

  // Trả về danh sách product sau khoảng thời gian
  Future<List<Product>> getAll() async {
    await Future.delayed(
      Duration(seconds: 1),
    );

    return _products;
  }

  // trả về từng product trong khoản thời gian
  Stream<Product> liveAdd() {
    return _controller.stream;
  }

  // Tạo ID mới tự động tăng
  int _generateNextId() {
    // Nếu danh sách rỗng thì ID bắt đầu từ 1
    if (_products.isEmpty) {
      return 1;
    }

    // Lấy ID lớn nhất hiện tại rồi cộng thêm 1
    final maxId = _products
        .map((product) => product.id)
        .reduce((a, b) => a > b ? a : b);

    return maxId + 1;
  }

  //
  void addProduct(String name, double price) {
    // tạo Product mới với ID tự động tăng
    final product = Product(
      id: _generateNextId(),
      name: name,
      price: price,
    );

    // thêm Product vào List
    _products.add(product);

    // thêm product vào luồng Stream
    _controller.add(product);
  }

  Future<void> close() async {
    return _controller.close();
  }
}