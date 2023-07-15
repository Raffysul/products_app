import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';

@immutable
abstract class ProductState extends Equatable {}

class ProductLoadingState extends ProductState {
  @override
  List<Object?> get props => [];
}