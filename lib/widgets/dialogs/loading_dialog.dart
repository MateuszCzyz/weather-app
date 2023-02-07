import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingDialog extends StatelessWidget {
  const LoadingDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: Lottie.asset('assets/animations/loading-animation.json',
            width: 50, height: 50));
  }
}
