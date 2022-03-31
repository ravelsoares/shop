import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/cart.dart';
import 'package:shop/models/cart_item.dart';
import 'package:shop/models/product_list.dart';
import 'package:shop/screens/cart_screen.dart';
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ProductList(),
        ),
        ChangeNotifierProvider(
          create: (_) => Cart(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData().copyWith(
          primaryColor: Colors.purple,
          colorScheme: ThemeData().colorScheme.copyWith(
                primary: Colors.purple,
                secondary: const Color.fromARGB(255, 253, 88, 38),
              ),
          textTheme: const TextTheme(
              headline6: TextStyle(fontFamily: 'Lato', color: Colors.white)),
        ),
        debugShowCheckedModeBanner: false,
        routes: {
          AppRoutes.home: (context) => const ProductsOverviewScreen(),
          AppRoutes.productDetail: (context) => const ProductDetailScreen(),
          AppRoutes.cart: (context) => const CartScreen(),
        },
      ),
    );
  }
}
