import 'package:flutter/material.dart';
import 'package:shop/components/app_drawer.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gerenciar Produtos'),
      ),
      drawer: const AppDrawer(),
    );
  }
}
