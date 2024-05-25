class ServiceApiFail implements Exception {
  const ServiceApiFail([this.message]);

  final String? message;

  @override
  String toString() {
    String result = 'ServiceApiFail';
    if (message is String) return '$result: $message';
    return result;
  }
}