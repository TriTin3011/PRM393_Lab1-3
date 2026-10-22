import 'dart:io';
import 'dart:convert';

Future<void> main() async {
  while (true) {
    print('\n===== LAB 2 =====');
    print('1. Basic Syntax & Data Types');
    print('2. Collections & Operators');
    print('3. Control Flow & Functions');
    print('4. Intro to OOP');
    print('5. Async, Future, Null Safety & Streams');
    print('Other number: Exit');

    stdout.write('\nChoose exercise (1-5): ');

    int? choice = int.tryParse(stdin.readLineSync() ?? '');

    switch (choice) {
      case 1:
        exercise1();
        break;

      case 2:
        exercise2();
        break;

      case 3:
        exercise3();
        break;

      case 4:
        exercise4();
        break;

      case 5:
        await exercise5();
        break;

      default:
        print('\nProgram stopped.');
        return;
    }
  }
}

// ========================================
// EXERCISE 1 - Basic Syntax & Data Types
// ========================================
void exercise1() {
  print('\n===== EXERCISE 1 =====');

  // Int
  int age;

  // Double
  double height;

  // String
  String name;

  // bool
  bool isStudent;

  // Nhập age với kiểu int
  while(true){
    stdout.write('Enter your Age (int): ');
    //Nhận giá trị nhập vào
    String input = stdin.readLineSync() ?? '';

    //Parse giá trị nhập vào thành kiểu int
    int? value = int.tryParse(input);

    if(value != null){
      age = value;
      break;
    }

    print('Invalid!');
    print('Please enter an Integer.\n');

  }

  // Nhập height với kiểu double
  while(true){
    stdout.write('Enter your Height (double) (m): ');
    //Nhận giá trị nhập vào
    String input = stdin.readLineSync() ?? '';

    //Parse giá trị nhập vào thành kiểu double
    double? value = double.tryParse(input);

    if(value != null){
      height = value;
      break;
    }

    print('Invalid!');
    print('Please enter an Double.\n');

  }

  // Nhập height với kiểu String
  while(true){
    stdout.write('Enter your Name (String): ');
    //Nhận giá trị nhập vào
    String input = stdin.readLineSync(encoding: utf8) ?? '';

    if(input.trim().isNotEmpty){
      name = input;
      break;
    }

    print('Invalid!');
    print('Please enter an String.\n');

  }

  // Nhập height với kiểu String
  while (true) {
    stdout.write('Are you a student? (true/false): ');
    String input = stdin.readLineSync()?.toLowerCase().trim() ?? '';

    if (input == 'true') {
      isStudent = true;
      break;
    } else if (input == 'false') {
      isStudent = false;
      break;
    }

    print('Invalid input! Please enter true or false.\n');
  }

  print('\n===== YOUR INFORMATION =====');
  print('Name: $name');
  print('Age: $age');
  print('Height: $height');
  print('isStudent: $isStudent');
  if(isStudent) {
    print('=> Your are Student FPTU');
  }else{
    print('=> Your aren\'t Student FPTU');
  }
  // String interpolation with expression
  print('Next year, $name will be ${age + 1} years old.');

}

