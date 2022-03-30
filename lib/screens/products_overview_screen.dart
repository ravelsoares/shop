import 'package:flutter/material.dart';
import '../components/product_grid.dart';

enum FilterOptions { favorite, all }

class ProductsOverviewScreen extends StatefulWidget {
  const ProductsOverviewScreen({Key? key}) : super(key: key);

  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  bool showfavoriteOnly = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Minha Loja',
          style: Theme.of(context).textTheme.headline6,
        ),
        actions: [
          PopupMenuButton(
            itemBuilder: (_) {
              return const [
                PopupMenuItem(
                  child: Text('Somente Favoritos'),
                  value: FilterOptions.favorite,
                ),
                PopupMenuItem(
                  child: Text('Todos'),
                  value: FilterOptions.all,
                ),
              ];
            },
            onSelected: (FilterOptions selectedValue) {
              switch (selectedValue) {
                case FilterOptions.favorite:
                  setState(() {
                    showfavoriteOnly = true;
                  });
                  break;
                case FilterOptions.all:
                  setState(() {
                    showfavoriteOnly = false;
                  });
                  break;
              }
            },
          ),
        ],
      ),
      body: ProductGrid(showfavoriteOnly),
    );
  }
}
