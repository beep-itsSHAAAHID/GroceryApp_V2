import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' as flutter;
import 'package:get/get.dart';
import 'package:grocery_app_2022/controller/search_controller.dart';
import 'package:grocery_app_2022/screens/user/product/product_card.dart';

import '../../../styles/styles.dart';

class SearchProduct extends flutter.StatelessWidget {
  final SearchController searchController = Get.find();

  SearchProduct({Key? key}) : super(key: key);

  @override
  Widget build(flutter.BuildContext context) {
    return flutter.Scaffold(
      body: GetBuilder<SearchController>(
        builder: (_) => flutter.Padding(
          padding: const flutter.EdgeInsets.all(20),
          child: searchController.products.isNotEmpty
              ? flutter.GridView.count(
            shrinkWrap: true,
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            childAspectRatio: 1 / 1.3,
            children: List.generate(
              searchController.products.length,
                  (index) {
                return ProductCard(
                  product: searchController.products[index],
                );
              },
            ),
          )
              : flutter.Center(
            child: flutter.Text('No Products', style: Styles.headLineStyle3),
          ),
        ),
      ),
    );
  }
}
