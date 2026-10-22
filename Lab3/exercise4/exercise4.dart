
Future<void> exercise4() async {
  print('===== EXERCISE 4 =====');

  // Tạo một Stream gồm các số từ 1 đến 5.
  final Stream<int> numberStream =
  Stream<int>.fromIterable([1, 2, 3, 4, 5]);

  // Dùng map() để bình phương từng số trong Stream.
  final Stream<int> squaredStream =
  numberStream.map((number) => number * number);

  // Dùng where() để chỉ giữ lại các số chẵn.
  final Stream<int> evenStream =
  squaredStream.where((number) => number.isEven);

  // Lắng nghe từng giá trị được phát ra từ Stream và in ra console.
  await for (final value in evenStream) {
    print(value);
  }
}