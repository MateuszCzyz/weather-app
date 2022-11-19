import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../widgets/bottom_text_button.dart';
import '../widgets/input_field.dart';
import '../widgets/submit_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            vertical: 30,
            horizontal: 30,
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            const SizedBox(height: 50),
            Lottie.asset(
              'assets/earth-animation.json',
              width: 300,
              height: 300,
              fit: BoxFit.contain,
            ),
            Text(
              'Weather forecast',
              style: Theme.of(context).textTheme.headline1,
            ),
            Text(
              'Check weather in your place',
              style: Theme.of(context).textTheme.headline2,
            ),
            const SizedBox(height: 30),
            const InputField(),
            const SizedBox(height: 15),
            const SubmitButton(),
            const BottomTextButton()
          ]),
        ),
      ),
    );
  }
}
