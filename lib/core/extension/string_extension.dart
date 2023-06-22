import '../constants/app_constants.dart';

extension StringLocalization on String {
 String? isValidPassword() {
    if (contains(RegExp(ApplicationConstants.PASSWORD_REGEX))) {
      return null;
    } else if (isEmpty) {
      return "Please Fill This Area.";
    } else {
      return 'Şifreniz en az 8, en fazla 16 karakterden oluşmalı ve en az 1 adet büyük harf, en az 1 adet küçük harf ile en az 1 adet rakam içermelidir.';
    }
  }


  String? isValidEmail() {
    if (trim().contains(RegExp(ApplicationConstants.EMAIL_REGEX))) {
      return null;
    } else if (isEmpty) {
      return "Lütfen bu alanı doldurun.";
    } else {
      return 'Lütfen geçerli bir e-posta adresi giriniz.';
    }
  }
}
