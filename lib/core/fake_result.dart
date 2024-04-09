class FakeResult {
  final String body;
  final int statusCode;
  final String? errorMessage;

  FakeResult({required this.body, required this.statusCode,this.errorMessage});
}
