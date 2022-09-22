import 'package:flutter/material.dart';
import '../widgets/search_product_list_item.dart';

class SearchProductList extends StatelessWidget {
  const SearchProductList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return  GridView.builder(
        gridDelegate:  const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 2 /3.25,
            crossAxisSpacing: 20,
            mainAxisSpacing: 15),
        itemCount: 20,
        itemBuilder: (BuildContext ctx, index) {
          return   const SearchProductListItem();
        });
  }
}