// ========================================
// EXERCISE 2 - Collections & Operators
// ========================================
void exercise2() {

  List<int> numbers = [10, 20, 30, 40];
  Set<int> uniqueNumbers = { 10, 20, 20, 30, 30, 40 };
  Map<String, double> scores = {
    'Math': 9.0,
    'Physics': 8.5,
    'Chemistry': 8.0
  };


  print('\n===== EXERCISE 2 =====');

  //1. LIST
  print('\n--- LIST ---');
  print('Từ các phần tử thì có thể thêm và xóa khỏi List:');
  print('Original List: $numbers');

  // Truy cập phần tử bằng index
  print('First value: ${numbers[0]}');
  print('Third value: ${numbers[2]}');

  // Nhập một số để thêm vào List
  int newNumber;

  while (true) {
    stdout.write('Enter an integer to add to List: ');

    String input = stdin.readLineSync() ?? '';
    int? value = int.tryParse(input);

    if (value != null) {
      newNumber = value;
      break;
    }

    print('Invalid!');
    print('Please enter an integer.\n');
  }

  // add()
  numbers.add(newNumber);

  print('After add($newNumber): $numbers');

  // Nhập số muốn xóa
  stdout.write('Enter a number to remove: ');

  int? removeNumber =
  int.tryParse(stdin.readLineSync() ?? '');

  if (removeNumber != null &&
      numbers.contains(removeNumber)) {

    numbers.remove(removeNumber);

    print('After remove($removeNumber): $numbers');
  } else {
    print('Number not found in List.');
  }

  // 2. OPERATORS
  print('\n--- OPERATORS ---');

  int a = numbers[0];
  int b = numbers[1];

  print('Lấy 2 phần tử đầu để thực hiện: ');

  // Arithmetic operators
  print('a = $a');
  print('b = $b');

  print('a + b = ${a + b}');
  print('a - b = ${a - b}');

  // Comparison operator
  print('a == b: ${a == b}');

  // Logical operator
  print('a > 0 && b > 0: ${a > 0 && b > 0}');

  // Ternary operator
  String result =
  a > b
      ? 'a is greater than b'
      : 'a is less than or equal to b';

  print('Result: $result');


  // 3. SET
  print('\n--- SET ---');
  print('Từ các phần tử thì có thể thêm và xóa khỏi List:');
  print('Original Set: $uniqueNumbers');

//------------ Thêm dữ liệu vào Set ----------------
  int addValue;

  while (true) {
    stdout.write('Enter an integer to add to Set: ');

    String input = stdin.readLineSync() ?? '';
    int? value = int.tryParse(input);

    if (value != null) {
      addValue = value;
      break;
    }

    print('Invalid!');
    print('Please enter an integer.\n');
  }

  bool isAdded = uniqueNumbers.add(addValue);

  if (isAdded) {
    print('$addValue was added successfully.');
  } else {
    print('$addValue already exists in the Set.');
  }

  print('Set after add: $uniqueNumbers');

//-------- xóa dữ liệu ở Set ------------
  int removeValue;

  while (true) {
    stdout.write('Enter an integer to remove from Set: ');

    String input = stdin.readLineSync() ?? '';
    int? value = int.tryParse(input);

    if (value != null) {
      removeValue = value;
      break;
    }

    print('Invalid!');
    print('Please enter an integer.\n');
  }

  bool isRemoved = uniqueNumbers.remove(removeValue);

  if (isRemoved) {
    print('$removeValue was removed successfully.');
  } else {
    print('$removeValue does not exist in the Set.');
  }

  print('Set after remove: $uniqueNumbers');

  // 4. MAP
  print('\n--- MAP ---');
  print('Xem, Thêm, Xóa, Sửa các Môn học và điểm:');
  print('Original Map: $scores');


//-------- ACCESS VALUE BY KEY --------
  stdout.write('Enter subject name to view score: ');
  String searchSubject = stdin.readLineSync()?.trim() ?? '';

  if (scores.containsKey(searchSubject)) {
    print('$searchSubject score: ${scores[searchSubject]}');
  } else {
    print('$searchSubject does not exist in the Map.');
  }


//-------- ADD NEW SUBJECT --------
  print('\n--- ADD SUBJECT ---');

  stdout.write('Enter new subject name: ');
  String newSubject = stdin.readLineSync()?.trim() ?? '';

  double newScore;

  while (true) {
    stdout.write('Enter score for $newSubject (0-10): ');

    String input = stdin.readLineSync() ?? '';
    double? value = double.tryParse(input);

    if (value != null && value >= 0 && value <= 10) {
      newScore = value;
      break;
    }

    print('Invalid! Please enter a score from 0 to 10.\n');
  }

  scores[newSubject] = newScore;

  print('After adding: $scores');


//-------- UPDATE SCORE --------
  print('\n--- UPDATE SCORE ---');

  stdout.write('Enter subject name to update: ');
  String updateSubject = stdin.readLineSync()?.trim() ?? '';

  if (scores.containsKey(updateSubject)) {
    double updatedScore;

    while (true) {
      stdout.write('Enter new score for $updateSubject (0-10): ');

      String input = stdin.readLineSync() ?? '';
      double? value = double.tryParse(input);

      if (value != null && value >= 0 && value <= 10) {
        updatedScore = value;
        break;
      }

      print('Invalid! Please enter a score from 0 to 10.\n');
    }

    scores[updateSubject] = updatedScore;

    print('After updating: $scores');
  } else {
    print('$updateSubject does not exist in the Map.');
  }


//-------- REMOVE SUBJECT --------
  print('\n--- REMOVE SUBJECT ---');

  stdout.write('Enter subject name to remove: ');
  String removeSubject = stdin.readLineSync()?.trim() ?? '';

  if (scores.containsKey(removeSubject)) {
    scores.remove(removeSubject);
    print('$removeSubject was removed successfully.');
  } else {
    print('$removeSubject does not exist in the Map.');
  }

  print('Final Map: $scores');
}

