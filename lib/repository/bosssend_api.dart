import 'dart:convert';

import 'package:api_testing/modal/bdwash_service.dart';
import 'package:api_testing/modal/bossend_categories.dart';
import 'package:api_testing/modal/product_by_categories.dart';
import 'package:http/http.dart' as http;

class BosssendApi{
  // BdWashService
  static Future<BdWashService> bdWashData() async{
    String apiLink="https://wash.bssgroupbd.com/public/api/all-services/with-all-products";
    Uri url = Uri.parse(apiLink);
    var response = await http.get(url);
    final productData = bdWashServiceFromJson(response.body);
    return productData;
  }
  // BossendCategories
  static Future<BossendCategories> getCategories() async{
    String apiLink="https://admin.bosssend.com/api/categories";
    Uri url = Uri.parse(apiLink);
    var response = await http.get(url);
    final productData = bossendCategoriesFromJson(response.body);
    return productData;
  }
  // send data to ProductsByCategories modal
  static Future<ProductsByCategories?> getProducts(int id) async{
    String apiLink="https://admin.bosssend.com/api/products/under-category/$id";
    Uri url = Uri.parse(apiLink);
    var response = await http.get(url);
    var rr = jsonDecode(response.body);
    if(rr['success']){
      return productsByCategoriesFromJson(response.body);
    }else{
      return null;
    }

  }

}