import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/blocs/weather_bloc/weather_bloc.dart';

class SubmitButton extends StatelessWidget {
  final TextEditingController inputController;
  const SubmitButton(this.inputController, {super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          BlocProvider.of<WeatherBloc>(context)
              .add(GetWeatherByPlace(city: inputController.text));
        },
        child: const SizedBox(
          height: 45,
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
