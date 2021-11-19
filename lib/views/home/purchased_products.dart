import 'package:flutter/material.dart';
import 'package:qonversion_flutter/qonversion_flutter.dart';
import 'package:qonversion_tutorial_app/bloc/qonversion_service.dart';

class PurchasedProducts extends StatelessWidget {
  final QonversionService service;

  PurchasedProducts({required this.service, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Bought Products"),
        Expanded(
            child: FutureBuilder<List<QProduct>>(
          future: this.service.getPurchasedProducts(),
          builder: (context, snapshot) {
            if (snapshot.hasError) return Text(snapshot.error.toString());
            if (snapshot.hasData) {
              return ListView.builder(
                itemBuilder: (context, index) => ListTile(
                  title: Text(snapshot.data
                          ?.elementAt(index)
                          .skProduct
                          ?.localizedTitle ??
                      ""),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
                itemCount: snapshot.data?.length,
              );
            }
            return Center(child: CircularProgressIndicator());
          },
        ))
      ],
    );
  }
}
