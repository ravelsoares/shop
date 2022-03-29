import 'package:flutter/material.dart';
import '../components/product_grid.dart';

class ProductsOverviewScreen extends StatelessWidget {
  const ProductsOverviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Minha Loja',
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      body: const ProductGrid(),
    );
  }
}
