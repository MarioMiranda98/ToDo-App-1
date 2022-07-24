enum ImageModalEnum {
  success,
  warning,
  failed
}

extension ImageModalEnumExtension on ImageModalEnum {
  String get imagePath {
    switch(this) {
      case ImageModalEnum.success:
        return 'assets/warning/success_icon.png';
      case ImageModalEnum.failed:
        return 'assets/modal_assets/fail_icon.png';
      case ImageModalEnum.warning:
        return 'assets/modal_assets/warning_icon.png';
      default:
        return '';
    }
  }
}