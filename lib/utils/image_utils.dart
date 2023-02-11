class ImageUtils {
  static String convertApiImageTypeToAssetPath(String imageType) {
    switch (imageType) {
      case '01d.png':
        return 'assets/images/sun.png';
      case '02d.png':
        return 'assets/images/sun-clouds.png';
      case '03d.png':
        return 'assets/images/clouds.png';
      case '04d.png':
        return 'assets/images/clouds.png';
      case '09d.png':
        return 'assets/images/raining.png';
      case '10d.png':
        return 'assets/images/raining.png';
      case '11d.png':
        return 'assets/images/storm.png';
      case '13d.png':
        return 'assets/images/snowing.png';
      case '50d.png':
        return 'assets/images/snowing.png';
      case '01n.png':
        return 'assets/images/sun.png';
      case '02n.png':
        return 'assets/images/sun-clouds.png';
      case '03n.png':
        return 'assets/images/clouds.png';
      case '04n.png':
        return 'assets/images/clouds.png';
      case '09n.png':
        return 'assets/images/raining.png';
      case '10n.png':
        return 'assets/images/raining.png';
      case '11n.png':
        return 'assets/images/storm.png';
      case '13n.png':
        return 'assets/images/snowing.png';
      case '50n.png':
        return 'assets/images/snowing.png';
      default:
        return 'assets/images/clouds.png';
    }
  }
}
