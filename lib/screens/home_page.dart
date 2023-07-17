import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products_app/screens/bottom_nav.dart';

import '../blocs/app_blocs.dart';
import '../blocs/app_events.dart';
import '../blocs/app_states.dart';
import '../repos/repositories.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //List myImages = ['assets/images/ToyFace1.png', 'assets/images/ToyFace2.png'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFF4B3A),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }else if (state is ProductLoadedState) {
            //List<ProductModel> productList = state.products;
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _logo(),
                  _headerText(),
                  _headerImages(),
                  _startButton(),
                ],
              ),
            );
          }

          return Container();
        },
      ),

    );
  }

  // insert app logo
  Widget _logo() {
    return Container(
      margin: const EdgeInsets.only(top: 50, left: 30),
      child: Column(
        children: const [
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 25,
            child: Icon(
              Icons.shopping_cart_outlined,
              color: Color(0xFFFF4B3A),
              size: 30,
            ),
          ),
        ],
      ),
    );
  }

  // insert header text
  Widget _headerText() {
    return Container(
      margin: const EdgeInsets.all(12),
      child: Column(
        children: const [
          Text(
            'Shop here for all your products',
            style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w800,
                color: Color(0xFFFFFFFF)),
          ),
        ],
      ),
    );
  }

// insert background images
  Widget _headerImages() {
    return Row(
      children: [
        Expanded(
          child: Stack(
            children: [
              Positioned(
                right: 0,
                bottom: 0,
                child: Image.asset(
                  'assets/images/ToyFace2.png',
                  height: 300,
                  width: 300,
                  //fit: BoxFit.cover,
                ),
              ),
              Align(
                widthFactor: 0.7,
                child: Image.asset(
                  'assets/images/ToyFace1.png',
                  height: 350,
                  width: 350,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // insert Start Button
  Widget _startButton() {
    return Container(
      margin: const EdgeInsets.only(top: 60),
      child: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const ProductPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                shape: const StadiumBorder(),
                backgroundColor: const Color(0xFFFFFFFF),
                padding:
                    const EdgeInsets.symmetric(horizontal: 100, vertical: 25),
              ),
              child: const Text(
                'Get Started',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFFFF460A),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
