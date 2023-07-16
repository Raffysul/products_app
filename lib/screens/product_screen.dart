import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products_app/blocs/app_blocs.dart';
import 'package:products_app/blocs/app_events.dart';
import 'package:products_app/blocs/app_states.dart';
import 'package:products_app/repos/repositories.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductBloc(
        RepositoryProvider.of<ProductRepository>(context),
      )..add(LoadProductEvent()),
      child: Scaffold(
        body: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            if (state is ProductLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is ProductLoadedState) {
              return Scaffold(
                backgroundColor: const Color(0xFFF2F2F2),
                body: ListView.builder(
                    padding: const EdgeInsets.all(24),
                    scrollDirection: Axis.horizontal,
                    itemCount: state.products.length,
                    itemBuilder: (context, index) {
                      final myProduct = state.products[index];
                      return Stack(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(15.0),
                            width: 230,
                            height: 260,
                            decoration: BoxDecoration(
                              color: const Color(0xFFffffff),
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            child: const Text(
                              'Cubana Sneakers',
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF000000)),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topCenter,
                            child: Container(
                              margin: EdgeInsets.only(left: 40),
                              alignment: Alignment.topCenter,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Image.network(myProduct.imageUrl[0],
                                )
                              ),
                            ),
                          ),
                        ],
                      );
                    }),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}

