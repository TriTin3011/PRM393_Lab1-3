import 'dart:async';

Future<void> exercise3() async {
  print('===== EXERCISE 3 =====');

  print('1. Start');

  scheduleMicrotask(() {
    print('3. Microtask');
  });

  Future(() {
    print('4. Future event');
  });

  print('2. End');
  await Future.delayed(
    const Duration(milliseconds: 100),
  );
  // print('Microtask chạy trước event callback vì sau khi code đồng bộ chạy xong, Dart sẽ xử lý hết microtask queue trước rồi mới chuyển sang event queue. Vì vậy scheduleMicrotask() được thực hiện trước Future(() { }).');

}
