class AppRegex {
  // Email Regex

  static final RegExp emailRegex = RegExp(
    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
  );

// Name Regex
// At least 3 characters
  static final RegExp nameRegex = RegExp(
    r'^.{3,}$',
  );

  // Egyptian Phone Number Regex
  // Valid examples:
  // 01012345678
  // 01112345678
  // 01212345678
  // 01512345678
  static final RegExp egyptPhoneRegex = RegExp(
    r'^01[0125][0-9]{8}$',
  );

  // Password Regex
  static final RegExp passwordRegex = RegExp(
    r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$',
  );

  // Validation Methods
  static bool isEmailValid(String email) {
    return emailRegex.hasMatch(email);
  }
  static bool isNameValid(String name) {
    return nameRegex.hasMatch(name.trim());
  }

  static bool isEgyptPhoneValid(String phone) {
    return egyptPhoneRegex.hasMatch(phone);
  }

  static bool isPasswordValid(String password) {
    return passwordRegex.hasMatch(password);
  }


  static bool hasLowerCase(String password) {
    return RegExp(r'[a-z]').hasMatch(password);
  }

  static bool hasUpperCase(String password) {
    return RegExp(r'[A-Z]').hasMatch(password);
  }

  static bool hasNumber(String password) {
    return RegExp(r'[0-9]').hasMatch(password);
  }

  static bool hasSpecialCharacter(String password) {
    return RegExp(r'[@$!%*?&]').hasMatch(password);
  }

  static bool hasMinLength(String password) {
    return password.length >= 8;
  }
}