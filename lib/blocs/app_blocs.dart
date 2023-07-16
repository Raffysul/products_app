import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products_app/blocs/app_events.dart';
import 'package:products_app/blocs/app_states.dart';
import 'package:products_app/models/products_model.dart';
import 'package:products_app/repos/repositories.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  //final ProductRepository _productRepository;

  ProductBloc() : super(InitialState());
  @override
  Stream<ProductState> mapEventToState(ProductEvent event) async* {
    if (event is LoadProductEvent){
      yield ProductLoadingState();
      
      try {
        final response = await http.get(Uri.parse('https://api.escuelajs.co/api/v1/products'));
        final jsonData = json.decode(response.body);
        final List<dynamic> productInfo = jsonData['products'];

        final List<ProductModel> products = productInfo.map((data) => ProductModel.fromJson(data)).toList();

        yield ProductLoadedState(products);
      } catch (error) {
        yield ProductErrorState('Unable to load products.');
      }
    }
  }
    //on<LoadProductEvent>(loadProductEvent);
}
  //((event, emit) async {
  //emit(ProductLoadingState());
  // try {
  //   final products = await _productRepository.getProducts();
  //   emit(ProductLoadedState(products));
  // } catch (e) {
  //   emit(ProductErrorState(e.toString()));
  // }
  //emit(ProductLoadedState());
  // });
  // FutureOr<void> loadProductEvent(
  //     LoadProductEvent event, Emitter<ProductState> emit) async {
  //   var client = http.Client();
  //   try {
  //     var response = await client.get(
  //         Uri.https('https://api.escuelajs.co/api/v1/products'));
  //     print(response.body);
  //   } catch (e) {
  //     log(e.toString() as num);
  //   }
  // }

//this._productRepository
