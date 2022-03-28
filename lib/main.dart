import 'package:flutter/material.dart';
import 'package:shop/screens/product_detail_screen.dart';
import 'package:shop/screens/products_overview_screen.dart';
import 'package:shop/utils/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData().copyWith(
        primaryColor: Colors.purple,
        colorScheme: ThemeData().colorScheme.copyWith(
              primary: Colors.purple,
              secondary: Colors.deepOrange,
            ),
        textTheme: const TextTheme(
            headline6: TextStyle(fontFamily: 'Lato', color: Colors.white)),
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        AppRoutes.home:(context) => ProductsOverviewScreen(),
        AppRoutes.productDetail:(context) => const ProductDetailScreen(),
      },
    );
  }
}
