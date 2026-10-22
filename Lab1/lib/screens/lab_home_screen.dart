import 'package:flutter/material.dart';

import 'lab1_screen.dart';
import 'lab_overview_screen.dart';

class LabHomeScreen extends StatelessWidget {
  const LabHomeScreen({super.key});

  void _openLab(BuildContext context, Widget screen) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(builder: (_) => screen),
    );
  }

  @override
  Widget build(BuildContext context) {
    final labs = [
      _LabItem(
        title: 'Lab 1',
        subtitle: 'Flutter layout demo',
        icon: Icons.phone_android,
        color: Colors.deepOrange,
        screen: const Lab1Screen(),
      ),
      _LabItem(
        title: 'Lab 2',
        subtitle: 'Dart fundamentals and OOP',
        icon: Icons.code,
        color: Colors.indigo,
        screen: const LabOverviewScreen(
          title: 'Lab 2',
          description: 'Dart fundamentals, collections, functions, OOP, and async programming.',
          exercises: [
            'Basic Syntax & Data Types',
            'Collections & Operators',
            'Control Flow & Functions',
            'Intro to OOP',
            'Async, Future, Null Safety & Streams',
          ],
          runCommand: 'cd Lab2\ndart run bin/lab2.dart',
        ),
      ),
      _LabItem(
        title: 'Lab 3',
        subtitle: 'Repositories, streams, and cache',
        icon: Icons.storage,
        color: Colors.teal,
        screen: const LabOverviewScreen(
          title: 'Lab 3',
          description: 'Products, JSON users, async scheduling, stream transforms, and a settings cache.',
          exercises: [
            'Product Model & Repository',
            'User Repository with JSON',
            'Async + Microtask Debugging',
            'Stream Transformation',
            'Factory Constructors & Cache',
          ],
          runCommand: 'cd Lab3\ndart run bin/lab3.dart',
        ),
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('PRM393 — Labs 1–3')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text(
            'Chọn lab',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            'Mở từng lab để xem nội dung và cách chạy.',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 20),
          for (final lab in labs)
            Card(
              clipBehavior: Clip.antiAlias,
              margin: const EdgeInsets.only(bottom: 12),
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 10,
                ),
                leading: CircleAvatar(
                  backgroundColor: lab.color.withValues(alpha: 0.12),
                  foregroundColor: lab.color,
                  child: Icon(lab.icon),
                ),
                title: Text(
                  lab.title,
                  style: const TextStyle(fontWeight: FontWeight.w700),
                ),
                subtitle: Text(lab.subtitle),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => _openLab(context, lab.screen),
              ),
            ),
        ],
      ),
    );
  }
}

class _LabItem {
  const _LabItem({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.screen,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final Widget screen;
}
