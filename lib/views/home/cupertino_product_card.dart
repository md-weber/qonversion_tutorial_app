import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qonversion_flutter/qonversion_flutter.dart';

class CupertinoProductCard extends StatelessWidget {
  final QProduct product;
  final VoidCallback handlePurchase;

  CupertinoProductCard(this.product, {required this.handlePurchase, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Text(
            product.skProduct?.localizedTitle ?? "No title to show",
          ),
          CupertinoButton(
            child: Text("Buy me for ${product.skProduct?.price}"),
            onPressed: this.handlePurchase,
          )
        ],
      ),
    );
  }
}
