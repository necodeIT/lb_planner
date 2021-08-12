class Token {
  Token({required this.token, required this.privateToken});

  @override
  String toString() {
    return "{token:$token,privatetoken:$privateToken}";
  }

  final String token;
  final String privateToken;
}
