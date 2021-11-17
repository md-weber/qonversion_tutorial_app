import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:qonversion_flutter/qonversion_flutter.dart';
import 'package:qonversion_tutorial_app/bloc/qonversion_service.dart';
import 'package:qonversion_tutorial_app/views/home/android_product_card.dart';
import 'package:qonversion_tutorial_app/views/home/cupertino_product_card.dart';

class HomePage extends StatelessWidget {
  final QonversionService _service = QonversionService();

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flutter Explained - Products")),
      body: FutureBuilder<List<QProduct>>(
        future: _service.getProducts(),
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
                JsonEncoder encoder = new JsonEncoder.withIndent('  ');
                String prettyprint = encoder.convert(product.toJson());
                print(prettyprint);
                return Platform.isIOS
                    ? CupertinoProductCard(product,
                        handlePurchase: () => _service.purchaseProduct(product))
                    : ProductCard(product,
                        handlePurchase: () =>
                            _service.purchaseProduct(product));
              },
              itemCount: products.length,
            );
          }

          if (snapshot.hasError)
            return Text("Something went wrong, please try again later");
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
