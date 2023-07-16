import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products_app/blocs/app_blocs.dart';
import 'package:products_app/blocs/app_events.dart';
import 'package:products_app/blocs/app_states.dart';
import 'package:products_app/repos/repositories.dart';
import 'package:products_app/screens/product_info.dart';

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
        backgroundColor: const Color(0xFFF2F2F2),
        body: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            if (state is ProductLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is ProductLoadedState) {
              return ListView.builder(
                    padding: const EdgeInsets.all(24),
                    scrollDirection: Axis.horizontal,
                    itemCount: state.products.length,
                    itemBuilder: (context, index) {
                      final myProduct = state.products[index];
                      return Stack(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(15.0),
                            width: 250,
                            height: 320,
                            decoration: BoxDecoration(
                              color: const Color(0xFFffffff),
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                          Column(
                            children: [
                              Align(
                                alignment: Alignment.topCenter,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                const ProductInfo()));
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(left: 50),
                                    alignment: Alignment.topCenter,
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(30),
                                        child: Image.network(
                                          myProduct.imageUrl[0],
                                          width: 180,
                                          height: 200,
                                        )),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 70,
                                width: 200,
                                margin: const EdgeInsets.only(left: 30),
                                child: Text(
                                  myProduct.title,
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.clip,
                                  maxLines: 2,
                                  style: const TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF000000)),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                margin: const EdgeInsets.only(left: 30),
                                child: Text(
                                  '\$${myProduct.price.toStringAsFixed(2)}',
                                  textAlign: TextAlign.center,
                                  //overflow: TextOverflow.clip,
                                  //maxLines: 4,
                                  style: const TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xFFFA4A0C)),
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    });
            }
            return Container();
          },
        ),
      ),
    );
  }
}
