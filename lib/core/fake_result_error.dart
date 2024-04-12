// FakeResultError class to handle error response from fake api
class FakeResultError implements Exception {
  final String message;

  FakeResultError({required this.message});

  factory FakeResultError.fromJson(Map<String, dynamic> json) {
    return FakeResultError(
      message: json['message'],
    );
  }

  @override
  String toString() {
    return 'FakeResultError: $message';
  }
}
