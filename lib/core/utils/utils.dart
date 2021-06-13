class Utils {
  static bool isEmail(String email) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = new RegExp(p);

    return regExp.hasMatch(email);
  }

  static bool isNumeric(String s) {
    if (s == null) {
      return false;
    }
    return double.parse(s, (e) => null) != null;
  }

  static String getFormattedDate(DateTime date) {
    return "${twoDigitInt(date.day)}/${Utils.twoDigitInt(date.month)}/${date.year}";
  }

  static String twoDigitInt(int number) {
    return number.toString().padLeft(2, '0');
  }

  static String getCurrencyFormat(double amount) {
    return "AED $amount";
  }
}
