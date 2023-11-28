import 'package:api_testing/modal/bdwash_service.dart';
import 'package:api_testing/modal/bossend_categories.dart';
import 'package:http/http.dart' as http;
import '../modal/all_products.dart';


class AllProductsApi{
  static Future<ProductData> getFromApi() async{
    String apiLink="https://uol-v-2.hostprohub.com/api/get-products?platform=web";
    Uri url = Uri.parse(apiLink);
    var response = await http.get(url);
    final productData = productDataFromJson(response.body);
    return productData;
  }
  // static Future<ProductData>  apiData() async {
  //   ProductData data= await AllProductsApi.getFromApi();
  //   return data;
  // }
  // BdWashService
  static Future<BdWashService> bdWashData() async{
    String apiLink="https://wash.bssgroupbd.com/public/api/all-services/with-all-products";
    Uri url = Uri.parse(apiLink);
    var response = await http.get(url);
    final productData = bdWashServiceFromJson(response.body);
    return productData;
  }
}