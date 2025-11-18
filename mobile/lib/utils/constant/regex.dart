class Regex {
  static RegExp email = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
  static RegExp password = RegExp(r'^[a-zA-Z0-9]{6,}$');
  static RegExp fullName = RegExp(r'^[a-zA-Z\\s?]+$');

}