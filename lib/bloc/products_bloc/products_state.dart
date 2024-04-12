part of 'products_bloc.dart';

sealed class ProductsState extends Equatable {
  const ProductsState();

  @override
  List<Object> get props => [];
}

final class ProductsInitial extends ProductsState {
  const ProductsInitial();
}

final class ProductsLoading extends ProductsState {
  const ProductsLoading();
}

final class ProductsLoaded extends ProductsState {
  final List<ProductModel> products;

  const ProductsLoaded(this.products);

  @override
  List<Object> get props => [products];
}

final class ProductsError extends ProductsState {
  final String message;

  const ProductsError({required this.message});

  @override
  List<Object> get props => [message];
}
