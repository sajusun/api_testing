import 'package:api_testing/widget/bd_wash_product_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/image.dart' as image;
import 'package:gap/gap.dart';
import '../modal/all_products.dart';
import '../repository/all_products_api.dart';
import 'bosssend_categories.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            OutlinedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>BdWashProductList()));
            }, child: Text("BdWash Product List")),
            OutlinedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>bsCategoriesUi()));

            }, child: Text("Bosssend Product Categories")),

          ],
        ),
      ),
    );
  }

}
