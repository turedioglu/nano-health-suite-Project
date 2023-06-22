class ValidatorManager {
  static var defaultEmptyCheckValidator = (value) {
    if (value == null || value.isEmpty) {
      return 'Fill Required';
    }
    return null;
  };
}
