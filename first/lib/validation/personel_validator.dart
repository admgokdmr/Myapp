class PersonelValidationMixin {
  String validateAd(String value) {
    if (value.length < 2) {
      return "En az 2 karakter olmalı";
    }
  }
  String validateKidem(String value) {
    var kidem = int.parse(value);
    if (kidem < 0) {
      return "Sıfırdan küçük olamaz";
    }
  }
  String validateSoyad(String value) {
    if (value.length < 2) {
      return "En az 2 karakter olmalı";
    }
  }
}
