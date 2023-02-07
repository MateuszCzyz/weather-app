import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/app_theme.dart';
import 'package:weather_app/blocs/weather_bloc/weather_bloc.dart';

class InputField extends StatelessWidget {
  final TextEditingController inputController;
  const InputField(this.inputController, {super.key});

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      stepWidth: double.infinity,
      child: TextField(
        onSubmitted: (_) {
          BlocProvider.of<WeatherBloc>(context)
              .add(GetWeatherByPlace(city: inputController.text));
        },
        controller: inputController,
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
