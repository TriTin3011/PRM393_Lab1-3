import 'dart:io';

import 'user_repository.dart';

Future<void> exercise2() async {
  print('===== EXERCISE 2 =====');

  final repository = UserRepository();

  final count = readPositiveInt(
    'How many users do you want to enter? ',
  );

  final List<Map<String, dynamic>> inputUsers = [];

  for (int i = 0; i < count; i++) {
    print('\n--- User ${i + 1} ---');

    final name = readNonEmptyString(
      'Enter name: ',
    );

    final email = readEmail(
      'Enter email: ',
    );

    inputUsers.add({
      'name': name,
      'email': email,
    });
  }

  try {
    print('\nProcessing JSON...');

    final users =
    await repository.getUsersFromInput(inputUsers);

    print('\n--- Parsed Users ---');

    for (final user in users) {
      print(user);
    }
  } catch (e) {
    print('Error: $e');
  }
}



int readPositiveInt(String message) {
  while (true) {
    stdout.write(message);

    final input = stdin.readLineSync();

    if (input == null || input.trim().isEmpty) {
      print('Input cannot be empty.');
      continue;
    }

    final value = int.tryParse(input.trim());

    if (value == null || value <= 0) {
      print('Please enter a positive integer.');
      continue;
    }

    return value;
  }
}



String readNonEmptyString(String message) {
  while (true) {
    stdout.write(message);

    final input = stdin.readLineSync();

    if (input == null || input.trim().isEmpty) {
      print('Input cannot be empty.');
      continue;
    }

    return input.trim();
  }
}

String readEmail(String message) {
  while (true) {
    stdout.write(message);

    final input = stdin.readLineSync();

    if (input == null || input.trim().isEmpty) {
      print('Email cannot be empty.');
      continue;
    }

    final email = input.trim();

    if (!email.contains('@') || !email.contains('.')) {
      print('Invalid email format.');
      continue;
    }

    return email;
  }
}