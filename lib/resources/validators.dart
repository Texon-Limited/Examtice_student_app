class MyCustomValidator {
  static String? validateIsEmpty(value, type) {
    if (value.isEmpty && type == 'userID') {
      return 'Please type your user ID here';
    }

    return null;
  }

  static String? validateMultiLine(value) {
    if (value.isEmpty) {
      return 'Please type something here';
    }

    return null;
  }

  static String? validateEmail(value) {
    bool valid = RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(value);
    if (!valid == true) {
      return 'invalid email,should be your@email.com';
    }
    return null;
  }

  static String? phoneNumberValidation(value,) {
    if (value.length > 10) {
      return 'Please enter a valid number. Must be 10 digit!';
    }
    return null;
  }

  static String? passwordValidation(value) {
    if (value.length < 11) {
      return 'password length must be at least 11!';
    }
    return null;
  }
}
