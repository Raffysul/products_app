import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import '../models/products_model.dart';
//import 'package:flutter/material.dart';

@immutable
abstract class ProductState extends Equatable {}

// data loading state
class ProductLoadingState extends ProductState {
  @override
  List<Object?> get props => [];
}

// when data has loaded
class ProductLoadedState extends ProductState {
  ProductLoadedState(this.products);
  final List<ProductModel> products;
  @override
  List<Object?> get props => [products];
}

// when there is error in data
class ProductErrorState extends ProductState {
  ProductErrorState(this.error);
  final String error;
  @override
  List<Object?> get props => [error];
}
