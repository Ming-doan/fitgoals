class AppAssets {
  static const String _iconsPath = 'assets/icons/';
  static const String _imagesPath = 'assets/images/';

  static const icons = _IconAssets();
  static const images = _ImageAssets();
}

class _IconAssets {
  const _IconAssets();

  // Navbar icon
  String get home => '${AppAssets._iconsPath}home.svg';
  String get fitness => '${AppAssets._iconsPath}fitness.svg';
  String get meal => '${AppAssets._iconsPath}meal.svg';
  String get supplement => '${AppAssets._iconsPath}supplement.svg';
  String get user => '${AppAssets._iconsPath}user.svg';

  // Active icon
  String get homeActive => '${AppAssets._iconsPath}home_active.svg';
  String get fitnessActive => '${AppAssets._iconsPath}fitness_active.svg';
  String get mealActive => '${AppAssets._iconsPath}meal_active.svg';
  String get supplementActive => '${AppAssets._iconsPath}supplement_active.svg';
  String get userActive => '${AppAssets._iconsPath}user_active.svg';

  // Calories icon
  String get arrowUp => '${AppAssets._iconsPath}arrow_up.svg';
  String get arrowDown => '${AppAssets._iconsPath}arrow_down.svg';
}

class _ImageAssets {
  const _ImageAssets();

  // Logo
  String get logo => '${AppAssets._imagesPath}logo.svg';
}
