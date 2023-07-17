import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:products_app/blocs/app_blocs.dart';
import 'package:products_app/repos/repositories.dart';
import 'package:products_app/screens/bottom_nav.dart';
import 'package:products_app/screens/bottom_nav_screens/favorite_page.dart';
import 'package:products_app/screens/bottom_nav_screens/profile_page.dart';
import 'package:products_app/screens/bottom_nav_screens/settings_page.dart';
import 'package:products_app/screens/bottom_nav_screens/user_page.dart';
import 'package:products_app/screens/home_page.dart';
import 'package:products_app/screens/product_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
        primarySwatch: Colors.deepOrange,
      ),
      home: BlocProvider(
        create: (_) => ProductBloc(),
        child: const HomePage(),
      ),
      routes: {
        '/favorite': (_) => FavoritePage(),
        '/profile': (_) => ProfilePage(),
        '/settings': (_) => SettingsPage(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/products') {
          return MaterialPageRoute(
              builder: (_) => BlocProvider(
                    create: (_) => ProductBloc(),
                    child: UserPage(),
                  ));
        }
        return null;
      },
    );
  }
}
