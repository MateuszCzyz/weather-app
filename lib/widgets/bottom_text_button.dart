import 'package:flutter/material.dart';

class BottomTextButton extends StatelessWidget {
  const BottomTextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
          onPressed: () {},
          child: Text(
            'Get weather by your current position',
            style: Theme.of(context).textTheme.bodyText2,
          )),
    );
  }
}
