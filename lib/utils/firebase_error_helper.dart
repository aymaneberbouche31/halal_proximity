import 'package:tr_extension/tr_extension.dart';

class FirebaseErrorHelper {
  static String getErrorMessage(String errorCode) {
    print('Locale courante : ${TrDelegate.instance.locale}');
    final translatedError = errorCode.tr;
    return translatedError == errorCode ? 'default-error'.tr : translatedError;
  }
}