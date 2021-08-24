class ApiResponse<T> {
  ApiResponse(this.value) {
    errorMessage = "";
    isError = false;
  }

  ApiResponse.error(this.errorMessage) {
    isError = true;
  }

  late final String errorMessage;
  late final bool isError;
  late final T? value;
}
