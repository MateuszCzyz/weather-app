import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/blocs/weather_bloc/weather_bloc.dart';

class BottomTextButton extends StatelessWidget {
  const BottomTextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
          onPressed: () {
            BlocProvider.of<WeatherBloc>(context)
                .add(GetWeatherByCurrentPosition());
          },
          child: Text(
            'Get weather by your current position',
            style: Theme.of(context).textTheme.bodyText2,
          )),
    );
  }
}
