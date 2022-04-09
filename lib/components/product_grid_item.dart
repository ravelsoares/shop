import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/product.dart';
import 'package:shop/utils/app_routes.dart';

import '../models/cart.dart';

class ProductGridItem extends StatelessWidget {
  const ProductGridItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final secondaryColor = Theme.of(context).colorScheme.secondary;

    final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
          onTap: () {
            Navigator.of(context)
                .pushNamed(AppRoutes.productDetail, arguments: product);
          },
        ),
        footer: GridTileBar(
          title: FittedBox(
            child: Text(
              product.name,
              style: Theme.of(context).textTheme.headline6,
              textAlign: TextAlign.center,
            ),
          ),
          backgroundColor: Colors.black87,
          leading: Consumer<Product>(builder: (context, product, _) {
            return IconButton(
              onPressed: () {
                product.toggleFavorite();
              },
              icon: Icon(
                product.isFavorite ? Icons.favorite : Icons.favorite_border,
                color: secondaryColor,
              ),
            );
          }),
          trailing: IconButton(
            icon: Icon(
              Icons.shopping_cart,
              color: secondaryColor,
            ),
            onPressed: () {
              cart.addItem(product);
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text('Produto adicionado com sucesso!'),
                  duration: const Duration(seconds: 1),
                  action: SnackBarAction(
                    label: 'DESFAZER',
                    onPressed: () {
                      Provider.of<Cart>(context, listen: false)
                          .removeSingleItem(product.id);
                    },
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
