class AnimationUtils {
  static String convertApiImageTypeToAnimationPath(String imageType) {
    switch (imageType) {
      case '01d':
        return 'assets/animations/sun-animation.json';
      case '02d':
        return 'assets/animations/sun-clouds-animation.json';
      case '03d':
        return 'assets/animations/clouds-animation.json';
      case '04d':
        return 'assets/animations/clouds-animation.json';
      case '09d':
        return 'assets/animations/raining-animation.json';
      case '10d':
        return 'assets/animations/raining-animation.json';
      case '11d':
        return 'assets/animations/storm-animation.json';
      case '13d':
        return 'assets/animations/snowing-animation.json';
      case '50d':
        return 'assets/animations/snowing-animation.json';
      case '01n':
        return 'assets/animations/sun-animation.json';
      case '02n':
        return 'assets/animations/sun-clouds-animation.json';
      case '03n':
        return 'assets/animations/clouds-animation.json';
      case '04n':
        return 'assets/animations/clouds-animation.json';
      case '09n':
        return 'assets/animations/raining-animation.json';
      case '10n':
        return 'assets/animations/raining-animation.json';
      case '11n':
        return 'assets/animations/storm-animation.json';
      case '13n':
        return 'assets/animations/snowing-animation.json';
      case '50n':
        return 'assets/animations/snowing-animation.json';
      default:
        return 'assets/animations/clouds-animation.json';
    }
  }
}
