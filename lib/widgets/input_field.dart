import 'package:flutter/material.dart';
import 'package:weather_app/app_theme.dart';

class InputField extends StatelessWidget {
  const InputField({super.key});

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      stepWidth: double.infinity,
      child: TextField(
        style: const TextStyle(color: Color(primaryTextColor)),
        decoration: InputDecoration(
            prefixIcon: const Icon(
              Icons.search,
              color: Color(secondaryTextColor),
            ),
            hintText: 'City or region',
            hintStyle: const TextStyle(color: Color(secondaryTextColor)),
            enabledBorder: Theme.of(context).inputDecorationTheme.enabledBorder,
            border: Theme.of(context).inputDecorationTheme.border),
      ),
    );
  }
}
