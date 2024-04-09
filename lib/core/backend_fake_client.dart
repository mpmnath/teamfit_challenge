import 'package:dashboard_delight/core/fake_result.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:math';

class BackendFakeClient {
  Future<FakeResult> fetchData() async {
    bool result = randomBoolWithRate(0.1);
    await Future.delayed(const Duration(seconds: 1));
    if (result) {
      String jsonString = await rootBundle.loadString('assets/result.json');
      return FakeResult(body: jsonString, statusCode: 200);
    } else {
      return FakeResult(
          body: '', statusCode: 500, errorMessage: 'Internal Server Error');
    }
  }

  bool randomBoolWithRate(double rateOfFalse) {
    // Create a random number generator
    final random = Random();
    // Generate a random double between 0.0 (inclusive) and 1.0 (exclusive)
    double randomValue = random.nextDouble();
    // Return false if the generated value is less than rateOfFalse
    return randomValue >= rateOfFalse;
  }
}
