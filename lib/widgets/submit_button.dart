import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {},
        child: const SizedBox(
          height: 50,
          width: double.infinity,
          child: Center(
            child: Text(
              'Submit',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 15,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ));
  }
}
