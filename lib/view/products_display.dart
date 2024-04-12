import 'package:dashboard_delight/bloc/products_bloc/products_bloc.dart';
import 'package:dashboard_delight/models/product_model.dart';
import 'package:dashboard_delight/utils/currency_formatter.dart';
import 'package:dashboard_delight/utils/image_parser.dart';
import 'package:dashboard_delight/utils/text_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Display a list of products with a refresh button in the app bar
class ProductsDisplay extends StatelessWidget {
  const ProductsDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Products'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              context.read<ProductsBloc>().add(const FetchProducts());
            },
          ),
        ],
      ),
      body: SafeArea(
        child: BlocBuilder<ProductsBloc, ProductsState>(
          builder: (context, state) {
            return switch (state) {
              ProductsInitial() => const SizedBox(),
              ProductsLoading() => const Center(
                  child: CircularProgressIndicator(),
                ),
              ProductsLoaded() => state.products.isEmpty
                  ? const SizedBox()
                  : ListView.builder(
                      itemCount: state.products.length,
                      itemBuilder: (context, index) {
                        final product = state.products[index];
                        return ProductCard(
                          product: product,
                        );
                      },
                    ),
              ProductsError() => Center(
                  child: Text(state.message),
                ),
            };
          },
        ),
      ),
    );
  }
}

// Display a product card with an image carousel
class ProductCard extends StatelessWidget {
  final ProductModel product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Column(
          children: [
            ImageCarousel(
              partnerId: product.partner.id,
              productId: product.productId,
              imageUrls: product.imageUrls,
            ),
            ListTile(
              title: Text(product.title),
              subtitle:
                  Text(TextFormatter.limitToTwoLines(product.description)),
              trailing: Text(
                CurrencyFormatter.formatToGermanCurrency(product.price.value),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Display an image carousel with images from a product model
class ImageCarousel extends StatelessWidget {
  final String partnerId;
  final String productId;
  final List<String> imageUrls;
  const ImageCarousel({
    super.key,
    required this.partnerId,
    required this.productId,
    required this.imageUrls,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: imageUrls.length,
        itemBuilder: (context, index) {
          final image = imageUrls[index];
          final imageName = image.split('.').first;
          final suffix = image.split('.').last;

          print(imageName);
          print(suffix);

          return Image.network(
            ImageParser.constructImageUrl(
              partnerId,
              productId,
              imageName,
              suffix,
            ),
            fit: BoxFit.cover,
          );
        },
      ),
    );
  }
}
