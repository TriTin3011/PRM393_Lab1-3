import 'package:flutter/material.dart';

class LabOverviewScreen extends StatelessWidget {
  const LabOverviewScreen({
    super.key,
    required this.title,
    required this.description,
    required this.exercises,
    required this.runCommand,
  });

  final String title;
  final String description;
  final List<String> exercises;
  final String runCommand;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text(description, style: Theme.of(context).textTheme.bodyLarge),
          const SizedBox(height: 20),
          Text(
            'Danh sách bài tập',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 8),
          for (var index = 0; index < exercises.length; index++)
            Card(
              child: ListTile(
                leading: CircleAvatar(child: Text('${index + 1}')),
                title: Text(exercises[index]),
              ),
            ),
          const SizedBox(height: 16),
          Text(
            'Chạy trong terminal',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(12),
            ),
            child: SelectableText(
              runCommand,
              style: const TextStyle(fontFamily: 'monospace'),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Lab 2 và Lab 3 vẫn là chương trình Dart chạy trong terminal.',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}
