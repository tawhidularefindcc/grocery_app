import 'dart:convert';
import '/modules/search_product/data/remote/product_remote_data_source.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/search_product.dart';




class ProductRemoteDataSourceImpl implements ProductRemoteDataSource{

  ProductRemoteDataSourceImpl(this.httpClient, );

  final http.Client httpClient;
  @override
  Future<List<SearchProduct>> getSearchProduct({String? query, String? offset, String? limit}) async{
    List<SearchProduct> productsList;
    final response = await httpClient.get(
      Uri.https(
        'panel.supplyline.network',
        '/api/product/search-suggestions',
        <String, String>{ 'limit':'$limit',
          'search': query.toString()},
      ),
    );

    if (response.statusCode == 200) {
      dynamic jsonResponse = json.decode(utf8.decode(response.bodyBytes));
      dynamic  searchProductData = jsonResponse["data"]["products"]["results"];
      productsList=  <SearchProduct>[];
      productsList= searchProductData.map<SearchProduct>((dynamic product) =>
          SearchProduct.fromJson(product)).toList() as List<SearchProduct>;

      return productsList;
    }
    throw Exception('error fetching posts');
  }


}