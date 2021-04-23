class PersonValidationMixin {
  String validateName(String value) {
    if (value.length < 2) {
      return "At least 2 characters";
    }
  }
  String validateTitle(String value) {
    var title = int.parse(value);
    if (title < 0) {
      return "Can't be less than zero";
    }
  }
  String validateSurname(String value) {
    if (value.length < 2) {
      return "At least 2 characters";
    }
  }
}
