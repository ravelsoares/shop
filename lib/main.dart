import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/auth.dart';
import 'package:shop/models/cart.dart';
import 'package:shop/models/order_list.dart';
import 'package:shop/models/product_list.dart';
import 'package:shop/screens/auth_screen.dart';
import 'package:shop/screens/cart_screen.dart';
import 'package:shop/screens/orders_screen.dart';
import 'package:shop/screens/product_detail_screen.dart';
import 'package:shop/screens/product_form_page.dart';
import 'package:shop/screens/products_overview_screen.dart';
import 'package:shop/screens/products_screen.dart';
import 'package:shop/utils/app_routes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

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
        ChangeNotifierProvider(
          create: (_) => OrderList(),
        ),
        ChangeNotifierProvider(
          create: (_) => Auth(),
        ),
      ],
      child: MaterialApp(
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate
        ],
        supportedLocales: const [Locale('pt', 'BR')],
        title: 'Shop',
        theme: ThemeData(fontFamily: 'Lato').copyWith(
          primaryColor: Colors.purple,
          colorScheme: ThemeData().colorScheme.copyWith(
                primary: Colors.purple,
                secondary: Colors.deepOrange,
              ),
          textTheme: const TextTheme(
            headline6: TextStyle(fontFamily: 'Lato'),
            headline1: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w300, color: Colors.black),
          ),
        ),
        debugShowCheckedModeBanner: false,
        routes: {
          AppRoutes.auth: (context) => const AuthScreen(),
          AppRoutes.home: (context) => const ProductsOverviewScreen(),
          AppRoutes.productDetail: (context) => const ProductDetailScreen(),
          AppRoutes.cart: (context) => const CartScreen(),
          AppRoutes.orders: (context) => const OrdersScreen(),
          AppRoutes.products: (context) => const ProductsScreen(),
          AppRoutes.productForm: (context) => const ProductFormPage(),
        },
      ),
    );
  }
}
