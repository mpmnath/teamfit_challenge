import 'package:dashboard_delight/bloc/products_bloc/products_bloc.dart';
import 'package:dashboard_delight/core/backend_fake_client.dart';
import 'package:dashboard_delight/core/products_repository.dart';
import 'package:dashboard_delight/view/products_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

void main() {
  // Register the ProductsRepository singleton
  final getIt = GetIt.instance;
  // Register the ProductsRepository singleton
  getIt.registerSingleton<ProductsRepository>(
    ProductsRepository(client: BackendFakeClient()),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (context) => ProductsBloc(
          productsRepository: GetIt.instance<ProductsRepository>(),
        ),
        child: const ProductsDisplay(),
      ),
    );
  }
}
