class Validation {
  static String passwordValidation(String value) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = new RegExp(pattern);
    if (value.isEmpty) {
      return "Value must be not empty";
    } else if (!regExp.hasMatch(value)) {
      return "Password must be combine numbers - upper and lowercase letters";
    }
    return null;
  }

  static isValidPhoneNumber(value) {
    if (value == null || value.isEmpty) {
      print("empply");
      return "Phone Number must be not empty";
    }
  }

  static isEmptyValidation(value) {
    if (value.isEmpty) {
      return "Value must be not empty";
    }
  }

  static String confirmPasswordValidation(value, password) {
    if (value.isEmpty) {
      return "Value must be not empty";
    }
    if (value != password) {
      return "Your password not matched with confirm password";
    }
    return null;
  }

  static String email(String value) {
    final RegExp urlExp = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (value.isEmpty) {
      return "Value must be not empty";
    } else if (!urlExp.hasMatch(value)) {
      return "Your email not valid";
    }
    return null;
  }

  static String userNameValidation(String value) {
    if (value.isEmpty) {
      return "Your password not matched with confirm password";
    }
    if (value.length < 5) {
      return "Password must be more than 5 charachter";
    }
    return null;
  }
}
