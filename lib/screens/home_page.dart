import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products_app/blocs/app_blocs.dart';
import 'package:products_app/blocs/app_events.dart';
import 'package:products_app/blocs/app_states.dart';
import 'package:products_app/repos/repositories.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
            return Container();
          },
        ),
      ),
    );
  }
}