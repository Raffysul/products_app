import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products_app/blocs/product_events.dart';
import 'package:products_app/blocs/product_states.dart';


class ProductBloc extends Bloc<ProductEvent, ProductState>{
  ProductBloc(): super(ProductState()){
    on<LoadProduct>(_fetchProducts);
  }

  Future<void> _fetchProducts(LoadProduct loadProduct, Emitter emit) async{
    var listOfProducts= await state.getProduct();
    var newState = ProductState(listOfProducts: listOfProducts);

    emit(newState);
  }
}