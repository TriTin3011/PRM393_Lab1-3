import 'settings.dart';

void exercise5() {
  print('===== EXERCISE 5 =====');

  // Gọi Settings() hai lần.
  final Settings a = Settings();
  final Settings b = Settings();

  // Kiểm tra a và b có cùng trỏ đến một object hay không.
  print('\na và b có cùng object không? ${identical(a, b)}');

  // Hiển thị theme trước khi thay đổi.
  print('\n--- Before changing theme ---');
  print('Theme từ a: ${a.theme}');
  print('Theme từ b: ${b.theme}');

  // Thay đổi theme thông qua biến a.
  a.theme = 'dark';

  // Hiển thị theme sau khi thay đổi.
  print('\n--- After changing theme ---');
  print('Theme từ a: ${a.theme}');
  print('Theme từ b: ${b.theme}');

  // Vì a và b cùng trỏ đến một object,
  // khi theme của a thay đổi thì theme của b cũng thay đổi.
}