// ========================================
// EXERCISE 3 - Control Flow & Functions
// ========================================
void exercise3() {
  double score;
  print('\n===== EXERCISE 3 =====');

  //-------- 1. IF / ELSE --------
  print('\n--- IF / ELSE ---');

  print('Kiểm tra điểm đang xếp loại gì:');

  while (true) {
    stdout.write('Enter your score (0-10): ');

    String input = stdin.readLineSync() ?? '';
    double? value = double.tryParse(input);

    if (value != null && value >= 0 && value <= 10) {
      score = value;
      break;
    }

    print('Invalid!');
    print('Please enter a score from 0 to 10.\n');
  }

  if (score >= 9) {
    print('Result: Excellent');
  } else if (score >= 8) {
    print('Result: Good');
  } else if (score >= 5) {
    print('Result: Pass');
  } else {
    print('Result: Fail');
  }


  //-------- 2. SWITCH --------
  print('\n--- SWITCH ---');

  int day;

  while (true) {
    stdout.write('Enter day number (1-7): ');

    String input = stdin.readLineSync() ?? '';
    int? value = int.tryParse(input);

    if (value != null && value >= 1 && value <= 7) {
      day = value;
      break;
    }

    print('Invalid!');
    print('Please enter a number from 1 to 7.\n');
  }

  switch (day) {
    case 1:
      print('Monday');
      break;

    case 2:
      print('Tuesday');
      break;

    case 3:
      print('Wednesday');
      break;

    case 4:
      print('Thursday');
      break;

    case 5:
      print('Friday');
      break;

    case 6:
      print('Saturday');
      break;

    case 7:
      print('Sunday');
      break;
  }


  //-------- 3. LOOPS --------
  print('\n--- LOOPS ---');

  List<double> scores = [8.5, 7.0, 9.0, 6.5];

  print('List scores: $scores');

  print('\n--- FOR LOOP ---');

  print('Gán điểm vào từng Student:');

  // Dùng index để in số thứ tự
  for (int i = 0; i < scores.length; i++) {
    print('Student ${i + 1}: ${scores[i]}');
  }

  print('\n--- FOR-IN LOOP ---');

  print('Duyệt trực tiếp từng điểm và kiểm tra Pass/Fail nếu >= 5');

  // Duyệt trực tiếp từng giá trị và kiểm tra Pass/Fail
  for (double score in scores) {
    if (score >= 5) {
      print('$score -> Pass');
    } else {
      print('$score -> Fail');
    }
  }

  print('\n--- FOREACH LOOP ---');

  print('Chia 10 cho các phần tử');

  // Thực hiện một hành động cho từng phần tử
  scores.forEach((score) {
    double result = score / 10 ;
    print('Score: $score / 10 => $result');
  });


 
  // -------- 4. FUNCTIONS --------
  print('\n--- FUNCTIONS ---');
  
  double number1;
  double number2;

  print('Thực hiện công và tìm Max 2 số:');
  
  // Input first number
  while (true) {
    stdout.write('Enter first number: ');

    String input = stdin.readLineSync() ?? '';
    double? value = double.tryParse(input);

    if (value != null) {
      number1 = value;
      break;
    }

    print('Invalid!');
    print('Please enter a number.\n');
  }

  // Input second number
  while (true) {
    stdout.write('Enter second number: ');

    String input = stdin.readLineSync() ?? '';
    double? value = double.tryParse(input);

    if (value != null) {
      number2 = value;
      break;
    }

    print('Invalid!');
    print('Please enter a number.\n');
  }

  // Normal function
  double sum = addNumbers(number1, number2);

  print('Sum: $sum');

  // Arrow function
  double max = findMax(number1, number2);

  print('Larger number: $max');
}
//======================= NORMAL FUNCTION =======================
double addNumbers(double a, double b) {
  return a + b;
}
//======================= ARROW FUNCTION =======================
double findMax(double a, double b) => a > b ? a : b;


