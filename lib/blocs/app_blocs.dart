import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products_app/blocs/app_events.dart';
import 'package:products_app/blocs/app_states.dart';
import 'package:products_app/repos/repositories.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository _productRepository;

  ProductBloc(this._productRepository) : super(ProductLoadingState()) {
    on<LoadProductEvent>((event, emit) async {
      emit(ProductLoadingState());
      try {
        final products = await _productRepository.getProducts();
        emit(ProductLoadedState(products));
      } catch (e) {
        emit(ProductErrorState(e.toString()));
      }
      //emit(ProductLoadedState());
    });
  }
}