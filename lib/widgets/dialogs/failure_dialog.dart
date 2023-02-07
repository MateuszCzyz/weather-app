import 'package:flutter/material.dart';

class FailureDialog extends StatelessWidget {
  final String title;
  final String description;
  const FailureDialog(
      {super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        title,
        textAlign: TextAlign.center,
      ),
      content: Text(
        description,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 15),
      ),
    );
  }
}
