import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';

class Lab3Screen extends StatelessWidget {
  const Lab3Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Lab 3 — Dart features'),
          bottom: const TabBar(
            isScrollable: true,
            tabs: [
              Tab(text: 'Products'),
              Tab(text: 'JSON users'),
              Tab(text: 'Microtasks'),
              Tab(text: 'Streams'),
              Tab(text: 'Cache'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            _ProductsExercise(),
            _JsonUsersExercise(),
            _MicrotasksExercise(),
            _StreamTransformExercise(),
            _SettingsCacheExercise(),
          ],
        ),
      ),
    );
  }
}

class _ProductsExercise extends StatefulWidget {
  const _ProductsExercise();

  @override
  State<_ProductsExercise> createState() => _ProductsExerciseState();
}

class _ProductsExerciseState extends State<_ProductsExercise> {
  final _name = TextEditingController();
  final _price = TextEditingController();
  final _events = StreamController<String>.broadcast();
  final List<String> _products = [];
  int _nextId = 1;
  String? _message;

  @override
  void dispose() {
    _name.dispose();
    _price.dispose();
    _events.close();
    super.dispose();
  }

  void _addProduct() {
    final name = _name.text.trim();
    final price = double.tryParse(_price.text.trim());
    if (name.isEmpty || price == null || price <= 0) {
      setState(() => _message = 'Enter a product name and a positive price.');
      return;
    }
    final product = 'Product $_nextId: $name — $price';
    setState(() {
      _products.add(product);
      _message = product;
      _nextId++;
    });
    _events.add(product);
    _name.clear();
    _price.clear();
  }

  @override
  Widget build(BuildContext context) => _lab3Page([
    _lab3Field(_name, 'Product name'),
    _lab3Field(
      _price,
      'Price',
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
    ),
    FilledButton(onPressed: _addProduct, child: const Text('Add product')),
    _lab3Result(_message),
    Text(
      'Repository products: ${_products.isEmpty ? 'none' : _products.join('\n')}',
    ),
    const SizedBox(height: 8),
    const Text(
      'Live add stream',
      style: TextStyle(fontWeight: FontWeight.bold),
    ),
    StreamBuilder<String>(
      stream: _events.stream,
      builder: (context, snapshot) =>
          _lab3Result(snapshot.data ?? 'Waiting for a product…'),
    ),
  ]);
}

class _JsonUsersExercise extends StatefulWidget {
  const _JsonUsersExercise();

  @override
  State<_JsonUsersExercise> createState() => _JsonUsersExerciseState();
}

class _JsonUsersExerciseState extends State<_JsonUsersExercise> {
  final _name = TextEditingController();
  final _email = TextEditingController();
  final List<Map<String, String>> _users = [];
  String? _json;
  String? _error;

  @override
  void dispose() {
    _name.dispose();
    _email.dispose();
    super.dispose();
  }

  void _addUser() {
    final name = _name.text.trim();
    final email = _email.text.trim();
    if (name.isEmpty || !email.contains('@') || !email.contains('.')) {
      setState(() {
        _error = 'Enter a name and a valid email.';
        _json = null;
      });
      return;
    }
    _users.add({'name': name, 'email': email});
    final decoded = jsonDecode(jsonEncode(_users)) as List<dynamic>;
    setState(() {
      _error = null;
      _json = const JsonEncoder.withIndent('  ').convert(decoded);
    });
    _name.clear();
    _email.clear();
  }

  @override
  Widget build(BuildContext context) => _lab3Page([
    _lab3Field(_name, 'Name'),
    _lab3Field(_email, 'Email', keyboardType: TextInputType.emailAddress),
    FilledButton(onPressed: _addUser, child: const Text('Add and parse JSON')),
    _lab3Result(_error),
    if (_json != null)
      SelectableText(_json!, style: const TextStyle(fontFamily: 'monospace')),
  ]);
}

class _MicrotasksExercise extends StatefulWidget {
  const _MicrotasksExercise();

  @override
  State<_MicrotasksExercise> createState() => _MicrotasksExerciseState();
}

class _MicrotasksExerciseState extends State<_MicrotasksExercise> {
  List<String> _events = [];

  Future<void> _run() async {
    setState(() => _events = ['1. Start']);
    scheduleMicrotask(() {
      if (mounted) setState(() => _events = [..._events, '3. Microtask']);
    });
    Future<void>(() {
      if (mounted) setState(() => _events = [..._events, '4. Future event']);
    });
    setState(() => _events = [..._events, '2. End']);
    await Future<void>.delayed(const Duration(milliseconds: 100));
  }

  @override
  Widget build(BuildContext context) => _lab3Page([
    const Text(
      'Observe the order of synchronous, microtask, and event-queue work.',
    ),
    FilledButton(onPressed: _run, child: const Text('Run scheduling example')),
    _lab3Result(_events.isEmpty ? null : _events.join('\n')),
  ]);
}

class _StreamTransformExercise extends StatefulWidget {
  const _StreamTransformExercise();

  @override
  State<_StreamTransformExercise> createState() =>
      _StreamTransformExerciseState();
}

class _StreamTransformExerciseState extends State<_StreamTransformExercise> {
  List<int> _values = [];
  bool _running = false;

  Future<void> _transform() async {
    setState(() {
      _values = [];
      _running = true;
    });
    final stream = Stream<int>.fromIterable([1, 2, 3, 4, 5])
        .map((number) => number * number)
        .where((number) => number.isEven);
    await for (final value in stream) {
      if (!mounted) return;
      setState(() => _values = [..._values, value]);
    }
    if (mounted) setState(() => _running = false);
  }

  @override
  Widget build(BuildContext context) => _lab3Page([
    const Text('Square numbers 1–5, then keep even results.'),
    FilledButton(
      onPressed: _running ? null : _transform,
      child: Text(_running ? 'Processing…' : 'Transform stream'),
    ),
    _lab3Result(_values.isEmpty ? null : 'Output: $_values'),
  ]);
}

class _SettingsCacheExercise extends StatefulWidget {
  const _SettingsCacheExercise();

  @override
  State<_SettingsCacheExercise> createState() => _SettingsCacheExerciseState();
}

class _SettingsCacheExerciseState extends State<_SettingsCacheExercise> {
  final _first = _SettingsCache();
  final _second = _SettingsCache();

  void _toggleTheme() {
    setState(() {
      _first.theme = _first.theme == 'light' ? 'dark' : 'light';
    });
  }

  @override
  Widget build(BuildContext context) => _lab3Page([
    Text('Same cached object: ${identical(_first, _second)}'),
    Text('Theme from first reference: ${_first.theme}'),
    Text('Theme from second reference: ${_second.theme}'),
    FilledButton(
      onPressed: _toggleTheme,
      child: const Text('Change theme through first reference'),
    ),
  ]);
}

class _SettingsCache {
  static final _SettingsCache _instance = _SettingsCache._internal();

  factory _SettingsCache() => _instance;

  _SettingsCache._internal();

  String theme = 'light';
}

Widget _lab3Page(List<Widget> children) => ListView(
  padding: const EdgeInsets.all(20),
  children: [
    for (final child in children) ...[child, const SizedBox(height: 12)],
  ],
);

Widget _lab3Field(
  TextEditingController controller,
  String label, {
  TextInputType? keyboardType,
}) => TextField(
  controller: controller,
  keyboardType: keyboardType,
  decoration: InputDecoration(
    labelText: label,
    border: const OutlineInputBorder(),
  ),
);

Widget _lab3Result(String? text) {
  if (text == null || text.isEmpty) return const SizedBox.shrink();
  return Card(
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: SelectableText(text),
    ),
  );
}
