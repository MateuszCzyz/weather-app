class ImageUtils {
  static String convertApiImageTypeToAssetPath(String imageType) {
    switch (imageType) {
      case '01d':
        return 'assets/images/sun.png';
      case '02d.png':
        return 'assets/images/sun-clouds.png';
      case '03d':
        return 'assets/images/clouds.png';
      case '04d':
        return 'assets/images/clouds.png';
      case '09d':
        return 'assets/images/raining.png';
      case '10d':
        return 'assets/images/raining.png';
      case '11d':
        return 'assets/images/storm.png';
      case '13d':
        return 'assets/images/snowing.png';
      case '50d':
        return 'assets/images/snowing.png';
      case '01n':
        return 'assets/images/sun.png';
      case '02n':
        return 'assets/images/sun-clouds.png';
      case '03n':
        return 'assets/images/clouds.png';
      case '04n':
        return 'assets/images/clouds.png';
      case '09n':
        return 'assets/images/raining.png';
      case '10n':
        return 'assets/images/raining.png';
      case '11n':
        return 'assets/images/storm.png';
      case '13n':
        return 'assets/images/snowing.png';
      case '50n':
        return 'assets/images/snowing.png';
      default:
        return 'assets/images/clouds.png';
    }
  }
}
