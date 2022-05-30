import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/auth.dart';
import 'package:shop/screens/auth_screen.dart';
import 'package:shop/screens/products_overview_screen.dart';

class AuthOrHomeScreen extends StatefulWidget {
  const AuthOrHomeScreen({Key? key}) : super(key: key);

  @override
  State<AuthOrHomeScreen> createState() => _AuthOrHomeScreenState();
}

class _AuthOrHomeScreenState extends State<AuthOrHomeScreen> {
  @override
  Widget build(BuildContext context) {
    Auth auth = Provider.of(context);
    return auth.isAuth ? ProductsOverviewScreen() : AuthScreen();
  }
}
