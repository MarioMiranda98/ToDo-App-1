enum ImageModalEnum {
  SUCCESS,
  WARNING,
  FAILED
}

extension ImageModalEnumExtension on ImageModalEnum {
  String get imagePath {
    switch(this) {
      case ImageModalEnum.SUCCESS:
        return 'assets/modal_assets/success_icon.png';
      case ImageModalEnum.FAILED:
        return 'assets/modal_assets/fail_icon.png';
      case ImageModalEnum.WARNING:
        return 'assets/modal_assets/warning_icon.png';
      default:
        return '';
    }
  }
}