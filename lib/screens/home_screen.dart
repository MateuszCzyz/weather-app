import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/blocs/weather_bloc/weather_bloc.dart';
import 'package:weather_app/widgets/dialogs/failure_dialog.dart';

import '../widgets/bottom_text_button.dart';
import '../widgets/input_field.dart';
import '../widgets/submit_button.dart';
import '../widgets/dialogs/loading_dialog.dart';
import '../widgets/dialogs/weather_data_dialog.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<WeatherBloc, WeatherState>(
        listener: (context, state) {
          if (state is Loading) {
            showDialog(context: context, builder: (_) => const LoadingDialog());
            return;
          }

          if (state is FailureResult) {
            Navigator.of(context).pop();
            showDialog(
                context: context,
                builder: (_) => FailureDialog(
                    title: "Something went wrong!",
                    description: state.message));
            return;
          }

          if (state is SuccessResult) {
            Navigator.of(context).pop();
            showDialog(
                context: context,
                builder: (_) =>
                    WeatherDataDialog(weatherData: state.weatherData));
            return;
          }
        },
        child: HomeScreenLayout());
  }
}

class HomeScreenLayout extends StatelessWidget {
  final inputController = TextEditingController();
  HomeScreenLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            vertical: 30,
            horizontal: 40,
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            const SizedBox(height: 50),
            Lottie.asset(
              'assets/animations/earth-animation.json',
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
            InputField(inputController),
            const SizedBox(height: 15),
            SubmitButton(inputController),
            const BottomTextButton()
          ]),
        ),
      ),
    );
  }
}
