class Response<T> {
  Response({this.errorMessage = "", T? value}) {
    this.value = value;
    isError = errorMessage.isEmpty || value == null;
  }

  String errorMessage;
  late bool isError;
  late T? value;
}
