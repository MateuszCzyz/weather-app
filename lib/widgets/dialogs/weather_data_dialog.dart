import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/app_theme.dart';
import 'package:weather_app/models/pollution.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/utils/animation_utils.dart';
import 'package:weather_app/utils/date_time_utils.dart';
import 'package:weather_app/utils/image_utils.dart';

class WeatherDataDialog extends StatelessWidget {
  final List<Weather> weatherData;
  final List<Pollution> pollutionData;

  const WeatherDataDialog({
    super.key,
    required this.weatherData,
    required this.pollutionData,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      insetPadding: const EdgeInsets.symmetric(horizontal: 25),
      backgroundColor: const Color(weatherDialogColor),
      content: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.75,
        child: Column(children: [
          Flexible(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    WeatherDialogNavbar(
                      city: weatherData.first.place,
                    ),
                    WeatherDialogAnimationIcon(
                      iconType: weatherData.first.icon,
                    ),
                    WeatherDialogCurrentDayData(
                      weatherData: weatherData,
                      pollutionData: pollutionData,
                    ),
                  ]),
            ),
          ),
          Flexible(
            child: WeatherDialogFutureDaysData(
              weatherData: weatherData,
              pollutionData: pollutionData,
            ),
          )
        ]),
      ),
    );
  }
}

class WeatherDialogNavbar extends StatelessWidget {
  final String city;
  const WeatherDialogNavbar({
    super.key,
    required this.city,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            city,
            style: const TextStyle(
              fontSize: 17,
              color: Color(weatherDialogTextColor),
            ),
          ),
          const Text(
            'Today',
            style: TextStyle(
              fontSize: 17,
              color: Color(weatherDialogTextColor),
            ),
          ),
        ],
      ),
    );
  }
}

class WeatherDialogAnimationIcon extends StatelessWidget {
  final String iconType;
  const WeatherDialogAnimationIcon({
    super.key,
    required this.iconType,
  });

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      AnimationUtils.convertApiImageTypeToAnimationPath(iconType),
      width: 300,
      height: 300,
      fit: BoxFit.contain,
    );
  }
}

class WeatherDialogCurrentDayData extends StatelessWidget {
  final List<Weather> weatherData;
  final List<Pollution> pollutionData;

  const WeatherDialogCurrentDayData({
    super.key,
    required this.weatherData,
    required this.pollutionData,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          width: 15,
        ),
        Text(
          '${weatherData.first.temperature}°C',
          style: const TextStyle(
            fontSize: 40,
            color: Color(weatherDialogTextColor),
          ),
        ),
        const SizedBox(width: 15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pressure: ${weatherData.first.pressure}hpa',
              style: const TextStyle(
                color: Color(0xFFd6e9ec),
                fontSize: 17,
              ),
            ),
            Text(
              weatherData.first.description,
              style: const TextStyle(
                color: Color(0xFFd6e9ec),
                fontSize: 17,
              ),
            )
          ],
        )
      ],
    );
  }
}

class WeatherDialogFutureDaysData extends StatelessWidget {
  static const int _futureDaysNumber = 5;
  final List<Weather> weatherData;
  final List<Pollution> pollutionData;

  const WeatherDialogFutureDaysData({
    super.key,
    required this.weatherData,
    required this.pollutionData,
  });

  @override
  Widget build(BuildContext context) {
    final List<String> futureDaysLabels =
        DateTimeUtils.getNextDaysLabels(_futureDaysNumber);

    return Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(5),
            bottomRight: Radius.circular(5),
          ),
          color: Color(weatherDialogSecondaryColor),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(
              _futureDaysNumber,
              (index) => FutureDayWeatherBox(
                dayLabel: futureDaysLabels[index],
                iconAssetPath: ImageUtils.convertApiImageTypeToAssetPath(
                    weatherData[index + 1].icon),
                temperature: weatherData[index + 1].temperature,
              ),
            ),
          ),
        ));
  }
}

class FutureDayWeatherBox extends StatelessWidget {
  final String dayLabel;
  final String iconAssetPath;
  final int temperature;

  const FutureDayWeatherBox({
    super.key,
    required this.dayLabel,
    required this.iconAssetPath,
    required this.temperature,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(child: Text(dayLabel)),
        Flexible(
          flex: 2,
          child: Image(
            image: AssetImage(iconAssetPath),
          ),
        ),
        Flexible(
          child: Text('$temperature°C'),
        )
      ],
    );
  }
}
