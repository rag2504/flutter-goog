class Validations {
  static String? validateEmail(String? email) {
    if (email == null || email.isEmpty) return 'Email is required';
    if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$').hasMatch(email)) {
      return 'Enter a valid email';
    }
    return null;
  }

  static String? validatePassword(String? password) {
    if (password == null || password.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  static String? validateMobile(String? mobile) {
    if (mobile == null || mobile.length != 10) return 'Enter a valid 10-digit mobile number';
    return null;
  }
}
