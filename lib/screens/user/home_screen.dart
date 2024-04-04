import 'package:flutter/material.dart' as flutter;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/search_bar/gf_search_bar.dart';
import 'package:grocery_app_2022/controller/search_controller.dart' as mySearchController;
import 'package:grocery_app_2022/screens/user/product/all_products.dart';
import 'package:grocery_app_2022/screens/user/product/category_product.dart';
import 'package:grocery_app_2022/screens/user/product/search_product.dart';

import '../../styles/app_layout.dart';
import '../../styles/styles.dart';

class HomeScreen extends flutter.StatelessWidget {
  @override
  Widget build(flutter.BuildContext context) {
    mySearchController.SearchController searchController = Get.put(mySearchController.SearchController());
    return DefaultTabController(
      length: 6,
      child: flutter.Scaffold(
        appBar: flutter.AppBar(
          title: SearchBar(),
          bottom: flutter.TabBar(
            isScrollable: true,
            indicatorColor: Styles.orangeColor,
            indicatorSize: flutter.TabBarIndicatorSize.label,
            tabs: const [
              flutter.Tab(text: 'All'),
              flutter.Tab(text: 'Fruits'),
              flutter.Tab(text: 'Vegetables'),
              flutter.Tab(text: 'Drinks'),
              flutter.Tab(text: 'Bakery'),
              flutter.Tab(text: 'Other'),
            ],
          ),
        ),
        body: Obx(
              () => flutter.TabBarView(
            children: [
              searchController.searchText == ''
                  ? AllProducts()
                  : SearchProduct(),
              searchController.searchText == ''
                  ? CategoryProduct(category: 'Fruits')
                  : SearchProduct(),
              searchController.searchText == ''
                  ? CategoryProduct(category: 'Vegetables')
                  : SearchProduct(),
              searchController.searchText == ''
                  ? CategoryProduct(category: 'Drinks')
                  : SearchProduct(),
              searchController.searchText == ''
                  ? CategoryProduct(category: 'Bakery')
                  : SearchProduct(),
              searchController.searchText == ''
                  ? CategoryProduct(category: 'Other')
                  : SearchProduct(),
            ],
          ),
        ),
      ),
    );
  }
}


class SearchBar extends flutter.StatelessWidget {
  @override
  Widget build(flutter.BuildContext context) {
    mySearchController.SearchController searchController = Get.put(mySearchController.SearchController());
    return flutter.Container(
      margin: const flutter.EdgeInsets.symmetric(horizontal: 10),
      height: AppLayout.getHeight(40),
      decoration: flutter.BoxDecoration(
        color: flutter.Colors.white,
        borderRadius: flutter.BorderRadius.circular(10),
      ),
      child: flutter.TextField(
        onChanged: (value) => {
          searchController.searchText = value,
        },
        decoration: flutter.InputDecoration(
          border: flutter.InputBorder.none,
          hintText: 'Search...',
          prefixIcon: flutter.Padding(
            padding: const flutter.EdgeInsets.all(10),
            child: flutter.Icon(Icons.search, color: Styles.orangeColor),
          ),
        ),
      ),
    );
  }
}

