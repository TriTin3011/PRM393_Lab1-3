import 'dart:io';
import 'product_repository.dart';

Future<void> exercise1() async {
  print('===== EXERCISE 1 =====');

  final repository = ProductRepository();

  // Lắng nghe Product mới được thêm vào Stream
  final subscription = repository.liveAdd().listen((product) {
    print('\nNew product added: $product');
  });

  // Lấy danh sách Product hiện tại
  final products = await repository.getAll();

  print('\n--- Current Products ---');

  if (products.isEmpty) {
    print('No products available.');
  } else {
    for (final product in products) {
      print(product);
    }
  }

  // Nhập số lượng Product muốn thêm
  final count = readPositiveInt(
    'How many products do you want to add: ',
  );

  for (int i = 0; i < count; i++) {
    print('\n--- Product ${i + 1} ---');

    // Nhập tên Product
    final name = readNonEmptyString(
      'Enter name: ',
    );

    // Nhập giá Product
    final price = readPositiveDouble(
      'Enter price: ',
    );

    // Thêm Product vào Repository
    // ID sẽ được tự động tạo trong ProductRepository
    repository.addProduct(
      name,
      price,
    );
  }

  // Chờ Stream xử lý xong các event
  await Future.delayed(
    const Duration(milliseconds: 100),
  );

  await subscription.cancel();
  await repository.close();
}


// Đọc số nguyên dương
int readPositiveInt(String message) {
  while (true) {
    stdout.write(message);

    final input = stdin.readLineSync();

    if (input == null || input.trim().isEmpty) {
      print('Error: Input cannot be empty.');
      continue;
    }

    final value = int.tryParse(input.trim());

    if (value == null) {
      print('Error: Please enter a valid integer.');
      continue;
    }

    if (value <= 0) {
      print('Error: Number must be greater than 0.');
      continue;
    }

    return value;
  }
}


// Đọc số thực dương
double readPositiveDouble(String message) {
  while (true) {
    stdout.write(message);

    final input = stdin.readLineSync();

    if (input == null || input.trim().isEmpty) {
      print('Error: Input cannot be empty.');
      continue;
    }

    final value = double.tryParse(input.trim());

    if (value == null) {
      print('Error: Please enter a valid number.');
      continue;
    }

    if (value <= 0) {
      print('Error: Price must be greater than 0.');
      continue;
    }

    return value;
  }
}


// Đọc chuỗi không được để trống
String readNonEmptyString(String message) {
  while (true) {
    stdout.write(message);

    final input = stdin.readLineSync();

    if (input == null || input.trim().isEmpty) {
      print('Error: Name cannot be empty.');
      continue;
    }

    return input.trim();
  }
}