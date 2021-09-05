class ApiResponse<T> {
  ApiResponse.success(this.value) {
    errorMessage = "";
    isError = false;
    wasSuccessful = true;
  }

  ApiResponse.error(this.errorMessage) {
    isError = true;
    wasSuccessful = false;
  }

  late final String errorMessage;
  late final bool isError;
  late final bool wasSuccessful;
  late final T value;
}
