import 'dart:io';

import '../exercise1/exercise1.dart';
import '../exercise2/exercise2.dart';
import '../exercise3/exercise3.dart';
import '../exercise4/exercise4.dart';
import '../exercise5/exercise5.dart';

Future<void> main() async {
  while (true) {
    print('\n===== LAB 3 =====');
    print('1. Product Model & Repository');
    print('2. User Repository with JSON');
    print('3. Async + Microtask Debugging');
    print('4. Stream Transformation');
    print('5. Factory Constructors & Cache');
    print('0. Exit');

    stdout.write('Choose an exercise: ');

    final input = stdin.readLineSync();
    final choice = int.tryParse(input ?? '');

    if (choice == null) {
      print('Invalid input. Please enter a number from 0 to 5.');
      continue;
    }

    switch (choice) {
      case 1:
        await exercise1();
        break;

      case 2:
        await exercise2();
        break;

      case 3:
        await exercise3();

        print('\nExplanation:');
        print(
          'Microtask chạy trước event callback vì sau khi code đồng bộ chạy xong, Dart sẽ xử lý hết microtask queue trước rồi mới chuyển sang event queue. Vì vậy scheduleMicrotask() được thực hiện trước Future(() { }).',
        );
        break;

      case 4:
        await exercise4();
        break;

      case 5:
        exercise5();
        break;

      case 0:
        print('Program ended.');
        return;

      default:
        print('Exercise not found. Please choose from 0 to 5.');
    }
  }
}