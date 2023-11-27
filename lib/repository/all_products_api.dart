import 'dart:convert';

import 'package:http/http.dart' as http;

import '../modal/all_products.dart';
class AllProductsApi{
  static Future<ProductData> getFromApi() async{
    String _apiLink="https://uol-v-2.hostprohub.com/api/get-products?platform=web";
    Uri url = Uri.parse(_apiLink);
    var response = await http.get(url);
    final productData = productDataFromJson(response.body);
    return productData;
  }
  static Future<ProductData>  apiData() async {
    ProductData data= await AllProductsApi.getFromApi();
    return data;
  }
}