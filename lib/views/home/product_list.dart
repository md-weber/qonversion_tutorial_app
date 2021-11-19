import 'dart:io';

import 'package:flutter/material.dart';
import 'package:qonversion_flutter/qonversion_flutter.dart';
import 'package:qonversion_tutorial_app/bloc/qonversion_service.dart';
import 'package:qonversion_tutorial_app/views/home/android_product_card.dart';
import 'package:qonversion_tutorial_app/views/home/cupertino_product_card.dart';

class ProductList extends StatelessWidget {
  final QonversionService service;

  ProductList({required this.service, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<QProduct>>(
      future: this.service.getProducts(),
      builder: (context, snapshot) {
        List<QProduct>? products;

        if (snapshot.hasData) {
          products = snapshot.data;
          if (products == null) return Text("No products where found");
          return GridView.builder(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (context, index) {
              QProduct product = products![index];
              var handlePurchase = () => this.service.purchaseProduct(product);
              return Platform.isIOS
                  ? CupertinoProductCard(
                      product,
                      handlePurchase: handlePurchase,
                    )
                  : ProductCard(
                      product,
                      handlePurchase: handlePurchase,
                    );
            },
            itemCount: products.length,
          );
        }

        if (snapshot.hasError)
          return Text("Something went wrong, please try again later");
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
