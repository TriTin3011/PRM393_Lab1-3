import 'package:flutter/material.dart';

class Lab2Screen extends StatelessWidget {
  const Lab2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Lab 2 — Dart fundamentals'),
          bottom: const TabBar(
            isScrollable: true,
            tabs: [
              Tab(text: 'Syntax'),
              Tab(text: 'Collections'),
              Tab(text: 'Control flow'),
              Tab(text: 'OOP'),
              Tab(text: 'Async'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            _BasicDataExercise(),
            _CollectionsExercise(),
            _ControlFlowExercise(),
            _OopExercise(),
            _AsyncExercise(),
          ],
        ),
      ),
    );
  }
}

class _BasicDataExercise extends StatefulWidget {
  const _BasicDataExercise();

  @override
  State<_BasicDataExercise> createState() => _BasicDataExerciseState();
}

class _BasicDataExerciseState extends State<_BasicDataExercise> {
  final _name = TextEditingController();
  final _age = TextEditingController();
  final _height = TextEditingController();
  bool _isStudent = true;
  String? _result;

  @override
  void dispose() {
    _name.dispose();
    _age.dispose();
    _height.dispose();
    super.dispose();
  }

  void _showInformation() {
    final age = int.tryParse(_age.text.trim());
    final height = double.tryParse(_height.text.trim());
    if (_name.text.trim().isEmpty || age == null || height == null) {
      setState(() => _result = 'Enter a name, whole-number age, and height.');
      return;
    }
    setState(() {
      _result =
          'Name: ${_name.text.trim()}\nAge: $age\nHeight: $height m\nStudent: $_isStudent\nNext year: ${age + 1}';
    });
  }

  @override
  Widget build(BuildContext context) => _exercisePage([
    _field(_name, 'Name'),
    _field(_age, 'Age', keyboardType: TextInputType.number),
    _field(
      _height,
      'Height (m)',
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
    ),
    SwitchListTile(
      contentPadding: EdgeInsets.zero,
      title: const Text('Are you a student?'),
      value: _isStudent,
      onChanged: (value) => setState(() => _isStudent = value),
    ),
    FilledButton(
      onPressed: _showInformation,
      child: const Text('Show information'),
    ),
    _resultCard(_result),
  ]);
}

class _CollectionsExercise extends StatefulWidget {
  const _CollectionsExercise();

  @override
  State<_CollectionsExercise> createState() => _CollectionsExerciseState();
}

class _CollectionsExerciseState extends State<_CollectionsExercise> {
  final _number = TextEditingController();
  final _subject = TextEditingController();
  final _score = TextEditingController();
  final List<int> _numbers = [10, 20, 30, 40];
  final Set<int> _uniqueNumbers = {10, 20, 30, 40};
  final Map<String, double> _scores = {
    'Math': 9,
    'Physics': 8.5,
    'Chemistry': 8,
  };
  String? _message;

  @override
  void dispose() {
    _number.dispose();
    _subject.dispose();
    _score.dispose();
    super.dispose();
  }

  void _changeNumber({required bool add}) {
    final value = int.tryParse(_number.text.trim());
    if (value == null) {
      setState(() => _message = 'Enter a valid integer.');
      return;
    }
    setState(() {
      if (add) {
        _numbers.add(value);
        _uniqueNumbers.add(value);
        _message = 'Added $value to the List and Set.';
      } else {
        _numbers.remove(value);
        _uniqueNumbers.remove(value);
        _message = 'Removed $value from the List and Set when present.';
      }
    });
  }

  void _saveScore() {
    final subject = _subject.text.trim();
    final score = double.tryParse(_score.text.trim());
    if (subject.isEmpty || score == null || score < 0 || score > 10) {
      setState(() => _message = 'Enter a subject and a score from 0 to 10.');
      return;
    }
    setState(() {
      _scores[subject] = score;
      _message = 'Saved $subject: $score.';
    });
  }

  @override
  Widget build(BuildContext context) => _exercisePage([
    Text('List: $_numbers'),
    Text('Set: $_uniqueNumbers'),
    _field(
      _number,
      'Integer to add or remove',
      keyboardType: TextInputType.number,
    ),
    Wrap(
      spacing: 8,
      children: [
        OutlinedButton(
          onPressed: () => _changeNumber(add: true),
          child: const Text('Add number'),
        ),
        OutlinedButton(
          onPressed: () => _changeNumber(add: false),
          child: const Text('Remove number'),
        ),
      ],
    ),
    const Divider(),
    Text('Map: $_scores'),
    _field(_subject, 'Subject'),
    _field(
      _score,
      'Score (0–10)',
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
    ),
    FilledButton(
      onPressed: _saveScore,
      child: const Text('Add or update score'),
    ),
    _resultCard(_message),
  ]);
}

class _ControlFlowExercise extends StatefulWidget {
  const _ControlFlowExercise();

  @override
  State<_ControlFlowExercise> createState() => _ControlFlowExerciseState();
}

class _ControlFlowExerciseState extends State<_ControlFlowExercise> {
  final _score = TextEditingController();
  final _day = TextEditingController(text: '1');
  final _first = TextEditingController();
  final _second = TextEditingController();
  String? _result;

  @override
  void dispose() {
    _score.dispose();
    _day.dispose();
    _first.dispose();
    _second.dispose();
    super.dispose();
  }

