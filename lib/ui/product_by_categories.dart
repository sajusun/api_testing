import 'package:api_testing/modal/product_by_categories.dart';
import 'package:api_testing/repository/bosssend_api.dart';
import 'package:flutter/material.dart';

class ProductByCategoriesUi extends StatefulWidget {
  const ProductByCategoriesUi({required this.id});
 final int id;
  @override
  State<ProductByCategoriesUi> createState() => _ProductByCategoriesUiState();
}

class _ProductByCategoriesUiState extends State<ProductByCategoriesUi> {

  List<Datum> productData=[];
bool msg =true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }
  getData() async {
   // print("id: ${widget.id}");
    ProductsByCategories? data = await BosssendApi.getProducts(widget.id);
   if(data != null){
     productData=data.data.data;
   }else{msg = false;}
    setState(() {
    });
  }

  dataChecked(){
    if(productData.isNotEmpty){
      return Container(
        child: ListView.builder(
            itemCount: productData.length,
            itemBuilder: (context,index){
          return Text(productData[index].name);
        }),
      );
    }else if( !msg){
      return Center(child: Text("Data Not Found!"),);
    }else{
      return Center(child: CircularProgressIndicator());
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Api Test Project"),),
      body: dataChecked(),
    );
  }
}
