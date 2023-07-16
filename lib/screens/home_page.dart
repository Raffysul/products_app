import 'package:flutter/material.dart';
import 'package:products_app/screens/user_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //List myImages = ['assets/images/ToyFace1.png', 'assets/images/ToyFace2.png'];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFFF4B3A),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _logo(),
              _headerText(),
              _headerImages(),
              _startButton(),
            ],
          ),
        ),
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
            radius: 30,
            child: Icon(
              Icons.shopping_cart_outlined,
              color: Color(0xFFFF4B3A),
              size: 35,
            ),
          ),
        ],
      ),
    );
  }

  // insert header text
  Widget _headerText() {
    return Container(
      margin: const EdgeInsets.all(30),
      child: Column(
        children: const [
          Text(
            'Shop here for all of your products',
            style: TextStyle(
                fontSize: 50,
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
        Stack(
          children: [
            Image.asset(
              'assets/images/ToyFace2.png',
              height: 300,
              width: 350,
            ),
            Positioned(
              top: 10,
              right: 100,
              child: Image.asset(
                'assets/images/ToyFace1.png',
                height: 300,
                width: 300,
              ),
            )
          ],
        ),
        //for (int i = 0; i < myImages.length; i++)
        //   Align(
        //     //alignment: Alignment.bottomRight,
        //     widthFactor: 1.0,
        //     heightFactor: 1.0,
        //     child: Image.asset(
        //       myImages[i],
        //       height: 300,
        //       width: 180,
        //     ),
        //   ),
        // Image.asset(
        //   'assets/images/ToyFace1.png',
        //   height: 300,
        //   width: 350,
        //   //fit: BoxFit.contain,
        // ),
        // Image.asset(
        //   'assets/images/ToyFace2.png',
        //   height: 60,
        //   width: 60,
        // ),
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
                  MaterialPageRoute(builder: (context) => const UserPage()),
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
