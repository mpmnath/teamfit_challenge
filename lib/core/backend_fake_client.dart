import 'dart:convert';
import 'package:dashboard_delight/core/fake_result.dart';
import 'package:dashboard_delight/core/fake_result_error.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:math';

// A fake client to fetch data from a fake backend
class BackendFakeClient {
  Future<FakeResult> fetchData() async {
    bool result = _randomBoolWithRate(0.1);
    await Future.delayed(const Duration(seconds: 1));
    if (result) {
      String jsonString = await rootBundle.loadString('assets/result.json');
      final jsonResult = json.decode(jsonString);
      return FakeResult.fromJson(jsonResult);
    } else {
      throw FakeResultError(message: "Error Occured!");
    }
  }

  bool _randomBoolWithRate(double rateOfFalse) {
    // Create a random number generator
    final random = Random();
    // Generate a random double between 0.0 (inclusive) and 1.0 (exclusive)
    double randomValue = random.nextDouble();
    // Return false if the generated value is less than rateOfFalse
    return randomValue >= rateOfFalse;
  }
}
