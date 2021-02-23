import 'package:fluttertoast/fluttertoast.dart';

class ShowToast {
  ShowToast(String message) {
    Fluttertoast.showToast(
        msg: message, toastLength: Toast.LENGTH_SHORT, timeInSecForIosWeb: 2);
  }
}
