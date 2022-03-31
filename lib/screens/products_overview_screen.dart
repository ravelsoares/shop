import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/components/badge.dart';
import 'package:shop/utils/app_routes.dart';
import '../components/product_grid.dart';
import '../models/cart.dart';

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
          Consumer<Cart>(
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.cart);
              },
              icon: const Icon(Icons.shopping_cart),
            ),
            builder: (context, cart, child) => Badge(
              value: cart.itemsCount.toString(),
              child: child!,
            ),
          )
        ],
      ),
      body: ProductGrid(showfavoriteOnly),
    );
  }
}
