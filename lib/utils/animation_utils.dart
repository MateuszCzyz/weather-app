class AnimationUtils {
  static String convertApiImageTypeToAnimationPath(String imageType) {
    switch (imageType) {
      case '01d.png':
        return 'assets/animations/sun-animation.json';
      case '02d.png':
        return 'assets/animations/sun-clouds-animation.json';
      case '03d.png':
        return 'assets/animations/clouds-animation.json';
      case '04d.png':
        return 'assets/animations/clouds-animation.json';
      case '09d.png':
        return 'assets/animations/raining-animation.json';
      case '10d.png':
        return 'assets/animations/raining-animation.json';
      case '11d.png':
        return 'assets/animations/storm-animation.json';
      case '13d.png':
        return 'assets/animations/snowing-animation.json';
      case '50d.png':
        return 'assets/animations/snowing-animation.json';
      case '01n.png':
        return 'assets/animations/sun-animation.json';
      case '02n.png':
        return 'assets/animations/sun-clouds-animation.json';
      case '03n.png':
        return 'assets/animations/clouds-animation.json';
      case '04n.png':
        return 'assets/animations/clouds-animation.json';
      case '09n.png':
        return 'assets/animations/raining-animation.json';
      case '10n.png':
        return 'assets/animations/raining-animation.json';
      case '11n.png':
        return 'assets/animations/storm-animation.json';
      case '13n.png':
        return 'assets/animations/snowing-animation.json';
      case '50n.png':
        return 'assets/animations/snowing-animation.json';
      default:
        return 'assets/animations/clouds-animation.json';
    }
  }
}
