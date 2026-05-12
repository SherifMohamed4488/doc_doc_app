class AppRegex {
  // Email Regex
  static final RegExp emailRegex = RegExp(
    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
  );

  // Password Regex
  // At least:
  // 1 uppercase
  // 1 lowercase
  // 1 number
  // 1 special character
  // Min 8 chars
  static final RegExp passwordRegex = RegExp(
    r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$',
  );

  // Validation Methods
  static bool isEmailValid(String email) {
    return emailRegex.hasMatch(email);
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