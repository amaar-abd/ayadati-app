class CustomException implements Exception {
  final String message;

  CustomException({required this.message});
  @override
  String toString() {
    return message;
  }
}

class ServerException extends CustomException {
  ServerException({required super.message});
}
