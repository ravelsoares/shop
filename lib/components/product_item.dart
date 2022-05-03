import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/product.dart';
import 'package:shop/models/product_list.dart';
import 'package:shop/utils/app_routes.dart';

import '../exceptions/http_exception.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  const ProductItem({required this.product, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final msg = ScaffoldMessenger.of(context);
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(product.imageUrl),
      ),
      title: Text(product.name, style: const TextStyle(color: Colors.black)),
      trailing: SizedBox(
        width: 100,
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamed(AppRoutes.productForm, arguments: product);
              },
              icon: const Icon(
                Icons.edit,
                color: Colors.deepOrange,
              ),
            ),
            IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text(
                        'Dejesa excluir ?',
                        style: TextStyle(color: Colors.black),
                      ),
                      content: const Text(
                        'Se você excluir não terá como recuperar!',
                        style: TextStyle(color: Colors.black),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(false);
                          },
                          child: const Text('Cancelar'),
                        ),
                        TextButton(
                          onPressed: () async {
                            Navigator.of(context).pop(true);
                          },
                          child: const Text('Excluir'),
                        ),
                      ],
                    );
                  },
                ).then((value) async {
                  if (value ?? false) {
                    try {
                      await Provider.of<ProductList>(context, listen: false)
                          .deleteProduct(product);
                    } on HttpException catch (error) {
                      msg.showSnackBar(
                          SnackBar(content: Text(error.toString())));
                    }
                  }
                });
              },
              icon: Icon(
                Icons.delete,
                color: Theme.of(context).errorColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
