import 'package:flutter/material.dart';
import 'package:qonversion_flutter/qonversion_flutter.dart';

class ProductCard extends StatelessWidget {
  final QProduct product;
  final VoidCallback handlePurchase;

  ProductCard(
    this.product, {
    required this.handlePurchase,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Text(
            product.skuDetails?.title ?? "No title to show",
          ),
          ElevatedButton(
            child: Text("More information"),
            onPressed: () {
              showDialog(
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text(product.skuDetails?.title ?? "No title"),
                      content: Text(
                          product.skuDetails?.description ?? "No description"),
                      actions: [
                        TextButton(
                          child: Text("Close"),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        TextButton(
                          child: Text(
                            "Buy me for ${product.skuDetails?.price} ${product.skuDetails?.priceCurrencyCode}",
                          ),
                          onPressed: this.handlePurchase,
                        )
                      ],
                    );
                  },
                  context: context);
            },
          )
        ],
      ),
    );
  }
}
