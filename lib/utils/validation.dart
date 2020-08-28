class Validator {
  static final RegExp emailRegExp = RegExp(r"[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  static const String emailNullError = "Please enter your email";
  static const String emailInvalidError = "Please enter valid email";
  static const String passNullError = "Please enter your email";
  static const String passShortError = "Password is too short";
  static const String passMatchError = "Passwords don't match";
  static const String nameNullError = "Please enter your name";
  static const String phoneNullError = "Please enter your phone number";
  static const String addressNullError = "Please enter your address";
}
