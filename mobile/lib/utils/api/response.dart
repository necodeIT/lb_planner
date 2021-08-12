class Response<T> {
  Response({this.errorMessage = "", T? value}) {
    this.value = value;
    isError = errorMessage.isNotEmpty || value == null;
  }

  String errorMessage;
  late bool isError;
  late T? value;
}
