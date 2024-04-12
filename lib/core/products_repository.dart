import 'package:dashboard_delight/core/backend_fake_client.dart';
import 'package:dashboard_delight/core/fake_result.dart';

// Repository to manage the products data
class ProductsRepository {
  final BackendFakeClient client;

  ProductsRepository({required this.client});

  Future<FakeResult> fetchData() async {
    return await client.fetchData();
  }
}
