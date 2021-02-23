import 'package:gofoodie/core/services/size_config.dart';

class FontSizes {
  static double get fontSizeS {
    return SizeConfig.safeBlockHorizontal * 3;
  }

  static double get fontSizeBSM {
    return SizeConfig.safeBlockHorizontal * 3.5;
  }

  static double get fontSizeM {
    return SizeConfig.safeBlockHorizontal * 4;
  }

  static double get fontSizeL {
    return SizeConfig.safeBlockHorizontal * 5;
  }

  static double get fontSizeXL {
    return SizeConfig.safeBlockHorizontal * 6;
  }

  static double get fontSizeXXL {
    return SizeConfig.safeBlockHorizontal * 7;
  }
}
