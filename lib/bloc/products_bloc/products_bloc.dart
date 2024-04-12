import 'package:bloc/bloc.dart';
import 'package:dashboard_delight/core/products_repository.dart';
import 'package:dashboard_delight/models/product_model.dart';
import 'package:equatable/equatable.dart';

part 'products_event.dart';
part 'products_state.dart';

// Bloc to manage the state of the products
class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ProductsRepository productsRepository;
  ProductsBloc({required this.productsRepository})
      : super(const ProductsInitial()) {
    on<ProductsEvent>((event, emit) async {
      try {
        emit(const ProductsLoading());
        final result = await productsRepository.fetchData();
        emit(ProductsLoaded(result.products));
      } catch (e) {
        emit(const ProductsError(
            message: "Error Occured! Please try again later."));
      }
    });
  }
}