// ========================================
// EXERCISE 4 - Intro to OOP
// ========================================
void exercise4() {
  print('\n===== EXERCISE 4 =====');

  //======================= 1. CREATE NORMAL CAR =======================
  print('\n--- NORMAL CAR ---');

  stdout.write('Enter car brand: ');
  String brand = stdin.readLineSync(encoding: utf8)?.trim() ?? '';

  Car car = Car(brand);

  car.showInfo();
  //======================= 2. NAMED CONSTRUCTOR =======================
  print('\n--- NAMED CONSTRUCTOR ---');

  Car unknownCar = Car.unknown();

  unknownCar.showInfo();
  //======================= 3. ELECTRIC CAR =======================
  print('\n--- ELECTRIC CAR ---');

  stdout.write('Enter electric car brand: ');
  String electricBrand =
      stdin.readLineSync(encoding: utf8)?.trim() ?? '';

  double battery;

  while (true) {
    stdout.write('Enter battery level (0-100): ');

    String input = stdin.readLineSync() ?? '';
    double? value = double.tryParse(input);

    if (value != null &&
        value >= 0 &&
        value <= 100) {
      battery = value;
      break;
    }

    print('Invalid!');
    print('Please enter battery level from 0 to 100.\n');
  }

  ElectricCar electricCar =
  ElectricCar(electricBrand, battery);

  electricCar.showInfo();
}

//======================= CLASS CAR =======================
class Car {
  String brand;

  // Constructor
  Car(this.brand);

  // Named Constructor
  Car.unknown() : brand = 'Unknown';

  void showInfo() {
    print('Car brand: $brand');
  }
}

//======================= CLASS ELECTRIC CAR =======================
class ElectricCar extends Car {
  double batteryLevel;

  ElectricCar(String brand, this.batteryLevel)
      : super(brand);

  // Override method from Car
  @override
  void showInfo() {
    print('Electric Car brand: $brand');
    print('Battery level: $batteryLevel%');
  }
}
// ========================================
// EXERCISE 5 - Async & Null Safety
// ========================================
Future<void> exercise5() async {
  print('\n===== EXERCISE 5 =====');


  //======================= 1. FUTURE + ASYNC / AWAIT =======================

  print('\n--- FUTURE & ASYNC/AWAIT ---');

  String result = await loadData();

  print(result);


  //======================= 2. NULL SAFETY =======================

  print('\n--- NULL SAFETY ---');

  String? nickname;

  stdout.write(
      'Enter your nickname (press Enter to skip): ');

  String input =
      stdin.readLineSync(encoding: utf8)?.trim() ?? '';

  if (input.isNotEmpty) {
    nickname = input;
  }

  // ?? operator
  print(
      'Nickname: ${nickname ?? 'No nickname'}');

  // ! operator
  if (nickname != null) {
    print(
        'Uppercase nickname: ${nickname!.toUpperCase()}');
  }


  //======================= 3. STREAM =======================

  print('\n--- STREAM ---');
  print('Stream started...');

  await for (int value in numberStream()) {
    print('Stream value: $value');
  }

  print('Stream completed.');
}
//=======
Future<String> loadData() async {
  print('Loading data...');

  // Simulate loading for 2 seconds
  await Future.delayed(
    const Duration(seconds: 2),
  );

  return 'Data loaded successfully!';
}

Stream<int> numberStream() async* {
  for (int i = 1; i <= 5; i++) {
    await Future.delayed(
      const Duration(seconds: 1),
    );

    yield i;
  }
}
