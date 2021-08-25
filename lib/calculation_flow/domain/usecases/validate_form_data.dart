class ValidateFormData {
  bool call(List params) {
    return !params.contains(null);
  }
}