  void _runExamples() {
    final score = double.tryParse(_score.text.trim());
    final day = int.tryParse(_day.text.trim());
    final first = double.tryParse(_first.text.trim());
    final second = double.tryParse(_second.text.trim());
    if (score == null ||
        score < 0 ||
        score > 10 ||
        day == null ||
        day < 1 ||
        day > 7 ||
        first == null ||
        second == null) {
      setState(
        () => _result =
            'Enter a score from 0 to 10, a day from 1 to 7, and two numbers.',
      );
      return;
    }
    final grade = score >= 9
        ? 'Excellent'
        : score >= 8
        ? 'Good'
        : score >= 5
        ? 'Pass'
        : 'Fail';
    final dayName = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday',
    ][day - 1];
    const scores = [8.5, 7.0, 9.0, 6.5];
    setState(() {
      _result =
          'Grade: $grade\nDay: $dayName\nLoop scores: $scores\nSum: ${first + second}\nMaximum: ${first > second ? first : second}';
    });
  }

  @override
  Widget build(BuildContext context) => _exercisePage([
    _field(
      _score,
      'Score (0–10)',
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
    ),
    _field(_day, 'Day number (1–7)', keyboardType: TextInputType.number),
    _field(
      _first,
      'First number',
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
    ),
    _field(
      _second,
      'Second number',
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
    ),
    FilledButton(
      onPressed: _runExamples,
      child: const Text('Run control-flow examples'),
    ),
    _resultCard(_result),
  ]);
}

class _OopExercise extends StatefulWidget {
  const _OopExercise();

  @override
  State<_OopExercise> createState() => _OopExerciseState();
}

class _OopExerciseState extends State<_OopExercise> {
  final _brand = TextEditingController();
  final _electricBrand = TextEditingController();
  double _battery = 50;
  String? _result;

  @override
  void dispose() {
    _brand.dispose();
    _electricBrand.dispose();
    super.dispose();
  }

  void _showCars() {
    if (_brand.text.trim().isEmpty || _electricBrand.text.trim().isEmpty) {
      setState(() => _result = 'Enter both car brands.');
      return;
    }
    setState(() {
      _result =
          'Car brand: ${_brand.text.trim()}\nUnknown car brand: Unknown\nElectric car brand: ${_electricBrand.text.trim()}\nBattery: ${_battery.round()}%';
    });
  }

  @override
  Widget build(BuildContext context) => _exercisePage([
    _field(_brand, 'Car brand'),
    _field(_electricBrand, 'Electric car brand'),
    Text('Battery: ${_battery.round()}%'),
    Slider(
      value: _battery,
      min: 0,
      max: 100,
      divisions: 20,
      label: '${_battery.round()}%',
      onChanged: (value) => setState(() => _battery = value),
    ),
    FilledButton(
      onPressed: _showCars,
      child: const Text('Show car information'),
    ),
    _resultCard(_result),
  ]);
}

class _AsyncExercise extends StatefulWidget {
  const _AsyncExercise();

  @override
  State<_AsyncExercise> createState() => _AsyncExerciseState();
}

class _AsyncExerciseState extends State<_AsyncExercise> {
  final _nickname = TextEditingController();
  String? _loadedData;
  String? _nicknameResult;
  final List<int> _streamValues = [];
  bool _loading = false;
  bool _streaming = false;

  @override
  void dispose() {
    _nickname.dispose();
    super.dispose();
  }

  Future<void> _loadData() async {
    setState(() => _loading = true);
    await Future<void>.delayed(const Duration(seconds: 2));
    if (!mounted) return;
    setState(() {
      _loadedData = 'Data loaded successfully!';
      _loading = false;
    });
  }

  void _saveNickname() {
    final nickname = _nickname.text.trim();
    setState(
      () => _nicknameResult = nickname.isEmpty
          ? 'No nickname'
          : 'Nickname: $nickname\nUppercase: ${nickname.toUpperCase()}',
    );
  }

  Future<void> _startStream() async {
    setState(() {
      _streamValues.clear();
      _streaming = true;
    });
    await for (final value in Stream<int>.periodic(
      const Duration(seconds: 1),
      (index) => index + 1,
    ).take(5)) {
      if (!mounted) return;
      setState(() => _streamValues.add(value));
    }
    if (mounted) setState(() => _streaming = false);
  }

  @override
  Widget build(BuildContext context) => _exercisePage([
    FilledButton(
      onPressed: _loading ? null : _loadData,
      child: Text(_loading ? 'Loading…' : 'Load data'),
    ),
    _resultCard(_loadedData),
    _field(_nickname, 'Nickname (optional)'),
    OutlinedButton(
      onPressed: _saveNickname,
      child: const Text('Save nickname'),
    ),
    _resultCard(_nicknameResult),
    FilledButton(
      onPressed: _streaming ? null : _startStream,
      child: Text(_streaming ? 'Stream running…' : 'Start number stream'),
    ),
    _resultCard(_streamValues.isEmpty ? null : 'Stream values: $_streamValues'),
  ]);
}

Widget _exercisePage(List<Widget> children) => ListView(
  padding: const EdgeInsets.all(20),
  children: [
    for (final child in children) ...[child, const SizedBox(height: 12)],
  ],
);

Widget _field(
  TextEditingController controller,
  String label, {
  TextInputType? keyboardType,
}) => Padding(
  padding: const EdgeInsets.only(bottom: 4),
  child: TextField(
    controller: controller,
    keyboardType: keyboardType,
    decoration: InputDecoration(
      labelText: label,
      border: const OutlineInputBorder(),
    ),
  ),
);

Widget _resultCard(String? text) {
  if (text == null || text.isEmpty) return const SizedBox.shrink();
  return Card(
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: SelectableText(text),
    ),
  );
}
