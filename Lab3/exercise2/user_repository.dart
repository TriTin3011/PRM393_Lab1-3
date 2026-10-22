import 'dart:convert';

import 'user.dart';

class UserRepository {
  Future<List<User>> getUsersFromInput(
      List<Map<String, dynamic>> inputUsers,
      ) async {
    await Future.delayed(
      const Duration(seconds: 1),
    );

    // Convert input data to JSON String
    final String jsonData = jsonEncode(inputUsers);

    // Decode JSON String back to Dart data
    final List<dynamic> jsonList = jsonDecode(jsonData);

    // Convert JSON objects to User objects
    return jsonList
        .map(
          (json) => User.fromJson(
        json as Map<String, dynamic>
        )
        ).toList();
  }
}